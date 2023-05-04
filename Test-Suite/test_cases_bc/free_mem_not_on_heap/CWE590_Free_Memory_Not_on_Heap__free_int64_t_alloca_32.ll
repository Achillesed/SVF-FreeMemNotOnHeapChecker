; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_32.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_32_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %data1 = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %data2 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !24, metadata !DIExpression()), !dbg !26
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !27, metadata !DIExpression()), !dbg !28
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !28
  store i64* null, i64** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !30, metadata !DIExpression()), !dbg !32
  %0 = load i64**, i64*** %dataPtr1, align 8, !dbg !33
  %1 = load i64*, i64** %0, align 8, !dbg !34
  store i64* %1, i64** %data1, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !35, metadata !DIExpression()), !dbg !37
  %2 = alloca i8, i64 800, align 16, !dbg !38
  %3 = bitcast i8* %2 to i64*, !dbg !39
  store i64* %3, i64** %dataBuffer, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %4, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %5 = load i64*, i64** %dataBuffer, align 8, !dbg !53
  %6 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !53
  store i64 5, i64* %arrayidx, align 8, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %7, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %dataBuffer, align 8, !dbg !63
  store i64* %8, i64** %data1, align 8, !dbg !64
  %9 = load i64*, i64** %data1, align 8, !dbg !65
  %10 = load i64**, i64*** %dataPtr1, align 8, !dbg !66
  store i64* %9, i64** %10, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !68, metadata !DIExpression()), !dbg !70
  %11 = load i64**, i64*** %dataPtr2, align 8, !dbg !71
  %12 = load i64*, i64** %11, align 8, !dbg !72
  store i64* %12, i64** %data2, align 8, !dbg !70
  %13 = load i64*, i64** %data2, align 8, !dbg !73
  %arrayidx3 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !73
  %14 = load i64, i64* %arrayidx3, align 8, !dbg !73
  call void @printLongLongLine(i64 noundef %14), !dbg !74
  %15 = load i64*, i64** %data2, align 8, !dbg !75
  %16 = bitcast i64* %15 to i8*, !dbg !75
  call void @free(i8* noundef %16) #5, !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_32_good() #0 !dbg !78 {
entry:
  call void @goodG2B(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %data1 = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %data3 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !84, metadata !DIExpression()), !dbg !85
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !86, metadata !DIExpression()), !dbg !87
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !87
  store i64* null, i64** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !89, metadata !DIExpression()), !dbg !91
  %0 = load i64**, i64*** %dataPtr1, align 8, !dbg !92
  %1 = load i64*, i64** %0, align 8, !dbg !93
  store i64* %1, i64** %data1, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !94, metadata !DIExpression()), !dbg !96
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !97
  %2 = bitcast i8* %call to i64*, !dbg !98
  store i64* %2, i64** %dataBuffer, align 8, !dbg !96
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !99
  %cmp = icmp eq i64* %3, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @exit(i32 noundef 1) #6, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !106, metadata !DIExpression()), !dbg !108
  store i64 0, i64* %i, align 8, !dbg !109
  br label %for.cond, !dbg !111

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !112
  %cmp2 = icmp ult i64 %4, 100, !dbg !114
  br i1 %cmp2, label %for.body, label %for.end, !dbg !115

