; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_declare_17.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_declare_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_declare_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBuffer = alloca [100 x i64], align 16
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
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !38, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i1, align 8, !dbg !44
  br label %for.cond2, !dbg !46

for.cond2:                                        ; preds = %for.inc, %for.body
  %1 = load i64, i64* %i1, align 8, !dbg !47
  %cmp3 = icmp ult i64 %1, 100, !dbg !49
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !50

for.body4:                                        ; preds = %for.cond2
  %2 = load i64, i64* %i1, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %2, !dbg !53
  store i64 5, i64* %arrayidx, align 8, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body4
  %3 = load i64, i64* %i1, align 8, !dbg !56
  %inc = add i64 %3, 1, !dbg !56
  store i64 %inc, i64* %i1, align 8, !dbg !56
  br label %for.cond2, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond2
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !61
  store i64* %arraydecay, i64** %data, align 8, !dbg !62
  br label %for.inc5, !dbg !63

for.inc5:                                         ; preds = %for.end
  %4 = load i32, i32* %i, align 4, !dbg !64
  %inc6 = add nsw i32 %4, 1, !dbg !64
  store i32 %inc6, i32* %i, align 4, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end7:                                         ; preds = %for.cond
  %5 = load i64*, i64** %data, align 8, !dbg !68
  %arrayidx8 = getelementptr inbounds i64, i64* %5, i64 0, !dbg !68
  %6 = load i64, i64* %arrayidx8, align 8, !dbg !68
  call void @printLongLine(i64 noundef %6), !dbg !69
  %7 = load i64*, i64** %data, align 8, !dbg !70
  %8 = bitcast i64* %7 to i8*, !dbg !70
  call void @free(i8* noundef %8) #5, !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_declare_17_good() #0 !dbg !73 {
entry:
  call void @goodG2B(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %h = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i64** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i64* null, i64** %data, align 8, !dbg !81
  store i32 0, i32* %h, align 4, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32, i32* %h, align 4, !dbg !85
  %cmp = icmp slt i32 %0, 1, !dbg !87
  br i1 %cmp, label %for.body, label %for.end7, !dbg !88

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !89, metadata !DIExpression()), !dbg !92
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !93
  %1 = bitcast i8* %call to i64*, !dbg !94
  store i64* %1, i64** %dataBuffer, align 8, !dbg !92
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !95
  %cmp1 = icmp eq i64* %2, null, !dbg !97
  br i1 %cmp1, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %for.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @exit(i32 noundef 1) #6, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %for.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !102, metadata !DIExpression()), !dbg !104
  store i64 0, i64* %i, align 8, !dbg !105
  br label %for.cond2, !dbg !107

for.cond2:                                        ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !108
  %cmp3 = icmp ult i64 %3, 100, !dbg !110
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !111

for.body4:                                        ; preds = %for.cond2
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !112
  %5 = load i64, i64* %i, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !112
  store i64 5, i64* %arrayidx, align 8, !dbg !115
  br label %for.inc, !dbg !116

for.inc:                                          ; preds = %for.body4
  %6 = load i64, i64* %i, align 8, !dbg !117
  %inc = add i64 %6, 1, !dbg !117
  store i64 %inc, i64* %i, align 8, !dbg !117
  br label %for.cond2, !dbg !118, !llvm.loop !119

for.end:                                          ; preds = %for.cond2
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !121
  store i64* %7, i64** %data, align 8, !dbg !122
  br label %for.inc5, !dbg !123

