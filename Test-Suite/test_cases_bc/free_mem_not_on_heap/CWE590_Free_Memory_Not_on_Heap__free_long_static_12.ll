; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_static_12.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_static_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_long_static_12_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_static_12_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  %dataBuffer = alloca i64*, align 8
  %i4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i64* null, i64** %data, align 8, !dbg !26
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %0, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_long_static_12_bad.dataBuffer, i64 0, i64 %1, !dbg !47
  store i64 5, i64* %arrayidx, align 8, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %2, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_long_static_12_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !55
  br label %if.end12, !dbg !56

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !57, metadata !DIExpression()), !dbg !60
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !61
  %3 = bitcast i8* %call1 to i64*, !dbg !62
  store i64* %3, i64** %dataBuffer, align 8, !dbg !60
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !63
  %cmp2 = icmp eq i64* %4, null, !dbg !65
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !66

if.then3:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @exit(i32 noundef 1) #6, !dbg !69
  unreachable, !dbg !69

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !70, metadata !DIExpression()), !dbg !72
  store i64 0, i64* %i4, align 8, !dbg !73
  br label %for.cond5, !dbg !75

for.cond5:                                        ; preds = %for.inc9, %if.end
  %5 = load i64, i64* %i4, align 8, !dbg !76
  %cmp6 = icmp ult i64 %5, 100, !dbg !78
  br i1 %cmp6, label %for.body7, label %for.end11, !dbg !79

for.body7:                                        ; preds = %for.cond5
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !80
  %7 = load i64, i64* %i4, align 8, !dbg !82
  %arrayidx8 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !80
  store i64 5, i64* %arrayidx8, align 8, !dbg !83
  br label %for.inc9, !dbg !84

for.inc9:                                         ; preds = %for.body7
  %8 = load i64, i64* %i4, align 8, !dbg !85
  %inc10 = add i64 %8, 1, !dbg !85
  store i64 %inc10, i64* %i4, align 8, !dbg !85
  br label %for.cond5, !dbg !86, !llvm.loop !87

for.end11:                                        ; preds = %for.cond5
  %9 = load i64*, i64** %dataBuffer, align 8, !dbg !89
  store i64* %9, i64** %data, align 8, !dbg !90
  br label %if.end12

if.end12:                                         ; preds = %for.end11, %for.end
  %10 = load i64*, i64** %data, align 8, !dbg !91
  %arrayidx13 = getelementptr inbounds i64, i64* %10, i64 0, !dbg !91
  %11 = load i64, i64* %arrayidx13, align 8, !dbg !91
  call void @printLongLine(i64 noundef %11), !dbg !92
  %12 = load i64*, i64** %data, align 8, !dbg !93
  %13 = bitcast i64* %12 to i8*, !dbg !93
  call void @free(i8* noundef %13) #5, !dbg !94
  ret void, !dbg !95
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_static_12_good() #0 !dbg !96 {
entry:
  call void @goodG2B(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %dataBuffer4 = alloca i64*, align 8
  %i9 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i64* null, i64** %data, align 8, !dbg !102
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !103
  %tobool = icmp ne i32 %call, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.else, !dbg !105

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !109
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !110
  %0 = bitcast i8* %call1 to i64*, !dbg !111
  store i64* %0, i64** %dataBuffer, align 8, !dbg !109
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !112
  %cmp = icmp eq i64* %1, null, !dbg !114
  br i1 %cmp, label %if.then2, label %if.end, !dbg !115

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !116
  call void @exit(i32 noundef 1) #6, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !125
  %cmp3 = icmp ult i64 %2, 100, !dbg !127
  br i1 %cmp3, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !129
  %4 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !129
  store i64 5, i64* %arrayidx, align 8, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %5, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !138
  store i64* %6, i64** %data, align 8, !dbg !139
  br label %if.end17, !dbg !140

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer4, metadata !141, metadata !DIExpression()), !dbg !144
  %call5 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !145
  %7 = bitcast i8* %call5 to i64*, !dbg !146
  store i64* %7, i64** %dataBuffer4, align 8, !dbg !144
  %8 = load i64*, i64** %dataBuffer4, align 8, !dbg !147
  %cmp6 = icmp eq i64* %8, null, !dbg !149
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !150

