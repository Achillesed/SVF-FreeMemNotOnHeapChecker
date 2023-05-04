; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_04.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_04_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !42
  %cmp = icmp ult i64 %0, 100, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %1, !dbg !48
  store i64 5, i64* %arrayidx, align 8, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %2, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !56
  store i64* %arraydecay, i64** %data, align 8, !dbg !57
  %3 = load i64*, i64** %data, align 8, !dbg !58
  %arrayidx1 = getelementptr inbounds i64, i64* %3, i64 0, !dbg !58
  %4 = load i64, i64* %arrayidx1, align 8, !dbg !58
  call void @printLongLongLine(i64 noundef %4), !dbg !59
  %5 = load i64*, i64** %data, align 8, !dbg !60
  %6 = bitcast i64* %5 to i8*, !dbg !60
  call void @free(i8* noundef %6) #5, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_04_good() #0 !dbg !63 {
entry:
  call void @goodG2B1(), !dbg !64
  call void @goodG2B2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !67 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i64* null, i64** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !75
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !76
  %0 = bitcast i8* %call to i64*, !dbg !77
  store i64* %0, i64** %dataBuffer, align 8, !dbg !75
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !78
  %cmp = icmp eq i64* %1, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @exit(i32 noundef 1) #6, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !85, metadata !DIExpression()), !dbg !87
  store i64 0, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !91
  %cmp1 = icmp ult i64 %2, 100, !dbg !93
  br i1 %cmp1, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !95
  %4 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !95
  store i64 5, i64* %arrayidx, align 8, !dbg !98
  br label %for.inc, !dbg !99

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !100
  %inc = add i64 %5, 1, !dbg !100
  store i64 %inc, i64* %i, align 8, !dbg !100
  br label %for.cond, !dbg !101, !llvm.loop !102

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !104
  store i64* %6, i64** %data, align 8, !dbg !105
  %7 = load i64*, i64** %data, align 8, !dbg !106
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !106
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !106
  call void @printLongLongLine(i64 noundef %8), !dbg !107
  %9 = load i64*, i64** %data, align 8, !dbg !108
  %10 = bitcast i64* %9 to i8*, !dbg !108
  call void @free(i8* noundef %10) #5, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !112, metadata !DIExpression()), !dbg !113
  store i64* null, i64** %data, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !115, metadata !DIExpression()), !dbg !119
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !120
  %0 = bitcast i8* %call to i64*, !dbg !121
  store i64* %0, i64** %dataBuffer, align 8, !dbg !119
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !122
  %cmp = icmp eq i64* %1, null, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !126
  call void @exit(i32 noundef 1) #6, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !135
  %cmp1 = icmp ult i64 %2, 100, !dbg !137
  br i1 %cmp1, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !139
  %4 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !139
  store i64 5, i64* %arrayidx, align 8, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %5, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !148
  store i64* %6, i64** %data, align 8, !dbg !149
  %7 = load i64*, i64** %data, align 8, !dbg !150
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !150
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !150
  call void @printLongLongLine(i64 noundef %8), !dbg !151
  %9 = load i64*, i64** %data, align 8, !dbg !152
  %10 = bitcast i64* %9 to i8*, !dbg !152
  call void @free(i8* noundef %10) #5, !dbg !153
  ret void, !dbg !154
}

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_04.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "7a39488a0b105503098e6fa847a96494")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_04_bad", scope: !1, file: !1, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 32, type: !3)
!23 = !DILocation(line: 32, column: 15, scope: !18)
!24 = !DILocation(line: 33, column: 10, scope: !18)
!25 = !DILocalVariable(name: "dataBuffer", scope: !26, file: !1, line: 38, type: !29)
!26 = distinct !DILexicalBlock(scope: !27, file: !1, line: 36, column: 9)
!27 = distinct !DILexicalBlock(scope: !28, file: !1, line: 35, column: 5)
!28 = distinct !DILexicalBlock(scope: !18, file: !1, line: 34, column: 8)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 38, column: 21, scope: !26)
!33 = !DILocalVariable(name: "i", scope: !34, file: !1, line: 40, type: !35)
!34 = distinct !DILexicalBlock(scope: !26, file: !1, line: 39, column: 13)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!37 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 40, column: 24, scope: !34)
!39 = !DILocation(line: 41, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !1, line: 41, column: 17)
!41 = !DILocation(line: 41, column: 22, scope: !40)
!42 = !DILocation(line: 41, column: 29, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !1, line: 41, column: 17)
!44 = !DILocation(line: 41, column: 31, scope: !43)
!45 = !DILocation(line: 41, column: 17, scope: !40)
!46 = !DILocation(line: 43, column: 32, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !1, line: 42, column: 17)
!48 = !DILocation(line: 43, column: 21, scope: !47)
!49 = !DILocation(line: 43, column: 35, scope: !47)
!50 = !DILocation(line: 44, column: 17, scope: !47)
!51 = !DILocation(line: 41, column: 39, scope: !43)
!52 = !DILocation(line: 41, column: 17, scope: !43)
!53 = distinct !{!53, !45, !54, !55}
!54 = !DILocation(line: 44, column: 17, scope: !40)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 46, column: 20, scope: !26)
!57 = !DILocation(line: 46, column: 18, scope: !26)
!58 = !DILocation(line: 49, column: 23, scope: !18)
!59 = !DILocation(line: 49, column: 5, scope: !18)
!60 = !DILocation(line: 51, column: 10, scope: !18)
!61 = !DILocation(line: 51, column: 5, scope: !18)
!62 = !DILocation(line: 52, column: 1, scope: !18)
!63 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_04_good", scope: !1, file: !1, line: 123, type: !19, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!64 = !DILocation(line: 125, column: 5, scope: !63)
!65 = !DILocation(line: 126, column: 5, scope: !63)
!66 = !DILocation(line: 127, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 59, type: !19, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!68 = !DILocalVariable(name: "data", scope: !67, file: !1, line: 61, type: !3)
!69 = !DILocation(line: 61, column: 15, scope: !67)
!70 = !DILocation(line: 62, column: 10, scope: !67)
!71 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !1, line: 72, type: !3)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 70, column: 9)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 69, column: 5)
!74 = distinct !DILexicalBlock(scope: !67, file: !1, line: 63, column: 8)
!75 = !DILocation(line: 72, column: 23, scope: !72)
!76 = !DILocation(line: 72, column: 47, scope: !72)
!77 = !DILocation(line: 72, column: 36, scope: !72)
!78 = !DILocation(line: 73, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !72, file: !1, line: 73, column: 17)
!80 = !DILocation(line: 73, column: 28, scope: !79)
!81 = !DILocation(line: 73, column: 17, scope: !72)
!82 = !DILocation(line: 75, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !1, line: 74, column: 13)
!84 = !DILocation(line: 76, column: 17, scope: !83)
!85 = !DILocalVariable(name: "i", scope: !86, file: !1, line: 79, type: !35)
!86 = distinct !DILexicalBlock(scope: !72, file: !1, line: 78, column: 13)
!87 = !DILocation(line: 79, column: 24, scope: !86)
!88 = !DILocation(line: 80, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !1, line: 80, column: 17)
!90 = !DILocation(line: 80, column: 22, scope: !89)
!91 = !DILocation(line: 80, column: 29, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !1, line: 80, column: 17)
!93 = !DILocation(line: 80, column: 31, scope: !92)
!94 = !DILocation(line: 80, column: 17, scope: !89)
!95 = !DILocation(line: 82, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !1, line: 81, column: 17)
!97 = !DILocation(line: 82, column: 32, scope: !96)
!98 = !DILocation(line: 82, column: 35, scope: !96)
!99 = !DILocation(line: 83, column: 17, scope: !96)
!100 = !DILocation(line: 80, column: 39, scope: !92)
!101 = !DILocation(line: 80, column: 17, scope: !92)
!102 = distinct !{!102, !94, !103, !55}
!103 = !DILocation(line: 83, column: 17, scope: !89)
!104 = !DILocation(line: 85, column: 20, scope: !72)
!105 = !DILocation(line: 85, column: 18, scope: !72)
!106 = !DILocation(line: 88, column: 23, scope: !67)
!107 = !DILocation(line: 88, column: 5, scope: !67)
!108 = !DILocation(line: 90, column: 10, scope: !67)
!109 = !DILocation(line: 90, column: 5, scope: !67)
!110 = !DILocation(line: 91, column: 1, scope: !67)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 94, type: !19, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!112 = !DILocalVariable(name: "data", scope: !111, file: !1, line: 96, type: !3)
!113 = !DILocation(line: 96, column: 15, scope: !111)
!114 = !DILocation(line: 97, column: 10, scope: !111)
!115 = !DILocalVariable(name: "dataBuffer", scope: !116, file: !1, line: 102, type: !3)
!116 = distinct !DILexicalBlock(scope: !117, file: !1, line: 100, column: 9)
!117 = distinct !DILexicalBlock(scope: !118, file: !1, line: 99, column: 5)
!118 = distinct !DILexicalBlock(scope: !111, file: !1, line: 98, column: 8)
!119 = !DILocation(line: 102, column: 23, scope: !116)
!120 = !DILocation(line: 102, column: 47, scope: !116)
!121 = !DILocation(line: 102, column: 36, scope: !116)
!122 = !DILocation(line: 103, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !116, file: !1, line: 103, column: 17)
!124 = !DILocation(line: 103, column: 28, scope: !123)
!125 = !DILocation(line: 103, column: 17, scope: !116)
!126 = !DILocation(line: 105, column: 17, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !1, line: 104, column: 13)
!128 = !DILocation(line: 106, column: 17, scope: !127)
!129 = !DILocalVariable(name: "i", scope: !130, file: !1, line: 109, type: !35)
!130 = distinct !DILexicalBlock(scope: !116, file: !1, line: 108, column: 13)
!131 = !DILocation(line: 109, column: 24, scope: !130)
!132 = !DILocation(line: 110, column: 24, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !1, line: 110, column: 17)
!134 = !DILocation(line: 110, column: 22, scope: !133)
!135 = !DILocation(line: 110, column: 29, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !1, line: 110, column: 17)
!137 = !DILocation(line: 110, column: 31, scope: !136)
!138 = !DILocation(line: 110, column: 17, scope: !133)
!139 = !DILocation(line: 112, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !1, line: 111, column: 17)
!141 = !DILocation(line: 112, column: 32, scope: !140)
!142 = !DILocation(line: 112, column: 35, scope: !140)
!143 = !DILocation(line: 113, column: 17, scope: !140)
!144 = !DILocation(line: 110, column: 39, scope: !136)
!145 = !DILocation(line: 110, column: 17, scope: !136)
!146 = distinct !{!146, !138, !147, !55}
!147 = !DILocation(line: 113, column: 17, scope: !133)
!148 = !DILocation(line: 115, column: 20, scope: !116)
!149 = !DILocation(line: 115, column: 18, scope: !116)
!150 = !DILocation(line: 118, column: 23, scope: !111)
!151 = !DILocation(line: 118, column: 5, scope: !111)
!152 = !DILocation(line: 120, column: 10, scope: !111)
!153 = !DILocation(line: 120, column: 5, scope: !111)
!154 = !DILocation(line: 121, column: 1, scope: !111)
