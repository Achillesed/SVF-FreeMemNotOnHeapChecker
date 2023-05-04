; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_alloca_11.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_11_bad() #0 !dbg !14 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i64* null, i64** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 800, align 16, !dbg !28
  %1 = bitcast i8* %0 to i64*, !dbg !29
  store i64* %1, i64** %dataBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %2, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !43
  %4 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !43
  store i64 5, i64* %arrayidx, align 8, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %5, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !53
  store i64* %6, i64** %data, align 8, !dbg !54
  br label %if.end, !dbg !55

if.end:                                           ; preds = %for.end, %entry
  %7 = load i64*, i64** %data, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !56
  %8 = load i64, i64* %arrayidx1, align 8, !dbg !56
  call void @printLongLine(i64 noundef %8), !dbg !57
  %9 = load i64*, i64** %data, align 8, !dbg !58
  %10 = bitcast i64* %9 to i8*, !dbg !58
  call void @free(i8* noundef %10) #5, !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_11_good() #0 !dbg !61 {
entry:
  call void @goodG2B1(), !dbg !62
  call void @goodG2B2(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !65 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !66, metadata !DIExpression()), !dbg !67
  store i64* null, i64** %data, align 8, !dbg !68
  %call = call i32 (...) @globalReturnsFalse(), !dbg !69
  %tobool = icmp ne i32 %call, 0, !dbg !69
  br i1 %tobool, label %if.then, label %if.else, !dbg !71

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !72
  br label %if.end4, !dbg !74

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !78
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !79
  %0 = bitcast i8* %call1 to i64*, !dbg !80
  store i64* %0, i64** %dataBuffer, align 8, !dbg !78
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !81
  %cmp = icmp eq i64* %1, null, !dbg !83
  br i1 %cmp, label %if.then2, label %if.end, !dbg !84

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @exit(i32 noundef 1) #6, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !88, metadata !DIExpression()), !dbg !90
  store i64 0, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !94
  %cmp3 = icmp ult i64 %2, 100, !dbg !96
  br i1 %cmp3, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !98
  %4 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !98
  store i64 5, i64* %arrayidx, align 8, !dbg !101
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !103
  %inc = add i64 %5, 1, !dbg !103
  store i64 %inc, i64* %i, align 8, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !107
  store i64* %6, i64** %data, align 8, !dbg !108
  br label %if.end4

if.end4:                                          ; preds = %for.end, %if.then
  %7 = load i64*, i64** %data, align 8, !dbg !109
  %arrayidx5 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !109
  %8 = load i64, i64* %arrayidx5, align 8, !dbg !109
  call void @printLongLine(i64 noundef %8), !dbg !110
  %9 = load i64*, i64** %data, align 8, !dbg !111
  %10 = bitcast i64* %9 to i8*, !dbg !111
  call void @free(i8* noundef %10) #5, !dbg !112
  ret void, !dbg !113
}

declare i32 @globalReturnsFalse(...) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !114 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !115, metadata !DIExpression()), !dbg !116
  store i64* null, i64** %data, align 8, !dbg !117
  %call = call i32 (...) @globalReturnsTrue(), !dbg !118
  %tobool = icmp ne i32 %call, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.end4, !dbg !120

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !121, metadata !DIExpression()), !dbg !124
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !125
  %0 = bitcast i8* %call1 to i64*, !dbg !126
  store i64* %0, i64** %dataBuffer, align 8, !dbg !124
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !127
  %cmp = icmp eq i64* %1, null, !dbg !129
  br i1 %cmp, label %if.then2, label %if.end, !dbg !130

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !131
  call void @exit(i32 noundef 1) #6, !dbg !133
  unreachable, !dbg !133

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !140
  %cmp3 = icmp ult i64 %2, 100, !dbg !142
  br i1 %cmp3, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !144
  %4 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !144
  store i64 5, i64* %arrayidx, align 8, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %5, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !153
  store i64* %6, i64** %data, align 8, !dbg !154
  br label %if.end4, !dbg !155

