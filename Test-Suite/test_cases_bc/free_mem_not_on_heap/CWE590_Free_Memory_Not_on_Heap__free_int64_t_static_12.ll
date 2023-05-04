; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_12.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_12_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_12_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  %dataBuffer = alloca i64*, align 8
  %i4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i64* null, i64** %data, align 8, !dbg !30
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !31
  %tobool = icmp ne i32 %call, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %0, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_12_bad.dataBuffer, i64 0, i64 %1, !dbg !51
  store i64 5, i64* %arrayidx, align 8, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %2, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_12_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !59
  br label %if.end12, !dbg !60

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !61, metadata !DIExpression()), !dbg !64
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !65
  %3 = bitcast i8* %call1 to i64*, !dbg !66
  store i64* %3, i64** %dataBuffer, align 8, !dbg !64
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !67
  %cmp2 = icmp eq i64* %4, null, !dbg !69
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !70

if.then3:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @exit(i32 noundef 1) #6, !dbg !73
  unreachable, !dbg !73

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !74, metadata !DIExpression()), !dbg !76
  store i64 0, i64* %i4, align 8, !dbg !77
  br label %for.cond5, !dbg !79

for.cond5:                                        ; preds = %for.inc9, %if.end
  %5 = load i64, i64* %i4, align 8, !dbg !80
  %cmp6 = icmp ult i64 %5, 100, !dbg !82
  br i1 %cmp6, label %for.body7, label %for.end11, !dbg !83

for.body7:                                        ; preds = %for.cond5
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !84
  %7 = load i64, i64* %i4, align 8, !dbg !86
  %arrayidx8 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !84
  store i64 5, i64* %arrayidx8, align 8, !dbg !87
  br label %for.inc9, !dbg !88

for.inc9:                                         ; preds = %for.body7
  %8 = load i64, i64* %i4, align 8, !dbg !89
  %inc10 = add i64 %8, 1, !dbg !89
  store i64 %inc10, i64* %i4, align 8, !dbg !89
  br label %for.cond5, !dbg !90, !llvm.loop !91

for.end11:                                        ; preds = %for.cond5
  %9 = load i64*, i64** %dataBuffer, align 8, !dbg !93
  store i64* %9, i64** %data, align 8, !dbg !94
  br label %if.end12

if.end12:                                         ; preds = %for.end11, %for.end
  %10 = load i64*, i64** %data, align 8, !dbg !95
  %arrayidx13 = getelementptr inbounds i64, i64* %10, i64 0, !dbg !95
  %11 = load i64, i64* %arrayidx13, align 8, !dbg !95
  call void @printLongLongLine(i64 noundef %11), !dbg !96
  %12 = load i64*, i64** %data, align 8, !dbg !97
  %13 = bitcast i64* %12 to i8*, !dbg !97
  call void @free(i8* noundef %13) #5, !dbg !98
  ret void, !dbg !99
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_12_good() #0 !dbg !100 {
entry:
  call void @goodG2B(), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %dataBuffer4 = alloca i64*, align 8
  %i9 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i64* null, i64** %data, align 8, !dbg !106
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !107
  %tobool = icmp ne i32 %call, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !110, metadata !DIExpression()), !dbg !113
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !114
  %0 = bitcast i8* %call1 to i64*, !dbg !115
  store i64* %0, i64** %dataBuffer, align 8, !dbg !113
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !116
  %cmp = icmp eq i64* %1, null, !dbg !118
  br i1 %cmp, label %if.then2, label %if.end, !dbg !119

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !120
  call void @exit(i32 noundef 1) #6, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !129
  %cmp3 = icmp ult i64 %2, 100, !dbg !131
  br i1 %cmp3, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !133
  %4 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !133
  store i64 5, i64* %arrayidx, align 8, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %5, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !142
  store i64* %6, i64** %data, align 8, !dbg !143
  br label %if.end17, !dbg !144

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer4, metadata !145, metadata !DIExpression()), !dbg !148
  %call5 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !149
  %7 = bitcast i8* %call5 to i64*, !dbg !150
  store i64* %7, i64** %dataBuffer4, align 8, !dbg !148
  %8 = load i64*, i64** %dataBuffer4, align 8, !dbg !151
  %cmp6 = icmp eq i64* %8, null, !dbg !153
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !154

