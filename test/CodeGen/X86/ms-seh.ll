; RUN: llc < %s -mtriple=i686-pc-win32-microsoft -O0 -filetype=asm -x86-asm-syntax=intel | FileCheck %s
; r4start


%catchable.type = type { i32, %type.descriptor*, %pmd.type, i32, void ()* }
%type.descriptor = type { i8*, i32, [0 x i8] }
%pmd.type = type { i32, i32, i32 }
%throw.info.type = type { i32, void ()*, i32 ()*, %catchable.array.type* }
%catchable.array.type = type { i32, [0 x %catchable.type*] }
%handler.type = type { i32, %type.descriptor*, i32, i8* }
%tryblock.map.entry = type { i32, i32, i32, i32, %handler.type* }
%unwind.map.entry = type { i32, i8* }
%ehfuncinfo = type { i32, i32, %unwind.map.entry*, i32, %tryblock.map.entry*, i32, i8*, %estypelist*, i32 }
%estypelist = type { i32, %handler.type* }
%struct.A = type { i8 }
%struct.B = type { i8 }
%struct.C = type { i8 }
%struct.D = type { i8 }

@"\01??_7type_info@@6B@" = external global i8*
@"\01??_R0H@8" = weak constant { i8**, i32, [3 x i8] } { i8** @"\01??_7type_info@@6B@", i32 0, [3 x i8] c".H\00" }
@"\01__CT??_R0H@84" = weak global %catchable.type { i32 1, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), %pmd.type { i32 0, i32 -1, i32 0 }, i32 4, void ()* null }
@"\01__CTA1H" = weak global { i32, [1 x %catchable.type*] } { i32 1, [1 x %catchable.type*] [%catchable.type* @"\01__CT??_R0H@84"] }
@"\01__TI1H" = weak global %throw.info.type { i32 0, void ()* null, i32 ()* null, %catchable.array.type* bitcast ({ i32, [1 x %catchable.type*] }* @"\01__CTA1H" to %catchable.array.type*) }
@"\01??_R0?AUA@@@8" = weak constant { i8**, i32, [8 x i8] } { i8** @"\01??_7type_info@@6B@", i32 0, [8 x i8] c".?AUA@@\00" }
@"\01__CT??_R0?AUA@@@81" = weak global %catchable.type { i32 0, %type.descriptor* bitcast ({ i8**, i32, [8 x i8] }* @"\01??_R0?AUA@@@8" to %type.descriptor*), %pmd.type { i32 0, i32 -1, i32 0 }, i32 1, void ()* null }
@"\01__CTA1?AUA@@" = weak global { i32, [1 x %catchable.type*] } { i32 1, [1 x %catchable.type*] [%catchable.type* @"\01__CT??_R0?AUA@@@81"] }
@"\01__TI1?AUA@@" = weak global %throw.info.type { i32 0, void ()* bitcast (void (%struct.A*)* @"\01??1A@@QAE@XZ" to void ()*), i32 ()* null, %catchable.array.type* bitcast ({ i32, [1 x %catchable.type*] }* @"\01__CTA1?AUA@@" to %catchable.array.type*) }
@"\01__catchsym$test1@@YAHXZ$0" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [8 x i8] }* @"\01??_R0?AUA@@@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test1@@YAHXZ", %catch) }]
@"\01__tryblocktable$test1@@YAHXZ" = weak global [1 x %tryblock.map.entry] [%tryblock.map.entry { i32 0, i32 2, i32 3, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test1@@YAHXZ$0", i32 0, i32 0) }]
@"\01__unwindtable$test1@@YAHXZ" = weak global [4 x %unwind.map.entry] [%unwind.map.entry { i32 -1, i8* null }, %unwind.map.entry { i32 0, i8* blockaddress(@"\01?test1@@YAHXZ", %ehcleanup) }, %unwind.map.entry { i32 1, i8* null }, %unwind.map.entry { i32 -1, i8* null }]
@"\01__ehfuncinfo$test1@@YAHXZ" = weak global %ehfuncinfo { i32 429065506, i32 4, %unwind.map.entry* getelementptr inbounds ([4 x %unwind.map.entry]* @"\01__unwindtable$test1@@YAHXZ", i32 0, i32 0), i32 1, %tryblock.map.entry* getelementptr inbounds ([1 x %tryblock.map.entry]* @"\01__tryblocktable$test1@@YAHXZ", i32 0, i32 0), i32 0, i8* null, %estypelist* null, i32 1 }
@"\01??_R0?AUB@@@8" = weak constant { i8**, i32, [8 x i8] } { i8** @"\01??_7type_info@@6B@", i32 0, [8 x i8] c".?AUB@@\00" }
@"\01__catchsym$test2@@YAHXZ$0" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [8 x i8] }* @"\01??_R0?AUB@@@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test2@@YAHXZ", %catch) }]
@"\01__catchsym$test2@@YAHXZ$1" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test2@@YAHXZ", %catch5) }]
@"\01__tryblocktable$test2@@YAHXZ" = weak global [2 x %tryblock.map.entry] [%tryblock.map.entry { i32 1, i32 1, i32 2, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test2@@YAHXZ$0", i32 0, i32 0) }, %tryblock.map.entry { i32 0, i32 2, i32 3, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test2@@YAHXZ$1", i32 0, i32 0) }]
@"\01__unwindtable$test2@@YAHXZ" = weak global [4 x %unwind.map.entry] [%unwind.map.entry { i32 -1, i8* null }, %unwind.map.entry zeroinitializer, %unwind.map.entry zeroinitializer, %unwind.map.entry { i32 -1, i8* null }]
@"\01__ehfuncinfo$test2@@YAHXZ" = weak global %ehfuncinfo { i32 429065506, i32 4, %unwind.map.entry* getelementptr inbounds ([4 x %unwind.map.entry]* @"\01__unwindtable$test2@@YAHXZ", i32 0, i32 0), i32 2, %tryblock.map.entry* getelementptr inbounds ([2 x %tryblock.map.entry]* @"\01__tryblocktable$test2@@YAHXZ", i32 0, i32 0), i32 0, i8* null, %estypelist* null, i32 1 }
@"\01__catchsym$test3@@YAHXZ$0" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test3@@YAHXZ", %catch) }]
@"\01__catchsym$test3@@YAHXZ$1" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test3@@YAHXZ", %catch5) }]
@"\01__tryblocktable$test3@@YAHXZ" = weak global [2 x %tryblock.map.entry] [%tryblock.map.entry { i32 0, i32 0, i32 1, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test3@@YAHXZ$0", i32 0, i32 0) }, %tryblock.map.entry { i32 2, i32 2, i32 3, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test3@@YAHXZ$1", i32 0, i32 0) }]
@"\01__unwindtable$test3@@YAHXZ" = weak global [4 x %unwind.map.entry] [%unwind.map.entry { i32 -1, i8* null }, %unwind.map.entry { i32 -1, i8* null }, %unwind.map.entry { i32 -1, i8* null }, %unwind.map.entry { i32 -1, i8* null }]
@"\01__ehfuncinfo$test3@@YAHXZ" = weak global %ehfuncinfo { i32 429065506, i32 4, %unwind.map.entry* getelementptr inbounds ([4 x %unwind.map.entry]* @"\01__unwindtable$test3@@YAHXZ", i32 0, i32 0), i32 2, %tryblock.map.entry* getelementptr inbounds ([2 x %tryblock.map.entry]* @"\01__tryblocktable$test3@@YAHXZ", i32 0, i32 0), i32 0, i8* null, %estypelist* null, i32 1 }
@"\01??_R0?AUC@@@8" = weak constant { i8**, i32, [8 x i8] } { i8** @"\01??_7type_info@@6B@", i32 0, [8 x i8] c".?AUC@@\00" }
@"\01__catchsym$test4@@YAHXZ$0" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test4@@YAHXZ", %catch) }]
@"\01__catchsym$test4@@YAHXZ$1" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test4@@YAHXZ", %catch6) }]
@"\01__catchsym$test4@@YAHXZ$2" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [8 x i8] }* @"\01??_R0?AUC@@@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test4@@YAHXZ", %catch9) }]
@"\01__tryblocktable$test4@@YAHXZ" = weak global [3 x %tryblock.map.entry] [%tryblock.map.entry { i32 1, i32 1, i32 2, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test4@@YAHXZ$0", i32 0, i32 0) }, %tryblock.map.entry { i32 3, i32 3, i32 4, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test4@@YAHXZ$1", i32 0, i32 0) }, %tryblock.map.entry { i32 0, i32 4, i32 5, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test4@@YAHXZ$2", i32 0, i32 0) }]
@"\01__unwindtable$test4@@YAHXZ" = weak global [6 x %unwind.map.entry] [%unwind.map.entry { i32 -1, i8* null }, %unwind.map.entry zeroinitializer, %unwind.map.entry zeroinitializer, %unwind.map.entry zeroinitializer, %unwind.map.entry zeroinitializer, %unwind.map.entry { i32 -1, i8* null }]
@"\01__ehfuncinfo$test4@@YAHXZ" = weak global %ehfuncinfo { i32 429065506, i32 6, %unwind.map.entry* getelementptr inbounds ([6 x %unwind.map.entry]* @"\01__unwindtable$test4@@YAHXZ", i32 0, i32 0), i32 3, %tryblock.map.entry* getelementptr inbounds ([3 x %tryblock.map.entry]* @"\01__tryblocktable$test4@@YAHXZ", i32 0, i32 0), i32 0, i8* null, %estypelist* null, i32 1 }
@"\01__catchsym$test5@@YAHXZ$0" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test5@@YAHXZ", %catch) }]
@"\01__catchsym$test5@@YAHXZ$1" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test5@@YAHXZ", %catch27) }]
@"\01__catchsym$test5@@YAHXZ$2" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test5@@YAHXZ", %catch30) }]
@"\01__tryblocktable$test5@@YAHXZ" = weak global [3 x %tryblock.map.entry] [%tryblock.map.entry { i32 1, i32 3, i32 4, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test5@@YAHXZ$0", i32 0, i32 0) }, %tryblock.map.entry { i32 5, i32 7, i32 8, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test5@@YAHXZ$1", i32 0, i32 0) }, %tryblock.map.entry { i32 0, i32 8, i32 9, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test5@@YAHXZ$2", i32 0, i32 0) }]
@"\01__unwindtable$test5@@YAHXZ" = weak global [10 x %unwind.map.entry] [%unwind.map.entry { i32 -1, i8* null }, %unwind.map.entry zeroinitializer, %unwind.map.entry { i32 1, i8* blockaddress(@"\01?test5@@YAHXZ", %ehcleanup9) }, %unwind.map.entry { i32 2, i8* blockaddress(@"\01?test5@@YAHXZ", %ehcleanup) }, %unwind.map.entry zeroinitializer, %unwind.map.entry zeroinitializer, %unwind.map.entry { i32 5, i8* blockaddress(@"\01?test5@@YAHXZ", %ehcleanup23) }, %unwind.map.entry { i32 6, i8* blockaddress(@"\01?test5@@YAHXZ", %ehcleanup20) }, %unwind.map.entry zeroinitializer, %unwind.map.entry { i32 -1, i8* null }]
@"\01__ehfuncinfo$test5@@YAHXZ" = weak global %ehfuncinfo { i32 429065506, i32 10, %unwind.map.entry* getelementptr inbounds ([10 x %unwind.map.entry]* @"\01__unwindtable$test5@@YAHXZ", i32 0, i32 0), i32 3, %tryblock.map.entry* getelementptr inbounds ([3 x %tryblock.map.entry]* @"\01__tryblocktable$test5@@YAHXZ", i32 0, i32 0), i32 0, i8* null, %estypelist* null, i32 1 }
@"\01__catchsym$test6@@YAHXZ$0" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test6@@YAHXZ", %catch19) }]
@"\01__catchsym$test6@@YAHXZ$1" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test6@@YAHXZ", %catch) }]
@"\01__catchsym$test6@@YAHXZ$2" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test6@@YAHXZ", %catch43) }]
@"\01__catchsym$test6@@YAHXZ$3" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test6@@YAHXZ", %catch46) }]
@"\01__tryblocktable$test6@@YAHXZ" = weak global [4 x %tryblock.map.entry] [%tryblock.map.entry { i32 7, i32 7, i32 8, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test6@@YAHXZ$0", i32 0, i32 0) }, %tryblock.map.entry { i32 2, i32 4, i32 8, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test6@@YAHXZ$1", i32 0, i32 0) }, %tryblock.map.entry { i32 10, i32 12, i32 13, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test6@@YAHXZ$2", i32 0, i32 0) }, %tryblock.map.entry { i32 1, i32 13, i32 14, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test6@@YAHXZ$3", i32 0, i32 0) }]
@"\01__unwindtable$test6@@YAHXZ" = weak global [15 x %unwind.map.entry] [%unwind.map.entry { i32 -1, i8* blockaddress(@"\01?test6@@YAHXZ", %ehcleanup48) }, %unwind.map.entry zeroinitializer, %unwind.map.entry { i32 1, i8* null }, %unwind.map.entry { i32 2, i8* blockaddress(@"\01?test6@@YAHXZ", %ehcleanup10) }, %unwind.map.entry { i32 3, i8* blockaddress(@"\01?test6@@YAHXZ", %ehcleanup) }, %unwind.map.entry { i32 1, i8* null }, %unwind.map.entry { i32 5, i8* blockaddress(@"\01?test6@@YAHXZ", %ehcleanup25) }, %unwind.map.entry { i32 6, i8* null }, %unwind.map.entry { i32 6, i8* null }, %unwind.map.entry { i32 6, i8* null }, %unwind.map.entry { i32 1, i8* null }, %unwind.map.entry { i32 10, i8* blockaddress(@"\01?test6@@YAHXZ", %ehcleanup39) }, %unwind.map.entry { i32 11, i8* blockaddress(@"\01?test6@@YAHXZ", %ehcleanup36) }, %unwind.map.entry { i32 1, i8* null }, %unwind.map.entry zeroinitializer]
@"\01__ehfuncinfo$test6@@YAHXZ" = weak global %ehfuncinfo { i32 429065506, i32 15, %unwind.map.entry* getelementptr inbounds ([15 x %unwind.map.entry]* @"\01__unwindtable$test6@@YAHXZ", i32 0, i32 0), i32 4, %tryblock.map.entry* getelementptr inbounds ([4 x %tryblock.map.entry]* @"\01__tryblocktable$test6@@YAHXZ", i32 0, i32 0), i32 0, i8* null, %estypelist* null, i32 1 }
@"\01__catchsym$test7@@YAHXZ$0" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [8 x i8] }* @"\01??_R0?AUA@@@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test7@@YAHXZ", %catch) }]
@"\01__tryblocktable$test7@@YAHXZ" = weak global [1 x %tryblock.map.entry] [%tryblock.map.entry { i32 0, i32 0, i32 1, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test7@@YAHXZ$0", i32 0, i32 0) }]
@"\01__unwindtable$test7@@YAHXZ" = weak global [2 x %unwind.map.entry] [%unwind.map.entry { i32 -1, i8* null }, %unwind.map.entry { i32 -1, i8* null }]
@"\01__ehfuncinfo$test7@@YAHXZ" = weak global %ehfuncinfo { i32 429065506, i32 2, %unwind.map.entry* getelementptr inbounds ([2 x %unwind.map.entry]* @"\01__unwindtable$test7@@YAHXZ", i32 0, i32 0), i32 1, %tryblock.map.entry* getelementptr inbounds ([1 x %tryblock.map.entry]* @"\01__tryblocktable$test7@@YAHXZ", i32 0, i32 0), i32 0, i8* null, %estypelist* null, i32 1 }
@"\01??_R0?AUD@@@8" = weak constant { i8**, i32, [8 x i8] } { i8** @"\01??_7type_info@@6B@", i32 0, [8 x i8] c".?AUD@@\00" }
@"\01__CT??_R0?AUD@@@81" = weak global %catchable.type { i32 0, %type.descriptor* bitcast ({ i8**, i32, [8 x i8] }* @"\01??_R0?AUD@@@8" to %type.descriptor*), %pmd.type { i32 0, i32 -1, i32 0 }, i32 1, void ()* null }
@"\01__CTA1?AUD@@" = weak global { i32, [1 x %catchable.type*] } { i32 1, [1 x %catchable.type*] [%catchable.type* @"\01__CT??_R0?AUD@@@81"] }
@"\01__TI1?AUD@@" = weak global %throw.info.type { i32 0, void ()* bitcast (void (%struct.D*)* @"\01??1D@@QAE@XZ" to void ()*), i32 ()* null, %catchable.array.type* bitcast ({ i32, [1 x %catchable.type*] }* @"\01__CTA1?AUD@@" to %catchable.array.type*) }
@"\01__catchsym$test8@@YAHXZ$0" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [8 x i8] }* @"\01??_R0?AUD@@@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test8@@YAHXZ", %catch) }]
@"\01__tryblocktable$test8@@YAHXZ" = weak global [1 x %tryblock.map.entry] [%tryblock.map.entry { i32 0, i32 0, i32 1, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test8@@YAHXZ$0", i32 0, i32 0) }]
@"\01__unwindtable$test8@@YAHXZ" = weak global [2 x %unwind.map.entry] [%unwind.map.entry { i32 -1, i8* null }, %unwind.map.entry { i32 -1, i8* null }]
@"\01__ehfuncinfo$test8@@YAHXZ" = weak global %ehfuncinfo { i32 429065506, i32 2, %unwind.map.entry* getelementptr inbounds ([2 x %unwind.map.entry]* @"\01__unwindtable$test8@@YAHXZ", i32 0, i32 0), i32 1, %tryblock.map.entry* getelementptr inbounds ([1 x %tryblock.map.entry]* @"\01__tryblocktable$test8@@YAHXZ", i32 0, i32 0), i32 0, i8* null, %estypelist* null, i32 1 }
@"\01__catchsym$test9@@YAHXZ$0" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [8 x i8] }* @"\01??_R0?AUD@@@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test9@@YAHXZ", %catch) }]
@"\01__tryblocktable$test9@@YAHXZ" = weak global [1 x %tryblock.map.entry] [%tryblock.map.entry { i32 0, i32 1, i32 2, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test9@@YAHXZ$0", i32 0, i32 0) }]
@"\01__unwindtable$test9@@YAHXZ" = weak global [3 x %unwind.map.entry] [%unwind.map.entry { i32 -1, i8* null }, %unwind.map.entry { i32 0, i8* blockaddress(@"\01?test9@@YAHXZ", %ehcleanup) }, %unwind.map.entry { i32 -1, i8* null }]
@"\01__ehfuncinfo$test9@@YAHXZ" = weak global %ehfuncinfo { i32 429065506, i32 3, %unwind.map.entry* getelementptr inbounds ([3 x %unwind.map.entry]* @"\01__unwindtable$test9@@YAHXZ", i32 0, i32 0), i32 1, %tryblock.map.entry* getelementptr inbounds ([1 x %tryblock.map.entry]* @"\01__tryblocktable$test9@@YAHXZ", i32 0, i32 0), i32 0, i8* null, %estypelist* null, i32 1 }
@"\01__catchsym$test10@@YAHXZ$0" = weak global [1 x %handler.type] [%handler.type { i32 0, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test10@@YAHXZ", %catch) }]
@"\01__catchsym$test10@@YAHXZ$1" = weak global [1 x %handler.type] [%handler.type { i32 0, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test10@@YAHXZ", %catch10) }]
@"\01__catchsym$test10@@YAHXZ$2" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test10@@YAHXZ", %catch5) }]
@"\01__tryblocktable$test10@@YAHXZ" = weak global [3 x %tryblock.map.entry] [%tryblock.map.entry { i32 1, i32 1, i32 2, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test10@@YAHXZ$0", i32 0, i32 0) }, %tryblock.map.entry { i32 4, i32 4, i32 5, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test10@@YAHXZ$1", i32 0, i32 0) }, %tryblock.map.entry { i32 0, i32 2, i32 5, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test10@@YAHXZ$2", i32 0, i32 0) }]
@"\01__unwindtable$test10@@YAHXZ" = weak global [6 x %unwind.map.entry] [%unwind.map.entry { i32 -1, i8* null }, %unwind.map.entry zeroinitializer, %unwind.map.entry zeroinitializer, %unwind.map.entry { i32 -1, i8* null }, %unwind.map.entry { i32 3, i8* null }, %unwind.map.entry { i32 3, i8* null }]
@"\01__ehfuncinfo$test10@@YAHXZ" = weak global %ehfuncinfo { i32 429065506, i32 6, %unwind.map.entry* getelementptr inbounds ([6 x %unwind.map.entry]* @"\01__unwindtable$test10@@YAHXZ", i32 0, i32 0), i32 3, %tryblock.map.entry* getelementptr inbounds ([3 x %tryblock.map.entry]* @"\01__tryblocktable$test10@@YAHXZ", i32 0, i32 0), i32 0, i8* null, %estypelist* null, i32 1 }
@"\01__catchsym$test11@@YAHXZ$0" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test11@@YAHXZ", %catch) }]
@"\01__tryblocktable$test11@@YAHXZ" = weak global [1 x %tryblock.map.entry] [%tryblock.map.entry { i32 0, i32 1, i32 2, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test11@@YAHXZ$0", i32 0, i32 0) }]
@"\01__unwindtable$test11@@YAHXZ" = weak global [3 x %unwind.map.entry] [%unwind.map.entry { i32 -1, i8* null }, %unwind.map.entry { i32 0, i8* blockaddress(@"\01?test11@@YAHXZ", %ehcleanup) }, %unwind.map.entry { i32 -1, i8* null }]
@"\01__ehfuncinfo$test11@@YAHXZ" = weak global %ehfuncinfo { i32 429065506, i32 3, %unwind.map.entry* getelementptr inbounds ([3 x %unwind.map.entry]* @"\01__unwindtable$test11@@YAHXZ", i32 0, i32 0), i32 1, %tryblock.map.entry* getelementptr inbounds ([1 x %tryblock.map.entry]* @"\01__tryblocktable$test11@@YAHXZ", i32 0, i32 0), i32 0, i8* null, %estypelist* null, i32 1 }
@"\01__catchsym$test12@@YAHXZ$0" = weak global [1 x %handler.type] [%handler.type { i32 0, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test12@@YAHXZ", %catch9) }]
@"\01__catchsym$test12@@YAHXZ$1" = weak global [1 x %handler.type] [%handler.type { i32 8, %type.descriptor* bitcast ({ i8**, i32, [3 x i8] }* @"\01??_R0H@8" to %type.descriptor*), i32 0, i8* blockaddress(@"\01?test12@@YAHXZ", %catch) }]
@"\01__tryblocktable$test12@@YAHXZ" = weak global [2 x %tryblock.map.entry] [%tryblock.map.entry { i32 2, i32 3, i32 4, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test12@@YAHXZ$0", i32 0, i32 0) }, %tryblock.map.entry { i32 0, i32 0, i32 4, i32 1, %handler.type* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test12@@YAHXZ$1", i32 0, i32 0) }]
@"\01__unwindtable$test12@@YAHXZ" = weak global [5 x %unwind.map.entry] [%unwind.map.entry { i32 -1, i8* null }, %unwind.map.entry { i32 -1, i8* null }, %unwind.map.entry { i32 1, i8* null }, %unwind.map.entry { i32 2, i8* blockaddress(@"\01?test12@@YAHXZ", %ehcleanup) }, %unwind.map.entry { i32 1, i8* null }]
@"\01__ehfuncinfo$test12@@YAHXZ" = weak global %ehfuncinfo { i32 429065506, i32 5, %unwind.map.entry* getelementptr inbounds ([5 x %unwind.map.entry]* @"\01__unwindtable$test12@@YAHXZ", i32 0, i32 0), i32 2, %tryblock.map.entry* getelementptr inbounds ([2 x %tryblock.map.entry]* @"\01__tryblocktable$test12@@YAHXZ", i32 0, i32 0), i32 0, i8* null, %estypelist* null, i32 1 }

define void @"\01?s@@YAXXZ"() {
entry:
  %throw.object = alloca i32
  store i32 1, i32* %throw.object
  %0 = bitcast i32* %throw.object to i8*
  call x86_stdcallcc void @_CxxThrowException(i8* %0, %throw.info.type* @"\01__TI1H")
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare x86_stdcallcc void @_CxxThrowException(i8*, %throw.info.type*)

define void @"\01?sa@@YAXXZ"() {
entry:
  %throw.object = alloca %struct.A
  %call = call x86_thiscallcc %struct.A* @"\01??0A@@QAE@XZ"(%struct.A* %throw.object)
  %0 = bitcast %struct.A* %throw.object to i8*
  call x86_stdcallcc void @_CxxThrowException(i8* %0, %throw.info.type* @"\01__TI1?AUA@@")
  unreachable

return:                                           ; No predecessors!
  ret void
}

define linkonce_odr x86_thiscallcc %struct.A* @"\01??0A@@QAE@XZ"(%struct.A* %this) unnamed_addr nounwind align 2 {
entry:
  %this.addr = alloca %struct.A*, align 4
  store %struct.A* %this, %struct.A** %this.addr, align 4
  %this1 = load %struct.A** %this.addr
  ret %struct.A* %this1
}

define linkonce_odr x86_thiscallcc void @"\01??1A@@QAE@XZ"(%struct.A* %this) unnamed_addr nounwind align 2 {
entry:
  %this.addr = alloca %struct.A*, align 4
  store %struct.A* %this, %struct.A** %this.addr, align 4
  %this1 = load %struct.A** %this.addr
  ret void
}

define i32 @"\01?test1@@YAHXZ"() {
entry:
  %a = alloca %struct.A, align 1
  %b = alloca %struct.A, align 1
  %0 = alloca %struct.A*, align 4
  call void @llvm.seh.esp.save()
  br label %seh.init.block

seh.init.block:                                   ; preds = %entry
  %1 = call i8* @llvm.frameaddress(i32 0)
  %2 = ptrtoint i8* %1 to i32
  %3 = ptrtoint %struct.A** %0 to i32
  %4 = sub i32 %3, %2
  store i32 %4, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test1@@YAHXZ$0", i32 0, i32 0, i32 2)
  br label %after.seh.init

after.seh.init:                                   ; preds = %seh.init.block
  %5 = call i8* @llvm.frameaddress(i32 0)
  %6 = getelementptr i8* %5, i32 -4
  %try.id = bitcast i8* %6 to i32*
  store i32 0, i32* %try.id
  %call = invoke x86_thiscallcc %struct.A* @"\01??0A@@QAE@XZ"(%struct.A* %a)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %after.seh.init
  store i32 1, i32* %try.id
  %call3 = invoke x86_thiscallcc %struct.A* @"\01??0A@@QAE@XZ"(%struct.A* %b)
          to label %invoke.cont2 unwind label %lpad1

invoke.cont2:                                     ; preds = %invoke.cont
  store i32 2, i32* %try.id
  invoke x86_thiscallcc void @"\01??1A@@QAE@XZ"(%struct.A* %b)
          to label %invoke.cont4 unwind label %lpad1

invoke.cont4:                                     ; preds = %invoke.cont2
  store i32 1, i32* %try.id
  invoke x86_thiscallcc void @"\01??1A@@QAE@XZ"(%struct.A* %a)
          to label %invoke.cont5 unwind label %lpad

invoke.cont5:                                     ; preds = %invoke.cont4
  store i32 0, i32* %try.id
  br label %try.cont

"\01__ehhandler$test1@@YAHXZ":                    ; preds = %catch.dispatch, %lpad1, %lpad
  tail call void @__CxxFrameHandler3(%ehfuncinfo* @"\01__ehfuncinfo$test1@@YAHXZ") noreturn
  unreachable

lpad:                                             ; preds = %invoke.cont4, %after.seh.init
  %7 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [8 x i8] }* @"\01??_R0?AUA@@@8"
  switch i32 %7, label %catch.dispatch [
    i32 -2, label %"\01__ehhandler$test1@@YAHXZ"
  ]

lpad1:                                            ; preds = %invoke.cont2, %invoke.cont
  %8 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [8 x i8] }* @"\01??_R0?AUA@@@8"
  switch i32 %8, label %ehcleanup [
    i32 -2, label %"\01__ehhandler$test1@@YAHXZ"
  ]

ehcleanup:                                        ; preds = %lpad1
  invoke x86_thiscallcc void @"\01??1A@@QAE@XZ"(%struct.A* %a)
          to label %invoke.cont6 unwind label %terminate.lpad

invoke.cont6:                                     ; preds = %ehcleanup
  call void @llvm.seh.ret()
  br label %catch.dispatch

catch.dispatch:                                   ; preds = %invoke.cont6, %lpad
  %9 = load i32* %try.id
  switch i32 %9, label %"\01__ehhandler$test1@@YAHXZ" [
    i32 0, label %catch
    i32 -1, label %eh.resume
  ]

catch:                                            ; preds = %catch.dispatch
  call void @llvm.seh.reserve.stack()
  store i32 -1, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test1@@YAHXZ", %try.cont))
  br label %try.cont

try.cont:                                         ; preds = %catch, %invoke.cont5
  store i32 -1, i32* %try.id
  ret i32 0

eh.resume:                                        ; preds = %catch.dispatch
  resume i8* null

terminate.lpad:                                   ; preds = %ehcleanup
  %10 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  unreachable
}

declare i8* @llvm.frameaddress(i32) nounwind readnone

declare i32 @__gxx_personality_v0(...)

declare void @llvm.seh.ret() nounwind

declare void @llvm.seh.reserve.stack() nounwind

declare void @llvm.seh.save.ret.addr(i8*) nounwind

declare void @llvm.seh.free.reserved.stack() nounwind

declare void @__CxxFrameHandler3(%ehfuncinfo* inreg nocapture)

declare void @llvm.seh.esp.save() nounwind

define i32 @"\01?test2@@YAHXZ"() {
entry:
  %0 = alloca %struct.B*, align 4
  %1 = alloca i32*, align 4
  call void @llvm.seh.esp.save()
  br label %seh.init.block

seh.init.block:                                   ; preds = %entry
  %2 = call i8* @llvm.frameaddress(i32 0)
  %3 = ptrtoint i8* %2 to i32
  %4 = ptrtoint %struct.B** %0 to i32
  %5 = sub i32 %4, %3
  store i32 %5, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test2@@YAHXZ$0", i32 0, i32 0, i32 2)
  %6 = ptrtoint i32** %1 to i32
  %7 = sub i32 %6, %3
  store i32 %7, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test2@@YAHXZ$1", i32 0, i32 0, i32 2)
  br label %after.seh.init

after.seh.init:                                   ; preds = %seh.init.block
  %8 = call i8* @llvm.frameaddress(i32 0)
  %9 = getelementptr i8* %8, i32 -4
  %try.id = bitcast i8* %9 to i32*
  store i32 0, i32* %try.id
  call void @llvm.seh.esp.save()
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %after.seh.init
  store i32 1, i32* %try.id
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont2 unwind label %lpad1

invoke.cont2:                                     ; preds = %invoke.cont
  br label %try.cont

"\01__ehhandler$test2@@YAHXZ":                    ; preds = %catch.dispatch3, %catch.dispatch, %lpad1, %lpad
  tail call void @__CxxFrameHandler3(%ehfuncinfo* @"\01__ehfuncinfo$test2@@YAHXZ") noreturn
  unreachable

lpad:                                             ; preds = %after.seh.init
  %10 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %10, label %catch.dispatch3 [
    i32 -2, label %"\01__ehhandler$test2@@YAHXZ"
  ]

lpad1:                                            ; preds = %invoke.cont
  %11 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [8 x i8] }* @"\01??_R0?AUB@@@8"
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %11, label %catch.dispatch [
    i32 -2, label %"\01__ehhandler$test2@@YAHXZ"
  ]

catch.dispatch:                                   ; preds = %lpad1
  %12 = load i32* %try.id
  switch i32 %12, label %"\01__ehhandler$test2@@YAHXZ" [
    i32 0, label %catch
    i32 -1, label %catch.dispatch3
  ]

catch.dispatch3:                                  ; preds = %catch.dispatch, %lpad
  %13 = load i32* %try.id
  switch i32 %13, label %"\01__ehhandler$test2@@YAHXZ" [
    i32 0, label %catch5
    i32 -1, label %eh.resume
  ]

catch5:                                           ; preds = %catch.dispatch3
  call void @llvm.seh.reserve.stack()
  store i32 -1, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test2@@YAHXZ", %try.cont4))
  br label %try.cont4

catch:                                            ; preds = %catch.dispatch
  call void @llvm.seh.reserve.stack()
  store i32 0, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test2@@YAHXZ", %try.cont))
  br label %try.cont

try.cont:                                         ; preds = %catch, %invoke.cont2
  store i32 0, i32* %try.id
  br label %try.cont4

try.cont4:                                        ; preds = %try.cont, %catch5
  store i32 -1, i32* %try.id
  ret i32 0

eh.resume:                                        ; preds = %catch.dispatch3
  resume i8* null
}

define i32 @"\01?test3@@YAHXZ"() {
entry:
  %0 = alloca i32*, align 4
  %1 = alloca i32*, align 4
  call void @llvm.seh.esp.save()
  br label %seh.init.block

seh.init.block:                                   ; preds = %entry
  %2 = call i8* @llvm.frameaddress(i32 0)
  %3 = ptrtoint i8* %2 to i32
  %4 = ptrtoint i32** %0 to i32
  %5 = sub i32 %4, %3
  store i32 %5, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test3@@YAHXZ$0", i32 0, i32 0, i32 2)
  %6 = ptrtoint i32** %1 to i32
  %7 = sub i32 %6, %3
  store i32 %7, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test3@@YAHXZ$1", i32 0, i32 0, i32 2)
  br label %after.seh.init

after.seh.init:                                   ; preds = %seh.init.block
  %8 = call i8* @llvm.frameaddress(i32 0)
  %9 = getelementptr i8* %8, i32 -4
  %try.id = bitcast i8* %9 to i32*
  store i32 0, i32* %try.id
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %after.seh.init
  br label %try.cont

"\01__ehhandler$test3@@YAHXZ":                    ; preds = %catch.dispatch3, %lpad1, %catch.dispatch, %lpad
  tail call void @__CxxFrameHandler3(%ehfuncinfo* @"\01__ehfuncinfo$test3@@YAHXZ") noreturn
  unreachable

lpad:                                             ; preds = %after.seh.init
  %10 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %10, label %catch.dispatch [
    i32 -2, label %"\01__ehhandler$test3@@YAHXZ"
  ]

catch.dispatch:                                   ; preds = %lpad
  %11 = load i32* %try.id
  switch i32 %11, label %"\01__ehhandler$test3@@YAHXZ" [
    i32 0, label %catch
    i32 -1, label %eh.resume
  ]

catch:                                            ; preds = %catch.dispatch
  call void @llvm.seh.reserve.stack()
  store i32 -1, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test3@@YAHXZ", %try.cont))
  br label %try.cont

try.cont:                                         ; preds = %catch, %invoke.cont
  store i32 -1, i32* %try.id
  store i32 2, i32* %try.id
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont2 unwind label %lpad1

invoke.cont2:                                     ; preds = %try.cont
  br label %try.cont4

lpad1:                                            ; preds = %try.cont
  %12 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %12, label %catch.dispatch3 [
    i32 -2, label %"\01__ehhandler$test3@@YAHXZ"
  ]

catch.dispatch3:                                  ; preds = %lpad1
  %13 = load i32* %try.id
  switch i32 %13, label %"\01__ehhandler$test3@@YAHXZ" [
    i32 0, label %catch5
    i32 -1, label %eh.resume
  ]

catch5:                                           ; preds = %catch.dispatch3
  call void @llvm.seh.reserve.stack()
  store i32 -1, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test3@@YAHXZ", %try.cont4))
  br label %try.cont4

try.cont4:                                        ; preds = %catch5, %invoke.cont2
  store i32 -1, i32* %try.id
  ret i32 0

eh.resume:                                        ; preds = %catch.dispatch3, %catch.dispatch
  resume i8* null
}

define i32 @"\01?test4@@YAHXZ"() {
entry:
  %a = alloca i32, align 4
  %fl = alloca %struct.C, align 1
  %a1 = alloca %struct.C, align 1
  %b = alloca %struct.C, align 1
  %0 = alloca i32*, align 4
  %gl = alloca %struct.C, align 1
  %h = alloca %struct.C, align 1
  %gh = alloca %struct.C, align 1
  %1 = alloca i32*, align 4
  %2 = alloca %struct.C*, align 4
  call void @llvm.seh.esp.save()
  br label %seh.init.block

seh.init.block:                                   ; preds = %entry
  %3 = call i8* @llvm.frameaddress(i32 0)
  %4 = ptrtoint i8* %3 to i32
  %5 = ptrtoint i32** %0 to i32
  %6 = sub i32 %5, %4
  store i32 %6, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test4@@YAHXZ$0", i32 0, i32 0, i32 2)
  %7 = ptrtoint i32** %1 to i32
  %8 = sub i32 %7, %4
  store i32 %8, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test4@@YAHXZ$1", i32 0, i32 0, i32 2)
  %9 = ptrtoint %struct.C** %2 to i32
  %10 = sub i32 %9, %4
  store i32 %10, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test4@@YAHXZ$2", i32 0, i32 0, i32 2)
  br label %after.seh.init

after.seh.init:                                   ; preds = %seh.init.block
  %11 = call i8* @llvm.frameaddress(i32 0)
  %12 = getelementptr i8* %11, i32 -4
  %try.id = bitcast i8* %12 to i32*
  store i32 0, i32* %try.id
  call void @llvm.seh.esp.save()
  store i32 1, i32* %try.id
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %after.seh.init
  br label %try.cont

"\01__ehhandler$test4@@YAHXZ":                    ; preds = %catch.dispatch7, %catch.dispatch4, %lpad2, %catch.dispatch, %lpad
  tail call void @__CxxFrameHandler3(%ehfuncinfo* @"\01__ehfuncinfo$test4@@YAHXZ") noreturn
  unreachable

lpad:                                             ; preds = %after.seh.init
  %13 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
          catch { i8**, i32, [8 x i8] }* @"\01??_R0?AUC@@@8"
  switch i32 %13, label %catch.dispatch [
    i32 -2, label %"\01__ehhandler$test4@@YAHXZ"
  ]

catch.dispatch:                                   ; preds = %lpad
  %14 = load i32* %try.id
  switch i32 %14, label %"\01__ehhandler$test4@@YAHXZ" [
    i32 0, label %catch
    i32 -1, label %catch.dispatch7
  ]

catch:                                            ; preds = %catch.dispatch
  call void @llvm.seh.reserve.stack()
  store i32 809, i32* %a, align 4
  store i32 0, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test4@@YAHXZ", %try.cont))
  br label %try.cont

try.cont:                                         ; preds = %catch, %invoke.cont
  store i32 0, i32* %try.id
  store i32 3, i32* %try.id
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont3 unwind label %lpad2

invoke.cont3:                                     ; preds = %try.cont
  br label %try.cont5

lpad2:                                            ; preds = %try.cont
  %15 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
          catch { i8**, i32, [8 x i8] }* @"\01??_R0?AUC@@@8"
  switch i32 %15, label %catch.dispatch4 [
    i32 -2, label %"\01__ehhandler$test4@@YAHXZ"
  ]

catch.dispatch4:                                  ; preds = %lpad2
  %16 = load i32* %try.id
  switch i32 %16, label %"\01__ehhandler$test4@@YAHXZ" [
    i32 0, label %catch6
    i32 -1, label %catch.dispatch7
  ]

catch.dispatch7:                                  ; preds = %catch.dispatch4, %catch.dispatch
  %17 = load i32* %try.id
  switch i32 %17, label %"\01__ehhandler$test4@@YAHXZ" [
    i32 0, label %catch9
    i32 -1, label %eh.resume
  ]

catch9:                                           ; preds = %catch.dispatch7
  call void @llvm.seh.reserve.stack()
  store i32 -1, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test4@@YAHXZ", %try.cont8))
  br label %try.cont8

catch6:                                           ; preds = %catch.dispatch4
  call void @llvm.seh.reserve.stack()
  store i32 98, i32* %a, align 4
  store i32 0, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test4@@YAHXZ", %try.cont5))
  br label %try.cont5

try.cont5:                                        ; preds = %catch6, %invoke.cont3
  store i32 0, i32* %try.id
  br label %try.cont8

try.cont8:                                        ; preds = %try.cont5, %catch9
  store i32 -1, i32* %try.id
  ret i32 0

eh.resume:                                        ; preds = %catch.dispatch7
  resume i8* null
}

define i32 @"\01?test5@@YAHXZ"() {
entry:
  %ad = alloca %struct.C, align 1
  %fl = alloca %struct.C, align 1
  %a = alloca %struct.A, align 1
  %b = alloca %struct.A, align 1
  %0 = alloca i32*, align 4
  %gl = alloca %struct.C, align 1
  %h = alloca %struct.B, align 1
  %gh = alloca %struct.B, align 1
  %1 = alloca i32*, align 4
  %2 = alloca i32*, align 4
  call void @llvm.seh.esp.save()
  br label %seh.init.block

seh.init.block:                                   ; preds = %entry
  %3 = call i8* @llvm.frameaddress(i32 0)
  %4 = ptrtoint i8* %3 to i32
  %5 = ptrtoint i32** %0 to i32
  %6 = sub i32 %5, %4
  store i32 %6, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test5@@YAHXZ$0", i32 0, i32 0, i32 2)
  %7 = ptrtoint i32** %1 to i32
  %8 = sub i32 %7, %4
  store i32 %8, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test5@@YAHXZ$1", i32 0, i32 0, i32 2)
  %9 = ptrtoint i32** %2 to i32
  %10 = sub i32 %9, %4
  store i32 %10, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test5@@YAHXZ$2", i32 0, i32 0, i32 2)
  br label %after.seh.init

after.seh.init:                                   ; preds = %seh.init.block
  %11 = call i8* @llvm.frameaddress(i32 0)
  %12 = getelementptr i8* %11, i32 -4
  %try.id = bitcast i8* %12 to i32*
  store i32 0, i32* %try.id
  call void @llvm.seh.esp.save()
  store i32 1, i32* %try.id
  %call = invoke x86_thiscallcc %struct.A* @"\01??0A@@QAE@XZ"(%struct.A* %a)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %after.seh.init
  store i32 2, i32* %try.id
  %call3 = invoke x86_thiscallcc %struct.A* @"\01??0A@@QAE@XZ"(%struct.A* %b)
          to label %invoke.cont2 unwind label %lpad1

invoke.cont2:                                     ; preds = %invoke.cont
  store i32 3, i32* %try.id
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont5 unwind label %lpad4

invoke.cont5:                                     ; preds = %invoke.cont2
  invoke x86_thiscallcc void @"\01??1A@@QAE@XZ"(%struct.A* %b)
          to label %invoke.cont6 unwind label %lpad1

invoke.cont6:                                     ; preds = %invoke.cont5
  store i32 2, i32* %try.id
  invoke x86_thiscallcc void @"\01??1A@@QAE@XZ"(%struct.A* %a)
          to label %invoke.cont8 unwind label %lpad

invoke.cont8:                                     ; preds = %invoke.cont6
  store i32 1, i32* %try.id
  br label %try.cont

"\01__ehhandler$test5@@YAHXZ":                    ; preds = %catch.dispatch28, %catch.dispatch25, %lpad17, %lpad14, %lpad11, %catch.dispatch, %lpad4, %lpad1, %lpad
  tail call void @__CxxFrameHandler3(%ehfuncinfo* @"\01__ehfuncinfo$test5@@YAHXZ") noreturn
  unreachable

lpad:                                             ; preds = %invoke.cont6, %after.seh.init
  %13 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %13, label %catch.dispatch [
    i32 -2, label %"\01__ehhandler$test5@@YAHXZ"
  ]

lpad1:                                            ; preds = %invoke.cont5, %invoke.cont
  %14 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %14, label %ehcleanup9 [
    i32 -2, label %"\01__ehhandler$test5@@YAHXZ"
  ]

lpad4:                                            ; preds = %invoke.cont2
  %15 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %15, label %ehcleanup [
    i32 -2, label %"\01__ehhandler$test5@@YAHXZ"
  ]

ehcleanup:                                        ; preds = %lpad4
  invoke x86_thiscallcc void @"\01??1A@@QAE@XZ"(%struct.A* %b)
          to label %invoke.cont7 unwind label %terminate.lpad

invoke.cont7:                                     ; preds = %ehcleanup
  call void @llvm.seh.ret()
  br label %ehcleanup9

ehcleanup9:                                       ; preds = %invoke.cont7, %lpad1
  invoke x86_thiscallcc void @"\01??1A@@QAE@XZ"(%struct.A* %a)
          to label %invoke.cont10 unwind label %terminate.lpad

invoke.cont10:                                    ; preds = %ehcleanup9
  call void @llvm.seh.ret()
  br label %catch.dispatch

catch.dispatch:                                   ; preds = %invoke.cont10, %lpad
  %16 = load i32* %try.id
  switch i32 %16, label %"\01__ehhandler$test5@@YAHXZ" [
    i32 0, label %catch
    i32 -1, label %catch.dispatch28
  ]

catch:                                            ; preds = %catch.dispatch
  call void @llvm.seh.reserve.stack()
  store i32 0, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test5@@YAHXZ", %try.cont))
  br label %try.cont

try.cont:                                         ; preds = %catch, %invoke.cont8
  store i32 0, i32* %try.id
  store i32 5, i32* %try.id
  %call13 = invoke x86_thiscallcc %struct.B* @"\01??0B@@QAE@XZ"(%struct.B* %h)
          to label %invoke.cont12 unwind label %lpad11

invoke.cont12:                                    ; preds = %try.cont
  store i32 6, i32* %try.id
  %call16 = invoke x86_thiscallcc %struct.B* @"\01??0B@@QAE@XZ"(%struct.B* %gh)
          to label %invoke.cont15 unwind label %lpad14

invoke.cont15:                                    ; preds = %invoke.cont12
  store i32 7, i32* %try.id
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont18 unwind label %lpad17

invoke.cont18:                                    ; preds = %invoke.cont15
  invoke x86_thiscallcc void @"\01??1B@@QAE@XZ"(%struct.B* %gh)
          to label %invoke.cont19 unwind label %lpad14

invoke.cont19:                                    ; preds = %invoke.cont18
  store i32 6, i32* %try.id
  invoke x86_thiscallcc void @"\01??1B@@QAE@XZ"(%struct.B* %h)
          to label %invoke.cont22 unwind label %lpad11

invoke.cont22:                                    ; preds = %invoke.cont19
  store i32 5, i32* %try.id
  br label %try.cont26

lpad11:                                           ; preds = %invoke.cont19, %try.cont
  %17 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %17, label %catch.dispatch25 [
    i32 -2, label %"\01__ehhandler$test5@@YAHXZ"
  ]

lpad14:                                           ; preds = %invoke.cont18, %invoke.cont12
  %18 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %18, label %ehcleanup23 [
    i32 -2, label %"\01__ehhandler$test5@@YAHXZ"
  ]

lpad17:                                           ; preds = %invoke.cont15
  %19 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %19, label %ehcleanup20 [
    i32 -2, label %"\01__ehhandler$test5@@YAHXZ"
  ]

ehcleanup20:                                      ; preds = %lpad17
  invoke x86_thiscallcc void @"\01??1B@@QAE@XZ"(%struct.B* %gh)
          to label %invoke.cont21 unwind label %terminate.lpad

invoke.cont21:                                    ; preds = %ehcleanup20
  call void @llvm.seh.ret()
  br label %ehcleanup23

ehcleanup23:                                      ; preds = %invoke.cont21, %lpad14
  invoke x86_thiscallcc void @"\01??1B@@QAE@XZ"(%struct.B* %h)
          to label %invoke.cont24 unwind label %terminate.lpad

invoke.cont24:                                    ; preds = %ehcleanup23
  call void @llvm.seh.ret()
  br label %catch.dispatch25

catch.dispatch25:                                 ; preds = %invoke.cont24, %lpad11
  %20 = load i32* %try.id
  switch i32 %20, label %"\01__ehhandler$test5@@YAHXZ" [
    i32 0, label %catch27
    i32 -1, label %catch.dispatch28
  ]

catch.dispatch28:                                 ; preds = %catch.dispatch25, %catch.dispatch
  %21 = load i32* %try.id
  switch i32 %21, label %"\01__ehhandler$test5@@YAHXZ" [
    i32 0, label %catch30
    i32 -1, label %eh.resume
  ]

catch30:                                          ; preds = %catch.dispatch28
  call void @llvm.seh.reserve.stack()
  store i32 -1, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test5@@YAHXZ", %try.cont29))
  br label %try.cont29

catch27:                                          ; preds = %catch.dispatch25
  call void @llvm.seh.reserve.stack()
  store i32 0, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test5@@YAHXZ", %try.cont26))
  br label %try.cont26

try.cont26:                                       ; preds = %catch27, %invoke.cont22
  store i32 0, i32* %try.id
  br label %try.cont29

try.cont29:                                       ; preds = %try.cont26, %catch30
  store i32 -1, i32* %try.id
  ret i32 0

eh.resume:                                        ; preds = %catch.dispatch28
  resume i8* null

terminate.lpad:                                   ; preds = %ehcleanup23, %ehcleanup20, %ehcleanup9, %ehcleanup
  %22 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  unreachable
}

define linkonce_odr x86_thiscallcc %struct.B* @"\01??0B@@QAE@XZ"(%struct.B* %this) unnamed_addr nounwind align 2 {
entry:
  %this.addr = alloca %struct.B*, align 4
  store %struct.B* %this, %struct.B** %this.addr, align 4
  %this1 = load %struct.B** %this.addr
  ret %struct.B* %this1
}

define linkonce_odr x86_thiscallcc void @"\01??1B@@QAE@XZ"(%struct.B* %this) unnamed_addr nounwind align 2 {
entry:
  %this.addr = alloca %struct.B*, align 4
  store %struct.B* %this, %struct.B** %this.addr, align 4
  %this1 = load %struct.B** %this.addr
  ret void
}

define i32 @"\01?test6@@YAHXZ"() {
entry:
  %ad = alloca %struct.C, align 1
  %ghj = alloca %struct.B, align 1
  %fl = alloca %struct.C, align 1
  %a = alloca %struct.A, align 1
  %b = alloca %struct.A, align 1
  %0 = alloca i32*, align 4
  %sd = alloca %struct.A, align 1
  %1 = alloca i32*, align 4
  %j = alloca %struct.B, align 1
  %gl = alloca %struct.C, align 1
  %h = alloca %struct.B, align 1
  %gh = alloca %struct.B, align 1
  %2 = alloca i32*, align 4
  %3 = alloca i32*, align 4
  %a47 = alloca %struct.C, align 1
  %cleanup.dest.slot = alloca i32
  call void @llvm.seh.esp.save()
  br label %seh.init.block

seh.init.block:                                   ; preds = %entry
  %4 = call i8* @llvm.frameaddress(i32 0)
  %5 = ptrtoint i8* %4 to i32
  %6 = ptrtoint i32** %0 to i32
  %7 = sub i32 %6, %5
  store i32 %7, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test6@@YAHXZ$1", i32 0, i32 0, i32 2)
  %8 = ptrtoint i32** %1 to i32
  %9 = sub i32 %8, %5
  store i32 %9, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test6@@YAHXZ$0", i32 0, i32 0, i32 2)
  %10 = ptrtoint i32** %2 to i32
  %11 = sub i32 %10, %5
  store i32 %11, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test6@@YAHXZ$2", i32 0, i32 0, i32 2)
  %12 = ptrtoint i32** %3 to i32
  %13 = sub i32 %12, %5
  store i32 %13, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test6@@YAHXZ$3", i32 0, i32 0, i32 2)
  br label %after.seh.init

after.seh.init:                                   ; preds = %seh.init.block
  %call = call x86_thiscallcc %struct.B* @"\01??0B@@QAE@XZ"(%struct.B* %ghj)
  %14 = call i8* @llvm.frameaddress(i32 0)
  %15 = getelementptr i8* %14, i32 -4
  %try.id = bitcast i8* %15 to i32*
  store i32 0, i32* %try.id
  store i32 1, i32* %try.id
  call void @llvm.seh.esp.save()
  store i32 2, i32* %try.id
  %call1 = invoke x86_thiscallcc %struct.A* @"\01??0A@@QAE@XZ"(%struct.A* %a)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %after.seh.init
  store i32 3, i32* %try.id
  %call4 = invoke x86_thiscallcc %struct.A* @"\01??0A@@QAE@XZ"(%struct.A* %b)
          to label %invoke.cont3 unwind label %lpad2

invoke.cont3:                                     ; preds = %invoke.cont
  store i32 4, i32* %try.id
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont6 unwind label %lpad5

invoke.cont6:                                     ; preds = %invoke.cont3
  invoke x86_thiscallcc void @"\01??1A@@QAE@XZ"(%struct.A* %b)
          to label %invoke.cont7 unwind label %lpad2

invoke.cont7:                                     ; preds = %invoke.cont6
  store i32 3, i32* %try.id
  invoke x86_thiscallcc void @"\01??1A@@QAE@XZ"(%struct.A* %a)
          to label %invoke.cont9 unwind label %lpad

invoke.cont9:                                     ; preds = %invoke.cont7
  store i32 2, i32* %try.id
  br label %try.cont

"\01__ehhandler$test6@@YAHXZ":                    ; preds = %catch.dispatch44, %catch.dispatch41, %lpad33, %lpad30, %lpad27, %lpad20, %catch.dispatch17, %lpad15, %lpad12, %catch.dispatch, %lpad5, %lpad2, %lpad
  tail call void @__CxxFrameHandler3(%ehfuncinfo* @"\01__ehfuncinfo$test6@@YAHXZ") noreturn
  unreachable

lpad:                                             ; preds = %invoke.cont7, %after.seh.init
  %16 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %16, label %catch.dispatch [
    i32 -2, label %"\01__ehhandler$test6@@YAHXZ"
  ]

lpad2:                                            ; preds = %invoke.cont6, %invoke.cont
  %17 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %17, label %ehcleanup10 [
    i32 -2, label %"\01__ehhandler$test6@@YAHXZ"
  ]

lpad5:                                            ; preds = %invoke.cont3
  %18 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %18, label %ehcleanup [
    i32 -2, label %"\01__ehhandler$test6@@YAHXZ"
  ]

ehcleanup:                                        ; preds = %lpad5
  invoke x86_thiscallcc void @"\01??1A@@QAE@XZ"(%struct.A* %b)
          to label %invoke.cont8 unwind label %terminate.lpad

invoke.cont8:                                     ; preds = %ehcleanup
  call void @llvm.seh.ret()
  br label %ehcleanup10

ehcleanup10:                                      ; preds = %invoke.cont8, %lpad2
  invoke x86_thiscallcc void @"\01??1A@@QAE@XZ"(%struct.A* %a)
          to label %invoke.cont11 unwind label %terminate.lpad

invoke.cont11:                                    ; preds = %ehcleanup10
  call void @llvm.seh.ret()
  br label %catch.dispatch

catch.dispatch:                                   ; preds = %invoke.cont11, %lpad
  %19 = load i32* %try.id
  switch i32 %19, label %"\01__ehhandler$test6@@YAHXZ" [
    i32 0, label %catch
    i32 -1, label %catch.dispatch44
  ]

catch:                                            ; preds = %catch.dispatch
  call void @llvm.seh.reserve.stack()
  call void @llvm.seh.esp.save()
  %call14 = invoke x86_thiscallcc %struct.A* @"\01??0A@@QAE@XZ"(%struct.A* %sd)
          to label %invoke.cont13 unwind label %lpad12

invoke.cont13:                                    ; preds = %catch
  store i32 6, i32* %try.id
  store i32 7, i32* %try.id
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont16 unwind label %lpad15

invoke.cont16:                                    ; preds = %invoke.cont13
  br label %try.cont18

try.cont:                                         ; preds = %invoke.cont24, %invoke.cont9
  store i32 1, i32* %try.id
  store i32 10, i32* %try.id
  %call29 = invoke x86_thiscallcc %struct.B* @"\01??0B@@QAE@XZ"(%struct.B* %h)
          to label %invoke.cont28 unwind label %lpad27

invoke.cont28:                                    ; preds = %try.cont
  store i32 11, i32* %try.id
  %call32 = invoke x86_thiscallcc %struct.B* @"\01??0B@@QAE@XZ"(%struct.B* %gh)
          to label %invoke.cont31 unwind label %lpad30

invoke.cont31:                                    ; preds = %invoke.cont28
  store i32 12, i32* %try.id
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont34 unwind label %lpad33

invoke.cont34:                                    ; preds = %invoke.cont31
  invoke x86_thiscallcc void @"\01??1B@@QAE@XZ"(%struct.B* %gh)
          to label %invoke.cont35 unwind label %lpad30

invoke.cont35:                                    ; preds = %invoke.cont34
  store i32 11, i32* %try.id
  invoke x86_thiscallcc void @"\01??1B@@QAE@XZ"(%struct.B* %h)
          to label %invoke.cont38 unwind label %lpad27

invoke.cont38:                                    ; preds = %invoke.cont35
  store i32 10, i32* %try.id
  br label %try.cont42

lpad12:                                           ; preds = %invoke.cont23, %catch
  %20 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %20, label %catch.dispatch44 [
    i32 -2, label %"\01__ehhandler$test6@@YAHXZ"
  ]

lpad15:                                           ; preds = %invoke.cont13
  %21 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %21, label %catch.dispatch17 [
    i32 -2, label %"\01__ehhandler$test6@@YAHXZ"
  ]

catch.dispatch17:                                 ; preds = %lpad15
  %22 = load i32* %try.id
  switch i32 %22, label %"\01__ehhandler$test6@@YAHXZ" [
    i32 0, label %catch19
    i32 -1, label %ehcleanup25
  ]

catch19:                                          ; preds = %catch.dispatch17
  call void @llvm.seh.reserve.stack()
  store i32 6, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test6@@YAHXZ", %try.cont18))
  br label %try.cont18

try.cont18:                                       ; preds = %catch19, %invoke.cont16
  store i32 6, i32* %try.id
  %call22 = invoke x86_thiscallcc %struct.B* @"\01??0B@@QAE@XZ"(%struct.B* %j)
          to label %invoke.cont21 unwind label %lpad20

invoke.cont21:                                    ; preds = %try.cont18
  store i32 9, i32* %try.id
  invoke x86_thiscallcc void @"\01??1B@@QAE@XZ"(%struct.B* %j)
          to label %invoke.cont23 unwind label %lpad20

invoke.cont23:                                    ; preds = %invoke.cont21
  store i32 6, i32* %try.id
  invoke x86_thiscallcc void @"\01??1A@@QAE@XZ"(%struct.A* %sd)
          to label %invoke.cont24 unwind label %lpad12

invoke.cont24:                                    ; preds = %invoke.cont23
  store i32 5, i32* %try.id
  store i32 1, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test6@@YAHXZ", %try.cont))
  br label %try.cont

lpad20:                                           ; preds = %invoke.cont21, %try.cont18
  %23 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %23, label %ehcleanup25 [
    i32 -2, label %"\01__ehhandler$test6@@YAHXZ"
  ]

ehcleanup25:                                      ; preds = %lpad20, %catch.dispatch17
  invoke x86_thiscallcc void @"\01??1A@@QAE@XZ"(%struct.A* %sd)
          to label %invoke.cont26 unwind label %terminate.lpad

invoke.cont26:                                    ; preds = %ehcleanup25
  call void @llvm.seh.ret()
  br label %catch.dispatch44

lpad27:                                           ; preds = %invoke.cont35, %try.cont
  %24 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %24, label %catch.dispatch41 [
    i32 -2, label %"\01__ehhandler$test6@@YAHXZ"
  ]

lpad30:                                           ; preds = %invoke.cont34, %invoke.cont28
  %25 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %25, label %ehcleanup39 [
    i32 -2, label %"\01__ehhandler$test6@@YAHXZ"
  ]

lpad33:                                           ; preds = %invoke.cont31
  %26 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %26, label %ehcleanup36 [
    i32 -2, label %"\01__ehhandler$test6@@YAHXZ"
  ]

ehcleanup36:                                      ; preds = %lpad33
  invoke x86_thiscallcc void @"\01??1B@@QAE@XZ"(%struct.B* %gh)
          to label %invoke.cont37 unwind label %terminate.lpad

invoke.cont37:                                    ; preds = %ehcleanup36
  call void @llvm.seh.ret()
  br label %ehcleanup39

ehcleanup39:                                      ; preds = %invoke.cont37, %lpad30
  invoke x86_thiscallcc void @"\01??1B@@QAE@XZ"(%struct.B* %h)
          to label %invoke.cont40 unwind label %terminate.lpad

invoke.cont40:                                    ; preds = %ehcleanup39
  call void @llvm.seh.ret()
  br label %catch.dispatch41

catch.dispatch41:                                 ; preds = %invoke.cont40, %lpad27
  %27 = load i32* %try.id
  switch i32 %27, label %"\01__ehhandler$test6@@YAHXZ" [
    i32 0, label %catch43
    i32 -1, label %catch.dispatch44
  ]

catch.dispatch44:                                 ; preds = %catch.dispatch41, %invoke.cont26, %lpad12, %catch.dispatch
  %28 = load i32* %try.id
  switch i32 %28, label %"\01__ehhandler$test6@@YAHXZ" [
    i32 0, label %catch46
    i32 -1, label %ehcleanup48
  ]

catch46:                                          ; preds = %catch.dispatch44
  call void @llvm.seh.reserve.stack()
  store i32 0, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test6@@YAHXZ", %try.cont45))
  br label %try.cont45

catch43:                                          ; preds = %catch.dispatch41
  call void @llvm.seh.reserve.stack()
  store i32 1, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test6@@YAHXZ", %try.cont42))
  br label %try.cont42

try.cont42:                                       ; preds = %catch43, %invoke.cont38
  store i32 1, i32* %try.id
  br label %try.cont45

try.cont45:                                       ; preds = %try.cont42, %catch46
  store i32 0, i32* %try.id
  store i32 1, i32* %cleanup.dest.slot
  br label %cleanup

cleanup:                                          ; preds = %try.cont45
  call x86_thiscallcc void @"\01??1B@@QAE@XZ"(%struct.B* %ghj)
  store i32 -1, i32* %try.id
  ret i32 0

ehcleanup48:                                      ; preds = %catch.dispatch44
  invoke x86_thiscallcc void @"\01??1B@@QAE@XZ"(%struct.B* %ghj)
          to label %invoke.cont49 unwind label %terminate.lpad

invoke.cont49:                                    ; preds = %ehcleanup48
  call void @llvm.seh.ret()
  br label %eh.resume

eh.resume:                                        ; preds = %invoke.cont49
  resume i8* null

terminate.lpad:                                   ; preds = %ehcleanup48, %ehcleanup39, %ehcleanup36, %ehcleanup25, %ehcleanup10, %ehcleanup
  %29 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  unreachable
}

define i32 @"\01?test7@@YAHXZ"() {
entry:
  %0 = alloca %struct.A*, align 4
  call void @llvm.seh.esp.save()
  br label %seh.init.block

seh.init.block:                                   ; preds = %entry
  %1 = call i8* @llvm.frameaddress(i32 0)
  %2 = ptrtoint i8* %1 to i32
  %3 = ptrtoint %struct.A** %0 to i32
  %4 = sub i32 %3, %2
  store i32 %4, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test7@@YAHXZ$0", i32 0, i32 0, i32 2)
  br label %after.seh.init

after.seh.init:                                   ; preds = %seh.init.block
  %5 = call i8* @llvm.frameaddress(i32 0)
  %6 = getelementptr i8* %5, i32 -4
  %try.id = bitcast i8* %6 to i32*
  store i32 0, i32* %try.id
  invoke void @"\01?sa@@YAXXZ"()
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %after.seh.init
  br label %try.cont

"\01__ehhandler$test7@@YAHXZ":                    ; preds = %catch.dispatch, %lpad
  tail call void @__CxxFrameHandler3(%ehfuncinfo* @"\01__ehfuncinfo$test7@@YAHXZ") noreturn
  unreachable

lpad:                                             ; preds = %after.seh.init
  %7 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [8 x i8] }* @"\01??_R0?AUA@@@8"
  switch i32 %7, label %catch.dispatch [
    i32 -2, label %"\01__ehhandler$test7@@YAHXZ"
  ]

catch.dispatch:                                   ; preds = %lpad
  %8 = load i32* %try.id
  switch i32 %8, label %"\01__ehhandler$test7@@YAHXZ" [
    i32 0, label %catch
    i32 -1, label %eh.resume
  ]

catch:                                            ; preds = %catch.dispatch
  call void @llvm.seh.reserve.stack()
  store i32 -1, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test7@@YAHXZ", %try.cont))
  br label %try.cont

try.cont:                                         ; preds = %catch, %invoke.cont
  store i32 -1, i32* %try.id
  ret i32 0

eh.resume:                                        ; preds = %catch.dispatch
  resume i8* null
}

define i32 @"\01?test8@@YAHXZ"() {
entry:
  %0 = alloca %struct.D*, align 4
  call void @llvm.seh.esp.save()
  br label %seh.init.block

seh.init.block:                                   ; preds = %entry
  %1 = call i8* @llvm.frameaddress(i32 0)
  %2 = ptrtoint i8* %1 to i32
  %3 = ptrtoint %struct.D** %0 to i32
  %4 = sub i32 %3, %2
  store i32 %4, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test8@@YAHXZ$0", i32 0, i32 0, i32 2)
  br label %after.seh.init

after.seh.init:                                   ; preds = %seh.init.block
  %5 = call i8* @llvm.frameaddress(i32 0)
  %6 = getelementptr i8* %5, i32 -4
  %try.id = bitcast i8* %6 to i32*
  store i32 0, i32* %try.id
  %throw.object = alloca %struct.D
  %7 = bitcast %struct.D* %throw.object to i8*
  invoke x86_stdcallcc void @_CxxThrowException(i8* %7, %throw.info.type* @"\01__TI1?AUD@@")
          to label %8 unwind label %lpad

"\01__ehhandler$test8@@YAHXZ":                    ; preds = %catch.dispatch, %lpad
  tail call void @__CxxFrameHandler3(%ehfuncinfo* @"\01__ehfuncinfo$test8@@YAHXZ") noreturn
  unreachable

; <label>:8                                       ; preds = %after.seh.init
  br label %try.cont

lpad:                                             ; preds = %after.seh.init
  %9 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [8 x i8] }* @"\01??_R0?AUD@@@8"
  switch i32 %9, label %catch.dispatch [
    i32 -2, label %"\01__ehhandler$test8@@YAHXZ"
  ]

catch.dispatch:                                   ; preds = %lpad
  %10 = load i32* %try.id
  switch i32 %10, label %"\01__ehhandler$test8@@YAHXZ" [
    i32 0, label %catch
    i32 -1, label %eh.resume
  ]

catch:                                            ; preds = %catch.dispatch
  call void @llvm.seh.reserve.stack()
  store i32 -1, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test8@@YAHXZ", %try.cont))
  br label %try.cont

try.cont:                                         ; preds = %catch, %8
  store i32 -1, i32* %try.id
  ret i32 0

eh.resume:                                        ; preds = %catch.dispatch
  resume i8* null
}

define linkonce_odr x86_thiscallcc void @"\01??1D@@QAE@XZ"(%struct.D* %this) unnamed_addr nounwind align 2 {
entry:
  %this.addr = alloca %struct.D*, align 4
  store %struct.D* %this, %struct.D** %this.addr, align 4
  %this1 = load %struct.D** %this.addr
  ret void
}

define i32 @"\01?test9@@YAHXZ"() {
entry:
  %a = alloca %struct.D, align 1
  %0 = alloca %struct.D*, align 4
  call void @llvm.seh.esp.save()
  br label %seh.init.block

seh.init.block:                                   ; preds = %entry
  %1 = call i8* @llvm.frameaddress(i32 0)
  %2 = ptrtoint i8* %1 to i32
  %3 = ptrtoint %struct.D** %0 to i32
  %4 = sub i32 %3, %2
  store i32 %4, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test9@@YAHXZ$0", i32 0, i32 0, i32 2)
  br label %after.seh.init

after.seh.init:                                   ; preds = %seh.init.block
  %5 = call i8* @llvm.frameaddress(i32 0)
  %6 = getelementptr i8* %5, i32 -4
  %try.id = bitcast i8* %6 to i32*
  store i32 0, i32* %try.id
  store i32 1, i32* %try.id
  %throw.object = alloca %struct.D
  %7 = bitcast %struct.D* %throw.object to i8*
  invoke x86_stdcallcc void @_CxxThrowException(i8* %7, %throw.info.type* @"\01__TI1?AUD@@")
          to label %8 unwind label %lpad

"\01__ehhandler$test9@@YAHXZ":                    ; preds = %catch.dispatch, %lpad1, %lpad
  tail call void @__CxxFrameHandler3(%ehfuncinfo* @"\01__ehfuncinfo$test9@@YAHXZ") noreturn
  unreachable

; <label>:8                                       ; preds = %after.seh.init
  invoke x86_thiscallcc void @"\01??1D@@QAE@XZ"(%struct.D* %a)
          to label %invoke.cont unwind label %lpad1

invoke.cont:                                      ; preds = %8
  store i32 0, i32* %try.id
  br label %try.cont

lpad:                                             ; preds = %after.seh.init
  %9 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [8 x i8] }* @"\01??_R0?AUD@@@8"
  switch i32 %9, label %ehcleanup [
    i32 -2, label %"\01__ehhandler$test9@@YAHXZ"
  ]

lpad1:                                            ; preds = %8
  %10 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [8 x i8] }* @"\01??_R0?AUD@@@8"
  switch i32 %10, label %catch.dispatch [
    i32 -2, label %"\01__ehhandler$test9@@YAHXZ"
  ]

ehcleanup:                                        ; preds = %lpad
  invoke x86_thiscallcc void @"\01??1D@@QAE@XZ"(%struct.D* %a)
          to label %invoke.cont2 unwind label %terminate.lpad

invoke.cont2:                                     ; preds = %ehcleanup
  call void @llvm.seh.ret()
  br label %catch.dispatch

catch.dispatch:                                   ; preds = %invoke.cont2, %lpad1
  %11 = load i32* %try.id
  switch i32 %11, label %"\01__ehhandler$test9@@YAHXZ" [
    i32 0, label %catch
    i32 -1, label %eh.resume
  ]

catch:                                            ; preds = %catch.dispatch
  call void @llvm.seh.reserve.stack()
  store i32 -1, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test9@@YAHXZ", %try.cont))
  br label %try.cont

try.cont:                                         ; preds = %catch, %invoke.cont
  store i32 -1, i32* %try.id
  ret i32 0

eh.resume:                                        ; preds = %catch.dispatch
  resume i8* null

terminate.lpad:                                   ; preds = %ehcleanup
  %12 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  unreachable
}

define i32 @"\01?test10@@YAHXZ"() {
entry:
  %u = alloca i32, align 4
  %uga2 = alloca i32*, align 4
  %u11 = alloca i32, align 4
  call void @llvm.seh.esp.save()
  br label %seh.init.block

seh.init.block:                                   ; preds = %entry
  %0 = call i8* @llvm.frameaddress(i32 0)
  %1 = ptrtoint i8* %0 to i32
  %2 = ptrtoint i32* %u to i32
  %3 = sub i32 %2, %1
  store i32 %3, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test10@@YAHXZ$0", i32 0, i32 0, i32 2)
  %4 = ptrtoint i32** %uga2 to i32
  %5 = sub i32 %4, %1
  store i32 %5, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test10@@YAHXZ$2", i32 0, i32 0, i32 2)
  %6 = ptrtoint i32* %u11 to i32
  %7 = sub i32 %6, %1
  store i32 %7, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test10@@YAHXZ$1", i32 0, i32 0, i32 2)
  br label %after.seh.init

after.seh.init:                                   ; preds = %seh.init.block
  %8 = call i8* @llvm.frameaddress(i32 0)
  %9 = getelementptr i8* %8, i32 -4
  %try.id = bitcast i8* %9 to i32*
  store i32 0, i32* %try.id
  call void @llvm.seh.esp.save()
  store i32 1, i32* %try.id
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %after.seh.init
  br label %try.cont

"\01__ehhandler$test10@@YAHXZ":                   ; preds = %catch.dispatch8, %lpad6, %catch.dispatch3, %lpad1, %catch.dispatch, %lpad
  tail call void @__CxxFrameHandler3(%ehfuncinfo* @"\01__ehfuncinfo$test10@@YAHXZ") noreturn
  unreachable

lpad:                                             ; preds = %after.seh.init
  %10 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %10, label %catch.dispatch [
    i32 -2, label %"\01__ehhandler$test10@@YAHXZ"
  ]

catch.dispatch:                                   ; preds = %lpad
  %11 = load i32* %try.id
  switch i32 %11, label %"\01__ehhandler$test10@@YAHXZ" [
    i32 0, label %catch
    i32 -1, label %catch.dispatch3
  ]

catch:                                            ; preds = %catch.dispatch
  call void @llvm.seh.reserve.stack()
  store i32 0, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test10@@YAHXZ", %try.cont))
  br label %try.cont

try.cont:                                         ; preds = %catch, %invoke.cont
  store i32 0, i32* %try.id
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont2 unwind label %lpad1

invoke.cont2:                                     ; preds = %try.cont
  br label %try.cont4

lpad1:                                            ; preds = %try.cont
  %12 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %12, label %catch.dispatch3 [
    i32 -2, label %"\01__ehhandler$test10@@YAHXZ"
  ]

catch.dispatch3:                                  ; preds = %lpad1, %catch.dispatch
  %13 = load i32* %try.id
  switch i32 %13, label %"\01__ehhandler$test10@@YAHXZ" [
    i32 0, label %catch5
    i32 -1, label %eh.resume
  ]

catch5:                                           ; preds = %catch.dispatch3
  call void @llvm.seh.reserve.stack()
  call void @llvm.seh.esp.save()
  store i32 4, i32* %try.id
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont7 unwind label %lpad6

invoke.cont7:                                     ; preds = %catch5
  br label %try.cont9

try.cont4:                                        ; preds = %try.cont9, %invoke.cont2
  store i32 -1, i32* %try.id
  ret i32 0

lpad6:                                            ; preds = %catch5
  %14 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %14, label %catch.dispatch8 [
    i32 -2, label %"\01__ehhandler$test10@@YAHXZ"
  ]

catch.dispatch8:                                  ; preds = %lpad6
  %15 = load i32* %try.id
  switch i32 %15, label %"\01__ehhandler$test10@@YAHXZ" [
    i32 0, label %catch10
    i32 -1, label %eh.resume
  ]

catch10:                                          ; preds = %catch.dispatch8
  call void @llvm.seh.reserve.stack()
  store i32 3, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test10@@YAHXZ", %try.cont9))
  br label %try.cont9

try.cont9:                                        ; preds = %catch10, %invoke.cont7
  store i32 -1, i32* %try.id
  store i32 -1, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test10@@YAHXZ", %try.cont4))
  br label %try.cont4

eh.resume:                                        ; preds = %catch.dispatch8, %catch.dispatch3
  resume i8* null
}

define i32 @"\01?test11@@YAHXZ"() {
entry:
  %a = alloca %struct.A, align 1
  %ex = alloca i32*, align 4
  call void @llvm.seh.esp.save()
  br label %seh.init.block

seh.init.block:                                   ; preds = %entry
  %0 = call i8* @llvm.frameaddress(i32 0)
  %1 = ptrtoint i8* %0 to i32
  %2 = ptrtoint i32** %ex to i32
  %3 = sub i32 %2, %1
  store i32 %3, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test11@@YAHXZ$0", i32 0, i32 0, i32 2)
  br label %after.seh.init

after.seh.init:                                   ; preds = %seh.init.block
  %4 = call i8* @llvm.frameaddress(i32 0)
  %5 = getelementptr i8* %4, i32 -4
  %try.id = bitcast i8* %5 to i32*
  store i32 0, i32* %try.id
  %call = invoke x86_thiscallcc %struct.A* @"\01??0A@@QAE@XZ"(%struct.A* %a)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %after.seh.init
  store i32 1, i32* %try.id
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont2 unwind label %lpad1

invoke.cont2:                                     ; preds = %invoke.cont
  invoke x86_thiscallcc void @"\01??1A@@QAE@XZ"(%struct.A* %a)
          to label %invoke.cont3 unwind label %lpad

invoke.cont3:                                     ; preds = %invoke.cont2
  store i32 0, i32* %try.id
  br label %try.cont

"\01__ehhandler$test11@@YAHXZ":                   ; preds = %catch.dispatch, %lpad1, %lpad
  tail call void @__CxxFrameHandler3(%ehfuncinfo* @"\01__ehfuncinfo$test11@@YAHXZ") noreturn
  unreachable

lpad:                                             ; preds = %invoke.cont2, %after.seh.init
  %6 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %6, label %catch.dispatch [
    i32 -2, label %"\01__ehhandler$test11@@YAHXZ"
  ]

lpad1:                                            ; preds = %invoke.cont
  %7 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %7, label %ehcleanup [
    i32 -2, label %"\01__ehhandler$test11@@YAHXZ"
  ]

ehcleanup:                                        ; preds = %lpad1
  invoke x86_thiscallcc void @"\01??1A@@QAE@XZ"(%struct.A* %a)
          to label %invoke.cont4 unwind label %terminate.lpad

invoke.cont4:                                     ; preds = %ehcleanup
  call void @llvm.seh.ret()
  br label %catch.dispatch

catch.dispatch:                                   ; preds = %invoke.cont4, %lpad
  %8 = load i32* %try.id
  switch i32 %8, label %"\01__ehhandler$test11@@YAHXZ" [
    i32 0, label %catch
    i32 -1, label %eh.resume
  ]

catch:                                            ; preds = %catch.dispatch
  call void @llvm.seh.reserve.stack()
  store i32 -1, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test11@@YAHXZ", %try.cont))
  br label %try.cont

try.cont:                                         ; preds = %catch, %invoke.cont3
  store i32 -1, i32* %try.id
  ret i32 0

eh.resume:                                        ; preds = %catch.dispatch
  resume i8* null

terminate.lpad:                                   ; preds = %ehcleanup
  %9 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  unreachable
}

define i32 @"\01?test12@@YAHXZ"() {
entry:
  %uga2 = alloca i32*, align 4
  %b = alloca %struct.B, align 1
  %u = alloca i32, align 4
  call void @llvm.seh.esp.save()
  br label %seh.init.block

seh.init.block:                                   ; preds = %entry
  %0 = call i8* @llvm.frameaddress(i32 0)
  %1 = ptrtoint i8* %0 to i32
  %2 = ptrtoint i32** %uga2 to i32
  %3 = sub i32 %2, %1
  store i32 %3, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test12@@YAHXZ$1", i32 0, i32 0, i32 2)
  %4 = ptrtoint i32* %u to i32
  %5 = sub i32 %4, %1
  store i32 %5, i32* getelementptr inbounds ([1 x %handler.type]* @"\01__catchsym$test12@@YAHXZ$0", i32 0, i32 0, i32 2)
  br label %after.seh.init

after.seh.init:                                   ; preds = %seh.init.block
  %6 = call i8* @llvm.frameaddress(i32 0)
  %7 = getelementptr i8* %6, i32 -4
  %try.id = bitcast i8* %7 to i32*
  store i32 0, i32* %try.id
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %after.seh.init
  br label %try.cont

"\01__ehhandler$test12@@YAHXZ":                   ; preds = %catch.dispatch7, %lpad3, %lpad1, %catch.dispatch, %lpad
  tail call void @__CxxFrameHandler3(%ehfuncinfo* @"\01__ehfuncinfo$test12@@YAHXZ") noreturn
  unreachable

lpad:                                             ; preds = %after.seh.init
  %8 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %8, label %catch.dispatch [
    i32 -2, label %"\01__ehhandler$test12@@YAHXZ"
  ]

catch.dispatch:                                   ; preds = %lpad
  %9 = load i32* %try.id
  switch i32 %9, label %"\01__ehhandler$test12@@YAHXZ" [
    i32 0, label %catch
    i32 -1, label %eh.resume
  ]

catch:                                            ; preds = %catch.dispatch
  call void @llvm.seh.reserve.stack()
  call void @llvm.seh.esp.save()
  store i32 2, i32* %try.id
  %call = invoke x86_thiscallcc %struct.B* @"\01??0B@@QAE@XZ"(%struct.B* %b)
          to label %invoke.cont2 unwind label %lpad1

invoke.cont2:                                     ; preds = %catch
  store i32 3, i32* %try.id
  invoke void @"\01?s@@YAXXZ"()
          to label %invoke.cont4 unwind label %lpad3

invoke.cont4:                                     ; preds = %invoke.cont2
  invoke x86_thiscallcc void @"\01??1B@@QAE@XZ"(%struct.B* %b)
          to label %invoke.cont5 unwind label %lpad1

invoke.cont5:                                     ; preds = %invoke.cont4
  store i32 2, i32* %try.id
  br label %try.cont8

try.cont:                                         ; preds = %try.cont8, %invoke.cont
  store i32 -1, i32* %try.id
  ret i32 0

lpad1:                                            ; preds = %invoke.cont4, %catch
  %10 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %10, label %catch.dispatch7 [
    i32 -2, label %"\01__ehhandler$test12@@YAHXZ"
  ]

lpad3:                                            ; preds = %invoke.cont2
  %11 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
          catch { i8**, i32, [3 x i8] }* @"\01??_R0H@8"
  switch i32 %11, label %ehcleanup [
    i32 -2, label %"\01__ehhandler$test12@@YAHXZ"
  ]

ehcleanup:                                        ; preds = %lpad3
  invoke x86_thiscallcc void @"\01??1B@@QAE@XZ"(%struct.B* %b)
          to label %invoke.cont6 unwind label %terminate.lpad

invoke.cont6:                                     ; preds = %ehcleanup
  call void @llvm.seh.ret()
  br label %catch.dispatch7

catch.dispatch7:                                  ; preds = %invoke.cont6, %lpad1
  %12 = load i32* %try.id
  switch i32 %12, label %"\01__ehhandler$test12@@YAHXZ" [
    i32 0, label %catch9
    i32 -1, label %eh.resume
  ]

catch9:                                           ; preds = %catch.dispatch7
  call void @llvm.seh.reserve.stack()
  store i32 1, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test12@@YAHXZ", %try.cont8))
  br label %try.cont8

try.cont8:                                        ; preds = %catch9, %invoke.cont5
  store i32 -1, i32* %try.id
  store i32 -1, i32* %try.id
  call void @llvm.seh.free.reserved.stack()
  call void @llvm.seh.save.ret.addr(i8* blockaddress(@"\01?test12@@YAHXZ", %try.cont))
  br label %try.cont

eh.resume:                                        ; preds = %catch.dispatch7, %catch.dispatch
  resume i8* null

terminate.lpad:                                   ; preds = %ehcleanup
  %13 = landingpad i32 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  unreachable
}

; CHECK:     .def   "?s@@YAXXZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .text
; CHECK-NEXT:    .globl  "?s@@YAXXZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "?s@@YAXXZ":                            # @"\01?s@@YAXXZ"
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    sub ESP, 12
; CHECK-NEXT:    lea EAX, DWORD PTR [EBP - 4]
; CHECK-NEXT:    mov DWORD PTR [EBP - 4], 1
; CHECK-NEXT:    mov ECX, ESP
; CHECK-NEXT:    mov DWORD PTR [ECX], EAX
; CHECK-NEXT:    mov DWORD PTR [ECX + 4], __TI1H
; CHECK-NEXT:    call  __CxxThrowException@8
; CHECK-NEXT:    sub ESP, 8
  
; CHECK:     .def   "?sa@@YAXXZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .globl  "?sa@@YAXXZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "?sa@@YAXXZ":                           # @"\01?sa@@YAXXZ"
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    sub ESP, 24
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 8]
; CHECK-NEXT:    call  "??0A@@QAE@XZ"
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 8]
; CHECK-NEXT:    mov EDX, ESP
; CHECK-NEXT:    mov DWORD PTR [EDX], ECX
; CHECK-NEXT:    mov DWORD PTR [EDX + 4], "__TI1?AUA@@"
; CHECK-NEXT:    mov DWORD PTR [EBP - 12], EAX # 4-byte Spill
; CHECK-NEXT:    call  __CxxThrowException@8
; CHECK-NEXT:    sub ESP, 8
  
; CHECK:     .def   "??0A@@QAE@XZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .section  .text$?0A@@QAE@XZ,"xr"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "??0A@@QAE@XZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "??0A@@QAE@XZ":                         # @"\01??0A@@QAE@XZ"
; CHECK-NEXT:   "Lllvm$workaround$fake$stub$??0A@@QAE@XZ":
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR [EBP - 4], ECX
; CHECK-NEXT:    mov EAX, ECX
; CHECK-NEXT:    add ESP, 4
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret
 
; CHECK:     .def   "??1A@@QAE@XZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .section  .text$?1A@@QAE@XZ,"xr"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "??1A@@QAE@XZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "??1A@@QAE@XZ":                         # @"\01??1A@@QAE@XZ"
; CHECK-NEXT:   "Lllvm$workaround$fake$stub$??1A@@QAE@XZ":
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR [EBP - 4], ECX
; CHECK-NEXT:    add ESP, 4
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret
  
; CHECK:     .def   "?test1@@YAHXZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .text
; CHECK-NEXT:    .globl  "?test1@@YAHXZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "?test1@@YAHXZ":                        # @"\01?test1@@YAHXZ"
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  -1
; CHECK-NEXT:    push  LBB4_7
; CHECK-NEXT:    mov EAX, DWORD PTR FS:[0]
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR FS:[0], ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    sub ESP, 72
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:   # BB#1:                                 # %seh.init.block
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 36]
; CHECK-NEXT:    sub ECX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test1@@YAHXZ$0+8], ECX
; CHECK-NEXT:   # BB#2:                                 # %after.seh.init
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    mov ECX, EAX
; CHECK-NEXT:    add ECX, -4
; CHECK-NEXT:    mov DWORD PTR [EAX - 4], 0
; CHECK-NEXT:    lea EAX, DWORD PTR [EBP - 24]
; CHECK-NEXT:    mov DWORD PTR [EBP - 40], ECX # 4-byte Spill
; CHECK-NEXT:    mov ECX, EAX
; CHECK-NEXT:    call  "??0A@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    mov DWORD PTR [EBP - 44], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB4_8
; CHECK-NEXT:    jmp LBB4_3
; CHECK-NEXT:   LBB4_3:                                 # %invoke.cont
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 40] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 1
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 32]
; CHECK-NEXT:    call  "??0A@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    mov DWORD PTR [EBP - 48], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB4_9
; CHECK-NEXT:    jmp LBB4_4
; CHECK-NEXT:   LBB4_4:                                 # %invoke.cont2
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 40] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 2
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 32]
; CHECK-NEXT:    call  "??1A@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    jne LBB4_9
; CHECK-NEXT:    jmp LBB4_5
; CHECK-NEXT:   LBB4_5:                                 # %invoke.cont4
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 40] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 1
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 24]
; CHECK-NEXT:    call  "??1A@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    jne LBB4_8
; CHECK-NEXT:    jmp LBB4_6
; CHECK-NEXT:   LBB4_6:                                 # %invoke.cont5
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 40] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:    jmp LBB4_14
; CHECK-NEXT:   LBB4_7:                                 # %__ehhandler$test1@@YAHXZ
; CHECK-NEXT:    mov EAX, __ehfuncinfo$test1@@YAHXZ
; CHECK-NEXT:    jmp ___CxxFrameHandler3
; CHECK-NEXT:   LBB4_8:                                 # %lpad
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 52] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 56], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB4_7
; CHECK-NEXT:    jmp LBB4_12
; CHECK-NEXT:   LBB4_9:                                 # %lpad1
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 60] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 64], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB4_7
; CHECK-NEXT:    jmp LBB4_10
; CHECK-NEXT:   Ltmp6:                                  # Block address taken
; CHECK-NEXT:   LBB4_10:                                # %ehcleanup
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 24]
; CHECK-NEXT:    call  "??1A@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB4_16
; CHECK-NEXT:    jmp LBB4_11
; CHECK-NEXT:   LBB4_11:                                # %invoke.cont6
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB4_12:                                # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 40] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 68], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 72], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB4_15
; CHECK-NEXT:    jmp LBB4_17
; CHECK-NEXT:   LBB4_17:                                # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 68] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB4_7
; CHECK-NEXT:    jmp LBB4_13
; CHECK-NEXT:   Ltmp7:                                  # Block address taken
; CHECK-NEXT:   LBB4_13:                                # %catch
; CHECK-NEXT:    sub ESP, 72
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 40] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], -1
; CHECK-NEXT:    add ESP, 72
; CHECK-NEXT:    mov EAX, Ltmp8
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp8:                                  # Block address taken
; CHECK-NEXT:   LBB4_14:                                # %try.cont
; CHECK-NEXT:    mov EAX, 0
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 40] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [ECX], -1
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 12]
; CHECK-NEXT:    mov DWORD PTR FS:[0], ECX
; CHECK-NEXT:    add ESP, 88
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB4_15:                                # %eh.resume
; CHECK-NEXT:   LBB4_16:                                # %terminate.lpad
 
