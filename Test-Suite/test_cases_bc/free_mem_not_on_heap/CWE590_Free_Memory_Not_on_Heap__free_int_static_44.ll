; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_static_44.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_static_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int_static_44_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_44_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !26, metadata !DIExpression()), !dbg !30
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !30
  store i32* null, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !42
  %cmp = icmp ult i64 %0, 100, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_44_bad.dataBuffer, i64 0, i64 %1, !dbg !48
  store i32 5, i32* %arrayidx, align 4, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %2, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_44_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !56
  %3 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !57
  %4 = load i32*, i32** %data, align 8, !dbg !58
  call void %3(i32* noundef %4), !dbg !57
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink(i32* noundef %data) #0 !dbg !60 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i32*, i32** %data.addr, align 8, !dbg !63
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !63
  %1 = load i32, i32* %arrayidx, align 4, !dbg !63
  call void @printIntLine(i32 noundef %1), !dbg !64
  %2 = load i32*, i32** %data.addr, align 8, !dbg !65
  %3 = bitcast i32* %2 to i8*, !dbg !65
  call void @free(i8* noundef %3) #5, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_44_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !74, metadata !DIExpression()), !dbg !75
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !75
  store i32* null, i32** %data, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !79
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !80
  %0 = bitcast i8* %call to i32*, !dbg !81
  store i32* %0, i32** %dataBuffer, align 8, !dbg !79
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !82
  %cmp = icmp eq i32* %1, null, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @exit(i32 noundef 1) #6, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !89, metadata !DIExpression()), !dbg !91
  store i64 0, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !95
  %cmp1 = icmp ult i64 %2, 100, !dbg !97
  br i1 %cmp1, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !99
  %4 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !99
  store i32 5, i32* %arrayidx, align 4, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !104
  %inc = add i64 %5, 1, !dbg !104
  store i64 %inc, i64* %i, align 8, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  store i32* %6, i32** %data, align 8, !dbg !109
  %7 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !110
  %8 = load i32*, i32** %data, align 8, !dbg !111
  call void %7(i32* noundef %8), !dbg !110
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink(i32* noundef %data) #0 !dbg !113 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = load i32*, i32** %data.addr, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !116
  %1 = load i32, i32* %arrayidx, align 4, !dbg !116
  call void @printIntLine(i32 noundef %1), !dbg !117
  %2 = load i32*, i32** %data.addr, align 8, !dbg !118
  %3 = bitcast i32* %2 to i8*, !dbg !118
  call void @free(i8* noundef %3) #5, !dbg !119
  ret void, !dbg !120
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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 38, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_44_bad", scope: !3, file: !3, line: 30, type: !4, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_static_44.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "ff5981e254f08a5ad6f0c6bb00fbd8c2")
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
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 32, type: !8)
!25 = !DILocation(line: 32, column: 11, scope: !2)
!26 = !DILocalVariable(name: "funcPtr", scope: !2, file: !3, line: 34, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DISubroutineType(types: !29)
!29 = !{null, !8}
!30 = !DILocation(line: 34, column: 12, scope: !2)
!31 = !DILocation(line: 35, column: 10, scope: !2)
!32 = !DILocalVariable(name: "i", scope: !33, file: !3, line: 40, type: !35)
!33 = distinct !DILexicalBlock(scope: !34, file: !3, line: 39, column: 9)
!34 = distinct !DILexicalBlock(scope: !2, file: !3, line: 36, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!37 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 40, column: 20, scope: !33)
!39 = !DILocation(line: 41, column: 20, scope: !40)
!40 = distinct !DILexicalBlock(scope: !33, file: !3, line: 41, column: 13)
!41 = !DILocation(line: 41, column: 18, scope: !40)
!42 = !DILocation(line: 41, column: 25, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !3, line: 41, column: 13)
!44 = !DILocation(line: 41, column: 27, scope: !43)
!45 = !DILocation(line: 41, column: 13, scope: !40)
!46 = !DILocation(line: 43, column: 28, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !3, line: 42, column: 13)
!48 = !DILocation(line: 43, column: 17, scope: !47)
!49 = !DILocation(line: 43, column: 31, scope: !47)
!50 = !DILocation(line: 44, column: 13, scope: !47)
!51 = !DILocation(line: 41, column: 35, scope: !43)
!52 = !DILocation(line: 41, column: 13, scope: !43)
!53 = distinct !{!53, !45, !54, !55}
!54 = !DILocation(line: 44, column: 13, scope: !40)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 46, column: 14, scope: !34)
!57 = !DILocation(line: 49, column: 5, scope: !2)
!58 = !DILocation(line: 49, column: 13, scope: !2)
!59 = !DILocation(line: 50, column: 1, scope: !2)
!60 = distinct !DISubprogram(name: "badSink", scope: !3, file: !3, line: 23, type: !28, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!61 = !DILocalVariable(name: "data", arg: 1, scope: !60, file: !3, line: 23, type: !8)
!62 = !DILocation(line: 23, column: 27, scope: !60)
!63 = !DILocation(line: 25, column: 18, scope: !60)
!64 = !DILocation(line: 25, column: 5, scope: !60)
!65 = !DILocation(line: 27, column: 10, scope: !60)
!66 = !DILocation(line: 27, column: 5, scope: !60)
!67 = !DILocation(line: 28, column: 1, scope: !60)
!68 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_44_good", scope: !3, file: !3, line: 89, type: !4, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!69 = !DILocation(line: 91, column: 5, scope: !68)
!70 = !DILocation(line: 92, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 64, type: !4, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!72 = !DILocalVariable(name: "data", scope: !71, file: !3, line: 66, type: !8)
!73 = !DILocation(line: 66, column: 11, scope: !71)
!74 = !DILocalVariable(name: "funcPtr", scope: !71, file: !3, line: 67, type: !27)
!75 = !DILocation(line: 67, column: 12, scope: !71)
!76 = !DILocation(line: 68, column: 10, scope: !71)
!77 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !3, line: 71, type: !8)
!78 = distinct !DILexicalBlock(scope: !71, file: !3, line: 69, column: 5)
!79 = !DILocation(line: 71, column: 15, scope: !78)
!80 = !DILocation(line: 71, column: 35, scope: !78)
!81 = !DILocation(line: 71, column: 28, scope: !78)
!82 = !DILocation(line: 72, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !3, line: 72, column: 13)
!84 = !DILocation(line: 72, column: 24, scope: !83)
!85 = !DILocation(line: 72, column: 13, scope: !78)
!86 = !DILocation(line: 74, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !3, line: 73, column: 9)
!88 = !DILocation(line: 75, column: 13, scope: !87)
!89 = !DILocalVariable(name: "i", scope: !90, file: !3, line: 78, type: !35)
!90 = distinct !DILexicalBlock(scope: !78, file: !3, line: 77, column: 9)
!91 = !DILocation(line: 78, column: 20, scope: !90)
!92 = !DILocation(line: 79, column: 20, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !3, line: 79, column: 13)
!94 = !DILocation(line: 79, column: 18, scope: !93)
!95 = !DILocation(line: 79, column: 25, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !3, line: 79, column: 13)
!97 = !DILocation(line: 79, column: 27, scope: !96)
!98 = !DILocation(line: 79, column: 13, scope: !93)
!99 = !DILocation(line: 81, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !3, line: 80, column: 13)
!101 = !DILocation(line: 81, column: 28, scope: !100)
!102 = !DILocation(line: 81, column: 31, scope: !100)
!103 = !DILocation(line: 82, column: 13, scope: !100)
!104 = !DILocation(line: 79, column: 35, scope: !96)
!105 = !DILocation(line: 79, column: 13, scope: !96)
!106 = distinct !{!106, !98, !107, !55}
!107 = !DILocation(line: 82, column: 13, scope: !93)
!108 = !DILocation(line: 84, column: 16, scope: !78)
!109 = !DILocation(line: 84, column: 14, scope: !78)
!110 = !DILocation(line: 86, column: 5, scope: !71)
!111 = !DILocation(line: 86, column: 13, scope: !71)
!112 = !DILocation(line: 87, column: 1, scope: !71)
!113 = distinct !DISubprogram(name: "goodG2BSink", scope: !3, file: !3, line: 57, type: !28, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!114 = !DILocalVariable(name: "data", arg: 1, scope: !113, file: !3, line: 57, type: !8)
!115 = !DILocation(line: 57, column: 31, scope: !113)
!116 = !DILocation(line: 59, column: 18, scope: !113)
!117 = !DILocation(line: 59, column: 5, scope: !113)
!118 = !DILocation(line: 61, column: 10, scope: !113)
!119 = !DILocation(line: 61, column: 5, scope: !113)
!120 = !DILocation(line: 62, column: 1, scope: !113)
