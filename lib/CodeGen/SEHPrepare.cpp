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

#define DEBUG_TYPE "sehprepare"
#include "llvm/Function.h"
#include "llvm/Instructions.h"
#include "llvm/IntrinsicInst.h"
#include "llvm/Module.h"
#include "llvm/Pass.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Analysis/Dominators.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/Support/CallSite.h"
#include "llvm/Target/TargetLowering.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/SSAUpdater.h"
using namespace llvm;

STATISTIC(NumResumesLowered, "Number of resume calls lowered");

namespace {
  class SEHPrepare : public FunctionPass {
    const TargetMachine *TM;
    const TargetLowering *TLI;

    // RewindFunction - _Unwind_Resume or the target equivalent.
    Constant *RewindFunction;

    bool InsertUnwindResumeCalls(Function &Fn);
    Value *GetExceptionObject(ResumeInst *RI);

  public:
    static char ID; // Pass identification, replacement for typeid.
    SEHPrepare(const TargetMachine *tm) :
      FunctionPass(ID), TM(tm), TLI(TM->getTargetLowering()),
      RewindFunction(0) {
        initializeDominatorTreePass(*PassRegistry::getPassRegistry());
      }

    virtual bool runOnFunction(Function &Fn);

    virtual void getAnalysisUsage(AnalysisUsage &AU) const { }

    const char *getPassName() const {
      return "Exception handling preparation";
    }
  };
} // end anonymous namespace

char SEHPrepare::ID = 0;

FunctionPass *llvm::createSEHPreparePass(const TargetMachine *tm) {
  return new SEHPrepare(tm);
}

bool SEHPrepare::runOnFunction(Function &Fn) {
  return true;
}

bool SEHPrepare::InsertUnwindResumeCalls(Function &Fn) {
  return true;
}

Value *SEHPrepare::GetExceptionObject(ResumeInst *RI) {
  return 0;
}
