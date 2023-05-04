; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_32.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_32_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_32_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %data1 = alloca i64*, align 8
  %i = alloca i64, align 8
  %data2 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !30, metadata !DIExpression()), !dbg !32
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !33, metadata !DIExpression()), !dbg !34
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !34
  store i64* null, i64** %data, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !36, metadata !DIExpression()), !dbg !38
  %0 = load i64**, i64*** %dataPtr1, align 8, !dbg !39
  %1 = load i64*, i64** %0, align 8, !dbg !40
  store i64* %1, i64** %data1, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %2, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_32_bad.dataBuffer, i64 0, i64 %3, !dbg !57
  store i64 5, i64* %arrayidx, align 8, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %4, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_32_bad.dataBuffer, i64 0, i64 0), i64** %data1, align 8, !dbg !65
  %5 = load i64*, i64** %data1, align 8, !dbg !66
  %6 = load i64**, i64*** %dataPtr1, align 8, !dbg !67
  store i64* %5, i64** %6, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !69, metadata !DIExpression()), !dbg !71
  %7 = load i64**, i64*** %dataPtr2, align 8, !dbg !72
  %8 = load i64*, i64** %7, align 8, !dbg !73
  store i64* %8, i64** %data2, align 8, !dbg !71
  %9 = load i64*, i64** %data2, align 8, !dbg !74
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !74
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !74
  call void @printLongLongLine(i64 noundef %10), !dbg !75
  %11 = load i64*, i64** %data2, align 8, !dbg !76
  %12 = bitcast i64* %11 to i8*, !dbg !76
  call void @free(i8* noundef %12) #5, !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_32_good() #0 !dbg !79 {
entry:
  call void @goodG2B(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %data1 = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %data3 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !85, metadata !DIExpression()), !dbg !86
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !87, metadata !DIExpression()), !dbg !88
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !88
  store i64* null, i64** %data, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !90, metadata !DIExpression()), !dbg !92
  %0 = load i64**, i64*** %dataPtr1, align 8, !dbg !93
  %1 = load i64*, i64** %0, align 8, !dbg !94
  store i64* %1, i64** %data1, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !97
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !98
  %2 = bitcast i8* %call to i64*, !dbg !99
  store i64* %2, i64** %dataBuffer, align 8, !dbg !97
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !100
  %cmp = icmp eq i64* %3, null, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @exit(i32 noundef 1) #6, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !109
  store i64 0, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !112

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !113
  %cmp2 = icmp ult i64 %4, 100, !dbg !115
  br i1 %cmp2, label %for.body, label %for.end, !dbg !116

