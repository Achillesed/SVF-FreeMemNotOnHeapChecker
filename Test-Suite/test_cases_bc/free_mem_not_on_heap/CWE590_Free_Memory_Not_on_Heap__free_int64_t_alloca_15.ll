; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_15.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_15_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 800, align 16, !dbg !28
  %1 = bitcast i8* %0 to i64*, !dbg !29
  store i64* %1, i64** %dataBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %2, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !43
  %4 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !43
  store i64 5, i64* %arrayidx, align 8, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %5, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !53
  store i64* %6, i64** %data, align 8, !dbg !54
  %7 = load i64*, i64** %data, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !55
  %8 = load i64, i64* %arrayidx1, align 8, !dbg !55
  call void @printLongLongLine(i64 noundef %8), !dbg !56
  %9 = load i64*, i64** %data, align 8, !dbg !57
  %10 = bitcast i64* %9 to i8*, !dbg !57
  call void @free(i8* noundef %10) #5, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_15_good() #0 !dbg !60 {
entry:
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !64 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !65, metadata !DIExpression()), !dbg !66
  store i64* null, i64** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !68, metadata !DIExpression()), !dbg !70
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !71
  %0 = bitcast i8* %call to i64*, !dbg !72
  store i64* %0, i64** %dataBuffer, align 8, !dbg !70
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !73
  %cmp = icmp eq i64* %1, null, !dbg !75
  br i1 %cmp, label %if.then, label %if.end, !dbg !76

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @exit(i32 noundef 1) #6, !dbg !79
  unreachable, !dbg !79

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !80, metadata !DIExpression()), !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !86
  %cmp1 = icmp ult i64 %2, 100, !dbg !88
  br i1 %cmp1, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !90
  %4 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !90
  store i64 5, i64* %arrayidx, align 8, !dbg !93
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !95
  %inc = add i64 %5, 1, !dbg !95
  store i64 %inc, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !99
  store i64* %6, i64** %data, align 8, !dbg !100
  %7 = load i64*, i64** %data, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !101
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !101
  call void @printLongLongLine(i64 noundef %8), !dbg !102
  %9 = load i64*, i64** %data, align 8, !dbg !103
  %10 = bitcast i64* %9 to i8*, !dbg !103
  call void @free(i8* noundef %10) #5, !dbg !104
  ret void, !dbg !105
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i64* null, i64** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !110, metadata !DIExpression()), !dbg !112
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !113
  %0 = bitcast i8* %call to i64*, !dbg !114
  store i64* %0, i64** %dataBuffer, align 8, !dbg !112
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !115
  %cmp = icmp eq i64* %1, null, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !119
  call void @exit(i32 noundef 1) #6, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !128
  %cmp1 = icmp ult i64 %2, 100, !dbg !130
  br i1 %cmp1, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !132
  %4 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !132
  store i64 5, i64* %arrayidx, align 8, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %5, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !141
  store i64* %6, i64** %data, align 8, !dbg !142
  %7 = load i64*, i64** %data, align 8, !dbg !143
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !143
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !143
  call void @printLongLongLine(i64 noundef %8), !dbg !144
  %9 = load i64*, i64** %data, align 8, !dbg !145
  %10 = bitcast i64* %9 to i8*, !dbg !145
  call void @free(i8* noundef %10) #5, !dbg !146
  ret void, !dbg !147
}

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_15.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "d4f4dc8e0530c29c23001aea96fb5972")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_15_bad", scope: !1, file: !1, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !18)
!24 = !DILocation(line: 26, column: 10, scope: !18)
!25 = !DILocalVariable(name: "dataBuffer", scope: !26, file: !1, line: 32, type: !3)
!26 = distinct !DILexicalBlock(scope: !18, file: !1, line: 30, column: 5)
!27 = !DILocation(line: 32, column: 19, scope: !26)
!28 = !DILocation(line: 32, column: 43, scope: !26)
!29 = !DILocation(line: 32, column: 32, scope: !26)
!30 = !DILocalVariable(name: "i", scope: !31, file: !1, line: 34, type: !32)
!31 = distinct !DILexicalBlock(scope: !26, file: !1, line: 33, column: 9)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !33, line: 46, baseType: !34)
!33 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!34 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 34, column: 20, scope: !31)
!36 = !DILocation(line: 35, column: 20, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !1, line: 35, column: 13)
!38 = !DILocation(line: 35, column: 18, scope: !37)
!39 = !DILocation(line: 35, column: 25, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !1, line: 35, column: 13)
!41 = !DILocation(line: 35, column: 27, scope: !40)
!42 = !DILocation(line: 35, column: 13, scope: !37)
!43 = !DILocation(line: 37, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !1, line: 36, column: 13)
!45 = !DILocation(line: 37, column: 28, scope: !44)
!46 = !DILocation(line: 37, column: 31, scope: !44)
!47 = !DILocation(line: 38, column: 13, scope: !44)
!48 = !DILocation(line: 35, column: 35, scope: !40)
!49 = !DILocation(line: 35, column: 13, scope: !40)
!50 = distinct !{!50, !42, !51, !52}
!51 = !DILocation(line: 38, column: 13, scope: !37)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 40, column: 16, scope: !26)
!54 = !DILocation(line: 40, column: 14, scope: !26)
!55 = !DILocation(line: 48, column: 23, scope: !18)
!56 = !DILocation(line: 48, column: 5, scope: !18)
!57 = !DILocation(line: 50, column: 10, scope: !18)
!58 = !DILocation(line: 50, column: 5, scope: !18)
!59 = !DILocation(line: 51, column: 1, scope: !18)
!60 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_15_good", scope: !1, file: !1, line: 129, type: !19, scopeLine: 130, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!61 = !DILocation(line: 131, column: 5, scope: !60)
!62 = !DILocation(line: 132, column: 5, scope: !60)
!63 = !DILocation(line: 133, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!65 = !DILocalVariable(name: "data", scope: !64, file: !1, line: 60, type: !3)
!66 = !DILocation(line: 60, column: 15, scope: !64)
!67 = !DILocation(line: 61, column: 10, scope: !64)
!68 = !DILocalVariable(name: "dataBuffer", scope: !69, file: !1, line: 71, type: !3)
!69 = distinct !DILexicalBlock(scope: !64, file: !1, line: 69, column: 5)
!70 = !DILocation(line: 71, column: 19, scope: !69)
!71 = !DILocation(line: 71, column: 43, scope: !69)
!72 = !DILocation(line: 71, column: 32, scope: !69)
!73 = !DILocation(line: 72, column: 13, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !1, line: 72, column: 13)
!75 = !DILocation(line: 72, column: 24, scope: !74)
!76 = !DILocation(line: 72, column: 13, scope: !69)
!77 = !DILocation(line: 74, column: 13, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !1, line: 73, column: 9)
!79 = !DILocation(line: 75, column: 13, scope: !78)
!80 = !DILocalVariable(name: "i", scope: !81, file: !1, line: 78, type: !32)
!81 = distinct !DILexicalBlock(scope: !69, file: !1, line: 77, column: 9)
!82 = !DILocation(line: 78, column: 20, scope: !81)
!83 = !DILocation(line: 79, column: 20, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !1, line: 79, column: 13)
!85 = !DILocation(line: 79, column: 18, scope: !84)
!86 = !DILocation(line: 79, column: 25, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !1, line: 79, column: 13)
!88 = !DILocation(line: 79, column: 27, scope: !87)
!89 = !DILocation(line: 79, column: 13, scope: !84)
!90 = !DILocation(line: 81, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !1, line: 80, column: 13)
!92 = !DILocation(line: 81, column: 28, scope: !91)
!93 = !DILocation(line: 81, column: 31, scope: !91)
!94 = !DILocation(line: 82, column: 13, scope: !91)
!95 = !DILocation(line: 79, column: 35, scope: !87)
!96 = !DILocation(line: 79, column: 13, scope: !87)
!97 = distinct !{!97, !89, !98, !52}
!98 = !DILocation(line: 82, column: 13, scope: !84)
!99 = !DILocation(line: 84, column: 16, scope: !69)
!100 = !DILocation(line: 84, column: 14, scope: !69)
!101 = !DILocation(line: 88, column: 23, scope: !64)
!102 = !DILocation(line: 88, column: 5, scope: !64)
!103 = !DILocation(line: 90, column: 10, scope: !64)
!104 = !DILocation(line: 90, column: 5, scope: !64)
!105 = !DILocation(line: 91, column: 1, scope: !64)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 94, type: !19, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!107 = !DILocalVariable(name: "data", scope: !106, file: !1, line: 96, type: !3)
!108 = !DILocation(line: 96, column: 15, scope: !106)
!109 = !DILocation(line: 97, column: 10, scope: !106)
!110 = !DILocalVariable(name: "dataBuffer", scope: !111, file: !1, line: 103, type: !3)
!111 = distinct !DILexicalBlock(scope: !106, file: !1, line: 101, column: 5)
!112 = !DILocation(line: 103, column: 19, scope: !111)
!113 = !DILocation(line: 103, column: 43, scope: !111)
!114 = !DILocation(line: 103, column: 32, scope: !111)
!115 = !DILocation(line: 104, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !1, line: 104, column: 13)
!117 = !DILocation(line: 104, column: 24, scope: !116)
!118 = !DILocation(line: 104, column: 13, scope: !111)
!119 = !DILocation(line: 106, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !1, line: 105, column: 9)
!121 = !DILocation(line: 107, column: 13, scope: !120)
!122 = !DILocalVariable(name: "i", scope: !123, file: !1, line: 110, type: !32)
!123 = distinct !DILexicalBlock(scope: !111, file: !1, line: 109, column: 9)
!124 = !DILocation(line: 110, column: 20, scope: !123)
!125 = !DILocation(line: 111, column: 20, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !1, line: 111, column: 13)
!127 = !DILocation(line: 111, column: 18, scope: !126)
!128 = !DILocation(line: 111, column: 25, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !1, line: 111, column: 13)
!130 = !DILocation(line: 111, column: 27, scope: !129)
!131 = !DILocation(line: 111, column: 13, scope: !126)
!132 = !DILocation(line: 113, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !1, line: 112, column: 13)
!134 = !DILocation(line: 113, column: 28, scope: !133)
!135 = !DILocation(line: 113, column: 31, scope: !133)
!136 = !DILocation(line: 114, column: 13, scope: !133)
!137 = !DILocation(line: 111, column: 35, scope: !129)
!138 = !DILocation(line: 111, column: 13, scope: !129)
!139 = distinct !{!139, !131, !140, !52}
!140 = !DILocation(line: 114, column: 13, scope: !126)
!141 = !DILocation(line: 116, column: 16, scope: !111)
!142 = !DILocation(line: 116, column: 14, scope: !111)
!143 = !DILocation(line: 124, column: 23, scope: !106)
!144 = !DILocation(line: 124, column: 5, scope: !106)
!145 = !DILocation(line: 126, column: 10, scope: !106)
!146 = !DILocation(line: 126, column: 5, scope: !106)
!147 = !DILocation(line: 127, column: 1, scope: !106)
