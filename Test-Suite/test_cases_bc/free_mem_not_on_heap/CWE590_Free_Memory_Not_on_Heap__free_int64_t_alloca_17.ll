; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_17.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_17_bad() #0 !dbg !18 {
entry:
  %i = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i1 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i64** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i64* null, i64** %data, align 8, !dbg !27
  store i32 0, i32* %i, align 4, !dbg !28
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32, i32* %i, align 4, !dbg !31
  %cmp = icmp slt i32 %0, 1, !dbg !33
  br i1 %cmp, label %for.body, label %for.end7, !dbg !34

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !35, metadata !DIExpression()), !dbg !38
  %1 = alloca i8, i64 800, align 16, !dbg !39
  %2 = bitcast i8* %1 to i64*, !dbg !40
  store i64* %2, i64** %dataBuffer, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !41, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i1, align 8, !dbg !47
  br label %for.cond2, !dbg !49

for.cond2:                                        ; preds = %for.inc, %for.body
  %3 = load i64, i64* %i1, align 8, !dbg !50
  %cmp3 = icmp ult i64 %3, 100, !dbg !52
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !53

for.body4:                                        ; preds = %for.cond2
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !54
  %5 = load i64, i64* %i1, align 8, !dbg !56
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !54
  store i64 5, i64* %arrayidx, align 8, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body4
  %6 = load i64, i64* %i1, align 8, !dbg !59
  %inc = add i64 %6, 1, !dbg !59
  store i64 %inc, i64* %i1, align 8, !dbg !59
  br label %for.cond2, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond2
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !64
  store i64* %7, i64** %data, align 8, !dbg !65
  br label %for.inc5, !dbg !66

for.inc5:                                         ; preds = %for.end
  %8 = load i32, i32* %i, align 4, !dbg !67
  %inc6 = add nsw i32 %8, 1, !dbg !67
  store i32 %inc6, i32* %i, align 4, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end7:                                         ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !71
  %arrayidx8 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !71
  %10 = load i64, i64* %arrayidx8, align 8, !dbg !71
  call void @printLongLongLine(i64 noundef %10), !dbg !72
  %11 = load i64*, i64** %data, align 8, !dbg !73
  %12 = bitcast i64* %11 to i8*, !dbg !73
  call void @free(i8* noundef %12) #5, !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_17_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %h = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i64** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i64* null, i64** %data, align 8, !dbg !84
  store i32 0, i32* %h, align 4, !dbg !85
  br label %for.cond, !dbg !87

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32, i32* %h, align 4, !dbg !88
  %cmp = icmp slt i32 %0, 1, !dbg !90
  br i1 %cmp, label %for.body, label %for.end7, !dbg !91

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !95
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !96
  %1 = bitcast i8* %call to i64*, !dbg !97
  store i64* %1, i64** %dataBuffer, align 8, !dbg !95
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !98
  %cmp1 = icmp eq i64* %2, null, !dbg !100
  br i1 %cmp1, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %for.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @exit(i32 noundef 1) #6, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %for.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !105, metadata !DIExpression()), !dbg !107
  store i64 0, i64* %i, align 8, !dbg !108
  br label %for.cond2, !dbg !110

for.cond2:                                        ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !111
  %cmp3 = icmp ult i64 %3, 100, !dbg !113
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !114

for.body4:                                        ; preds = %for.cond2
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !115
  %5 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !115
  store i64 5, i64* %arrayidx, align 8, !dbg !118
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body4
  %6 = load i64, i64* %i, align 8, !dbg !120
  %inc = add i64 %6, 1, !dbg !120
  store i64 %inc, i64* %i, align 8, !dbg !120
  br label %for.cond2, !dbg !121, !llvm.loop !122

for.end:                                          ; preds = %for.cond2
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !124
  store i64* %7, i64** %data, align 8, !dbg !125
  br label %for.inc5, !dbg !126