for.body:                                         ; preds = %for.cond
  %5 = load i64*, i64** %dataBuffer, align 8, !dbg !117
  %6 = load i64, i64* %i, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !117
  store i64 5, i64* %arrayidx, align 8, !dbg !120
  br label %for.inc, !dbg !121

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !122
  %inc = add i64 %7, 1, !dbg !122
  store i64 %inc, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !123, !llvm.loop !124

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %dataBuffer, align 8, !dbg !126
  store i64* %8, i64** %data1, align 8, !dbg !127
  %9 = load i64*, i64** %data1, align 8, !dbg !128
  %10 = load i64**, i64*** %dataPtr1, align 8, !dbg !129
  store i64* %9, i64** %10, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i64** %data3, metadata !131, metadata !DIExpression()), !dbg !133
  %11 = load i64**, i64*** %dataPtr2, align 8, !dbg !134
  %12 = load i64*, i64** %11, align 8, !dbg !135
  store i64* %12, i64** %data3, align 8, !dbg !133
  %13 = load i64*, i64** %data3, align 8, !dbg !136
  %arrayidx4 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !136
  %14 = load i64, i64* %arrayidx4, align 8, !dbg !136
  call void @printLongLongLine(i64 noundef %14), !dbg !137
  %15 = load i64*, i64** %data3, align 8, !dbg !138
  %16 = bitcast i64* %15 to i8*, !dbg !138
  call void @free(i8* noundef %16) #5, !dbg !139
  ret void, !dbg !140
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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 33, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_32_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_32.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "40225a699fe791a1fea200d6a500d222")
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
!30 = !DILocalVariable(name: "dataPtr1", scope: !2, file: !3, line: 26, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!32 = !DILocation(line: 26, column: 16, scope: !2)
!33 = !DILocalVariable(name: "dataPtr2", scope: !2, file: !3, line: 27, type: !31)
!34 = !DILocation(line: 27, column: 16, scope: !2)
!35 = !DILocation(line: 28, column: 10, scope: !2)
!36 = !DILocalVariable(name: "data", scope: !37, file: !3, line: 30, type: !8)
!37 = distinct !DILexicalBlock(scope: !2, file: !3, line: 29, column: 5)
!38 = !DILocation(line: 30, column: 19, scope: !37)
!39 = !DILocation(line: 30, column: 27, scope: !37)
!40 = !DILocation(line: 30, column: 26, scope: !37)
!41 = !DILocalVariable(name: "i", scope: !42, file: !3, line: 35, type: !44)
!42 = distinct !DILexicalBlock(scope: !43, file: !3, line: 34, column: 13)
!43 = distinct !DILexicalBlock(scope: !37, file: !3, line: 31, column: 9)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 35, column: 24, scope: !42)
!48 = !DILocation(line: 36, column: 24, scope: !49)
!49 = distinct !DILexicalBlock(scope: !42, file: !3, line: 36, column: 17)
!50 = !DILocation(line: 36, column: 22, scope: !49)
!51 = !DILocation(line: 36, column: 29, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !3, line: 36, column: 17)
!53 = !DILocation(line: 36, column: 31, scope: !52)
!54 = !DILocation(line: 36, column: 17, scope: !49)
!55 = !DILocation(line: 38, column: 32, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !3, line: 37, column: 17)
!57 = !DILocation(line: 38, column: 21, scope: !56)
!58 = !DILocation(line: 38, column: 35, scope: !56)
!59 = !DILocation(line: 39, column: 17, scope: !56)
!60 = !DILocation(line: 36, column: 39, scope: !52)
!61 = !DILocation(line: 36, column: 17, scope: !52)
!62 = distinct !{!62, !54, !63, !64}
!63 = !DILocation(line: 39, column: 17, scope: !49)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 41, column: 18, scope: !43)
!66 = !DILocation(line: 43, column: 21, scope: !37)
!67 = !DILocation(line: 43, column: 10, scope: !37)
!68 = !DILocation(line: 43, column: 19, scope: !37)
!69 = !DILocalVariable(name: "data", scope: !70, file: !3, line: 46, type: !8)
!70 = distinct !DILexicalBlock(scope: !2, file: !3, line: 45, column: 5)
!71 = !DILocation(line: 46, column: 19, scope: !70)
!72 = !DILocation(line: 46, column: 27, scope: !70)
!73 = !DILocation(line: 46, column: 26, scope: !70)
!74 = !DILocation(line: 47, column: 27, scope: !70)
!75 = !DILocation(line: 47, column: 9, scope: !70)
!76 = !DILocation(line: 49, column: 14, scope: !70)
!77 = !DILocation(line: 49, column: 9, scope: !70)
!78 = !DILocation(line: 51, column: 1, scope: !2)
!79 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_32_good", scope: !3, file: !3, line: 93, type: !4, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!80 = !DILocation(line: 95, column: 5, scope: !79)
!81 = !DILocation(line: 96, column: 1, scope: !79)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 58, type: !4, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!83 = !DILocalVariable(name: "data", scope: !82, file: !3, line: 60, type: !8)
!84 = !DILocation(line: 60, column: 15, scope: !82)
!85 = !DILocalVariable(name: "dataPtr1", scope: !82, file: !3, line: 61, type: !31)
!86 = !DILocation(line: 61, column: 16, scope: !82)
!87 = !DILocalVariable(name: "dataPtr2", scope: !82, file: !3, line: 62, type: !31)
!88 = !DILocation(line: 62, column: 16, scope: !82)
!89 = !DILocation(line: 63, column: 10, scope: !82)
!90 = !DILocalVariable(name: "data", scope: !91, file: !3, line: 65, type: !8)
!91 = distinct !DILexicalBlock(scope: !82, file: !3, line: 64, column: 5)
!92 = !DILocation(line: 65, column: 19, scope: !91)
!93 = !DILocation(line: 65, column: 27, scope: !91)
!94 = !DILocation(line: 65, column: 26, scope: !91)
!95 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !3, line: 68, type: !8)
!96 = distinct !DILexicalBlock(scope: !91, file: !3, line: 66, column: 9)
!97 = !DILocation(line: 68, column: 23, scope: !96)
!98 = !DILocation(line: 68, column: 47, scope: !96)
!99 = !DILocation(line: 68, column: 36, scope: !96)
!100 = !DILocation(line: 69, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !3, line: 69, column: 17)
!102 = !DILocation(line: 69, column: 28, scope: !101)
!103 = !DILocation(line: 69, column: 17, scope: !96)
!104 = !DILocation(line: 71, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !3, line: 70, column: 13)
!106 = !DILocation(line: 72, column: 17, scope: !105)
!107 = !DILocalVariable(name: "i", scope: !108, file: !3, line: 75, type: !44)
!108 = distinct !DILexicalBlock(scope: !96, file: !3, line: 74, column: 13)
!109 = !DILocation(line: 75, column: 24, scope: !108)
!110 = !DILocation(line: 76, column: 24, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !3, line: 76, column: 17)
!112 = !DILocation(line: 76, column: 22, scope: !111)
!113 = !DILocation(line: 76, column: 29, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !3, line: 76, column: 17)
!115 = !DILocation(line: 76, column: 31, scope: !114)
!116 = !DILocation(line: 76, column: 17, scope: !111)
!117 = !DILocation(line: 78, column: 21, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !3, line: 77, column: 17)
!119 = !DILocation(line: 78, column: 32, scope: !118)
!120 = !DILocation(line: 78, column: 35, scope: !118)
!121 = !DILocation(line: 79, column: 17, scope: !118)
!122 = !DILocation(line: 76, column: 39, scope: !114)
!123 = !DILocation(line: 76, column: 17, scope: !114)
!124 = distinct !{!124, !116, !125, !64}
!125 = !DILocation(line: 79, column: 17, scope: !111)
!126 = !DILocation(line: 81, column: 20, scope: !96)
!127 = !DILocation(line: 81, column: 18, scope: !96)
!128 = !DILocation(line: 83, column: 21, scope: !91)
!129 = !DILocation(line: 83, column: 10, scope: !91)
!130 = !DILocation(line: 83, column: 19, scope: !91)
!131 = !DILocalVariable(name: "data", scope: !132, file: !3, line: 86, type: !8)
!132 = distinct !DILexicalBlock(scope: !82, file: !3, line: 85, column: 5)
!133 = !DILocation(line: 86, column: 19, scope: !132)
!134 = !DILocation(line: 86, column: 27, scope: !132)
!135 = !DILocation(line: 86, column: 26, scope: !132)
!136 = !DILocation(line: 87, column: 27, scope: !132)
!137 = !DILocation(line: 87, column: 9, scope: !132)
!138 = !DILocation(line: 89, column: 14, scope: !132)
!139 = !DILocation(line: 89, column: 9, scope: !132)
!140 = !DILocation(line: 91, column: 1, scope: !82)
