//===--- SEHSpecialBlocksMarker - Mark catch handlers & unwind funclets. ---===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===---------------------------------------------------------------------===//
//
// This pass set isSEHspecialBlock flag for each machine basic block if
// it represents unwind funclet or catch handler. 
// Required if using MS SEH exception handling.
//
//===---------------------------------------------------------------------===//

// r4start

#include "SEHSpecialBlocksMarker.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/BasicBlock.h"
#include "llvm/GlobalValue.h"

using namespace llvm;

char SBM::ID = 0;
char &llvm::SpecialBlocksMarkerID = SBM::ID;

INITIALIZE_PASS_BEGIN(SBM, "specialblocksmarker",
                "SEH special blocks marker.", false, false)
INITIALIZE_PASS_END(SBM, "specialblocksmarker",
                    "SEH special blocks marker.",
                    false, false)

bool SBM::runOnMachineFunction(MachineFunction &MF) {
  bool wasChanged = false;

  for (MachineFunction::iterator MBB = MF.begin(), E = MF.end();
       MBB != E; ++MBB) {
    // We have interest only to unvisited catch handlers.
    if ((!MBB->getBasicBlock()->getName().startswith("catch") &&
         !MBB->getBasicBlock()->getName().startswith("ehcleanup")) ||
        MBB->getBasicBlock()->getName().startswith("catch.dispatch")) {
      continue;
    }

    wasChanged = true;
    MBB->setIsSEHSpecialBlock();

    MachineBasicBlock::iterator result = MBB->begin();
    while(result != result->getParent()->end()) {
      if (result->isReturn()) {
        result->getParent()->setIsSEHSpecialBlock();
        break;
      } else if (result->isCall()) {
        const GlobalValue *func = result->getOperand(0).getGlobal();
        if (func->getName().equals("_CxxThrowException")) {
          result->getParent()->setIsSEHSpecialBlock();
          break;
        }
      } else if (result->isUnconditionalBranch()) {
        result->getParent()->setIsSEHSpecialBlock();
        MachineBasicBlock *target = result->getOperand(0).getMBB();
        result = target->begin();
        continue;
      }
      ++result;
    }
  }

  return wasChanged;
}