; CHECK:     .def   "?test2@@YAHXZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .globl  "?test2@@YAHXZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "?test2@@YAHXZ":                        # @"\01?test2@@YAHXZ"
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  -1
; CHECK-NEXT:    push  LBB5_5
; CHECK-NEXT:    mov EAX, DWORD PTR FS:[0]
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR FS:[0], ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    sub ESP, 60
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:   # BB#1:                                 # %seh.init.block
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 24]
; CHECK-NEXT:    lea EDX, DWORD PTR [EBP - 20]
; CHECK-NEXT:    sub EDX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test2@@YAHXZ$0+8], EDX
; CHECK-NEXT:    sub ECX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test2@@YAHXZ$1+8], ECX
; CHECK-NEXT:   # BB#2:                                 # %after.seh.init
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    mov ECX, EAX
; CHECK-NEXT:    add ECX, -4
; CHECK-NEXT:    mov DWORD PTR [EAX - 4], 0
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:    mov DWORD PTR [EBP - 28], ECX # 4-byte Spill
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    jne LBB5_6
; CHECK-NEXT:    jmp LBB5_3
; CHECK-NEXT:   LBB5_3:                                 # %invoke.cont
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 1
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor CL, CL
; CHECK-NEXT:    test  CL, CL
; CHECK-NEXT:    jne LBB5_7
; CHECK-NEXT:    jmp LBB5_4
; CHECK-NEXT:   LBB5_4:                                 # %invoke.cont2
; CHECK-NEXT:    jmp LBB5_12
; CHECK-NEXT:   LBB5_5:                                 # %__ehhandler$test2@@YAHXZ
; CHECK-NEXT:    mov EAX, __ehfuncinfo$test2@@YAHXZ
; CHECK-NEXT:    jmp ___CxxFrameHandler3
; CHECK-NEXT:   LBB5_6:                                 # %lpad
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 32] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 36], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB5_5
; CHECK-NEXT:    jmp LBB5_9
; CHECK-NEXT:   LBB5_7:                                 # %lpad1
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 40] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 44], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB5_5
; CHECK-NEXT:    jmp LBB5_8
; CHECK-NEXT:   LBB5_8:                                 # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    test  ECX, ECX
; CHECK-NEXT:    mov DWORD PTR [EBP - 48], ECX # 4-byte Spill
; CHECK-NEXT:    je  LBB5_11
; CHECK-NEXT:    jmp LBB5_15
; CHECK-NEXT:   LBB5_15:                                # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 48] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 52], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB5_5
; CHECK-NEXT:    jmp LBB5_9
; CHECK-NEXT:   LBB5_9:                                 # %catch.dispatch3
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 56], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 60], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB5_14
; CHECK-NEXT:    jmp LBB5_16
; CHECK-NEXT:   LBB5_16:                                # %catch.dispatch3
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 56] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB5_5
; CHECK-NEXT:    jmp LBB5_10
; CHECK-NEXT:   Ltmp11:                                 # Block address taken
; CHECK-NEXT:   LBB5_10:                                # %catch5
; CHECK-NEXT:    sub ESP, 60
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], -1
; CHECK-NEXT:    add ESP, 60
; CHECK-NEXT:    mov EAX, Ltmp12
; CHECK-NEXT:    ret
; CHECK-NEXT:    jmp LBB5_13
; CHECK-NEXT:   Ltmp13:                                 # Block address taken
; CHECK-NEXT:   LBB5_11:                                # %catch
; CHECK-NEXT:    sub ESP, 60
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:    add ESP, 60
; CHECK-NEXT:    mov EAX, Ltmp14
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp14:                                 # Block address taken
; CHECK-NEXT:   LBB5_12:                                # %try.cont
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:   Ltmp12:                                 # Block address taken
; CHECK-NEXT:   LBB5_13:                                # %try.cont4
; CHECK-NEXT:    mov EAX, 0
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [ECX], -1
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 12]
; CHECK-NEXT:    mov DWORD PTR FS:[0], ECX
; CHECK-NEXT:    add ESP, 76
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB5_14:                                # %eh.resume
  
