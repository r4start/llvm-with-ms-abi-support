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
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/Intrinsics.h"
#include "llvm/Instructions.h"
#include "llvm/Function.h"

#include <list>

using namespace llvm;

char SBM::ID = 0;
char &llvm::SpecialBlocksMarkerID = SBM::ID;

INITIALIZE_PASS_BEGIN(SBM, "specialblocksmarker",
                "SEH special blocks marker.", false, false)
INITIALIZE_PASS_END(SBM, "specialblocksmarker",
                    "SEH special blocks marker.",
                    false, false)

static bool isSearchStopPoint(MachineBasicBlock &MBB) {
  const BasicBlock *bb = MBB.getBasicBlock();
  
  for (BasicBlock::const_iterator i = bb->begin(), e = bb->end(); i != e; ++i){
    if (const CallInst *call = dyn_cast<CallInst>(i)) {
      Function *callee = call->getCalledFunction();
      if (callee->isIntrinsic() && 
          callee->getIntrinsicID() == Intrinsic::seh_save_ret_addr) {
        return true;
      }
    }
  }
  
  return false;
}

bool SBM::runOnMachineFunction(MachineFunction &MF) {
  bool wasChanged = false;
  std::list<MachineBasicBlock *> queue;

  for (MachineFunction::iterator MBB = MF.begin(), E = MF.end();
       MBB != E; ++MBB) {
    // We have interest only to unvisited catch handlers.
    bool isCatch = MBB->getBasicBlock()->getName().startswith("catch");
    if ((!isCatch &&
         !MBB->getBasicBlock()->getName().startswith("ehcleanup")) ||
        MBB->getBasicBlock()->getName().startswith("catch.dispatch") ||
        MBB->isSEHSpecialBlock()) {
      continue;
    }

    wasChanged = true;
    MBB->setIsSEHSpecialBlock();

    if (!isCatch ||
        MBB->succ_empty())
      continue;

    queue.assign(MBB->succ_begin(), MBB->succ_end());
    std::list<MachineBasicBlock *>::iterator s = queue.begin();
    
    while(s != queue.end()) {
      (*s)->setIsSEHSpecialBlock();
      
      if (!isSearchStopPoint(**s)) {
        queue.insert(queue.end(), (*s)->succ_begin(), (*s)->succ_end());
      }

      queue.erase(s++);
    }

    queue.clear();
  }

  return wasChanged;
}
