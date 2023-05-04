; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_02.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_02_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_02_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i64* null, i64** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !43
  %cmp = icmp ult i64 %0, 100, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_02_bad.dataBuffer, i64 0, i64 %1, !dbg !49
  store i64 5, i64* %arrayidx, align 8, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %2, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_02_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !57
  %3 = load i64*, i64** %data, align 8, !dbg !58
  %arrayidx1 = getelementptr inbounds i64, i64* %3, i64 0, !dbg !58
  %4 = load i64, i64* %arrayidx1, align 8, !dbg !58
  call void @printLongLongLine(i64 noundef %4), !dbg !59
  %5 = load i64*, i64** %data, align 8, !dbg !60
  %6 = bitcast i64* %5 to i8*, !dbg !60
  call void @free(i8* noundef %6) #5, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_02_good() #0 !dbg !63 {
entry:
  call void @goodG2B1(), !dbg !64
  call void @goodG2B2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !67 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i64* null, i64** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !75
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !76
  %0 = bitcast i8* %call to i64*, !dbg !77
  store i64* %0, i64** %dataBuffer, align 8, !dbg !75
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !78
  %cmp = icmp eq i64* %1, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @exit(i32 noundef 1) #6, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !85, metadata !DIExpression()), !dbg !87
  store i64 0, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !91
  %cmp1 = icmp ult i64 %2, 100, !dbg !93
  br i1 %cmp1, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !95
  %4 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !95
  store i64 5, i64* %arrayidx, align 8, !dbg !98
  br label %for.inc, !dbg !99

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !100
  %inc = add i64 %5, 1, !dbg !100
  store i64 %inc, i64* %i, align 8, !dbg !100
  br label %for.cond, !dbg !101, !llvm.loop !102

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !104
  store i64* %6, i64** %data, align 8, !dbg !105
  %7 = load i64*, i64** %data, align 8, !dbg !106
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !106
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !106
  call void @printLongLongLine(i64 noundef %8), !dbg !107
  %9 = load i64*, i64** %data, align 8, !dbg !108
  %10 = bitcast i64* %9 to i8*, !dbg !108
  call void @free(i8* noundef %10) #5, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !112, metadata !DIExpression()), !dbg !113
  store i64* null, i64** %data, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !115, metadata !DIExpression()), !dbg !119
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !120
  %0 = bitcast i8* %call to i64*, !dbg !121
  store i64* %0, i64** %dataBuffer, align 8, !dbg !119
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !122
  %cmp = icmp eq i64* %1, null, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !126
  call void @exit(i32 noundef 1) #6, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !135
  %cmp1 = icmp ult i64 %2, 100, !dbg !137
  br i1 %cmp1, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !139
  %4 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !139
  store i64 5, i64* %arrayidx, align 8, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %5, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !148
  store i64* %6, i64** %data, align 8, !dbg !149
  %7 = load i64*, i64** %data, align 8, !dbg !150
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !150
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !150
  call void @printLongLongLine(i64 noundef %8), !dbg !151
  %9 = load i64*, i64** %data, align 8, !dbg !152
  %10 = bitcast i64* %9 to i8*, !dbg !152
  call void @free(i8* noundef %10) #5, !dbg !153
  ret void, !dbg !154
}

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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 31, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_02_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_02.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "367c4858b96363ff78bfb17324d44ad1")
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
!31 = !DILocalVariable(name: "i", scope: !32, file: !3, line: 33, type: !36)
!32 = distinct !DILexicalBlock(scope: !33, file: !3, line: 32, column: 13)
!33 = distinct !DILexicalBlock(scope: !34, file: !3, line: 29, column: 9)
!34 = distinct !DILexicalBlock(scope: !35, file: !3, line: 28, column: 5)
!35 = distinct !DILexicalBlock(scope: !2, file: !3, line: 27, column: 8)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!38 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 33, column: 24, scope: !32)
!40 = !DILocation(line: 34, column: 24, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !3, line: 34, column: 17)
!42 = !DILocation(line: 34, column: 22, scope: !41)
!43 = !DILocation(line: 34, column: 29, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !3, line: 34, column: 17)
!45 = !DILocation(line: 34, column: 31, scope: !44)
!46 = !DILocation(line: 34, column: 17, scope: !41)
!47 = !DILocation(line: 36, column: 32, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !3, line: 35, column: 17)
!49 = !DILocation(line: 36, column: 21, scope: !48)
!50 = !DILocation(line: 36, column: 35, scope: !48)
!51 = !DILocation(line: 37, column: 17, scope: !48)
!52 = !DILocation(line: 34, column: 39, scope: !44)
!53 = !DILocation(line: 34, column: 17, scope: !44)
!54 = distinct !{!54, !46, !55, !56}
!55 = !DILocation(line: 37, column: 17, scope: !41)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 39, column: 18, scope: !33)
!58 = !DILocation(line: 42, column: 23, scope: !2)
!59 = !DILocation(line: 42, column: 5, scope: !2)
!60 = !DILocation(line: 44, column: 10, scope: !2)
!61 = !DILocation(line: 44, column: 5, scope: !2)
!62 = !DILocation(line: 45, column: 1, scope: !2)
!63 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_02_good", scope: !3, file: !3, line: 116, type: !4, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!64 = !DILocation(line: 118, column: 5, scope: !63)
!65 = !DILocation(line: 119, column: 5, scope: !63)
!66 = !DILocation(line: 120, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 52, type: !4, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!68 = !DILocalVariable(name: "data", scope: !67, file: !3, line: 54, type: !8)
!69 = !DILocation(line: 54, column: 15, scope: !67)
!70 = !DILocation(line: 55, column: 10, scope: !67)
!71 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !3, line: 65, type: !8)
!72 = distinct !DILexicalBlock(scope: !73, file: !3, line: 63, column: 9)
!73 = distinct !DILexicalBlock(scope: !74, file: !3, line: 62, column: 5)
!74 = distinct !DILexicalBlock(scope: !67, file: !3, line: 56, column: 8)
!75 = !DILocation(line: 65, column: 23, scope: !72)
!76 = !DILocation(line: 65, column: 47, scope: !72)
!77 = !DILocation(line: 65, column: 36, scope: !72)
!78 = !DILocation(line: 66, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !72, file: !3, line: 66, column: 17)
!80 = !DILocation(line: 66, column: 28, scope: !79)
!81 = !DILocation(line: 66, column: 17, scope: !72)
!82 = !DILocation(line: 68, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !3, line: 67, column: 13)
!84 = !DILocation(line: 69, column: 17, scope: !83)
!85 = !DILocalVariable(name: "i", scope: !86, file: !3, line: 72, type: !36)
!86 = distinct !DILexicalBlock(scope: !72, file: !3, line: 71, column: 13)
!87 = !DILocation(line: 72, column: 24, scope: !86)
!88 = !DILocation(line: 73, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !3, line: 73, column: 17)
!90 = !DILocation(line: 73, column: 22, scope: !89)
!91 = !DILocation(line: 73, column: 29, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !3, line: 73, column: 17)
!93 = !DILocation(line: 73, column: 31, scope: !92)
!94 = !DILocation(line: 73, column: 17, scope: !89)
!95 = !DILocation(line: 75, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !3, line: 74, column: 17)
!97 = !DILocation(line: 75, column: 32, scope: !96)
!98 = !DILocation(line: 75, column: 35, scope: !96)
!99 = !DILocation(line: 76, column: 17, scope: !96)
!100 = !DILocation(line: 73, column: 39, scope: !92)
!101 = !DILocation(line: 73, column: 17, scope: !92)
!102 = distinct !{!102, !94, !103, !56}
!103 = !DILocation(line: 76, column: 17, scope: !89)
!104 = !DILocation(line: 78, column: 20, scope: !72)
!105 = !DILocation(line: 78, column: 18, scope: !72)
!106 = !DILocation(line: 81, column: 23, scope: !67)
!107 = !DILocation(line: 81, column: 5, scope: !67)
!108 = !DILocation(line: 83, column: 10, scope: !67)
!109 = !DILocation(line: 83, column: 5, scope: !67)
!110 = !DILocation(line: 84, column: 1, scope: !67)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 87, type: !4, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!112 = !DILocalVariable(name: "data", scope: !111, file: !3, line: 89, type: !8)
!113 = !DILocation(line: 89, column: 15, scope: !111)
!114 = !DILocation(line: 90, column: 10, scope: !111)
!115 = !DILocalVariable(name: "dataBuffer", scope: !116, file: !3, line: 95, type: !8)
!116 = distinct !DILexicalBlock(scope: !117, file: !3, line: 93, column: 9)
!117 = distinct !DILexicalBlock(scope: !118, file: !3, line: 92, column: 5)
!118 = distinct !DILexicalBlock(scope: !111, file: !3, line: 91, column: 8)
!119 = !DILocation(line: 95, column: 23, scope: !116)
!120 = !DILocation(line: 95, column: 47, scope: !116)
!121 = !DILocation(line: 95, column: 36, scope: !116)
!122 = !DILocation(line: 96, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !116, file: !3, line: 96, column: 17)
!124 = !DILocation(line: 96, column: 28, scope: !123)
!125 = !DILocation(line: 96, column: 17, scope: !116)
!126 = !DILocation(line: 98, column: 17, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !3, line: 97, column: 13)
!128 = !DILocation(line: 99, column: 17, scope: !127)
!129 = !DILocalVariable(name: "i", scope: !130, file: !3, line: 102, type: !36)
!130 = distinct !DILexicalBlock(scope: !116, file: !3, line: 101, column: 13)
!131 = !DILocation(line: 102, column: 24, scope: !130)
!132 = !DILocation(line: 103, column: 24, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !3, line: 103, column: 17)
!134 = !DILocation(line: 103, column: 22, scope: !133)
!135 = !DILocation(line: 103, column: 29, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !3, line: 103, column: 17)
!137 = !DILocation(line: 103, column: 31, scope: !136)
!138 = !DILocation(line: 103, column: 17, scope: !133)
!139 = !DILocation(line: 105, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !3, line: 104, column: 17)
!141 = !DILocation(line: 105, column: 32, scope: !140)
!142 = !DILocation(line: 105, column: 35, scope: !140)
!143 = !DILocation(line: 106, column: 17, scope: !140)
!144 = !DILocation(line: 103, column: 39, scope: !136)
!145 = !DILocation(line: 103, column: 17, scope: !136)
!146 = distinct !{!146, !138, !147, !56}
!147 = !DILocation(line: 106, column: 17, scope: !133)
!148 = !DILocation(line: 108, column: 20, scope: !116)
!149 = !DILocation(line: 108, column: 18, scope: !116)
!150 = !DILocation(line: 111, column: 23, scope: !111)
!151 = !DILocation(line: 111, column: 5, scope: !111)
!152 = !DILocation(line: 113, column: 10, scope: !111)
!153 = !DILocation(line: 113, column: 5, scope: !111)
!154 = !DILocation(line: 114, column: 1, scope: !111)