if.then7:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !155
  call void @exit(i32 noundef 1) #6, !dbg !157
  unreachable, !dbg !157

if.end8:                                          ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i9, metadata !158, metadata !DIExpression()), !dbg !160
  store i64 0, i64* %i9, align 8, !dbg !161
  br label %for.cond10, !dbg !163

for.cond10:                                       ; preds = %for.inc14, %if.end8
  %9 = load i64, i64* %i9, align 8, !dbg !164
  %cmp11 = icmp ult i64 %9, 100, !dbg !166
  br i1 %cmp11, label %for.body12, label %for.end16, !dbg !167

for.body12:                                       ; preds = %for.cond10
  %10 = load i64*, i64** %dataBuffer4, align 8, !dbg !168
  %11 = load i64, i64* %i9, align 8, !dbg !170
  %arrayidx13 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !168
  store i64 5, i64* %arrayidx13, align 8, !dbg !171
  br label %for.inc14, !dbg !172

for.inc14:                                        ; preds = %for.body12
  %12 = load i64, i64* %i9, align 8, !dbg !173
  %inc15 = add i64 %12, 1, !dbg !173
  store i64 %inc15, i64* %i9, align 8, !dbg !173
  br label %for.cond10, !dbg !174, !llvm.loop !175

for.end16:                                        ; preds = %for.cond10
  %13 = load i64*, i64** %dataBuffer4, align 8, !dbg !177
  store i64* %13, i64** %data, align 8, !dbg !178
  br label %if.end17