for.body:                                         ; preds = %for.cond
  %5 = load i64*, i64** %dataBuffer, align 8, !dbg !116
  %6 = load i64, i64* %i, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !116
  store i64 5, i64* %arrayidx, align 8, !dbg !119
  br label %for.inc, !dbg !120

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !121
  %inc = add i64 %7, 1, !dbg !121
  store i64 %inc, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !122, !llvm.loop !123

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %dataBuffer, align 8, !dbg !125
  store i64* %8, i64** %data1, align 8, !dbg !126
  %9 = load i64*, i64** %data1, align 8, !dbg !127
  %10 = load i64**, i64*** %dataPtr1, align 8, !dbg !128
  store i64* %9, i64** %10, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata i64** %data3, metadata !130, metadata !DIExpression()), !dbg !132
  %11 = load i64**, i64*** %dataPtr2, align 8, !dbg !133
  %12 = load i64*, i64** %11, align 8, !dbg !134
  store i64* %12, i64** %data3, align 8, !dbg !132
  %13 = load i64*, i64** %data3, align 8, !dbg !135
  %arrayidx4 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !135
  %14 = load i64, i64* %arrayidx4, align 8, !dbg !135
  call void @printLongLongLine(i64 noundef %14), !dbg !136
  %15 = load i64*, i64** %data3, align 8, !dbg !137
  %16 = bitcast i64* %15 to i8*, !dbg !137
  call void @free(i8* noundef %16) #5, !dbg !138
  ret void, !dbg !139
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_32.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1c56b40d4197ce76fa06ff238bce0472")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_32_bad", scope: !1, file: !1, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !18)
!24 = !DILocalVariable(name: "dataPtr1", scope: !18, file: !1, line: 26, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!26 = !DILocation(line: 26, column: 16, scope: !18)
!27 = !DILocalVariable(name: "dataPtr2", scope: !18, file: !1, line: 27, type: !25)
!28 = !DILocation(line: 27, column: 16, scope: !18)
!29 = !DILocation(line: 28, column: 10, scope: !18)
!30 = !DILocalVariable(name: "data", scope: !31, file: !1, line: 30, type: !3)
!31 = distinct !DILexicalBlock(scope: !18, file: !1, line: 29, column: 5)
!32 = !DILocation(line: 30, column: 19, scope: !31)
!33 = !DILocation(line: 30, column: 27, scope: !31)
!34 = !DILocation(line: 30, column: 26, scope: !31)
!35 = !DILocalVariable(name: "dataBuffer", scope: !36, file: !1, line: 33, type: !3)
!36 = distinct !DILexicalBlock(scope: !31, file: !1, line: 31, column: 9)
!37 = !DILocation(line: 33, column: 23, scope: !36)
!38 = !DILocation(line: 33, column: 47, scope: !36)
!39 = !DILocation(line: 33, column: 36, scope: !36)
!40 = !DILocalVariable(name: "i", scope: !41, file: !1, line: 35, type: !42)
!41 = distinct !DILexicalBlock(scope: !36, file: !1, line: 34, column: 13)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!44 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 35, column: 24, scope: !41)
!46 = !DILocation(line: 36, column: 24, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !1, line: 36, column: 17)
!48 = !DILocation(line: 36, column: 22, scope: !47)
!49 = !DILocation(line: 36, column: 29, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !1, line: 36, column: 17)
!51 = !DILocation(line: 36, column: 31, scope: !50)
!52 = !DILocation(line: 36, column: 17, scope: !47)
!53 = !DILocation(line: 38, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !1, line: 37, column: 17)
!55 = !DILocation(line: 38, column: 32, scope: !54)
!56 = !DILocation(line: 38, column: 35, scope: !54)
!57 = !DILocation(line: 39, column: 17, scope: !54)
!58 = !DILocation(line: 36, column: 39, scope: !50)
!59 = !DILocation(line: 36, column: 17, scope: !50)
!60 = distinct !{!60, !52, !61, !62}
!61 = !DILocation(line: 39, column: 17, scope: !47)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 41, column: 20, scope: !36)
!64 = !DILocation(line: 41, column: 18, scope: !36)
!65 = !DILocation(line: 43, column: 21, scope: !31)
!66 = !DILocation(line: 43, column: 10, scope: !31)
!67 = !DILocation(line: 43, column: 19, scope: !31)
!68 = !DILocalVariable(name: "data", scope: !69, file: !1, line: 46, type: !3)
!69 = distinct !DILexicalBlock(scope: !18, file: !1, line: 45, column: 5)
!70 = !DILocation(line: 46, column: 19, scope: !69)
!71 = !DILocation(line: 46, column: 27, scope: !69)
!72 = !DILocation(line: 46, column: 26, scope: !69)
!73 = !DILocation(line: 47, column: 27, scope: !69)
!74 = !DILocation(line: 47, column: 9, scope: !69)
!75 = !DILocation(line: 49, column: 14, scope: !69)
!76 = !DILocation(line: 49, column: 9, scope: !69)
!77 = !DILocation(line: 51, column: 1, scope: !18)
!78 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_32_good", scope: !1, file: !1, line: 93, type: !19, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!79 = !DILocation(line: 95, column: 5, scope: !78)
!80 = !DILocation(line: 96, column: 1, scope: !78)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!82 = !DILocalVariable(name: "data", scope: !81, file: !1, line: 60, type: !3)
!83 = !DILocation(line: 60, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataPtr1", scope: !81, file: !1, line: 61, type: !25)
!85 = !DILocation(line: 61, column: 16, scope: !81)
!86 = !DILocalVariable(name: "dataPtr2", scope: !81, file: !1, line: 62, type: !25)
!87 = !DILocation(line: 62, column: 16, scope: !81)
!88 = !DILocation(line: 63, column: 10, scope: !81)
!89 = !DILocalVariable(name: "data", scope: !90, file: !1, line: 65, type: !3)
!90 = distinct !DILexicalBlock(scope: !81, file: !1, line: 64, column: 5)
!91 = !DILocation(line: 65, column: 19, scope: !90)
!92 = !DILocation(line: 65, column: 27, scope: !90)
!93 = !DILocation(line: 65, column: 26, scope: !90)
!94 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !1, line: 68, type: !3)
!95 = distinct !DILexicalBlock(scope: !90, file: !1, line: 66, column: 9)
!96 = !DILocation(line: 68, column: 23, scope: !95)
!97 = !DILocation(line: 68, column: 47, scope: !95)
!98 = !DILocation(line: 68, column: 36, scope: !95)
!99 = !DILocation(line: 69, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !1, line: 69, column: 17)
!101 = !DILocation(line: 69, column: 28, scope: !100)
!102 = !DILocation(line: 69, column: 17, scope: !95)
!103 = !DILocation(line: 71, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !1, line: 70, column: 13)
!105 = !DILocation(line: 72, column: 17, scope: !104)
!106 = !DILocalVariable(name: "i", scope: !107, file: !1, line: 75, type: !42)
!107 = distinct !DILexicalBlock(scope: !95, file: !1, line: 74, column: 13)
!108 = !DILocation(line: 75, column: 24, scope: !107)
!109 = !DILocation(line: 76, column: 24, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !1, line: 76, column: 17)
!111 = !DILocation(line: 76, column: 22, scope: !110)
!112 = !DILocation(line: 76, column: 29, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !1, line: 76, column: 17)
!114 = !DILocation(line: 76, column: 31, scope: !113)
!115 = !DILocation(line: 76, column: 17, scope: !110)
!116 = !DILocation(line: 78, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !1, line: 77, column: 17)
!118 = !DILocation(line: 78, column: 32, scope: !117)
!119 = !DILocation(line: 78, column: 35, scope: !117)
!120 = !DILocation(line: 79, column: 17, scope: !117)
!121 = !DILocation(line: 76, column: 39, scope: !113)
!122 = !DILocation(line: 76, column: 17, scope: !113)
!123 = distinct !{!123, !115, !124, !62}
!124 = !DILocation(line: 79, column: 17, scope: !110)
!125 = !DILocation(line: 81, column: 20, scope: !95)
!126 = !DILocation(line: 81, column: 18, scope: !95)
!127 = !DILocation(line: 83, column: 21, scope: !90)
!128 = !DILocation(line: 83, column: 10, scope: !90)
!129 = !DILocation(line: 83, column: 19, scope: !90)
!130 = !DILocalVariable(name: "data", scope: !131, file: !1, line: 86, type: !3)
!131 = distinct !DILexicalBlock(scope: !81, file: !1, line: 85, column: 5)
!132 = !DILocation(line: 86, column: 19, scope: !131)
!133 = !DILocation(line: 86, column: 27, scope: !131)
!134 = !DILocation(line: 86, column: 26, scope: !131)
!135 = !DILocation(line: 87, column: 27, scope: !131)
!136 = !DILocation(line: 87, column: 9, scope: !131)
!137 = !DILocation(line: 89, column: 14, scope: !131)
!138 = !DILocation(line: 89, column: 9, scope: !131)
!139 = !DILocation(line: 91, column: 1, scope: !81)
