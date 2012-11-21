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
#include "llvm/Function.h"
#include "llvm/BasicBlock.h"

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
    enum StackOperationKind {
      Undef,
      Reserve,
      Free
    };
    
    StackOperationKind getBlockKind(const MachineBasicBlock &BB) const;
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

  std::vector<MachineBasicBlock::iterator> reserveStack;
  std::vector<MachineBasicBlock::iterator> freeStack;

  reserveStack.reserve(16);
  freeStack.reserve(16);

  for (MachineFunction::iterator MBB = MF.begin(), E = MF.end();
       MBB != E; ++MBB) {
    // We have interest only to catch blocks.
    if (!MBB->isSEHSpecialBlock()) {
      continue;
    }

    StackOperationKind kind = getBlockKind(*MBB);
    if (kind == Reserve) {
      reserveStack.push_back(MBB->begin());
    } else if (kind == Free) {
      MachineBasicBlock::iterator i = --MBB->end();
      
      while (i != MBB->begin()) {
        if (i->isReturn()) {
          --i;
          break;
        }
        --i;
      }

      assert(i != MBB->begin());
      freeStack.push_back(i);
    }
  }
  
  TFL->fixSEHCatchHandlerSP(MF, reserveStack, freeStack, allocaSize);

  return wasChanged;
}

CBF::StackOperationKind CBF::getBlockKind(const MachineBasicBlock &BB) const {
  const BasicBlock *bb = BB.getBasicBlock();
  Function *callee = 0;

  for (BasicBlock::const_iterator i = bb->begin(), e = bb->end(); 
      i != e; ++i) {
    if (const CallInst *call = dyn_cast<CallInst>(i)) {
      callee = call->getCalledFunction();
      if (callee->isIntrinsic()) {
        if (callee->getIntrinsicID() == Intrinsic::seh_reserve_stack) {
          return StackOperationKind::Reserve;
        }
        if (callee->getIntrinsicID() == Intrinsic::seh_free_reserved_stack) {
          return StackOperationKind::Free;
        }
      }    
    }
  }
  return StackOperationKind::Undef;
}