for.inc5:                                         ; preds = %for.end
  %8 = load i32, i32* %h, align 4, !dbg !127
  %inc6 = add nsw i32 %8, 1, !dbg !127
  store i32 %inc6, i32* %h, align 4, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end7:                                         ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !131
  %arrayidx8 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !131
  %10 = load i64, i64* %arrayidx8, align 8, !dbg !131
  call void @printLongLongLine(i64 noundef %10), !dbg !132
  %11 = load i64*, i64** %data, align 8, !dbg !133
  %12 = bitcast i64* %11 to i8*, !dbg !133
  call void @free(i8* noundef %12) #5, !dbg !134
  ret void, !dbg !135
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
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_17.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "5cc90ea4b2cce4e64c7f2413f33663f9")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !5, line: 27, baseType: !6)
!5 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !7, line: 44, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!8 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 5}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"PIE Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_17_bad", scope: !1, file: !1, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 25, type: !23)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DILocation(line: 25, column: 9, scope: !18)
!25 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 26, type: !3)
!26 = !DILocation(line: 26, column: 15, scope: !18)
!27 = !DILocation(line: 27, column: 10, scope: !18)
!28 = !DILocation(line: 28, column: 11, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !1, line: 28, column: 5)
!30 = !DILocation(line: 28, column: 9, scope: !29)
!31 = !DILocation(line: 28, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !1, line: 28, column: 5)
!33 = !DILocation(line: 28, column: 18, scope: !32)
!34 = !DILocation(line: 28, column: 5, scope: !29)
!35 = !DILocalVariable(name: "dataBuffer", scope: !36, file: !1, line: 32, type: !3)
!36 = distinct !DILexicalBlock(scope: !37, file: !1, line: 30, column: 9)
!37 = distinct !DILexicalBlock(scope: !32, file: !1, line: 29, column: 5)
!38 = !DILocation(line: 32, column: 23, scope: !36)
!39 = !DILocation(line: 32, column: 47, scope: !36)
!40 = !DILocation(line: 32, column: 36, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !42, file: !1, line: 34, type: !43)
!42 = distinct !DILexicalBlock(scope: !36, file: !1, line: 33, column: 13)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!45 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 34, column: 24, scope: !42)
!47 = !DILocation(line: 35, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !1, line: 35, column: 17)
!49 = !DILocation(line: 35, column: 22, scope: !48)
!50 = !DILocation(line: 35, column: 29, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !1, line: 35, column: 17)
!52 = !DILocation(line: 35, column: 31, scope: !51)
!53 = !DILocation(line: 35, column: 17, scope: !48)
!54 = !DILocation(line: 37, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !1, line: 36, column: 17)
!56 = !DILocation(line: 37, column: 32, scope: !55)
!57 = !DILocation(line: 37, column: 35, scope: !55)
!58 = !DILocation(line: 38, column: 17, scope: !55)
!59 = !DILocation(line: 35, column: 39, scope: !51)
!60 = !DILocation(line: 35, column: 17, scope: !51)
!61 = distinct !{!61, !53, !62, !63}
!62 = !DILocation(line: 38, column: 17, scope: !48)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 40, column: 20, scope: !36)
!65 = !DILocation(line: 40, column: 18, scope: !36)
!66 = !DILocation(line: 42, column: 5, scope: !37)
!67 = !DILocation(line: 28, column: 24, scope: !32)
!68 = !DILocation(line: 28, column: 5, scope: !32)
!69 = distinct !{!69, !34, !70, !63}
!70 = !DILocation(line: 42, column: 5, scope: !29)
!71 = !DILocation(line: 43, column: 23, scope: !18)
!72 = !DILocation(line: 43, column: 5, scope: !18)
!73 = !DILocation(line: 45, column: 10, scope: !18)
!74 = !DILocation(line: 45, column: 5, scope: !18)
!75 = !DILocation(line: 46, column: 1, scope: !18)
!76 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_17_good", scope: !1, file: !1, line: 83, type: !19, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!77 = !DILocation(line: 85, column: 5, scope: !76)
!78 = !DILocation(line: 86, column: 1, scope: !76)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!80 = !DILocalVariable(name: "h", scope: !79, file: !1, line: 55, type: !23)
!81 = !DILocation(line: 55, column: 9, scope: !79)
!82 = !DILocalVariable(name: "data", scope: !79, file: !1, line: 56, type: !3)
!83 = !DILocation(line: 56, column: 15, scope: !79)
!84 = !DILocation(line: 57, column: 10, scope: !79)
!85 = !DILocation(line: 58, column: 11, scope: !86)
!86 = distinct !DILexicalBlock(scope: !79, file: !1, line: 58, column: 5)
!87 = !DILocation(line: 58, column: 9, scope: !86)
!88 = !DILocation(line: 58, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !1, line: 58, column: 5)
!90 = !DILocation(line: 58, column: 18, scope: !89)
!91 = !DILocation(line: 58, column: 5, scope: !86)
!92 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !1, line: 62, type: !3)
!93 = distinct !DILexicalBlock(scope: !94, file: !1, line: 60, column: 9)
!94 = distinct !DILexicalBlock(scope: !89, file: !1, line: 59, column: 5)
!95 = !DILocation(line: 62, column: 23, scope: !93)
!96 = !DILocation(line: 62, column: 47, scope: !93)
!97 = !DILocation(line: 62, column: 36, scope: !93)
!98 = !DILocation(line: 63, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !1, line: 63, column: 17)
!100 = !DILocation(line: 63, column: 28, scope: !99)
!101 = !DILocation(line: 63, column: 17, scope: !93)
!102 = !DILocation(line: 65, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !1, line: 64, column: 13)
!104 = !DILocation(line: 66, column: 17, scope: !103)
!105 = !DILocalVariable(name: "i", scope: !106, file: !1, line: 69, type: !43)
!106 = distinct !DILexicalBlock(scope: !93, file: !1, line: 68, column: 13)
!107 = !DILocation(line: 69, column: 24, scope: !106)
!108 = !DILocation(line: 70, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !1, line: 70, column: 17)
!110 = !DILocation(line: 70, column: 22, scope: !109)
!111 = !DILocation(line: 70, column: 29, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !1, line: 70, column: 17)
!113 = !DILocation(line: 70, column: 31, scope: !112)
!114 = !DILocation(line: 70, column: 17, scope: !109)
!115 = !DILocation(line: 72, column: 21, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !1, line: 71, column: 17)
!117 = !DILocation(line: 72, column: 32, scope: !116)
!118 = !DILocation(line: 72, column: 35, scope: !116)
!119 = !DILocation(line: 73, column: 17, scope: !116)
!120 = !DILocation(line: 70, column: 39, scope: !112)
!121 = !DILocation(line: 70, column: 17, scope: !112)
!122 = distinct !{!122, !114, !123, !63}
!123 = !DILocation(line: 73, column: 17, scope: !109)
!124 = !DILocation(line: 75, column: 20, scope: !93)
!125 = !DILocation(line: 75, column: 18, scope: !93)
!126 = !DILocation(line: 77, column: 5, scope: !94)
!127 = !DILocation(line: 58, column: 24, scope: !89)
!128 = !DILocation(line: 58, column: 5, scope: !89)
!129 = distinct !{!129, !91, !130, !63}
!130 = !DILocation(line: 77, column: 5, scope: !86)
!131 = !DILocation(line: 78, column: 23, scope: !79)
!132 = !DILocation(line: 78, column: 5, scope: !79)
!133 = !DILocation(line: 80, column: 10, scope: !79)
!134 = !DILocation(line: 80, column: 5, scope: !79)
!135 = !DILocation(line: 81, column: 1, scope: !79)
