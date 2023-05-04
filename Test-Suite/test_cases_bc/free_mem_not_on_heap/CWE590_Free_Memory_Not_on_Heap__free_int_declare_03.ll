; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_declare_03.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_declare_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_03_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !38
  %cmp = icmp ult i64 %0, 100, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !42
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 %1, !dbg !44
  store i32 5, i32* %arrayidx, align 4, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !47
  %inc = add i64 %2, 1, !dbg !47
  store i64 %inc, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !52
  store i32* %arraydecay, i32** %data, align 8, !dbg !53
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_03_good() #0 !dbg !59 {
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_03.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "c4cdb8605cc05adab9f33c8b77a2d585")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_03_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 11, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !1, line: 31, type: !25)
!22 = distinct !DILexicalBlock(scope: !23, file: !1, line: 29, column: 9)
!23 = distinct !DILexicalBlock(scope: !24, file: !1, line: 28, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !1, line: 27, column: 8)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 31, column: 17, scope: !22)
!29 = !DILocalVariable(name: "i", scope: !30, file: !1, line: 33, type: !31)
!30 = distinct !DILexicalBlock(scope: !22, file: !1, line: 32, column: 13)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!33 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 33, column: 24, scope: !30)
!35 = !DILocation(line: 34, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !1, line: 34, column: 17)
!37 = !DILocation(line: 34, column: 22, scope: !36)
!38 = !DILocation(line: 34, column: 29, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !1, line: 34, column: 17)
!40 = !DILocation(line: 34, column: 31, scope: !39)
!41 = !DILocation(line: 34, column: 17, scope: !36)
!42 = !DILocation(line: 36, column: 32, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !1, line: 35, column: 17)
!44 = !DILocation(line: 36, column: 21, scope: !43)
!45 = !DILocation(line: 36, column: 35, scope: !43)
!46 = !DILocation(line: 37, column: 17, scope: !43)
!47 = !DILocation(line: 34, column: 39, scope: !39)
!48 = !DILocation(line: 34, column: 17, scope: !39)
!49 = distinct !{!49, !41, !50, !51}
!50 = !DILocation(line: 37, column: 17, scope: !36)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 39, column: 20, scope: !22)
!53 = !DILocation(line: 39, column: 18, scope: !22)
!54 = !DILocation(line: 42, column: 18, scope: !14)
!55 = !DILocation(line: 42, column: 5, scope: !14)
!56 = !DILocation(line: 44, column: 10, scope: !14)
!57 = !DILocation(line: 44, column: 5, scope: !14)
!58 = !DILocation(line: 45, column: 1, scope: !14)
!59 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_03_good", scope: !1, file: !1, line: 116, type: !15, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!60 = !DILocation(line: 118, column: 5, scope: !59)
!61 = !DILocation(line: 119, column: 5, scope: !59)
!62 = !DILocation(line: 120, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!64 = !DILocalVariable(name: "data", scope: !63, file: !1, line: 54, type: !3)
!65 = !DILocation(line: 54, column: 11, scope: !63)
!66 = !DILocation(line: 55, column: 10, scope: !63)
!67 = !DILocalVariable(name: "dataBuffer", scope: !68, file: !1, line: 65, type: !3)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 63, column: 9)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 62, column: 5)
!70 = distinct !DILexicalBlock(scope: !63, file: !1, line: 56, column: 8)
!71 = !DILocation(line: 65, column: 19, scope: !68)
!72 = !DILocation(line: 65, column: 39, scope: !68)
!73 = !DILocation(line: 65, column: 32, scope: !68)
!74 = !DILocation(line: 66, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !68, file: !1, line: 66, column: 17)
!76 = !DILocation(line: 66, column: 28, scope: !75)
!77 = !DILocation(line: 66, column: 17, scope: !68)
!78 = !DILocation(line: 68, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !1, line: 67, column: 13)
!80 = !DILocation(line: 69, column: 17, scope: !79)
!81 = !DILocalVariable(name: "i", scope: !82, file: !1, line: 72, type: !31)
!82 = distinct !DILexicalBlock(scope: !68, file: !1, line: 71, column: 13)
!83 = !DILocation(line: 72, column: 24, scope: !82)
!84 = !DILocation(line: 73, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !1, line: 73, column: 17)
!86 = !DILocation(line: 73, column: 22, scope: !85)
!87 = !DILocation(line: 73, column: 29, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !1, line: 73, column: 17)
!89 = !DILocation(line: 73, column: 31, scope: !88)
!90 = !DILocation(line: 73, column: 17, scope: !85)
!91 = !DILocation(line: 75, column: 21, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !1, line: 74, column: 17)
!93 = !DILocation(line: 75, column: 32, scope: !92)
!94 = !DILocation(line: 75, column: 35, scope: !92)
!95 = !DILocation(line: 76, column: 17, scope: !92)
!96 = !DILocation(line: 73, column: 39, scope: !88)
!97 = !DILocation(line: 73, column: 17, scope: !88)
!98 = distinct !{!98, !90, !99, !51}
!99 = !DILocation(line: 76, column: 17, scope: !85)
!100 = !DILocation(line: 78, column: 20, scope: !68)
!101 = !DILocation(line: 78, column: 18, scope: !68)
!102 = !DILocation(line: 81, column: 18, scope: !63)
!103 = !DILocation(line: 81, column: 5, scope: !63)
!104 = !DILocation(line: 83, column: 10, scope: !63)
!105 = !DILocation(line: 83, column: 5, scope: !63)
!106 = !DILocation(line: 84, column: 1, scope: !63)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!108 = !DILocalVariable(name: "data", scope: !107, file: !1, line: 89, type: !3)
!109 = !DILocation(line: 89, column: 11, scope: !107)
!110 = !DILocation(line: 90, column: 10, scope: !107)
!111 = !DILocalVariable(name: "dataBuffer", scope: !112, file: !1, line: 95, type: !3)
!112 = distinct !DILexicalBlock(scope: !113, file: !1, line: 93, column: 9)
!113 = distinct !DILexicalBlock(scope: !114, file: !1, line: 92, column: 5)
!114 = distinct !DILexicalBlock(scope: !107, file: !1, line: 91, column: 8)
!115 = !DILocation(line: 95, column: 19, scope: !112)
!116 = !DILocation(line: 95, column: 39, scope: !112)
!117 = !DILocation(line: 95, column: 32, scope: !112)
!118 = !DILocation(line: 96, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !1, line: 96, column: 17)
!120 = !DILocation(line: 96, column: 28, scope: !119)
!121 = !DILocation(line: 96, column: 17, scope: !112)
!122 = !DILocation(line: 98, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !1, line: 97, column: 13)
!124 = !DILocation(line: 99, column: 17, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !126, file: !1, line: 102, type: !31)
!126 = distinct !DILexicalBlock(scope: !112, file: !1, line: 101, column: 13)
!127 = !DILocation(line: 102, column: 24, scope: !126)
!128 = !DILocation(line: 103, column: 24, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !1, line: 103, column: 17)
!130 = !DILocation(line: 103, column: 22, scope: !129)
!131 = !DILocation(line: 103, column: 29, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !1, line: 103, column: 17)
!133 = !DILocation(line: 103, column: 31, scope: !132)
!134 = !DILocation(line: 103, column: 17, scope: !129)
!135 = !DILocation(line: 105, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !1, line: 104, column: 17)
!137 = !DILocation(line: 105, column: 32, scope: !136)
!138 = !DILocation(line: 105, column: 35, scope: !136)
!139 = !DILocation(line: 106, column: 17, scope: !136)
!140 = !DILocation(line: 103, column: 39, scope: !132)
!141 = !DILocation(line: 103, column: 17, scope: !132)
!142 = distinct !{!142, !134, !143, !51}
!143 = !DILocation(line: 106, column: 17, scope: !129)
!144 = !DILocation(line: 108, column: 20, scope: !112)
!145 = !DILocation(line: 108, column: 18, scope: !112)
!146 = !DILocation(line: 111, column: 18, scope: !107)
!147 = !DILocation(line: 111, column: 5, scope: !107)
!148 = !DILocation(line: 113, column: 10, scope: !107)
!149 = !DILocation(line: 113, column: 5, scope: !107)
!150 = !DILocation(line: 114, column: 1, scope: !107)
