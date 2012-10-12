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

#include "llvm/Function.h"
#include "llvm/Instructions.h"
#include "llvm/Pass.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/InlineAsm.h"
#include "llvm/Type.h"
#include "llvm/ADT/SmallString.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/MC/MCAsmInfo.h"

using namespace llvm;

namespace {

class SEHPrepare : public FunctionPass {
  Instruction *stateAlloca;
  Instruction *stateInit;
  const TargetMachine *TM;

  Instruction *getRightStateAsmCode(LLVMContext &Ctx, Value *State);
  bool analyzeBlock(BasicBlock *BB);

public:
  static char ID;

  SEHPrepare(const TargetMachine *Mach) : 
    FunctionPass(ID), stateAlloca(0), stateInit(0), TM(Mach) {}

  virtual bool runOnFunction(Function &);
};

}

char SEHPrepare::ID = 0;

FunctionPass *llvm::createSEHPreparePass(const TargetMachine *TM) {
  return new SEHPrepare(TM);
}

Instruction *SEHPrepare::getRightStateAsmCode(LLVMContext &Ctx, Value *State) {
  FunctionType *fty = FunctionType::get(Type::getVoidTy(Ctx), false);

  SmallString<64> valBuff;
  raw_svector_ostream stream(valBuff);
  
  uint32_t asmdDialect = TM->getMCAsmInfo()->getAssemblerDialect();
  // See X86MCAsmInfo.cpp for more information.
  if (!asmdDialect) {
    // Should be an AT&T asm dialect.
    stream << "movl $";
    stream << cast<ConstantInt>(State)->getSExtValue();
    stream << ", -4(%ebp)";
  } else if (asmdDialect == 1) {
    // Should be an Intel asm dialect.
    stream << "mov DWORD PTR [ebp-4],";
    stream << cast<ConstantInt>(State)->getSExtValue();
  }

  stream.flush();
  StringRef command(valBuff);

  InlineAsm *ia = InlineAsm::get(fty, command, "", false);

  CallInst *result = CallInst::Create(ia);
  result->addAttribute(~0, Attribute::NoUnwind);
  result->addAttribute(~0, Attribute::IANSDialect);
  return result;
}

bool SEHPrepare::analyzeBlock(BasicBlock *BB) {
  bool modified = false;
  for (BasicBlock::iterator I = BB->begin(),
       E = BB->end(); I != E; ++I) {
    if (isa<AllocaInst>(I)) {
      // Remove state field alloca.
      MDNode *node = I->getMetadata("seh.state.alloca");
      
      if (!node) {
        continue;
      }

      // At start of function we can not delete alloca,
      // but at the end of the pass we can do this.
      // Just remember it for future.
      stateAlloca = I;
      continue;
    }

    if (!isa<StoreInst>(I)) {
      continue;
    }

    // Handle seh.state.init & seh.state.store
    // Replace with 'mov dword ptr [ebp-4],$value'
    MDNode *node = I->getMetadata("seh.state.store");
    if (!node) {
      if (I->getMetadata("seh.state.init")) {
        // Erase init.
        stateInit = I;
        modified = true;
      }
      continue;
    }
    modified = true;

    StoreInst *store = cast<StoreInst>(I);
    ReplaceInstWithInst(I->getParent()->getInstList(), I,
                        getRightStateAsmCode(BB->getParent()->getContext(),
                                             store->getOperand(0)));
  }

  return modified;
}

bool SEHPrepare::runOnFunction(Function &Fn) {
  bool wasModified = false;
  for (Function::iterator I = Fn.begin(),
       E = Fn.end(); I != E; ++I) {
    wasModified |= analyzeBlock(I);
  }

  // Remove state alloca.
  if (stateAlloca) {
    stateInit->eraseFromParent();
    stateAlloca->eraseFromParent();
    stateAlloca = 0;
    stateInit = 0;
    wasModified |= true;
  }

  return wasModified;
}
