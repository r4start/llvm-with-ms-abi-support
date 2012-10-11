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

using namespace llvm;

namespace {

class SEHPrepare : public FunctionPass {
  Instruction *getRightStateAsmCode(LLVMContext &Ctx, Value *State);
  bool analyzeBlock(BasicBlock *BB);

public:
  static char ID;

  SEHPrepare() : FunctionPass(ID) {}

  virtual bool runOnFunction(Function &);
};

}

char SEHPrepare::ID = 0;

FunctionPass *llvm::createSEHPreparePass() {
  return new SEHPrepare();
}

Instruction *SEHPrepare::getRightStateAsmCode(LLVMContext &Ctx, Value *State) {
  FunctionType *fty = FunctionType::get(Type::getVoidTy(Ctx), false);

  SmallString<64> valBuff;
  raw_svector_ostream stream(valBuff);
  stream << "mov dword ptr [ebp-4],";
  stream << cast<ConstantInt>(State)->getSExtValue();
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
      // Handle seh.state alloca
      // Must remove it.
      continue;
    }

    if (!isa<StoreInst>(I)) {
      continue;
    }

    // Handle seh.state.init & seh.state.store
    // Replace with 'mov dword ptr [ebp-4],$value'
    MDNode *node = I->getMetadata("seh.state.store");
    if (!node) {
      node = I->getMetadata("seh.state.init");
    }

    // Not our instruction.
    if (!node) {
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
  return wasModified;
}
