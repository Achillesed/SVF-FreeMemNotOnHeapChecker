; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_17.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_17_bad() #0 !dbg !18 {
entry:
  %i = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBuffer = alloca [100 x i64], align 16
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
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !35, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !42, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i1, align 8, !dbg !48
  br label %for.cond2, !dbg !50

for.cond2:                                        ; preds = %for.inc, %for.body
  %1 = load i64, i64* %i1, align 8, !dbg !51
  %cmp3 = icmp ult i64 %1, 100, !dbg !53
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !54

for.body4:                                        ; preds = %for.cond2
  %2 = load i64, i64* %i1, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %2, !dbg !57
  store i64 5, i64* %arrayidx, align 8, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body4
  %3 = load i64, i64* %i1, align 8, !dbg !60
  %inc = add i64 %3, 1, !dbg !60
  store i64 %inc, i64* %i1, align 8, !dbg !60
  br label %for.cond2, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond2
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !65
  store i64* %arraydecay, i64** %data, align 8, !dbg !66
  br label %for.inc5, !dbg !67

for.inc5:                                         ; preds = %for.end
  %4 = load i32, i32* %i, align 4, !dbg !68
  %inc6 = add nsw i32 %4, 1, !dbg !68
  store i32 %inc6, i32* %i, align 4, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end7:                                         ; preds = %for.cond
  %5 = load i64*, i64** %data, align 8, !dbg !72
  %arrayidx8 = getelementptr inbounds i64, i64* %5, i64 0, !dbg !72
  %6 = load i64, i64* %arrayidx8, align 8, !dbg !72
  call void @printLongLongLine(i64 noundef %6), !dbg !73
  %7 = load i64*, i64** %data, align 8, !dbg !74
  %8 = bitcast i64* %7 to i8*, !dbg !74
  call void @free(i8* noundef %8) #5, !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_17_good() #0 !dbg !77 {
