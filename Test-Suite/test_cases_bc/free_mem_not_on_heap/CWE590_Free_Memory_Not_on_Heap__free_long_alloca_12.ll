; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_alloca_12.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %dataBuffer1 = alloca i64*, align 8
  %i5 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i64* null, i64** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else, !dbg !23

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
  br label %if.end13, !dbg !55

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer1, metadata !56, metadata !DIExpression()), !dbg !59
  %call2 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !60
  %7 = bitcast i8* %call2 to i64*, !dbg !61
  store i64* %7, i64** %dataBuffer1, align 8, !dbg !59
  %8 = load i64*, i64** %dataBuffer1, align 8, !dbg !62
  %cmp3 = icmp eq i64* %8, null, !dbg !64
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !65

if.then4:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @exit(i32 noundef 1) #6, !dbg !68
  unreachable, !dbg !68

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i5, metadata !69, metadata !DIExpression()), !dbg !71
  store i64 0, i64* %i5, align 8, !dbg !72
  br label %for.cond6, !dbg !74

for.cond6:                                        ; preds = %for.inc10, %if.end
  %9 = load i64, i64* %i5, align 8, !dbg !75
  %cmp7 = icmp ult i64 %9, 100, !dbg !77
  br i1 %cmp7, label %for.body8, label %for.end12, !dbg !78

for.body8:                                        ; preds = %for.cond6
  %10 = load i64*, i64** %dataBuffer1, align 8, !dbg !79
  %11 = load i64, i64* %i5, align 8, !dbg !81
  %arrayidx9 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !79
  store i64 5, i64* %arrayidx9, align 8, !dbg !82
  br label %for.inc10, !dbg !83

for.inc10:                                        ; preds = %for.body8
  %12 = load i64, i64* %i5, align 8, !dbg !84
  %inc11 = add i64 %12, 1, !dbg !84
  store i64 %inc11, i64* %i5, align 8, !dbg !84
  br label %for.cond6, !dbg !85, !llvm.loop !86

for.end12:                                        ; preds = %for.cond6
  %13 = load i64*, i64** %dataBuffer1, align 8, !dbg !88
  store i64* %13, i64** %data, align 8, !dbg !89
  br label %if.end13

if.end13:                                         ; preds = %for.end12, %for.end
  %14 = load i64*, i64** %data, align 8, !dbg !90
  %arrayidx14 = getelementptr inbounds i64, i64* %14, i64 0, !dbg !90
  %15 = load i64, i64* %arrayidx14, align 8, !dbg !90
  call void @printLongLine(i64 noundef %15), !dbg !91
  %16 = load i64*, i64** %data, align 8, !dbg !92
  %17 = bitcast i64* %16 to i8*, !dbg !92
  call void @free(i8* noundef %17) #5, !dbg !93
  ret void, !dbg !94
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_12_good() #0 !dbg !95 {
entry:
  call void @goodG2B(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %dataBuffer4 = alloca i64*, align 8
  %i9 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i64* null, i64** %data, align 8, !dbg !101
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !102
  %tobool = icmp ne i32 %call, 0, !dbg !102
  br i1 %tobool, label %if.then, label %if.else, !dbg !104

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !108
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !109
  %0 = bitcast i8* %call1 to i64*, !dbg !110
  store i64* %0, i64** %dataBuffer, align 8, !dbg !108
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !111
  %cmp = icmp eq i64* %1, null, !dbg !113
  br i1 %cmp, label %if.then2, label %if.end, !dbg !114

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !115
  call void @exit(i32 noundef 1) #6, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !124
  %cmp3 = icmp ult i64 %2, 100, !dbg !126
  br i1 %cmp3, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !128
  %4 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !128
  store i64 5, i64* %arrayidx, align 8, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !133
  %inc = add i64 %5, 1, !dbg !133
  store i64 %inc, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !137
  store i64* %6, i64** %data, align 8, !dbg !138
  br label %if.end17, !dbg !139

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer4, metadata !140, metadata !DIExpression()), !dbg !143
  %call5 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !144
  %7 = bitcast i8* %call5 to i64*, !dbg !145
  store i64* %7, i64** %dataBuffer4, align 8, !dbg !143
  %8 = load i64*, i64** %dataBuffer4, align 8, !dbg !146
  %cmp6 = icmp eq i64* %8, null, !dbg !148
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !149

if.then7:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !150
  call void @exit(i32 noundef 1) #6, !dbg !152
  unreachable, !dbg !152

if.end8:                                          ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i9, metadata !153, metadata !DIExpression()), !dbg !155
  store i64 0, i64* %i9, align 8, !dbg !156
  br label %for.cond10, !dbg !158

