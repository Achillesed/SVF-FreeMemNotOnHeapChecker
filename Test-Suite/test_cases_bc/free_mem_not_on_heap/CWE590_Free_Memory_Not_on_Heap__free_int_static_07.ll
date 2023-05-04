; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_static_07.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_static_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_int_static_07_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !9
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_07_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  %0 = load i32, i32* @staticFive, align 4, !dbg !29
  %cmp = icmp eq i32 %0, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i64, i64* %i, align 8, !dbg !44
  %cmp1 = icmp ult i64 %1, 100, !dbg !46
  br i1 %cmp1, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_07_bad.dataBuffer, i64 0, i64 %2, !dbg !50
  store i32 5, i32* %arrayidx, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %3, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_07_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !58
  br label %if.end, !dbg !59

if.end:                                           ; preds = %for.end, %entry
  %4 = load i32*, i32** %data, align 8, !dbg !60
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 0, !dbg !60
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !60
  call void @printIntLine(i32 noundef %5), !dbg !61
  %6 = load i32*, i32** %data, align 8, !dbg !62
  %7 = bitcast i32* %6 to i8*, !dbg !62
  call void @free(i8* noundef %7) #5, !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_07_good() #0 !dbg !65 {
entry:
  call void @goodG2B1(), !dbg !66
  call void @goodG2B2(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i32* null, i32** %data, align 8, !dbg !72
  %0 = load i32, i32* @staticFive, align 4, !dbg !73
  %cmp = icmp ne i32 %0, 5, !dbg !75
  br i1 %cmp, label %if.then, label %if.else, !dbg !76

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !77
  br label %if.end4, !dbg !79

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !83
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !84
  %1 = bitcast i8* %call to i32*, !dbg !85
  store i32* %1, i32** %dataBuffer, align 8, !dbg !83
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  %cmp1 = icmp eq i32* %2, null, !dbg !88
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !89

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @exit(i32 noundef 1) #6, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !93, metadata !DIExpression()), !dbg !95
  store i64 0, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !99
  %cmp3 = icmp ult i64 %3, 100, !dbg !101
  br i1 %cmp3, label %for.body, label %for.end, !dbg !102

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
  br label %if.end4

if.end4:                                          ; preds = %for.end, %if.then
  %8 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !114
  %9 = load i32, i32* %arrayidx5, align 4, !dbg !114
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !123
  %cmp = icmp eq i32 %0, 5, !dbg !125
  br i1 %cmp, label %if.then, label %if.end4, !dbg !126

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !127, metadata !DIExpression()), !dbg !130
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !131
  %1 = bitcast i8* %call to i32*, !dbg !132
  store i32* %1, i32** %dataBuffer, align 8, !dbg !130
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !133
  %cmp1 = icmp eq i32* %2, null, !dbg !135
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !136

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !137
  call void @exit(i32 noundef 1) #6, !dbg !139
  unreachable, !dbg !139

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !146
  %cmp3 = icmp ult i64 %3, 100, !dbg !148
  br i1 %cmp3, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !150
  %5 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !150
  store i32 5, i32* %arrayidx, align 4, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %6, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %dataBuffer, align 8, !dbg !159
  store i32* %7, i32** %data, align 8, !dbg !160
  br label %if.end4, !dbg !161

