//===---- SEHPrepare - Prepare exception handling for code generation -----===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===---------------------------------------------------------------------===//
//
// This pass mulches exception handling code into a form adapted to code
// generation. Required if using MS SEH exception handling.
//
//===----------------------------------------------------------------------===//

// r4start

#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/Pass.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/IR/Type.h"
#include "llvm/ADT/SmallString.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/MC/MCAsmInfo.h"

using namespace llvm;

namespace {

class SEHPrepare : public FunctionPass {
  const TargetMachine *TM;
  Function *fakeLpad;

public:
  static char ID;

  SEHPrepare(const TargetMachine *Mach) : 
    FunctionPass(ID), TM(Mach), fakeLpad(0) {}

  virtual bool doInitialization(Module &M);

  virtual bool runOnFunction(Function &);
};

}

char SEHPrepare::ID = 0;

FunctionPass *llvm::createSEHPreparePass(const TargetMachine *TM) {
  return new SEHPrepare(TM);
}

bool SEHPrepare::doInitialization(Module &M) {
  fakeLpad = Intrinsic::getDeclaration(&M, Intrinsic::seh_lpad_replacement);
  return true;
}

bool SEHPrepare::runOnFunction(Function &F) {
  bool wasModified = false;
  ConstantInt *conditionVar = 0;
  IntegerType *Int32Ty = llvm::IntegerType::get(F.getContext(), 32);

  for (Function::iterator BB = F.begin(), E = F.end(); BB != E; ++BB)
    if (InvokeInst *II = dyn_cast<InvokeInst>(BB->getTerminator())) {
      if (!conditionVar) {
        conditionVar = 
          ConstantInt::get(Int32Ty, 0);
      }
      SmallVector<Value*,16> CallArgs(II->op_begin(), II->op_end() - 3);
      // Insert a normal call instruction...
      CallInst *NewCall = CallInst::Create(II->getCalledValue(),
                                           CallArgs, "", II);
      NewCall->takeName(II);
      NewCall->setCallingConv(II->getCallingConv());
      NewCall->setAttributes(II->getAttributes());
      NewCall->setDebugLoc(II->getDebugLoc());
      II->replaceAllUsesWith(NewCall);

      SwitchInst *si = SwitchInst::Create(conditionVar, II->getNormalDest(), 1, II);
      si->addCase(llvm::ConstantInt::get(Int32Ty, -1), II->getUnwindDest());

      // Remove landing pad instruction.
      if (LandingPadInst *lpad = II->getUnwindDest()->getLandingPadInst()) {
        CallInst *newVal = CallInst::Create(fakeLpad, "", lpad);
        
        SwitchInst *lsi = 
          dyn_cast<SwitchInst>(II->getUnwindDest()->getTerminator());
        if (lsi) {
          lsi->setCondition(newVal);
        }
        lpad->eraseFromParent();
      }

      // Remove the invoke instruction now.
      BB->getInstList().erase(II);
      
      wasModified = true;
    } else if (ResumeInst *II = dyn_cast<ResumeInst>(BB->getTerminator())) {
      // We need to remove resume instructions from function.
      UnreachableInst *terminator = new UnreachableInst(F.getContext(), BB);
      BB->getInstList().erase(II);
      wasModified = true;
    }

  return wasModified;
}
