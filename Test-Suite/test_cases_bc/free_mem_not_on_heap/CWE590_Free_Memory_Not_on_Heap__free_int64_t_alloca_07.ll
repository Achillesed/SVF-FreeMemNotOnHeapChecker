; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_07.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_07_bad() #0 !dbg !22 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i64* null, i64** %data, align 8, !dbg !28
  %0 = load i32, i32* @staticFive, align 4, !dbg !29
  %cmp = icmp eq i32 %0, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !33, metadata !DIExpression()), !dbg !36
  %1 = alloca i8, i64 800, align 16, !dbg !37
  %2 = bitcast i8* %1 to i64*, !dbg !38
  store i64* %2, i64** %dataBuffer, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i64, i64* %i, align 8, !dbg !48
  %cmp1 = icmp ult i64 %3, 100, !dbg !50
  br i1 %cmp1, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !52
  %5 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !52
  store i64 5, i64* %arrayidx, align 8, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %6, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !62
  store i64* %7, i64** %data, align 8, !dbg !63
  br label %if.end, !dbg !64

if.end:                                           ; preds = %for.end, %entry
  %8 = load i64*, i64** %data, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !65
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !65
  call void @printLongLongLine(i64 noundef %9), !dbg !66
  %10 = load i64*, i64** %data, align 8, !dbg !67
  %11 = bitcast i64* %10 to i8*, !dbg !67
  call void @free(i8* noundef %11) #5, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_07_good() #0 !dbg !70 {
entry:
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !75, metadata !DIExpression()), !dbg !76
  store i64* null, i64** %data, align 8, !dbg !77
  %0 = load i32, i32* @staticFive, align 4, !dbg !78
  %cmp = icmp ne i32 %0, 5, !dbg !80
  br i1 %cmp, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !82
  br label %if.end4, !dbg !84

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !88
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !89
  %1 = bitcast i8* %call to i64*, !dbg !90
  store i64* %1, i64** %dataBuffer, align 8, !dbg !88
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !91
  %cmp1 = icmp eq i64* %2, null, !dbg !93
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !94

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @exit(i32 noundef 1) #6, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !98, metadata !DIExpression()), !dbg !100
  store i64 0, i64* %i, align 8, !dbg !101
  br label %for.cond, !dbg !103

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !104
  %cmp3 = icmp ult i64 %3, 100, !dbg !106
  br i1 %cmp3, label %for.body, label %for.end, !dbg !107

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !108
  %5 = load i64, i64* %i, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !108
  store i64 5, i64* %arrayidx, align 8, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !113
  %inc = add i64 %6, 1, !dbg !113
  store i64 %inc, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !117
  store i64* %7, i64** %data, align 8, !dbg !118
  br label %if.end4

if.end4:                                          ; preds = %for.end, %if.then
  %8 = load i64*, i64** %data, align 8, !dbg !119
  %arrayidx5 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !119
  %9 = load i64, i64* %arrayidx5, align 8, !dbg !119
  call void @printLongLongLine(i64 noundef %9), !dbg !120
  %10 = load i64*, i64** %data, align 8, !dbg !121
  %11 = bitcast i64* %10 to i8*, !dbg !121
  call void @free(i8* noundef %11) #5, !dbg !122
  ret void, !dbg !123
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !124 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !125, metadata !DIExpression()), !dbg !126
  store i64* null, i64** %data, align 8, !dbg !127
  %0 = load i32, i32* @staticFive, align 4, !dbg !128
  %cmp = icmp eq i32 %0, 5, !dbg !130
  br i1 %cmp, label %if.then, label %if.end4, !dbg !131

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !132, metadata !DIExpression()), !dbg !135
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !136
  %1 = bitcast i8* %call to i64*, !dbg !137
  store i64* %1, i64** %dataBuffer, align 8, !dbg !135
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !138
  %cmp1 = icmp eq i64* %2, null, !dbg !140
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !141

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !142
  call void @exit(i32 noundef 1) #6, !dbg !144
  unreachable, !dbg !144

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !151
  %cmp3 = icmp ult i64 %3, 100, !dbg !153
  br i1 %cmp3, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !155
  %5 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !155
  store i64 5, i64* %arrayidx, align 8, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !160
  %inc = add i64 %6, 1, !dbg !160
  store i64 %inc, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !164
  store i64* %7, i64** %data, align 8, !dbg !165
  br label %if.end4, !dbg !166

