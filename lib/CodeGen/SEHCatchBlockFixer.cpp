//===----------- SEHCatchBlockFixer - Fix catch handlers. -----------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===---------------------------------------------------------------------===//
//
// This pass fix esp in catch handlers. 
// Required if using MS SEH exception handling.
//
//===---------------------------------------------------------------------===//

// r4start

#include "PrologEpilogInserter.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/Target/TargetFrameLowering.h"
#include "llvm/Instructions.h"
#include "llvm/Intrinsics.h"

using namespace llvm;

namespace {

  class CBF : public MachineFunctionPass {
  public:
    typedef MachineBasicBlock::iterator insert_point;

    static char ID;
    CBF() : MachineFunctionPass(ID) {
      initializeCBFPass(*PassRegistry::getPassRegistry());
    }

    bool runOnMachineFunction(MachineFunction &MF);

  private:
    insert_point getFreeInsertPoint(MachineBasicBlock &) const;
  };

}

char CBF::ID = 0;
char &llvm::CatchBlockFixerID = CBF::ID;

INITIALIZE_PASS_BEGIN(CBF, "catchblockfixer",
                "SEH catch block fixing.", false, false)
INITIALIZE_PASS_DEPENDENCY(PEI)
INITIALIZE_PASS_END(CBF, "catchblockfixer",
                    "SEH catch handler stack fixing.",
                    false, false)

bool CBF::runOnMachineFunction(MachineFunction &MF) {
  bool wasChanged = false;
  const MachineFrameInfo *MFI = MF.getFrameInfo();
  uint64_t allocaSize = MFI->getStackSize();
  const TargetFrameLowering *TFL = MF.getTarget().getFrameLowering();

  for (MachineFunction::iterator MBB = MF.begin(), E = MF.end();
       MBB != E; ++MBB) {
    // We have interest only to catch blocks.
    if (!MBB->getBasicBlock()->getName().startswith("catch") ||
        MBB->getBasicBlock()->getName().startswith("catch.dispatch")) {
      continue;
    }

    TFL->fixSEHCatchHandlerSP(MF, MBB->begin(), getFreeInsertPoint(*MBB),
                              allocaSize, true);
  }
  
  return wasChanged;
}

CBF::insert_point CBF::getFreeInsertPoint(MachineBasicBlock &Start) const {
  insert_point result = Start.begin();
  while(result != result->getParent()->end()) {
    if (result->isReturn()) {
      return result;
    } else if (result->isCall()) {
      const GlobalValue *func = result->getOperand(0).getGlobal();
      if (func->getName().equals("_CxxThrowException")) {
        return ++result;
      }
    } else if (result->isUnconditionalBranch()) {
      MachineBasicBlock *target = result->getOperand(0).getMBB();
      result = target->begin();
      continue;
    }
    ++result;
  }
  llvm_unreachable("Can not find end of catch block!");
}