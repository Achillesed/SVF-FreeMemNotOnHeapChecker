; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_alloca_17.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i1 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  store i32 0, i32* %i, align 4, !dbg !23
  br label %for.cond, !dbg !25

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32, i32* %i, align 4, !dbg !26
  %cmp = icmp slt i32 %0, 1, !dbg !28
  br i1 %cmp, label %for.body, label %for.end7, !dbg !29

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !33
  %1 = alloca i8, i64 400, align 16, !dbg !34
  %2 = bitcast i8* %1 to i32*, !dbg !35
  store i32* %2, i32** %dataBuffer, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i1, align 8, !dbg !42
  br label %for.cond2, !dbg !44

for.cond2:                                        ; preds = %for.inc, %for.body
  %3 = load i64, i64* %i1, align 8, !dbg !45
  %cmp3 = icmp ult i64 %3, 100, !dbg !47
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !48

for.body4:                                        ; preds = %for.cond2
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !49
  %5 = load i64, i64* %i1, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !49
  store i32 5, i32* %arrayidx, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body4
  %6 = load i64, i64* %i1, align 8, !dbg !54
  %inc = add i64 %6, 1, !dbg !54
  store i64 %inc, i64* %i1, align 8, !dbg !54
  br label %for.cond2, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond2
  %7 = load i32*, i32** %dataBuffer, align 8, !dbg !59
  store i32* %7, i32** %data, align 8, !dbg !60
  br label %for.inc5, !dbg !61

for.inc5:                                         ; preds = %for.end
  %8 = load i32, i32* %i, align 4, !dbg !62
  %inc6 = add nsw i32 %8, 1, !dbg !62
  store i32 %inc6, i32* %i, align 4, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end7:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !66
  %arrayidx8 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !66
  %10 = load i32, i32* %arrayidx8, align 4, !dbg !66
  call void @printIntLine(i32 noundef %10), !dbg !67
  %11 = load i32*, i32** %data, align 8, !dbg !68
  %12 = bitcast i32* %11 to i8*, !dbg !68
  call void @free(i8* noundef %12) #5, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_17_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i32* null, i32** %data, align 8, !dbg !79
  store i32 0, i32* %h, align 4, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32, i32* %h, align 4, !dbg !83
  %cmp = icmp slt i32 %0, 1, !dbg !85
  br i1 %cmp, label %for.body, label %for.end7, !dbg !86

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !90
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !91
  %1 = bitcast i8* %call to i32*, !dbg !92
  store i32* %1, i32** %dataBuffer, align 8, !dbg !90
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !93
  %cmp1 = icmp eq i32* %2, null, !dbg !95
  br i1 %cmp1, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %for.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @exit(i32 noundef 1) #6, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %for.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !100, metadata !DIExpression()), !dbg !102
  store i64 0, i64* %i, align 8, !dbg !103
  br label %for.cond2, !dbg !105

for.cond2:                                        ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !106
  %cmp3 = icmp ult i64 %3, 100, !dbg !108
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !109

for.body4:                                        ; preds = %for.cond2
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !110
  %5 = load i64, i64* %i, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !110
  store i32 5, i32* %arrayidx, align 4, !dbg !113
  br label %for.inc, !dbg !114

for.inc:                                          ; preds = %for.body4
  %6 = load i64, i64* %i, align 8, !dbg !115
  %inc = add i64 %6, 1, !dbg !115
  store i64 %inc, i64* %i, align 8, !dbg !115
  br label %for.cond2, !dbg !116, !llvm.loop !117

for.end:                                          ; preds = %for.cond2
  %7 = load i32*, i32** %dataBuffer, align 8, !dbg !119
  store i32* %7, i32** %data, align 8, !dbg !120
  br label %for.inc5, !dbg !121

for.inc5:                                         ; preds = %for.end
  %8 = load i32, i32* %h, align 4, !dbg !122
  %inc6 = add nsw i32 %8, 1, !dbg !122
  store i32 %inc6, i32* %h, align 4, !dbg !122
  br label %for.cond, !dbg !123, !llvm.loop !124

