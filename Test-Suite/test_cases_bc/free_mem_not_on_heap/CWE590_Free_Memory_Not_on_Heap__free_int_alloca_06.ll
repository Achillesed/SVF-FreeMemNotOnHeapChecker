; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_alloca_06.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_06_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 400, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !28, metadata !DIExpression()), !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !37
  %cmp = icmp ult i64 %2, 100, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !41
  %4 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !41
  store i32 5, i32* %arrayidx, align 4, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !46
  %inc = add i64 %5, 1, !dbg !46
  store i64 %inc, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !51
  store i32* %6, i32** %data, align 8, !dbg !52
  %7 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !53
  %8 = load i32, i32* %arrayidx1, align 4, !dbg !53
  call void @printIntLine(i32 noundef %8), !dbg !54
  %9 = load i32*, i32** %data, align 8, !dbg !55
  %10 = bitcast i32* %9 to i8*, !dbg !55
  call void @free(i8* noundef %10) #5, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_06_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !62 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !63, metadata !DIExpression()), !dbg !64
  store i32* null, i32** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !66, metadata !DIExpression()), !dbg !70
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !71
  %0 = bitcast i8* %call to i32*, !dbg !72
  store i32* %0, i32** %dataBuffer, align 8, !dbg !70
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !73
  %cmp = icmp eq i32* %1, null, !dbg !75
  br i1 %cmp, label %if.then, label %if.end, !dbg !76

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @exit(i32 noundef 1) #6, !dbg !79
  unreachable, !dbg !79

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !80, metadata !DIExpression()), !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !86
  %cmp1 = icmp ult i64 %2, 100, !dbg !88
  br i1 %cmp1, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !90
  %4 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !90
  store i32 5, i32* %arrayidx, align 4, !dbg !93
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !95
  %inc = add i64 %5, 1, !dbg !95
  store i64 %inc, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !99
  store i32* %6, i32** %data, align 8, !dbg !100
  %7 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !101
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !101
  call void @printIntLine(i32 noundef %8), !dbg !102
  %9 = load i32*, i32** %data, align 8, !dbg !103
  %10 = bitcast i32* %9 to i8*, !dbg !103
  call void @free(i8* noundef %10) #5, !dbg !104
  ret void, !dbg !105
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i32* null, i32** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !110, metadata !DIExpression()), !dbg !114
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !115
  %0 = bitcast i8* %call to i32*, !dbg !116
  store i32* %0, i32** %dataBuffer, align 8, !dbg !114
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !117
  %cmp = icmp eq i32* %1, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !121
  call void @exit(i32 noundef 1) #6, !dbg !123
  unreachable, !dbg !123

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !130
  %cmp1 = icmp ult i64 %2, 100, !dbg !132
  br i1 %cmp1, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !134
  %4 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !134
  store i32 5, i32* %arrayidx, align 4, !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !139
  %inc = add i64 %5, 1, !dbg !139
  store i64 %inc, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !143
  store i32* %6, i32** %data, align 8, !dbg !144
  %7 = load i32*, i32** %data, align 8, !dbg !145
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !145
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !145
  call void @printIntLine(i32 noundef %8), !dbg !146
  %9 = load i32*, i32** %data, align 8, !dbg !147
  %10 = bitcast i32* %9 to i8*, !dbg !147
  call void @free(i8* noundef %10) #5, !dbg !148
  ret void, !dbg !149
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_06.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "f84ccd3722741f87777c62e0d2fca090")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_06_bad", scope: !1, file: !1, line: 27, type: !15, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 29, type: !3)
!19 = !DILocation(line: 29, column: 11, scope: !14)
!20 = !DILocation(line: 30, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !1, line: 35, type: !3)
!22 = distinct !DILexicalBlock(scope: !23, file: !1, line: 33, column: 9)
!23 = distinct !DILexicalBlock(scope: !24, file: !1, line: 32, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !1, line: 31, column: 8)
!25 = !DILocation(line: 35, column: 19, scope: !22)
!26 = !DILocation(line: 35, column: 39, scope: !22)
!27 = !DILocation(line: 35, column: 32, scope: !22)
!28 = !DILocalVariable(name: "i", scope: !29, file: !1, line: 37, type: !30)
!29 = distinct !DILexicalBlock(scope: !22, file: !1, line: 36, column: 13)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 46, baseType: !32)
!31 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!32 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 37, column: 24, scope: !29)
!34 = !DILocation(line: 38, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !1, line: 38, column: 17)
!36 = !DILocation(line: 38, column: 22, scope: !35)
!37 = !DILocation(line: 38, column: 29, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !1, line: 38, column: 17)
!39 = !DILocation(line: 38, column: 31, scope: !38)
!40 = !DILocation(line: 38, column: 17, scope: !35)
!41 = !DILocation(line: 40, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !1, line: 39, column: 17)
!43 = !DILocation(line: 40, column: 32, scope: !42)
!44 = !DILocation(line: 40, column: 35, scope: !42)
!45 = !DILocation(line: 41, column: 17, scope: !42)
!46 = !DILocation(line: 38, column: 39, scope: !38)
!47 = !DILocation(line: 38, column: 17, scope: !38)
!48 = distinct !{!48, !40, !49, !50}
!49 = !DILocation(line: 41, column: 17, scope: !35)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocation(line: 43, column: 20, scope: !22)
!52 = !DILocation(line: 43, column: 18, scope: !22)
!53 = !DILocation(line: 46, column: 18, scope: !14)
!54 = !DILocation(line: 46, column: 5, scope: !14)
!55 = !DILocation(line: 48, column: 10, scope: !14)
!56 = !DILocation(line: 48, column: 5, scope: !14)
!57 = !DILocation(line: 49, column: 1, scope: !14)
!58 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_06_good", scope: !1, file: !1, line: 120, type: !15, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!59 = !DILocation(line: 122, column: 5, scope: !58)
!60 = !DILocation(line: 123, column: 5, scope: !58)
!61 = !DILocation(line: 124, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 56, type: !15, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!63 = !DILocalVariable(name: "data", scope: !62, file: !1, line: 58, type: !3)
!64 = !DILocation(line: 58, column: 11, scope: !62)
!65 = !DILocation(line: 59, column: 10, scope: !62)
!66 = !DILocalVariable(name: "dataBuffer", scope: !67, file: !1, line: 69, type: !3)
!67 = distinct !DILexicalBlock(scope: !68, file: !1, line: 67, column: 9)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 66, column: 5)
!69 = distinct !DILexicalBlock(scope: !62, file: !1, line: 60, column: 8)
!70 = !DILocation(line: 69, column: 19, scope: !67)
!71 = !DILocation(line: 69, column: 39, scope: !67)
!72 = !DILocation(line: 69, column: 32, scope: !67)
!73 = !DILocation(line: 70, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !67, file: !1, line: 70, column: 17)
!75 = !DILocation(line: 70, column: 28, scope: !74)
!76 = !DILocation(line: 70, column: 17, scope: !67)
!77 = !DILocation(line: 72, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !1, line: 71, column: 13)
!79 = !DILocation(line: 73, column: 17, scope: !78)
!80 = !DILocalVariable(name: "i", scope: !81, file: !1, line: 76, type: !30)
!81 = distinct !DILexicalBlock(scope: !67, file: !1, line: 75, column: 13)
!82 = !DILocation(line: 76, column: 24, scope: !81)
!83 = !DILocation(line: 77, column: 24, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !1, line: 77, column: 17)
!85 = !DILocation(line: 77, column: 22, scope: !84)
!86 = !DILocation(line: 77, column: 29, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !1, line: 77, column: 17)
!88 = !DILocation(line: 77, column: 31, scope: !87)
!89 = !DILocation(line: 77, column: 17, scope: !84)
!90 = !DILocation(line: 79, column: 21, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !1, line: 78, column: 17)
!92 = !DILocation(line: 79, column: 32, scope: !91)
!93 = !DILocation(line: 79, column: 35, scope: !91)
!94 = !DILocation(line: 80, column: 17, scope: !91)
!95 = !DILocation(line: 77, column: 39, scope: !87)
!96 = !DILocation(line: 77, column: 17, scope: !87)
!97 = distinct !{!97, !89, !98, !50}
!98 = !DILocation(line: 80, column: 17, scope: !84)
!99 = !DILocation(line: 82, column: 20, scope: !67)
!100 = !DILocation(line: 82, column: 18, scope: !67)
!101 = !DILocation(line: 85, column: 18, scope: !62)
!102 = !DILocation(line: 85, column: 5, scope: !62)
!103 = !DILocation(line: 87, column: 10, scope: !62)
!104 = !DILocation(line: 87, column: 5, scope: !62)
!105 = !DILocation(line: 88, column: 1, scope: !62)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!107 = !DILocalVariable(name: "data", scope: !106, file: !1, line: 93, type: !3)
!108 = !DILocation(line: 93, column: 11, scope: !106)
!109 = !DILocation(line: 94, column: 10, scope: !106)
!110 = !DILocalVariable(name: "dataBuffer", scope: !111, file: !1, line: 99, type: !3)
!111 = distinct !DILexicalBlock(scope: !112, file: !1, line: 97, column: 9)
!112 = distinct !DILexicalBlock(scope: !113, file: !1, line: 96, column: 5)
!113 = distinct !DILexicalBlock(scope: !106, file: !1, line: 95, column: 8)
!114 = !DILocation(line: 99, column: 19, scope: !111)
!115 = !DILocation(line: 99, column: 39, scope: !111)
!116 = !DILocation(line: 99, column: 32, scope: !111)
!117 = !DILocation(line: 100, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !1, line: 100, column: 17)
!119 = !DILocation(line: 100, column: 28, scope: !118)
!120 = !DILocation(line: 100, column: 17, scope: !111)
!121 = !DILocation(line: 102, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !1, line: 101, column: 13)
!123 = !DILocation(line: 103, column: 17, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !125, file: !1, line: 106, type: !30)
!125 = distinct !DILexicalBlock(scope: !111, file: !1, line: 105, column: 13)
!126 = !DILocation(line: 106, column: 24, scope: !125)
!127 = !DILocation(line: 107, column: 24, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !1, line: 107, column: 17)
!129 = !DILocation(line: 107, column: 22, scope: !128)
!130 = !DILocation(line: 107, column: 29, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !1, line: 107, column: 17)
!132 = !DILocation(line: 107, column: 31, scope: !131)
!133 = !DILocation(line: 107, column: 17, scope: !128)
!134 = !DILocation(line: 109, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !1, line: 108, column: 17)
!136 = !DILocation(line: 109, column: 32, scope: !135)
!137 = !DILocation(line: 109, column: 35, scope: !135)
!138 = !DILocation(line: 110, column: 17, scope: !135)
!139 = !DILocation(line: 107, column: 39, scope: !131)
!140 = !DILocation(line: 107, column: 17, scope: !131)
!141 = distinct !{!141, !133, !142, !50}
!142 = !DILocation(line: 110, column: 17, scope: !128)
!143 = !DILocation(line: 112, column: 20, scope: !111)
!144 = !DILocation(line: 112, column: 18, scope: !111)
!145 = !DILocation(line: 115, column: 18, scope: !106)
!146 = !DILocation(line: 115, column: 5, scope: !106)
!147 = !DILocation(line: 117, column: 10, scope: !106)
!148 = !DILocation(line: 117, column: 5, scope: !106)
!149 = !DILocation(line: 118, column: 1, scope: !106)
