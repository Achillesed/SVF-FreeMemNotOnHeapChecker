; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_static_17.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_static_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int_static_17_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_17_bad() #0 !dbg !2 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %i1 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32, i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %0, 1, !dbg !34
  br i1 %cmp, label %for.body, label %for.end7, !dbg !35

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !36, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i1, align 8, !dbg !44
  br label %for.cond2, !dbg !46

for.cond2:                                        ; preds = %for.inc, %for.body
  %1 = load i64, i64* %i1, align 8, !dbg !47
  %cmp3 = icmp ult i64 %1, 100, !dbg !49
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !50

for.body4:                                        ; preds = %for.cond2
  %2 = load i64, i64* %i1, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_17_bad.dataBuffer, i64 0, i64 %2, !dbg !53
  store i32 5, i32* %arrayidx, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body4
  %3 = load i64, i64* %i1, align 8, !dbg !56
  %inc = add i64 %3, 1, !dbg !56
  store i64 %inc, i64* %i1, align 8, !dbg !56
  br label %for.cond2, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond2
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_17_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !61
  br label %for.inc5, !dbg !62

for.inc5:                                         ; preds = %for.end
  %4 = load i32, i32* %i, align 4, !dbg !63
  %inc6 = add nsw i32 %4, 1, !dbg !63
  store i32 %inc6, i32* %i, align 4, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end7:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !67
  %arrayidx8 = getelementptr inbounds i32, i32* %5, i64 0, !dbg !67
  %6 = load i32, i32* %arrayidx8, align 4, !dbg !67
  call void @printIntLine(i32 noundef %6), !dbg !68
  %7 = load i32*, i32** %data, align 8, !dbg !69
  %8 = bitcast i32* %7 to i8*, !dbg !69
  call void @free(i8* noundef %8) #5, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_17_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i32* null, i32** %data, align 8, !dbg !80
  store i32 0, i32* %h, align 4, !dbg !81
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32, i32* %h, align 4, !dbg !84
  %cmp = icmp slt i32 %0, 1, !dbg !86
  br i1 %cmp, label %for.body, label %for.end7, !dbg !87

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !88, metadata !DIExpression()), !dbg !91
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !92
  %1 = bitcast i8* %call to i32*, !dbg !93
  store i32* %1, i32** %dataBuffer, align 8, !dbg !91
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !94
  %cmp1 = icmp eq i32* %2, null, !dbg !96
  br i1 %cmp1, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %for.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @exit(i32 noundef 1) #6, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %for.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !101, metadata !DIExpression()), !dbg !103
  store i64 0, i64* %i, align 8, !dbg !104
  br label %for.cond2, !dbg !106

for.cond2:                                        ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !107
  %cmp3 = icmp ult i64 %3, 100, !dbg !109
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !110

for.body4:                                        ; preds = %for.cond2
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  %5 = load i64, i64* %i, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !111
  store i32 5, i32* %arrayidx, align 4, !dbg !114
  br label %for.inc, !dbg !115

for.inc:                                          ; preds = %for.body4
  %6 = load i64, i64* %i, align 8, !dbg !116
  %inc = add i64 %6, 1, !dbg !116
  store i64 %inc, i64* %i, align 8, !dbg !116
  br label %for.cond2, !dbg !117, !llvm.loop !118

for.end:                                          ; preds = %for.cond2
  %7 = load i32*, i32** %dataBuffer, align 8, !dbg !120
  store i32* %7, i32** %data, align 8, !dbg !121
  br label %for.inc5, !dbg !122

