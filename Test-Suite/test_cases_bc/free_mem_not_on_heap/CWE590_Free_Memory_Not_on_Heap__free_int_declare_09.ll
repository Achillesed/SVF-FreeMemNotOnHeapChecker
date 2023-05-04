; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_declare_09.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_declare_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@GLOBAL_CONST_TRUE = external constant i32, align 4
@GLOBAL_CONST_FALSE = external constant i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_09_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i64, i64* %i, align 8, !dbg !40
  %cmp = icmp ult i64 %1, 100, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 %2, !dbg !46
  store i32 5, i32* %arrayidx, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %3, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !54
  store i32* %arraydecay, i32** %data, align 8, !dbg !55
  br label %if.end, !dbg !56

if.end:                                           ; preds = %for.end, %entry
  %4 = load i32*, i32** %data, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 0, !dbg !57
  %5 = load i32, i32* %arrayidx1, align 4, !dbg !57
  call void @printIntLine(i32 noundef %5), !dbg !58
  %6 = load i32*, i32** %data, align 8, !dbg !59
  %7 = bitcast i32* %6 to i8*, !dbg !59
  call void @free(i8* noundef %7) #5, !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_09_good() #0 !dbg !62 {
entry:
  call void @goodG2B1(), !dbg !63
  call void @goodG2B2(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  store i32* null, i32** %data, align 8, !dbg !69
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !70
  %tobool = icmp ne i32 %0, 0, !dbg !70
  br i1 %tobool, label %if.then, label %if.else, !dbg !72

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !73
  br label %if.end3, !dbg !75

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !79
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !80
  %1 = bitcast i8* %call to i32*, !dbg !81
  store i32* %1, i32** %dataBuffer, align 8, !dbg !79
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !82
  %cmp = icmp eq i32* %2, null, !dbg !84
  br i1 %cmp, label %if.then1, label %if.end, !dbg !85

if.then1:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @exit(i32 noundef 1) #6, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !89, metadata !DIExpression()), !dbg !91
  store i64 0, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !95
  %cmp2 = icmp ult i64 %3, 100, !dbg !97
  br i1 %cmp2, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !99
  %5 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !99
  store i32 5, i32* %arrayidx, align 4, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !104
  %inc = add i64 %6, 1, !dbg !104
  store i64 %inc, i64* %i, align 8, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  store i32* %7, i32** %data, align 8, !dbg !109
  br label %if.end3

if.end3:                                          ; preds = %for.end, %if.then
  %8 = load i32*, i32** %data, align 8, !dbg !110
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !110
  %9 = load i32, i32* %arrayidx4, align 4, !dbg !110
  call void @printIntLine(i32 noundef %9), !dbg !111
  %10 = load i32*, i32** %data, align 8, !dbg !112
  %11 = bitcast i32* %10 to i8*, !dbg !112
  call void @free(i8* noundef %11) #5, !dbg !113
  ret void, !dbg !114
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  store i32* null, i32** %data, align 8, !dbg !118
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !119
  %tobool = icmp ne i32 %0, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.end3, !dbg !121

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !122, metadata !DIExpression()), !dbg !125
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !126
  %1 = bitcast i8* %call to i32*, !dbg !127
  store i32* %1, i32** %dataBuffer, align 8, !dbg !125
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !128
  %cmp = icmp eq i32* %2, null, !dbg !130
  br i1 %cmp, label %if.then1, label %if.end, !dbg !131

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !132
  call void @exit(i32 noundef 1) #6, !dbg !134
  unreachable, !dbg !134

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !135, metadata !DIExpression()), !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !141
  %cmp2 = icmp ult i64 %3, 100, !dbg !143
  br i1 %cmp2, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !145
  %5 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !145
  store i32 5, i32* %arrayidx, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %6, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %dataBuffer, align 8, !dbg !154
  store i32* %7, i32** %data, align 8, !dbg !155
  br label %if.end3, !dbg !156

