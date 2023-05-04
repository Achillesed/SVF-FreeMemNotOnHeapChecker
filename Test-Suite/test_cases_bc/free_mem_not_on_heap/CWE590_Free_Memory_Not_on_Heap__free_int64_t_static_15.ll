; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_15.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_15_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_15_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i64* null, i64** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %0, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_15_bad.dataBuffer, i64 0, i64 %1, !dbg !47
  store i64 5, i64* %arrayidx, align 8, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %2, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_15_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !55
  %3 = load i64*, i64** %data, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds i64, i64* %3, i64 0, !dbg !56
  %4 = load i64, i64* %arrayidx1, align 8, !dbg !56
  call void @printLongLongLine(i64 noundef %4), !dbg !57
  %5 = load i64*, i64** %data, align 8, !dbg !58
  %6 = bitcast i64* %5 to i8*, !dbg !58
  call void @free(i8* noundef %6) #5, !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_15_good() #0 !dbg !61 {
entry:
  call void @goodG2B1(), !dbg !62
  call void @goodG2B2(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !65 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !66, metadata !DIExpression()), !dbg !67
  store i64* null, i64** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !69, metadata !DIExpression()), !dbg !71
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !72
  %0 = bitcast i8* %call to i64*, !dbg !73
  store i64* %0, i64** %dataBuffer, align 8, !dbg !71
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !74
  %cmp = icmp eq i64* %1, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @exit(i32 noundef 1) #6, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !81, metadata !DIExpression()), !dbg !83
  store i64 0, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !87
  %cmp1 = icmp ult i64 %2, 100, !dbg !89
  br i1 %cmp1, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !91
  %4 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !91
  store i64 5, i64* %arrayidx, align 8, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %5, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !100
  store i64* %6, i64** %data, align 8, !dbg !101
  %7 = load i64*, i64** %data, align 8, !dbg !102
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !102
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !102
  call void @printLongLongLine(i64 noundef %8), !dbg !103
  %9 = load i64*, i64** %data, align 8, !dbg !104
  %10 = bitcast i64* %9 to i8*, !dbg !104
  call void @free(i8* noundef %10) #5, !dbg !105
  ret void, !dbg !106
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i64* null, i64** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !111, metadata !DIExpression()), !dbg !113
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !114
  %0 = bitcast i8* %call to i64*, !dbg !115
  store i64* %0, i64** %dataBuffer, align 8, !dbg !113
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !116
  %cmp = icmp eq i64* %1, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !120
  call void @exit(i32 noundef 1) #6, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !129
  %cmp1 = icmp ult i64 %2, 100, !dbg !131
  br i1 %cmp1, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !133
  %4 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !133
  store i64 5, i64* %arrayidx, align 8, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %5, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !142
  store i64* %6, i64** %data, align 8, !dbg !143
  %7 = load i64*, i64** %data, align 8, !dbg !144
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !144
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !144
  call void @printLongLongLine(i64 noundef %8), !dbg !145
  %9 = load i64*, i64** %data, align 8, !dbg !146
  %10 = bitcast i64* %9 to i8*, !dbg !146
  call void @free(i8* noundef %10) #5, !dbg !147
  ret void, !dbg !148
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!20, !21, !22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 32, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_15_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_15.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "25194a25f2693704f8fd2a5dd53bae68")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !15, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !14}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !10, line: 27, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !12, line: 44, baseType: !13)
!12 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!13 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !{!0}
!16 = !{}
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 6400, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 100)
!20 = !{i32 7, !"Dwarf Version", i32 5}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"PIC Level", i32 2}
!24 = !{i32 7, !"PIE Level", i32 2}
!25 = !{i32 7, !"uwtable", i32 1}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!28 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 25, type: !8)
!29 = !DILocation(line: 25, column: 15, scope: !2)
!30 = !DILocation(line: 26, column: 10, scope: !2)
!31 = !DILocalVariable(name: "i", scope: !32, file: !3, line: 34, type: !34)
!32 = distinct !DILexicalBlock(scope: !33, file: !3, line: 33, column: 9)
!33 = distinct !DILexicalBlock(scope: !2, file: !3, line: 30, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 34, column: 20, scope: !32)
!38 = !DILocation(line: 35, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !3, line: 35, column: 13)
!40 = !DILocation(line: 35, column: 18, scope: !39)
!41 = !DILocation(line: 35, column: 25, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !3, line: 35, column: 13)
!43 = !DILocation(line: 35, column: 27, scope: !42)
!44 = !DILocation(line: 35, column: 13, scope: !39)
!45 = !DILocation(line: 37, column: 28, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !3, line: 36, column: 13)
!47 = !DILocation(line: 37, column: 17, scope: !46)
!48 = !DILocation(line: 37, column: 31, scope: !46)
!49 = !DILocation(line: 38, column: 13, scope: !46)
!50 = !DILocation(line: 35, column: 35, scope: !42)
!51 = !DILocation(line: 35, column: 13, scope: !42)
!52 = distinct !{!52, !44, !53, !54}
!53 = !DILocation(line: 38, column: 13, scope: !39)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 40, column: 14, scope: !33)
!56 = !DILocation(line: 48, column: 23, scope: !2)
!57 = !DILocation(line: 48, column: 5, scope: !2)
!58 = !DILocation(line: 50, column: 10, scope: !2)
!59 = !DILocation(line: 50, column: 5, scope: !2)
!60 = !DILocation(line: 51, column: 1, scope: !2)
!61 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_15_good", scope: !3, file: !3, line: 129, type: !4, scopeLine: 130, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!62 = !DILocation(line: 131, column: 5, scope: !61)
!63 = !DILocation(line: 132, column: 5, scope: !61)
!64 = !DILocation(line: 133, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 58, type: !4, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!66 = !DILocalVariable(name: "data", scope: !65, file: !3, line: 60, type: !8)
!67 = !DILocation(line: 60, column: 15, scope: !65)
!68 = !DILocation(line: 61, column: 10, scope: !65)
!69 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !3, line: 71, type: !8)
!70 = distinct !DILexicalBlock(scope: !65, file: !3, line: 69, column: 5)
!71 = !DILocation(line: 71, column: 19, scope: !70)
!72 = !DILocation(line: 71, column: 43, scope: !70)
!73 = !DILocation(line: 71, column: 32, scope: !70)
!74 = !DILocation(line: 72, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !3, line: 72, column: 13)
!76 = !DILocation(line: 72, column: 24, scope: !75)
!77 = !DILocation(line: 72, column: 13, scope: !70)
!78 = !DILocation(line: 74, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !3, line: 73, column: 9)
!80 = !DILocation(line: 75, column: 13, scope: !79)
!81 = !DILocalVariable(name: "i", scope: !82, file: !3, line: 78, type: !34)
!82 = distinct !DILexicalBlock(scope: !70, file: !3, line: 77, column: 9)
!83 = !DILocation(line: 78, column: 20, scope: !82)
!84 = !DILocation(line: 79, column: 20, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !3, line: 79, column: 13)
!86 = !DILocation(line: 79, column: 18, scope: !85)
!87 = !DILocation(line: 79, column: 25, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !3, line: 79, column: 13)
!89 = !DILocation(line: 79, column: 27, scope: !88)
!90 = !DILocation(line: 79, column: 13, scope: !85)
!91 = !DILocation(line: 81, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !3, line: 80, column: 13)
!93 = !DILocation(line: 81, column: 28, scope: !92)
!94 = !DILocation(line: 81, column: 31, scope: !92)
!95 = !DILocation(line: 82, column: 13, scope: !92)
!96 = !DILocation(line: 79, column: 35, scope: !88)
!97 = !DILocation(line: 79, column: 13, scope: !88)
!98 = distinct !{!98, !90, !99, !54}
!99 = !DILocation(line: 82, column: 13, scope: !85)
!100 = !DILocation(line: 84, column: 16, scope: !70)
!101 = !DILocation(line: 84, column: 14, scope: !70)
!102 = !DILocation(line: 88, column: 23, scope: !65)
!103 = !DILocation(line: 88, column: 5, scope: !65)
!104 = !DILocation(line: 90, column: 10, scope: !65)
!105 = !DILocation(line: 90, column: 5, scope: !65)
!106 = !DILocation(line: 91, column: 1, scope: !65)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 94, type: !4, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!108 = !DILocalVariable(name: "data", scope: !107, file: !3, line: 96, type: !8)
!109 = !DILocation(line: 96, column: 15, scope: !107)
!110 = !DILocation(line: 97, column: 10, scope: !107)
!111 = !DILocalVariable(name: "dataBuffer", scope: !112, file: !3, line: 103, type: !8)
!112 = distinct !DILexicalBlock(scope: !107, file: !3, line: 101, column: 5)
!113 = !DILocation(line: 103, column: 19, scope: !112)
!114 = !DILocation(line: 103, column: 43, scope: !112)
!115 = !DILocation(line: 103, column: 32, scope: !112)
!116 = !DILocation(line: 104, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !3, line: 104, column: 13)
!118 = !DILocation(line: 104, column: 24, scope: !117)
!119 = !DILocation(line: 104, column: 13, scope: !112)
!120 = !DILocation(line: 106, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !3, line: 105, column: 9)
!122 = !DILocation(line: 107, column: 13, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !124, file: !3, line: 110, type: !34)
!124 = distinct !DILexicalBlock(scope: !112, file: !3, line: 109, column: 9)
!125 = !DILocation(line: 110, column: 20, scope: !124)
!126 = !DILocation(line: 111, column: 20, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !3, line: 111, column: 13)
!128 = !DILocation(line: 111, column: 18, scope: !127)
!129 = !DILocation(line: 111, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !3, line: 111, column: 13)
!131 = !DILocation(line: 111, column: 27, scope: !130)
!132 = !DILocation(line: 111, column: 13, scope: !127)
!133 = !DILocation(line: 113, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !3, line: 112, column: 13)
!135 = !DILocation(line: 113, column: 28, scope: !134)
!136 = !DILocation(line: 113, column: 31, scope: !134)
!137 = !DILocation(line: 114, column: 13, scope: !134)
!138 = !DILocation(line: 111, column: 35, scope: !130)
!139 = !DILocation(line: 111, column: 13, scope: !130)
!140 = distinct !{!140, !132, !141, !54}
!141 = !DILocation(line: 114, column: 13, scope: !127)
!142 = !DILocation(line: 116, column: 16, scope: !112)
!143 = !DILocation(line: 116, column: 14, scope: !112)
!144 = !DILocation(line: 124, column: 23, scope: !107)
!145 = !DILocation(line: 124, column: 5, scope: !107)
!146 = !DILocation(line: 126, column: 10, scope: !107)
!147 = !DILocation(line: 126, column: 5, scope: !107)
!148 = !DILocation(line: 127, column: 1, scope: !107)
