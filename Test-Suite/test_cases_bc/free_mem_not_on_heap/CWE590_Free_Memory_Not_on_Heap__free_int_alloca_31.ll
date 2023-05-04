; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_alloca_31.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 400, align 16, !dbg !24
  %1 = bitcast i8* %0 to i32*, !dbg !25
  store i32* %1, i32** %dataBuffer, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !31
  store i64 0, i64* %i, align 8, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !35
  %cmp = icmp ult i64 %2, 100, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %4 = load i64, i64* %i, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !39
  store i32 5, i32* %arrayidx, align 4, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !44
  %inc = add i64 %5, 1, !dbg !44
  store i64 %inc, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !49
  store i32* %6, i32** %data, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !51, metadata !DIExpression()), !dbg !53
  %7 = load i32*, i32** %data, align 8, !dbg !54
  store i32* %7, i32** %dataCopy, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !55, metadata !DIExpression()), !dbg !56
  %8 = load i32*, i32** %dataCopy, align 8, !dbg !57
  store i32* %8, i32** %data1, align 8, !dbg !56
  %9 = load i32*, i32** %data1, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !58
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !58
  call void @printIntLine(i32 noundef %10), !dbg !59
  %11 = load i32*, i32** %data1, align 8, !dbg !60
  %12 = bitcast i32* %11 to i8*, !dbg !60
  call void @free(i8* noundef %12) #5, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_31_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  store i32* null, i32** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !72
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !73
  %0 = bitcast i8* %call to i32*, !dbg !74
  store i32* %0, i32** %dataBuffer, align 8, !dbg !72
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !75
  %cmp = icmp eq i32* %1, null, !dbg !77
  br i1 %cmp, label %if.then, label %if.end, !dbg !78

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @exit(i32 noundef 1) #6, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !82, metadata !DIExpression()), !dbg !84
  store i64 0, i64* %i, align 8, !dbg !85
  br label %for.cond, !dbg !87

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !88
  %cmp1 = icmp ult i64 %2, 100, !dbg !90
  br i1 %cmp1, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !92
  %4 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !92
  store i32 5, i32* %arrayidx, align 4, !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !97
  %inc = add i64 %5, 1, !dbg !97
  store i64 %inc, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !101
  store i32* %6, i32** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !103, metadata !DIExpression()), !dbg !105
  %7 = load i32*, i32** %data, align 8, !dbg !106
  store i32* %7, i32** %dataCopy, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !107, metadata !DIExpression()), !dbg !108
  %8 = load i32*, i32** %dataCopy, align 8, !dbg !109
  store i32* %8, i32** %data2, align 8, !dbg !108
  %9 = load i32*, i32** %data2, align 8, !dbg !110
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !110
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !110
  call void @printIntLine(i32 noundef %10), !dbg !111
  %11 = load i32*, i32** %data2, align 8, !dbg !112
  %12 = bitcast i32* %11 to i8*, !dbg !112
  call void @free(i8* noundef %12) #5, !dbg !113
  ret void, !dbg !114
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_31.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "561ce7d904f1a354921788dea9256278")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_31_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 11, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !1, line: 29, type: !3)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 27, column: 5)
!23 = !DILocation(line: 29, column: 15, scope: !22)
!24 = !DILocation(line: 29, column: 35, scope: !22)
!25 = !DILocation(line: 29, column: 28, scope: !22)
!26 = !DILocalVariable(name: "i", scope: !27, file: !1, line: 31, type: !28)
!27 = distinct !DILexicalBlock(scope: !22, file: !1, line: 30, column: 9)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !29, line: 46, baseType: !30)
!29 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!30 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 31, column: 20, scope: !27)
!32 = !DILocation(line: 32, column: 20, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !1, line: 32, column: 13)
!34 = !DILocation(line: 32, column: 18, scope: !33)
!35 = !DILocation(line: 32, column: 25, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !1, line: 32, column: 13)
!37 = !DILocation(line: 32, column: 27, scope: !36)
!38 = !DILocation(line: 32, column: 13, scope: !33)
!39 = !DILocation(line: 34, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !1, line: 33, column: 13)
!41 = !DILocation(line: 34, column: 28, scope: !40)
!42 = !DILocation(line: 34, column: 31, scope: !40)
!43 = !DILocation(line: 35, column: 13, scope: !40)
!44 = !DILocation(line: 32, column: 35, scope: !36)
!45 = !DILocation(line: 32, column: 13, scope: !36)
!46 = distinct !{!46, !38, !47, !48}
!47 = !DILocation(line: 35, column: 13, scope: !33)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocation(line: 37, column: 16, scope: !22)
!50 = !DILocation(line: 37, column: 14, scope: !22)
!51 = !DILocalVariable(name: "dataCopy", scope: !52, file: !1, line: 40, type: !3)
!52 = distinct !DILexicalBlock(scope: !14, file: !1, line: 39, column: 5)
!53 = !DILocation(line: 40, column: 15, scope: !52)
!54 = !DILocation(line: 40, column: 26, scope: !52)
!55 = !DILocalVariable(name: "data", scope: !52, file: !1, line: 41, type: !3)
!56 = !DILocation(line: 41, column: 15, scope: !52)
!57 = !DILocation(line: 41, column: 22, scope: !52)
!58 = !DILocation(line: 42, column: 22, scope: !52)
!59 = !DILocation(line: 42, column: 9, scope: !52)
!60 = !DILocation(line: 44, column: 14, scope: !52)
!61 = !DILocation(line: 44, column: 9, scope: !52)
!62 = !DILocation(line: 46, column: 1, scope: !14)
!63 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_31_good", scope: !1, file: !1, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!64 = !DILocation(line: 85, column: 5, scope: !63)
!65 = !DILocation(line: 86, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!67 = !DILocalVariable(name: "data", scope: !66, file: !1, line: 55, type: !3)
!68 = !DILocation(line: 55, column: 11, scope: !66)
!69 = !DILocation(line: 56, column: 10, scope: !66)
!70 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !1, line: 59, type: !3)
!71 = distinct !DILexicalBlock(scope: !66, file: !1, line: 57, column: 5)
!72 = !DILocation(line: 59, column: 15, scope: !71)
!73 = !DILocation(line: 59, column: 35, scope: !71)
!74 = !DILocation(line: 59, column: 28, scope: !71)
!75 = !DILocation(line: 60, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !71, file: !1, line: 60, column: 13)
!77 = !DILocation(line: 60, column: 24, scope: !76)
!78 = !DILocation(line: 60, column: 13, scope: !71)
!79 = !DILocation(line: 62, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !1, line: 61, column: 9)
!81 = !DILocation(line: 63, column: 13, scope: !80)
!82 = !DILocalVariable(name: "i", scope: !83, file: !1, line: 66, type: !28)
!83 = distinct !DILexicalBlock(scope: !71, file: !1, line: 65, column: 9)
!84 = !DILocation(line: 66, column: 20, scope: !83)
!85 = !DILocation(line: 67, column: 20, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !1, line: 67, column: 13)
!87 = !DILocation(line: 67, column: 18, scope: !86)
!88 = !DILocation(line: 67, column: 25, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !1, line: 67, column: 13)
!90 = !DILocation(line: 67, column: 27, scope: !89)
!91 = !DILocation(line: 67, column: 13, scope: !86)
!92 = !DILocation(line: 69, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !1, line: 68, column: 13)
!94 = !DILocation(line: 69, column: 28, scope: !93)
!95 = !DILocation(line: 69, column: 31, scope: !93)
!96 = !DILocation(line: 70, column: 13, scope: !93)
!97 = !DILocation(line: 67, column: 35, scope: !89)
!98 = !DILocation(line: 67, column: 13, scope: !89)
!99 = distinct !{!99, !91, !100, !48}
!100 = !DILocation(line: 70, column: 13, scope: !86)
!101 = !DILocation(line: 72, column: 16, scope: !71)
!102 = !DILocation(line: 72, column: 14, scope: !71)
!103 = !DILocalVariable(name: "dataCopy", scope: !104, file: !1, line: 75, type: !3)
!104 = distinct !DILexicalBlock(scope: !66, file: !1, line: 74, column: 5)
!105 = !DILocation(line: 75, column: 15, scope: !104)
!106 = !DILocation(line: 75, column: 26, scope: !104)
!107 = !DILocalVariable(name: "data", scope: !104, file: !1, line: 76, type: !3)
!108 = !DILocation(line: 76, column: 15, scope: !104)
!109 = !DILocation(line: 76, column: 22, scope: !104)
!110 = !DILocation(line: 77, column: 22, scope: !104)
!111 = !DILocation(line: 77, column: 9, scope: !104)
!112 = !DILocation(line: 79, column: 14, scope: !104)
!113 = !DILocation(line: 79, column: 9, scope: !104)
!114 = !DILocation(line: 81, column: 1, scope: !66)