if.end4:                                          ; preds = %for.end, %entry
  %8 = load i64*, i64** %data, align 8, !dbg !167
  %arrayidx5 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !167
  %9 = load i64, i64* %arrayidx5, align 8, !dbg !167
  call void @printLongLongLine(i64 noundef %9), !dbg !168
  %10 = load i64*, i64** %data, align 8, !dbg !169
  %11 = bitcast i64* %10 to i8*, !dbg !169
  call void @free(i8* noundef %11) #5, !dbg !170
  ret void, !dbg !171
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
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_07.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "67b9c5cffdef85b865a0e5265cefd63f")
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
!22 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_07_bad", scope: !3, file: !3, line: 29, type: !23, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
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
!33 = !DILocalVariable(name: "dataBuffer", scope: !34, file: !3, line: 37, type: !5)
!34 = distinct !DILexicalBlock(scope: !35, file: !3, line: 35, column: 9)
!35 = distinct !DILexicalBlock(scope: !30, file: !3, line: 34, column: 5)
!36 = !DILocation(line: 37, column: 23, scope: !34)
!37 = !DILocation(line: 37, column: 47, scope: !34)
!38 = !DILocation(line: 37, column: 36, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !40, file: !3, line: 39, type: !41)
!40 = distinct !DILexicalBlock(scope: !34, file: !3, line: 38, column: 13)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!43 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 39, column: 24, scope: !40)
!45 = !DILocation(line: 40, column: 24, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !3, line: 40, column: 17)
!47 = !DILocation(line: 40, column: 22, scope: !46)
!48 = !DILocation(line: 40, column: 29, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !3, line: 40, column: 17)
!50 = !DILocation(line: 40, column: 31, scope: !49)
!51 = !DILocation(line: 40, column: 17, scope: !46)
!52 = !DILocation(line: 42, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !3, line: 41, column: 17)
!54 = !DILocation(line: 42, column: 32, scope: !53)
!55 = !DILocation(line: 42, column: 35, scope: !53)
!56 = !DILocation(line: 43, column: 17, scope: !53)
!57 = !DILocation(line: 40, column: 39, scope: !49)
!58 = !DILocation(line: 40, column: 17, scope: !49)
!59 = distinct !{!59, !51, !60, !61}
!60 = !DILocation(line: 43, column: 17, scope: !46)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 45, column: 20, scope: !34)
!63 = !DILocation(line: 45, column: 18, scope: !34)
!64 = !DILocation(line: 47, column: 5, scope: !35)
!65 = !DILocation(line: 48, column: 23, scope: !22)
!66 = !DILocation(line: 48, column: 5, scope: !22)
!67 = !DILocation(line: 50, column: 10, scope: !22)
!68 = !DILocation(line: 50, column: 5, scope: !22)
!69 = !DILocation(line: 51, column: 1, scope: !22)
!70 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_07_good", scope: !3, file: !3, line: 122, type: !23, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!71 = !DILocation(line: 124, column: 5, scope: !70)
!72 = !DILocation(line: 125, column: 5, scope: !70)
!73 = !DILocation(line: 126, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 58, type: !23, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!75 = !DILocalVariable(name: "data", scope: !74, file: !3, line: 60, type: !5)
!76 = !DILocation(line: 60, column: 15, scope: !74)
!77 = !DILocation(line: 61, column: 10, scope: !74)
!78 = !DILocation(line: 62, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !3, line: 62, column: 8)
!80 = !DILocation(line: 62, column: 18, scope: !79)
!81 = !DILocation(line: 62, column: 8, scope: !74)
!82 = !DILocation(line: 65, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !3, line: 63, column: 5)
!84 = !DILocation(line: 66, column: 5, scope: !83)
!85 = !DILocalVariable(name: "dataBuffer", scope: !86, file: !3, line: 71, type: !5)
!86 = distinct !DILexicalBlock(scope: !87, file: !3, line: 69, column: 9)
!87 = distinct !DILexicalBlock(scope: !79, file: !3, line: 68, column: 5)
!88 = !DILocation(line: 71, column: 23, scope: !86)
!89 = !DILocation(line: 71, column: 47, scope: !86)
!90 = !DILocation(line: 71, column: 36, scope: !86)
!91 = !DILocation(line: 72, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !3, line: 72, column: 17)
!93 = !DILocation(line: 72, column: 28, scope: !92)
!94 = !DILocation(line: 72, column: 17, scope: !86)
!95 = !DILocation(line: 74, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !3, line: 73, column: 13)
!97 = !DILocation(line: 75, column: 17, scope: !96)
!98 = !DILocalVariable(name: "i", scope: !99, file: !3, line: 78, type: !41)
!99 = distinct !DILexicalBlock(scope: !86, file: !3, line: 77, column: 13)
!100 = !DILocation(line: 78, column: 24, scope: !99)
!101 = !DILocation(line: 79, column: 24, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !3, line: 79, column: 17)
!103 = !DILocation(line: 79, column: 22, scope: !102)
!104 = !DILocation(line: 79, column: 29, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !3, line: 79, column: 17)
!106 = !DILocation(line: 79, column: 31, scope: !105)
!107 = !DILocation(line: 79, column: 17, scope: !102)
!108 = !DILocation(line: 81, column: 21, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !3, line: 80, column: 17)
!110 = !DILocation(line: 81, column: 32, scope: !109)
!111 = !DILocation(line: 81, column: 35, scope: !109)
!112 = !DILocation(line: 82, column: 17, scope: !109)
!113 = !DILocation(line: 79, column: 39, scope: !105)
!114 = !DILocation(line: 79, column: 17, scope: !105)
!115 = distinct !{!115, !107, !116, !61}
!116 = !DILocation(line: 82, column: 17, scope: !102)
!117 = !DILocation(line: 84, column: 20, scope: !86)
!118 = !DILocation(line: 84, column: 18, scope: !86)
!119 = !DILocation(line: 87, column: 23, scope: !74)
!120 = !DILocation(line: 87, column: 5, scope: !74)
!121 = !DILocation(line: 89, column: 10, scope: !74)
!122 = !DILocation(line: 89, column: 5, scope: !74)
!123 = !DILocation(line: 90, column: 1, scope: !74)
!124 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 93, type: !23, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!125 = !DILocalVariable(name: "data", scope: !124, file: !3, line: 95, type: !5)
!126 = !DILocation(line: 95, column: 15, scope: !124)
!127 = !DILocation(line: 96, column: 10, scope: !124)
!128 = !DILocation(line: 97, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !3, line: 97, column: 8)
!130 = !DILocation(line: 97, column: 18, scope: !129)
!131 = !DILocation(line: 97, column: 8, scope: !124)
!132 = !DILocalVariable(name: "dataBuffer", scope: !133, file: !3, line: 101, type: !5)
!133 = distinct !DILexicalBlock(scope: !134, file: !3, line: 99, column: 9)
!134 = distinct !DILexicalBlock(scope: !129, file: !3, line: 98, column: 5)
!135 = !DILocation(line: 101, column: 23, scope: !133)
!136 = !DILocation(line: 101, column: 47, scope: !133)
!137 = !DILocation(line: 101, column: 36, scope: !133)
!138 = !DILocation(line: 102, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !3, line: 102, column: 17)
!140 = !DILocation(line: 102, column: 28, scope: !139)
!141 = !DILocation(line: 102, column: 17, scope: !133)
!142 = !DILocation(line: 104, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !3, line: 103, column: 13)
!144 = !DILocation(line: 105, column: 17, scope: !143)
!145 = !DILocalVariable(name: "i", scope: !146, file: !3, line: 108, type: !41)
!146 = distinct !DILexicalBlock(scope: !133, file: !3, line: 107, column: 13)
!147 = !DILocation(line: 108, column: 24, scope: !146)
!148 = !DILocation(line: 109, column: 24, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !3, line: 109, column: 17)
!150 = !DILocation(line: 109, column: 22, scope: !149)
!151 = !DILocation(line: 109, column: 29, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !3, line: 109, column: 17)
!153 = !DILocation(line: 109, column: 31, scope: !152)
!154 = !DILocation(line: 109, column: 17, scope: !149)
!155 = !DILocation(line: 111, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !3, line: 110, column: 17)
!157 = !DILocation(line: 111, column: 32, scope: !156)
!158 = !DILocation(line: 111, column: 35, scope: !156)
!159 = !DILocation(line: 112, column: 17, scope: !156)
!160 = !DILocation(line: 109, column: 39, scope: !152)
!161 = !DILocation(line: 109, column: 17, scope: !152)
!162 = distinct !{!162, !154, !163, !61}
!163 = !DILocation(line: 112, column: 17, scope: !149)
!164 = !DILocation(line: 114, column: 20, scope: !133)
!165 = !DILocation(line: 114, column: 18, scope: !133)
!166 = !DILocation(line: 116, column: 5, scope: !134)
!167 = !DILocation(line: 117, column: 23, scope: !124)
!168 = !DILocation(line: 117, column: 5, scope: !124)
!169 = !DILocation(line: 119, column: 10, scope: !124)
!170 = !DILocation(line: 119, column: 5, scope: !124)
!171 = !DILocation(line: 120, column: 1, scope: !124)
