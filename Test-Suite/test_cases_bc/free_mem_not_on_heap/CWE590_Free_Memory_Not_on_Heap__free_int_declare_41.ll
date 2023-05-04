; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_declare_41.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_declare_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_41_badSink(i32* noundef %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32*, i32** %data.addr, align 8, !dbg !20
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !20
  %1 = load i32, i32* %arrayidx, align 4, !dbg !20
  call void @printIntLine(i32 noundef %1), !dbg !21
  %2 = load i32*, i32** %data.addr, align 8, !dbg !22
  %3 = bitcast i32* %2 to i8*, !dbg !22
  call void @free(i8* noundef %3) #5, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_41_bad() #0 !dbg !25 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i32* null, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %0, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 %1, !dbg !52
  store i32 5, i32* %arrayidx, align 4, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %2, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !60
  store i32* %arraydecay, i32** %data, align 8, !dbg !61
  %3 = load i32*, i32** %data, align 8, !dbg !62
  call void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_41_badSink(i32* noundef %3), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_41_goodG2BSink(i32* noundef %data) #0 !dbg !65 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i32*, i32** %data.addr, align 8, !dbg !68
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !68
  %1 = load i32, i32* %arrayidx, align 4, !dbg !68
  call void @printIntLine(i32 noundef %1), !dbg !69
  %2 = load i32*, i32** %data.addr, align 8, !dbg !70
  %3 = bitcast i32* %2 to i8*, !dbg !70
  call void @free(i8* noundef %3) #5, !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_41_good() #0 !dbg !73 {
entry:
  call void @goodG2B(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i32* null, i32** %data, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !82
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !83
  %0 = bitcast i8* %call to i32*, !dbg !84
  store i32* %0, i32** %dataBuffer, align 8, !dbg !82
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  %cmp = icmp eq i32* %1, null, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @exit(i32 noundef 1) #6, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !92, metadata !DIExpression()), !dbg !94
  store i64 0, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !97

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !98
  %cmp1 = icmp ult i64 %2, 100, !dbg !100
  br i1 %cmp1, label %for.body, label %for.end, !dbg !101

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %4 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !102
  store i32 5, i32* %arrayidx, align 4, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !107
  %inc = add i64 %5, 1, !dbg !107
  store i64 %inc, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  store i32* %6, i32** %data, align 8, !dbg !112
  %7 = load i32*, i32** %data, align 8, !dbg !113
  call void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_41_goodG2BSink(i32* noundef %7), !dbg !114
  ret void, !dbg !115
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_41.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "0682cb4b32cbb6619dabb165e0070d67")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_41_badSink", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !3}
!17 = !{}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !1, line: 23, type: !3)
!19 = !DILocation(line: 23, column: 72, scope: !14)
!20 = !DILocation(line: 25, column: 18, scope: !14)
!21 = !DILocation(line: 25, column: 5, scope: !14)
!22 = !DILocation(line: 27, column: 10, scope: !14)
!23 = !DILocation(line: 27, column: 5, scope: !14)
!24 = !DILocation(line: 28, column: 1, scope: !14)
!25 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_41_bad", scope: !1, file: !1, line: 30, type: !26, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "data", scope: !25, file: !1, line: 32, type: !3)
!29 = !DILocation(line: 32, column: 11, scope: !25)
!30 = !DILocation(line: 33, column: 10, scope: !25)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !1, line: 36, type: !33)
!32 = distinct !DILexicalBlock(scope: !25, file: !1, line: 34, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 36, column: 13, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !38, file: !1, line: 38, type: !39)
!38 = distinct !DILexicalBlock(scope: !32, file: !1, line: 37, column: 9)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 38, column: 20, scope: !38)
!43 = !DILocation(line: 39, column: 20, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !1, line: 39, column: 13)
!45 = !DILocation(line: 39, column: 18, scope: !44)
!46 = !DILocation(line: 39, column: 25, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !1, line: 39, column: 13)
!48 = !DILocation(line: 39, column: 27, scope: !47)
!49 = !DILocation(line: 39, column: 13, scope: !44)
!50 = !DILocation(line: 41, column: 28, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 40, column: 13)
!52 = !DILocation(line: 41, column: 17, scope: !51)
!53 = !DILocation(line: 41, column: 31, scope: !51)
!54 = !DILocation(line: 42, column: 13, scope: !51)
!55 = !DILocation(line: 39, column: 35, scope: !47)
!56 = !DILocation(line: 39, column: 13, scope: !47)
!57 = distinct !{!57, !49, !58, !59}
!58 = !DILocation(line: 42, column: 13, scope: !44)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 44, column: 16, scope: !32)
!61 = !DILocation(line: 44, column: 14, scope: !32)
!62 = !DILocation(line: 46, column: 65, scope: !25)
!63 = !DILocation(line: 46, column: 5, scope: !25)
!64 = !DILocation(line: 47, column: 1, scope: !25)
!65 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_41_goodG2BSink", scope: !1, file: !1, line: 53, type: !15, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!66 = !DILocalVariable(name: "data", arg: 1, scope: !65, file: !1, line: 53, type: !3)
!67 = !DILocation(line: 53, column: 76, scope: !65)
!68 = !DILocation(line: 55, column: 18, scope: !65)
!69 = !DILocation(line: 55, column: 5, scope: !65)
!70 = !DILocation(line: 57, column: 10, scope: !65)
!71 = !DILocation(line: 57, column: 5, scope: !65)
!72 = !DILocation(line: 58, column: 1, scope: !65)
!73 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_41_good", scope: !1, file: !1, line: 85, type: !26, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!74 = !DILocation(line: 87, column: 5, scope: !73)
!75 = !DILocation(line: 88, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 61, type: !26, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!77 = !DILocalVariable(name: "data", scope: !76, file: !1, line: 63, type: !3)
!78 = !DILocation(line: 63, column: 11, scope: !76)
!79 = !DILocation(line: 64, column: 10, scope: !76)
!80 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !1, line: 67, type: !3)
!81 = distinct !DILexicalBlock(scope: !76, file: !1, line: 65, column: 5)
!82 = !DILocation(line: 67, column: 15, scope: !81)
!83 = !DILocation(line: 67, column: 35, scope: !81)
!84 = !DILocation(line: 67, column: 28, scope: !81)
!85 = !DILocation(line: 68, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !1, line: 68, column: 13)
!87 = !DILocation(line: 68, column: 24, scope: !86)
!88 = !DILocation(line: 68, column: 13, scope: !81)
!89 = !DILocation(line: 70, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !1, line: 69, column: 9)
!91 = !DILocation(line: 71, column: 13, scope: !90)
!92 = !DILocalVariable(name: "i", scope: !93, file: !1, line: 74, type: !39)
!93 = distinct !DILexicalBlock(scope: !81, file: !1, line: 73, column: 9)
!94 = !DILocation(line: 74, column: 20, scope: !93)
!95 = !DILocation(line: 75, column: 20, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !1, line: 75, column: 13)
!97 = !DILocation(line: 75, column: 18, scope: !96)
!98 = !DILocation(line: 75, column: 25, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !1, line: 75, column: 13)
!100 = !DILocation(line: 75, column: 27, scope: !99)
!101 = !DILocation(line: 75, column: 13, scope: !96)
!102 = !DILocation(line: 77, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !1, line: 76, column: 13)
!104 = !DILocation(line: 77, column: 28, scope: !103)
!105 = !DILocation(line: 77, column: 31, scope: !103)
!106 = !DILocation(line: 78, column: 13, scope: !103)
!107 = !DILocation(line: 75, column: 35, scope: !99)
!108 = !DILocation(line: 75, column: 13, scope: !99)
!109 = distinct !{!109, !101, !110, !59}
!110 = !DILocation(line: 78, column: 13, scope: !96)
!111 = !DILocation(line: 80, column: 16, scope: !81)
!112 = !DILocation(line: 80, column: 14, scope: !81)
!113 = !DILocation(line: 82, column: 69, scope: !76)
!114 = !DILocation(line: 82, column: 5, scope: !76)
!115 = !DILocation(line: 83, column: 1, scope: !76)