if.then7:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !151
  call void @exit(i32 noundef 1) #6, !dbg !153
  unreachable, !dbg !153

if.end8:                                          ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i9, metadata !154, metadata !DIExpression()), !dbg !156
  store i64 0, i64* %i9, align 8, !dbg !157
  br label %for.cond10, !dbg !159

for.cond10:                                       ; preds = %for.inc14, %if.end8
  %9 = load i64, i64* %i9, align 8, !dbg !160
  %cmp11 = icmp ult i64 %9, 100, !dbg !162
  br i1 %cmp11, label %for.body12, label %for.end16, !dbg !163

for.body12:                                       ; preds = %for.cond10
  %10 = load i64*, i64** %dataBuffer4, align 8, !dbg !164
  %11 = load i64, i64* %i9, align 8, !dbg !166
  %arrayidx13 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !164
  store i64 5, i64* %arrayidx13, align 8, !dbg !167
  br label %for.inc14, !dbg !168

for.inc14:                                        ; preds = %for.body12
  %12 = load i64, i64* %i9, align 8, !dbg !169
  %inc15 = add i64 %12, 1, !dbg !169
  store i64 %inc15, i64* %i9, align 8, !dbg !169
  br label %for.cond10, !dbg !170, !llvm.loop !171

for.end16:                                        ; preds = %for.cond10
  %13 = load i64*, i64** %dataBuffer4, align 8, !dbg !173
  store i64* %13, i64** %data, align 8, !dbg !174
  br label %if.end17

