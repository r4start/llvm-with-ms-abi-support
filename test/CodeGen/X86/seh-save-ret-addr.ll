; RUN: llc  %s -mtriple=i686-pc-win32 -filetype=asm -o - -x86-asm-syntax=intel | FileCheck %s

define void @s() {
entry:
  br label %next
next:
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@s, %next))
  unreachable
; CHECK:         _s:                                     # @s
; CHECK-NEXT:    # BB#0:                                 # %entry
; CHECK-NEXT:      jmp LBB0_1
; CHECK-NEXT:    Ltmp0:                                  # Block address taken
; CHECK-NEXT:    LBB0_1:                                 # %next
; CHECK-NEXT:      mov EAX, Ltmp0
; CHECK-NEXT:      ret
}

declare void @llvm.seh.save.ret.addr(i8*) noreturn