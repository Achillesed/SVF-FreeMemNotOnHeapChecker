; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_alloca_14.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_14_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalFive, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end, !dbg !24

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 400, align 16, !dbg !29
  %2 = bitcast i8* %1 to i32*, !dbg !30
  store i32* %2, i32** %dataBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i64, i64* %i, align 8, !dbg !40
  %cmp1 = icmp ult i64 %3, 100, !dbg !42
  br i1 %cmp1, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !44
  %5 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !44
  store i32 5, i32* %arrayidx, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %6, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %dataBuffer, align 8, !dbg !54
  store i32* %7, i32** %data, align 8, !dbg !55
  br label %if.end, !dbg !56

if.end:                                           ; preds = %for.end, %entry
  %8 = load i32*, i32** %data, align 8, !dbg !57
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !57
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !57
  call void @printIntLine(i32 noundef %9), !dbg !58
  %10 = load i32*, i32** %data, align 8, !dbg !59
  %11 = bitcast i32* %10 to i8*, !dbg !59
  call void @free(i8* noundef %11) #5, !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_14_good() #0 !dbg !62 {
entry:
  call void @goodG2B1(), !dbg !63
  call void @goodG2B2(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  store i32* null, i32** %data, align 8, !dbg !69
  %0 = load i32, i32* @globalFive, align 4, !dbg !70
  %cmp = icmp ne i32 %0, 5, !dbg !72
  br i1 %cmp, label %if.then, label %if.else, !dbg !73

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !74
  br label %if.end4, !dbg !76

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !80
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !81
  %1 = bitcast i8* %call to i32*, !dbg !82
  store i32* %1, i32** %dataBuffer, align 8, !dbg !80
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !83
  %cmp1 = icmp eq i32* %2, null, !dbg !85
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !86

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @exit(i32 noundef 1) #6, !dbg !89
  unreachable, !dbg !89

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !90, metadata !DIExpression()), !dbg !92
  store i64 0, i64* %i, align 8, !dbg !93
  br label %for.cond, !dbg !95

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !96
  %cmp3 = icmp ult i64 %3, 100, !dbg !98
  br i1 %cmp3, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  %5 = load i64, i64* %i, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !100
  store i32 5, i32* %arrayidx, align 4, !dbg !103
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !105
  %inc = add i64 %6, 1, !dbg !105
  store i64 %inc, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !106, !llvm.loop !107

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  store i32* %7, i32** %data, align 8, !dbg !110
  br label %if.end4

if.end4:                                          ; preds = %for.end, %if.then
  %8 = load i32*, i32** %data, align 8, !dbg !111
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !111
  %9 = load i32, i32* %arrayidx5, align 4, !dbg !111
  call void @printIntLine(i32 noundef %9), !dbg !112
  %10 = load i32*, i32** %data, align 8, !dbg !113
  %11 = bitcast i32* %10 to i8*, !dbg !113
  call void @free(i8* noundef %11) #5, !dbg !114
  ret void, !dbg !115
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  store i32* null, i32** %data, align 8, !dbg !119
  %0 = load i32, i32* @globalFive, align 4, !dbg !120
  %cmp = icmp eq i32 %0, 5, !dbg !122
  br i1 %cmp, label %if.then, label %if.end4, !dbg !123

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !124, metadata !DIExpression()), !dbg !127
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !128
  %1 = bitcast i8* %call to i32*, !dbg !129
  store i32* %1, i32** %dataBuffer, align 8, !dbg !127
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !130
  %cmp1 = icmp eq i32* %2, null, !dbg !132
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !133

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !134
  call void @exit(i32 noundef 1) #6, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !143
  %cmp3 = icmp ult i64 %3, 100, !dbg !145
  br i1 %cmp3, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !147
  %5 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !147
  store i32 5, i32* %arrayidx, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %6, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %dataBuffer, align 8, !dbg !156
  store i32* %7, i32** %data, align 8, !dbg !157
  br label %if.end4, !dbg !158