; CHECK:     .def   "?test3@@YAHXZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .globl  "?test3@@YAHXZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "?test3@@YAHXZ":                        # @"\01?test3@@YAHXZ"
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  -1
; CHECK-NEXT:    push  LBB6_4
; CHECK-NEXT:    mov EAX, DWORD PTR FS:[0]
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR FS:[0], ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    sub ESP, 60
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:   # BB#1:                                 # %seh.init.block
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 24]
; CHECK-NEXT:    lea EDX, DWORD PTR [EBP - 20]
; CHECK-NEXT:    sub EDX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test3@@YAHXZ$0+8], EDX
; CHECK-NEXT:    sub ECX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test3@@YAHXZ$1+8], ECX
; CHECK-NEXT:   # BB#2:                                 # %after.seh.init
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    mov ECX, EAX
; CHECK-NEXT:    add ECX, -4
; CHECK-NEXT:    mov DWORD PTR [EAX - 4], 0
; CHECK-NEXT:    mov DWORD PTR [EBP - 28], ECX # 4-byte Spill
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    jne LBB6_5
; CHECK-NEXT:    jmp LBB6_3
; CHECK-NEXT:   LBB6_3:                                 # %invoke.cont
; CHECK-NEXT:    jmp LBB6_8
; CHECK-NEXT:   LBB6_4:                                 # %__ehhandler$test3@@YAHXZ
; CHECK-NEXT:    mov EAX, __ehfuncinfo$test3@@YAHXZ
; CHECK-NEXT:    jmp ___CxxFrameHandler3
; CHECK-NEXT:   LBB6_5:                                 # %lpad
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 32] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 36], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB6_4
; CHECK-NEXT:    jmp LBB6_6
; CHECK-NEXT:   LBB6_6:                                 # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 40], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 44], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB6_14
; CHECK-NEXT:    jmp LBB6_15
; CHECK-NEXT:   LBB6_15:                                # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 40] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB6_4
; CHECK-NEXT:    jmp LBB6_7
; CHECK-NEXT:   Ltmp17:                                 # Block address taken
; CHECK-NEXT:   LBB6_7:                                 # %catch
; CHECK-NEXT:    sub ESP, 60
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], -1
; CHECK-NEXT:    add ESP, 60
; CHECK-NEXT:    mov EAX, Ltmp18
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp18:                                 # Block address taken
; CHECK-NEXT:   LBB6_8:                                 # %try.cont
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], -1
; CHECK-NEXT:    mov DWORD PTR [EAX], 2
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor CL, CL
; CHECK-NEXT:    test  CL, CL
; CHECK-NEXT:    jne LBB6_10
; CHECK-NEXT:    jmp LBB6_9
; CHECK-NEXT:   LBB6_9:                                 # %invoke.cont2
; CHECK-NEXT:    jmp LBB6_13
; CHECK-NEXT:   LBB6_10:                                # %lpad1
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 48] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 52], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB6_4
; CHECK-NEXT:    jmp LBB6_11
; CHECK-NEXT:   LBB6_11:                                # %catch.dispatch3
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 56], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 60], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB6_14
; CHECK-NEXT:    jmp LBB6_16
; CHECK-NEXT:   LBB6_16:                                # %catch.dispatch3
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 56] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB6_4
; CHECK-NEXT:    jmp LBB6_12
; CHECK-NEXT:   Ltmp19:                                 # Block address taken
; CHECK-NEXT:   LBB6_12:                                # %catch5
; CHECK-NEXT:    sub ESP, 60
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], -1
; CHECK-NEXT:    add ESP, 60
; CHECK-NEXT:    mov EAX, Ltmp20
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp20:                                 # Block address taken
; CHECK-NEXT:   LBB6_13:                                # %try.cont4
; CHECK-NEXT:    mov EAX, 0
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [ECX], -1
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 12]
; CHECK-NEXT:    mov DWORD PTR FS:[0], ECX
; CHECK-NEXT:    add ESP, 76
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB6_14:                                # %eh.resume
   
