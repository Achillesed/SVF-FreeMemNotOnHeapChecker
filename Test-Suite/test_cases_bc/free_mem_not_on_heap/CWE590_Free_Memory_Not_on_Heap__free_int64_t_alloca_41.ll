; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_41.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_41_badSink(i64* noundef %data) #0 !dbg !18 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i64*, i64** %data.addr, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0, !dbg !24
  %1 = load i64, i64* %arrayidx, align 8, !dbg !24
  call void @printLongLongLine(i64 noundef %1), !dbg !25
  %2 = load i64*, i64** %data.addr, align 8, !dbg !26
  %3 = bitcast i64* %2 to i8*, !dbg !26
  call void @free(i8* noundef %3) #5, !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_41_bad() #0 !dbg !29 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !32, metadata !DIExpression()), !dbg !33
  store i64* null, i64** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !35, metadata !DIExpression()), !dbg !37
  %0 = alloca i8, i64 800, align 16, !dbg !38
  %1 = bitcast i8* %0 to i64*, !dbg !39
  store i64* %1, i64** %dataBuffer, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %2, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !53
  %4 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !53
  store i64 5, i64* %arrayidx, align 8, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %5, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !63
  store i64* %6, i64** %data, align 8, !dbg !64
  %7 = load i64*, i64** %data, align 8, !dbg !65
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_41_badSink(i64* noundef %7), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_41_goodG2BSink(i64* noundef %data) #0 !dbg !68 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = load i64*, i64** %data.addr, align 8, !dbg !71
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0, !dbg !71
  %1 = load i64, i64* %arrayidx, align 8, !dbg !71
  call void @printLongLongLine(i64 noundef %1), !dbg !72
  %2 = load i64*, i64** %data.addr, align 8, !dbg !73
  %3 = bitcast i64* %2 to i8*, !dbg !73
  call void @free(i8* noundef %3) #5, !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_41_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i64* null, i64** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !85
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !86
  %0 = bitcast i8* %call to i64*, !dbg !87
  store i64* %0, i64** %dataBuffer, align 8, !dbg !85
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !88
  %cmp = icmp eq i64* %1, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @exit(i32 noundef 1) #6, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !95, metadata !DIExpression()), !dbg !97
  store i64 0, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !101
  %cmp1 = icmp ult i64 %2, 100, !dbg !103
  br i1 %cmp1, label %for.body, label %for.end, !dbg !104

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !105
  %4 = load i64, i64* %i, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !105
  store i64 5, i64* %arrayidx, align 8, !dbg !108
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !110
  %inc = add i64 %5, 1, !dbg !110
  store i64 %inc, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !111, !llvm.loop !112

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !114
  store i64* %6, i64** %data, align 8, !dbg !115
  %7 = load i64*, i64** %data, align 8, !dbg !116
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_41_goodG2BSink(i64* noundef %7), !dbg !117
  ret void, !dbg !118
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
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_41.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1670596ecd5f2a7d2c540ab657553bd6")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !5, line: 27, baseType: !6)
!5 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !7, line: 44, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!8 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 5}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"PIE Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_41_badSink", scope: !1, file: !1, line: 23, type: !19, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !3}
!21 = !{}
!22 = !DILocalVariable(name: "data", arg: 1, scope: !18, file: !1, line: 23, type: !3)
!23 = !DILocation(line: 23, column: 79, scope: !18)
!24 = !DILocation(line: 25, column: 23, scope: !18)
!25 = !DILocation(line: 25, column: 5, scope: !18)
!26 = !DILocation(line: 27, column: 10, scope: !18)
!27 = !DILocation(line: 27, column: 5, scope: !18)
!28 = !DILocation(line: 28, column: 1, scope: !18)
!29 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_41_bad", scope: !1, file: !1, line: 30, type: !30, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!30 = !DISubroutineType(types: !31)
!31 = !{null}
!32 = !DILocalVariable(name: "data", scope: !29, file: !1, line: 32, type: !3)
!33 = !DILocation(line: 32, column: 15, scope: !29)
!34 = !DILocation(line: 33, column: 10, scope: !29)
!35 = !DILocalVariable(name: "dataBuffer", scope: !36, file: !1, line: 36, type: !3)
!36 = distinct !DILexicalBlock(scope: !29, file: !1, line: 34, column: 5)
!37 = !DILocation(line: 36, column: 19, scope: !36)
!38 = !DILocation(line: 36, column: 43, scope: !36)
!39 = !DILocation(line: 36, column: 32, scope: !36)
!40 = !DILocalVariable(name: "i", scope: !41, file: !1, line: 38, type: !42)
!41 = distinct !DILexicalBlock(scope: !36, file: !1, line: 37, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!44 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 38, column: 20, scope: !41)
!46 = !DILocation(line: 39, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !1, line: 39, column: 13)
!48 = !DILocation(line: 39, column: 18, scope: !47)
!49 = !DILocation(line: 39, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !1, line: 39, column: 13)
!51 = !DILocation(line: 39, column: 27, scope: !50)
!52 = !DILocation(line: 39, column: 13, scope: !47)
!53 = !DILocation(line: 41, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !1, line: 40, column: 13)
!55 = !DILocation(line: 41, column: 28, scope: !54)
!56 = !DILocation(line: 41, column: 31, scope: !54)
!57 = !DILocation(line: 42, column: 13, scope: !54)
!58 = !DILocation(line: 39, column: 35, scope: !50)
!59 = !DILocation(line: 39, column: 13, scope: !50)
!60 = distinct !{!60, !52, !61, !62}
!61 = !DILocation(line: 42, column: 13, scope: !47)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 44, column: 16, scope: !36)
!64 = !DILocation(line: 44, column: 14, scope: !36)
!65 = !DILocation(line: 46, column: 68, scope: !29)
!66 = !DILocation(line: 46, column: 5, scope: !29)
!67 = !DILocation(line: 47, column: 1, scope: !29)
!68 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_41_goodG2BSink", scope: !1, file: !1, line: 53, type: !19, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!69 = !DILocalVariable(name: "data", arg: 1, scope: !68, file: !1, line: 53, type: !3)
!70 = !DILocation(line: 53, column: 83, scope: !68)
!71 = !DILocation(line: 55, column: 23, scope: !68)
!72 = !DILocation(line: 55, column: 5, scope: !68)
!73 = !DILocation(line: 57, column: 10, scope: !68)
!74 = !DILocation(line: 57, column: 5, scope: !68)
!75 = !DILocation(line: 58, column: 1, scope: !68)
!76 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_41_good", scope: !1, file: !1, line: 85, type: !30, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!77 = !DILocation(line: 87, column: 5, scope: !76)
!78 = !DILocation(line: 88, column: 1, scope: !76)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 61, type: !30, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!80 = !DILocalVariable(name: "data", scope: !79, file: !1, line: 63, type: !3)
!81 = !DILocation(line: 63, column: 15, scope: !79)
!82 = !DILocation(line: 64, column: 10, scope: !79)
!83 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !1, line: 67, type: !3)
!84 = distinct !DILexicalBlock(scope: !79, file: !1, line: 65, column: 5)
!85 = !DILocation(line: 67, column: 19, scope: !84)
!86 = !DILocation(line: 67, column: 43, scope: !84)
!87 = !DILocation(line: 67, column: 32, scope: !84)
!88 = !DILocation(line: 68, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !1, line: 68, column: 13)
!90 = !DILocation(line: 68, column: 24, scope: !89)
!91 = !DILocation(line: 68, column: 13, scope: !84)
!92 = !DILocation(line: 70, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !1, line: 69, column: 9)
!94 = !DILocation(line: 71, column: 13, scope: !93)
!95 = !DILocalVariable(name: "i", scope: !96, file: !1, line: 74, type: !42)
!96 = distinct !DILexicalBlock(scope: !84, file: !1, line: 73, column: 9)
!97 = !DILocation(line: 74, column: 20, scope: !96)
!98 = !DILocation(line: 75, column: 20, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !1, line: 75, column: 13)
!100 = !DILocation(line: 75, column: 18, scope: !99)
!101 = !DILocation(line: 75, column: 25, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !1, line: 75, column: 13)
!103 = !DILocation(line: 75, column: 27, scope: !102)
!104 = !DILocation(line: 75, column: 13, scope: !99)
!105 = !DILocation(line: 77, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !1, line: 76, column: 13)
!107 = !DILocation(line: 77, column: 28, scope: !106)
!108 = !DILocation(line: 77, column: 31, scope: !106)
!109 = !DILocation(line: 78, column: 13, scope: !106)
!110 = !DILocation(line: 75, column: 35, scope: !102)
!111 = !DILocation(line: 75, column: 13, scope: !102)
!112 = distinct !{!112, !104, !113, !62}
!113 = !DILocation(line: 78, column: 13, scope: !99)
!114 = !DILocation(line: 80, column: 16, scope: !84)
!115 = !DILocation(line: 80, column: 14, scope: !84)
!116 = !DILocation(line: 82, column: 72, scope: !79)
!117 = !DILocation(line: 82, column: 5, scope: !79)
!118 = !DILocation(line: 83, column: 1, scope: !79)