for.end7:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !126
  %arrayidx8 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !126
  %10 = load i32, i32* %arrayidx8, align 4, !dbg !126
  call void @printIntLine(i32 noundef %10), !dbg !127
  %11 = load i32*, i32** %data, align 8, !dbg !128
  %12 = bitcast i32* %11 to i8*, !dbg !128
  call void @free(i8* noundef %12) #5, !dbg !129
  ret void, !dbg !130
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_17.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "eab3b988410cedf5c7bdf218f1d58f62")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_17_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "i", scope: !14, file: !1, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 9, scope: !14)
!20 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 11, scope: !14)
!22 = !DILocation(line: 27, column: 10, scope: !14)
!23 = !DILocation(line: 28, column: 11, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !1, line: 28, column: 5)
!25 = !DILocation(line: 28, column: 9, scope: !24)
!26 = !DILocation(line: 28, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !1, line: 28, column: 5)
!28 = !DILocation(line: 28, column: 18, scope: !27)
!29 = !DILocation(line: 28, column: 5, scope: !24)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !1, line: 32, type: !3)
!31 = distinct !DILexicalBlock(scope: !32, file: !1, line: 30, column: 9)
!32 = distinct !DILexicalBlock(scope: !27, file: !1, line: 29, column: 5)
!33 = !DILocation(line: 32, column: 19, scope: !31)
!34 = !DILocation(line: 32, column: 39, scope: !31)
!35 = !DILocation(line: 32, column: 32, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !37, file: !1, line: 34, type: !38)
!37 = distinct !DILexicalBlock(scope: !31, file: !1, line: 33, column: 13)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 34, column: 24, scope: !37)
!42 = !DILocation(line: 35, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !1, line: 35, column: 17)
!44 = !DILocation(line: 35, column: 22, scope: !43)
!45 = !DILocation(line: 35, column: 29, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !1, line: 35, column: 17)
!47 = !DILocation(line: 35, column: 31, scope: !46)
!48 = !DILocation(line: 35, column: 17, scope: !43)
!49 = !DILocation(line: 37, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 36, column: 17)
!51 = !DILocation(line: 37, column: 32, scope: !50)
!52 = !DILocation(line: 37, column: 35, scope: !50)
!53 = !DILocation(line: 38, column: 17, scope: !50)
!54 = !DILocation(line: 35, column: 39, scope: !46)
!55 = !DILocation(line: 35, column: 17, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 38, column: 17, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 40, column: 20, scope: !31)
!60 = !DILocation(line: 40, column: 18, scope: !31)
!61 = !DILocation(line: 42, column: 5, scope: !32)
!62 = !DILocation(line: 28, column: 24, scope: !27)
!63 = !DILocation(line: 28, column: 5, scope: !27)
!64 = distinct !{!64, !29, !65, !58}
!65 = !DILocation(line: 42, column: 5, scope: !24)
!66 = !DILocation(line: 43, column: 18, scope: !14)
!67 = !DILocation(line: 43, column: 5, scope: !14)
!68 = !DILocation(line: 45, column: 10, scope: !14)
!69 = !DILocation(line: 45, column: 5, scope: !14)
!70 = !DILocation(line: 46, column: 1, scope: !14)
!71 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_17_good", scope: !1, file: !1, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!72 = !DILocation(line: 85, column: 5, scope: !71)
!73 = !DILocation(line: 86, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!75 = !DILocalVariable(name: "h", scope: !74, file: !1, line: 55, type: !4)
!76 = !DILocation(line: 55, column: 9, scope: !74)
!77 = !DILocalVariable(name: "data", scope: !74, file: !1, line: 56, type: !3)
!78 = !DILocation(line: 56, column: 11, scope: !74)
!79 = !DILocation(line: 57, column: 10, scope: !74)
!80 = !DILocation(line: 58, column: 11, scope: !81)
!81 = distinct !DILexicalBlock(scope: !74, file: !1, line: 58, column: 5)
!82 = !DILocation(line: 58, column: 9, scope: !81)
!83 = !DILocation(line: 58, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !1, line: 58, column: 5)
!85 = !DILocation(line: 58, column: 18, scope: !84)
!86 = !DILocation(line: 58, column: 5, scope: !81)
!87 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !1, line: 62, type: !3)
!88 = distinct !DILexicalBlock(scope: !89, file: !1, line: 60, column: 9)
!89 = distinct !DILexicalBlock(scope: !84, file: !1, line: 59, column: 5)
!90 = !DILocation(line: 62, column: 19, scope: !88)
!91 = !DILocation(line: 62, column: 39, scope: !88)
!92 = !DILocation(line: 62, column: 32, scope: !88)
!93 = !DILocation(line: 63, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !1, line: 63, column: 17)
!95 = !DILocation(line: 63, column: 28, scope: !94)
!96 = !DILocation(line: 63, column: 17, scope: !88)
!97 = !DILocation(line: 65, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !1, line: 64, column: 13)
!99 = !DILocation(line: 66, column: 17, scope: !98)
!100 = !DILocalVariable(name: "i", scope: !101, file: !1, line: 69, type: !38)
!101 = distinct !DILexicalBlock(scope: !88, file: !1, line: 68, column: 13)
!102 = !DILocation(line: 69, column: 24, scope: !101)
!103 = !DILocation(line: 70, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !1, line: 70, column: 17)
!105 = !DILocation(line: 70, column: 22, scope: !104)
!106 = !DILocation(line: 70, column: 29, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !1, line: 70, column: 17)
!108 = !DILocation(line: 70, column: 31, scope: !107)
!109 = !DILocation(line: 70, column: 17, scope: !104)
!110 = !DILocation(line: 72, column: 21, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !1, line: 71, column: 17)
!112 = !DILocation(line: 72, column: 32, scope: !111)
!113 = !DILocation(line: 72, column: 35, scope: !111)
!114 = !DILocation(line: 73, column: 17, scope: !111)
!115 = !DILocation(line: 70, column: 39, scope: !107)
!116 = !DILocation(line: 70, column: 17, scope: !107)
!117 = distinct !{!117, !109, !118, !58}
!118 = !DILocation(line: 73, column: 17, scope: !104)
!119 = !DILocation(line: 75, column: 20, scope: !88)
!120 = !DILocation(line: 75, column: 18, scope: !88)
!121 = !DILocation(line: 77, column: 5, scope: !89)
!122 = !DILocation(line: 58, column: 24, scope: !84)
!123 = !DILocation(line: 58, column: 5, scope: !84)
!124 = distinct !{!124, !86, !125, !58}
!125 = !DILocation(line: 77, column: 5, scope: !81)
!126 = !DILocation(line: 78, column: 18, scope: !74)
!127 = !DILocation(line: 78, column: 5, scope: !74)
!128 = !DILocation(line: 80, column: 10, scope: !74)
!129 = !DILocation(line: 80, column: 5, scope: !74)
!130 = !DILocation(line: 81, column: 1, scope: !74)
