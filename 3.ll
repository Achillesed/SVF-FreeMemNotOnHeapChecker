; ModuleID = '3.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int_static_68_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1
@CWE590_Free_Memory_Not_on_Heap__free_int_static_68_badData = dso_local global i32* null, align 8, !dbg !12
@CWE590_Free_Memory_Not_on_Heap__free_int_static_68_goodG2BData = dso_local global i32* null, align 8, !dbg !14

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_68_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !30, metadata !DIExpression()), !dbg !31
  store i32* null, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !43
  %cmp = icmp ult i64 %0, 100, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_68_bad.dataBuffer, i64 0, i64 %1, !dbg !49
  store i32 5, i32* %arrayidx, align 4, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %2, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_68_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !57
  %3 = load i32*, i32** %data, align 8, !dbg !58
  store i32* %3, i32** @CWE590_Free_Memory_Not_on_Heap__free_int_static_68_badData, align 8, !dbg !59
  call void (...) bitcast (void ()* @CWE590_Free_Memory_Not_on_Heap__free_int_static_68b_badSink to void (...)*)(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_68_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  store i32* null, i32** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !69, metadata !DIExpression()), !dbg !71
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !72
  %0 = bitcast i8* %call to i32*, !dbg !73
  store i32* %0, i32** %dataBuffer, align 8, !dbg !71
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  %cmp = icmp eq i32* %1, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @exit(i32 noundef 1) #6, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !81, metadata !DIExpression()), !dbg !83
  store i64 0, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !87
  %cmp1 = icmp ult i64 %2, 100, !dbg !89
  br i1 %cmp1, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !91
  %4 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !91
  store i32 5, i32* %arrayidx, align 4, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %5, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  store i32* %6, i32** %data, align 8, !dbg !101
  %7 = load i32*, i32** %data, align 8, !dbg !102
  store i32* %7, i32** @CWE590_Free_Memory_Not_on_Heap__free_int_static_68_goodG2BData, align 8, !dbg !103
  call void (...) bitcast (void ()* @CWE590_Free_Memory_Not_on_Heap__free_int_static_68b_goodG2BSink to void (...)*)(), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_68b_badSink() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = load i32*, i32** @CWE590_Free_Memory_Not_on_Heap__free_int_static_68_badData, align 8, !dbg !109
  store i32* %0, i32** %data, align 8, !dbg !108
  %1 = load i32*, i32** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !110
  %2 = load i32, i32* %arrayidx, align 4, !dbg !110
  call void @printIntLine(i32 noundef %2), !dbg !111
  %3 = load i32*, i32** %data, align 8, !dbg !112
  %4 = bitcast i32* %3 to i8*, !dbg !112
  call void @free(i8* noundef %4) #5, !dbg !113
  ret void, !dbg !114
}

