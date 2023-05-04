; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68_badData = dso_local global %struct._twoIntsStruct* null, align 8, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68_goodG2BData = dso_local global %struct._twoIntsStruct* null, align 8, !dbg !15
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68_bad() #0 !dbg !25 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !29, metadata !DIExpression()), !dbg !30
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataBuffer, metadata !32, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %0, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %1, !dbg !53
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !54
  store i32 1, i32* %intOne, align 8, !dbg !55
  %2 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %2, !dbg !57
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !58
  store i32 1, i32* %intTwo, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %3, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 0, !dbg !66
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !67
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !68
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68_badData, align 8, !dbg !69
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68b_badSink(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68b_badSink(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !81
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !82
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !83
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !81
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !84
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @exit(i32 noundef 1) #6, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !91, metadata !DIExpression()), !dbg !93
  store i64 0, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !96

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !97
  %cmp1 = icmp ult i64 %2, 100, !dbg !99
  br i1 %cmp1, label %for.body, label %for.end, !dbg !100

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !101
  %4 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !101
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !104
  store i32 1, i32* %intOne, align 4, !dbg !105
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !106
  %6 = load i64, i64* %i, align 8, !dbg !107
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !106
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !108
  store i32 1, i32* %intTwo, align 4, !dbg !109
  br label %for.inc, !dbg !110

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !111
  %inc = add i64 %7, 1, !dbg !111
  store i64 %inc, i64* %i, align 8, !dbg !111
  br label %for.cond, !dbg !112, !llvm.loop !113

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !115
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !116
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !117
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68_goodG2BData, align 8, !dbg !118
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68b_goodG2BSink(), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68b_goodG2BSink(...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68_badData", scope: !2, file: !3, line: 21, type: !5, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "f341da7e18bbf2664112fa6f1cc406b4")
!4 = !{!5, !13}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !7, line: 100, baseType: !8)
!7 = !DIFile(filename: "./std_testcase.h", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1dccefb0310558c17683ded20b0d6982")
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !7, line: 96, size: 64, elements: !9)
!9 = !{!10, !12}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !8, file: !7, line: 98, baseType: !11, size: 32)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !8, file: !7, line: 99, baseType: !11, size: 32, offset: 32)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68_goodG2BData", scope: !2, file: !3, line: 22, type: !5, isLocal: false, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 5}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"PIC Level", i32 2}
!21 = !{i32 7, !"PIE Level", i32 2}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!25 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68_bad", scope: !3, file: !3, line: 29, type: !26, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !{}
!29 = !DILocalVariable(name: "data", scope: !25, file: !3, line: 31, type: !5)
!30 = !DILocation(line: 31, column: 21, scope: !25)
!31 = !DILocation(line: 32, column: 10, scope: !25)
!32 = !DILocalVariable(name: "dataBuffer", scope: !33, file: !3, line: 35, type: !34)
!33 = distinct !DILexicalBlock(scope: !25, file: !3, line: 33, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 35, column: 23, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !39, file: !3, line: 37, type: !40)
!39 = distinct !DILexicalBlock(scope: !33, file: !3, line: 36, column: 9)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 37, column: 20, scope: !39)
!44 = !DILocation(line: 38, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !3, line: 38, column: 13)
!46 = !DILocation(line: 38, column: 18, scope: !45)
!47 = !DILocation(line: 38, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !3, line: 38, column: 13)
!49 = !DILocation(line: 38, column: 27, scope: !48)
!50 = !DILocation(line: 38, column: 13, scope: !45)
!51 = !DILocation(line: 40, column: 28, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !3, line: 39, column: 13)
!53 = !DILocation(line: 40, column: 17, scope: !52)
!54 = !DILocation(line: 40, column: 31, scope: !52)
!55 = !DILocation(line: 40, column: 38, scope: !52)
!56 = !DILocation(line: 41, column: 28, scope: !52)
!57 = !DILocation(line: 41, column: 17, scope: !52)
!58 = !DILocation(line: 41, column: 31, scope: !52)
!59 = !DILocation(line: 41, column: 38, scope: !52)
!60 = !DILocation(line: 42, column: 13, scope: !52)
!61 = !DILocation(line: 38, column: 35, scope: !48)
!62 = !DILocation(line: 38, column: 13, scope: !48)
!63 = distinct !{!63, !50, !64, !65}
!64 = !DILocation(line: 42, column: 13, scope: !45)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 44, column: 16, scope: !33)
!67 = !DILocation(line: 44, column: 14, scope: !33)
!68 = !DILocation(line: 46, column: 70, scope: !25)
!69 = !DILocation(line: 46, column: 68, scope: !25)
!70 = !DILocation(line: 47, column: 5, scope: !25)
!71 = !DILocation(line: 48, column: 1, scope: !25)
!72 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68_good", scope: !3, file: !3, line: 84, type: !26, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!73 = !DILocation(line: 86, column: 5, scope: !72)
!74 = !DILocation(line: 87, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 58, type: !26, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!76 = !DILocalVariable(name: "data", scope: !75, file: !3, line: 60, type: !5)
!77 = !DILocation(line: 60, column: 21, scope: !75)
!78 = !DILocation(line: 61, column: 10, scope: !75)
!79 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !3, line: 64, type: !5)
!80 = distinct !DILexicalBlock(scope: !75, file: !3, line: 62, column: 5)
!81 = !DILocation(line: 64, column: 25, scope: !80)
!82 = !DILocation(line: 64, column: 55, scope: !80)
!83 = !DILocation(line: 64, column: 38, scope: !80)
!84 = !DILocation(line: 65, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !3, line: 65, column: 13)
!86 = !DILocation(line: 65, column: 24, scope: !85)
!87 = !DILocation(line: 65, column: 13, scope: !80)
!88 = !DILocation(line: 67, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !3, line: 66, column: 9)
!90 = !DILocation(line: 68, column: 13, scope: !89)
!91 = !DILocalVariable(name: "i", scope: !92, file: !3, line: 71, type: !40)
!92 = distinct !DILexicalBlock(scope: !80, file: !3, line: 70, column: 9)
!93 = !DILocation(line: 71, column: 20, scope: !92)
!94 = !DILocation(line: 72, column: 20, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !3, line: 72, column: 13)
!96 = !DILocation(line: 72, column: 18, scope: !95)
!97 = !DILocation(line: 72, column: 25, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !3, line: 72, column: 13)
!99 = !DILocation(line: 72, column: 27, scope: !98)
!100 = !DILocation(line: 72, column: 13, scope: !95)
!101 = !DILocation(line: 74, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !3, line: 73, column: 13)
!103 = !DILocation(line: 74, column: 28, scope: !102)
!104 = !DILocation(line: 74, column: 31, scope: !102)
!105 = !DILocation(line: 74, column: 38, scope: !102)
!106 = !DILocation(line: 75, column: 17, scope: !102)
!107 = !DILocation(line: 75, column: 28, scope: !102)
!108 = !DILocation(line: 75, column: 31, scope: !102)
!109 = !DILocation(line: 75, column: 38, scope: !102)
!110 = !DILocation(line: 76, column: 13, scope: !102)
!111 = !DILocation(line: 72, column: 35, scope: !98)
!112 = !DILocation(line: 72, column: 13, scope: !98)
!113 = distinct !{!113, !100, !114, !65}
!114 = !DILocation(line: 76, column: 13, scope: !95)
!115 = !DILocation(line: 78, column: 16, scope: !80)
!116 = !DILocation(line: 78, column: 14, scope: !80)
!117 = !DILocation(line: 80, column: 74, scope: !75)
!118 = !DILocation(line: 80, column: 72, scope: !75)
!119 = !DILocation(line: 81, column: 5, scope: !75)
!120 = !DILocation(line: 82, column: 1, scope: !75)
