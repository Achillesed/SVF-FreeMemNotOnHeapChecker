; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_static_41.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_static_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int_static_41_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_41_badSink(i32* noundef %data) #0 !dbg !24 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = load i32*, i32** %data.addr, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !29
  %1 = load i32, i32* %arrayidx, align 4, !dbg !29
  call void @printIntLine(i32 noundef %1), !dbg !30
  %2 = load i32*, i32** %data.addr, align 8, !dbg !31
  %3 = bitcast i32* %2 to i8*, !dbg !31
  call void @free(i8* noundef %3) #5, !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_41_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !34, metadata !DIExpression()), !dbg !35
  store i32* null, i32** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %0, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_41_bad.dataBuffer, i64 0, i64 %1, !dbg !53
  store i32 5, i32* %arrayidx, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %2, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_41_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !61
  %3 = load i32*, i32** %data, align 8, !dbg !62
  call void @CWE590_Free_Memory_Not_on_Heap__free_int_static_41_badSink(i32* noundef %3), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_41_goodG2BSink(i32* noundef %data) #0 !dbg !65 {
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_41_good() #0 !dbg !73 {
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
  call void @CWE590_Free_Memory_Not_on_Heap__free_int_static_41_goodG2BSink(i32* noundef %7), !dbg !114
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

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 36, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_41_bad", scope: !3, file: !3, line: 30, type: !4, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_static_41.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "0842558cebafb1b8593b3706a27ef71a")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0}
!12 = !{}
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200, elements: !14)
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
!24 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_41_badSink", scope: !3, file: !3, line: 23, type: !25, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !8}
!27 = !DILocalVariable(name: "data", arg: 1, scope: !24, file: !3, line: 23, type: !8)
!28 = !DILocation(line: 23, column: 71, scope: !24)
!29 = !DILocation(line: 25, column: 18, scope: !24)
!30 = !DILocation(line: 25, column: 5, scope: !24)
!31 = !DILocation(line: 27, column: 10, scope: !24)
!32 = !DILocation(line: 27, column: 5, scope: !24)
!33 = !DILocation(line: 28, column: 1, scope: !24)
!34 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 32, type: !8)
!35 = !DILocation(line: 32, column: 11, scope: !2)
!36 = !DILocation(line: 33, column: 10, scope: !2)
!37 = !DILocalVariable(name: "i", scope: !38, file: !3, line: 38, type: !40)
!38 = distinct !DILexicalBlock(scope: !39, file: !3, line: 37, column: 9)
!39 = distinct !DILexicalBlock(scope: !2, file: !3, line: 34, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 38, column: 20, scope: !38)
!44 = !DILocation(line: 39, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !38, file: !3, line: 39, column: 13)
!46 = !DILocation(line: 39, column: 18, scope: !45)
!47 = !DILocation(line: 39, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !3, line: 39, column: 13)
!49 = !DILocation(line: 39, column: 27, scope: !48)
!50 = !DILocation(line: 39, column: 13, scope: !45)
!51 = !DILocation(line: 41, column: 28, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !3, line: 40, column: 13)
!53 = !DILocation(line: 41, column: 17, scope: !52)
!54 = !DILocation(line: 41, column: 31, scope: !52)
!55 = !DILocation(line: 42, column: 13, scope: !52)
!56 = !DILocation(line: 39, column: 35, scope: !48)
!57 = !DILocation(line: 39, column: 13, scope: !48)
!58 = distinct !{!58, !50, !59, !60}
!59 = !DILocation(line: 42, column: 13, scope: !45)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 44, column: 14, scope: !39)
!62 = !DILocation(line: 46, column: 64, scope: !2)
!63 = !DILocation(line: 46, column: 5, scope: !2)
!64 = !DILocation(line: 47, column: 1, scope: !2)
!65 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_41_goodG2BSink", scope: !3, file: !3, line: 53, type: !25, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!66 = !DILocalVariable(name: "data", arg: 1, scope: !65, file: !3, line: 53, type: !8)
!67 = !DILocation(line: 53, column: 75, scope: !65)
!68 = !DILocation(line: 55, column: 18, scope: !65)
!69 = !DILocation(line: 55, column: 5, scope: !65)
!70 = !DILocation(line: 57, column: 10, scope: !65)
!71 = !DILocation(line: 57, column: 5, scope: !65)
!72 = !DILocation(line: 58, column: 1, scope: !65)
!73 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_41_good", scope: !3, file: !3, line: 85, type: !4, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!74 = !DILocation(line: 87, column: 5, scope: !73)
!75 = !DILocation(line: 88, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 61, type: !4, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!77 = !DILocalVariable(name: "data", scope: !76, file: !3, line: 63, type: !8)
!78 = !DILocation(line: 63, column: 11, scope: !76)
!79 = !DILocation(line: 64, column: 10, scope: !76)
!80 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !3, line: 67, type: !8)
!81 = distinct !DILexicalBlock(scope: !76, file: !3, line: 65, column: 5)
!82 = !DILocation(line: 67, column: 15, scope: !81)
!83 = !DILocation(line: 67, column: 35, scope: !81)
!84 = !DILocation(line: 67, column: 28, scope: !81)
!85 = !DILocation(line: 68, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !3, line: 68, column: 13)
!87 = !DILocation(line: 68, column: 24, scope: !86)
!88 = !DILocation(line: 68, column: 13, scope: !81)
!89 = !DILocation(line: 70, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !3, line: 69, column: 9)
!91 = !DILocation(line: 71, column: 13, scope: !90)
!92 = !DILocalVariable(name: "i", scope: !93, file: !3, line: 74, type: !40)
!93 = distinct !DILexicalBlock(scope: !81, file: !3, line: 73, column: 9)
!94 = !DILocation(line: 74, column: 20, scope: !93)
!95 = !DILocation(line: 75, column: 20, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !3, line: 75, column: 13)
!97 = !DILocation(line: 75, column: 18, scope: !96)
!98 = !DILocation(line: 75, column: 25, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !3, line: 75, column: 13)
!100 = !DILocation(line: 75, column: 27, scope: !99)
!101 = !DILocation(line: 75, column: 13, scope: !96)
!102 = !DILocation(line: 77, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !3, line: 76, column: 13)
!104 = !DILocation(line: 77, column: 28, scope: !103)
!105 = !DILocation(line: 77, column: 31, scope: !103)
!106 = !DILocation(line: 78, column: 13, scope: !103)
!107 = !DILocation(line: 75, column: 35, scope: !99)
!108 = !DILocation(line: 75, column: 13, scope: !99)
!109 = distinct !{!109, !101, !110, !60}
!110 = !DILocation(line: 78, column: 13, scope: !96)
!111 = !DILocation(line: 80, column: 16, scope: !81)
!112 = !DILocation(line: 80, column: 14, scope: !81)
!113 = !DILocation(line: 82, column: 68, scope: !76)
!114 = !DILocation(line: 82, column: 5, scope: !76)
!115 = !DILocation(line: 83, column: 1, scope: !76)
