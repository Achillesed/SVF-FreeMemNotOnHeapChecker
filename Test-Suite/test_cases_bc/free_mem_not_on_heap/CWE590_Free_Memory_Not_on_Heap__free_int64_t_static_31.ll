; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_31.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_31_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_31_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
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
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_31_bad.dataBuffer, i64 0, i64 %1, !dbg !47
  store i64 5, i64* %arrayidx, align 8, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %2, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_31_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !56, metadata !DIExpression()), !dbg !58
  %3 = load i64*, i64** %data, align 8, !dbg !59
  store i64* %3, i64** %dataCopy, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !60, metadata !DIExpression()), !dbg !61
  %4 = load i64*, i64** %dataCopy, align 8, !dbg !62
  store i64* %4, i64** %data1, align 8, !dbg !61
  %5 = load i64*, i64** %data1, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i64, i64* %5, i64 0, !dbg !63
  %6 = load i64, i64* %arrayidx2, align 8, !dbg !63
  call void @printLongLongLine(i64 noundef %6), !dbg !64
  %7 = load i64*, i64** %data1, align 8, !dbg !65
  %8 = bitcast i64* %7 to i8*, !dbg !65
  call void @free(i8* noundef %8) #5, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_31_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %dataCopy = alloca i64*, align 8
  %data2 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !72, metadata !DIExpression()), !dbg !73
  store i64* null, i64** %data, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !77
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !78
  %0 = bitcast i8* %call to i64*, !dbg !79
  store i64* %0, i64** %dataBuffer, align 8, !dbg !77
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !80
  %cmp = icmp eq i64* %1, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @exit(i32 noundef 1) #6, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !87, metadata !DIExpression()), !dbg !89
  store i64 0, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !93
  %cmp1 = icmp ult i64 %2, 100, !dbg !95
  br i1 %cmp1, label %for.body, label %for.end, !dbg !96

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !97
  %4 = load i64, i64* %i, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !97
  store i64 5, i64* %arrayidx, align 8, !dbg !100
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !102
  %inc = add i64 %5, 1, !dbg !102
  store i64 %inc, i64* %i, align 8, !dbg !102
  br label %for.cond, !dbg !103, !llvm.loop !104

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !106
  store i64* %6, i64** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !108, metadata !DIExpression()), !dbg !110
  %7 = load i64*, i64** %data, align 8, !dbg !111
  store i64* %7, i64** %dataCopy, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !112, metadata !DIExpression()), !dbg !113
  %8 = load i64*, i64** %dataCopy, align 8, !dbg !114
  store i64* %8, i64** %data2, align 8, !dbg !113
  %9 = load i64*, i64** %data2, align 8, !dbg !115
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !115
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !115
  call void @printLongLongLine(i64 noundef %10), !dbg !116
  %11 = load i64*, i64** %data2, align 8, !dbg !117
  %12 = bitcast i64* %11 to i8*, !dbg !117
  call void @free(i8* noundef %12) #5, !dbg !118
  ret void, !dbg !119
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

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!20, !21, !22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 29, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_31_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_31.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "af0ba4131f835f783654a0e90824267a")
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
!31 = !DILocalVariable(name: "i", scope: !32, file: !3, line: 31, type: !34)
!32 = distinct !DILexicalBlock(scope: !33, file: !3, line: 30, column: 9)
!33 = distinct !DILexicalBlock(scope: !2, file: !3, line: 27, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 31, column: 20, scope: !32)
!38 = !DILocation(line: 32, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !3, line: 32, column: 13)
!40 = !DILocation(line: 32, column: 18, scope: !39)
!41 = !DILocation(line: 32, column: 25, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !3, line: 32, column: 13)
!43 = !DILocation(line: 32, column: 27, scope: !42)
!44 = !DILocation(line: 32, column: 13, scope: !39)
!45 = !DILocation(line: 34, column: 28, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !3, line: 33, column: 13)
!47 = !DILocation(line: 34, column: 17, scope: !46)
!48 = !DILocation(line: 34, column: 31, scope: !46)
!49 = !DILocation(line: 35, column: 13, scope: !46)
!50 = !DILocation(line: 32, column: 35, scope: !42)
!51 = !DILocation(line: 32, column: 13, scope: !42)
!52 = distinct !{!52, !44, !53, !54}
!53 = !DILocation(line: 35, column: 13, scope: !39)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 37, column: 14, scope: !33)
!56 = !DILocalVariable(name: "dataCopy", scope: !57, file: !3, line: 40, type: !8)
!57 = distinct !DILexicalBlock(scope: !2, file: !3, line: 39, column: 5)
!58 = !DILocation(line: 40, column: 19, scope: !57)
!59 = !DILocation(line: 40, column: 30, scope: !57)
!60 = !DILocalVariable(name: "data", scope: !57, file: !3, line: 41, type: !8)
!61 = !DILocation(line: 41, column: 19, scope: !57)
!62 = !DILocation(line: 41, column: 26, scope: !57)
!63 = !DILocation(line: 42, column: 27, scope: !57)
!64 = !DILocation(line: 42, column: 9, scope: !57)
!65 = !DILocation(line: 44, column: 14, scope: !57)
!66 = !DILocation(line: 44, column: 9, scope: !57)
!67 = !DILocation(line: 46, column: 1, scope: !2)
!68 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_31_good", scope: !3, file: !3, line: 83, type: !4, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!69 = !DILocation(line: 85, column: 5, scope: !68)
!70 = !DILocation(line: 86, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 53, type: !4, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!72 = !DILocalVariable(name: "data", scope: !71, file: !3, line: 55, type: !8)
!73 = !DILocation(line: 55, column: 15, scope: !71)
!74 = !DILocation(line: 56, column: 10, scope: !71)
!75 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !3, line: 59, type: !8)
!76 = distinct !DILexicalBlock(scope: !71, file: !3, line: 57, column: 5)
!77 = !DILocation(line: 59, column: 19, scope: !76)
!78 = !DILocation(line: 59, column: 43, scope: !76)
!79 = !DILocation(line: 59, column: 32, scope: !76)
!80 = !DILocation(line: 60, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !3, line: 60, column: 13)
!82 = !DILocation(line: 60, column: 24, scope: !81)
!83 = !DILocation(line: 60, column: 13, scope: !76)
!84 = !DILocation(line: 62, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !3, line: 61, column: 9)
!86 = !DILocation(line: 63, column: 13, scope: !85)
!87 = !DILocalVariable(name: "i", scope: !88, file: !3, line: 66, type: !34)
!88 = distinct !DILexicalBlock(scope: !76, file: !3, line: 65, column: 9)
!89 = !DILocation(line: 66, column: 20, scope: !88)
!90 = !DILocation(line: 67, column: 20, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !3, line: 67, column: 13)
!92 = !DILocation(line: 67, column: 18, scope: !91)
!93 = !DILocation(line: 67, column: 25, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !3, line: 67, column: 13)
!95 = !DILocation(line: 67, column: 27, scope: !94)
!96 = !DILocation(line: 67, column: 13, scope: !91)
!97 = !DILocation(line: 69, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !3, line: 68, column: 13)
!99 = !DILocation(line: 69, column: 28, scope: !98)
!100 = !DILocation(line: 69, column: 31, scope: !98)
!101 = !DILocation(line: 70, column: 13, scope: !98)
!102 = !DILocation(line: 67, column: 35, scope: !94)
!103 = !DILocation(line: 67, column: 13, scope: !94)
!104 = distinct !{!104, !96, !105, !54}
!105 = !DILocation(line: 70, column: 13, scope: !91)
!106 = !DILocation(line: 72, column: 16, scope: !76)
!107 = !DILocation(line: 72, column: 14, scope: !76)
!108 = !DILocalVariable(name: "dataCopy", scope: !109, file: !3, line: 75, type: !8)
!109 = distinct !DILexicalBlock(scope: !71, file: !3, line: 74, column: 5)
!110 = !DILocation(line: 75, column: 19, scope: !109)
!111 = !DILocation(line: 75, column: 30, scope: !109)
!112 = !DILocalVariable(name: "data", scope: !109, file: !3, line: 76, type: !8)
!113 = !DILocation(line: 76, column: 19, scope: !109)
!114 = !DILocation(line: 76, column: 26, scope: !109)
!115 = !DILocation(line: 77, column: 27, scope: !109)
!116 = !DILocation(line: 77, column: 9, scope: !109)
!117 = !DILocation(line: 79, column: 14, scope: !109)
!118 = !DILocation(line: 79, column: 9, scope: !109)
!119 = !DILocation(line: 81, column: 1, scope: !71)
