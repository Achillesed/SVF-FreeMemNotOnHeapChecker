; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_static_05.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_static_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_int_static_05_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !9
@staticFalse = internal global i32 0, align 4, !dbg !18
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_05_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i32* null, i32** %data, align 8, !dbg !30
  %0 = load i32, i32* @staticTrue, align 4, !dbg !31
  %tobool = icmp ne i32 %0, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %1, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_05_bad.dataBuffer, i64 0, i64 %2, !dbg !51
  store i32 5, i32* %arrayidx, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %3, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_05_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !59
  br label %if.end, !dbg !60

if.end:                                           ; preds = %for.end, %entry
  %4 = load i32*, i32** %data, align 8, !dbg !61
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 0, !dbg !61
  %5 = load i32, i32* %arrayidx1, align 4, !dbg !61
  call void @printIntLine(i32 noundef %5), !dbg !62
  %6 = load i32*, i32** %data, align 8, !dbg !63
  %7 = bitcast i32* %6 to i8*, !dbg !63
  call void @free(i8* noundef %7) #5, !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_05_good() #0 !dbg !66 {
entry:
  call void @goodG2B1(), !dbg !67
  call void @goodG2B2(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i32* null, i32** %data, align 8, !dbg !73
  %0 = load i32, i32* @staticFalse, align 4, !dbg !74
  %tobool = icmp ne i32 %0, 0, !dbg !74
  br i1 %tobool, label %if.then, label %if.else, !dbg !76

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !77
  br label %if.end3, !dbg !79

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !83
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !84
  %1 = bitcast i8* %call to i32*, !dbg !85
  store i32* %1, i32** %dataBuffer, align 8, !dbg !83
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  %cmp = icmp eq i32* %2, null, !dbg !88
  br i1 %cmp, label %if.then1, label %if.end, !dbg !89

if.then1:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @exit(i32 noundef 1) #6, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !93, metadata !DIExpression()), !dbg !95
  store i64 0, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !99
  %cmp2 = icmp ult i64 %3, 100, !dbg !101
  br i1 %cmp2, label %for.body, label %for.end, !dbg !102

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !103
  %5 = load i64, i64* %i, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !103
  store i32 5, i32* %arrayidx, align 4, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !108
  %inc = add i64 %6, 1, !dbg !108
  store i64 %inc, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %dataBuffer, align 8, !dbg !112
  store i32* %7, i32** %data, align 8, !dbg !113
  br label %if.end3

if.end3:                                          ; preds = %for.end, %if.then
  %8 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !114
  %9 = load i32, i32* %arrayidx4, align 4, !dbg !114
  call void @printIntLine(i32 noundef %9), !dbg !115
  %10 = load i32*, i32** %data, align 8, !dbg !116
  %11 = bitcast i32* %10 to i8*, !dbg !116
  call void @free(i8* noundef %11) #5, !dbg !117
  ret void, !dbg !118
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !119 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !120, metadata !DIExpression()), !dbg !121
  store i32* null, i32** %data, align 8, !dbg !122
  %0 = load i32, i32* @staticTrue, align 4, !dbg !123
  %tobool = icmp ne i32 %0, 0, !dbg !123
  br i1 %tobool, label %if.then, label %if.end3, !dbg !125

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !126, metadata !DIExpression()), !dbg !129
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !130
  %1 = bitcast i8* %call to i32*, !dbg !131
  store i32* %1, i32** %dataBuffer, align 8, !dbg !129
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !132
  %cmp = icmp eq i32* %2, null, !dbg !134
  br i1 %cmp, label %if.then1, label %if.end, !dbg !135

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !136
  call void @exit(i32 noundef 1) #6, !dbg !138
  unreachable, !dbg !138

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  store i64 0, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !145
  %cmp2 = icmp ult i64 %3, 100, !dbg !147
  br i1 %cmp2, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !149
  %5 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !149
  store i32 5, i32* %arrayidx, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %6, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %dataBuffer, align 8, !dbg !158
  store i32* %7, i32** %data, align 8, !dbg !159
  br label %if.end3, !dbg !160