; CHECK:     .def   "?test4@@YAHXZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .globl  "?test4@@YAHXZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "?test4@@YAHXZ":                        # @"\01?test4@@YAHXZ"
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  -1
; CHECK-NEXT:    push  LBB7_4
; CHECK-NEXT:    mov EAX, DWORD PTR FS:[0]
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR FS:[0], ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    sub ESP, 128
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:   # BB#1:                                 # %seh.init.block
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 80]
; CHECK-NEXT:    lea EDX, DWORD PTR [EBP - 76]
; CHECK-NEXT:    lea ESI, DWORD PTR [EBP - 52]
; CHECK-NEXT:    sub ESI, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test4@@YAHXZ$0+8], ESI
; CHECK-NEXT:    sub EDX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test4@@YAHXZ$1+8], EDX
; CHECK-NEXT:    sub ECX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test4@@YAHXZ$2+8], ECX
; CHECK-NEXT:   # BB#2:                                 # %after.seh.init
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    mov ECX, EAX
; CHECK-NEXT:    add ECX, -4
; CHECK-NEXT:    mov DWORD PTR [EAX - 4], 0
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:    mov DWORD PTR [EAX - 4], 1
; CHECK-NEXT:    mov DWORD PTR [EBP - 84], ECX # 4-byte Spill
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    jne LBB7_5
; CHECK-NEXT:    jmp LBB7_3
; CHECK-NEXT:   LBB7_3:                                 # %invoke.cont
; CHECK-NEXT:    jmp LBB7_8
; CHECK-NEXT:   LBB7_4:                                 # %__ehhandler$test4@@YAHXZ
; CHECK-NEXT:    mov EAX, __ehfuncinfo$test4@@YAHXZ
; CHECK-NEXT:    jmp ___CxxFrameHandler3
; CHECK-NEXT:   LBB7_5:                                 # %lpad
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 88] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 92], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB7_4
; CHECK-NEXT:    jmp LBB7_6
; CHECK-NEXT:   LBB7_6:                                 # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 96], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 100], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB7_12
; CHECK-NEXT:    jmp LBB7_18
; CHECK-NEXT:   LBB7_18:                                # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 96] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB7_4
; CHECK-NEXT:    jmp LBB7_7
; CHECK-NEXT:   Ltmp23:                                 # Block address taken
; CHECK-NEXT:   LBB7_7:                                 # %catch
; CHECK-NEXT:    sub ESP, 128
; CHECK-NEXT:    mov DWORD PTR [EBP - 24], 809
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:    add ESP, 128
; CHECK-NEXT:    mov EAX, Ltmp24
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp24:                                 # Block address taken
; CHECK-NEXT:   LBB7_8:                                 # %try.cont
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:    mov DWORD PTR [EAX], 3
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor CL, CL
; CHECK-NEXT:    test  CL, CL
; CHECK-NEXT:    jne LBB7_10
; CHECK-NEXT:    jmp LBB7_9
; CHECK-NEXT:   LBB7_9:                                 # %invoke.cont3
; CHECK-NEXT:    jmp LBB7_15
; CHECK-NEXT:   LBB7_10:                                # %lpad2
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 104] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 108], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB7_4
; CHECK-NEXT:    jmp LBB7_11
; CHECK-NEXT:   LBB7_11:                                # %catch.dispatch4
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    test  ECX, ECX
; CHECK-NEXT:    mov DWORD PTR [EBP - 112], ECX # 4-byte Spill
; CHECK-NEXT:    je  LBB7_14
; CHECK-NEXT:    jmp LBB7_19
; CHECK-NEXT:   LBB7_19:                                # %catch.dispatch4
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 112] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 116], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB7_4
; CHECK-NEXT:    jmp LBB7_12
; CHECK-NEXT:   LBB7_12:                                # %catch.dispatch7
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 120], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 124], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB7_17
; CHECK-NEXT:    jmp LBB7_20
; CHECK-NEXT:   LBB7_20:                                # %catch.dispatch7
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 120] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB7_4
; CHECK-NEXT:    jmp LBB7_13
; CHECK-NEXT:   Ltmp25:                                 # Block address taken
; CHECK-NEXT:   LBB7_13:                                # %catch9
; CHECK-NEXT:    sub ESP, 128
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], -1
; CHECK-NEXT:    add ESP, 128
; CHECK-NEXT:    mov EAX, Ltmp26
; CHECK-NEXT:    ret
; CHECK-NEXT:    jmp LBB7_16
; CHECK-NEXT:   Ltmp27:                                 # Block address taken
; CHECK-NEXT:   LBB7_14:                                # %catch6
; CHECK-NEXT:    sub ESP, 128
; CHECK-NEXT:    mov DWORD PTR [EBP - 24], 98
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:    add ESP, 128
; CHECK-NEXT:    mov EAX, Ltmp28
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp28:                                 # Block address taken
; CHECK-NEXT:   LBB7_15:                                # %try.cont5
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:   Ltmp26:                                 # Block address taken
; CHECK-NEXT:   LBB7_16:                                # %try.cont8
; CHECK-NEXT:    mov EAX, 0
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [ECX], -1
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 12]
; CHECK-NEXT:    mov DWORD PTR FS:[0], ECX
; CHECK-NEXT:    add ESP, 144
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB7_17:                                # %eh.resume
 
