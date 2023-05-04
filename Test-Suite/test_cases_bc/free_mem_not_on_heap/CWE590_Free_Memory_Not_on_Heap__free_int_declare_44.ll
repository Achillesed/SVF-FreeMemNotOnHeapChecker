; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_declare_44.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_declare_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %0, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 %1, !dbg !47
  store i32 5, i32* %arrayidx, align 4, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %2, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !55
  store i32* %arraydecay, i32** %data, align 8, !dbg !56
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_44_good() #0 !dbg !68 {
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_44.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "2c397d11f7f3a4cabd49f1360da40b0d")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_44_bad", scope: !1, file: !1, line: 30, type: !15, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 32, type: !3)
!19 = !DILocation(line: 32, column: 11, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !1, line: 34, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !3}
!24 = !DILocation(line: 34, column: 12, scope: !14)
!25 = !DILocation(line: 35, column: 10, scope: !14)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !1, line: 38, type: !28)
!27 = distinct !DILexicalBlock(scope: !14, file: !1, line: 36, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 38, column: 13, scope: !27)
!32 = !DILocalVariable(name: "i", scope: !33, file: !1, line: 40, type: !34)
!33 = distinct !DILexicalBlock(scope: !27, file: !1, line: 39, column: 9)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 40, column: 20, scope: !33)
!38 = !DILocation(line: 41, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !1, line: 41, column: 13)
!40 = !DILocation(line: 41, column: 18, scope: !39)
!41 = !DILocation(line: 41, column: 25, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !1, line: 41, column: 13)
!43 = !DILocation(line: 41, column: 27, scope: !42)
!44 = !DILocation(line: 41, column: 13, scope: !39)
!45 = !DILocation(line: 43, column: 28, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !1, line: 42, column: 13)
!47 = !DILocation(line: 43, column: 17, scope: !46)
!48 = !DILocation(line: 43, column: 31, scope: !46)
!49 = !DILocation(line: 44, column: 13, scope: !46)
!50 = !DILocation(line: 41, column: 35, scope: !42)
!51 = !DILocation(line: 41, column: 13, scope: !42)
!52 = distinct !{!52, !44, !53, !54}
!53 = !DILocation(line: 44, column: 13, scope: !39)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 46, column: 16, scope: !27)
!56 = !DILocation(line: 46, column: 14, scope: !27)
!57 = !DILocation(line: 49, column: 5, scope: !14)
!58 = !DILocation(line: 49, column: 13, scope: !14)
!59 = !DILocation(line: 50, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "badSink", scope: !1, file: !1, line: 23, type: !22, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!61 = !DILocalVariable(name: "data", arg: 1, scope: !60, file: !1, line: 23, type: !3)
!62 = !DILocation(line: 23, column: 27, scope: !60)
!63 = !DILocation(line: 25, column: 18, scope: !60)
!64 = !DILocation(line: 25, column: 5, scope: !60)
!65 = !DILocation(line: 27, column: 10, scope: !60)
!66 = !DILocation(line: 27, column: 5, scope: !60)
!67 = !DILocation(line: 28, column: 1, scope: !60)
!68 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_44_good", scope: !1, file: !1, line: 89, type: !15, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!69 = !DILocation(line: 91, column: 5, scope: !68)
!70 = !DILocation(line: 92, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 64, type: !15, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!72 = !DILocalVariable(name: "data", scope: !71, file: !1, line: 66, type: !3)
!73 = !DILocation(line: 66, column: 11, scope: !71)
!74 = !DILocalVariable(name: "funcPtr", scope: !71, file: !1, line: 67, type: !21)
!75 = !DILocation(line: 67, column: 12, scope: !71)
!76 = !DILocation(line: 68, column: 10, scope: !71)
!77 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !1, line: 71, type: !3)
!78 = distinct !DILexicalBlock(scope: !71, file: !1, line: 69, column: 5)
!79 = !DILocation(line: 71, column: 15, scope: !78)
!80 = !DILocation(line: 71, column: 35, scope: !78)
!81 = !DILocation(line: 71, column: 28, scope: !78)
!82 = !DILocation(line: 72, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !1, line: 72, column: 13)
!84 = !DILocation(line: 72, column: 24, scope: !83)
!85 = !DILocation(line: 72, column: 13, scope: !78)
!86 = !DILocation(line: 74, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !1, line: 73, column: 9)
!88 = !DILocation(line: 75, column: 13, scope: !87)
!89 = !DILocalVariable(name: "i", scope: !90, file: !1, line: 78, type: !34)
!90 = distinct !DILexicalBlock(scope: !78, file: !1, line: 77, column: 9)
!91 = !DILocation(line: 78, column: 20, scope: !90)
!92 = !DILocation(line: 79, column: 20, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !1, line: 79, column: 13)
!94 = !DILocation(line: 79, column: 18, scope: !93)
!95 = !DILocation(line: 79, column: 25, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !1, line: 79, column: 13)
!97 = !DILocation(line: 79, column: 27, scope: !96)
!98 = !DILocation(line: 79, column: 13, scope: !93)
!99 = !DILocation(line: 81, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !1, line: 80, column: 13)
!101 = !DILocation(line: 81, column: 28, scope: !100)
!102 = !DILocation(line: 81, column: 31, scope: !100)
!103 = !DILocation(line: 82, column: 13, scope: !100)
!104 = !DILocation(line: 79, column: 35, scope: !96)
!105 = !DILocation(line: 79, column: 13, scope: !96)
!106 = distinct !{!106, !98, !107, !54}
!107 = !DILocation(line: 82, column: 13, scope: !93)
!108 = !DILocation(line: 84, column: 16, scope: !78)
!109 = !DILocation(line: 84, column: 14, scope: !78)
!110 = !DILocation(line: 86, column: 5, scope: !71)
!111 = !DILocation(line: 86, column: 13, scope: !71)
!112 = !DILocation(line: 87, column: 1, scope: !71)
!113 = distinct !DISubprogram(name: "goodG2BSink", scope: !1, file: !1, line: 57, type: !22, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!114 = !DILocalVariable(name: "data", arg: 1, scope: !113, file: !1, line: 57, type: !3)
!115 = !DILocation(line: 57, column: 31, scope: !113)
!116 = !DILocation(line: 59, column: 18, scope: !113)
!117 = !DILocation(line: 59, column: 5, scope: !113)
!118 = !DILocation(line: 61, column: 10, scope: !113)
!119 = !DILocation(line: 61, column: 5, scope: !113)
!120 = !DILocation(line: 62, column: 1, scope: !113)
