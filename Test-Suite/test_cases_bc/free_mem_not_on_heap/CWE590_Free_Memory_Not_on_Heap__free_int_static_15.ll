; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_static_15.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_static_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int_static_15_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_15_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i64* %i, metadata !27, metadata !DIExpression()), !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !37
  %cmp = icmp ult i64 %0, 100, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !41
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_15_bad.dataBuffer, i64 0, i64 %1, !dbg !43
  store i32 5, i32* %arrayidx, align 4, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !46
  %inc = add i64 %2, 1, !dbg !46
  store i64 %inc, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_15_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !51
  %3 = load i32*, i32** %data, align 8, !dbg !52
  %arrayidx1 = getelementptr inbounds i32, i32* %3, i64 0, !dbg !52
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !52
  call void @printIntLine(i32 noundef %4), !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  %6 = bitcast i32* %5 to i8*, !dbg !54
  call void @free(i8* noundef %6) #5, !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_15_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !61 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !62, metadata !DIExpression()), !dbg !63
  store i32* null, i32** %data, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !65, metadata !DIExpression()), !dbg !67
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !68
  %0 = bitcast i8* %call to i32*, !dbg !69
  store i32* %0, i32** %dataBuffer, align 8, !dbg !67
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !70
  %cmp = icmp eq i32* %1, null, !dbg !72
  br i1 %cmp, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @exit(i32 noundef 1) #6, !dbg !76
  unreachable, !dbg !76

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !77, metadata !DIExpression()), !dbg !79
  store i64 0, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !83
  %cmp1 = icmp ult i64 %2, 100, !dbg !85
  br i1 %cmp1, label %for.body, label %for.end, !dbg !86

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !87
  %4 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !87
  store i32 5, i32* %arrayidx, align 4, !dbg !90
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !92
  %inc = add i64 %5, 1, !dbg !92
  store i64 %inc, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !93, !llvm.loop !94

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !96
  store i32* %6, i32** %data, align 8, !dbg !97
  %7 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !98
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !98
  call void @printIntLine(i32 noundef %8), !dbg !99
  %9 = load i32*, i32** %data, align 8, !dbg !100
  %10 = bitcast i32* %9 to i8*, !dbg !100
  call void @free(i8* noundef %10) #5, !dbg !101
  ret void, !dbg !102
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i32* null, i32** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !109
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !110
  %0 = bitcast i8* %call to i32*, !dbg !111
  store i32* %0, i32** %dataBuffer, align 8, !dbg !109
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !112
  %cmp = icmp eq i32* %1, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !116
  call void @exit(i32 noundef 1) #6, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !125
  %cmp1 = icmp ult i64 %2, 100, !dbg !127
  br i1 %cmp1, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !129
  %4 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !129
  store i32 5, i32* %arrayidx, align 4, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %5, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !138
  store i32* %6, i32** %data, align 8, !dbg !139
  %7 = load i32*, i32** %data, align 8, !dbg !140
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !140
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !140
  call void @printIntLine(i32 noundef %8), !dbg !141
  %9 = load i32*, i32** %data, align 8, !dbg !142
  %10 = bitcast i32* %9 to i8*, !dbg !142
  call void @free(i8* noundef %10) #5, !dbg !143
  ret void, !dbg !144
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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 32, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_15_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_static_15.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "2f2ca7168cd17a688601d24f205a8b89")
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
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 25, type: !8)
!25 = !DILocation(line: 25, column: 11, scope: !2)
!26 = !DILocation(line: 26, column: 10, scope: !2)
!27 = !DILocalVariable(name: "i", scope: !28, file: !3, line: 34, type: !30)
!28 = distinct !DILexicalBlock(scope: !29, file: !3, line: 33, column: 9)
!29 = distinct !DILexicalBlock(scope: !2, file: !3, line: 30, column: 5)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 46, baseType: !32)
!31 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!32 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 34, column: 20, scope: !28)
!34 = !DILocation(line: 35, column: 20, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !3, line: 35, column: 13)
!36 = !DILocation(line: 35, column: 18, scope: !35)
!37 = !DILocation(line: 35, column: 25, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !3, line: 35, column: 13)
!39 = !DILocation(line: 35, column: 27, scope: !38)
!40 = !DILocation(line: 35, column: 13, scope: !35)
!41 = !DILocation(line: 37, column: 28, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !3, line: 36, column: 13)
!43 = !DILocation(line: 37, column: 17, scope: !42)
!44 = !DILocation(line: 37, column: 31, scope: !42)
!45 = !DILocation(line: 38, column: 13, scope: !42)
!46 = !DILocation(line: 35, column: 35, scope: !38)
!47 = !DILocation(line: 35, column: 13, scope: !38)
!48 = distinct !{!48, !40, !49, !50}
!49 = !DILocation(line: 38, column: 13, scope: !35)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocation(line: 40, column: 14, scope: !29)
!52 = !DILocation(line: 48, column: 18, scope: !2)
!53 = !DILocation(line: 48, column: 5, scope: !2)
!54 = !DILocation(line: 50, column: 10, scope: !2)
!55 = !DILocation(line: 50, column: 5, scope: !2)
!56 = !DILocation(line: 51, column: 1, scope: !2)
!57 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_15_good", scope: !3, file: !3, line: 129, type: !4, scopeLine: 130, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!58 = !DILocation(line: 131, column: 5, scope: !57)
!59 = !DILocation(line: 132, column: 5, scope: !57)
!60 = !DILocation(line: 133, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 58, type: !4, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!62 = !DILocalVariable(name: "data", scope: !61, file: !3, line: 60, type: !8)
!63 = !DILocation(line: 60, column: 11, scope: !61)
!64 = !DILocation(line: 61, column: 10, scope: !61)
!65 = !DILocalVariable(name: "dataBuffer", scope: !66, file: !3, line: 71, type: !8)
!66 = distinct !DILexicalBlock(scope: !61, file: !3, line: 69, column: 5)
!67 = !DILocation(line: 71, column: 15, scope: !66)
!68 = !DILocation(line: 71, column: 35, scope: !66)
!69 = !DILocation(line: 71, column: 28, scope: !66)
!70 = !DILocation(line: 72, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !3, line: 72, column: 13)
!72 = !DILocation(line: 72, column: 24, scope: !71)
!73 = !DILocation(line: 72, column: 13, scope: !66)
!74 = !DILocation(line: 74, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !3, line: 73, column: 9)
!76 = !DILocation(line: 75, column: 13, scope: !75)
!77 = !DILocalVariable(name: "i", scope: !78, file: !3, line: 78, type: !30)
!78 = distinct !DILexicalBlock(scope: !66, file: !3, line: 77, column: 9)
!79 = !DILocation(line: 78, column: 20, scope: !78)
!80 = !DILocation(line: 79, column: 20, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !3, line: 79, column: 13)
!82 = !DILocation(line: 79, column: 18, scope: !81)
!83 = !DILocation(line: 79, column: 25, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !3, line: 79, column: 13)
!85 = !DILocation(line: 79, column: 27, scope: !84)
!86 = !DILocation(line: 79, column: 13, scope: !81)
!87 = !DILocation(line: 81, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !3, line: 80, column: 13)
!89 = !DILocation(line: 81, column: 28, scope: !88)
!90 = !DILocation(line: 81, column: 31, scope: !88)
!91 = !DILocation(line: 82, column: 13, scope: !88)
!92 = !DILocation(line: 79, column: 35, scope: !84)
!93 = !DILocation(line: 79, column: 13, scope: !84)
!94 = distinct !{!94, !86, !95, !50}
!95 = !DILocation(line: 82, column: 13, scope: !81)
!96 = !DILocation(line: 84, column: 16, scope: !66)
!97 = !DILocation(line: 84, column: 14, scope: !66)
!98 = !DILocation(line: 88, column: 18, scope: !61)
!99 = !DILocation(line: 88, column: 5, scope: !61)
!100 = !DILocation(line: 90, column: 10, scope: !61)
!101 = !DILocation(line: 90, column: 5, scope: !61)
!102 = !DILocation(line: 91, column: 1, scope: !61)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 94, type: !4, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!104 = !DILocalVariable(name: "data", scope: !103, file: !3, line: 96, type: !8)
!105 = !DILocation(line: 96, column: 11, scope: !103)
!106 = !DILocation(line: 97, column: 10, scope: !103)
!107 = !DILocalVariable(name: "dataBuffer", scope: !108, file: !3, line: 103, type: !8)
!108 = distinct !DILexicalBlock(scope: !103, file: !3, line: 101, column: 5)
!109 = !DILocation(line: 103, column: 15, scope: !108)
!110 = !DILocation(line: 103, column: 35, scope: !108)
!111 = !DILocation(line: 103, column: 28, scope: !108)
!112 = !DILocation(line: 104, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !3, line: 104, column: 13)
!114 = !DILocation(line: 104, column: 24, scope: !113)
!115 = !DILocation(line: 104, column: 13, scope: !108)
!116 = !DILocation(line: 106, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !3, line: 105, column: 9)
!118 = !DILocation(line: 107, column: 13, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !120, file: !3, line: 110, type: !30)
!120 = distinct !DILexicalBlock(scope: !108, file: !3, line: 109, column: 9)
!121 = !DILocation(line: 110, column: 20, scope: !120)
!122 = !DILocation(line: 111, column: 20, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !3, line: 111, column: 13)
!124 = !DILocation(line: 111, column: 18, scope: !123)
!125 = !DILocation(line: 111, column: 25, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !3, line: 111, column: 13)
!127 = !DILocation(line: 111, column: 27, scope: !126)
!128 = !DILocation(line: 111, column: 13, scope: !123)
!129 = !DILocation(line: 113, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !3, line: 112, column: 13)
!131 = !DILocation(line: 113, column: 28, scope: !130)
!132 = !DILocation(line: 113, column: 31, scope: !130)
!133 = !DILocation(line: 114, column: 13, scope: !130)
!134 = !DILocation(line: 111, column: 35, scope: !126)
!135 = !DILocation(line: 111, column: 13, scope: !126)
!136 = distinct !{!136, !128, !137, !50}
!137 = !DILocation(line: 114, column: 13, scope: !123)
!138 = !DILocation(line: 116, column: 16, scope: !108)
!139 = !DILocation(line: 116, column: 14, scope: !108)
!140 = !DILocation(line: 124, column: 18, scope: !103)
!141 = !DILocation(line: 124, column: 5, scope: !103)
!142 = !DILocation(line: 126, column: 10, scope: !103)
!143 = !DILocation(line: 126, column: 5, scope: !103)
!144 = !DILocation(line: 127, column: 1, scope: !103)
