; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_static_06.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_static_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int_static_06_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_06_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i64* %i, metadata !27, metadata !DIExpression()), !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %0, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_06_bad.dataBuffer, i64 0, i64 %1, !dbg !45
  store i32 5, i32* %arrayidx, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %2, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_06_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !53
  %3 = load i32*, i32** %data, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds i32, i32* %3, i64 0, !dbg !54
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !54
  call void @printIntLine(i32 noundef %4), !dbg !55
  %5 = load i32*, i32** %data, align 8, !dbg !56
  %6 = bitcast i32* %5 to i8*, !dbg !56
  call void @free(i8* noundef %6) #5, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_06_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !63 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !64, metadata !DIExpression()), !dbg !65
  store i32* null, i32** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !67, metadata !DIExpression()), !dbg !71
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !72
  %0 = bitcast i8* %call to i32*, !dbg !73
  store i32* %0, i32** %dataBuffer, align 8, !dbg !71
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  %cmp = icmp eq i32* %1, null, !dbg !76
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
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !91
  %4 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !91
  store i32 5, i32* %arrayidx, align 4, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %5, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  store i32* %6, i32** %data, align 8, !dbg !101
  %7 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !102
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !102
  call void @printIntLine(i32 noundef %8), !dbg !103
  %9 = load i32*, i32** %data, align 8, !dbg !104
  %10 = bitcast i32* %9 to i8*, !dbg !104
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
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i32* null, i32** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !111, metadata !DIExpression()), !dbg !115
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !116
  %0 = bitcast i8* %call to i32*, !dbg !117
  store i32* %0, i32** %dataBuffer, align 8, !dbg !115
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !118
  %cmp = icmp eq i32* %1, null, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !122
  call void @exit(i32 noundef 1) #6, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !131
  %cmp1 = icmp ult i64 %2, 100, !dbg !133
  br i1 %cmp1, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !135
  %4 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !135
  store i32 5, i32* %arrayidx, align 4, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %5, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !144
  store i32* %6, i32** %data, align 8, !dbg !145
  %7 = load i32*, i32** %data, align 8, !dbg !146
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !146
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !146
  call void @printIntLine(i32 noundef %8), !dbg !147
  %9 = load i32*, i32** %data, align 8, !dbg !148
  %10 = bitcast i32* %9 to i8*, !dbg !148
  call void @free(i8* noundef %10) #5, !dbg !149
  ret void, !dbg !150
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 35, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_06_bad", scope: !3, file: !3, line: 27, type: !4, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_static_06.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "08e995e6014a4c464b564238a0713ead")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0}
!12 = !{}
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 100)
!16 = !{i32 7, !"Dwarf Version", i32 5}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"PIE Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 29, type: !8)
!25 = !DILocation(line: 29, column: 11, scope: !2)
!26 = !DILocation(line: 30, column: 10, scope: !2)
!27 = !DILocalVariable(name: "i", scope: !28, file: !3, line: 37, type: !32)
!28 = distinct !DILexicalBlock(scope: !29, file: !3, line: 36, column: 13)
!29 = distinct !DILexicalBlock(scope: !30, file: !3, line: 33, column: 9)
!30 = distinct !DILexicalBlock(scope: !31, file: !3, line: 32, column: 5)
!31 = distinct !DILexicalBlock(scope: !2, file: !3, line: 31, column: 8)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !33, line: 46, baseType: !34)
!33 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!34 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 37, column: 24, scope: !28)
!36 = !DILocation(line: 38, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !28, file: !3, line: 38, column: 17)
!38 = !DILocation(line: 38, column: 22, scope: !37)
!39 = !DILocation(line: 38, column: 29, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !3, line: 38, column: 17)
!41 = !DILocation(line: 38, column: 31, scope: !40)
!42 = !DILocation(line: 38, column: 17, scope: !37)
!43 = !DILocation(line: 40, column: 32, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !3, line: 39, column: 17)
!45 = !DILocation(line: 40, column: 21, scope: !44)
!46 = !DILocation(line: 40, column: 35, scope: !44)
!47 = !DILocation(line: 41, column: 17, scope: !44)
!48 = !DILocation(line: 38, column: 39, scope: !40)
!49 = !DILocation(line: 38, column: 17, scope: !40)
!50 = distinct !{!50, !42, !51, !52}
!51 = !DILocation(line: 41, column: 17, scope: !37)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 43, column: 18, scope: !29)
!54 = !DILocation(line: 46, column: 18, scope: !2)
!55 = !DILocation(line: 46, column: 5, scope: !2)
!56 = !DILocation(line: 48, column: 10, scope: !2)
!57 = !DILocation(line: 48, column: 5, scope: !2)
!58 = !DILocation(line: 49, column: 1, scope: !2)
!59 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_06_good", scope: !3, file: !3, line: 120, type: !4, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!60 = !DILocation(line: 122, column: 5, scope: !59)
!61 = !DILocation(line: 123, column: 5, scope: !59)
!62 = !DILocation(line: 124, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 56, type: !4, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!64 = !DILocalVariable(name: "data", scope: !63, file: !3, line: 58, type: !8)
!65 = !DILocation(line: 58, column: 11, scope: !63)
!66 = !DILocation(line: 59, column: 10, scope: !63)
!67 = !DILocalVariable(name: "dataBuffer", scope: !68, file: !3, line: 69, type: !8)
!68 = distinct !DILexicalBlock(scope: !69, file: !3, line: 67, column: 9)
!69 = distinct !DILexicalBlock(scope: !70, file: !3, line: 66, column: 5)
!70 = distinct !DILexicalBlock(scope: !63, file: !3, line: 60, column: 8)
!71 = !DILocation(line: 69, column: 19, scope: !68)
!72 = !DILocation(line: 69, column: 39, scope: !68)
!73 = !DILocation(line: 69, column: 32, scope: !68)
!74 = !DILocation(line: 70, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !68, file: !3, line: 70, column: 17)
!76 = !DILocation(line: 70, column: 28, scope: !75)
!77 = !DILocation(line: 70, column: 17, scope: !68)
!78 = !DILocation(line: 72, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !3, line: 71, column: 13)
!80 = !DILocation(line: 73, column: 17, scope: !79)
!81 = !DILocalVariable(name: "i", scope: !82, file: !3, line: 76, type: !32)
!82 = distinct !DILexicalBlock(scope: !68, file: !3, line: 75, column: 13)
!83 = !DILocation(line: 76, column: 24, scope: !82)
!84 = !DILocation(line: 77, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !3, line: 77, column: 17)
!86 = !DILocation(line: 77, column: 22, scope: !85)
!87 = !DILocation(line: 77, column: 29, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !3, line: 77, column: 17)
!89 = !DILocation(line: 77, column: 31, scope: !88)
!90 = !DILocation(line: 77, column: 17, scope: !85)
!91 = !DILocation(line: 79, column: 21, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !3, line: 78, column: 17)
!93 = !DILocation(line: 79, column: 32, scope: !92)
!94 = !DILocation(line: 79, column: 35, scope: !92)
!95 = !DILocation(line: 80, column: 17, scope: !92)
!96 = !DILocation(line: 77, column: 39, scope: !88)
!97 = !DILocation(line: 77, column: 17, scope: !88)
!98 = distinct !{!98, !90, !99, !52}
!99 = !DILocation(line: 80, column: 17, scope: !85)
!100 = !DILocation(line: 82, column: 20, scope: !68)
!101 = !DILocation(line: 82, column: 18, scope: !68)
!102 = !DILocation(line: 85, column: 18, scope: !63)
!103 = !DILocation(line: 85, column: 5, scope: !63)
!104 = !DILocation(line: 87, column: 10, scope: !63)
!105 = !DILocation(line: 87, column: 5, scope: !63)
!106 = !DILocation(line: 88, column: 1, scope: !63)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 91, type: !4, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!108 = !DILocalVariable(name: "data", scope: !107, file: !3, line: 93, type: !8)
!109 = !DILocation(line: 93, column: 11, scope: !107)
!110 = !DILocation(line: 94, column: 10, scope: !107)
!111 = !DILocalVariable(name: "dataBuffer", scope: !112, file: !3, line: 99, type: !8)
!112 = distinct !DILexicalBlock(scope: !113, file: !3, line: 97, column: 9)
!113 = distinct !DILexicalBlock(scope: !114, file: !3, line: 96, column: 5)
!114 = distinct !DILexicalBlock(scope: !107, file: !3, line: 95, column: 8)
!115 = !DILocation(line: 99, column: 19, scope: !112)
!116 = !DILocation(line: 99, column: 39, scope: !112)
!117 = !DILocation(line: 99, column: 32, scope: !112)
!118 = !DILocation(line: 100, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !3, line: 100, column: 17)
!120 = !DILocation(line: 100, column: 28, scope: !119)
!121 = !DILocation(line: 100, column: 17, scope: !112)
!122 = !DILocation(line: 102, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !3, line: 101, column: 13)
!124 = !DILocation(line: 103, column: 17, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !126, file: !3, line: 106, type: !32)
!126 = distinct !DILexicalBlock(scope: !112, file: !3, line: 105, column: 13)
!127 = !DILocation(line: 106, column: 24, scope: !126)
!128 = !DILocation(line: 107, column: 24, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !3, line: 107, column: 17)
!130 = !DILocation(line: 107, column: 22, scope: !129)
!131 = !DILocation(line: 107, column: 29, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !3, line: 107, column: 17)
!133 = !DILocation(line: 107, column: 31, scope: !132)
!134 = !DILocation(line: 107, column: 17, scope: !129)
!135 = !DILocation(line: 109, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !3, line: 108, column: 17)
!137 = !DILocation(line: 109, column: 32, scope: !136)
!138 = !DILocation(line: 109, column: 35, scope: !136)
!139 = !DILocation(line: 110, column: 17, scope: !136)
!140 = !DILocation(line: 107, column: 39, scope: !132)
!141 = !DILocation(line: 107, column: 17, scope: !132)
!142 = distinct !{!142, !134, !143, !52}
!143 = !DILocation(line: 110, column: 17, scope: !129)
!144 = !DILocation(line: 112, column: 20, scope: !112)
!145 = !DILocation(line: 112, column: 18, scope: !112)
!146 = !DILocation(line: 115, column: 18, scope: !107)
!147 = !DILocation(line: 115, column: 5, scope: !107)
!148 = !DILocation(line: 117, column: 10, scope: !107)
!149 = !DILocation(line: 117, column: 5, scope: !107)
!150 = !DILocation(line: 118, column: 1, scope: !107)