for.inc5:                                         ; preds = %for.end
  %8 = load i32, i32* %h, align 4, !dbg !123
  %inc6 = add nsw i32 %8, 1, !dbg !123
  store i32 %inc6, i32* %h, align 4, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end7:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx8 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !127
  %10 = load i32, i32* %arrayidx8, align 4, !dbg !127
  call void @printIntLine(i32 noundef %10), !dbg !128
  %11 = load i32*, i32** %data, align 8, !dbg !129
  %12 = bitcast i32* %11 to i8*, !dbg !129
  call void @free(i8* noundef %12) #5, !dbg !130
  ret void, !dbg !131
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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 32, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_17_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_static_17.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "7a5294b9a9ea1ce847f9bf8a692a4b6c")
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
!24 = !DILocalVariable(name: "i", scope: !2, file: !3, line: 25, type: !9)
!25 = !DILocation(line: 25, column: 9, scope: !2)
!26 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 26, type: !8)
!27 = !DILocation(line: 26, column: 11, scope: !2)
!28 = !DILocation(line: 27, column: 10, scope: !2)
!29 = !DILocation(line: 28, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !2, file: !3, line: 28, column: 5)
!31 = !DILocation(line: 28, column: 9, scope: !30)
!32 = !DILocation(line: 28, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !3, line: 28, column: 5)
!34 = !DILocation(line: 28, column: 18, scope: !33)
!35 = !DILocation(line: 28, column: 5, scope: !30)
!36 = !DILocalVariable(name: "i", scope: !37, file: !3, line: 34, type: !40)
!37 = distinct !DILexicalBlock(scope: !38, file: !3, line: 33, column: 13)
!38 = distinct !DILexicalBlock(scope: !39, file: !3, line: 30, column: 9)
!39 = distinct !DILexicalBlock(scope: !33, file: !3, line: 29, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 34, column: 24, scope: !37)
!44 = !DILocation(line: 35, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !37, file: !3, line: 35, column: 17)
!46 = !DILocation(line: 35, column: 22, scope: !45)
!47 = !DILocation(line: 35, column: 29, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !3, line: 35, column: 17)
!49 = !DILocation(line: 35, column: 31, scope: !48)
!50 = !DILocation(line: 35, column: 17, scope: !45)
!51 = !DILocation(line: 37, column: 32, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !3, line: 36, column: 17)
!53 = !DILocation(line: 37, column: 21, scope: !52)
!54 = !DILocation(line: 37, column: 35, scope: !52)
!55 = !DILocation(line: 38, column: 17, scope: !52)
!56 = !DILocation(line: 35, column: 39, scope: !48)
!57 = !DILocation(line: 35, column: 17, scope: !48)
!58 = distinct !{!58, !50, !59, !60}
!59 = !DILocation(line: 38, column: 17, scope: !45)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 40, column: 18, scope: !38)
!62 = !DILocation(line: 42, column: 5, scope: !39)
!63 = !DILocation(line: 28, column: 24, scope: !33)
!64 = !DILocation(line: 28, column: 5, scope: !33)
!65 = distinct !{!65, !35, !66, !60}
!66 = !DILocation(line: 42, column: 5, scope: !30)
!67 = !DILocation(line: 43, column: 18, scope: !2)
!68 = !DILocation(line: 43, column: 5, scope: !2)
!69 = !DILocation(line: 45, column: 10, scope: !2)
!70 = !DILocation(line: 45, column: 5, scope: !2)
!71 = !DILocation(line: 46, column: 1, scope: !2)
!72 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_17_good", scope: !3, file: !3, line: 83, type: !4, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!73 = !DILocation(line: 85, column: 5, scope: !72)
!74 = !DILocation(line: 86, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 53, type: !4, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!76 = !DILocalVariable(name: "h", scope: !75, file: !3, line: 55, type: !9)
!77 = !DILocation(line: 55, column: 9, scope: !75)
!78 = !DILocalVariable(name: "data", scope: !75, file: !3, line: 56, type: !8)
!79 = !DILocation(line: 56, column: 11, scope: !75)
!80 = !DILocation(line: 57, column: 10, scope: !75)
!81 = !DILocation(line: 58, column: 11, scope: !82)
!82 = distinct !DILexicalBlock(scope: !75, file: !3, line: 58, column: 5)
!83 = !DILocation(line: 58, column: 9, scope: !82)
!84 = !DILocation(line: 58, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !3, line: 58, column: 5)
!86 = !DILocation(line: 58, column: 18, scope: !85)
!87 = !DILocation(line: 58, column: 5, scope: !82)
!88 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !3, line: 62, type: !8)
!89 = distinct !DILexicalBlock(scope: !90, file: !3, line: 60, column: 9)
!90 = distinct !DILexicalBlock(scope: !85, file: !3, line: 59, column: 5)
!91 = !DILocation(line: 62, column: 19, scope: !89)
!92 = !DILocation(line: 62, column: 39, scope: !89)
!93 = !DILocation(line: 62, column: 32, scope: !89)
!94 = !DILocation(line: 63, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !3, line: 63, column: 17)
!96 = !DILocation(line: 63, column: 28, scope: !95)
!97 = !DILocation(line: 63, column: 17, scope: !89)
!98 = !DILocation(line: 65, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !3, line: 64, column: 13)
!100 = !DILocation(line: 66, column: 17, scope: !99)
!101 = !DILocalVariable(name: "i", scope: !102, file: !3, line: 69, type: !40)
!102 = distinct !DILexicalBlock(scope: !89, file: !3, line: 68, column: 13)
!103 = !DILocation(line: 69, column: 24, scope: !102)
!104 = !DILocation(line: 70, column: 24, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !3, line: 70, column: 17)
!106 = !DILocation(line: 70, column: 22, scope: !105)
!107 = !DILocation(line: 70, column: 29, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !3, line: 70, column: 17)
!109 = !DILocation(line: 70, column: 31, scope: !108)
!110 = !DILocation(line: 70, column: 17, scope: !105)
!111 = !DILocation(line: 72, column: 21, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !3, line: 71, column: 17)
!113 = !DILocation(line: 72, column: 32, scope: !112)
!114 = !DILocation(line: 72, column: 35, scope: !112)
!115 = !DILocation(line: 73, column: 17, scope: !112)
!116 = !DILocation(line: 70, column: 39, scope: !108)
!117 = !DILocation(line: 70, column: 17, scope: !108)
!118 = distinct !{!118, !110, !119, !60}
!119 = !DILocation(line: 73, column: 17, scope: !105)
!120 = !DILocation(line: 75, column: 20, scope: !89)
!121 = !DILocation(line: 75, column: 18, scope: !89)
!122 = !DILocation(line: 77, column: 5, scope: !90)
!123 = !DILocation(line: 58, column: 24, scope: !85)
!124 = !DILocation(line: 58, column: 5, scope: !85)
!125 = distinct !{!125, !87, !126, !60}
!126 = !DILocation(line: 77, column: 5, scope: !82)
!127 = !DILocation(line: 78, column: 18, scope: !75)
!128 = !DILocation(line: 78, column: 5, scope: !75)
!129 = !DILocation(line: 80, column: 10, scope: !75)
!130 = !DILocation(line: 80, column: 5, scope: !75)
!131 = !DILocation(line: 81, column: 1, scope: !75)
