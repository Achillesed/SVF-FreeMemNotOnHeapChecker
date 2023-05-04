; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_alloca_07.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %0 = load i32, i32* @staticFive, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !29, metadata !DIExpression()), !dbg !32
  %1 = alloca i8, i64 800, align 16, !dbg !33
  %2 = bitcast i8* %1 to i64*, !dbg !34
  store i64* %2, i64** %dataBuffer, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i64, i64* %i, align 8, !dbg !44
  %cmp1 = icmp ult i64 %3, 100, !dbg !46
  br i1 %cmp1, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !48
  %5 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !48
  store i64 5, i64* %arrayidx, align 8, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %6, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !58
  store i64* %7, i64** %data, align 8, !dbg !59
  br label %if.end, !dbg !60

if.end:                                           ; preds = %for.end, %entry
  %8 = load i64*, i64** %data, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !61
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !61
  call void @printLongLine(i64 noundef %9), !dbg !62
  %10 = load i64*, i64** %data, align 8, !dbg !63
  %11 = bitcast i64* %10 to i8*, !dbg !63
  call void @free(i8* noundef %11) #5, !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_07_good() #0 !dbg !66 {
entry:
  call void @goodG2B1(), !dbg !67
  call void @goodG2B2(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i64* null, i64** %data, align 8, !dbg !73
  %0 = load i32, i32* @staticFive, align 4, !dbg !74
  %cmp = icmp ne i32 %0, 5, !dbg !76
  br i1 %cmp, label %if.then, label %if.else, !dbg !77

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !78
  br label %if.end4, !dbg !80

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !84
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !85
  %1 = bitcast i8* %call to i64*, !dbg !86
  store i64* %1, i64** %dataBuffer, align 8, !dbg !84
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !87
  %cmp1 = icmp eq i64* %2, null, !dbg !89
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !90

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @exit(i32 noundef 1) #6, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !94, metadata !DIExpression()), !dbg !96
  store i64 0, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !99

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !100
  %cmp3 = icmp ult i64 %3, 100, !dbg !102
  br i1 %cmp3, label %for.body, label %for.end, !dbg !103

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !104
  %5 = load i64, i64* %i, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !104
  store i64 5, i64* %arrayidx, align 8, !dbg !107
  br label %for.inc, !dbg !108

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !109
  %inc = add i64 %6, 1, !dbg !109
  store i64 %inc, i64* %i, align 8, !dbg !109
  br label %for.cond, !dbg !110, !llvm.loop !111

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !113
  store i64* %7, i64** %data, align 8, !dbg !114
  br label %if.end4

if.end4:                                          ; preds = %for.end, %if.then
  %8 = load i64*, i64** %data, align 8, !dbg !115
  %arrayidx5 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !115
  %9 = load i64, i64* %arrayidx5, align 8, !dbg !115
  call void @printLongLine(i64 noundef %9), !dbg !116
  %10 = load i64*, i64** %data, align 8, !dbg !117
  %11 = bitcast i64* %10 to i8*, !dbg !117
  call void @free(i8* noundef %11) #5, !dbg !118
  ret void, !dbg !119
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !121, metadata !DIExpression()), !dbg !122
  store i64* null, i64** %data, align 8, !dbg !123
  %0 = load i32, i32* @staticFive, align 4, !dbg !124
  %cmp = icmp eq i32 %0, 5, !dbg !126
  br i1 %cmp, label %if.then, label %if.end4, !dbg !127

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !128, metadata !DIExpression()), !dbg !131
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !132
  %1 = bitcast i8* %call to i64*, !dbg !133
  store i64* %1, i64** %dataBuffer, align 8, !dbg !131
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !134
  %cmp1 = icmp eq i64* %2, null, !dbg !136
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !137

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !138
  call void @exit(i32 noundef 1) #6, !dbg !140
  unreachable, !dbg !140

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !147
  %cmp3 = icmp ult i64 %3, 100, !dbg !149
  br i1 %cmp3, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !151
  %5 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !151
  store i64 5, i64* %arrayidx, align 8, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %6, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !160
  store i64* %7, i64** %data, align 8, !dbg !161
  br label %if.end4, !dbg !162