for.cond10:                                       ; preds = %for.inc14, %if.end8
  %9 = load i64, i64* %i9, align 8, !dbg !159
  %cmp11 = icmp ult i64 %9, 100, !dbg !161
  br i1 %cmp11, label %for.body12, label %for.end16, !dbg !162

for.body12:                                       ; preds = %for.cond10
  %10 = load i64*, i64** %dataBuffer4, align 8, !dbg !163
  %11 = load i64, i64* %i9, align 8, !dbg !165
  %arrayidx13 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !163
  store i64 5, i64* %arrayidx13, align 8, !dbg !166
  br label %for.inc14, !dbg !167

for.inc14:                                        ; preds = %for.body12
  %12 = load i64, i64* %i9, align 8, !dbg !168
  %inc15 = add i64 %12, 1, !dbg !168
  store i64 %inc15, i64* %i9, align 8, !dbg !168
  br label %for.cond10, !dbg !169, !llvm.loop !170

for.end16:                                        ; preds = %for.cond10
  %13 = load i64*, i64** %dataBuffer4, align 8, !dbg !172
  store i64* %13, i64** %data, align 8, !dbg !173
  br label %if.end17

if.end17:                                         ; preds = %for.end16, %for.end
  %14 = load i64*, i64** %data, align 8, !dbg !174
  %arrayidx18 = getelementptr inbounds i64, i64* %14, i64 0, !dbg !174
  %15 = load i64, i64* %arrayidx18, align 8, !dbg !174
  call void @printLongLine(i64 noundef %15), !dbg !175
  %16 = load i64*, i64** %data, align 8, !dbg !176
  %17 = bitcast i64* %16 to i8*, !dbg !176
  call void @free(i8* noundef %17) #5, !dbg !177
  ret void, !dbg !178
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_12.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "52eec66c8db1b79646fb4fed182c125b")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_12_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
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
!56 = !DILocalVariable(name: "dataBuffer", scope: !57, file: !1, line: 46, type: !3)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 44, column: 9)
!58 = distinct !DILexicalBlock(scope: !22, file: !1, line: 43, column: 5)
!59 = !DILocation(line: 46, column: 20, scope: !57)
!60 = !DILocation(line: 46, column: 41, scope: !57)
!61 = !DILocation(line: 46, column: 33, scope: !57)
!62 = !DILocation(line: 47, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !57, file: !1, line: 47, column: 17)
!64 = !DILocation(line: 47, column: 28, scope: !63)
!65 = !DILocation(line: 47, column: 17, scope: !57)
!66 = !DILocation(line: 49, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !1, line: 48, column: 13)
!68 = !DILocation(line: 50, column: 17, scope: !67)
!69 = !DILocalVariable(name: "i", scope: !70, file: !1, line: 53, type: !32)
!70 = distinct !DILexicalBlock(scope: !57, file: !1, line: 52, column: 13)
!71 = !DILocation(line: 53, column: 24, scope: !70)
!72 = !DILocation(line: 54, column: 24, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !1, line: 54, column: 17)
!74 = !DILocation(line: 54, column: 22, scope: !73)
!75 = !DILocation(line: 54, column: 29, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !1, line: 54, column: 17)
!77 = !DILocation(line: 54, column: 31, scope: !76)
!78 = !DILocation(line: 54, column: 17, scope: !73)
!79 = !DILocation(line: 56, column: 21, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !1, line: 55, column: 17)
!81 = !DILocation(line: 56, column: 32, scope: !80)
!82 = !DILocation(line: 56, column: 35, scope: !80)
!83 = !DILocation(line: 57, column: 17, scope: !80)
!84 = !DILocation(line: 54, column: 39, scope: !76)
!85 = !DILocation(line: 54, column: 17, scope: !76)
!86 = distinct !{!86, !78, !87, !52}
!87 = !DILocation(line: 57, column: 17, scope: !73)
!88 = !DILocation(line: 59, column: 20, scope: !57)
!89 = !DILocation(line: 59, column: 18, scope: !57)
!90 = !DILocation(line: 62, column: 19, scope: !14)
!91 = !DILocation(line: 62, column: 5, scope: !14)
!92 = !DILocation(line: 64, column: 10, scope: !14)
!93 = !DILocation(line: 64, column: 5, scope: !14)
!94 = !DILocation(line: 65, column: 1, scope: !14)
!95 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_12_good", scope: !1, file: !1, line: 122, type: !15, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!96 = !DILocation(line: 124, column: 5, scope: !95)
!97 = !DILocation(line: 125, column: 1, scope: !95)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!99 = !DILocalVariable(name: "data", scope: !98, file: !1, line: 75, type: !3)
!100 = !DILocation(line: 75, column: 12, scope: !98)
!101 = !DILocation(line: 76, column: 10, scope: !98)
!102 = !DILocation(line: 77, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !1, line: 77, column: 8)
!104 = !DILocation(line: 77, column: 8, scope: !98)
!105 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !1, line: 81, type: !3)
!106 = distinct !DILexicalBlock(scope: !107, file: !1, line: 79, column: 9)
!107 = distinct !DILexicalBlock(scope: !103, file: !1, line: 78, column: 5)
!108 = !DILocation(line: 81, column: 20, scope: !106)
!109 = !DILocation(line: 81, column: 41, scope: !106)
!110 = !DILocation(line: 81, column: 33, scope: !106)
!111 = !DILocation(line: 82, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !106, file: !1, line: 82, column: 17)
!113 = !DILocation(line: 82, column: 28, scope: !112)
!114 = !DILocation(line: 82, column: 17, scope: !106)
!115 = !DILocation(line: 84, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !1, line: 83, column: 13)
!117 = !DILocation(line: 85, column: 17, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !119, file: !1, line: 88, type: !32)
!119 = distinct !DILexicalBlock(scope: !106, file: !1, line: 87, column: 13)
!120 = !DILocation(line: 88, column: 24, scope: !119)
!121 = !DILocation(line: 89, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !1, line: 89, column: 17)
!123 = !DILocation(line: 89, column: 22, scope: !122)
!124 = !DILocation(line: 89, column: 29, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !1, line: 89, column: 17)
!126 = !DILocation(line: 89, column: 31, scope: !125)
!127 = !DILocation(line: 89, column: 17, scope: !122)
!128 = !DILocation(line: 91, column: 21, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !1, line: 90, column: 17)
!130 = !DILocation(line: 91, column: 32, scope: !129)
!131 = !DILocation(line: 91, column: 35, scope: !129)
!132 = !DILocation(line: 92, column: 17, scope: !129)
!133 = !DILocation(line: 89, column: 39, scope: !125)
!134 = !DILocation(line: 89, column: 17, scope: !125)
!135 = distinct !{!135, !127, !136, !52}
!136 = !DILocation(line: 92, column: 17, scope: !122)
!137 = !DILocation(line: 94, column: 20, scope: !106)
!138 = !DILocation(line: 94, column: 18, scope: !106)
!139 = !DILocation(line: 96, column: 5, scope: !107)
!140 = !DILocalVariable(name: "dataBuffer", scope: !141, file: !1, line: 101, type: !3)
!141 = distinct !DILexicalBlock(scope: !142, file: !1, line: 99, column: 9)
!142 = distinct !DILexicalBlock(scope: !103, file: !1, line: 98, column: 5)
!143 = !DILocation(line: 101, column: 20, scope: !141)
!144 = !DILocation(line: 101, column: 41, scope: !141)
!145 = !DILocation(line: 101, column: 33, scope: !141)
!146 = !DILocation(line: 102, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !141, file: !1, line: 102, column: 17)
!148 = !DILocation(line: 102, column: 28, scope: !147)
!149 = !DILocation(line: 102, column: 17, scope: !141)
!150 = !DILocation(line: 104, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !1, line: 103, column: 13)
!152 = !DILocation(line: 105, column: 17, scope: !151)
!153 = !DILocalVariable(name: "i", scope: !154, file: !1, line: 108, type: !32)
!154 = distinct !DILexicalBlock(scope: !141, file: !1, line: 107, column: 13)
!155 = !DILocation(line: 108, column: 24, scope: !154)
!156 = !DILocation(line: 109, column: 24, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !1, line: 109, column: 17)
!158 = !DILocation(line: 109, column: 22, scope: !157)
!159 = !DILocation(line: 109, column: 29, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !1, line: 109, column: 17)
!161 = !DILocation(line: 109, column: 31, scope: !160)
!162 = !DILocation(line: 109, column: 17, scope: !157)
!163 = !DILocation(line: 111, column: 21, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !1, line: 110, column: 17)
!165 = !DILocation(line: 111, column: 32, scope: !164)
!166 = !DILocation(line: 111, column: 35, scope: !164)
!167 = !DILocation(line: 112, column: 17, scope: !164)
!168 = !DILocation(line: 109, column: 39, scope: !160)
!169 = !DILocation(line: 109, column: 17, scope: !160)
!170 = distinct !{!170, !162, !171, !52}
!171 = !DILocation(line: 112, column: 17, scope: !157)
!172 = !DILocation(line: 114, column: 20, scope: !141)
!173 = !DILocation(line: 114, column: 18, scope: !141)
!174 = !DILocation(line: 117, column: 19, scope: !98)
!175 = !DILocation(line: 117, column: 5, scope: !98)
!176 = !DILocation(line: 119, column: 10, scope: !98)
!177 = !DILocation(line: 119, column: 5, scope: !98)
!178 = !DILocation(line: 120, column: 1, scope: !98)
