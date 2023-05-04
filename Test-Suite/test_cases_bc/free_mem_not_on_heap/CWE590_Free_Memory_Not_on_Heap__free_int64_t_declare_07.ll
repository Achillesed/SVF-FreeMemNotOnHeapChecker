; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_07.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_07_bad() #0 !dbg !22 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i64* null, i64** %data, align 8, !dbg !28
  %0 = load i32, i32* @staticFive, align 4, !dbg !29
  %cmp = icmp eq i32 %0, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !33, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i64, i64* %i, align 8, !dbg !49
  %cmp1 = icmp ult i64 %1, 100, !dbg !51
  br i1 %cmp1, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %2, !dbg !55
  store i64 5, i64* %arrayidx, align 8, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %3, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !63
  store i64* %arraydecay, i64** %data, align 8, !dbg !64
  br label %if.end, !dbg !65

if.end:                                           ; preds = %for.end, %entry
  %4 = load i64*, i64** %data, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds i64, i64* %4, i64 0, !dbg !66
  %5 = load i64, i64* %arrayidx2, align 8, !dbg !66
  call void @printLongLongLine(i64 noundef %5), !dbg !67
  %6 = load i64*, i64** %data, align 8, !dbg !68
  %7 = bitcast i64* %6 to i8*, !dbg !68
  call void @free(i8* noundef %7) #5, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_07_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i64* null, i64** %data, align 8, !dbg !78
  %0 = load i32, i32* @staticFive, align 4, !dbg !79
  %cmp = icmp ne i32 %0, 5, !dbg !81
  br i1 %cmp, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !83
  br label %if.end4, !dbg !85

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !89
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !90
  %1 = bitcast i8* %call to i64*, !dbg !91
  store i64* %1, i64** %dataBuffer, align 8, !dbg !89
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !92
  %cmp1 = icmp eq i64* %2, null, !dbg !94
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !95

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @exit(i32 noundef 1) #6, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !99, metadata !DIExpression()), !dbg !101
  store i64 0, i64* %i, align 8, !dbg !102
  br label %for.cond, !dbg !104

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !105
  %cmp3 = icmp ult i64 %3, 100, !dbg !107
  br i1 %cmp3, label %for.body, label %for.end, !dbg !108

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !109
  %5 = load i64, i64* %i, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !109
  store i64 5, i64* %arrayidx, align 8, !dbg !112
  br label %for.inc, !dbg !113

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !114
  %inc = add i64 %6, 1, !dbg !114
  store i64 %inc, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !115, !llvm.loop !116

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !118
  store i64* %7, i64** %data, align 8, !dbg !119
  br label %if.end4

if.end4:                                          ; preds = %for.end, %if.then
  %8 = load i64*, i64** %data, align 8, !dbg !120
  %arrayidx5 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !120
  %9 = load i64, i64* %arrayidx5, align 8, !dbg !120
  call void @printLongLongLine(i64 noundef %9), !dbg !121
  %10 = load i64*, i64** %data, align 8, !dbg !122
  %11 = bitcast i64* %10 to i8*, !dbg !122
  call void @free(i8* noundef %11) #5, !dbg !123
  ret void, !dbg !124
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !125 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !126, metadata !DIExpression()), !dbg !127
  store i64* null, i64** %data, align 8, !dbg !128
  %0 = load i32, i32* @staticFive, align 4, !dbg !129
  %cmp = icmp eq i32 %0, 5, !dbg !131
  br i1 %cmp, label %if.then, label %if.end4, !dbg !132

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !133, metadata !DIExpression()), !dbg !136
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !137
  %1 = bitcast i8* %call to i64*, !dbg !138
  store i64* %1, i64** %dataBuffer, align 8, !dbg !136
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !139
  %cmp1 = icmp eq i64* %2, null, !dbg !141
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !142

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !143
  call void @exit(i32 noundef 1) #6, !dbg !145
  unreachable, !dbg !145

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !146, metadata !DIExpression()), !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !152
  %cmp3 = icmp ult i64 %3, 100, !dbg !154
  br i1 %cmp3, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !156
  %5 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !156
  store i64 5, i64* %arrayidx, align 8, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %6, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !165
  store i64* %7, i64** %data, align 8, !dbg !166
  br label %if.end4, !dbg !167