for.inc5:                                         ; preds = %for.end
  %8 = load i32, i32* %h, align 4, !dbg !124
  %inc6 = add nsw i32 %8, 1, !dbg !124
  store i32 %inc6, i32* %h, align 4, !dbg !124
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end7:                                         ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !128
  %arrayidx8 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !128
  %10 = load i64, i64* %arrayidx8, align 8, !dbg !128
  call void @printLongLine(i64 noundef %10), !dbg !129
  %11 = load i64*, i64** %data, align 8, !dbg !130
  %12 = bitcast i64* %11 to i8*, !dbg !130
  call void @free(i8* noundef %12) #5, !dbg !131
  ret void, !dbg !132
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_17.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "ea17088ef76b1b109cfa34818d3f1d0a")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_17_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
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
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !1, line: 32, type: !34)
!32 = distinct !DILexicalBlock(scope: !33, file: !1, line: 30, column: 9)
!33 = distinct !DILexicalBlock(scope: !28, file: !1, line: 29, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 32, column: 18, scope: !32)
!38 = !DILocalVariable(name: "i", scope: !39, file: !1, line: 34, type: !40)
!39 = distinct !DILexicalBlock(scope: !32, file: !1, line: 33, column: 13)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 34, column: 24, scope: !39)
!44 = !DILocation(line: 35, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !1, line: 35, column: 17)
!46 = !DILocation(line: 35, column: 22, scope: !45)
!47 = !DILocation(line: 35, column: 29, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !1, line: 35, column: 17)
!49 = !DILocation(line: 35, column: 31, scope: !48)
!50 = !DILocation(line: 35, column: 17, scope: !45)
!51 = !DILocation(line: 37, column: 32, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !1, line: 36, column: 17)
!53 = !DILocation(line: 37, column: 21, scope: !52)
!54 = !DILocation(line: 37, column: 35, scope: !52)
!55 = !DILocation(line: 38, column: 17, scope: !52)
!56 = !DILocation(line: 35, column: 39, scope: !48)
!57 = !DILocation(line: 35, column: 17, scope: !48)
!58 = distinct !{!58, !50, !59, !60}
!59 = !DILocation(line: 38, column: 17, scope: !45)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 40, column: 20, scope: !32)
!62 = !DILocation(line: 40, column: 18, scope: !32)
!63 = !DILocation(line: 42, column: 5, scope: !33)
!64 = !DILocation(line: 28, column: 24, scope: !28)
!65 = !DILocation(line: 28, column: 5, scope: !28)
!66 = distinct !{!66, !30, !67, !60}
!67 = !DILocation(line: 42, column: 5, scope: !25)
!68 = !DILocation(line: 43, column: 19, scope: !14)
!69 = !DILocation(line: 43, column: 5, scope: !14)
!70 = !DILocation(line: 45, column: 10, scope: !14)
!71 = !DILocation(line: 45, column: 5, scope: !14)
!72 = !DILocation(line: 46, column: 1, scope: !14)
!73 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_17_good", scope: !1, file: !1, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!74 = !DILocation(line: 85, column: 5, scope: !73)
!75 = !DILocation(line: 86, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!77 = !DILocalVariable(name: "h", scope: !76, file: !1, line: 55, type: !19)
!78 = !DILocation(line: 55, column: 9, scope: !76)
!79 = !DILocalVariable(name: "data", scope: !76, file: !1, line: 56, type: !3)
!80 = !DILocation(line: 56, column: 12, scope: !76)
!81 = !DILocation(line: 57, column: 10, scope: !76)
!82 = !DILocation(line: 58, column: 11, scope: !83)
!83 = distinct !DILexicalBlock(scope: !76, file: !1, line: 58, column: 5)
!84 = !DILocation(line: 58, column: 9, scope: !83)
!85 = !DILocation(line: 58, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !1, line: 58, column: 5)
!87 = !DILocation(line: 58, column: 18, scope: !86)
!88 = !DILocation(line: 58, column: 5, scope: !83)
!89 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !1, line: 62, type: !3)
!90 = distinct !DILexicalBlock(scope: !91, file: !1, line: 60, column: 9)
!91 = distinct !DILexicalBlock(scope: !86, file: !1, line: 59, column: 5)
!92 = !DILocation(line: 62, column: 20, scope: !90)
!93 = !DILocation(line: 62, column: 41, scope: !90)
!94 = !DILocation(line: 62, column: 33, scope: !90)
!95 = !DILocation(line: 63, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !1, line: 63, column: 17)
!97 = !DILocation(line: 63, column: 28, scope: !96)
!98 = !DILocation(line: 63, column: 17, scope: !90)
!99 = !DILocation(line: 65, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !1, line: 64, column: 13)
!101 = !DILocation(line: 66, column: 17, scope: !100)
!102 = !DILocalVariable(name: "i", scope: !103, file: !1, line: 69, type: !40)
!103 = distinct !DILexicalBlock(scope: !90, file: !1, line: 68, column: 13)
!104 = !DILocation(line: 69, column: 24, scope: !103)
!105 = !DILocation(line: 70, column: 24, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !1, line: 70, column: 17)
!107 = !DILocation(line: 70, column: 22, scope: !106)
!108 = !DILocation(line: 70, column: 29, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !1, line: 70, column: 17)
!110 = !DILocation(line: 70, column: 31, scope: !109)
!111 = !DILocation(line: 70, column: 17, scope: !106)
!112 = !DILocation(line: 72, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !1, line: 71, column: 17)
!114 = !DILocation(line: 72, column: 32, scope: !113)
!115 = !DILocation(line: 72, column: 35, scope: !113)
!116 = !DILocation(line: 73, column: 17, scope: !113)
!117 = !DILocation(line: 70, column: 39, scope: !109)
!118 = !DILocation(line: 70, column: 17, scope: !109)
!119 = distinct !{!119, !111, !120, !60}
!120 = !DILocation(line: 73, column: 17, scope: !106)
!121 = !DILocation(line: 75, column: 20, scope: !90)
!122 = !DILocation(line: 75, column: 18, scope: !90)
!123 = !DILocation(line: 77, column: 5, scope: !91)
!124 = !DILocation(line: 58, column: 24, scope: !86)
!125 = !DILocation(line: 58, column: 5, scope: !86)
!126 = distinct !{!126, !88, !127, !60}
!127 = !DILocation(line: 77, column: 5, scope: !83)
!128 = !DILocation(line: 78, column: 19, scope: !76)
!129 = !DILocation(line: 78, column: 5, scope: !76)
!130 = !DILocation(line: 80, column: 10, scope: !76)
!131 = !DILocation(line: 80, column: 5, scope: !76)
!132 = !DILocation(line: 81, column: 1, scope: !76)