if.end3:                                          ; preds = %for.end, %entry
  %8 = load i32*, i32** %data, align 8, !dbg !157
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !157
  %9 = load i32, i32* %arrayidx4, align 4, !dbg !157
  call void @printIntLine(i32 noundef %9), !dbg !158
  %10 = load i32*, i32** %data, align 8, !dbg !159
  %11 = bitcast i32* %10 to i8*, !dbg !159
  call void @free(i8* noundef %11) #5, !dbg !160
  ret void, !dbg !161
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_09.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "26d056bf5aeb4216cc9ec8f4de3823d4")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_09_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 11, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !1, line: 31, type: !27)
!25 = distinct !DILexicalBlock(scope: !26, file: !1, line: 29, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !1, line: 28, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 31, column: 17, scope: !25)
!31 = !DILocalVariable(name: "i", scope: !32, file: !1, line: 33, type: !33)
!32 = distinct !DILexicalBlock(scope: !25, file: !1, line: 32, column: 13)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!35 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 33, column: 24, scope: !32)
!37 = !DILocation(line: 34, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !1, line: 34, column: 17)
!39 = !DILocation(line: 34, column: 22, scope: !38)
!40 = !DILocation(line: 34, column: 29, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !1, line: 34, column: 17)
!42 = !DILocation(line: 34, column: 31, scope: !41)
!43 = !DILocation(line: 34, column: 17, scope: !38)
!44 = !DILocation(line: 36, column: 32, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !1, line: 35, column: 17)
!46 = !DILocation(line: 36, column: 21, scope: !45)
!47 = !DILocation(line: 36, column: 35, scope: !45)
!48 = !DILocation(line: 37, column: 17, scope: !45)
!49 = !DILocation(line: 34, column: 39, scope: !41)
!50 = !DILocation(line: 34, column: 17, scope: !41)
!51 = distinct !{!51, !43, !52, !53}
!52 = !DILocation(line: 37, column: 17, scope: !38)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 39, column: 20, scope: !25)
!55 = !DILocation(line: 39, column: 18, scope: !25)
!56 = !DILocation(line: 41, column: 5, scope: !26)
!57 = !DILocation(line: 42, column: 18, scope: !14)
!58 = !DILocation(line: 42, column: 5, scope: !14)
!59 = !DILocation(line: 44, column: 10, scope: !14)
!60 = !DILocation(line: 44, column: 5, scope: !14)
!61 = !DILocation(line: 45, column: 1, scope: !14)
!62 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_09_good", scope: !1, file: !1, line: 116, type: !15, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!63 = !DILocation(line: 118, column: 5, scope: !62)
!64 = !DILocation(line: 119, column: 5, scope: !62)
!65 = !DILocation(line: 120, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!67 = !DILocalVariable(name: "data", scope: !66, file: !1, line: 54, type: !3)
!68 = !DILocation(line: 54, column: 11, scope: !66)
!69 = !DILocation(line: 55, column: 10, scope: !66)
!70 = !DILocation(line: 56, column: 8, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !1, line: 56, column: 8)
!72 = !DILocation(line: 56, column: 8, scope: !66)
!73 = !DILocation(line: 59, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !1, line: 57, column: 5)
!75 = !DILocation(line: 60, column: 5, scope: !74)
!76 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !1, line: 65, type: !3)
!77 = distinct !DILexicalBlock(scope: !78, file: !1, line: 63, column: 9)
!78 = distinct !DILexicalBlock(scope: !71, file: !1, line: 62, column: 5)
!79 = !DILocation(line: 65, column: 19, scope: !77)
!80 = !DILocation(line: 65, column: 39, scope: !77)
!81 = !DILocation(line: 65, column: 32, scope: !77)
!82 = !DILocation(line: 66, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !77, file: !1, line: 66, column: 17)
!84 = !DILocation(line: 66, column: 28, scope: !83)
!85 = !DILocation(line: 66, column: 17, scope: !77)
!86 = !DILocation(line: 68, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !1, line: 67, column: 13)
!88 = !DILocation(line: 69, column: 17, scope: !87)
!89 = !DILocalVariable(name: "i", scope: !90, file: !1, line: 72, type: !33)
!90 = distinct !DILexicalBlock(scope: !77, file: !1, line: 71, column: 13)
!91 = !DILocation(line: 72, column: 24, scope: !90)
!92 = !DILocation(line: 73, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !1, line: 73, column: 17)
!94 = !DILocation(line: 73, column: 22, scope: !93)
!95 = !DILocation(line: 73, column: 29, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !1, line: 73, column: 17)
!97 = !DILocation(line: 73, column: 31, scope: !96)
!98 = !DILocation(line: 73, column: 17, scope: !93)
!99 = !DILocation(line: 75, column: 21, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !1, line: 74, column: 17)
!101 = !DILocation(line: 75, column: 32, scope: !100)
!102 = !DILocation(line: 75, column: 35, scope: !100)
!103 = !DILocation(line: 76, column: 17, scope: !100)
!104 = !DILocation(line: 73, column: 39, scope: !96)
!105 = !DILocation(line: 73, column: 17, scope: !96)
!106 = distinct !{!106, !98, !107, !53}
!107 = !DILocation(line: 76, column: 17, scope: !93)
!108 = !DILocation(line: 78, column: 20, scope: !77)
!109 = !DILocation(line: 78, column: 18, scope: !77)
!110 = !DILocation(line: 81, column: 18, scope: !66)
!111 = !DILocation(line: 81, column: 5, scope: !66)
!112 = !DILocation(line: 83, column: 10, scope: !66)
!113 = !DILocation(line: 83, column: 5, scope: !66)
!114 = !DILocation(line: 84, column: 1, scope: !66)
!115 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!116 = !DILocalVariable(name: "data", scope: !115, file: !1, line: 89, type: !3)
!117 = !DILocation(line: 89, column: 11, scope: !115)
!118 = !DILocation(line: 90, column: 10, scope: !115)
!119 = !DILocation(line: 91, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !1, line: 91, column: 8)
!121 = !DILocation(line: 91, column: 8, scope: !115)
!122 = !DILocalVariable(name: "dataBuffer", scope: !123, file: !1, line: 95, type: !3)
!123 = distinct !DILexicalBlock(scope: !124, file: !1, line: 93, column: 9)
!124 = distinct !DILexicalBlock(scope: !120, file: !1, line: 92, column: 5)
!125 = !DILocation(line: 95, column: 19, scope: !123)
!126 = !DILocation(line: 95, column: 39, scope: !123)
!127 = !DILocation(line: 95, column: 32, scope: !123)
!128 = !DILocation(line: 96, column: 17, scope: !129)
!129 = distinct !DILexicalBlock(scope: !123, file: !1, line: 96, column: 17)
!130 = !DILocation(line: 96, column: 28, scope: !129)
!131 = !DILocation(line: 96, column: 17, scope: !123)
!132 = !DILocation(line: 98, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !1, line: 97, column: 13)
!134 = !DILocation(line: 99, column: 17, scope: !133)
!135 = !DILocalVariable(name: "i", scope: !136, file: !1, line: 102, type: !33)
!136 = distinct !DILexicalBlock(scope: !123, file: !1, line: 101, column: 13)
!137 = !DILocation(line: 102, column: 24, scope: !136)
!138 = !DILocation(line: 103, column: 24, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !1, line: 103, column: 17)
!140 = !DILocation(line: 103, column: 22, scope: !139)
!141 = !DILocation(line: 103, column: 29, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !1, line: 103, column: 17)
!143 = !DILocation(line: 103, column: 31, scope: !142)
!144 = !DILocation(line: 103, column: 17, scope: !139)
!145 = !DILocation(line: 105, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !1, line: 104, column: 17)
!147 = !DILocation(line: 105, column: 32, scope: !146)
!148 = !DILocation(line: 105, column: 35, scope: !146)
!149 = !DILocation(line: 106, column: 17, scope: !146)
!150 = !DILocation(line: 103, column: 39, scope: !142)
!151 = !DILocation(line: 103, column: 17, scope: !142)
!152 = distinct !{!152, !144, !153, !53}
!153 = !DILocation(line: 106, column: 17, scope: !139)
!154 = !DILocation(line: 108, column: 20, scope: !123)
!155 = !DILocation(line: 108, column: 18, scope: !123)
!156 = !DILocation(line: 110, column: 5, scope: !124)
!157 = !DILocation(line: 111, column: 18, scope: !115)
!158 = !DILocation(line: 111, column: 5, scope: !115)
!159 = !DILocation(line: 113, column: 10, scope: !115)
!160 = !DILocation(line: 113, column: 5, scope: !115)
!161 = !DILocation(line: 114, column: 1, scope: !115)