if.end4:                                          ; preds = %for.end, %entry
  %8 = load i64*, i64** %data, align 8, !dbg !168
  %arrayidx5 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !168
  %9 = load i64, i64* %arrayidx5, align 8, !dbg !168
  call void @printLongLongLine(i64 noundef %9), !dbg !169
  %10 = load i64*, i64** %data, align 8, !dbg !170
  %11 = bitcast i64* %10 to i8*, !dbg !170
  call void @free(i8* noundef %11) #5, !dbg !171
  ret void, !dbg !172
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !3, line: 25, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_07.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "98a68bb28cdce74eea3088871ba4c243")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!10 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{!0}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 5}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"PIC Level", i32 2}
!18 = !{i32 7, !"PIE Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!22 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_07_bad", scope: !3, file: !3, line: 29, type: !23, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !{}
!26 = !DILocalVariable(name: "data", scope: !22, file: !3, line: 31, type: !5)
!27 = !DILocation(line: 31, column: 15, scope: !22)
!28 = !DILocation(line: 32, column: 10, scope: !22)
!29 = !DILocation(line: 33, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !22, file: !3, line: 33, column: 8)
!31 = !DILocation(line: 33, column: 18, scope: !30)
!32 = !DILocation(line: 33, column: 8, scope: !22)
!33 = !DILocalVariable(name: "dataBuffer", scope: !34, file: !3, line: 37, type: !36)
!34 = distinct !DILexicalBlock(scope: !35, file: !3, line: 35, column: 9)
!35 = distinct !DILexicalBlock(scope: !30, file: !3, line: 34, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 37, column: 21, scope: !34)
!40 = !DILocalVariable(name: "i", scope: !41, file: !3, line: 39, type: !42)
!41 = distinct !DILexicalBlock(scope: !34, file: !3, line: 38, column: 13)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!44 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 39, column: 24, scope: !41)
!46 = !DILocation(line: 40, column: 24, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !3, line: 40, column: 17)
!48 = !DILocation(line: 40, column: 22, scope: !47)
!49 = !DILocation(line: 40, column: 29, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !3, line: 40, column: 17)
!51 = !DILocation(line: 40, column: 31, scope: !50)
!52 = !DILocation(line: 40, column: 17, scope: !47)
!53 = !DILocation(line: 42, column: 32, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !3, line: 41, column: 17)
!55 = !DILocation(line: 42, column: 21, scope: !54)
!56 = !DILocation(line: 42, column: 35, scope: !54)
!57 = !DILocation(line: 43, column: 17, scope: !54)
!58 = !DILocation(line: 40, column: 39, scope: !50)
!59 = !DILocation(line: 40, column: 17, scope: !50)
!60 = distinct !{!60, !52, !61, !62}
!61 = !DILocation(line: 43, column: 17, scope: !47)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 45, column: 20, scope: !34)
!64 = !DILocation(line: 45, column: 18, scope: !34)
!65 = !DILocation(line: 47, column: 5, scope: !35)
!66 = !DILocation(line: 48, column: 23, scope: !22)
!67 = !DILocation(line: 48, column: 5, scope: !22)
!68 = !DILocation(line: 50, column: 10, scope: !22)
!69 = !DILocation(line: 50, column: 5, scope: !22)
!70 = !DILocation(line: 51, column: 1, scope: !22)
!71 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_07_good", scope: !3, file: !3, line: 122, type: !23, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!72 = !DILocation(line: 124, column: 5, scope: !71)
!73 = !DILocation(line: 125, column: 5, scope: !71)
!74 = !DILocation(line: 126, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 58, type: !23, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!76 = !DILocalVariable(name: "data", scope: !75, file: !3, line: 60, type: !5)
!77 = !DILocation(line: 60, column: 15, scope: !75)
!78 = !DILocation(line: 61, column: 10, scope: !75)
!79 = !DILocation(line: 62, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !3, line: 62, column: 8)
!81 = !DILocation(line: 62, column: 18, scope: !80)
!82 = !DILocation(line: 62, column: 8, scope: !75)
!83 = !DILocation(line: 65, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !3, line: 63, column: 5)
!85 = !DILocation(line: 66, column: 5, scope: !84)
!86 = !DILocalVariable(name: "dataBuffer", scope: !87, file: !3, line: 71, type: !5)
!87 = distinct !DILexicalBlock(scope: !88, file: !3, line: 69, column: 9)
!88 = distinct !DILexicalBlock(scope: !80, file: !3, line: 68, column: 5)
!89 = !DILocation(line: 71, column: 23, scope: !87)
!90 = !DILocation(line: 71, column: 47, scope: !87)
!91 = !DILocation(line: 71, column: 36, scope: !87)
!92 = !DILocation(line: 72, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !3, line: 72, column: 17)
!94 = !DILocation(line: 72, column: 28, scope: !93)
!95 = !DILocation(line: 72, column: 17, scope: !87)
!96 = !DILocation(line: 74, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !3, line: 73, column: 13)
!98 = !DILocation(line: 75, column: 17, scope: !97)
!99 = !DILocalVariable(name: "i", scope: !100, file: !3, line: 78, type: !42)
!100 = distinct !DILexicalBlock(scope: !87, file: !3, line: 77, column: 13)
!101 = !DILocation(line: 78, column: 24, scope: !100)
!102 = !DILocation(line: 79, column: 24, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !3, line: 79, column: 17)
!104 = !DILocation(line: 79, column: 22, scope: !103)
!105 = !DILocation(line: 79, column: 29, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !3, line: 79, column: 17)
!107 = !DILocation(line: 79, column: 31, scope: !106)
!108 = !DILocation(line: 79, column: 17, scope: !103)
!109 = !DILocation(line: 81, column: 21, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !3, line: 80, column: 17)
!111 = !DILocation(line: 81, column: 32, scope: !110)
!112 = !DILocation(line: 81, column: 35, scope: !110)
!113 = !DILocation(line: 82, column: 17, scope: !110)
!114 = !DILocation(line: 79, column: 39, scope: !106)
!115 = !DILocation(line: 79, column: 17, scope: !106)
!116 = distinct !{!116, !108, !117, !62}
!117 = !DILocation(line: 82, column: 17, scope: !103)
!118 = !DILocation(line: 84, column: 20, scope: !87)
!119 = !DILocation(line: 84, column: 18, scope: !87)
!120 = !DILocation(line: 87, column: 23, scope: !75)
!121 = !DILocation(line: 87, column: 5, scope: !75)
!122 = !DILocation(line: 89, column: 10, scope: !75)
!123 = !DILocation(line: 89, column: 5, scope: !75)
!124 = !DILocation(line: 90, column: 1, scope: !75)
!125 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 93, type: !23, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!126 = !DILocalVariable(name: "data", scope: !125, file: !3, line: 95, type: !5)
!127 = !DILocation(line: 95, column: 15, scope: !125)
!128 = !DILocation(line: 96, column: 10, scope: !125)
!129 = !DILocation(line: 97, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !3, line: 97, column: 8)
!131 = !DILocation(line: 97, column: 18, scope: !130)
!132 = !DILocation(line: 97, column: 8, scope: !125)
!133 = !DILocalVariable(name: "dataBuffer", scope: !134, file: !3, line: 101, type: !5)
!134 = distinct !DILexicalBlock(scope: !135, file: !3, line: 99, column: 9)
!135 = distinct !DILexicalBlock(scope: !130, file: !3, line: 98, column: 5)
!136 = !DILocation(line: 101, column: 23, scope: !134)
!137 = !DILocation(line: 101, column: 47, scope: !134)
!138 = !DILocation(line: 101, column: 36, scope: !134)
!139 = !DILocation(line: 102, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !3, line: 102, column: 17)
!141 = !DILocation(line: 102, column: 28, scope: !140)
!142 = !DILocation(line: 102, column: 17, scope: !134)
!143 = !DILocation(line: 104, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !3, line: 103, column: 13)
!145 = !DILocation(line: 105, column: 17, scope: !144)
!146 = !DILocalVariable(name: "i", scope: !147, file: !3, line: 108, type: !42)
!147 = distinct !DILexicalBlock(scope: !134, file: !3, line: 107, column: 13)
!148 = !DILocation(line: 108, column: 24, scope: !147)
!149 = !DILocation(line: 109, column: 24, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !3, line: 109, column: 17)
!151 = !DILocation(line: 109, column: 22, scope: !150)
!152 = !DILocation(line: 109, column: 29, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !3, line: 109, column: 17)
!154 = !DILocation(line: 109, column: 31, scope: !153)
!155 = !DILocation(line: 109, column: 17, scope: !150)
!156 = !DILocation(line: 111, column: 21, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !3, line: 110, column: 17)
!158 = !DILocation(line: 111, column: 32, scope: !157)
!159 = !DILocation(line: 111, column: 35, scope: !157)
!160 = !DILocation(line: 112, column: 17, scope: !157)
!161 = !DILocation(line: 109, column: 39, scope: !153)
!162 = !DILocation(line: 109, column: 17, scope: !153)
!163 = distinct !{!163, !155, !164, !62}
!164 = !DILocation(line: 112, column: 17, scope: !150)
!165 = !DILocation(line: 114, column: 20, scope: !134)
!166 = !DILocation(line: 114, column: 18, scope: !134)
!167 = !DILocation(line: 116, column: 5, scope: !135)
!168 = !DILocation(line: 117, column: 23, scope: !125)
!169 = !DILocation(line: 117, column: 5, scope: !125)
!170 = !DILocation(line: 119, column: 10, scope: !125)
!171 = !DILocation(line: 119, column: 5, scope: !125)
!172 = !DILocation(line: 120, column: 1, scope: !125)
