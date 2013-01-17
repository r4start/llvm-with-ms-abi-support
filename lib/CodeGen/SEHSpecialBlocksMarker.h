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

#ifndef LLVM_CODEGEN_SEH_SBM_H
#define LLVM_CODEGEN_SEH_SBM_H

#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/MachineFunctionPass.h"

namespace llvm {

class SBM : public MachineFunctionPass {
public:
  static char ID;
  SBM() : MachineFunctionPass(ID) {
    initializeSBMPass(*PassRegistry::getPassRegistry());
  }

  bool runOnMachineFunction(MachineFunction &MF);
};

} // End llvm namespace

#endif // LLVM_CODEGEN_SEH_SBM_H