if.end4:                                          ; preds = %for.end, %entry
  %8 = load i32*, i32** %data, align 8, !dbg !159
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !159
  %9 = load i32, i32* %arrayidx5, align 4, !dbg !159
  call void @printIntLine(i32 noundef %9), !dbg !160
  %10 = load i32*, i32** %data, align 8, !dbg !161
  %11 = bitcast i32* %10 to i8*, !dbg !161
  call void @free(i8* noundef %11) #5, !dbg !162
  ret void, !dbg !163
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_14.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "e3fa8275f8ca3f64a214bf5d71574f7c")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_14_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 11, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 18, scope: !22)
!24 = !DILocation(line: 27, column: 8, scope: !14)
!25 = !DILocalVariable(name: "dataBuffer", scope: !26, file: !1, line: 31, type: !3)
!26 = distinct !DILexicalBlock(scope: !27, file: !1, line: 29, column: 9)
!27 = distinct !DILexicalBlock(scope: !22, file: !1, line: 28, column: 5)
!28 = !DILocation(line: 31, column: 19, scope: !26)
!29 = !DILocation(line: 31, column: 39, scope: !26)
!30 = !DILocation(line: 31, column: 32, scope: !26)
!31 = !DILocalVariable(name: "i", scope: !32, file: !1, line: 33, type: !33)
!32 = distinct !DILexicalBlock(scope: !26, file: !1, line: 32, column: 13)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!35 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 33, column: 24, scope: !32)
!37 = !DILocation(line: 34, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !1, line: 34, column: 17)
!39 = !DILocation(line: 34, column: 22, scope: !38)
!40 = !DILocation(line: 34, column: 29, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !1, line: 34, column: 17)
!42 = !DILocation(line: 34, column: 31, scope: !41)
!43 = !DILocation(line: 34, column: 17, scope: !38)
!44 = !DILocation(line: 36, column: 21, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !1, line: 35, column: 17)
!46 = !DILocation(line: 36, column: 32, scope: !45)
!47 = !DILocation(line: 36, column: 35, scope: !45)
!48 = !DILocation(line: 37, column: 17, scope: !45)
!49 = !DILocation(line: 34, column: 39, scope: !41)
!50 = !DILocation(line: 34, column: 17, scope: !41)
!51 = distinct !{!51, !43, !52, !53}
!52 = !DILocation(line: 37, column: 17, scope: !38)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 39, column: 20, scope: !26)
!55 = !DILocation(line: 39, column: 18, scope: !26)
!56 = !DILocation(line: 41, column: 5, scope: !27)
!57 = !DILocation(line: 42, column: 18, scope: !14)
!58 = !DILocation(line: 42, column: 5, scope: !14)
!59 = !DILocation(line: 44, column: 10, scope: !14)
!60 = !DILocation(line: 44, column: 5, scope: !14)
!61 = !DILocation(line: 45, column: 1, scope: !14)
!62 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_14_good", scope: !1, file: !1, line: 116, type: !15, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!63 = !DILocation(line: 118, column: 5, scope: !62)
!64 = !DILocation(line: 119, column: 5, scope: !62)
!65 = !DILocation(line: 120, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!67 = !DILocalVariable(name: "data", scope: !66, file: !1, line: 54, type: !3)
!68 = !DILocation(line: 54, column: 11, scope: !66)
!69 = !DILocation(line: 55, column: 10, scope: !66)
!70 = !DILocation(line: 56, column: 8, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !1, line: 56, column: 8)
!72 = !DILocation(line: 56, column: 18, scope: !71)
!73 = !DILocation(line: 56, column: 8, scope: !66)
!74 = !DILocation(line: 59, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !1, line: 57, column: 5)
!76 = !DILocation(line: 60, column: 5, scope: !75)
!77 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !1, line: 65, type: !3)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 63, column: 9)
!79 = distinct !DILexicalBlock(scope: !71, file: !1, line: 62, column: 5)
!80 = !DILocation(line: 65, column: 19, scope: !78)
!81 = !DILocation(line: 65, column: 39, scope: !78)
!82 = !DILocation(line: 65, column: 32, scope: !78)
!83 = !DILocation(line: 66, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !1, line: 66, column: 17)
!85 = !DILocation(line: 66, column: 28, scope: !84)
!86 = !DILocation(line: 66, column: 17, scope: !78)
!87 = !DILocation(line: 68, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !1, line: 67, column: 13)
!89 = !DILocation(line: 69, column: 17, scope: !88)
!90 = !DILocalVariable(name: "i", scope: !91, file: !1, line: 72, type: !33)
!91 = distinct !DILexicalBlock(scope: !78, file: !1, line: 71, column: 13)
!92 = !DILocation(line: 72, column: 24, scope: !91)
!93 = !DILocation(line: 73, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !1, line: 73, column: 17)
!95 = !DILocation(line: 73, column: 22, scope: !94)
!96 = !DILocation(line: 73, column: 29, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !1, line: 73, column: 17)
!98 = !DILocation(line: 73, column: 31, scope: !97)
!99 = !DILocation(line: 73, column: 17, scope: !94)
!100 = !DILocation(line: 75, column: 21, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !1, line: 74, column: 17)
!102 = !DILocation(line: 75, column: 32, scope: !101)
!103 = !DILocation(line: 75, column: 35, scope: !101)
!104 = !DILocation(line: 76, column: 17, scope: !101)
!105 = !DILocation(line: 73, column: 39, scope: !97)
!106 = !DILocation(line: 73, column: 17, scope: !97)
!107 = distinct !{!107, !99, !108, !53}
!108 = !DILocation(line: 76, column: 17, scope: !94)
!109 = !DILocation(line: 78, column: 20, scope: !78)
!110 = !DILocation(line: 78, column: 18, scope: !78)
!111 = !DILocation(line: 81, column: 18, scope: !66)
!112 = !DILocation(line: 81, column: 5, scope: !66)
!113 = !DILocation(line: 83, column: 10, scope: !66)
!114 = !DILocation(line: 83, column: 5, scope: !66)
!115 = !DILocation(line: 84, column: 1, scope: !66)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!117 = !DILocalVariable(name: "data", scope: !116, file: !1, line: 89, type: !3)
!118 = !DILocation(line: 89, column: 11, scope: !116)
!119 = !DILocation(line: 90, column: 10, scope: !116)
!120 = !DILocation(line: 91, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !1, line: 91, column: 8)
!122 = !DILocation(line: 91, column: 18, scope: !121)
!123 = !DILocation(line: 91, column: 8, scope: !116)
!124 = !DILocalVariable(name: "dataBuffer", scope: !125, file: !1, line: 95, type: !3)
!125 = distinct !DILexicalBlock(scope: !126, file: !1, line: 93, column: 9)
!126 = distinct !DILexicalBlock(scope: !121, file: !1, line: 92, column: 5)
!127 = !DILocation(line: 95, column: 19, scope: !125)
!128 = !DILocation(line: 95, column: 39, scope: !125)
!129 = !DILocation(line: 95, column: 32, scope: !125)
!130 = !DILocation(line: 96, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !1, line: 96, column: 17)
!132 = !DILocation(line: 96, column: 28, scope: !131)
!133 = !DILocation(line: 96, column: 17, scope: !125)
!134 = !DILocation(line: 98, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !1, line: 97, column: 13)
!136 = !DILocation(line: 99, column: 17, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !138, file: !1, line: 102, type: !33)
!138 = distinct !DILexicalBlock(scope: !125, file: !1, line: 101, column: 13)
!139 = !DILocation(line: 102, column: 24, scope: !138)
!140 = !DILocation(line: 103, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !1, line: 103, column: 17)
!142 = !DILocation(line: 103, column: 22, scope: !141)
!143 = !DILocation(line: 103, column: 29, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !1, line: 103, column: 17)
!145 = !DILocation(line: 103, column: 31, scope: !144)
!146 = !DILocation(line: 103, column: 17, scope: !141)
!147 = !DILocation(line: 105, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !1, line: 104, column: 17)
!149 = !DILocation(line: 105, column: 32, scope: !148)
!150 = !DILocation(line: 105, column: 35, scope: !148)
!151 = !DILocation(line: 106, column: 17, scope: !148)
!152 = !DILocation(line: 103, column: 39, scope: !144)
!153 = !DILocation(line: 103, column: 17, scope: !144)
!154 = distinct !{!154, !146, !155, !53}
!155 = !DILocation(line: 106, column: 17, scope: !141)
!156 = !DILocation(line: 108, column: 20, scope: !125)
!157 = !DILocation(line: 108, column: 18, scope: !125)
!158 = !DILocation(line: 110, column: 5, scope: !126)
!159 = !DILocation(line: 111, column: 18, scope: !116)
!160 = !DILocation(line: 111, column: 5, scope: !116)
!161 = !DILocation(line: 113, column: 10, scope: !116)
!162 = !DILocation(line: 113, column: 5, scope: !116)
!163 = !DILocation(line: 114, column: 1, scope: !116)
