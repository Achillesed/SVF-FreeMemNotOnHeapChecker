; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_static_05.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_static_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_long_static_05_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !9
@staticFalse = internal global i32 0, align 4, !dbg !18
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_static_05_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !29, metadata !DIExpression()), !dbg !30
  store i64* null, i64** %data, align 8, !dbg !31
  %0 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool = icmp ne i32 %0, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %1, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_long_static_05_bad.dataBuffer, i64 0, i64 %2, !dbg !52
  store i64 5, i64* %arrayidx, align 8, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %3, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_long_static_05_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !60
  br label %if.end, !dbg !61

if.end:                                           ; preds = %for.end, %entry
  %4 = load i64*, i64** %data, align 8, !dbg !62
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 0, !dbg !62
  %5 = load i64, i64* %arrayidx1, align 8, !dbg !62
  call void @printLongLine(i64 noundef %5), !dbg !63
  %6 = load i64*, i64** %data, align 8, !dbg !64
  %7 = bitcast i64* %6 to i8*, !dbg !64
  call void @free(i8* noundef %7) #5, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_static_05_good() #0 !dbg !67 {
entry:
  call void @goodG2B1(), !dbg !68
  call void @goodG2B2(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !72, metadata !DIExpression()), !dbg !73
  store i64* null, i64** %data, align 8, !dbg !74
  %0 = load i32, i32* @staticFalse, align 4, !dbg !75
  %tobool = icmp ne i32 %0, 0, !dbg !75
  br i1 %tobool, label %if.then, label %if.else, !dbg !77

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !78
  br label %if.end3, !dbg !80

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !84
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !85
  %1 = bitcast i8* %call to i64*, !dbg !86
  store i64* %1, i64** %dataBuffer, align 8, !dbg !84
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !87
  %cmp = icmp eq i64* %2, null, !dbg !89
  br i1 %cmp, label %if.then1, label %if.end, !dbg !90

if.then1:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @exit(i32 noundef 1) #6, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !94, metadata !DIExpression()), !dbg !96
  store i64 0, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !99

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !100
  %cmp2 = icmp ult i64 %3, 100, !dbg !102
  br i1 %cmp2, label %for.body, label %for.end, !dbg !103

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
  br label %if.end3

if.end3:                                          ; preds = %for.end, %if.then
  %8 = load i64*, i64** %data, align 8, !dbg !115
  %arrayidx4 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !115
  %9 = load i64, i64* %arrayidx4, align 8, !dbg !115
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !124
  %tobool = icmp ne i32 %0, 0, !dbg !124
  br i1 %tobool, label %if.then, label %if.end3, !dbg !126

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !127, metadata !DIExpression()), !dbg !130
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !131
  %1 = bitcast i8* %call to i64*, !dbg !132
  store i64* %1, i64** %dataBuffer, align 8, !dbg !130
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !133
  %cmp = icmp eq i64* %2, null, !dbg !135
  br i1 %cmp, label %if.then1, label %if.end, !dbg !136

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !137
  call void @exit(i32 noundef 1) #6, !dbg !139
  unreachable, !dbg !139

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !146
  %cmp2 = icmp ult i64 %3, 100, !dbg !148
  br i1 %cmp2, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !150
  %5 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !150
  store i64 5, i64* %arrayidx, align 8, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %6, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !159
  store i64* %7, i64** %data, align 8, !dbg !160
  br label %if.end3, !dbg !161

