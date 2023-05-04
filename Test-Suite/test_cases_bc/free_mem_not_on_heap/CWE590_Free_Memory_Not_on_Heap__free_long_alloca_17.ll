; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_alloca_17.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i1 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i64* null, i64** %data, align 8, !dbg !23
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %0, 1, !dbg !29
  br i1 %cmp, label %for.body, label %for.end7, !dbg !30

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !34
  %1 = alloca i8, i64 800, align 16, !dbg !35
  %2 = bitcast i8* %1 to i64*, !dbg !36
  store i64* %2, i64** %dataBuffer, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !37, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i1, align 8, !dbg !43
  br label %for.cond2, !dbg !45

for.cond2:                                        ; preds = %for.inc, %for.body
  %3 = load i64, i64* %i1, align 8, !dbg !46
  %cmp3 = icmp ult i64 %3, 100, !dbg !48
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !49

for.body4:                                        ; preds = %for.cond2
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !50
  %5 = load i64, i64* %i1, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !50
  store i64 5, i64* %arrayidx, align 8, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body4
  %6 = load i64, i64* %i1, align 8, !dbg !55
  %inc = add i64 %6, 1, !dbg !55
  store i64 %inc, i64* %i1, align 8, !dbg !55
  br label %for.cond2, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond2
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !60
  store i64* %7, i64** %data, align 8, !dbg !61
  br label %for.inc5, !dbg !62

for.inc5:                                         ; preds = %for.end
  %8 = load i32, i32* %i, align 4, !dbg !63
  %inc6 = add nsw i32 %8, 1, !dbg !63
  store i32 %inc6, i32* %i, align 4, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end7:                                         ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !67
  %arrayidx8 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !67
  %10 = load i64, i64* %arrayidx8, align 8, !dbg !67
  call void @printLongLine(i64 noundef %10), !dbg !68
  %11 = load i64*, i64** %data, align 8, !dbg !69
  %12 = bitcast i64* %11 to i8*, !dbg !69
  call void @free(i8* noundef %12) #5, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_17_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %h = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i64* null, i64** %data, align 8, !dbg !80
  store i32 0, i32* %h, align 4, !dbg !81
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32, i32* %h, align 4, !dbg !84
  %cmp = icmp slt i32 %0, 1, !dbg !86
  br i1 %cmp, label %for.body, label %for.end7, !dbg !87

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !88, metadata !DIExpression()), !dbg !91
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !92
  %1 = bitcast i8* %call to i64*, !dbg !93
  store i64* %1, i64** %dataBuffer, align 8, !dbg !91
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !94
  %cmp1 = icmp eq i64* %2, null, !dbg !96
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
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !111
  %5 = load i64, i64* %i, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !111
  store i64 5, i64* %arrayidx, align 8, !dbg !114
  br label %for.inc, !dbg !115

for.inc:                                          ; preds = %for.body4
  %6 = load i64, i64* %i, align 8, !dbg !116
  %inc = add i64 %6, 1, !dbg !116
  store i64 %inc, i64* %i, align 8, !dbg !116
  br label %for.cond2, !dbg !117, !llvm.loop !118

for.end:                                          ; preds = %for.cond2
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !120
  store i64* %7, i64** %data, align 8, !dbg !121
  br label %for.inc5, !dbg !122