if.end17:                                         ; preds = %for.end16, %for.end
  %14 = load i64*, i64** %data, align 8, !dbg !179
  %arrayidx18 = getelementptr inbounds i64, i64* %14, i64 0, !dbg !179
  %15 = load i64, i64* %arrayidx18, align 8, !dbg !179
  call void @printLongLongLine(i64 noundef %15), !dbg !180
  %16 = load i64*, i64** %data, align 8, !dbg !181
  %17 = bitcast i64* %16 to i8*, !dbg !181
  call void @free(i8* noundef %17) #5, !dbg !182
  ret void, !dbg !183
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!20, !21, !22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 31, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_12_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_12.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "705e0e14b91515126cea6953318c8883")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !15, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !14}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !10, line: 27, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !12, line: 44, baseType: !13)
!12 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!13 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !{!0}
!16 = !{}
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 6400, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 100)
!20 = !{i32 7, !"Dwarf Version", i32 5}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"PIC Level", i32 2}
!24 = !{i32 7, !"PIE Level", i32 2}
!25 = !{i32 7, !"uwtable", i32 1}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!28 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 25, type: !8)
!29 = !DILocation(line: 25, column: 15, scope: !2)
!30 = !DILocation(line: 26, column: 10, scope: !2)
!31 = !DILocation(line: 27, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !2, file: !3, line: 27, column: 8)
!33 = !DILocation(line: 27, column: 8, scope: !2)
!34 = !DILocalVariable(name: "i", scope: !35, file: !3, line: 33, type: !38)
!35 = distinct !DILexicalBlock(scope: !36, file: !3, line: 32, column: 13)
!36 = distinct !DILexicalBlock(scope: !37, file: !3, line: 29, column: 9)
!37 = distinct !DILexicalBlock(scope: !32, file: !3, line: 28, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 33, column: 24, scope: !35)
!42 = !DILocation(line: 34, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !35, file: !3, line: 34, column: 17)
!44 = !DILocation(line: 34, column: 22, scope: !43)
!45 = !DILocation(line: 34, column: 29, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !3, line: 34, column: 17)
!47 = !DILocation(line: 34, column: 31, scope: !46)
!48 = !DILocation(line: 34, column: 17, scope: !43)
!49 = !DILocation(line: 36, column: 32, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !3, line: 35, column: 17)
!51 = !DILocation(line: 36, column: 21, scope: !50)
!52 = !DILocation(line: 36, column: 35, scope: !50)
!53 = !DILocation(line: 37, column: 17, scope: !50)
!54 = !DILocation(line: 34, column: 39, scope: !46)
!55 = !DILocation(line: 34, column: 17, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 37, column: 17, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 39, column: 18, scope: !36)
!60 = !DILocation(line: 41, column: 5, scope: !37)
!61 = !DILocalVariable(name: "dataBuffer", scope: !62, file: !3, line: 46, type: !8)
!62 = distinct !DILexicalBlock(scope: !63, file: !3, line: 44, column: 9)
!63 = distinct !DILexicalBlock(scope: !32, file: !3, line: 43, column: 5)
!64 = !DILocation(line: 46, column: 23, scope: !62)
!65 = !DILocation(line: 46, column: 47, scope: !62)
!66 = !DILocation(line: 46, column: 36, scope: !62)
!67 = !DILocation(line: 47, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !62, file: !3, line: 47, column: 17)
!69 = !DILocation(line: 47, column: 28, scope: !68)
!70 = !DILocation(line: 47, column: 17, scope: !62)
!71 = !DILocation(line: 49, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !3, line: 48, column: 13)
!73 = !DILocation(line: 50, column: 17, scope: !72)
!74 = !DILocalVariable(name: "i", scope: !75, file: !3, line: 53, type: !38)
!75 = distinct !DILexicalBlock(scope: !62, file: !3, line: 52, column: 13)
!76 = !DILocation(line: 53, column: 24, scope: !75)
!77 = !DILocation(line: 54, column: 24, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !3, line: 54, column: 17)
!79 = !DILocation(line: 54, column: 22, scope: !78)
!80 = !DILocation(line: 54, column: 29, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !3, line: 54, column: 17)
!82 = !DILocation(line: 54, column: 31, scope: !81)
!83 = !DILocation(line: 54, column: 17, scope: !78)
!84 = !DILocation(line: 56, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !3, line: 55, column: 17)
!86 = !DILocation(line: 56, column: 32, scope: !85)
!87 = !DILocation(line: 56, column: 35, scope: !85)
!88 = !DILocation(line: 57, column: 17, scope: !85)
!89 = !DILocation(line: 54, column: 39, scope: !81)
!90 = !DILocation(line: 54, column: 17, scope: !81)
!91 = distinct !{!91, !83, !92, !58}
!92 = !DILocation(line: 57, column: 17, scope: !78)
!93 = !DILocation(line: 59, column: 20, scope: !62)
!94 = !DILocation(line: 59, column: 18, scope: !62)
!95 = !DILocation(line: 62, column: 23, scope: !2)
!96 = !DILocation(line: 62, column: 5, scope: !2)
!97 = !DILocation(line: 64, column: 10, scope: !2)
!98 = !DILocation(line: 64, column: 5, scope: !2)
!99 = !DILocation(line: 65, column: 1, scope: !2)
!100 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_12_good", scope: !3, file: !3, line: 122, type: !4, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!101 = !DILocation(line: 124, column: 5, scope: !100)
!102 = !DILocation(line: 125, column: 1, scope: !100)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 73, type: !4, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!104 = !DILocalVariable(name: "data", scope: !103, file: !3, line: 75, type: !8)
!105 = !DILocation(line: 75, column: 15, scope: !103)
!106 = !DILocation(line: 76, column: 10, scope: !103)
!107 = !DILocation(line: 77, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !3, line: 77, column: 8)
!109 = !DILocation(line: 77, column: 8, scope: !103)
!110 = !DILocalVariable(name: "dataBuffer", scope: !111, file: !3, line: 81, type: !8)
!111 = distinct !DILexicalBlock(scope: !112, file: !3, line: 79, column: 9)
!112 = distinct !DILexicalBlock(scope: !108, file: !3, line: 78, column: 5)
!113 = !DILocation(line: 81, column: 23, scope: !111)
!114 = !DILocation(line: 81, column: 47, scope: !111)
!115 = !DILocation(line: 81, column: 36, scope: !111)
!116 = !DILocation(line: 82, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !3, line: 82, column: 17)
!118 = !DILocation(line: 82, column: 28, scope: !117)
!119 = !DILocation(line: 82, column: 17, scope: !111)
!120 = !DILocation(line: 84, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !3, line: 83, column: 13)
!122 = !DILocation(line: 85, column: 17, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !124, file: !3, line: 88, type: !38)
!124 = distinct !DILexicalBlock(scope: !111, file: !3, line: 87, column: 13)
!125 = !DILocation(line: 88, column: 24, scope: !124)
!126 = !DILocation(line: 89, column: 24, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !3, line: 89, column: 17)
!128 = !DILocation(line: 89, column: 22, scope: !127)
!129 = !DILocation(line: 89, column: 29, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !3, line: 89, column: 17)
!131 = !DILocation(line: 89, column: 31, scope: !130)
!132 = !DILocation(line: 89, column: 17, scope: !127)
!133 = !DILocation(line: 91, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !3, line: 90, column: 17)
!135 = !DILocation(line: 91, column: 32, scope: !134)
!136 = !DILocation(line: 91, column: 35, scope: !134)
!137 = !DILocation(line: 92, column: 17, scope: !134)
!138 = !DILocation(line: 89, column: 39, scope: !130)
!139 = !DILocation(line: 89, column: 17, scope: !130)
!140 = distinct !{!140, !132, !141, !58}
!141 = !DILocation(line: 92, column: 17, scope: !127)
!142 = !DILocation(line: 94, column: 20, scope: !111)
!143 = !DILocation(line: 94, column: 18, scope: !111)
!144 = !DILocation(line: 96, column: 5, scope: !112)
!145 = !DILocalVariable(name: "dataBuffer", scope: !146, file: !3, line: 101, type: !8)
!146 = distinct !DILexicalBlock(scope: !147, file: !3, line: 99, column: 9)
!147 = distinct !DILexicalBlock(scope: !108, file: !3, line: 98, column: 5)
!148 = !DILocation(line: 101, column: 23, scope: !146)
!149 = !DILocation(line: 101, column: 47, scope: !146)
!150 = !DILocation(line: 101, column: 36, scope: !146)
!151 = !DILocation(line: 102, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !146, file: !3, line: 102, column: 17)
!153 = !DILocation(line: 102, column: 28, scope: !152)
!154 = !DILocation(line: 102, column: 17, scope: !146)
!155 = !DILocation(line: 104, column: 17, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !3, line: 103, column: 13)
!157 = !DILocation(line: 105, column: 17, scope: !156)
!158 = !DILocalVariable(name: "i", scope: !159, file: !3, line: 108, type: !38)
!159 = distinct !DILexicalBlock(scope: !146, file: !3, line: 107, column: 13)
!160 = !DILocation(line: 108, column: 24, scope: !159)
!161 = !DILocation(line: 109, column: 24, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !3, line: 109, column: 17)
!163 = !DILocation(line: 109, column: 22, scope: !162)
!164 = !DILocation(line: 109, column: 29, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !3, line: 109, column: 17)
!166 = !DILocation(line: 109, column: 31, scope: !165)
!167 = !DILocation(line: 109, column: 17, scope: !162)
!168 = !DILocation(line: 111, column: 21, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !3, line: 110, column: 17)
!170 = !DILocation(line: 111, column: 32, scope: !169)
!171 = !DILocation(line: 111, column: 35, scope: !169)
!172 = !DILocation(line: 112, column: 17, scope: !169)
!173 = !DILocation(line: 109, column: 39, scope: !165)
!174 = !DILocation(line: 109, column: 17, scope: !165)
!175 = distinct !{!175, !167, !176, !58}
!176 = !DILocation(line: 112, column: 17, scope: !162)
!177 = !DILocation(line: 114, column: 20, scope: !146)
!178 = !DILocation(line: 114, column: 18, scope: !146)
!179 = !DILocation(line: 117, column: 23, scope: !103)
!180 = !DILocation(line: 117, column: 5, scope: !103)
!181 = !DILocation(line: 119, column: 10, scope: !103)
!182 = !DILocation(line: 119, column: 5, scope: !103)
!183 = !DILocation(line: 120, column: 1, scope: !103)