declare void @printIntLine(i32 noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_68b_goodG2BSink() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = load i32*, i32** @CWE590_Free_Memory_Not_on_Heap__free_int_static_68_goodG2BData, align 8, !dbg !118
  store i32* %0, i32** %data, align 8, !dbg !117
  %1 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !119
  %2 = load i32, i32* %arrayidx, align 4, !dbg !119
  call void @printIntLine(i32 noundef %2), !dbg !120
  %3 = load i32*, i32** %data, align 8, !dbg !121
  %4 = bitcast i32* %3 to i8*, !dbg !121
  call void @free(i8* noundef %4) #5, !dbg !122
  ret void, !dbg !123
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6, !20}
!llvm.ident = !{!22, !22}
!llvm.module.flags = !{!23, !24, !25, !26, !27, !28, !29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 35, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_68_bad", scope: !3, file: !3, line: 29, type: !4, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_static_68a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "b93c8cbc15c379398d4a4183897b0ac1")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0, !12, !14}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_68_badData", scope: !6, file: !3, line: 21, type: !8, isLocal: false, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_68_goodG2BData", scope: !6, file: !3, line: 22, type: !8, isLocal: false, isDefinition: true)
!16 = !{}
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 100)
!20 = distinct !DICompileUnit(language: DW_LANG_C99, file: !21, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!21 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_static_68b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "08884135f0d2fc83cb160db24801294c")
!22 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!23 = !{i32 7, !"Dwarf Version", i32 5}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{i32 1, !"wchar_size", i32 4}
!26 = !{i32 7, !"PIC Level", i32 2}
!27 = !{i32 7, !"PIE Level", i32 2}
!28 = !{i32 7, !"uwtable", i32 1}
!29 = !{i32 7, !"frame-pointer", i32 2}
!30 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 31, type: !8)
!31 = !DILocation(line: 31, column: 11, scope: !2)
!32 = !DILocation(line: 32, column: 10, scope: !2)
!33 = !DILocalVariable(name: "i", scope: !34, file: !3, line: 37, type: !36)
!34 = distinct !DILexicalBlock(scope: !35, file: !3, line: 36, column: 9)
!35 = distinct !DILexicalBlock(scope: !2, file: !3, line: 33, column: 5)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!38 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 37, column: 20, scope: !34)
!40 = !DILocation(line: 38, column: 20, scope: !41)
!41 = distinct !DILexicalBlock(scope: !34, file: !3, line: 38, column: 13)
!42 = !DILocation(line: 38, column: 18, scope: !41)
!43 = !DILocation(line: 38, column: 25, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !3, line: 38, column: 13)
!45 = !DILocation(line: 38, column: 27, scope: !44)
!46 = !DILocation(line: 38, column: 13, scope: !41)
!47 = !DILocation(line: 40, column: 28, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !3, line: 39, column: 13)
!49 = !DILocation(line: 40, column: 17, scope: !48)
!50 = !DILocation(line: 40, column: 31, scope: !48)
!51 = !DILocation(line: 41, column: 13, scope: !48)
!52 = !DILocation(line: 38, column: 35, scope: !44)
!53 = !DILocation(line: 38, column: 13, scope: !44)
!54 = distinct !{!54, !46, !55, !56}
!55 = !DILocation(line: 41, column: 13, scope: !41)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 43, column: 14, scope: !35)
!58 = !DILocation(line: 45, column: 66, scope: !2)
!59 = !DILocation(line: 45, column: 64, scope: !2)
!60 = !DILocation(line: 46, column: 5, scope: !2)
!61 = !DILocation(line: 47, column: 1, scope: !2)
!62 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_68_good", scope: !3, file: !3, line: 82, type: !4, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!63 = !DILocation(line: 84, column: 5, scope: !62)
!64 = !DILocation(line: 85, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 57, type: !4, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!66 = !DILocalVariable(name: "data", scope: !65, file: !3, line: 59, type: !8)
!67 = !DILocation(line: 59, column: 11, scope: !65)
!68 = !DILocation(line: 60, column: 10, scope: !65)
!69 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !3, line: 63, type: !8)
!70 = distinct !DILexicalBlock(scope: !65, file: !3, line: 61, column: 5)
!71 = !DILocation(line: 63, column: 15, scope: !70)
!72 = !DILocation(line: 63, column: 35, scope: !70)
!73 = !DILocation(line: 63, column: 28, scope: !70)
!74 = !DILocation(line: 64, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !3, line: 64, column: 13)
!76 = !DILocation(line: 64, column: 24, scope: !75)
!77 = !DILocation(line: 64, column: 13, scope: !70)
!78 = !DILocation(line: 66, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !3, line: 65, column: 9)
!80 = !DILocation(line: 67, column: 13, scope: !79)
!81 = !DILocalVariable(name: "i", scope: !82, file: !3, line: 70, type: !36)
!82 = distinct !DILexicalBlock(scope: !70, file: !3, line: 69, column: 9)
!83 = !DILocation(line: 70, column: 20, scope: !82)
!84 = !DILocation(line: 71, column: 20, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !3, line: 71, column: 13)
!86 = !DILocation(line: 71, column: 18, scope: !85)
!87 = !DILocation(line: 71, column: 25, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !3, line: 71, column: 13)
!89 = !DILocation(line: 71, column: 27, scope: !88)
!90 = !DILocation(line: 71, column: 13, scope: !85)
!91 = !DILocation(line: 73, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !3, line: 72, column: 13)
!93 = !DILocation(line: 73, column: 28, scope: !92)
!94 = !DILocation(line: 73, column: 31, scope: !92)
!95 = !DILocation(line: 74, column: 13, scope: !92)
!96 = !DILocation(line: 71, column: 35, scope: !88)
!97 = !DILocation(line: 71, column: 13, scope: !88)
!98 = distinct !{!98, !90, !99, !56}
!99 = !DILocation(line: 74, column: 13, scope: !85)
!100 = !DILocation(line: 76, column: 16, scope: !70)
!101 = !DILocation(line: 76, column: 14, scope: !70)
!102 = !DILocation(line: 78, column: 70, scope: !65)
!103 = !DILocation(line: 78, column: 68, scope: !65)
!104 = !DILocation(line: 79, column: 5, scope: !65)
!105 = !DILocation(line: 80, column: 1, scope: !65)
!106 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_68b_badSink", scope: !21, file: !21, line: 28, type: !4, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !20, retainedNodes: !16)
!107 = !DILocalVariable(name: "data", scope: !106, file: !21, line: 30, type: !8)
!108 = !DILocation(line: 30, column: 11, scope: !106)
!109 = !DILocation(line: 30, column: 18, scope: !106)
!110 = !DILocation(line: 31, column: 18, scope: !106)
!111 = !DILocation(line: 31, column: 5, scope: !106)
!112 = !DILocation(line: 33, column: 10, scope: !106)
!113 = !DILocation(line: 33, column: 5, scope: !106)
!114 = !DILocation(line: 34, column: 1, scope: !106)
!115 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_68b_goodG2BSink", scope: !21, file: !21, line: 41, type: !4, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !20, retainedNodes: !16)
!116 = !DILocalVariable(name: "data", scope: !115, file: !21, line: 43, type: !8)
!117 = !DILocation(line: 43, column: 11, scope: !115)
!118 = !DILocation(line: 43, column: 18, scope: !115)
!119 = !DILocation(line: 44, column: 18, scope: !115)
!120 = !DILocation(line: 44, column: 5, scope: !115)
!121 = !DILocation(line: 46, column: 10, scope: !115)
!122 = !DILocation(line: 46, column: 5, scope: !115)
!123 = !DILocation(line: 47, column: 1, scope: !115)