; CHECK:     .def   "?test5@@YAHXZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .globl  "?test5@@YAHXZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "?test5@@YAHXZ":                        # @"\01?test5@@YAHXZ"
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  -1
; CHECK-NEXT:    push  LBB8_8
; CHECK-NEXT:    mov EAX, DWORD PTR FS:[0]
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR FS:[0], ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    sub ESP, 176
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:   # BB#1:                                 # %seh.init.block
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 80]
; CHECK-NEXT:    lea EDX, DWORD PTR [EBP - 76]
; CHECK-NEXT:    lea ESI, DWORD PTR [EBP - 52]
; CHECK-NEXT:    sub ESI, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test5@@YAHXZ$0+8], ESI
; CHECK-NEXT:    sub EDX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test5@@YAHXZ$1+8], EDX
; CHECK-NEXT:    sub ECX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test5@@YAHXZ$2+8], ECX
; CHECK-NEXT:   # BB#2:                                 # %after.seh.init
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    mov ECX, EAX
; CHECK-NEXT:    add ECX, -4
; CHECK-NEXT:    mov DWORD PTR [EAX - 4], 0
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:    mov DWORD PTR [EAX - 4], 1
; CHECK-NEXT:    lea EAX, DWORD PTR [EBP - 40]
; CHECK-NEXT:    mov DWORD PTR [EBP - 84], ECX # 4-byte Spill
; CHECK-NEXT:    mov ECX, EAX
; CHECK-NEXT:    call  "??0A@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    mov DWORD PTR [EBP - 88], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB8_9
; CHECK-NEXT:    jmp LBB8_3
; CHECK-NEXT:   LBB8_3:                                 # %invoke.cont
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 2
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 48]
; CHECK-NEXT:    call  "??0A@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    mov DWORD PTR [EBP - 92], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB8_10
; CHECK-NEXT:    jmp LBB8_4
; CHECK-NEXT:   LBB8_4:                                 # %invoke.cont2
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 3
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor CL, CL
; CHECK-NEXT:    test  CL, CL
; CHECK-NEXT:    jne LBB8_11
; CHECK-NEXT:    jmp LBB8_5
; CHECK-NEXT:   LBB8_5:                                 # %invoke.cont5
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 48]
; CHECK-NEXT:    call  "??1A@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB8_10
; CHECK-NEXT:    jmp LBB8_6
; CHECK-NEXT:   LBB8_6:                                 # %invoke.cont6
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 2
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 40]
; CHECK-NEXT:    call  "??1A@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    jne LBB8_9
; CHECK-NEXT:    jmp LBB8_7
; CHECK-NEXT:   LBB8_7:                                 # %invoke.cont8
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 1
; CHECK-NEXT:    jmp LBB8_18
; CHECK-NEXT:   LBB8_8:                                 # %__ehhandler$test5@@YAHXZ
; CHECK-NEXT:    mov EAX, __ehfuncinfo$test5@@YAHXZ
; CHECK-NEXT:    jmp ___CxxFrameHandler3
; CHECK-NEXT:   LBB8_9:                                 # %lpad
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 96] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 100], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB8_8
; CHECK-NEXT:    jmp LBB8_16
; CHECK-NEXT:   LBB8_10:                                # %lpad1
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 104] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 108], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB8_8
; CHECK-NEXT:    jmp LBB8_14
; CHECK-NEXT:   LBB8_11:                                # %lpad4
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 112] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 116], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB8_8
; CHECK-NEXT:    jmp LBB8_12
; CHECK-NEXT:   Ltmp31:                                 # Block address taken
; CHECK-NEXT:   LBB8_12:                                # %ehcleanup
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 48]
; CHECK-NEXT:    call  "??1A@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB8_38
; CHECK-NEXT:    jmp LBB8_13
; CHECK-NEXT:   LBB8_13:                                # %invoke.cont7
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp32:                                 # Block address taken
; CHECK-NEXT:   LBB8_14:                                # %ehcleanup9
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 40]
; CHECK-NEXT:    call  "??1A@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB8_38
; CHECK-NEXT:    jmp LBB8_15
; CHECK-NEXT:   LBB8_15:                                # %invoke.cont10
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB8_16:                                # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 120], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 124], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB8_32
; CHECK-NEXT:    jmp LBB8_39
; CHECK-NEXT:   LBB8_39:                                # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 120] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB8_8
; CHECK-NEXT:    jmp LBB8_17
; CHECK-NEXT:   Ltmp33:                                 # Block address taken
; CHECK-NEXT:   LBB8_17:                                # %catch
; CHECK-NEXT:    sub ESP, 176
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:    add ESP, 176
; CHECK-NEXT:    mov EAX, Ltmp34
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp34:                                 # Block address taken
; CHECK-NEXT:   LBB8_18:                                # %try.cont
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:    mov DWORD PTR [EAX], 5
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 64]
; CHECK-NEXT:    call  "??0B@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    mov DWORD PTR [EBP - 128], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB8_24
; CHECK-NEXT:    jmp LBB8_19
; CHECK-NEXT:   LBB8_19:                                # %invoke.cont12
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 6
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 72]
; CHECK-NEXT:    call  "??0B@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    mov DWORD PTR [EBP - 132], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB8_25
; CHECK-NEXT:    jmp LBB8_20
; CHECK-NEXT:   LBB8_20:                                # %invoke.cont15
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 7
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor CL, CL
; CHECK-NEXT:    test  CL, CL
; CHECK-NEXT:    jne LBB8_26
; CHECK-NEXT:    jmp LBB8_21
; CHECK-NEXT:   LBB8_21:                                # %invoke.cont18
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 72]
; CHECK-NEXT:    call  "??1B@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB8_25
; CHECK-NEXT:    jmp LBB8_22
; CHECK-NEXT:   LBB8_22:                                # %invoke.cont19
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 6
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 64]
; CHECK-NEXT:    call  "??1B@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    jne LBB8_24
; CHECK-NEXT:    jmp LBB8_23
; CHECK-NEXT:   LBB8_23:                                # %invoke.cont22
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 5
; CHECK-NEXT:    jmp LBB8_35
; CHECK-NEXT:   LBB8_24:                                # %lpad11
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 136] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 140], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB8_8
; CHECK-NEXT:    jmp LBB8_31
; CHECK-NEXT:   LBB8_25:                                # %lpad14
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 144] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 148], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB8_8
; CHECK-NEXT:    jmp LBB8_29
; CHECK-NEXT:   LBB8_26:                                # %lpad17
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 152] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 156], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB8_8
; CHECK-NEXT:    jmp LBB8_27
; CHECK-NEXT:   Ltmp35:                                 # Block address taken
; CHECK-NEXT:   LBB8_27:                                # %ehcleanup20
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 72]
; CHECK-NEXT:    call  "??1B@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB8_38
; CHECK-NEXT:    jmp LBB8_28
; CHECK-NEXT:   LBB8_28:                                # %invoke.cont21
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp36:                                 # Block address taken
; CHECK-NEXT:   LBB8_29:                                # %ehcleanup23
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 64]
; CHECK-NEXT:    call  "??1B@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB8_38
; CHECK-NEXT:    jmp LBB8_30
; CHECK-NEXT:   LBB8_30:                                # %invoke.cont24
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB8_31:                                # %catch.dispatch25
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    test  ECX, ECX
; CHECK-NEXT:    mov DWORD PTR [EBP - 160], ECX # 4-byte Spill
; CHECK-NEXT:    je  LBB8_34
; CHECK-NEXT:    jmp LBB8_40
; CHECK-NEXT:   LBB8_40:                                # %catch.dispatch25
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 160] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 164], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB8_8
; CHECK-NEXT:    jmp LBB8_32
; CHECK-NEXT:   LBB8_32:                                # %catch.dispatch28
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 168], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 172], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB8_37
; CHECK-NEXT:    jmp LBB8_41
; CHECK-NEXT:   LBB8_41:                                # %catch.dispatch28
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 168] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB8_8
; CHECK-NEXT:    jmp LBB8_33
; CHECK-NEXT:   Ltmp37:                                 # Block address taken
; CHECK-NEXT:   LBB8_33:                                # %catch30
; CHECK-NEXT:    sub ESP, 176
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], -1
; CHECK-NEXT:    add ESP, 176
; CHECK-NEXT:    mov EAX, Ltmp38
; CHECK-NEXT:    ret
; CHECK-NEXT:    jmp LBB8_36
; CHECK-NEXT:   Ltmp39:                                 # Block address taken
; CHECK-NEXT:   LBB8_34:                                # %catch27
; CHECK-NEXT:    sub ESP, 176
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:    add ESP, 176
; CHECK-NEXT:    mov EAX, Ltmp40
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp40:                                 # Block address taken
; CHECK-NEXT:   LBB8_35:                                # %try.cont26
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:   Ltmp38:                                 # Block address taken
; CHECK-NEXT:   LBB8_36:                                # %try.cont29
; CHECK-NEXT:    mov EAX, 0
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 84] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [ECX], -1
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 12]
; CHECK-NEXT:    mov DWORD PTR FS:[0], ECX
; CHECK-NEXT:    add ESP, 192
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB8_37:                                # %eh.resume
; CHECK-NEXT:   LBB8_38:                                # %terminate.lpad
  