if.end3:                                          ; preds = %for.end, %entry
  %8 = load i32*, i32** %data, align 8, !dbg !161
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !161
  %9 = load i32, i32* %arrayidx4, align 4, !dbg !161
  call void @printIntLine(i32 noundef %9), !dbg !162
  %10 = load i32*, i32** %data, align 8, !dbg !163
  %11 = bitcast i32* %10 to i8*, !dbg !163
  call void @free(i8* noundef %11) #5, !dbg !164
  ret void, !dbg !165
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!20, !21, !22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !3, line: 25, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_static_05.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "b34955dbfff1342ae5cec88bf9607f61")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{!9, !0, !18}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !11, file: !3, line: 38, type: !15, isLocal: true, isDefinition: true)
!11 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_05_bad", scope: !3, file: !3, line: 30, type: !12, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !14)
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !{}
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 100)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !3, line: 26, type: !6, isLocal: true, isDefinition: true)
!20 = !{i32 7, !"Dwarf Version", i32 5}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"PIC Level", i32 2}
!24 = !{i32 7, !"PIE Level", i32 2}
!25 = !{i32 7, !"uwtable", i32 1}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!28 = !DILocalVariable(name: "data", scope: !11, file: !3, line: 32, type: !5)
!29 = !DILocation(line: 32, column: 11, scope: !11)
!30 = !DILocation(line: 33, column: 10, scope: !11)
!31 = !DILocation(line: 34, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !3, line: 34, column: 8)
!33 = !DILocation(line: 34, column: 8, scope: !11)
!34 = !DILocalVariable(name: "i", scope: !35, file: !3, line: 40, type: !38)
!35 = distinct !DILexicalBlock(scope: !36, file: !3, line: 39, column: 13)
!36 = distinct !DILexicalBlock(scope: !37, file: !3, line: 36, column: 9)
!37 = distinct !DILexicalBlock(scope: !32, file: !3, line: 35, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 40, column: 24, scope: !35)
!42 = !DILocation(line: 41, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !35, file: !3, line: 41, column: 17)
!44 = !DILocation(line: 41, column: 22, scope: !43)
!45 = !DILocation(line: 41, column: 29, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !3, line: 41, column: 17)
!47 = !DILocation(line: 41, column: 31, scope: !46)
!48 = !DILocation(line: 41, column: 17, scope: !43)
!49 = !DILocation(line: 43, column: 32, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !3, line: 42, column: 17)
!51 = !DILocation(line: 43, column: 21, scope: !50)
!52 = !DILocation(line: 43, column: 35, scope: !50)
!53 = !DILocation(line: 44, column: 17, scope: !50)
!54 = !DILocation(line: 41, column: 39, scope: !46)
!55 = !DILocation(line: 41, column: 17, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 44, column: 17, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 46, column: 18, scope: !36)
!60 = !DILocation(line: 48, column: 5, scope: !37)
!61 = !DILocation(line: 49, column: 18, scope: !11)
!62 = !DILocation(line: 49, column: 5, scope: !11)
!63 = !DILocation(line: 51, column: 10, scope: !11)
!64 = !DILocation(line: 51, column: 5, scope: !11)
!65 = !DILocation(line: 52, column: 1, scope: !11)
!66 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_05_good", scope: !3, file: !3, line: 123, type: !12, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !14)
!67 = !DILocation(line: 125, column: 5, scope: !66)
!68 = !DILocation(line: 126, column: 5, scope: !66)
!69 = !DILocation(line: 127, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 59, type: !12, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !14)
!71 = !DILocalVariable(name: "data", scope: !70, file: !3, line: 61, type: !5)
!72 = !DILocation(line: 61, column: 11, scope: !70)
!73 = !DILocation(line: 62, column: 10, scope: !70)
!74 = !DILocation(line: 63, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !3, line: 63, column: 8)
!76 = !DILocation(line: 63, column: 8, scope: !70)
!77 = !DILocation(line: 66, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !3, line: 64, column: 5)
!79 = !DILocation(line: 67, column: 5, scope: !78)
!80 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !3, line: 72, type: !5)
!81 = distinct !DILexicalBlock(scope: !82, file: !3, line: 70, column: 9)
!82 = distinct !DILexicalBlock(scope: !75, file: !3, line: 69, column: 5)
!83 = !DILocation(line: 72, column: 19, scope: !81)
!84 = !DILocation(line: 72, column: 39, scope: !81)
!85 = !DILocation(line: 72, column: 32, scope: !81)
!86 = !DILocation(line: 73, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !3, line: 73, column: 17)
!88 = !DILocation(line: 73, column: 28, scope: !87)
!89 = !DILocation(line: 73, column: 17, scope: !81)
!90 = !DILocation(line: 75, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !3, line: 74, column: 13)
!92 = !DILocation(line: 76, column: 17, scope: !91)
!93 = !DILocalVariable(name: "i", scope: !94, file: !3, line: 79, type: !38)
!94 = distinct !DILexicalBlock(scope: !81, file: !3, line: 78, column: 13)
!95 = !DILocation(line: 79, column: 24, scope: !94)
!96 = !DILocation(line: 80, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !3, line: 80, column: 17)
!98 = !DILocation(line: 80, column: 22, scope: !97)
!99 = !DILocation(line: 80, column: 29, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !3, line: 80, column: 17)
!101 = !DILocation(line: 80, column: 31, scope: !100)
!102 = !DILocation(line: 80, column: 17, scope: !97)
!103 = !DILocation(line: 82, column: 21, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !3, line: 81, column: 17)
!105 = !DILocation(line: 82, column: 32, scope: !104)
!106 = !DILocation(line: 82, column: 35, scope: !104)
!107 = !DILocation(line: 83, column: 17, scope: !104)
!108 = !DILocation(line: 80, column: 39, scope: !100)
!109 = !DILocation(line: 80, column: 17, scope: !100)
!110 = distinct !{!110, !102, !111, !58}
!111 = !DILocation(line: 83, column: 17, scope: !97)
!112 = !DILocation(line: 85, column: 20, scope: !81)
!113 = !DILocation(line: 85, column: 18, scope: !81)
!114 = !DILocation(line: 88, column: 18, scope: !70)
!115 = !DILocation(line: 88, column: 5, scope: !70)
!116 = !DILocation(line: 90, column: 10, scope: !70)
!117 = !DILocation(line: 90, column: 5, scope: !70)
!118 = !DILocation(line: 91, column: 1, scope: !70)
!119 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 94, type: !12, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !14)
!120 = !DILocalVariable(name: "data", scope: !119, file: !3, line: 96, type: !5)
!121 = !DILocation(line: 96, column: 11, scope: !119)
!122 = !DILocation(line: 97, column: 10, scope: !119)
!123 = !DILocation(line: 98, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !3, line: 98, column: 8)
!125 = !DILocation(line: 98, column: 8, scope: !119)
!126 = !DILocalVariable(name: "dataBuffer", scope: !127, file: !3, line: 102, type: !5)
!127 = distinct !DILexicalBlock(scope: !128, file: !3, line: 100, column: 9)
!128 = distinct !DILexicalBlock(scope: !124, file: !3, line: 99, column: 5)
!129 = !DILocation(line: 102, column: 19, scope: !127)
!130 = !DILocation(line: 102, column: 39, scope: !127)
!131 = !DILocation(line: 102, column: 32, scope: !127)
!132 = !DILocation(line: 103, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !127, file: !3, line: 103, column: 17)
!134 = !DILocation(line: 103, column: 28, scope: !133)
!135 = !DILocation(line: 103, column: 17, scope: !127)
!136 = !DILocation(line: 105, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !3, line: 104, column: 13)
!138 = !DILocation(line: 106, column: 17, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !140, file: !3, line: 109, type: !38)
!140 = distinct !DILexicalBlock(scope: !127, file: !3, line: 108, column: 13)
!141 = !DILocation(line: 109, column: 24, scope: !140)
!142 = !DILocation(line: 110, column: 24, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !3, line: 110, column: 17)
!144 = !DILocation(line: 110, column: 22, scope: !143)
!145 = !DILocation(line: 110, column: 29, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !3, line: 110, column: 17)
!147 = !DILocation(line: 110, column: 31, scope: !146)
!148 = !DILocation(line: 110, column: 17, scope: !143)
!149 = !DILocation(line: 112, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !3, line: 111, column: 17)
!151 = !DILocation(line: 112, column: 32, scope: !150)
!152 = !DILocation(line: 112, column: 35, scope: !150)
!153 = !DILocation(line: 113, column: 17, scope: !150)
!154 = !DILocation(line: 110, column: 39, scope: !146)
!155 = !DILocation(line: 110, column: 17, scope: !146)
!156 = distinct !{!156, !148, !157, !58}
!157 = !DILocation(line: 113, column: 17, scope: !143)
!158 = !DILocation(line: 115, column: 20, scope: !127)
!159 = !DILocation(line: 115, column: 18, scope: !127)
!160 = !DILocation(line: 117, column: 5, scope: !128)
!161 = !DILocation(line: 118, column: 18, scope: !119)
!162 = !DILocation(line: 118, column: 5, scope: !119)
!163 = !DILocation(line: 120, column: 10, scope: !119)
!164 = !DILocation(line: 120, column: 5, scope: !119)
!165 = !DILocation(line: 121, column: 1, scope: !119)