for.inc5:                                         ; preds = %for.end
  %8 = load i32, i32* %h, align 4, !dbg !123
  %inc6 = add nsw i32 %8, 1, !dbg !123
  store i32 %inc6, i32* %h, align 4, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end7:                                         ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !127
  %arrayidx8 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !127
  %10 = load i64, i64* %arrayidx8, align 8, !dbg !127
  call void @printLongLine(i64 noundef %10), !dbg !128
  %11 = load i64*, i64** %data, align 8, !dbg !129
  %12 = bitcast i64* %11 to i8*, !dbg !129
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_17.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "156bb5ab0b5969be515ba9fe8fb0a481")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_17_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "i", scope: !14, file: !1, line: 25, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 9, scope: !14)
!21 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 26, type: !3)
!22 = !DILocation(line: 26, column: 12, scope: !14)
!23 = !DILocation(line: 27, column: 10, scope: !14)
!24 = !DILocation(line: 28, column: 11, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !1, line: 28, column: 5)
!26 = !DILocation(line: 28, column: 9, scope: !25)
!27 = !DILocation(line: 28, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !1, line: 28, column: 5)
!29 = !DILocation(line: 28, column: 18, scope: !28)
!30 = !DILocation(line: 28, column: 5, scope: !25)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !1, line: 32, type: !3)
!32 = distinct !DILexicalBlock(scope: !33, file: !1, line: 30, column: 9)
!33 = distinct !DILexicalBlock(scope: !28, file: !1, line: 29, column: 5)
!34 = !DILocation(line: 32, column: 20, scope: !32)
!35 = !DILocation(line: 32, column: 41, scope: !32)
!36 = !DILocation(line: 32, column: 33, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !38, file: !1, line: 34, type: !39)
!38 = distinct !DILexicalBlock(scope: !32, file: !1, line: 33, column: 13)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 34, column: 24, scope: !38)
!43 = !DILocation(line: 35, column: 24, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !1, line: 35, column: 17)
!45 = !DILocation(line: 35, column: 22, scope: !44)
!46 = !DILocation(line: 35, column: 29, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !1, line: 35, column: 17)
!48 = !DILocation(line: 35, column: 31, scope: !47)
!49 = !DILocation(line: 35, column: 17, scope: !44)
!50 = !DILocation(line: 37, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 36, column: 17)
!52 = !DILocation(line: 37, column: 32, scope: !51)
!53 = !DILocation(line: 37, column: 35, scope: !51)
!54 = !DILocation(line: 38, column: 17, scope: !51)
!55 = !DILocation(line: 35, column: 39, scope: !47)
!56 = !DILocation(line: 35, column: 17, scope: !47)
!57 = distinct !{!57, !49, !58, !59}
!58 = !DILocation(line: 38, column: 17, scope: !44)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 40, column: 20, scope: !32)
!61 = !DILocation(line: 40, column: 18, scope: !32)
!62 = !DILocation(line: 42, column: 5, scope: !33)
!63 = !DILocation(line: 28, column: 24, scope: !28)
!64 = !DILocation(line: 28, column: 5, scope: !28)
!65 = distinct !{!65, !30, !66, !59}
!66 = !DILocation(line: 42, column: 5, scope: !25)
!67 = !DILocation(line: 43, column: 19, scope: !14)
!68 = !DILocation(line: 43, column: 5, scope: !14)
!69 = !DILocation(line: 45, column: 10, scope: !14)
!70 = !DILocation(line: 45, column: 5, scope: !14)
!71 = !DILocation(line: 46, column: 1, scope: !14)
!72 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_17_good", scope: !1, file: !1, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!73 = !DILocation(line: 85, column: 5, scope: !72)
!74 = !DILocation(line: 86, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!76 = !DILocalVariable(name: "h", scope: !75, file: !1, line: 55, type: !19)
!77 = !DILocation(line: 55, column: 9, scope: !75)
!78 = !DILocalVariable(name: "data", scope: !75, file: !1, line: 56, type: !3)
!79 = !DILocation(line: 56, column: 12, scope: !75)
!80 = !DILocation(line: 57, column: 10, scope: !75)
!81 = !DILocation(line: 58, column: 11, scope: !82)
!82 = distinct !DILexicalBlock(scope: !75, file: !1, line: 58, column: 5)
!83 = !DILocation(line: 58, column: 9, scope: !82)
!84 = !DILocation(line: 58, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !1, line: 58, column: 5)
!86 = !DILocation(line: 58, column: 18, scope: !85)
!87 = !DILocation(line: 58, column: 5, scope: !82)
!88 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !1, line: 62, type: !3)
!89 = distinct !DILexicalBlock(scope: !90, file: !1, line: 60, column: 9)
!90 = distinct !DILexicalBlock(scope: !85, file: !1, line: 59, column: 5)
!91 = !DILocation(line: 62, column: 20, scope: !89)
!92 = !DILocation(line: 62, column: 41, scope: !89)
!93 = !DILocation(line: 62, column: 33, scope: !89)
!94 = !DILocation(line: 63, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !1, line: 63, column: 17)
!96 = !DILocation(line: 63, column: 28, scope: !95)
!97 = !DILocation(line: 63, column: 17, scope: !89)
!98 = !DILocation(line: 65, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !1, line: 64, column: 13)
!100 = !DILocation(line: 66, column: 17, scope: !99)
!101 = !DILocalVariable(name: "i", scope: !102, file: !1, line: 69, type: !39)
!102 = distinct !DILexicalBlock(scope: !89, file: !1, line: 68, column: 13)
!103 = !DILocation(line: 69, column: 24, scope: !102)
!104 = !DILocation(line: 70, column: 24, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !1, line: 70, column: 17)
!106 = !DILocation(line: 70, column: 22, scope: !105)
!107 = !DILocation(line: 70, column: 29, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !1, line: 70, column: 17)
!109 = !DILocation(line: 70, column: 31, scope: !108)
!110 = !DILocation(line: 70, column: 17, scope: !105)
!111 = !DILocation(line: 72, column: 21, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !1, line: 71, column: 17)
!113 = !DILocation(line: 72, column: 32, scope: !112)
!114 = !DILocation(line: 72, column: 35, scope: !112)
!115 = !DILocation(line: 73, column: 17, scope: !112)
!116 = !DILocation(line: 70, column: 39, scope: !108)
!117 = !DILocation(line: 70, column: 17, scope: !108)
!118 = distinct !{!118, !110, !119, !59}
!119 = !DILocation(line: 73, column: 17, scope: !105)
!120 = !DILocation(line: 75, column: 20, scope: !89)
!121 = !DILocation(line: 75, column: 18, scope: !89)
!122 = !DILocation(line: 77, column: 5, scope: !90)
!123 = !DILocation(line: 58, column: 24, scope: !85)
!124 = !DILocation(line: 58, column: 5, scope: !85)
!125 = distinct !{!125, !87, !126, !59}
!126 = !DILocation(line: 77, column: 5, scope: !82)
!127 = !DILocation(line: 78, column: 19, scope: !75)
!128 = !DILocation(line: 78, column: 5, scope: !75)
!129 = !DILocation(line: 80, column: 10, scope: !75)
!130 = !DILocation(line: 80, column: 5, scope: !75)
!131 = !DILocation(line: 81, column: 1, scope: !75)