entry:
  call void @goodG2B(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %h = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i64** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i64* null, i64** %data, align 8, !dbg !85
  store i32 0, i32* %h, align 4, !dbg !86
  br label %for.cond, !dbg !88

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32, i32* %h, align 4, !dbg !89
  %cmp = icmp slt i32 %0, 1, !dbg !91
  br i1 %cmp, label %for.body, label %for.end7, !dbg !92

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !96
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !97
  %1 = bitcast i8* %call to i64*, !dbg !98
  store i64* %1, i64** %dataBuffer, align 8, !dbg !96
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !99
  %cmp1 = icmp eq i64* %2, null, !dbg !101
  br i1 %cmp1, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %for.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @exit(i32 noundef 1) #6, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %for.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !106, metadata !DIExpression()), !dbg !108
  store i64 0, i64* %i, align 8, !dbg !109
  br label %for.cond2, !dbg !111

for.cond2:                                        ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !112
  %cmp3 = icmp ult i64 %3, 100, !dbg !114
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !115

for.body4:                                        ; preds = %for.cond2
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !116
  %5 = load i64, i64* %i, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !116
  store i64 5, i64* %arrayidx, align 8, !dbg !119
  br label %for.inc, !dbg !120

for.inc:                                          ; preds = %for.body4
  %6 = load i64, i64* %i, align 8, !dbg !121
  %inc = add i64 %6, 1, !dbg !121
  store i64 %inc, i64* %i, align 8, !dbg !121
  br label %for.cond2, !dbg !122, !llvm.loop !123

for.end:                                          ; preds = %for.cond2
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !125
  store i64* %7, i64** %data, align 8, !dbg !126
  br label %for.inc5, !dbg !127

for.inc5:                                         ; preds = %for.end
  %8 = load i32, i32* %h, align 4, !dbg !128
  %inc6 = add nsw i32 %8, 1, !dbg !128
  store i32 %inc6, i32* %h, align 4, !dbg !128
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end7:                                         ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !132
  %arrayidx8 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !132
  %10 = load i64, i64* %arrayidx8, align 8, !dbg !132
  call void @printLongLongLine(i64 noundef %10), !dbg !133
  %11 = load i64*, i64** %data, align 8, !dbg !134
  %12 = bitcast i64* %11 to i8*, !dbg !134
  call void @free(i8* noundef %12) #5, !dbg !135
  ret void, !dbg !136
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_17.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "373c2a035579595f36c9141d69c6803b")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_17_bad", scope: !1, file: !1, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
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
!35 = !DILocalVariable(name: "dataBuffer", scope: !36, file: !1, line: 32, type: !38)
!36 = distinct !DILexicalBlock(scope: !37, file: !1, line: 30, column: 9)
!37 = distinct !DILexicalBlock(scope: !32, file: !1, line: 29, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 32, column: 21, scope: !36)
!42 = !DILocalVariable(name: "i", scope: !43, file: !1, line: 34, type: !44)
!43 = distinct !DILexicalBlock(scope: !36, file: !1, line: 33, column: 13)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 34, column: 24, scope: !43)
!48 = !DILocation(line: 35, column: 24, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !1, line: 35, column: 17)
!50 = !DILocation(line: 35, column: 22, scope: !49)
!51 = !DILocation(line: 35, column: 29, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !1, line: 35, column: 17)
!53 = !DILocation(line: 35, column: 31, scope: !52)
!54 = !DILocation(line: 35, column: 17, scope: !49)
!55 = !DILocation(line: 37, column: 32, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !1, line: 36, column: 17)
!57 = !DILocation(line: 37, column: 21, scope: !56)
!58 = !DILocation(line: 37, column: 35, scope: !56)
!59 = !DILocation(line: 38, column: 17, scope: !56)
!60 = !DILocation(line: 35, column: 39, scope: !52)
!61 = !DILocation(line: 35, column: 17, scope: !52)
!62 = distinct !{!62, !54, !63, !64}
!63 = !DILocation(line: 38, column: 17, scope: !49)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 40, column: 20, scope: !36)
!66 = !DILocation(line: 40, column: 18, scope: !36)
!67 = !DILocation(line: 42, column: 5, scope: !37)
!68 = !DILocation(line: 28, column: 24, scope: !32)
!69 = !DILocation(line: 28, column: 5, scope: !32)
!70 = distinct !{!70, !34, !71, !64}
!71 = !DILocation(line: 42, column: 5, scope: !29)
!72 = !DILocation(line: 43, column: 23, scope: !18)
!73 = !DILocation(line: 43, column: 5, scope: !18)
!74 = !DILocation(line: 45, column: 10, scope: !18)
!75 = !DILocation(line: 45, column: 5, scope: !18)
!76 = !DILocation(line: 46, column: 1, scope: !18)
!77 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_17_good", scope: !1, file: !1, line: 83, type: !19, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!78 = !DILocation(line: 85, column: 5, scope: !77)
!79 = !DILocation(line: 86, column: 1, scope: !77)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!81 = !DILocalVariable(name: "h", scope: !80, file: !1, line: 55, type: !23)
!82 = !DILocation(line: 55, column: 9, scope: !80)
!83 = !DILocalVariable(name: "data", scope: !80, file: !1, line: 56, type: !3)
!84 = !DILocation(line: 56, column: 15, scope: !80)
!85 = !DILocation(line: 57, column: 10, scope: !80)
!86 = !DILocation(line: 58, column: 11, scope: !87)
!87 = distinct !DILexicalBlock(scope: !80, file: !1, line: 58, column: 5)
!88 = !DILocation(line: 58, column: 9, scope: !87)
!89 = !DILocation(line: 58, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !1, line: 58, column: 5)
!91 = !DILocation(line: 58, column: 18, scope: !90)
!92 = !DILocation(line: 58, column: 5, scope: !87)
!93 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !1, line: 62, type: !3)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 60, column: 9)
!95 = distinct !DILexicalBlock(scope: !90, file: !1, line: 59, column: 5)
!96 = !DILocation(line: 62, column: 23, scope: !94)
!97 = !DILocation(line: 62, column: 47, scope: !94)
!98 = !DILocation(line: 62, column: 36, scope: !94)
!99 = !DILocation(line: 63, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !1, line: 63, column: 17)
!101 = !DILocation(line: 63, column: 28, scope: !100)
!102 = !DILocation(line: 63, column: 17, scope: !94)
!103 = !DILocation(line: 65, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !1, line: 64, column: 13)
!105 = !DILocation(line: 66, column: 17, scope: !104)
!106 = !DILocalVariable(name: "i", scope: !107, file: !1, line: 69, type: !44)
!107 = distinct !DILexicalBlock(scope: !94, file: !1, line: 68, column: 13)
!108 = !DILocation(line: 69, column: 24, scope: !107)
!109 = !DILocation(line: 70, column: 24, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !1, line: 70, column: 17)
!111 = !DILocation(line: 70, column: 22, scope: !110)
!112 = !DILocation(line: 70, column: 29, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !1, line: 70, column: 17)
!114 = !DILocation(line: 70, column: 31, scope: !113)
!115 = !DILocation(line: 70, column: 17, scope: !110)
!116 = !DILocation(line: 72, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !1, line: 71, column: 17)
!118 = !DILocation(line: 72, column: 32, scope: !117)
!119 = !DILocation(line: 72, column: 35, scope: !117)
!120 = !DILocation(line: 73, column: 17, scope: !117)
!121 = !DILocation(line: 70, column: 39, scope: !113)
!122 = !DILocation(line: 70, column: 17, scope: !113)
!123 = distinct !{!123, !115, !124, !64}
!124 = !DILocation(line: 73, column: 17, scope: !110)
!125 = !DILocation(line: 75, column: 20, scope: !94)
!126 = !DILocation(line: 75, column: 18, scope: !94)
!127 = !DILocation(line: 77, column: 5, scope: !95)
!128 = !DILocation(line: 58, column: 24, scope: !90)
!129 = !DILocation(line: 58, column: 5, scope: !90)
!130 = distinct !{!130, !92, !131, !64}
!131 = !DILocation(line: 77, column: 5, scope: !87)
!132 = !DILocation(line: 78, column: 23, scope: !80)
!133 = !DILocation(line: 78, column: 5, scope: !80)
!134 = !DILocation(line: 80, column: 10, scope: !80)
!135 = !DILocation(line: 80, column: 5, scope: !80)
!136 = !DILocation(line: 81, column: 1, scope: !80)
