; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_static_32.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_static_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_long_static_32_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_static_32_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %data1 = alloca i64*, align 8
  %i = alloca i64, align 8
  %data2 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !26, metadata !DIExpression()), !dbg !28
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !29, metadata !DIExpression()), !dbg !30
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !30
  store i64* null, i64** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !32, metadata !DIExpression()), !dbg !34
  %0 = load i64**, i64*** %dataPtr1, align 8, !dbg !35
  %1 = load i64*, i64** %0, align 8, !dbg !36
  store i64* %1, i64** %data1, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %2, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_long_static_32_bad.dataBuffer, i64 0, i64 %3, !dbg !53
  store i64 5, i64* %arrayidx, align 8, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %4, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_long_static_32_bad.dataBuffer, i64 0, i64 0), i64** %data1, align 8, !dbg !61
  %5 = load i64*, i64** %data1, align 8, !dbg !62
  %6 = load i64**, i64*** %dataPtr1, align 8, !dbg !63
  store i64* %5, i64** %6, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !65, metadata !DIExpression()), !dbg !67
  %7 = load i64**, i64*** %dataPtr2, align 8, !dbg !68
  %8 = load i64*, i64** %7, align 8, !dbg !69
  store i64* %8, i64** %data2, align 8, !dbg !67
  %9 = load i64*, i64** %data2, align 8, !dbg !70
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !70
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !70
  call void @printLongLine(i64 noundef %10), !dbg !71
  %11 = load i64*, i64** %data2, align 8, !dbg !72
  %12 = bitcast i64* %11 to i8*, !dbg !72
  call void @free(i8* noundef %12) #5, !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_static_32_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i64*, align 8
  %dataPtr1 = alloca i64**, align 8
  %dataPtr2 = alloca i64**, align 8
  %data1 = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %data3 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i64*** %dataPtr1, metadata !81, metadata !DIExpression()), !dbg !82
  store i64** %data, i64*** %dataPtr1, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i64*** %dataPtr2, metadata !83, metadata !DIExpression()), !dbg !84
  store i64** %data, i64*** %dataPtr2, align 8, !dbg !84
  store i64* null, i64** %data, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !86, metadata !DIExpression()), !dbg !88
  %0 = load i64**, i64*** %dataPtr1, align 8, !dbg !89
  %1 = load i64*, i64** %0, align 8, !dbg !90
  store i64* %1, i64** %data1, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !93
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !94
  %2 = bitcast i8* %call to i64*, !dbg !95
  store i64* %2, i64** %dataBuffer, align 8, !dbg !93
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !96
  %cmp = icmp eq i64* %3, null, !dbg !98
  br i1 %cmp, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @exit(i32 noundef 1) #6, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !103, metadata !DIExpression()), !dbg !105
  store i64 0, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !109
  %cmp2 = icmp ult i64 %4, 100, !dbg !111
  br i1 %cmp2, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %5 = load i64*, i64** %dataBuffer, align 8, !dbg !113
  %6 = load i64, i64* %i, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !113
  store i64 5, i64* %arrayidx, align 8, !dbg !116
  br label %for.inc, !dbg !117

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !118
  %inc = add i64 %7, 1, !dbg !118
  store i64 %inc, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !119, !llvm.loop !120

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %dataBuffer, align 8, !dbg !122
  store i64* %8, i64** %data1, align 8, !dbg !123
  %9 = load i64*, i64** %data1, align 8, !dbg !124
  %10 = load i64**, i64*** %dataPtr1, align 8, !dbg !125
  store i64* %9, i64** %10, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i64** %data3, metadata !127, metadata !DIExpression()), !dbg !129
  %11 = load i64**, i64*** %dataPtr2, align 8, !dbg !130
  %12 = load i64*, i64** %11, align 8, !dbg !131
  store i64* %12, i64** %data3, align 8, !dbg !129
  %13 = load i64*, i64** %data3, align 8, !dbg !132
  %arrayidx4 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !132
  %14 = load i64, i64* %arrayidx4, align 8, !dbg !132
  call void @printLongLine(i64 noundef %14), !dbg !133
  %15 = load i64*, i64** %data3, align 8, !dbg !134
  %16 = bitcast i64* %15 to i8*, !dbg !134
  call void @free(i8* noundef %16) #5, !dbg !135
  ret void, !dbg !136
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
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 33, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_32_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_static_32.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "9dc2a414e2442b993af40fe69399fc7b")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0}
!12 = !{}
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 6400, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 100)
!16 = !{i32 7, !"Dwarf Version", i32 5}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"PIE Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 25, type: !8)
!25 = !DILocation(line: 25, column: 12, scope: !2)
!26 = !DILocalVariable(name: "dataPtr1", scope: !2, file: !3, line: 26, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!28 = !DILocation(line: 26, column: 13, scope: !2)
!29 = !DILocalVariable(name: "dataPtr2", scope: !2, file: !3, line: 27, type: !27)
!30 = !DILocation(line: 27, column: 13, scope: !2)
!31 = !DILocation(line: 28, column: 10, scope: !2)
!32 = !DILocalVariable(name: "data", scope: !33, file: !3, line: 30, type: !8)
!33 = distinct !DILexicalBlock(scope: !2, file: !3, line: 29, column: 5)
!34 = !DILocation(line: 30, column: 16, scope: !33)
!35 = !DILocation(line: 30, column: 24, scope: !33)
!36 = !DILocation(line: 30, column: 23, scope: !33)
!37 = !DILocalVariable(name: "i", scope: !38, file: !3, line: 35, type: !40)
!38 = distinct !DILexicalBlock(scope: !39, file: !3, line: 34, column: 13)
!39 = distinct !DILexicalBlock(scope: !33, file: !3, line: 31, column: 9)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 35, column: 24, scope: !38)
!44 = !DILocation(line: 36, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !38, file: !3, line: 36, column: 17)
!46 = !DILocation(line: 36, column: 22, scope: !45)
!47 = !DILocation(line: 36, column: 29, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !3, line: 36, column: 17)
!49 = !DILocation(line: 36, column: 31, scope: !48)
!50 = !DILocation(line: 36, column: 17, scope: !45)
!51 = !DILocation(line: 38, column: 32, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !3, line: 37, column: 17)
!53 = !DILocation(line: 38, column: 21, scope: !52)
!54 = !DILocation(line: 38, column: 35, scope: !52)
!55 = !DILocation(line: 39, column: 17, scope: !52)
!56 = !DILocation(line: 36, column: 39, scope: !48)
!57 = !DILocation(line: 36, column: 17, scope: !48)
!58 = distinct !{!58, !50, !59, !60}
!59 = !DILocation(line: 39, column: 17, scope: !45)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 41, column: 18, scope: !39)
!62 = !DILocation(line: 43, column: 21, scope: !33)
!63 = !DILocation(line: 43, column: 10, scope: !33)
!64 = !DILocation(line: 43, column: 19, scope: !33)
!65 = !DILocalVariable(name: "data", scope: !66, file: !3, line: 46, type: !8)
!66 = distinct !DILexicalBlock(scope: !2, file: !3, line: 45, column: 5)
!67 = !DILocation(line: 46, column: 16, scope: !66)
!68 = !DILocation(line: 46, column: 24, scope: !66)
!69 = !DILocation(line: 46, column: 23, scope: !66)
!70 = !DILocation(line: 47, column: 23, scope: !66)
!71 = !DILocation(line: 47, column: 9, scope: !66)
!72 = !DILocation(line: 49, column: 14, scope: !66)
!73 = !DILocation(line: 49, column: 9, scope: !66)
!74 = !DILocation(line: 51, column: 1, scope: !2)
!75 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_32_good", scope: !3, file: !3, line: 93, type: !4, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!76 = !DILocation(line: 95, column: 5, scope: !75)
!77 = !DILocation(line: 96, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 58, type: !4, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!79 = !DILocalVariable(name: "data", scope: !78, file: !3, line: 60, type: !8)
!80 = !DILocation(line: 60, column: 12, scope: !78)
!81 = !DILocalVariable(name: "dataPtr1", scope: !78, file: !3, line: 61, type: !27)
!82 = !DILocation(line: 61, column: 13, scope: !78)
!83 = !DILocalVariable(name: "dataPtr2", scope: !78, file: !3, line: 62, type: !27)
!84 = !DILocation(line: 62, column: 13, scope: !78)
!85 = !DILocation(line: 63, column: 10, scope: !78)
!86 = !DILocalVariable(name: "data", scope: !87, file: !3, line: 65, type: !8)
!87 = distinct !DILexicalBlock(scope: !78, file: !3, line: 64, column: 5)
!88 = !DILocation(line: 65, column: 16, scope: !87)
!89 = !DILocation(line: 65, column: 24, scope: !87)
!90 = !DILocation(line: 65, column: 23, scope: !87)
!91 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !3, line: 68, type: !8)
!92 = distinct !DILexicalBlock(scope: !87, file: !3, line: 66, column: 9)
!93 = !DILocation(line: 68, column: 20, scope: !92)
!94 = !DILocation(line: 68, column: 41, scope: !92)
!95 = !DILocation(line: 68, column: 33, scope: !92)
!96 = !DILocation(line: 69, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !3, line: 69, column: 17)
!98 = !DILocation(line: 69, column: 28, scope: !97)
!99 = !DILocation(line: 69, column: 17, scope: !92)
!100 = !DILocation(line: 71, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !3, line: 70, column: 13)
!102 = !DILocation(line: 72, column: 17, scope: !101)
!103 = !DILocalVariable(name: "i", scope: !104, file: !3, line: 75, type: !40)
!104 = distinct !DILexicalBlock(scope: !92, file: !3, line: 74, column: 13)
!105 = !DILocation(line: 75, column: 24, scope: !104)
!106 = !DILocation(line: 76, column: 24, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !3, line: 76, column: 17)
!108 = !DILocation(line: 76, column: 22, scope: !107)
!109 = !DILocation(line: 76, column: 29, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !3, line: 76, column: 17)
!111 = !DILocation(line: 76, column: 31, scope: !110)
!112 = !DILocation(line: 76, column: 17, scope: !107)
!113 = !DILocation(line: 78, column: 21, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !3, line: 77, column: 17)
!115 = !DILocation(line: 78, column: 32, scope: !114)
!116 = !DILocation(line: 78, column: 35, scope: !114)
!117 = !DILocation(line: 79, column: 17, scope: !114)
!118 = !DILocation(line: 76, column: 39, scope: !110)
!119 = !DILocation(line: 76, column: 17, scope: !110)
!120 = distinct !{!120, !112, !121, !60}
!121 = !DILocation(line: 79, column: 17, scope: !107)
!122 = !DILocation(line: 81, column: 20, scope: !92)
!123 = !DILocation(line: 81, column: 18, scope: !92)
!124 = !DILocation(line: 83, column: 21, scope: !87)
!125 = !DILocation(line: 83, column: 10, scope: !87)
!126 = !DILocation(line: 83, column: 19, scope: !87)
!127 = !DILocalVariable(name: "data", scope: !128, file: !3, line: 86, type: !8)
!128 = distinct !DILexicalBlock(scope: !78, file: !3, line: 85, column: 5)
!129 = !DILocation(line: 86, column: 16, scope: !128)
!130 = !DILocation(line: 86, column: 24, scope: !128)
!131 = !DILocation(line: 86, column: 23, scope: !128)
!132 = !DILocation(line: 87, column: 23, scope: !128)
!133 = !DILocation(line: 87, column: 9, scope: !128)
!134 = !DILocation(line: 89, column: 14, scope: !128)
!135 = !DILocation(line: 89, column: 9, scope: !128)
!136 = !DILocation(line: 91, column: 1, scope: !78)