; CHECK:     .def   "??0B@@QAE@XZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .section  .text$?0B@@QAE@XZ,"xr"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "??0B@@QAE@XZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "??0B@@QAE@XZ":                         # @"\01??0B@@QAE@XZ"
; CHECK-NEXT:   "Lllvm$workaround$fake$stub$??0B@@QAE@XZ":
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR [EBP - 4], ECX
; CHECK-NEXT:    mov EAX, ECX
; CHECK-NEXT:    add ESP, 4
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret
 
; CHECK:     .def   "??1B@@QAE@XZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .section  .text$?1B@@QAE@XZ,"xr"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "??1B@@QAE@XZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "??1B@@QAE@XZ":                         # @"\01??1B@@QAE@XZ"
; CHECK-NEXT:   "Lllvm$workaround$fake$stub$??1B@@QAE@XZ":
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR [EBP - 4], ECX
; CHECK-NEXT:    add ESP, 4
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret

; CHECK:     .def   "?test6@@YAHXZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .text
; CHECK-NEXT:    .globl  "?test6@@YAHXZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "?test6@@YAHXZ":                        # @"\01?test6@@YAHXZ"
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  -1
; CHECK-NEXT:    push  LBB11_8
; CHECK-NEXT:    mov EAX, DWORD PTR FS:[0]
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR FS:[0], ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    sub ESP, 264
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:   # BB#1:                                 # %seh.init.block
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 112]
; CHECK-NEXT:    lea EDX, DWORD PTR [EBP - 108]
; CHECK-NEXT:    lea ESI, DWORD PTR [EBP - 76]
; CHECK-NEXT:    lea EDI, DWORD PTR [EBP - 68]
; CHECK-NEXT:    sub EDI, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test6@@YAHXZ$1+8], EDI
; CHECK-NEXT:    sub ESI, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test6@@YAHXZ$0+8], ESI
; CHECK-NEXT:    sub EDX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test6@@YAHXZ$2+8], EDX
; CHECK-NEXT:    sub ECX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test6@@YAHXZ$3+8], ECX
; CHECK-NEXT:   # BB#2:                                 # %after.seh.init
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 40]
; CHECK-NEXT:    call  "??0B@@QAE@XZ"
; CHECK-NEXT:    mov ECX, EBP
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    add EDX, -4
; CHECK-NEXT:    mov DWORD PTR [ECX - 4], 0
; CHECK-NEXT:    mov DWORD PTR [ECX - 4], 1
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:    mov DWORD PTR [ECX - 4], 2
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 56]
; CHECK-NEXT:    mov DWORD PTR [EBP - 128], EAX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 132], EDX # 4-byte Spill
; CHECK-NEXT:    call  "??0A@@QAE@XZ"
; CHECK-NEXT:    xor BL, BL
; CHECK-NEXT:    test  BL, BL
; CHECK-NEXT:    mov DWORD PTR [EBP - 136], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB11_9
; CHECK-NEXT:    jmp LBB11_3
; CHECK-NEXT:   LBB11_3:                                # %invoke.cont
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 3
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 64]
; CHECK-NEXT:    call  "??0A@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    mov DWORD PTR [EBP - 140], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB11_10
; CHECK-NEXT:    jmp LBB11_4
; CHECK-NEXT:   LBB11_4:                                # %invoke.cont3
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 4
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor CL, CL
; CHECK-NEXT:    test  CL, CL
; CHECK-NEXT:    jne LBB11_11
; CHECK-NEXT:    jmp LBB11_5
; CHECK-NEXT:   LBB11_5:                                # %invoke.cont6
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 64]
; CHECK-NEXT:    call  "??1A@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB11_10
; CHECK-NEXT:    jmp LBB11_6
; CHECK-NEXT:   LBB11_6:                                # %invoke.cont7
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 3
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 56]
; CHECK-NEXT:    call  "??1A@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    jne LBB11_9
; CHECK-NEXT:    jmp LBB11_7
; CHECK-NEXT:   LBB11_7:                                # %invoke.cont9
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 2
; CHECK-NEXT:    jmp LBB11_20
; CHECK-NEXT:   LBB11_8:                                # %__ehhandler$test6@@YAHXZ
; CHECK-NEXT:    mov EAX, __ehfuncinfo$test6@@YAHXZ
; CHECK-NEXT:    jmp ___CxxFrameHandler3
; CHECK-NEXT:   LBB11_9:                                # %lpad
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 144] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 148], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB11_8
; CHECK-NEXT:    jmp LBB11_16
; CHECK-NEXT:   LBB11_10:                               # %lpad2
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 152] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 156], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB11_8
; CHECK-NEXT:    jmp LBB11_14
; CHECK-NEXT:   LBB11_11:                               # %lpad5
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 160] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 164], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB11_8
; CHECK-NEXT:    jmp LBB11_12
; CHECK-NEXT:   Ltmp43:                                 # Block address taken
; CHECK-NEXT:   LBB11_12:                               # %ehcleanup
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 64]
; CHECK-NEXT:    call  "??1A@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB11_54
; CHECK-NEXT:    jmp LBB11_13
; CHECK-NEXT:   LBB11_13:                               # %invoke.cont8
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp44:                                 # Block address taken
; CHECK-NEXT:   LBB11_14:                               # %ehcleanup10
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 56]
; CHECK-NEXT:    call  "??1A@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB11_54
; CHECK-NEXT:    jmp LBB11_15
; CHECK-NEXT:   LBB11_15:                               # %invoke.cont11
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB11_16:                               # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 168], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 172], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB11_45
; CHECK-NEXT:    jmp LBB11_55
; CHECK-NEXT:   LBB11_55:                               # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 168] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB11_8
; CHECK-NEXT:    jmp LBB11_17
; CHECK-NEXT:   Ltmp45:                                 # Block address taken
; CHECK-NEXT:   LBB11_17:                               # %catch
; CHECK-NEXT:    sub ESP, 264
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 72]
; CHECK-NEXT:    call  "??0A@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    mov DWORD PTR [EBP - 176], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB11_26
; CHECK-NEXT:    jmp LBB11_18
; CHECK-NEXT:   LBB11_18:                               # %invoke.cont13
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 6
; CHECK-NEXT:    mov DWORD PTR [EAX], 7
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor CL, CL
; CHECK-NEXT:    test  CL, CL
; CHECK-NEXT:    jne LBB11_27
; CHECK-NEXT:    jmp LBB11_19
; CHECK-NEXT:   LBB11_19:                               # %invoke.cont16
; CHECK-NEXT:    jmp LBB11_30
; CHECK-NEXT:   Ltmp46:                                 # Block address taken
; CHECK-NEXT:   LBB11_20:                               # %try.cont
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 1
; CHECK-NEXT:    mov DWORD PTR [EAX], 10
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 96]
; CHECK-NEXT:    call  "??0B@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    mov DWORD PTR [EBP - 180], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB11_37
; CHECK-NEXT:    jmp LBB11_21
; CHECK-NEXT:   LBB11_21:                               # %invoke.cont28
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 11
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 104]
; CHECK-NEXT:    call  "??0B@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    mov DWORD PTR [EBP - 184], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB11_38
; CHECK-NEXT:    jmp LBB11_22
; CHECK-NEXT:   LBB11_22:                               # %invoke.cont31
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 12
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor CL, CL
; CHECK-NEXT:    test  CL, CL
; CHECK-NEXT:    jne LBB11_39
; CHECK-NEXT:    jmp LBB11_23
; CHECK-NEXT:   LBB11_23:                               # %invoke.cont34
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 104]
; CHECK-NEXT:    call  "??1B@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB11_38
; CHECK-NEXT:    jmp LBB11_24
; CHECK-NEXT:   LBB11_24:                               # %invoke.cont35
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 11
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 96]
; CHECK-NEXT:    call  "??1B@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    jne LBB11_37
; CHECK-NEXT:    jmp LBB11_25
; CHECK-NEXT:   LBB11_25:                               # %invoke.cont38
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 10
; CHECK-NEXT:    jmp LBB11_48
; CHECK-NEXT:   LBB11_26:                               # %lpad12
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 188] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 192], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB11_8
; CHECK-NEXT:    jmp LBB11_45
; CHECK-NEXT:   LBB11_27:                               # %lpad15
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 196] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 200], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB11_8
; CHECK-NEXT:    jmp LBB11_28
; CHECK-NEXT:   LBB11_28:                               # %catch.dispatch17
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 204], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 208], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB11_35
; CHECK-NEXT:    jmp LBB11_56
; CHECK-NEXT:   LBB11_56:                               # %catch.dispatch17
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 204] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB11_8
; CHECK-NEXT:    jmp LBB11_29
; CHECK-NEXT:   Ltmp47:                                 # Block address taken
; CHECK-NEXT:   LBB11_29:                               # %catch19
; CHECK-NEXT:    sub ESP, 264
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 6
; CHECK-NEXT:    add ESP, 264
; CHECK-NEXT:    mov EAX, Ltmp48
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp48:                                 # Block address taken
; CHECK-NEXT:   LBB11_30:                               # %try.cont18
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 6
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 80]
; CHECK-NEXT:    call  "??0B@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    mov DWORD PTR [EBP - 212], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB11_34
; CHECK-NEXT:    jmp LBB11_31
; CHECK-NEXT:   LBB11_31:                               # %invoke.cont21
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 9
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 80]
; CHECK-NEXT:    call  "??1B@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    jne LBB11_34
; CHECK-NEXT:    jmp LBB11_32
; CHECK-NEXT:   LBB11_32:                               # %invoke.cont23
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 6
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 72]
; CHECK-NEXT:    call  "??1A@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    jne LBB11_26
; CHECK-NEXT:    jmp LBB11_33
; CHECK-NEXT:   LBB11_33:                               # %invoke.cont24
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 5
; CHECK-NEXT:    mov DWORD PTR [EAX], 1
; CHECK-NEXT:    add ESP, 264
; CHECK-NEXT:    mov EAX, Ltmp46
; CHECK-NEXT:    ret
; CHECK-NEXT:    jmp LBB11_20
; CHECK-NEXT:   LBB11_34:                               # %lpad20
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 216] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 220], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB11_8
; CHECK-NEXT:    jmp LBB11_35
; CHECK-NEXT:   Ltmp49:                                 # Block address taken
; CHECK-NEXT:   LBB11_35:                               # %ehcleanup25
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 72]
; CHECK-NEXT:    call  "??1A@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB11_54
; CHECK-NEXT:    jmp LBB11_36
; CHECK-NEXT:   LBB11_36:                               # %invoke.cont26
; CHECK-NEXT:    ret
; CHECK-NEXT:    jmp LBB11_45
; CHECK-NEXT:   LBB11_37:                               # %lpad27
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 224] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 228], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB11_8
; CHECK-NEXT:    jmp LBB11_44
; CHECK-NEXT:   LBB11_38:                               # %lpad30
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 232] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 236], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB11_8
; CHECK-NEXT:    jmp LBB11_42
; CHECK-NEXT:   LBB11_39:                               # %lpad33
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 240] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 244], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB11_8
; CHECK-NEXT:    jmp LBB11_40
; CHECK-NEXT:   Ltmp50:                                 # Block address taken
; CHECK-NEXT:   LBB11_40:                               # %ehcleanup36
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 104]
; CHECK-NEXT:    call  "??1B@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB11_54
; CHECK-NEXT:    jmp LBB11_41
; CHECK-NEXT:   LBB11_41:                               # %invoke.cont37
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp51:                                 # Block address taken
; CHECK-NEXT:   LBB11_42:                               # %ehcleanup39
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 96]
; CHECK-NEXT:    call  "??1B@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB11_54
; CHECK-NEXT:    jmp LBB11_43
; CHECK-NEXT:   LBB11_43:                               # %invoke.cont40
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB11_44:                               # %catch.dispatch41
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    test  ECX, ECX
; CHECK-NEXT:    mov DWORD PTR [EBP - 248], ECX # 4-byte Spill
; CHECK-NEXT:    je  LBB11_47
; CHECK-NEXT:    jmp LBB11_57
; CHECK-NEXT:   LBB11_57:                               # %catch.dispatch41
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 248] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 252], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB11_8
; CHECK-NEXT:    jmp LBB11_45
; CHECK-NEXT:   LBB11_45:                               # %catch.dispatch44
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 256], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 260], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB11_51
; CHECK-NEXT:    jmp LBB11_58
; CHECK-NEXT:   LBB11_58:                               # %catch.dispatch44
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 256] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB11_8
; CHECK-NEXT:    jmp LBB11_46
; CHECK-NEXT:   Ltmp52:                                 # Block address taken
; CHECK-NEXT:   LBB11_46:                               # %catch46
; CHECK-NEXT:    sub ESP, 264
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:    add ESP, 264
; CHECK-NEXT:    mov EAX, Ltmp53
; CHECK-NEXT:    ret
; CHECK-NEXT:    jmp LBB11_49
; CHECK-NEXT:   Ltmp54:                                 # Block address taken
; CHECK-NEXT:   LBB11_47:                               # %catch43
; CHECK-NEXT:    sub ESP, 264
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 1
; CHECK-NEXT:    add ESP, 264
; CHECK-NEXT:    mov EAX, Ltmp55
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp55:                                 # Block address taken
; CHECK-NEXT:   LBB11_48:                               # %try.cont42
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 1
; CHECK-NEXT:   Ltmp53:                                 # Block address taken
; CHECK-NEXT:   LBB11_49:                               # %try.cont45
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:    mov DWORD PTR [EBP - 124], 1
; CHECK-NEXT:   # BB#50:                                # %cleanup
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 40]
; CHECK-NEXT:    call  "??1B@@QAE@XZ"
; CHECK-NEXT:    mov EAX, 0
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 132] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [ECX], -1
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 12]
; CHECK-NEXT:    mov DWORD PTR FS:[0], ECX
; CHECK-NEXT:    add ESP, 280
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp56:                                 # Block address taken
; CHECK-NEXT:   LBB11_51:                               # %ehcleanup48
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 40]
; CHECK-NEXT:    call  "??1B@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB11_54
; CHECK-NEXT:    jmp LBB11_52
; CHECK-NEXT:   LBB11_52:                               # %invoke.cont49
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB11_53:                               # %eh.resume
; CHECK-NEXT:   LBB11_54:                               # %terminate.lpad

; CHECK:     .def   "?test7@@YAHXZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .globl  "?test7@@YAHXZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "?test7@@YAHXZ":                        # @"\01?test7@@YAHXZ"
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  -1
; CHECK-NEXT:    push  LBB12_4
; CHECK-NEXT:    mov EAX, DWORD PTR FS:[0]
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR FS:[0], ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    sub ESP, 40
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:   # BB#1:                                 # %seh.init.block
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 20]
; CHECK-NEXT:    sub ECX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test7@@YAHXZ$0+8], ECX
; CHECK-NEXT:   # BB#2:                                 # %after.seh.init
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    mov ECX, EAX
; CHECK-NEXT:    add ECX, -4
; CHECK-NEXT:    mov DWORD PTR [EAX - 4], 0
; CHECK-NEXT:    mov DWORD PTR [EBP - 24], ECX # 4-byte Spill
; CHECK-NEXT:    call  "?sa@@YAXXZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    jne LBB12_5
; CHECK-NEXT:    jmp LBB12_3
; CHECK-NEXT:   LBB12_3:                                # %invoke.cont
; CHECK-NEXT:    jmp LBB12_8
; CHECK-NEXT:   LBB12_4:                                # %__ehhandler$test7@@YAHXZ
; CHECK-NEXT:    mov EAX, __ehfuncinfo$test7@@YAHXZ
; CHECK-NEXT:    jmp ___CxxFrameHandler3
; CHECK-NEXT:   LBB12_5:                                # %lpad
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 32], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB12_4
; CHECK-NEXT:    jmp LBB12_6
; CHECK-NEXT:   LBB12_6:                                # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 24] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 36], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 40], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB12_9
; CHECK-NEXT:    jmp LBB12_10
; CHECK-NEXT:   LBB12_10:                               # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 36] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB12_4
; CHECK-NEXT:    jmp LBB12_7
; CHECK-NEXT:   Ltmp59:                                 # Block address taken
; CHECK-NEXT:   LBB12_7:                                # %catch
; CHECK-NEXT:    sub ESP, 40
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 24] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], -1
; CHECK-NEXT:    add ESP, 40
; CHECK-NEXT:    mov EAX, Ltmp60
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp60:                                 # Block address taken
; CHECK-NEXT:   LBB12_8:                                # %try.cont
; CHECK-NEXT:    mov EAX, 0
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 24] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [ECX], -1
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 12]
; CHECK-NEXT:    mov DWORD PTR FS:[0], ECX
; CHECK-NEXT:    add ESP, 56
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB12_9:                                # %eh.resume
   
; CHECK:     .def   "?test8@@YAHXZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .globl  "?test8@@YAHXZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "?test8@@YAHXZ":                        # @"\01?test8@@YAHXZ"
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  -1
; CHECK-NEXT:    push  LBB13_3
; CHECK-NEXT:    mov EAX, DWORD PTR FS:[0]
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR FS:[0], ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    sub ESP, 48
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:   # BB#1:                                 # %seh.init.block
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 20]
; CHECK-NEXT:    sub ECX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test8@@YAHXZ$0+8], ECX
; CHECK-NEXT:   # BB#2:                                 # %after.seh.init
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    mov ECX, EAX
; CHECK-NEXT:    add ECX, -4
; CHECK-NEXT:    mov DWORD PTR [EAX - 4], 0
; CHECK-NEXT:    mov EAX, 4
; CHECK-NEXT:    mov DWORD PTR [EBP - 28], ECX # 4-byte Spill
; CHECK-NEXT:    call  __chkstk
; CHECK-NEXT:    mov EAX, ESP
; CHECK-NEXT:    sub ESP, 8
; CHECK-NEXT:    mov ECX, ESP
; CHECK-NEXT:    mov DWORD PTR [ECX], EAX
; CHECK-NEXT:    mov DWORD PTR [ECX + 4], "__TI1?AUD@@"
; CHECK-NEXT:    call  __CxxThrowException@8
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    jne LBB13_5
; CHECK-NEXT:    jmp LBB13_4
; CHECK-NEXT:   LBB13_3:                                # %__ehhandler$test8@@YAHXZ
; CHECK-NEXT:    mov EAX, __ehfuncinfo$test8@@YAHXZ
; CHECK-NEXT:    jmp ___CxxFrameHandler3
; CHECK-NEXT:   LBB13_4:
; CHECK-NEXT:    jmp LBB13_8
; CHECK-NEXT:   LBB13_5:                                # %lpad
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 32] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 36], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB13_3
; CHECK-NEXT:    jmp LBB13_6
; CHECK-NEXT:   LBB13_6:                                # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 40], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 44], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB13_9
; CHECK-NEXT:    jmp LBB13_10
; CHECK-NEXT:   LBB13_10:                               # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 40] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB13_3
; CHECK-NEXT:    jmp LBB13_7
; CHECK-NEXT:   Ltmp63:                                 # Block address taken
; CHECK-NEXT:   LBB13_7:                                # %catch
; CHECK-NEXT:    sub ESP, 48
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], -1
; CHECK-NEXT:    add ESP, 48
; CHECK-NEXT:    mov EAX, Ltmp64
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp64:                                 # Block address taken
; CHECK-NEXT:   LBB13_8:                                # %try.cont
; CHECK-NEXT:    mov EAX, 0
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 28] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [ECX], -1
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 12]
; CHECK-NEXT:    mov DWORD PTR FS:[0], ECX
; CHECK-NEXT:    mov ESP, EBP
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB13_9:                                # %eh.resume
  
; CHECK:     .def   "??1D@@QAE@XZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .section  .text$?1D@@QAE@XZ,"xr"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "??1D@@QAE@XZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "??1D@@QAE@XZ":                         # @"\01??1D@@QAE@XZ"
; CHECK-NEXT:   "Lllvm$workaround$fake$stub$??1D@@QAE@XZ":
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR [EBP - 4], ECX
; CHECK-NEXT:    add ESP, 4
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret
  
