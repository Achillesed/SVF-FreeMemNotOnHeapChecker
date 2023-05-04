; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_alloca_44.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 400, align 16, !dbg !29
  %1 = bitcast i8* %0 to i32*, !dbg !30
  store i32* %1, i32** %dataBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !40
  %cmp = icmp ult i64 %2, 100, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !44
  %4 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !44
  store i32 5, i32* %arrayidx, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %5, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !54
  store i32* %6, i32** %data, align 8, !dbg !55
  %7 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !56
  %8 = load i32*, i32** %data, align 8, !dbg !57
  call void %7(i32* noundef %8), !dbg !56
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink(i32* noundef %data) #0 !dbg !59 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %0 = load i32*, i32** %data.addr, align 8, !dbg !62
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !62
  %1 = load i32, i32* %arrayidx, align 4, !dbg !62
  call void @printIntLine(i32 noundef %1), !dbg !63
  %2 = load i32*, i32** %data.addr, align 8, !dbg !64
  %3 = bitcast i32* %2 to i8*, !dbg !64
  call void @free(i8* noundef %3) #5, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_44_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !73, metadata !DIExpression()), !dbg !74
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !74
  store i32* null, i32** %data, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !78
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !79
  %0 = bitcast i8* %call to i32*, !dbg !80
  store i32* %0, i32** %dataBuffer, align 8, !dbg !78
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !81
  %cmp = icmp eq i32* %1, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @exit(i32 noundef 1) #6, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !88, metadata !DIExpression()), !dbg !90
  store i64 0, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !94
  %cmp1 = icmp ult i64 %2, 100, !dbg !96
  br i1 %cmp1, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !98
  %4 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !98
  store i32 5, i32* %arrayidx, align 4, !dbg !101
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !103
  %inc = add i64 %5, 1, !dbg !103
  store i64 %inc, i64* %i, align 8, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  store i32* %6, i32** %data, align 8, !dbg !108
  %7 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !109
  %8 = load i32*, i32** %data, align 8, !dbg !110
  call void %7(i32* noundef %8), !dbg !109
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink(i32* noundef %data) #0 !dbg !112 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = load i32*, i32** %data.addr, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !115
  %1 = load i32, i32* %arrayidx, align 4, !dbg !115
  call void @printIntLine(i32 noundef %1), !dbg !116
  %2 = load i32*, i32** %data.addr, align 8, !dbg !117
  %3 = bitcast i32* %2 to i8*, !dbg !117
  call void @free(i8* noundef %3) #5, !dbg !118
  ret void, !dbg !119
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_44.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "66103789425004b8f521dec8592c0e83")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_44_bad", scope: !1, file: !1, line: 30, type: !15, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
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
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !1, line: 38, type: !3)
!27 = distinct !DILexicalBlock(scope: !14, file: !1, line: 36, column: 5)
!28 = !DILocation(line: 38, column: 15, scope: !27)
!29 = !DILocation(line: 38, column: 35, scope: !27)
!30 = !DILocation(line: 38, column: 28, scope: !27)
!31 = !DILocalVariable(name: "i", scope: !32, file: !1, line: 40, type: !33)
!32 = distinct !DILexicalBlock(scope: !27, file: !1, line: 39, column: 9)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!35 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 40, column: 20, scope: !32)
!37 = !DILocation(line: 41, column: 20, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !1, line: 41, column: 13)
!39 = !DILocation(line: 41, column: 18, scope: !38)
!40 = !DILocation(line: 41, column: 25, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !1, line: 41, column: 13)
!42 = !DILocation(line: 41, column: 27, scope: !41)
!43 = !DILocation(line: 41, column: 13, scope: !38)
!44 = !DILocation(line: 43, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !1, line: 42, column: 13)
!46 = !DILocation(line: 43, column: 28, scope: !45)
!47 = !DILocation(line: 43, column: 31, scope: !45)
!48 = !DILocation(line: 44, column: 13, scope: !45)
!49 = !DILocation(line: 41, column: 35, scope: !41)
!50 = !DILocation(line: 41, column: 13, scope: !41)
!51 = distinct !{!51, !43, !52, !53}
!52 = !DILocation(line: 44, column: 13, scope: !38)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 46, column: 16, scope: !27)
!55 = !DILocation(line: 46, column: 14, scope: !27)
!56 = !DILocation(line: 49, column: 5, scope: !14)
!57 = !DILocation(line: 49, column: 13, scope: !14)
!58 = !DILocation(line: 50, column: 1, scope: !14)
!59 = distinct !DISubprogram(name: "badSink", scope: !1, file: !1, line: 23, type: !22, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!60 = !DILocalVariable(name: "data", arg: 1, scope: !59, file: !1, line: 23, type: !3)
!61 = !DILocation(line: 23, column: 27, scope: !59)
!62 = !DILocation(line: 25, column: 18, scope: !59)
!63 = !DILocation(line: 25, column: 5, scope: !59)
!64 = !DILocation(line: 27, column: 10, scope: !59)
!65 = !DILocation(line: 27, column: 5, scope: !59)
!66 = !DILocation(line: 28, column: 1, scope: !59)
!67 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_44_good", scope: !1, file: !1, line: 89, type: !15, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!68 = !DILocation(line: 91, column: 5, scope: !67)
!69 = !DILocation(line: 92, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 64, type: !15, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!71 = !DILocalVariable(name: "data", scope: !70, file: !1, line: 66, type: !3)
!72 = !DILocation(line: 66, column: 11, scope: !70)
!73 = !DILocalVariable(name: "funcPtr", scope: !70, file: !1, line: 67, type: !21)
!74 = !DILocation(line: 67, column: 12, scope: !70)
!75 = !DILocation(line: 68, column: 10, scope: !70)
!76 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !1, line: 71, type: !3)
!77 = distinct !DILexicalBlock(scope: !70, file: !1, line: 69, column: 5)
!78 = !DILocation(line: 71, column: 15, scope: !77)
!79 = !DILocation(line: 71, column: 35, scope: !77)
!80 = !DILocation(line: 71, column: 28, scope: !77)
!81 = !DILocation(line: 72, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !1, line: 72, column: 13)
!83 = !DILocation(line: 72, column: 24, scope: !82)
!84 = !DILocation(line: 72, column: 13, scope: !77)
!85 = !DILocation(line: 74, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !1, line: 73, column: 9)
!87 = !DILocation(line: 75, column: 13, scope: !86)
!88 = !DILocalVariable(name: "i", scope: !89, file: !1, line: 78, type: !33)
!89 = distinct !DILexicalBlock(scope: !77, file: !1, line: 77, column: 9)
!90 = !DILocation(line: 78, column: 20, scope: !89)
!91 = !DILocation(line: 79, column: 20, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !1, line: 79, column: 13)
!93 = !DILocation(line: 79, column: 18, scope: !92)
!94 = !DILocation(line: 79, column: 25, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !1, line: 79, column: 13)
!96 = !DILocation(line: 79, column: 27, scope: !95)
!97 = !DILocation(line: 79, column: 13, scope: !92)
!98 = !DILocation(line: 81, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !1, line: 80, column: 13)
!100 = !DILocation(line: 81, column: 28, scope: !99)
!101 = !DILocation(line: 81, column: 31, scope: !99)
!102 = !DILocation(line: 82, column: 13, scope: !99)
!103 = !DILocation(line: 79, column: 35, scope: !95)
!104 = !DILocation(line: 79, column: 13, scope: !95)
!105 = distinct !{!105, !97, !106, !53}
!106 = !DILocation(line: 82, column: 13, scope: !92)
!107 = !DILocation(line: 84, column: 16, scope: !77)
!108 = !DILocation(line: 84, column: 14, scope: !77)
!109 = !DILocation(line: 86, column: 5, scope: !70)
!110 = !DILocation(line: 86, column: 13, scope: !70)
!111 = !DILocation(line: 87, column: 1, scope: !70)
!112 = distinct !DISubprogram(name: "goodG2BSink", scope: !1, file: !1, line: 57, type: !22, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!113 = !DILocalVariable(name: "data", arg: 1, scope: !112, file: !1, line: 57, type: !3)
!114 = !DILocation(line: 57, column: 31, scope: !112)
!115 = !DILocation(line: 59, column: 18, scope: !112)
!116 = !DILocation(line: 59, column: 5, scope: !112)
!117 = !DILocation(line: 61, column: 10, scope: !112)
!118 = !DILocation(line: 61, column: 5, scope: !112)
!119 = !DILocation(line: 62, column: 1, scope: !112)
