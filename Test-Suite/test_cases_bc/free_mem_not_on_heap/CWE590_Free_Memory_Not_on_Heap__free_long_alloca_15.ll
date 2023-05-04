; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_alloca_15.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i64* null, i64** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 800, align 16, !dbg !24
  %1 = bitcast i8* %0 to i64*, !dbg !25
  store i64* %1, i64** %dataBuffer, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !31
  store i64 0, i64* %i, align 8, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !35
  %cmp = icmp ult i64 %2, 100, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !39
  %4 = load i64, i64* %i, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !39
  store i64 5, i64* %arrayidx, align 8, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !44
  %inc = add i64 %5, 1, !dbg !44
  store i64 %inc, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !49
  store i64* %6, i64** %data, align 8, !dbg !50
  %7 = load i64*, i64** %data, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !51
  %8 = load i64, i64* %arrayidx1, align 8, !dbg !51
  call void @printLongLine(i64 noundef %8), !dbg !52
  %9 = load i64*, i64** %data, align 8, !dbg !53
  %10 = bitcast i64* %9 to i8*, !dbg !53
  call void @free(i8* noundef %10) #5, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_15_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !60 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !61, metadata !DIExpression()), !dbg !62
  store i64* null, i64** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !64, metadata !DIExpression()), !dbg !66
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !67
  %0 = bitcast i8* %call to i64*, !dbg !68
  store i64* %0, i64** %dataBuffer, align 8, !dbg !66
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !69
  %cmp = icmp eq i64* %1, null, !dbg !71
  br i1 %cmp, label %if.then, label %if.end, !dbg !72

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @exit(i32 noundef 1) #6, !dbg !75
  unreachable, !dbg !75

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !76, metadata !DIExpression()), !dbg !78
  store i64 0, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !82
  %cmp1 = icmp ult i64 %2, 100, !dbg !84
  br i1 %cmp1, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !86
  %4 = load i64, i64* %i, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !86
  store i64 5, i64* %arrayidx, align 8, !dbg !89
  br label %for.inc, !dbg !90

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !91
  %inc = add i64 %5, 1, !dbg !91
  store i64 %inc, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !92, !llvm.loop !93

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !95
  store i64* %6, i64** %data, align 8, !dbg !96
  %7 = load i64*, i64** %data, align 8, !dbg !97
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !97
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !97
  call void @printLongLine(i64 noundef %8), !dbg !98
  %9 = load i64*, i64** %data, align 8, !dbg !99
  %10 = bitcast i64* %9 to i8*, !dbg !99
  call void @free(i8* noundef %10) #5, !dbg !100
  ret void, !dbg !101
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !103, metadata !DIExpression()), !dbg !104
  store i64* null, i64** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !108
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !109
  %0 = bitcast i8* %call to i64*, !dbg !110
  store i64* %0, i64** %dataBuffer, align 8, !dbg !108
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !111
  %cmp = icmp eq i64* %1, null, !dbg !113
  br i1 %cmp, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !115
  call void @exit(i32 noundef 1) #6, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !124
  %cmp1 = icmp ult i64 %2, 100, !dbg !126
  br i1 %cmp1, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !128
  %4 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !128
  store i64 5, i64* %arrayidx, align 8, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !133
  %inc = add i64 %5, 1, !dbg !133
  store i64 %inc, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !137
  store i64* %6, i64** %data, align 8, !dbg !138
  %7 = load i64*, i64** %data, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !139
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !139
  call void @printLongLine(i64 noundef %8), !dbg !140
  %9 = load i64*, i64** %data, align 8, !dbg !141
  %10 = bitcast i64* %9 to i8*, !dbg !141
  call void @free(i8* noundef %10) #5, !dbg !142
  ret void, !dbg !143
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_15.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "fd4ad52d8507dc56b47fa32862501598")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_15_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !1, line: 32, type: !3)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 30, column: 5)
!23 = !DILocation(line: 32, column: 16, scope: !22)
!24 = !DILocation(line: 32, column: 37, scope: !22)
!25 = !DILocation(line: 32, column: 29, scope: !22)
!26 = !DILocalVariable(name: "i", scope: !27, file: !1, line: 34, type: !28)
!27 = distinct !DILexicalBlock(scope: !22, file: !1, line: 33, column: 9)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !29, line: 46, baseType: !30)
!29 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!30 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 34, column: 20, scope: !27)
!32 = !DILocation(line: 35, column: 20, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !1, line: 35, column: 13)
!34 = !DILocation(line: 35, column: 18, scope: !33)
!35 = !DILocation(line: 35, column: 25, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !1, line: 35, column: 13)
!37 = !DILocation(line: 35, column: 27, scope: !36)
!38 = !DILocation(line: 35, column: 13, scope: !33)
!39 = !DILocation(line: 37, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !1, line: 36, column: 13)
!41 = !DILocation(line: 37, column: 28, scope: !40)
!42 = !DILocation(line: 37, column: 31, scope: !40)
!43 = !DILocation(line: 38, column: 13, scope: !40)
!44 = !DILocation(line: 35, column: 35, scope: !36)
!45 = !DILocation(line: 35, column: 13, scope: !36)
!46 = distinct !{!46, !38, !47, !48}
!47 = !DILocation(line: 38, column: 13, scope: !33)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocation(line: 40, column: 16, scope: !22)
!50 = !DILocation(line: 40, column: 14, scope: !22)
!51 = !DILocation(line: 48, column: 19, scope: !14)
!52 = !DILocation(line: 48, column: 5, scope: !14)
!53 = !DILocation(line: 50, column: 10, scope: !14)
!54 = !DILocation(line: 50, column: 5, scope: !14)
!55 = !DILocation(line: 51, column: 1, scope: !14)
!56 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_15_good", scope: !1, file: !1, line: 129, type: !15, scopeLine: 130, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!57 = !DILocation(line: 131, column: 5, scope: !56)
!58 = !DILocation(line: 132, column: 5, scope: !56)
!59 = !DILocation(line: 133, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 58, type: !15, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!61 = !DILocalVariable(name: "data", scope: !60, file: !1, line: 60, type: !3)
!62 = !DILocation(line: 60, column: 12, scope: !60)
!63 = !DILocation(line: 61, column: 10, scope: !60)
!64 = !DILocalVariable(name: "dataBuffer", scope: !65, file: !1, line: 71, type: !3)
!65 = distinct !DILexicalBlock(scope: !60, file: !1, line: 69, column: 5)
!66 = !DILocation(line: 71, column: 16, scope: !65)
!67 = !DILocation(line: 71, column: 37, scope: !65)
!68 = !DILocation(line: 71, column: 29, scope: !65)
!69 = !DILocation(line: 72, column: 13, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !1, line: 72, column: 13)
!71 = !DILocation(line: 72, column: 24, scope: !70)
!72 = !DILocation(line: 72, column: 13, scope: !65)
!73 = !DILocation(line: 74, column: 13, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !1, line: 73, column: 9)
!75 = !DILocation(line: 75, column: 13, scope: !74)
!76 = !DILocalVariable(name: "i", scope: !77, file: !1, line: 78, type: !28)
!77 = distinct !DILexicalBlock(scope: !65, file: !1, line: 77, column: 9)
!78 = !DILocation(line: 78, column: 20, scope: !77)
!79 = !DILocation(line: 79, column: 20, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !1, line: 79, column: 13)
!81 = !DILocation(line: 79, column: 18, scope: !80)
!82 = !DILocation(line: 79, column: 25, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !1, line: 79, column: 13)
!84 = !DILocation(line: 79, column: 27, scope: !83)
!85 = !DILocation(line: 79, column: 13, scope: !80)
!86 = !DILocation(line: 81, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !1, line: 80, column: 13)
!88 = !DILocation(line: 81, column: 28, scope: !87)
!89 = !DILocation(line: 81, column: 31, scope: !87)
!90 = !DILocation(line: 82, column: 13, scope: !87)
!91 = !DILocation(line: 79, column: 35, scope: !83)
!92 = !DILocation(line: 79, column: 13, scope: !83)
!93 = distinct !{!93, !85, !94, !48}
!94 = !DILocation(line: 82, column: 13, scope: !80)
!95 = !DILocation(line: 84, column: 16, scope: !65)
!96 = !DILocation(line: 84, column: 14, scope: !65)
!97 = !DILocation(line: 88, column: 19, scope: !60)
!98 = !DILocation(line: 88, column: 5, scope: !60)
!99 = !DILocation(line: 90, column: 10, scope: !60)
!100 = !DILocation(line: 90, column: 5, scope: !60)
!101 = !DILocation(line: 91, column: 1, scope: !60)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 94, type: !15, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!103 = !DILocalVariable(name: "data", scope: !102, file: !1, line: 96, type: !3)
!104 = !DILocation(line: 96, column: 12, scope: !102)
!105 = !DILocation(line: 97, column: 10, scope: !102)
!106 = !DILocalVariable(name: "dataBuffer", scope: !107, file: !1, line: 103, type: !3)
!107 = distinct !DILexicalBlock(scope: !102, file: !1, line: 101, column: 5)
!108 = !DILocation(line: 103, column: 16, scope: !107)
!109 = !DILocation(line: 103, column: 37, scope: !107)
!110 = !DILocation(line: 103, column: 29, scope: !107)
!111 = !DILocation(line: 104, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !1, line: 104, column: 13)
!113 = !DILocation(line: 104, column: 24, scope: !112)
!114 = !DILocation(line: 104, column: 13, scope: !107)
!115 = !DILocation(line: 106, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !1, line: 105, column: 9)
!117 = !DILocation(line: 107, column: 13, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !119, file: !1, line: 110, type: !28)
!119 = distinct !DILexicalBlock(scope: !107, file: !1, line: 109, column: 9)
!120 = !DILocation(line: 110, column: 20, scope: !119)
!121 = !DILocation(line: 111, column: 20, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !1, line: 111, column: 13)
!123 = !DILocation(line: 111, column: 18, scope: !122)
!124 = !DILocation(line: 111, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !1, line: 111, column: 13)
!126 = !DILocation(line: 111, column: 27, scope: !125)
!127 = !DILocation(line: 111, column: 13, scope: !122)
!128 = !DILocation(line: 113, column: 17, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !1, line: 112, column: 13)
!130 = !DILocation(line: 113, column: 28, scope: !129)
!131 = !DILocation(line: 113, column: 31, scope: !129)
!132 = !DILocation(line: 114, column: 13, scope: !129)
!133 = !DILocation(line: 111, column: 35, scope: !125)
!134 = !DILocation(line: 111, column: 13, scope: !125)
!135 = distinct !{!135, !127, !136, !48}
!136 = !DILocation(line: 114, column: 13, scope: !122)
!137 = !DILocation(line: 116, column: 16, scope: !107)
!138 = !DILocation(line: 116, column: 14, scope: !107)
!139 = !DILocation(line: 124, column: 19, scope: !102)
!140 = !DILocation(line: 124, column: 5, scope: !102)
!141 = !DILocation(line: 126, column: 10, scope: !102)
!142 = !DILocation(line: 126, column: 5, scope: !102)
!143 = !DILocation(line: 127, column: 1, scope: !102)