; CHECK:     .def   "?test9@@YAHXZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .text
; CHECK-NEXT:    .globl  "?test9@@YAHXZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "?test9@@YAHXZ":                        # @"\01?test9@@YAHXZ"
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  -1
; CHECK-NEXT:    push  LBB15_3
; CHECK-NEXT:    mov EAX, DWORD PTR FS:[0]
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR FS:[0], ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    sub ESP, 64
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:   # BB#1:                                 # %seh.init.block
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 28]
; CHECK-NEXT:    sub ECX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test9@@YAHXZ$0+8], ECX
; CHECK-NEXT:   # BB#2:                                 # %after.seh.init
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    mov ECX, EAX
; CHECK-NEXT:    add ECX, -4
; CHECK-NEXT:    mov DWORD PTR [EAX - 4], 0
; CHECK-NEXT:    mov DWORD PTR [EAX - 4], 1
; CHECK-NEXT:    mov EAX, 4
; CHECK-NEXT:    mov DWORD PTR [EBP - 36], ECX # 4-byte Spill
; CHECK-NEXT:    call  __chkstk
; CHECK-NEXT:    mov EAX, ESP
; CHECK-NEXT:    sub ESP, 8
; CHECK-NEXT:    mov ECX, ESP
; CHECK-NEXT:    mov DWORD PTR [ECX], EAX
; CHECK-NEXT:    mov DWORD PTR [ECX + 4], "__TI1?AUD@@"
; CHECK-NEXT:    call  __CxxThrowException@8
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    jne LBB15_6
; CHECK-NEXT:    jmp LBB15_4
; CHECK-NEXT:   LBB15_3:                                # %__ehhandler$test9@@YAHXZ
; CHECK-NEXT:    mov EAX, __ehfuncinfo$test9@@YAHXZ
; CHECK-NEXT:    jmp ___CxxFrameHandler3
; CHECK-NEXT:   LBB15_4:
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 24]
; CHECK-NEXT:    call  "??1D@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB15_7
; CHECK-NEXT:    jmp LBB15_5
; CHECK-NEXT:   LBB15_5:                                # %invoke.cont
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 36] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:    jmp LBB15_12
; CHECK-NEXT:   LBB15_6:                                # %lpad
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 40] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 44], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB15_3
; CHECK-NEXT:    jmp LBB15_8
; CHECK-NEXT:   LBB15_7:                                # %lpad1
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 48] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 52], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB15_3
; CHECK-NEXT:    jmp LBB15_10
; CHECK-NEXT:   Ltmp67:                                 # Block address taken
; CHECK-NEXT:   LBB15_8:                                # %ehcleanup
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 24]
; CHECK-NEXT:    call  "??1D@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB15_14
; CHECK-NEXT:    jmp LBB15_9
; CHECK-NEXT:   LBB15_9:                                # %invoke.cont2
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB15_10:                               # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 36] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 56], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 60], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB15_13
; CHECK-NEXT:    jmp LBB15_15
; CHECK-NEXT:   LBB15_15:                               # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 56] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB15_3
; CHECK-NEXT:    jmp LBB15_11
; CHECK-NEXT:   Ltmp68:                                 # Block address taken
; CHECK-NEXT:   LBB15_11:                               # %catch
; CHECK-NEXT:    sub ESP, 64
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 36] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], -1
; CHECK-NEXT:    add ESP, 64
; CHECK-NEXT:    mov EAX, Ltmp69
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp69:                                 # Block address taken
; CHECK-NEXT:   LBB15_12:                               # %try.cont
; CHECK-NEXT:    mov EAX, 0
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 36] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [ECX], -1
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 12]
; CHECK-NEXT:    mov DWORD PTR FS:[0], ECX
; CHECK-NEXT:    mov ESP, EBP
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB15_13:                               # %eh.resume
; CHECK-NEXT:   LBB15_14:                               # %terminate.lpad
   
; CHECK:     .def   "?test10@@YAHXZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .globl  "?test10@@YAHXZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "?test10@@YAHXZ":                       # @"\01?test10@@YAHXZ"
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  -1
; CHECK-NEXT:    push  LBB16_4
; CHECK-NEXT:    mov EAX, DWORD PTR FS:[0]
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR FS:[0], ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    sub ESP, 84
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:   # BB#1:                                 # %seh.init.block
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 32]
; CHECK-NEXT:    lea EDX, DWORD PTR [EBP - 28]
; CHECK-NEXT:    lea ESI, DWORD PTR [EBP - 24]
; CHECK-NEXT:    sub ESI, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test10@@YAHXZ$0+8], ESI
; CHECK-NEXT:    sub EDX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test10@@YAHXZ$2+8], EDX
; CHECK-NEXT:    sub ECX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test10@@YAHXZ$1+8], ECX
; CHECK-NEXT:   # BB#2:                                 # %after.seh.init
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    mov ECX, EAX
; CHECK-NEXT:    add ECX, -4
; CHECK-NEXT:    mov DWORD PTR [EAX - 4], 0
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:    mov DWORD PTR [EAX - 4], 1
; CHECK-NEXT:    mov DWORD PTR [EBP - 36], ECX # 4-byte Spill
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    jne LBB16_5
; CHECK-NEXT:    jmp LBB16_3
; CHECK-NEXT:   LBB16_3:                                # %invoke.cont
; CHECK-NEXT:    jmp LBB16_8
; CHECK-NEXT:   LBB16_4:                                # %__ehhandler$test10@@YAHXZ
; CHECK-NEXT:    mov EAX, __ehfuncinfo$test10@@YAHXZ
; CHECK-NEXT:    jmp ___CxxFrameHandler3
; CHECK-NEXT:   LBB16_5:                                # %lpad
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 40] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 44], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB16_4
; CHECK-NEXT:    jmp LBB16_6
; CHECK-NEXT:   LBB16_6:                                # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 36] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 48], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 52], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB16_11
; CHECK-NEXT:    jmp LBB16_20
; CHECK-NEXT:   LBB16_20:                               # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 48] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB16_4
; CHECK-NEXT:    jmp LBB16_7
; CHECK-NEXT:   Ltmp72:                                 # Block address taken
; CHECK-NEXT:   LBB16_7:                                # %catch
; CHECK-NEXT:    sub ESP, 84
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 36] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:    add ESP, 84
; CHECK-NEXT:    mov EAX, Ltmp73
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp73:                                 # Block address taken
; CHECK-NEXT:   LBB16_8:                                # %try.cont
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 36] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor CL, CL
; CHECK-NEXT:    test  CL, CL
; CHECK-NEXT:    jne LBB16_10
; CHECK-NEXT:    jmp LBB16_9
; CHECK-NEXT:   LBB16_9:                                # %invoke.cont2
; CHECK-NEXT:    jmp LBB16_14
; CHECK-NEXT:   LBB16_10:                               # %lpad1
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 56] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 60], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB16_4
; CHECK-NEXT:    jmp LBB16_11
; CHECK-NEXT:   LBB16_11:                               # %catch.dispatch3
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 36] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 64], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 68], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB16_19
; CHECK-NEXT:    jmp LBB16_21
; CHECK-NEXT:   LBB16_21:                               # %catch.dispatch3
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 64] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB16_4
; CHECK-NEXT:    jmp LBB16_12
; CHECK-NEXT:   Ltmp74:                                 # Block address taken
; CHECK-NEXT:   LBB16_12:                               # %catch5
; CHECK-NEXT:    sub ESP, 84
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 36] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 4
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor CL, CL
; CHECK-NEXT:    test  CL, CL
; CHECK-NEXT:    jne LBB16_15
; CHECK-NEXT:    jmp LBB16_13
; CHECK-NEXT:   LBB16_13:                               # %invoke.cont7
; CHECK-NEXT:    jmp LBB16_18
; CHECK-NEXT:   Ltmp75:                                 # Block address taken
; CHECK-NEXT:   LBB16_14:                               # %try.cont4
; CHECK-NEXT:    mov EAX, 0
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 36] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [ECX], -1
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 12]
; CHECK-NEXT:    mov DWORD PTR FS:[0], ECX
; CHECK-NEXT:    add ESP, 100
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB16_15:                               # %lpad6
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 72] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 76], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB16_4
; CHECK-NEXT:    jmp LBB16_16
; CHECK-NEXT:   LBB16_16:                               # %catch.dispatch8
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 36] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 80], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 84], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB16_19
; CHECK-NEXT:    jmp LBB16_22
; CHECK-NEXT:   LBB16_22:                               # %catch.dispatch8
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 80] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB16_4
; CHECK-NEXT:    jmp LBB16_17
; CHECK-NEXT:   Ltmp76:                                 # Block address taken
; CHECK-NEXT:   LBB16_17:                               # %catch10
; CHECK-NEXT:    sub ESP, 84
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 36] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 3
; CHECK-NEXT:    add ESP, 84
; CHECK-NEXT:    mov EAX, Ltmp77
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp77:                                 # Block address taken
; CHECK-NEXT:   LBB16_18:                               # %try.cont9
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 36] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], -1
; CHECK-NEXT:    mov DWORD PTR [EAX], -1
; CHECK-NEXT:    add ESP, 84
; CHECK-NEXT:    mov EAX, Ltmp75
; CHECK-NEXT:    ret
; CHECK-NEXT:    jmp LBB16_14
; CHECK-NEXT:   LBB16_19:                               # %eh.resume

; CHECK:     .def   "?test11@@YAHXZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .globl  "?test11@@YAHXZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "?test11@@YAHXZ":                       # @"\01?test11@@YAHXZ"
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  -1
; CHECK-NEXT:    push  LBB17_6
; CHECK-NEXT:    mov EAX, DWORD PTR FS:[0]
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR FS:[0], ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    sub ESP, 64
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:   # BB#1:                                 # %seh.init.block
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 28]
; CHECK-NEXT:    sub ECX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test11@@YAHXZ$0+8], ECX
; CHECK-NEXT:   # BB#2:                                 # %after.seh.init
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    mov ECX, EAX
; CHECK-NEXT:    add ECX, -4
; CHECK-NEXT:    mov DWORD PTR [EAX - 4], 0
; CHECK-NEXT:    lea EAX, DWORD PTR [EBP - 24]
; CHECK-NEXT:    mov DWORD PTR [EBP - 32], ECX # 4-byte Spill
; CHECK-NEXT:    mov ECX, EAX
; CHECK-NEXT:    call  "??0A@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    mov DWORD PTR [EBP - 36], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB17_7
; CHECK-NEXT:    jmp LBB17_3
; CHECK-NEXT:   LBB17_3:                                # %invoke.cont
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 32] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 1
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor CL, CL
; CHECK-NEXT:    test  CL, CL
; CHECK-NEXT:    jne LBB17_8
; CHECK-NEXT:    jmp LBB17_4
; CHECK-NEXT:   LBB17_4:                                # %invoke.cont2
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 24]
; CHECK-NEXT:    call  "??1A@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB17_7
; CHECK-NEXT:    jmp LBB17_5
; CHECK-NEXT:   LBB17_5:                                # %invoke.cont3
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 32] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 0
; CHECK-NEXT:    jmp LBB17_13
; CHECK-NEXT:   LBB17_6:                                # %__ehhandler$test11@@YAHXZ
; CHECK-NEXT:    mov EAX, __ehfuncinfo$test11@@YAHXZ
; CHECK-NEXT:    jmp ___CxxFrameHandler3
; CHECK-NEXT:   LBB17_7:                                # %lpad
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 40] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 44], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB17_6
; CHECK-NEXT:    jmp LBB17_11
; CHECK-NEXT:   LBB17_8:                                # %lpad1
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 48] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 52], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB17_6
; CHECK-NEXT:    jmp LBB17_9
; CHECK-NEXT:   Ltmp80:                                 # Block address taken
; CHECK-NEXT:   LBB17_9:                                # %ehcleanup
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 24]
; CHECK-NEXT:    call  "??1A@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB17_15
; CHECK-NEXT:    jmp LBB17_10
; CHECK-NEXT:   LBB17_10:                               # %invoke.cont4
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB17_11:                               # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 32] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 56], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 60], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB17_14
; CHECK-NEXT:    jmp LBB17_16
; CHECK-NEXT:   LBB17_16:                               # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 56] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB17_6
; CHECK-NEXT:    jmp LBB17_12
; CHECK-NEXT:   Ltmp81:                                 # Block address taken
; CHECK-NEXT:   LBB17_12:                               # %catch
; CHECK-NEXT:    sub ESP, 64
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 32] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], -1
; CHECK-NEXT:    add ESP, 64
; CHECK-NEXT:    mov EAX, Ltmp82
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp82:                                 # Block address taken
; CHECK-NEXT:   LBB17_13:                               # %try.cont
; CHECK-NEXT:    mov EAX, 0
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 32] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [ECX], -1
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 12]
; CHECK-NEXT:    mov DWORD PTR FS:[0], ECX
; CHECK-NEXT:    add ESP, 80
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB17_14:                               # %eh.resume
; CHECK-NEXT:   LBB17_15:                               # %terminate.lpad

; CHECK:     .def   "?test12@@YAHXZ";
; CHECK-NEXT:    .scl  2;
; CHECK-NEXT:    .type 32;
; CHECK-NEXT:    .endef
; CHECK-NEXT:    .globl  "?test12@@YAHXZ"
; CHECK-NEXT:    .align  16, 0x90
; CHECK-NEXT:   "?test12@@YAHXZ":                       # @"\01?test12@@YAHXZ"
; CHECK-NEXT:   # BB#0:                                 # %entry
; CHECK-NEXT:    push  EBP
; CHECK-NEXT:    mov EBP, ESP
; CHECK-NEXT:    push  -1
; CHECK-NEXT:    push  LBB18_4
; CHECK-NEXT:    mov EAX, DWORD PTR FS:[0]
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    mov DWORD PTR FS:[0], ESP
; CHECK-NEXT:    push  EAX
; CHECK-NEXT:    sub ESP, 80
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:   # BB#1:                                 # %seh.init.block
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 28]
; CHECK-NEXT:    lea EDX, DWORD PTR [EBP - 20]
; CHECK-NEXT:    sub EDX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test12@@YAHXZ$1+8], EDX
; CHECK-NEXT:    sub ECX, EAX
; CHECK-NEXT:    mov DWORD PTR [__catchsym$test12@@YAHXZ$0+8], ECX
; CHECK-NEXT:   # BB#2:                                 # %after.seh.init
; CHECK-NEXT:    mov EAX, EBP
; CHECK-NEXT:    mov ECX, EAX
; CHECK-NEXT:    add ECX, -4
; CHECK-NEXT:    mov DWORD PTR [EAX - 4], 0
; CHECK-NEXT:    mov DWORD PTR [EBP - 32], ECX # 4-byte Spill
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    jne LBB18_5
; CHECK-NEXT:    jmp LBB18_3
; CHECK-NEXT:   LBB18_3:                                # %invoke.cont
; CHECK-NEXT:    jmp LBB18_11
; CHECK-NEXT:   LBB18_4:                                # %__ehhandler$test12@@YAHXZ
; CHECK-NEXT:    mov EAX, __ehfuncinfo$test12@@YAHXZ
; CHECK-NEXT:    jmp ___CxxFrameHandler3
; CHECK-NEXT:   LBB18_5:                                # %lpad
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 36] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 40], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB18_4
; CHECK-NEXT:    jmp LBB18_6
; CHECK-NEXT:   LBB18_6:                                # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 32] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 44], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 48], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB18_19
; CHECK-NEXT:    jmp LBB18_21
; CHECK-NEXT:   LBB18_21:                               # %catch.dispatch
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 44] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB18_4
; CHECK-NEXT:    jmp LBB18_7
; CHECK-NEXT:   Ltmp85:                                 # Block address taken
; CHECK-NEXT:   LBB18_7:                                # %catch
; CHECK-NEXT:    sub ESP, 80
; CHECK-NEXT:    mov DWORD PTR [EBP - 16], ESP
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 32] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 2
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 24]
; CHECK-NEXT:    call  "??0B@@QAE@XZ"
; CHECK-NEXT:    xor DL, DL
; CHECK-NEXT:    test  DL, DL
; CHECK-NEXT:    mov DWORD PTR [EBP - 52], EAX # 4-byte Spill
; CHECK-NEXT:    jne LBB18_12
; CHECK-NEXT:    jmp LBB18_8
; CHECK-NEXT:   LBB18_8:                                # %invoke.cont2
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 32] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 3
; CHECK-NEXT:    call  "?s@@YAXXZ"
; CHECK-NEXT:    xor CL, CL
; CHECK-NEXT:    test  CL, CL
; CHECK-NEXT:    jne LBB18_13
; CHECK-NEXT:    jmp LBB18_9
; CHECK-NEXT:   LBB18_9:                                # %invoke.cont4
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 24]
; CHECK-NEXT:    call  "??1B@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB18_12
; CHECK-NEXT:    jmp LBB18_10
; CHECK-NEXT:   LBB18_10:                               # %invoke.cont5
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 32] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 2
; CHECK-NEXT:    jmp LBB18_18
; CHECK-NEXT:   Ltmp86:                                 # Block address taken
; CHECK-NEXT:   LBB18_11:                               # %try.cont
; CHECK-NEXT:    mov EAX, 0
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 32] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [ECX], -1
; CHECK-NEXT:    mov ECX, DWORD PTR [EBP - 12]
; CHECK-NEXT:    mov DWORD PTR FS:[0], ECX
; CHECK-NEXT:    add ESP, 96
; CHECK-NEXT:    pop EBP
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB18_12:                               # %lpad1
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 56] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 60], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB18_4
; CHECK-NEXT:    jmp LBB18_16
; CHECK-NEXT:   LBB18_13:                               # %lpad3
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 64] # 4-byte Reload
; CHECK-NEXT:    sub EAX, -2
; CHECK-NEXT:    mov DWORD PTR [EBP - 68], EAX # 4-byte Spill
; CHECK-NEXT:    je  LBB18_4
; CHECK-NEXT:    jmp LBB18_14
; CHECK-NEXT:   Ltmp87:                                 # Block address taken
; CHECK-NEXT:   LBB18_14:                               # %ehcleanup
; CHECK-NEXT:    lea ECX, DWORD PTR [EBP - 24]
; CHECK-NEXT:    call  "??1B@@QAE@XZ"
; CHECK-NEXT:    xor AL, AL
; CHECK-NEXT:    test  AL, AL
; CHECK-NEXT:    jne LBB18_20
; CHECK-NEXT:    jmp LBB18_15
; CHECK-NEXT:   LBB18_15:                               # %invoke.cont6
; CHECK-NEXT:    ret
; CHECK-NEXT:   LBB18_16:                               # %catch.dispatch7
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 32] # 4-byte Reload
; CHECK-NEXT:    mov ECX, DWORD PTR [EAX]
; CHECK-NEXT:    mov EDX, ECX
; CHECK-NEXT:    sub EDX, -1
; CHECK-NEXT:    mov DWORD PTR [EBP - 72], ECX # 4-byte Spill
; CHECK-NEXT:    mov DWORD PTR [EBP - 76], EDX # 4-byte Spill
; CHECK-NEXT:    je  LBB18_19
; CHECK-NEXT:    jmp LBB18_22
; CHECK-NEXT:   LBB18_22:                               # %catch.dispatch7
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 72] # 4-byte Reload
; CHECK-NEXT:    test  EAX, EAX
; CHECK-NEXT:    jne LBB18_4
; CHECK-NEXT:    jmp LBB18_17
; CHECK-NEXT:   Ltmp88:                                 # Block address taken
; CHECK-NEXT:   LBB18_17:                               # %catch9
; CHECK-NEXT:    sub ESP, 80
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 32] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], 1
; CHECK-NEXT:    add ESP, 80
; CHECK-NEXT:    mov EAX, Ltmp89
; CHECK-NEXT:    ret
; CHECK-NEXT:   Ltmp89:                                 # Block address taken
; CHECK-NEXT:   LBB18_18:                               # %try.cont8
; CHECK-NEXT:    mov EAX, DWORD PTR [EBP - 32] # 4-byte Reload
; CHECK-NEXT:    mov DWORD PTR [EAX], -1
; CHECK-NEXT:    mov DWORD PTR [EAX], -1
; CHECK-NEXT:    add ESP, 80
; CHECK-NEXT:    mov EAX, Ltmp86
; CHECK-NEXT:    ret
; CHECK-NEXT:    jmp LBB18_11
; CHECK-NEXT:   LBB18_19:                               # %eh.resume
; CHECK-NEXT:   LBB18_20:                               # %terminate.lpad
   
; CHECK:     .section  .rdata$?_R0H@8,"r"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "??_R0H@8"              # @"\01??_R0H@8"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   "??_R0H@8":
; CHECK-NEXT:    .long "??_7type_info@@6B@"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .asciz   ".H"
; CHECK-NEXT:    .zero 1
 
; CHECK:     .section  .data$_CT??_R0H@84,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "__CT??_R0H@84"         # @"\01__CT??_R0H@84"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   "__CT??_R0H@84":
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 4                       # 0x4
; CHECK-NEXT:    .long 0

; CHECK:     .section  .data$_CTA1H,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __CTA1H                 # @"\01__CTA1H"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __CTA1H:
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long "__CT??_R0H@84"

; CHECK:     .section  .data$_TI1H,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __TI1H                  # @"\01__TI1H"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __TI1H:
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long __CTA1H
 
; CHECK:     .section  .rdata$?_R0?AUA@@@8,"r"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "??_R0?AUA@@@8"         # @"\01??_R0?AUA@@@8"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   "??_R0?AUA@@@8":
; CHECK-NEXT:    .long "??_7type_info@@6B@"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .asciz   ".?AUA@@"
  
; CHECK:     .section  .data$_CT??_R0?AUA@@@81,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "__CT??_R0?AUA@@@81"    # @"\01__CT??_R0?AUA@@@81"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   "__CT??_R0?AUA@@@81":
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long "??_R0?AUA@@@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 0
 
; CHECK:     .section  .data$_CTA1?AUA@@,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "__CTA1?AUA@@"          # @"\01__CTA1?AUA@@"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   "__CTA1?AUA@@":
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long "__CT??_R0?AUA@@@81"

; CHECK:     .section  .data$_TI1?AUA@@,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "__TI1?AUA@@"           # @"\01__TI1?AUA@@"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   "__TI1?AUA@@":
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long "??1A@@QAE@XZ"
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long "__CTA1?AUA@@"
  
; CHECK:     .section  .data$_catchsym$test1@@YAHXZ$0,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test1@@YAHXZ$0 # @"\01__catchsym$test1@@YAHXZ$0"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test1@@YAHXZ$0:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0?AUA@@@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp7

