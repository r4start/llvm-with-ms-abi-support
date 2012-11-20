; RUN: llc  %s -O0 -mtriple=i686-pc-win32 -filetype=asm -o - -x86-asm-syntax=intel | FileCheck %s
define void @s() {
entry:
  br label %next
next:
  call void @llvm.seh.esp.save()
  ret void
; CHECK:         _s:                                     # @s
; CHECK-NEXT:    # BB#0:                                 # %entry
; CHECK-NEXT:      push  EBP
; CHECK-NEXT:      jmp LBB0_1
; CHECK-NEXT:    LBB0_1:                                 # %next
; CHECK-NEXT:      mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:      pop EBP
; CHECK-NEXT:      ret
}

declare void @llvm.seh.esp.save()