if.end17:                                         ; preds = %for.end16, %for.end
  %14 = load i64*, i64** %data, align 8, !dbg !175
  %arrayidx18 = getelementptr inbounds i64, i64* %14, i64 0, !dbg !175
  %15 = load i64, i64* %arrayidx18, align 8, !dbg !175
  call void @printLongLine(i64 noundef %15), !dbg !176
  %16 = load i64*, i64** %data, align 8, !dbg !177
  %17 = bitcast i64* %16 to i8*, !dbg !177
  call void @free(i8* noundef %17) #5, !dbg !178
  ret void, !dbg !179
}

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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 31, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_12_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_static_12.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "d96db684bf8e3e9da05596de7f721067")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0}
!12 = !{}
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 6400, elements: !14)
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
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 25, type: !8)
!25 = !DILocation(line: 25, column: 12, scope: !2)
!26 = !DILocation(line: 26, column: 10, scope: !2)
!27 = !DILocation(line: 27, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !2, file: !3, line: 27, column: 8)
!29 = !DILocation(line: 27, column: 8, scope: !2)
!30 = !DILocalVariable(name: "i", scope: !31, file: !3, line: 33, type: !34)
!31 = distinct !DILexicalBlock(scope: !32, file: !3, line: 32, column: 13)
!32 = distinct !DILexicalBlock(scope: !33, file: !3, line: 29, column: 9)
!33 = distinct !DILexicalBlock(scope: !28, file: !3, line: 28, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 33, column: 24, scope: !31)
!38 = !DILocation(line: 34, column: 24, scope: !39)
!39 = distinct !DILexicalBlock(scope: !31, file: !3, line: 34, column: 17)
!40 = !DILocation(line: 34, column: 22, scope: !39)
!41 = !DILocation(line: 34, column: 29, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !3, line: 34, column: 17)
!43 = !DILocation(line: 34, column: 31, scope: !42)
!44 = !DILocation(line: 34, column: 17, scope: !39)
!45 = !DILocation(line: 36, column: 32, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !3, line: 35, column: 17)
!47 = !DILocation(line: 36, column: 21, scope: !46)
!48 = !DILocation(line: 36, column: 35, scope: !46)
!49 = !DILocation(line: 37, column: 17, scope: !46)
!50 = !DILocation(line: 34, column: 39, scope: !42)
!51 = !DILocation(line: 34, column: 17, scope: !42)
!52 = distinct !{!52, !44, !53, !54}
!53 = !DILocation(line: 37, column: 17, scope: !39)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 39, column: 18, scope: !32)
!56 = !DILocation(line: 41, column: 5, scope: !33)
!57 = !DILocalVariable(name: "dataBuffer", scope: !58, file: !3, line: 46, type: !8)
!58 = distinct !DILexicalBlock(scope: !59, file: !3, line: 44, column: 9)
!59 = distinct !DILexicalBlock(scope: !28, file: !3, line: 43, column: 5)
!60 = !DILocation(line: 46, column: 20, scope: !58)
!61 = !DILocation(line: 46, column: 41, scope: !58)
!62 = !DILocation(line: 46, column: 33, scope: !58)
!63 = !DILocation(line: 47, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !3, line: 47, column: 17)
!65 = !DILocation(line: 47, column: 28, scope: !64)
!66 = !DILocation(line: 47, column: 17, scope: !58)
!67 = !DILocation(line: 49, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !3, line: 48, column: 13)
!69 = !DILocation(line: 50, column: 17, scope: !68)
!70 = !DILocalVariable(name: "i", scope: !71, file: !3, line: 53, type: !34)
!71 = distinct !DILexicalBlock(scope: !58, file: !3, line: 52, column: 13)
!72 = !DILocation(line: 53, column: 24, scope: !71)
!73 = !DILocation(line: 54, column: 24, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !3, line: 54, column: 17)
!75 = !DILocation(line: 54, column: 22, scope: !74)
!76 = !DILocation(line: 54, column: 29, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !3, line: 54, column: 17)
!78 = !DILocation(line: 54, column: 31, scope: !77)
!79 = !DILocation(line: 54, column: 17, scope: !74)
!80 = !DILocation(line: 56, column: 21, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !3, line: 55, column: 17)
!82 = !DILocation(line: 56, column: 32, scope: !81)
!83 = !DILocation(line: 56, column: 35, scope: !81)
!84 = !DILocation(line: 57, column: 17, scope: !81)
!85 = !DILocation(line: 54, column: 39, scope: !77)
!86 = !DILocation(line: 54, column: 17, scope: !77)
!87 = distinct !{!87, !79, !88, !54}
!88 = !DILocation(line: 57, column: 17, scope: !74)
!89 = !DILocation(line: 59, column: 20, scope: !58)
!90 = !DILocation(line: 59, column: 18, scope: !58)
!91 = !DILocation(line: 62, column: 19, scope: !2)
!92 = !DILocation(line: 62, column: 5, scope: !2)
!93 = !DILocation(line: 64, column: 10, scope: !2)
!94 = !DILocation(line: 64, column: 5, scope: !2)
!95 = !DILocation(line: 65, column: 1, scope: !2)
!96 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_12_good", scope: !3, file: !3, line: 122, type: !4, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!97 = !DILocation(line: 124, column: 5, scope: !96)
!98 = !DILocation(line: 125, column: 1, scope: !96)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 73, type: !4, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!100 = !DILocalVariable(name: "data", scope: !99, file: !3, line: 75, type: !8)
!101 = !DILocation(line: 75, column: 12, scope: !99)
!102 = !DILocation(line: 76, column: 10, scope: !99)
!103 = !DILocation(line: 77, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !3, line: 77, column: 8)
!105 = !DILocation(line: 77, column: 8, scope: !99)
!106 = !DILocalVariable(name: "dataBuffer", scope: !107, file: !3, line: 81, type: !8)
!107 = distinct !DILexicalBlock(scope: !108, file: !3, line: 79, column: 9)
!108 = distinct !DILexicalBlock(scope: !104, file: !3, line: 78, column: 5)
!109 = !DILocation(line: 81, column: 20, scope: !107)
!110 = !DILocation(line: 81, column: 41, scope: !107)
!111 = !DILocation(line: 81, column: 33, scope: !107)
!112 = !DILocation(line: 82, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !3, line: 82, column: 17)
!114 = !DILocation(line: 82, column: 28, scope: !113)
!115 = !DILocation(line: 82, column: 17, scope: !107)
!116 = !DILocation(line: 84, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !3, line: 83, column: 13)
!118 = !DILocation(line: 85, column: 17, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !120, file: !3, line: 88, type: !34)
!120 = distinct !DILexicalBlock(scope: !107, file: !3, line: 87, column: 13)
!121 = !DILocation(line: 88, column: 24, scope: !120)
!122 = !DILocation(line: 89, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !3, line: 89, column: 17)
!124 = !DILocation(line: 89, column: 22, scope: !123)
!125 = !DILocation(line: 89, column: 29, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !3, line: 89, column: 17)
!127 = !DILocation(line: 89, column: 31, scope: !126)
!128 = !DILocation(line: 89, column: 17, scope: !123)
!129 = !DILocation(line: 91, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !3, line: 90, column: 17)
!131 = !DILocation(line: 91, column: 32, scope: !130)
!132 = !DILocation(line: 91, column: 35, scope: !130)
!133 = !DILocation(line: 92, column: 17, scope: !130)
!134 = !DILocation(line: 89, column: 39, scope: !126)
!135 = !DILocation(line: 89, column: 17, scope: !126)
!136 = distinct !{!136, !128, !137, !54}
!137 = !DILocation(line: 92, column: 17, scope: !123)
!138 = !DILocation(line: 94, column: 20, scope: !107)
!139 = !DILocation(line: 94, column: 18, scope: !107)
!140 = !DILocation(line: 96, column: 5, scope: !108)
!141 = !DILocalVariable(name: "dataBuffer", scope: !142, file: !3, line: 101, type: !8)
!142 = distinct !DILexicalBlock(scope: !143, file: !3, line: 99, column: 9)
!143 = distinct !DILexicalBlock(scope: !104, file: !3, line: 98, column: 5)
!144 = !DILocation(line: 101, column: 20, scope: !142)
!145 = !DILocation(line: 101, column: 41, scope: !142)
!146 = !DILocation(line: 101, column: 33, scope: !142)
!147 = !DILocation(line: 102, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !3, line: 102, column: 17)
!149 = !DILocation(line: 102, column: 28, scope: !148)
!150 = !DILocation(line: 102, column: 17, scope: !142)
!151 = !DILocation(line: 104, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !3, line: 103, column: 13)
!153 = !DILocation(line: 105, column: 17, scope: !152)
!154 = !DILocalVariable(name: "i", scope: !155, file: !3, line: 108, type: !34)
!155 = distinct !DILexicalBlock(scope: !142, file: !3, line: 107, column: 13)
!156 = !DILocation(line: 108, column: 24, scope: !155)
!157 = !DILocation(line: 109, column: 24, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !3, line: 109, column: 17)
!159 = !DILocation(line: 109, column: 22, scope: !158)
!160 = !DILocation(line: 109, column: 29, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !3, line: 109, column: 17)
!162 = !DILocation(line: 109, column: 31, scope: !161)
!163 = !DILocation(line: 109, column: 17, scope: !158)
!164 = !DILocation(line: 111, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !3, line: 110, column: 17)
!166 = !DILocation(line: 111, column: 32, scope: !165)
!167 = !DILocation(line: 111, column: 35, scope: !165)
!168 = !DILocation(line: 112, column: 17, scope: !165)
!169 = !DILocation(line: 109, column: 39, scope: !161)
!170 = !DILocation(line: 109, column: 17, scope: !161)
!171 = distinct !{!171, !163, !172, !54}
!172 = !DILocation(line: 112, column: 17, scope: !158)
!173 = !DILocation(line: 114, column: 20, scope: !142)
!174 = !DILocation(line: 114, column: 18, scope: !142)
!175 = !DILocation(line: 117, column: 19, scope: !99)
!176 = !DILocation(line: 117, column: 5, scope: !99)
!177 = !DILocation(line: 119, column: 10, scope: !99)
!178 = !DILocation(line: 119, column: 5, scope: !99)
!179 = !DILocation(line: 120, column: 1, scope: !99)
