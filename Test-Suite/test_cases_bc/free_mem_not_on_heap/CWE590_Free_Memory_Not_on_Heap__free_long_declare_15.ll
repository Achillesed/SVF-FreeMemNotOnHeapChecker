; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_declare_15.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_declare_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_declare_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i64* null, i64** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i64* %i, metadata !27, metadata !DIExpression()), !dbg !32
  store i64 0, i64* %i, align 8, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !36
  %cmp = icmp ult i64 %0, 100, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !40
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %1, !dbg !42
  store i64 5, i64* %arrayidx, align 8, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !45
  %inc = add i64 %2, 1, !dbg !45
  store i64 %inc, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !50
  store i64* %arraydecay, i64** %data, align 8, !dbg !51
  %3 = load i64*, i64** %data, align 8, !dbg !52
  %arrayidx1 = getelementptr inbounds i64, i64* %3, i64 0, !dbg !52
  %4 = load i64, i64* %arrayidx1, align 8, !dbg !52
  call void @printLongLine(i64 noundef %4), !dbg !53
  %5 = load i64*, i64** %data, align 8, !dbg !54
  %6 = bitcast i64* %5 to i8*, !dbg !54
  call void @free(i8* noundef %6) #5, !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_declare_15_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !61 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !62, metadata !DIExpression()), !dbg !63
  store i64* null, i64** %data, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !65, metadata !DIExpression()), !dbg !67
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !68
  %0 = bitcast i8* %call to i64*, !dbg !69
  store i64* %0, i64** %dataBuffer, align 8, !dbg !67
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !70
  %cmp = icmp eq i64* %1, null, !dbg !72
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
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !87
  %4 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !87
  store i64 5, i64* %arrayidx, align 8, !dbg !90
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !92
  %inc = add i64 %5, 1, !dbg !92
  store i64 %inc, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !93, !llvm.loop !94

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !96
  store i64* %6, i64** %data, align 8, !dbg !97
  %7 = load i64*, i64** %data, align 8, !dbg !98
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !98
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !98
  call void @printLongLine(i64 noundef %8), !dbg !99
  %9 = load i64*, i64** %data, align 8, !dbg !100
  %10 = bitcast i64* %9 to i8*, !dbg !100
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
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i64* null, i64** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !109
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !110
  %0 = bitcast i8* %call to i64*, !dbg !111
  store i64* %0, i64** %dataBuffer, align 8, !dbg !109
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !112
  %cmp = icmp eq i64* %1, null, !dbg !114
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
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !129
  %4 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !129
  store i64 5, i64* %arrayidx, align 8, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %5, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !138
  store i64* %6, i64** %data, align 8, !dbg !139
  %7 = load i64*, i64** %data, align 8, !dbg !140
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !140
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !140
  call void @printLongLine(i64 noundef %8), !dbg !141
  %9 = load i64*, i64** %data, align 8, !dbg !142
  %10 = bitcast i64* %9 to i8*, !dbg !142
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_15.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "f7fa6788180e54773b578c5ad69bfc66")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_15_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !1, line: 32, type: !23)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 30, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 32, column: 14, scope: !22)
!27 = !DILocalVariable(name: "i", scope: !28, file: !1, line: 34, type: !29)
!28 = distinct !DILexicalBlock(scope: !22, file: !1, line: 33, column: 9)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !30, line: 46, baseType: !31)
!30 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!31 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 34, column: 20, scope: !28)
!33 = !DILocation(line: 35, column: 20, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !1, line: 35, column: 13)
!35 = !DILocation(line: 35, column: 18, scope: !34)
!36 = !DILocation(line: 35, column: 25, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !1, line: 35, column: 13)
!38 = !DILocation(line: 35, column: 27, scope: !37)
!39 = !DILocation(line: 35, column: 13, scope: !34)
!40 = !DILocation(line: 37, column: 28, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !1, line: 36, column: 13)
!42 = !DILocation(line: 37, column: 17, scope: !41)
!43 = !DILocation(line: 37, column: 31, scope: !41)
!44 = !DILocation(line: 38, column: 13, scope: !41)
!45 = !DILocation(line: 35, column: 35, scope: !37)
!46 = !DILocation(line: 35, column: 13, scope: !37)
!47 = distinct !{!47, !39, !48, !49}
!48 = !DILocation(line: 38, column: 13, scope: !34)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocation(line: 40, column: 16, scope: !22)
!51 = !DILocation(line: 40, column: 14, scope: !22)
!52 = !DILocation(line: 48, column: 19, scope: !14)
!53 = !DILocation(line: 48, column: 5, scope: !14)
!54 = !DILocation(line: 50, column: 10, scope: !14)
!55 = !DILocation(line: 50, column: 5, scope: !14)
!56 = !DILocation(line: 51, column: 1, scope: !14)
!57 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_15_good", scope: !1, file: !1, line: 129, type: !15, scopeLine: 130, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!58 = !DILocation(line: 131, column: 5, scope: !57)
!59 = !DILocation(line: 132, column: 5, scope: !57)
!60 = !DILocation(line: 133, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 58, type: !15, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!62 = !DILocalVariable(name: "data", scope: !61, file: !1, line: 60, type: !3)
!63 = !DILocation(line: 60, column: 12, scope: !61)
!64 = !DILocation(line: 61, column: 10, scope: !61)
!65 = !DILocalVariable(name: "dataBuffer", scope: !66, file: !1, line: 71, type: !3)
!66 = distinct !DILexicalBlock(scope: !61, file: !1, line: 69, column: 5)
!67 = !DILocation(line: 71, column: 16, scope: !66)
!68 = !DILocation(line: 71, column: 37, scope: !66)
!69 = !DILocation(line: 71, column: 29, scope: !66)
!70 = !DILocation(line: 72, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !1, line: 72, column: 13)
!72 = !DILocation(line: 72, column: 24, scope: !71)
!73 = !DILocation(line: 72, column: 13, scope: !66)
!74 = !DILocation(line: 74, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !1, line: 73, column: 9)
!76 = !DILocation(line: 75, column: 13, scope: !75)
!77 = !DILocalVariable(name: "i", scope: !78, file: !1, line: 78, type: !29)
!78 = distinct !DILexicalBlock(scope: !66, file: !1, line: 77, column: 9)
!79 = !DILocation(line: 78, column: 20, scope: !78)
!80 = !DILocation(line: 79, column: 20, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !1, line: 79, column: 13)
!82 = !DILocation(line: 79, column: 18, scope: !81)
!83 = !DILocation(line: 79, column: 25, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !1, line: 79, column: 13)
!85 = !DILocation(line: 79, column: 27, scope: !84)
!86 = !DILocation(line: 79, column: 13, scope: !81)
!87 = !DILocation(line: 81, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !1, line: 80, column: 13)
!89 = !DILocation(line: 81, column: 28, scope: !88)
!90 = !DILocation(line: 81, column: 31, scope: !88)
!91 = !DILocation(line: 82, column: 13, scope: !88)
!92 = !DILocation(line: 79, column: 35, scope: !84)
!93 = !DILocation(line: 79, column: 13, scope: !84)
!94 = distinct !{!94, !86, !95, !49}
!95 = !DILocation(line: 82, column: 13, scope: !81)
!96 = !DILocation(line: 84, column: 16, scope: !66)
!97 = !DILocation(line: 84, column: 14, scope: !66)
!98 = !DILocation(line: 88, column: 19, scope: !61)
!99 = !DILocation(line: 88, column: 5, scope: !61)
!100 = !DILocation(line: 90, column: 10, scope: !61)
!101 = !DILocation(line: 90, column: 5, scope: !61)
!102 = !DILocation(line: 91, column: 1, scope: !61)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 94, type: !15, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!104 = !DILocalVariable(name: "data", scope: !103, file: !1, line: 96, type: !3)
!105 = !DILocation(line: 96, column: 12, scope: !103)
!106 = !DILocation(line: 97, column: 10, scope: !103)
!107 = !DILocalVariable(name: "dataBuffer", scope: !108, file: !1, line: 103, type: !3)
!108 = distinct !DILexicalBlock(scope: !103, file: !1, line: 101, column: 5)
!109 = !DILocation(line: 103, column: 16, scope: !108)
!110 = !DILocation(line: 103, column: 37, scope: !108)
!111 = !DILocation(line: 103, column: 29, scope: !108)
!112 = !DILocation(line: 104, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !1, line: 104, column: 13)
!114 = !DILocation(line: 104, column: 24, scope: !113)
!115 = !DILocation(line: 104, column: 13, scope: !108)
!116 = !DILocation(line: 106, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !1, line: 105, column: 9)
!118 = !DILocation(line: 107, column: 13, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !120, file: !1, line: 110, type: !29)
!120 = distinct !DILexicalBlock(scope: !108, file: !1, line: 109, column: 9)
!121 = !DILocation(line: 110, column: 20, scope: !120)
!122 = !DILocation(line: 111, column: 20, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !1, line: 111, column: 13)
!124 = !DILocation(line: 111, column: 18, scope: !123)
!125 = !DILocation(line: 111, column: 25, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !1, line: 111, column: 13)
!127 = !DILocation(line: 111, column: 27, scope: !126)
!128 = !DILocation(line: 111, column: 13, scope: !123)
!129 = !DILocation(line: 113, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !1, line: 112, column: 13)
!131 = !DILocation(line: 113, column: 28, scope: !130)
!132 = !DILocation(line: 113, column: 31, scope: !130)
!133 = !DILocation(line: 114, column: 13, scope: !130)
!134 = !DILocation(line: 111, column: 35, scope: !126)
!135 = !DILocation(line: 111, column: 13, scope: !126)
!136 = distinct !{!136, !128, !137, !49}
!137 = !DILocation(line: 114, column: 13, scope: !123)
!138 = !DILocation(line: 116, column: 16, scope: !108)
!139 = !DILocation(line: 116, column: 14, scope: !108)
!140 = !DILocation(line: 124, column: 19, scope: !103)
!141 = !DILocation(line: 124, column: 5, scope: !103)
!142 = !DILocation(line: 126, column: 10, scope: !103)
!143 = !DILocation(line: 126, column: 5, scope: !103)
!144 = !DILocation(line: 127, column: 1, scope: !103)