if.end4:                                          ; preds = %for.end, %entry
  %8 = load i64*, i64** %data, align 8, !dbg !163
  %arrayidx5 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !163
  %9 = load i64, i64* %arrayidx5, align 8, !dbg !163
  call void @printLongLine(i64 noundef %9), !dbg !164
  %10 = load i64*, i64** %data, align 8, !dbg !165
  %11 = bitcast i64* %10 to i8*, !dbg !165
  call void @free(i8* noundef %11) #5, !dbg !166
  ret void, !dbg !167
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !3, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_07.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "c524cdd3a5c67e6c9d9cc5a8ca11a2b4")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{!0}
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 5}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"PIE Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_07_bad", scope: !3, file: !3, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !3, line: 31, type: !5)
!23 = !DILocation(line: 31, column: 12, scope: !18)
!24 = !DILocation(line: 32, column: 10, scope: !18)
!25 = !DILocation(line: 33, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !3, line: 33, column: 8)
!27 = !DILocation(line: 33, column: 18, scope: !26)
!28 = !DILocation(line: 33, column: 8, scope: !18)
!29 = !DILocalVariable(name: "dataBuffer", scope: !30, file: !3, line: 37, type: !5)
!30 = distinct !DILexicalBlock(scope: !31, file: !3, line: 35, column: 9)
!31 = distinct !DILexicalBlock(scope: !26, file: !3, line: 34, column: 5)
!32 = !DILocation(line: 37, column: 20, scope: !30)
!33 = !DILocation(line: 37, column: 41, scope: !30)
!34 = !DILocation(line: 37, column: 33, scope: !30)
!35 = !DILocalVariable(name: "i", scope: !36, file: !3, line: 39, type: !37)
!36 = distinct !DILexicalBlock(scope: !30, file: !3, line: 38, column: 13)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!39 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 39, column: 24, scope: !36)
!41 = !DILocation(line: 40, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !3, line: 40, column: 17)
!43 = !DILocation(line: 40, column: 22, scope: !42)
!44 = !DILocation(line: 40, column: 29, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !3, line: 40, column: 17)
!46 = !DILocation(line: 40, column: 31, scope: !45)
!47 = !DILocation(line: 40, column: 17, scope: !42)
!48 = !DILocation(line: 42, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !3, line: 41, column: 17)
!50 = !DILocation(line: 42, column: 32, scope: !49)
!51 = !DILocation(line: 42, column: 35, scope: !49)
!52 = !DILocation(line: 43, column: 17, scope: !49)
!53 = !DILocation(line: 40, column: 39, scope: !45)
!54 = !DILocation(line: 40, column: 17, scope: !45)
!55 = distinct !{!55, !47, !56, !57}
!56 = !DILocation(line: 43, column: 17, scope: !42)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 45, column: 20, scope: !30)
!59 = !DILocation(line: 45, column: 18, scope: !30)
!60 = !DILocation(line: 47, column: 5, scope: !31)
!61 = !DILocation(line: 48, column: 19, scope: !18)
!62 = !DILocation(line: 48, column: 5, scope: !18)
!63 = !DILocation(line: 50, column: 10, scope: !18)
!64 = !DILocation(line: 50, column: 5, scope: !18)
!65 = !DILocation(line: 51, column: 1, scope: !18)
!66 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_07_good", scope: !3, file: !3, line: 122, type: !19, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!67 = !DILocation(line: 124, column: 5, scope: !66)
!68 = !DILocation(line: 125, column: 5, scope: !66)
!69 = !DILocation(line: 126, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!71 = !DILocalVariable(name: "data", scope: !70, file: !3, line: 60, type: !5)
!72 = !DILocation(line: 60, column: 12, scope: !70)
!73 = !DILocation(line: 61, column: 10, scope: !70)
!74 = !DILocation(line: 62, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !3, line: 62, column: 8)
!76 = !DILocation(line: 62, column: 18, scope: !75)
!77 = !DILocation(line: 62, column: 8, scope: !70)
!78 = !DILocation(line: 65, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !3, line: 63, column: 5)
!80 = !DILocation(line: 66, column: 5, scope: !79)
!81 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !3, line: 71, type: !5)
!82 = distinct !DILexicalBlock(scope: !83, file: !3, line: 69, column: 9)
!83 = distinct !DILexicalBlock(scope: !75, file: !3, line: 68, column: 5)
!84 = !DILocation(line: 71, column: 20, scope: !82)
!85 = !DILocation(line: 71, column: 41, scope: !82)
!86 = !DILocation(line: 71, column: 33, scope: !82)
!87 = !DILocation(line: 72, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !3, line: 72, column: 17)
!89 = !DILocation(line: 72, column: 28, scope: !88)
!90 = !DILocation(line: 72, column: 17, scope: !82)
!91 = !DILocation(line: 74, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !3, line: 73, column: 13)
!93 = !DILocation(line: 75, column: 17, scope: !92)
!94 = !DILocalVariable(name: "i", scope: !95, file: !3, line: 78, type: !37)
!95 = distinct !DILexicalBlock(scope: !82, file: !3, line: 77, column: 13)
!96 = !DILocation(line: 78, column: 24, scope: !95)
!97 = !DILocation(line: 79, column: 24, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !3, line: 79, column: 17)
!99 = !DILocation(line: 79, column: 22, scope: !98)
!100 = !DILocation(line: 79, column: 29, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !3, line: 79, column: 17)
!102 = !DILocation(line: 79, column: 31, scope: !101)
!103 = !DILocation(line: 79, column: 17, scope: !98)
!104 = !DILocation(line: 81, column: 21, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !3, line: 80, column: 17)
!106 = !DILocation(line: 81, column: 32, scope: !105)
!107 = !DILocation(line: 81, column: 35, scope: !105)
!108 = !DILocation(line: 82, column: 17, scope: !105)
!109 = !DILocation(line: 79, column: 39, scope: !101)
!110 = !DILocation(line: 79, column: 17, scope: !101)
!111 = distinct !{!111, !103, !112, !57}
!112 = !DILocation(line: 82, column: 17, scope: !98)
!113 = !DILocation(line: 84, column: 20, scope: !82)
!114 = !DILocation(line: 84, column: 18, scope: !82)
!115 = !DILocation(line: 87, column: 19, scope: !70)
!116 = !DILocation(line: 87, column: 5, scope: !70)
!117 = !DILocation(line: 89, column: 10, scope: !70)
!118 = !DILocation(line: 89, column: 5, scope: !70)
!119 = !DILocation(line: 90, column: 1, scope: !70)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 93, type: !19, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!121 = !DILocalVariable(name: "data", scope: !120, file: !3, line: 95, type: !5)
!122 = !DILocation(line: 95, column: 12, scope: !120)
!123 = !DILocation(line: 96, column: 10, scope: !120)
!124 = !DILocation(line: 97, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !3, line: 97, column: 8)
!126 = !DILocation(line: 97, column: 18, scope: !125)
!127 = !DILocation(line: 97, column: 8, scope: !120)
!128 = !DILocalVariable(name: "dataBuffer", scope: !129, file: !3, line: 101, type: !5)
!129 = distinct !DILexicalBlock(scope: !130, file: !3, line: 99, column: 9)
!130 = distinct !DILexicalBlock(scope: !125, file: !3, line: 98, column: 5)
!131 = !DILocation(line: 101, column: 20, scope: !129)
!132 = !DILocation(line: 101, column: 41, scope: !129)
!133 = !DILocation(line: 101, column: 33, scope: !129)
!134 = !DILocation(line: 102, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !3, line: 102, column: 17)
!136 = !DILocation(line: 102, column: 28, scope: !135)
!137 = !DILocation(line: 102, column: 17, scope: !129)
!138 = !DILocation(line: 104, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !3, line: 103, column: 13)
!140 = !DILocation(line: 105, column: 17, scope: !139)
!141 = !DILocalVariable(name: "i", scope: !142, file: !3, line: 108, type: !37)
!142 = distinct !DILexicalBlock(scope: !129, file: !3, line: 107, column: 13)
!143 = !DILocation(line: 108, column: 24, scope: !142)
!144 = !DILocation(line: 109, column: 24, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !3, line: 109, column: 17)
!146 = !DILocation(line: 109, column: 22, scope: !145)
!147 = !DILocation(line: 109, column: 29, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !3, line: 109, column: 17)
!149 = !DILocation(line: 109, column: 31, scope: !148)
!150 = !DILocation(line: 109, column: 17, scope: !145)
!151 = !DILocation(line: 111, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !3, line: 110, column: 17)
!153 = !DILocation(line: 111, column: 32, scope: !152)
!154 = !DILocation(line: 111, column: 35, scope: !152)
!155 = !DILocation(line: 112, column: 17, scope: !152)
!156 = !DILocation(line: 109, column: 39, scope: !148)
!157 = !DILocation(line: 109, column: 17, scope: !148)
!158 = distinct !{!158, !150, !159, !57}
!159 = !DILocation(line: 112, column: 17, scope: !145)
!160 = !DILocation(line: 114, column: 20, scope: !129)
!161 = !DILocation(line: 114, column: 18, scope: !129)
!162 = !DILocation(line: 116, column: 5, scope: !130)
!163 = !DILocation(line: 117, column: 19, scope: !120)
!164 = !DILocation(line: 117, column: 5, scope: !120)
!165 = !DILocation(line: 119, column: 10, scope: !120)
!166 = !DILocation(line: 119, column: 5, scope: !120)
!167 = !DILocation(line: 120, column: 1, scope: !120)