; CHECK:     .section  .data$_tryblocktable$test1@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __tryblocktable$test1@@YAHXZ # @"\01__tryblocktable$test1@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __tryblocktable$test1@@YAHXZ:
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long 3                       # 0x3
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test1@@YAHXZ$0

; CHECK:     .section  .data$_unwindtable$test1@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __unwindtable$test1@@YAHXZ # @"\01__unwindtable$test1@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __unwindtable$test1@@YAHXZ:
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp6
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0

; CHECK:     .section  .data$_ehfuncinfo$test1@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __ehfuncinfo$test1@@YAHXZ # @"\01__ehfuncinfo$test1@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __ehfuncinfo$test1@@YAHXZ:
; CHECK-NEXT:    .long 429065506               # 0x19930522
; CHECK-NEXT:    .long 4                       # 0x4
; CHECK-NEXT:    .long __unwindtable$test1@@YAHXZ
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __tryblocktable$test1@@YAHXZ
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 1                       # 0x1

; CHECK:     .section  .rdata$?_R0?AUB@@@8,"r"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "??_R0?AUB@@@8"         # @"\01??_R0?AUB@@@8"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   "??_R0?AUB@@@8":
; CHECK-NEXT:    .long "??_7type_info@@6B@"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .asciz   ".?AUB@@"

; CHECK:     .section  .data$_catchsym$test2@@YAHXZ$0,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test2@@YAHXZ$0 # @"\01__catchsym$test2@@YAHXZ$0"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test2@@YAHXZ$0:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0?AUB@@@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp13

; CHECK:     .section  .data$_catchsym$test2@@YAHXZ$1,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test2@@YAHXZ$1 # @"\01__catchsym$test2@@YAHXZ$1"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test2@@YAHXZ$1:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp11

; CHECK:     .section  .data$_tryblocktable$test2@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __tryblocktable$test2@@YAHXZ # @"\01__tryblocktable$test2@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __tryblocktable$test2@@YAHXZ:
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test2@@YAHXZ$0
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long 3                       # 0x3
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test2@@YAHXZ$1

; CHECK:     .section  .data$_unwindtable$test2@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __unwindtable$test2@@YAHXZ # @"\01__unwindtable$test2@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __unwindtable$test2@@YAHXZ:
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .zero 8
; CHECK-NEXT:    .zero 8
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
  
; CHECK:     .section  .data$_ehfuncinfo$test2@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __ehfuncinfo$test2@@YAHXZ # @"\01__ehfuncinfo$test2@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __ehfuncinfo$test2@@YAHXZ:
; CHECK-NEXT:    .long 429065506               # 0x19930522
; CHECK-NEXT:    .long 4                       # 0x4
; CHECK-NEXT:    .long __unwindtable$test2@@YAHXZ
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long __tryblocktable$test2@@YAHXZ
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 1                       # 0x1

; CHECK:     .section  .data$_catchsym$test3@@YAHXZ$0,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test3@@YAHXZ$0 # @"\01__catchsym$test3@@YAHXZ$0"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test3@@YAHXZ$0:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp17
  
; CHECK:     .section  .data$_catchsym$test3@@YAHXZ$1,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test3@@YAHXZ$1 # @"\01__catchsym$test3@@YAHXZ$1"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test3@@YAHXZ$1:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp19
 
; CHECK:     .section  .data$_tryblocktable$test3@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __tryblocktable$test3@@YAHXZ # @"\01__tryblocktable$test3@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __tryblocktable$test3@@YAHXZ:
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test3@@YAHXZ$0
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long 3                       # 0x3
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test3@@YAHXZ$1
  
; CHECK:     .section  .data$_unwindtable$test3@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __unwindtable$test3@@YAHXZ # @"\01__unwindtable$test3@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __unwindtable$test3@@YAHXZ:
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
  
; CHECK:     .section  .data$_ehfuncinfo$test3@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __ehfuncinfo$test3@@YAHXZ # @"\01__ehfuncinfo$test3@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __ehfuncinfo$test3@@YAHXZ:
; CHECK-NEXT:    .long 429065506               # 0x19930522
; CHECK-NEXT:    .long 4                       # 0x4
; CHECK-NEXT:    .long __unwindtable$test3@@YAHXZ
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long __tryblocktable$test3@@YAHXZ
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 1                       # 0x1
 
; CHECK:     .section  .rdata$?_R0?AUC@@@8,"r"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "??_R0?AUC@@@8"         # @"\01??_R0?AUC@@@8"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   "??_R0?AUC@@@8":
; CHECK-NEXT:    .long "??_7type_info@@6B@"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .asciz   ".?AUC@@"

; CHECK:     .section  .data$_catchsym$test4@@YAHXZ$0,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test4@@YAHXZ$0 # @"\01__catchsym$test4@@YAHXZ$0"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test4@@YAHXZ$0:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp23
 
; CHECK:     .section  .data$_catchsym$test4@@YAHXZ$1,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test4@@YAHXZ$1 # @"\01__catchsym$test4@@YAHXZ$1"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test4@@YAHXZ$1:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp27
 
; CHECK:     .section  .data$_catchsym$test4@@YAHXZ$2,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test4@@YAHXZ$2 # @"\01__catchsym$test4@@YAHXZ$2"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test4@@YAHXZ$2:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0?AUC@@@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp25
   
; CHECK:     .section  .data$_tryblocktable$test4@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __tryblocktable$test4@@YAHXZ # @"\01__tryblocktable$test4@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __tryblocktable$test4@@YAHXZ:
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test4@@YAHXZ$0
; CHECK-NEXT:    .long 3                       # 0x3
; CHECK-NEXT:    .long 3                       # 0x3
; CHECK-NEXT:    .long 4                       # 0x4
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test4@@YAHXZ$1
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 4                       # 0x4
; CHECK-NEXT:    .long 5                       # 0x5
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test4@@YAHXZ$2
  
; CHECK:     .section  .data$_unwindtable$test4@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __unwindtable$test4@@YAHXZ # @"\01__unwindtable$test4@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __unwindtable$test4@@YAHXZ:
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .zero 8
; CHECK-NEXT:    .zero 8
; CHECK-NEXT:    .zero 8
; CHECK-NEXT:    .zero 8
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0

; CHECK:     .section  .data$_ehfuncinfo$test4@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __ehfuncinfo$test4@@YAHXZ # @"\01__ehfuncinfo$test4@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __ehfuncinfo$test4@@YAHXZ:
; CHECK-NEXT:    .long 429065506               # 0x19930522
; CHECK-NEXT:    .long 6                       # 0x6
; CHECK-NEXT:    .long __unwindtable$test4@@YAHXZ
; CHECK-NEXT:    .long 3                       # 0x3
; CHECK-NEXT:    .long __tryblocktable$test4@@YAHXZ
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 1                       # 0x1
 
; CHECK:     .section  .data$_catchsym$test5@@YAHXZ$0,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test5@@YAHXZ$0 # @"\01__catchsym$test5@@YAHXZ$0"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test5@@YAHXZ$0:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp33
  
; CHECK:     .section  .data$_catchsym$test5@@YAHXZ$1,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test5@@YAHXZ$1 # @"\01__catchsym$test5@@YAHXZ$1"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test5@@YAHXZ$1:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp39
 
; CHECK:     .section  .data$_catchsym$test5@@YAHXZ$2,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test5@@YAHXZ$2 # @"\01__catchsym$test5@@YAHXZ$2"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test5@@YAHXZ$2:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp37
 
; CHECK:     .section  .data$_tryblocktable$test5@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __tryblocktable$test5@@YAHXZ # @"\01__tryblocktable$test5@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __tryblocktable$test5@@YAHXZ:
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 3                       # 0x3
; CHECK-NEXT:    .long 4                       # 0x4
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test5@@YAHXZ$0
; CHECK-NEXT:    .long 5                       # 0x5
; CHECK-NEXT:    .long 7                       # 0x7
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test5@@YAHXZ$1
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long 9                       # 0x9
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test5@@YAHXZ$2
  
; CHECK:     .section  .data$_unwindtable$test5@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __unwindtable$test5@@YAHXZ # @"\01__unwindtable$test5@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __unwindtable$test5@@YAHXZ:
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .zero 8
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long Ltmp32
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long Ltmp31
; CHECK-NEXT:    .zero 8
; CHECK-NEXT:    .zero 8
; CHECK-NEXT:    .long 5                       # 0x5
; CHECK-NEXT:    .long Ltmp36
; CHECK-NEXT:    .long 6                       # 0x6
; CHECK-NEXT:    .long Ltmp35
; CHECK-NEXT:    .zero 8
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
  
; CHECK:     .section  .data$_ehfuncinfo$test5@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __ehfuncinfo$test5@@YAHXZ # @"\01__ehfuncinfo$test5@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __ehfuncinfo$test5@@YAHXZ:
; CHECK-NEXT:    .long 429065506               # 0x19930522
; CHECK-NEXT:    .long 10                      # 0xa
; CHECK-NEXT:    .long __unwindtable$test5@@YAHXZ
; CHECK-NEXT:    .long 3                       # 0x3
; CHECK-NEXT:    .long __tryblocktable$test5@@YAHXZ
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 1                       # 0x1
 
; CHECK:     .section  .data$_catchsym$test6@@YAHXZ$0,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test6@@YAHXZ$0 # @"\01__catchsym$test6@@YAHXZ$0"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test6@@YAHXZ$0:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp47
   
; CHECK:     .section  .data$_catchsym$test6@@YAHXZ$1,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test6@@YAHXZ$1 # @"\01__catchsym$test6@@YAHXZ$1"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test6@@YAHXZ$1:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp45
 
; CHECK:     .section  .data$_catchsym$test6@@YAHXZ$2,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test6@@YAHXZ$2 # @"\01__catchsym$test6@@YAHXZ$2"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test6@@YAHXZ$2:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp54
 
; CHECK:     .section  .data$_catchsym$test6@@YAHXZ$3,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test6@@YAHXZ$3 # @"\01__catchsym$test6@@YAHXZ$3"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test6@@YAHXZ$3:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp52
   
; CHECK:     .section  .data$_tryblocktable$test6@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __tryblocktable$test6@@YAHXZ # @"\01__tryblocktable$test6@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __tryblocktable$test6@@YAHXZ:
; CHECK-NEXT:    .long 7                       # 0x7
; CHECK-NEXT:    .long 7                       # 0x7
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test6@@YAHXZ$0
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long 4                       # 0x4
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test6@@YAHXZ$1
; CHECK-NEXT:    .long 10                      # 0xa
; CHECK-NEXT:    .long 12                      # 0xc
; CHECK-NEXT:    .long 13                      # 0xd
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test6@@YAHXZ$2
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 13                      # 0xd
; CHECK-NEXT:    .long 14                      # 0xe
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test6@@YAHXZ$3
   
; CHECK:     .section  .data$_unwindtable$test6@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __unwindtable$test6@@YAHXZ # @"\01__unwindtable$test6@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __unwindtable$test6@@YAHXZ:
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long Ltmp56
; CHECK-NEXT:    .zero 8
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long Ltmp44
; CHECK-NEXT:    .long 3                       # 0x3
; CHECK-NEXT:    .long Ltmp43
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 5                       # 0x5
; CHECK-NEXT:    .long Ltmp49
; CHECK-NEXT:    .long 6                       # 0x6
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 6                       # 0x6
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 6                       # 0x6
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 10                      # 0xa
; CHECK-NEXT:    .long Ltmp51
; CHECK-NEXT:    .long 11                      # 0xb
; CHECK-NEXT:    .long Ltmp50
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .zero 8
 
; CHECK:     .section  .data$_ehfuncinfo$test6@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __ehfuncinfo$test6@@YAHXZ # @"\01__ehfuncinfo$test6@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __ehfuncinfo$test6@@YAHXZ:
; CHECK-NEXT:    .long 429065506               # 0x19930522
; CHECK-NEXT:    .long 15                      # 0xf
; CHECK-NEXT:    .long __unwindtable$test6@@YAHXZ
; CHECK-NEXT:    .long 4                       # 0x4
; CHECK-NEXT:    .long __tryblocktable$test6@@YAHXZ
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 1                       # 0x1

; CHECK:     .section  .data$_catchsym$test7@@YAHXZ$0,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test7@@YAHXZ$0 # @"\01__catchsym$test7@@YAHXZ$0"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test7@@YAHXZ$0:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0?AUA@@@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp59
   
; CHECK:     .section  .data$_tryblocktable$test7@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __tryblocktable$test7@@YAHXZ # @"\01__tryblocktable$test7@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __tryblocktable$test7@@YAHXZ:
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test7@@YAHXZ$0
  
; CHECK:     .section  .data$_unwindtable$test7@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __unwindtable$test7@@YAHXZ # @"\01__unwindtable$test7@@YAHXZ"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __unwindtable$test7@@YAHXZ:
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
  
; CHECK:     .section  .data$_ehfuncinfo$test7@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __ehfuncinfo$test7@@YAHXZ # @"\01__ehfuncinfo$test7@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __ehfuncinfo$test7@@YAHXZ:
; CHECK-NEXT:    .long 429065506               # 0x19930522
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long __unwindtable$test7@@YAHXZ
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __tryblocktable$test7@@YAHXZ
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 1                       # 0x1
   
; CHECK:     .section  .rdata$?_R0?AUD@@@8,"r"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "??_R0?AUD@@@8"         # @"\01??_R0?AUD@@@8"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   "??_R0?AUD@@@8":
; CHECK-NEXT:    .long "??_7type_info@@6B@"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .asciz   ".?AUD@@"
  
; CHECK:     .section  .data$_CT??_R0?AUD@@@81,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "__CT??_R0?AUD@@@81"    # @"\01__CT??_R0?AUD@@@81"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   "__CT??_R0?AUD@@@81":
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long "??_R0?AUD@@@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 0
  
; CHECK:     .section  .data$_CTA1?AUD@@,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "__CTA1?AUD@@"          # @"\01__CTA1?AUD@@"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   "__CTA1?AUD@@":
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long "__CT??_R0?AUD@@@81"

; CHECK:     .section  .data$_TI1?AUD@@,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  "__TI1?AUD@@"           # @"\01__TI1?AUD@@"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   "__TI1?AUD@@":
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long "??1D@@QAE@XZ"
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long "__CTA1?AUD@@"
  
; CHECK:     .section  .data$_catchsym$test8@@YAHXZ$0,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test8@@YAHXZ$0 # @"\01__catchsym$test8@@YAHXZ$0"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test8@@YAHXZ$0:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0?AUD@@@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp63
  
; CHECK:     .section  .data$_tryblocktable$test8@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __tryblocktable$test8@@YAHXZ # @"\01__tryblocktable$test8@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __tryblocktable$test8@@YAHXZ:
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test8@@YAHXZ$0

; CHECK:     .section  .data$_unwindtable$test8@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __unwindtable$test8@@YAHXZ # @"\01__unwindtable$test8@@YAHXZ"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __unwindtable$test8@@YAHXZ:
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
 
; CHECK:     .section  .data$_ehfuncinfo$test8@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __ehfuncinfo$test8@@YAHXZ # @"\01__ehfuncinfo$test8@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __ehfuncinfo$test8@@YAHXZ:
; CHECK-NEXT:    .long 429065506               # 0x19930522
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long __unwindtable$test8@@YAHXZ
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __tryblocktable$test8@@YAHXZ
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 1                       # 0x1
   
; CHECK:     .section  .data$_catchsym$test9@@YAHXZ$0,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test9@@YAHXZ$0 # @"\01__catchsym$test9@@YAHXZ$0"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test9@@YAHXZ$0:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0?AUD@@@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp68
 
; CHECK:     .section  .data$_tryblocktable$test9@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __tryblocktable$test9@@YAHXZ # @"\01__tryblocktable$test9@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __tryblocktable$test9@@YAHXZ:
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test9@@YAHXZ$0
 
; CHECK:     .section  .data$_unwindtable$test9@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __unwindtable$test9@@YAHXZ # @"\01__unwindtable$test9@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __unwindtable$test9@@YAHXZ:
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp67
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0

; CHECK:     .section  .data$_ehfuncinfo$test9@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __ehfuncinfo$test9@@YAHXZ # @"\01__ehfuncinfo$test9@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __ehfuncinfo$test9@@YAHXZ:
; CHECK-NEXT:    .long 429065506               # 0x19930522
; CHECK-NEXT:    .long 3                       # 0x3
; CHECK-NEXT:    .long __unwindtable$test9@@YAHXZ
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __tryblocktable$test9@@YAHXZ
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 1                       # 0x1
   
; CHECK:     .section  .data$_catchsym$test10@@YAHXZ$0,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test10@@YAHXZ$0 # @"\01__catchsym$test10@@YAHXZ$0"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test10@@YAHXZ$0:
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp72

; CHECK:     .section  .data$_catchsym$test10@@YAHXZ$1,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test10@@YAHXZ$1 # @"\01__catchsym$test10@@YAHXZ$1"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test10@@YAHXZ$1:
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp76
 
; CHECK:     .section  .data$_catchsym$test10@@YAHXZ$2,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test10@@YAHXZ$2 # @"\01__catchsym$test10@@YAHXZ$2"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test10@@YAHXZ$2:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp74

; CHECK:     .section  .data$_tryblocktable$test10@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __tryblocktable$test10@@YAHXZ # @"\01__tryblocktable$test10@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __tryblocktable$test10@@YAHXZ:
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test10@@YAHXZ$0
; CHECK-NEXT:    .long 4                       # 0x4
; CHECK-NEXT:    .long 4                       # 0x4
; CHECK-NEXT:    .long 5                       # 0x5
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test10@@YAHXZ$1
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long 5                       # 0x5
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test10@@YAHXZ$2
  
; CHECK:     .section  .data$_unwindtable$test10@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __unwindtable$test10@@YAHXZ # @"\01__unwindtable$test10@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __unwindtable$test10@@YAHXZ:
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .zero 8
; CHECK-NEXT:    .zero 8
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 3                       # 0x3
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 3                       # 0x3
; CHECK-NEXT:    .long 0
  
; CHECK:     .section  .data$_ehfuncinfo$test10@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __ehfuncinfo$test10@@YAHXZ # @"\01__ehfuncinfo$test10@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __ehfuncinfo$test10@@YAHXZ:
; CHECK-NEXT:    .long 429065506               # 0x19930522
; CHECK-NEXT:    .long 6                       # 0x6
; CHECK-NEXT:    .long __unwindtable$test10@@YAHXZ
; CHECK-NEXT:    .long 3                       # 0x3
; CHECK-NEXT:    .long __tryblocktable$test10@@YAHXZ
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 1                       # 0x1
  
; CHECK:     .section  .data$_catchsym$test11@@YAHXZ$0,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test11@@YAHXZ$0 # @"\01__catchsym$test11@@YAHXZ$0"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test11@@YAHXZ$0:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp81
   
; CHECK:     .section  .data$_tryblocktable$test11@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __tryblocktable$test11@@YAHXZ # @"\01__tryblocktable$test11@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __tryblocktable$test11@@YAHXZ:
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test11@@YAHXZ$0
  
; CHECK:     .section  .data$_unwindtable$test11@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __unwindtable$test11@@YAHXZ # @"\01__unwindtable$test11@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __unwindtable$test11@@YAHXZ:
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp80
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
 
; CHECK:     .section  .data$_ehfuncinfo$test11@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __ehfuncinfo$test11@@YAHXZ # @"\01__ehfuncinfo$test11@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __ehfuncinfo$test11@@YAHXZ:
; CHECK-NEXT:    .long 429065506               # 0x19930522
; CHECK-NEXT:    .long 3                       # 0x3
; CHECK-NEXT:    .long __unwindtable$test11@@YAHXZ
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __tryblocktable$test11@@YAHXZ
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 1                       # 0x1

; CHECK:     .section  .data$_catchsym$test12@@YAHXZ$0,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test12@@YAHXZ$0 # @"\01__catchsym$test12@@YAHXZ$0"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test12@@YAHXZ$0:
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp88
  
; CHECK:     .section  .data$_catchsym$test12@@YAHXZ$1,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __catchsym$test12@@YAHXZ$1 # @"\01__catchsym$test12@@YAHXZ$1"
; CHECK-NEXT:    .align  8
; CHECK-NEXT:   __catchsym$test12@@YAHXZ$1:
; CHECK-NEXT:    .long 8                       # 0x8
; CHECK-NEXT:    .long "??_R0H@8"
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long Ltmp85
  
; CHECK:     .section  .data$_tryblocktable$test12@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __tryblocktable$test12@@YAHXZ # @"\01__tryblocktable$test12@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __tryblocktable$test12@@YAHXZ:
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long 3                       # 0x3
; CHECK-NEXT:    .long 4                       # 0x4
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test12@@YAHXZ$0
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 4                       # 0x4
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long __catchsym$test12@@YAHXZ$1
  
; CHECK:     .section  .data$_unwindtable$test12@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __unwindtable$test12@@YAHXZ # @"\01__unwindtable$test12@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __unwindtable$test12@@YAHXZ:
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 4294967295              # 0xffffffff
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long Ltmp87
; CHECK-NEXT:    .long 1                       # 0x1
; CHECK-NEXT:    .long 0
 
; CHECK:     .section  .data$_ehfuncinfo$test12@@YAHXZ,"w"
; CHECK-NEXT:    .linkonce discard
; CHECK-NEXT:    .globl  __ehfuncinfo$test12@@YAHXZ # @"\01__ehfuncinfo$test12@@YAHXZ"
; CHECK-NEXT:    .align  16
; CHECK-NEXT:   __ehfuncinfo$test12@@YAHXZ:
; CHECK-NEXT:    .long 429065506               # 0x19930522
; CHECK-NEXT:    .long 5                       # 0x5
; CHECK-NEXT:    .long __unwindtable$test12@@YAHXZ
; CHECK-NEXT:    .long 2                       # 0x2
; CHECK-NEXT:    .long __tryblocktable$test12@@YAHXZ
; CHECK-NEXT:    .long 0                       # 0x0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 0
; CHECK-NEXT:    .long 1                       # 0x1