if.end4:                                          ; preds = %for.end, %entry
  %8 = load i32*, i32** %data, align 8, !dbg !162
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !162
  %9 = load i32, i32* %arrayidx5, align 4, !dbg !162
  call void @printIntLine(i32 noundef %9), !dbg !163
  %10 = load i32*, i32** %data, align 8, !dbg !164
  %11 = bitcast i32* %10 to i8*, !dbg !164
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
!llvm.module.flags = !{!18, !19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !3, line: 25, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_static_07.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "8d1ac700bf196a1a0c79b12177914b95")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{!9, !0}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !11, file: !3, line: 37, type: !15, isLocal: true, isDefinition: true)
!11 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_07_bad", scope: !3, file: !3, line: 29, type: !12, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !14)
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !{}
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 100)
!18 = !{i32 7, !"Dwarf Version", i32 5}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"PIC Level", i32 2}
!22 = !{i32 7, !"PIE Level", i32 2}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!26 = !DILocalVariable(name: "data", scope: !11, file: !3, line: 31, type: !5)
!27 = !DILocation(line: 31, column: 11, scope: !11)
!28 = !DILocation(line: 32, column: 10, scope: !11)
!29 = !DILocation(line: 33, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !3, line: 33, column: 8)
!31 = !DILocation(line: 33, column: 18, scope: !30)
!32 = !DILocation(line: 33, column: 8, scope: !11)
!33 = !DILocalVariable(name: "i", scope: !34, file: !3, line: 39, type: !37)
!34 = distinct !DILexicalBlock(scope: !35, file: !3, line: 38, column: 13)
!35 = distinct !DILexicalBlock(scope: !36, file: !3, line: 35, column: 9)
!36 = distinct !DILexicalBlock(scope: !30, file: !3, line: 34, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!39 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 39, column: 24, scope: !34)
!41 = !DILocation(line: 40, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !34, file: !3, line: 40, column: 17)
!43 = !DILocation(line: 40, column: 22, scope: !42)
!44 = !DILocation(line: 40, column: 29, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !3, line: 40, column: 17)
!46 = !DILocation(line: 40, column: 31, scope: !45)
!47 = !DILocation(line: 40, column: 17, scope: !42)
!48 = !DILocation(line: 42, column: 32, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !3, line: 41, column: 17)
!50 = !DILocation(line: 42, column: 21, scope: !49)
!51 = !DILocation(line: 42, column: 35, scope: !49)
!52 = !DILocation(line: 43, column: 17, scope: !49)
!53 = !DILocation(line: 40, column: 39, scope: !45)
!54 = !DILocation(line: 40, column: 17, scope: !45)
!55 = distinct !{!55, !47, !56, !57}
!56 = !DILocation(line: 43, column: 17, scope: !42)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 45, column: 18, scope: !35)
!59 = !DILocation(line: 47, column: 5, scope: !36)
!60 = !DILocation(line: 48, column: 18, scope: !11)
!61 = !DILocation(line: 48, column: 5, scope: !11)
!62 = !DILocation(line: 50, column: 10, scope: !11)
!63 = !DILocation(line: 50, column: 5, scope: !11)
!64 = !DILocation(line: 51, column: 1, scope: !11)
!65 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_07_good", scope: !3, file: !3, line: 122, type: !12, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !14)
!66 = !DILocation(line: 124, column: 5, scope: !65)
!67 = !DILocation(line: 125, column: 5, scope: !65)
!68 = !DILocation(line: 126, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 58, type: !12, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !14)
!70 = !DILocalVariable(name: "data", scope: !69, file: !3, line: 60, type: !5)
!71 = !DILocation(line: 60, column: 11, scope: !69)
!72 = !DILocation(line: 61, column: 10, scope: !69)
!73 = !DILocation(line: 62, column: 8, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !3, line: 62, column: 8)
!75 = !DILocation(line: 62, column: 18, scope: !74)
!76 = !DILocation(line: 62, column: 8, scope: !69)
!77 = !DILocation(line: 65, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !3, line: 63, column: 5)
!79 = !DILocation(line: 66, column: 5, scope: !78)
!80 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !3, line: 71, type: !5)
!81 = distinct !DILexicalBlock(scope: !82, file: !3, line: 69, column: 9)
!82 = distinct !DILexicalBlock(scope: !74, file: !3, line: 68, column: 5)
!83 = !DILocation(line: 71, column: 19, scope: !81)
!84 = !DILocation(line: 71, column: 39, scope: !81)
!85 = !DILocation(line: 71, column: 32, scope: !81)
!86 = !DILocation(line: 72, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !3, line: 72, column: 17)
!88 = !DILocation(line: 72, column: 28, scope: !87)
!89 = !DILocation(line: 72, column: 17, scope: !81)
!90 = !DILocation(line: 74, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !3, line: 73, column: 13)
!92 = !DILocation(line: 75, column: 17, scope: !91)
!93 = !DILocalVariable(name: "i", scope: !94, file: !3, line: 78, type: !37)
!94 = distinct !DILexicalBlock(scope: !81, file: !3, line: 77, column: 13)
!95 = !DILocation(line: 78, column: 24, scope: !94)
!96 = !DILocation(line: 79, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !3, line: 79, column: 17)
!98 = !DILocation(line: 79, column: 22, scope: !97)
!99 = !DILocation(line: 79, column: 29, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !3, line: 79, column: 17)
!101 = !DILocation(line: 79, column: 31, scope: !100)
!102 = !DILocation(line: 79, column: 17, scope: !97)
!103 = !DILocation(line: 81, column: 21, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !3, line: 80, column: 17)
!105 = !DILocation(line: 81, column: 32, scope: !104)
!106 = !DILocation(line: 81, column: 35, scope: !104)
!107 = !DILocation(line: 82, column: 17, scope: !104)
!108 = !DILocation(line: 79, column: 39, scope: !100)
!109 = !DILocation(line: 79, column: 17, scope: !100)
!110 = distinct !{!110, !102, !111, !57}
!111 = !DILocation(line: 82, column: 17, scope: !97)
!112 = !DILocation(line: 84, column: 20, scope: !81)
!113 = !DILocation(line: 84, column: 18, scope: !81)
!114 = !DILocation(line: 87, column: 18, scope: !69)
!115 = !DILocation(line: 87, column: 5, scope: !69)
!116 = !DILocation(line: 89, column: 10, scope: !69)
!117 = !DILocation(line: 89, column: 5, scope: !69)
!118 = !DILocation(line: 90, column: 1, scope: !69)
!119 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 93, type: !12, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !14)
!120 = !DILocalVariable(name: "data", scope: !119, file: !3, line: 95, type: !5)
!121 = !DILocation(line: 95, column: 11, scope: !119)
!122 = !DILocation(line: 96, column: 10, scope: !119)
!123 = !DILocation(line: 97, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !3, line: 97, column: 8)
!125 = !DILocation(line: 97, column: 18, scope: !124)
!126 = !DILocation(line: 97, column: 8, scope: !119)
!127 = !DILocalVariable(name: "dataBuffer", scope: !128, file: !3, line: 101, type: !5)
!128 = distinct !DILexicalBlock(scope: !129, file: !3, line: 99, column: 9)
!129 = distinct !DILexicalBlock(scope: !124, file: !3, line: 98, column: 5)
!130 = !DILocation(line: 101, column: 19, scope: !128)
!131 = !DILocation(line: 101, column: 39, scope: !128)
!132 = !DILocation(line: 101, column: 32, scope: !128)
!133 = !DILocation(line: 102, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !3, line: 102, column: 17)
!135 = !DILocation(line: 102, column: 28, scope: !134)
!136 = !DILocation(line: 102, column: 17, scope: !128)
!137 = !DILocation(line: 104, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !3, line: 103, column: 13)
!139 = !DILocation(line: 105, column: 17, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !141, file: !3, line: 108, type: !37)
!141 = distinct !DILexicalBlock(scope: !128, file: !3, line: 107, column: 13)
!142 = !DILocation(line: 108, column: 24, scope: !141)
!143 = !DILocation(line: 109, column: 24, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !3, line: 109, column: 17)
!145 = !DILocation(line: 109, column: 22, scope: !144)
!146 = !DILocation(line: 109, column: 29, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !3, line: 109, column: 17)
!148 = !DILocation(line: 109, column: 31, scope: !147)
!149 = !DILocation(line: 109, column: 17, scope: !144)
!150 = !DILocation(line: 111, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !3, line: 110, column: 17)
!152 = !DILocation(line: 111, column: 32, scope: !151)
!153 = !DILocation(line: 111, column: 35, scope: !151)
!154 = !DILocation(line: 112, column: 17, scope: !151)
!155 = !DILocation(line: 109, column: 39, scope: !147)
!156 = !DILocation(line: 109, column: 17, scope: !147)
!157 = distinct !{!157, !149, !158, !57}
!158 = !DILocation(line: 112, column: 17, scope: !144)
!159 = !DILocation(line: 114, column: 20, scope: !128)
!160 = !DILocation(line: 114, column: 18, scope: !128)
!161 = !DILocation(line: 116, column: 5, scope: !129)
!162 = !DILocation(line: 117, column: 18, scope: !119)
!163 = !DILocation(line: 117, column: 5, scope: !119)
!164 = !DILocation(line: 119, column: 10, scope: !119)
!165 = !DILocation(line: 119, column: 5, scope: !119)
!166 = !DILocation(line: 120, column: 1, scope: !119)