if.end4:                                          ; preds = %for.end, %entry
  %7 = load i64*, i64** %data, align 8, !dbg !156
  %arrayidx5 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !156
  %8 = load i64, i64* %arrayidx5, align 8, !dbg !156
  call void @printLongLine(i64 noundef %8), !dbg !157
  %9 = load i64*, i64** %data, align 8, !dbg !158
  %10 = bitcast i64* %9 to i8*, !dbg !158
  call void @free(i8* noundef %10) #5, !dbg !159
  ret void, !dbg !160
}

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_11.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "ade6e1d997ade681e7e2491b57dc457d")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_11_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !1, line: 31, type: !3)
!25 = distinct !DILexicalBlock(scope: !26, file: !1, line: 29, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !1, line: 28, column: 5)
!27 = !DILocation(line: 31, column: 20, scope: !25)
!28 = !DILocation(line: 31, column: 41, scope: !25)
!29 = !DILocation(line: 31, column: 33, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !31, file: !1, line: 33, type: !32)
!31 = distinct !DILexicalBlock(scope: !25, file: !1, line: 32, column: 13)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !33, line: 46, baseType: !34)
!33 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!34 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 33, column: 24, scope: !31)
!36 = !DILocation(line: 34, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !1, line: 34, column: 17)
!38 = !DILocation(line: 34, column: 22, scope: !37)
!39 = !DILocation(line: 34, column: 29, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !1, line: 34, column: 17)
!41 = !DILocation(line: 34, column: 31, scope: !40)
!42 = !DILocation(line: 34, column: 17, scope: !37)
!43 = !DILocation(line: 36, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !1, line: 35, column: 17)
!45 = !DILocation(line: 36, column: 32, scope: !44)
!46 = !DILocation(line: 36, column: 35, scope: !44)
!47 = !DILocation(line: 37, column: 17, scope: !44)
!48 = !DILocation(line: 34, column: 39, scope: !40)
!49 = !DILocation(line: 34, column: 17, scope: !40)
!50 = distinct !{!50, !42, !51, !52}
!51 = !DILocation(line: 37, column: 17, scope: !37)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 39, column: 20, scope: !25)
!54 = !DILocation(line: 39, column: 18, scope: !25)
!55 = !DILocation(line: 41, column: 5, scope: !26)
!56 = !DILocation(line: 42, column: 19, scope: !14)
!57 = !DILocation(line: 42, column: 5, scope: !14)
!58 = !DILocation(line: 44, column: 10, scope: !14)
!59 = !DILocation(line: 44, column: 5, scope: !14)
!60 = !DILocation(line: 45, column: 1, scope: !14)
!61 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_11_good", scope: !1, file: !1, line: 116, type: !15, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!62 = !DILocation(line: 118, column: 5, scope: !61)
!63 = !DILocation(line: 119, column: 5, scope: !61)
!64 = !DILocation(line: 120, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!66 = !DILocalVariable(name: "data", scope: !65, file: !1, line: 54, type: !3)
!67 = !DILocation(line: 54, column: 12, scope: !65)
!68 = !DILocation(line: 55, column: 10, scope: !65)
!69 = !DILocation(line: 56, column: 8, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !1, line: 56, column: 8)
!71 = !DILocation(line: 56, column: 8, scope: !65)
!72 = !DILocation(line: 59, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !1, line: 57, column: 5)
!74 = !DILocation(line: 60, column: 5, scope: !73)
!75 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !1, line: 65, type: !3)
!76 = distinct !DILexicalBlock(scope: !77, file: !1, line: 63, column: 9)
!77 = distinct !DILexicalBlock(scope: !70, file: !1, line: 62, column: 5)
!78 = !DILocation(line: 65, column: 20, scope: !76)
!79 = !DILocation(line: 65, column: 41, scope: !76)
!80 = !DILocation(line: 65, column: 33, scope: !76)
!81 = !DILocation(line: 66, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !1, line: 66, column: 17)
!83 = !DILocation(line: 66, column: 28, scope: !82)
!84 = !DILocation(line: 66, column: 17, scope: !76)
!85 = !DILocation(line: 68, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !1, line: 67, column: 13)
!87 = !DILocation(line: 69, column: 17, scope: !86)
!88 = !DILocalVariable(name: "i", scope: !89, file: !1, line: 72, type: !32)
!89 = distinct !DILexicalBlock(scope: !76, file: !1, line: 71, column: 13)
!90 = !DILocation(line: 72, column: 24, scope: !89)
!91 = !DILocation(line: 73, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !1, line: 73, column: 17)
!93 = !DILocation(line: 73, column: 22, scope: !92)
!94 = !DILocation(line: 73, column: 29, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !1, line: 73, column: 17)
!96 = !DILocation(line: 73, column: 31, scope: !95)
!97 = !DILocation(line: 73, column: 17, scope: !92)
!98 = !DILocation(line: 75, column: 21, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !1, line: 74, column: 17)
!100 = !DILocation(line: 75, column: 32, scope: !99)
!101 = !DILocation(line: 75, column: 35, scope: !99)
!102 = !DILocation(line: 76, column: 17, scope: !99)
!103 = !DILocation(line: 73, column: 39, scope: !95)
!104 = !DILocation(line: 73, column: 17, scope: !95)
!105 = distinct !{!105, !97, !106, !52}
!106 = !DILocation(line: 76, column: 17, scope: !92)
!107 = !DILocation(line: 78, column: 20, scope: !76)
!108 = !DILocation(line: 78, column: 18, scope: !76)
!109 = !DILocation(line: 81, column: 19, scope: !65)
!110 = !DILocation(line: 81, column: 5, scope: !65)
!111 = !DILocation(line: 83, column: 10, scope: !65)
!112 = !DILocation(line: 83, column: 5, scope: !65)
!113 = !DILocation(line: 84, column: 1, scope: !65)
!114 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!115 = !DILocalVariable(name: "data", scope: !114, file: !1, line: 89, type: !3)
!116 = !DILocation(line: 89, column: 12, scope: !114)
!117 = !DILocation(line: 90, column: 10, scope: !114)
!118 = !DILocation(line: 91, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !114, file: !1, line: 91, column: 8)
!120 = !DILocation(line: 91, column: 8, scope: !114)
!121 = !DILocalVariable(name: "dataBuffer", scope: !122, file: !1, line: 95, type: !3)
!122 = distinct !DILexicalBlock(scope: !123, file: !1, line: 93, column: 9)
!123 = distinct !DILexicalBlock(scope: !119, file: !1, line: 92, column: 5)
!124 = !DILocation(line: 95, column: 20, scope: !122)
!125 = !DILocation(line: 95, column: 41, scope: !122)
!126 = !DILocation(line: 95, column: 33, scope: !122)
!127 = !DILocation(line: 96, column: 17, scope: !128)
!128 = distinct !DILexicalBlock(scope: !122, file: !1, line: 96, column: 17)
!129 = !DILocation(line: 96, column: 28, scope: !128)
!130 = !DILocation(line: 96, column: 17, scope: !122)
!131 = !DILocation(line: 98, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !1, line: 97, column: 13)
!133 = !DILocation(line: 99, column: 17, scope: !132)
!134 = !DILocalVariable(name: "i", scope: !135, file: !1, line: 102, type: !32)
!135 = distinct !DILexicalBlock(scope: !122, file: !1, line: 101, column: 13)
!136 = !DILocation(line: 102, column: 24, scope: !135)
!137 = !DILocation(line: 103, column: 24, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !1, line: 103, column: 17)
!139 = !DILocation(line: 103, column: 22, scope: !138)
!140 = !DILocation(line: 103, column: 29, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !1, line: 103, column: 17)
!142 = !DILocation(line: 103, column: 31, scope: !141)
!143 = !DILocation(line: 103, column: 17, scope: !138)
!144 = !DILocation(line: 105, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !1, line: 104, column: 17)
!146 = !DILocation(line: 105, column: 32, scope: !145)
!147 = !DILocation(line: 105, column: 35, scope: !145)
!148 = !DILocation(line: 106, column: 17, scope: !145)
!149 = !DILocation(line: 103, column: 39, scope: !141)
!150 = !DILocation(line: 103, column: 17, scope: !141)
!151 = distinct !{!151, !143, !152, !52}
!152 = !DILocation(line: 106, column: 17, scope: !138)
!153 = !DILocation(line: 108, column: 20, scope: !122)
!154 = !DILocation(line: 108, column: 18, scope: !122)
!155 = !DILocation(line: 110, column: 5, scope: !123)
!156 = !DILocation(line: 111, column: 19, scope: !114)
!157 = !DILocation(line: 111, column: 5, scope: !114)
!158 = !DILocation(line: 113, column: 10, scope: !114)
!159 = !DILocation(line: 113, column: 5, scope: !114)
!160 = !DILocation(line: 114, column: 1, scope: !114)