if.end3:                                          ; preds = %for.end, %entry
  %8 = load i64*, i64** %data, align 8, !dbg !162
  %arrayidx4 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !162
  %9 = load i64, i64* %arrayidx4, align 8, !dbg !162
  call void @printLongLine(i64 noundef %9), !dbg !163
  %10 = load i64*, i64** %data, align 8, !dbg !164
  %11 = bitcast i64* %10 to i8*, !dbg !164
  call void @free(i8* noundef %11) #5, !dbg !165
  ret void, !dbg !166
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!21, !22, !23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !3, line: 25, type: !20, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_static_05.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "b9132f29093e93174b462d53e15b350b")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{!9, !0, !18}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !11, file: !3, line: 38, type: !15, isLocal: true, isDefinition: true)
!11 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_05_bad", scope: !3, file: !3, line: 30, type: !12, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !14)
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !{}
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 100)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !3, line: 26, type: !20, isLocal: true, isDefinition: true)
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{i32 7, !"Dwarf Version", i32 5}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{i32 7, !"PIC Level", i32 2}
!25 = !{i32 7, !"PIE Level", i32 2}
!26 = !{i32 7, !"uwtable", i32 1}
!27 = !{i32 7, !"frame-pointer", i32 2}
!28 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!29 = !DILocalVariable(name: "data", scope: !11, file: !3, line: 32, type: !5)
!30 = !DILocation(line: 32, column: 12, scope: !11)
!31 = !DILocation(line: 33, column: 10, scope: !11)
!32 = !DILocation(line: 34, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !11, file: !3, line: 34, column: 8)
!34 = !DILocation(line: 34, column: 8, scope: !11)
!35 = !DILocalVariable(name: "i", scope: !36, file: !3, line: 40, type: !39)
!36 = distinct !DILexicalBlock(scope: !37, file: !3, line: 39, column: 13)
!37 = distinct !DILexicalBlock(scope: !38, file: !3, line: 36, column: 9)
!38 = distinct !DILexicalBlock(scope: !33, file: !3, line: 35, column: 5)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 40, column: 24, scope: !36)
!43 = !DILocation(line: 41, column: 24, scope: !44)
!44 = distinct !DILexicalBlock(scope: !36, file: !3, line: 41, column: 17)
!45 = !DILocation(line: 41, column: 22, scope: !44)
!46 = !DILocation(line: 41, column: 29, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !3, line: 41, column: 17)
!48 = !DILocation(line: 41, column: 31, scope: !47)
!49 = !DILocation(line: 41, column: 17, scope: !44)
!50 = !DILocation(line: 43, column: 32, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !3, line: 42, column: 17)
!52 = !DILocation(line: 43, column: 21, scope: !51)
!53 = !DILocation(line: 43, column: 35, scope: !51)
!54 = !DILocation(line: 44, column: 17, scope: !51)
!55 = !DILocation(line: 41, column: 39, scope: !47)
!56 = !DILocation(line: 41, column: 17, scope: !47)
!57 = distinct !{!57, !49, !58, !59}
!58 = !DILocation(line: 44, column: 17, scope: !44)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 46, column: 18, scope: !37)
!61 = !DILocation(line: 48, column: 5, scope: !38)
!62 = !DILocation(line: 49, column: 19, scope: !11)
!63 = !DILocation(line: 49, column: 5, scope: !11)
!64 = !DILocation(line: 51, column: 10, scope: !11)
!65 = !DILocation(line: 51, column: 5, scope: !11)
!66 = !DILocation(line: 52, column: 1, scope: !11)
!67 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_05_good", scope: !3, file: !3, line: 123, type: !12, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !14)
!68 = !DILocation(line: 125, column: 5, scope: !67)
!69 = !DILocation(line: 126, column: 5, scope: !67)
!70 = !DILocation(line: 127, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 59, type: !12, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !14)
!72 = !DILocalVariable(name: "data", scope: !71, file: !3, line: 61, type: !5)
!73 = !DILocation(line: 61, column: 12, scope: !71)
!74 = !DILocation(line: 62, column: 10, scope: !71)
!75 = !DILocation(line: 63, column: 8, scope: !76)
!76 = distinct !DILexicalBlock(scope: !71, file: !3, line: 63, column: 8)
!77 = !DILocation(line: 63, column: 8, scope: !71)
!78 = !DILocation(line: 66, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !3, line: 64, column: 5)
!80 = !DILocation(line: 67, column: 5, scope: !79)
!81 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !3, line: 72, type: !5)
!82 = distinct !DILexicalBlock(scope: !83, file: !3, line: 70, column: 9)
!83 = distinct !DILexicalBlock(scope: !76, file: !3, line: 69, column: 5)
!84 = !DILocation(line: 72, column: 20, scope: !82)
!85 = !DILocation(line: 72, column: 41, scope: !82)
!86 = !DILocation(line: 72, column: 33, scope: !82)
!87 = !DILocation(line: 73, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !3, line: 73, column: 17)
!89 = !DILocation(line: 73, column: 28, scope: !88)
!90 = !DILocation(line: 73, column: 17, scope: !82)
!91 = !DILocation(line: 75, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !3, line: 74, column: 13)
!93 = !DILocation(line: 76, column: 17, scope: !92)
!94 = !DILocalVariable(name: "i", scope: !95, file: !3, line: 79, type: !39)
!95 = distinct !DILexicalBlock(scope: !82, file: !3, line: 78, column: 13)
!96 = !DILocation(line: 79, column: 24, scope: !95)
!97 = !DILocation(line: 80, column: 24, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !3, line: 80, column: 17)
!99 = !DILocation(line: 80, column: 22, scope: !98)
!100 = !DILocation(line: 80, column: 29, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !3, line: 80, column: 17)
!102 = !DILocation(line: 80, column: 31, scope: !101)
!103 = !DILocation(line: 80, column: 17, scope: !98)
!104 = !DILocation(line: 82, column: 21, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !3, line: 81, column: 17)
!106 = !DILocation(line: 82, column: 32, scope: !105)
!107 = !DILocation(line: 82, column: 35, scope: !105)
!108 = !DILocation(line: 83, column: 17, scope: !105)
!109 = !DILocation(line: 80, column: 39, scope: !101)
!110 = !DILocation(line: 80, column: 17, scope: !101)
!111 = distinct !{!111, !103, !112, !59}
!112 = !DILocation(line: 83, column: 17, scope: !98)
!113 = !DILocation(line: 85, column: 20, scope: !82)
!114 = !DILocation(line: 85, column: 18, scope: !82)
!115 = !DILocation(line: 88, column: 19, scope: !71)
!116 = !DILocation(line: 88, column: 5, scope: !71)
!117 = !DILocation(line: 90, column: 10, scope: !71)
!118 = !DILocation(line: 90, column: 5, scope: !71)
!119 = !DILocation(line: 91, column: 1, scope: !71)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 94, type: !12, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !14)
!121 = !DILocalVariable(name: "data", scope: !120, file: !3, line: 96, type: !5)
!122 = !DILocation(line: 96, column: 12, scope: !120)
!123 = !DILocation(line: 97, column: 10, scope: !120)
!124 = !DILocation(line: 98, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !3, line: 98, column: 8)
!126 = !DILocation(line: 98, column: 8, scope: !120)
!127 = !DILocalVariable(name: "dataBuffer", scope: !128, file: !3, line: 102, type: !5)
!128 = distinct !DILexicalBlock(scope: !129, file: !3, line: 100, column: 9)
!129 = distinct !DILexicalBlock(scope: !125, file: !3, line: 99, column: 5)
!130 = !DILocation(line: 102, column: 20, scope: !128)
!131 = !DILocation(line: 102, column: 41, scope: !128)
!132 = !DILocation(line: 102, column: 33, scope: !128)
!133 = !DILocation(line: 103, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !3, line: 103, column: 17)
!135 = !DILocation(line: 103, column: 28, scope: !134)
!136 = !DILocation(line: 103, column: 17, scope: !128)
!137 = !DILocation(line: 105, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !3, line: 104, column: 13)
!139 = !DILocation(line: 106, column: 17, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !141, file: !3, line: 109, type: !39)
!141 = distinct !DILexicalBlock(scope: !128, file: !3, line: 108, column: 13)
!142 = !DILocation(line: 109, column: 24, scope: !141)
!143 = !DILocation(line: 110, column: 24, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !3, line: 110, column: 17)
!145 = !DILocation(line: 110, column: 22, scope: !144)
!146 = !DILocation(line: 110, column: 29, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !3, line: 110, column: 17)
!148 = !DILocation(line: 110, column: 31, scope: !147)
!149 = !DILocation(line: 110, column: 17, scope: !144)
!150 = !DILocation(line: 112, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !3, line: 111, column: 17)
!152 = !DILocation(line: 112, column: 32, scope: !151)
!153 = !DILocation(line: 112, column: 35, scope: !151)
!154 = !DILocation(line: 113, column: 17, scope: !151)
!155 = !DILocation(line: 110, column: 39, scope: !147)
!156 = !DILocation(line: 110, column: 17, scope: !147)
!157 = distinct !{!157, !149, !158, !59}
!158 = !DILocation(line: 113, column: 17, scope: !144)
!159 = !DILocation(line: 115, column: 20, scope: !128)
!160 = !DILocation(line: 115, column: 18, scope: !128)
!161 = !DILocation(line: 117, column: 5, scope: !129)
!162 = !DILocation(line: 118, column: 19, scope: !120)
!163 = !DILocation(line: 118, column: 5, scope: !120)
!164 = !DILocation(line: 120, column: 10, scope: !120)
!165 = !DILocation(line: 120, column: 5, scope: !120)
!166 = !DILocation(line: 121, column: 1, scope: !120)
