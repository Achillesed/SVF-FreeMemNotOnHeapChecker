; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_alloca_08.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %2, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !43
  %4 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !43
  store i32 5, i32* %arrayidx, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %5, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !53
  store i32* %6, i32** %data, align 8, !dbg !54
  br label %if.end, !dbg !55

if.end:                                           ; preds = %for.end, %entry
  %7 = load i32*, i32** %data, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !56
  %8 = load i32, i32* %arrayidx1, align 4, !dbg !56
  call void @printIntLine(i32 noundef %8), !dbg !57
  %9 = load i32*, i32** %data, align 8, !dbg !58
  %10 = bitcast i32* %9 to i8*, !dbg !58
  call void @free(i8* noundef %10) #5, !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_08_good() #0 !dbg !61 {
entry:
  call void @goodG2B1(), !dbg !62
  call void @goodG2B2(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !65 {
entry:
  ret i32 1, !dbg !68
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i32* null, i32** %data, align 8, !dbg !72
  %call = call i32 @staticReturnsFalse(), !dbg !73
  %tobool = icmp ne i32 %call, 0, !dbg !73
  br i1 %tobool, label %if.then, label %if.else, !dbg !75

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !76
  br label %if.end4, !dbg !78

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !82
  %call1 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !83
  %0 = bitcast i8* %call1 to i32*, !dbg !84
  store i32* %0, i32** %dataBuffer, align 8, !dbg !82
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  %cmp = icmp eq i32* %1, null, !dbg !87
  br i1 %cmp, label %if.then2, label %if.end, !dbg !88

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @exit(i32 noundef 1) #6, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !92, metadata !DIExpression()), !dbg !94
  store i64 0, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !97

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !98
  %cmp3 = icmp ult i64 %2, 100, !dbg !100
  br i1 %cmp3, label %for.body, label %for.end, !dbg !101

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %4 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !102
  store i32 5, i32* %arrayidx, align 4, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !107
  %inc = add i64 %5, 1, !dbg !107
  store i64 %inc, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  store i32* %6, i32** %data, align 8, !dbg !112
  br label %if.end4

if.end4:                                          ; preds = %for.end, %if.then
  %7 = load i32*, i32** %data, align 8, !dbg !113
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !113
  %8 = load i32, i32* %arrayidx5, align 4, !dbg !113
  call void @printIntLine(i32 noundef %8), !dbg !114
  %9 = load i32*, i32** %data, align 8, !dbg !115
  %10 = bitcast i32* %9 to i8*, !dbg !115
  call void @free(i8* noundef %10) #5, !dbg !116
  ret void, !dbg !117
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !118 {
entry:
  ret i32 0, !dbg !119
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !121, metadata !DIExpression()), !dbg !122
  store i32* null, i32** %data, align 8, !dbg !123
  %call = call i32 @staticReturnsTrue(), !dbg !124
  %tobool = icmp ne i32 %call, 0, !dbg !124
  br i1 %tobool, label %if.then, label %if.end4, !dbg !126

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !127, metadata !DIExpression()), !dbg !130
  %call1 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !131
  %0 = bitcast i8* %call1 to i32*, !dbg !132
  store i32* %0, i32** %dataBuffer, align 8, !dbg !130
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !133
  %cmp = icmp eq i32* %1, null, !dbg !135
  br i1 %cmp, label %if.then2, label %if.end, !dbg !136

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !137
  call void @exit(i32 noundef 1) #6, !dbg !139
  unreachable, !dbg !139

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !146
  %cmp3 = icmp ult i64 %2, 100, !dbg !148
  br i1 %cmp3, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !150
  %4 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !150
  store i32 5, i32* %arrayidx, align 4, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %5, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !159
  store i32* %6, i32** %data, align 8, !dbg !160
  br label %if.end4, !dbg !161

if.end4:                                          ; preds = %for.end, %entry
  %7 = load i32*, i32** %data, align 8, !dbg !162
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !162
  %8 = load i32, i32* %arrayidx5, align 4, !dbg !162
  call void @printIntLine(i32 noundef %8), !dbg !163
  %9 = load i32*, i32** %data, align 8, !dbg !164
  %10 = bitcast i32* %9 to i8*, !dbg !164
  call void @free(i8* noundef %10) #5, !dbg !165
  ret void, !dbg !166
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_08.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "61a6cf1be4452cf1adec8e007a417d14")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_08_bad", scope: !1, file: !1, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 39, type: !3)
!19 = !DILocation(line: 39, column: 11, scope: !14)
!20 = !DILocation(line: 40, column: 10, scope: !14)
!21 = !DILocation(line: 41, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 41, column: 8)
!23 = !DILocation(line: 41, column: 8, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !1, line: 45, type: !3)
!25 = distinct !DILexicalBlock(scope: !26, file: !1, line: 43, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !1, line: 42, column: 5)
!27 = !DILocation(line: 45, column: 19, scope: !25)
!28 = !DILocation(line: 45, column: 39, scope: !25)
!29 = !DILocation(line: 45, column: 32, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !31, file: !1, line: 47, type: !32)
!31 = distinct !DILexicalBlock(scope: !25, file: !1, line: 46, column: 13)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !33, line: 46, baseType: !34)
!33 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!34 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 47, column: 24, scope: !31)
!36 = !DILocation(line: 48, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !1, line: 48, column: 17)
!38 = !DILocation(line: 48, column: 22, scope: !37)
!39 = !DILocation(line: 48, column: 29, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !1, line: 48, column: 17)
!41 = !DILocation(line: 48, column: 31, scope: !40)
!42 = !DILocation(line: 48, column: 17, scope: !37)
!43 = !DILocation(line: 50, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !1, line: 49, column: 17)
!45 = !DILocation(line: 50, column: 32, scope: !44)
!46 = !DILocation(line: 50, column: 35, scope: !44)
!47 = !DILocation(line: 51, column: 17, scope: !44)
!48 = !DILocation(line: 48, column: 39, scope: !40)
!49 = !DILocation(line: 48, column: 17, scope: !40)
!50 = distinct !{!50, !42, !51, !52}
!51 = !DILocation(line: 51, column: 17, scope: !37)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 53, column: 20, scope: !25)
!54 = !DILocation(line: 53, column: 18, scope: !25)
!55 = !DILocation(line: 55, column: 5, scope: !26)
!56 = !DILocation(line: 56, column: 18, scope: !14)
!57 = !DILocation(line: 56, column: 5, scope: !14)
!58 = !DILocation(line: 58, column: 10, scope: !14)
!59 = !DILocation(line: 58, column: 5, scope: !14)
!60 = !DILocation(line: 59, column: 1, scope: !14)
!61 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_08_good", scope: !1, file: !1, line: 130, type: !15, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!62 = !DILocation(line: 132, column: 5, scope: !61)
!63 = !DILocation(line: 133, column: 5, scope: !61)
!64 = !DILocation(line: 134, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !1, file: !1, line: 25, type: !66, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!66 = !DISubroutineType(types: !67)
!67 = !{!4}
!68 = !DILocation(line: 27, column: 5, scope: !65)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 66, type: !15, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!70 = !DILocalVariable(name: "data", scope: !69, file: !1, line: 68, type: !3)
!71 = !DILocation(line: 68, column: 11, scope: !69)
!72 = !DILocation(line: 69, column: 10, scope: !69)
!73 = !DILocation(line: 70, column: 8, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !1, line: 70, column: 8)
!75 = !DILocation(line: 70, column: 8, scope: !69)
!76 = !DILocation(line: 73, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !1, line: 71, column: 5)
!78 = !DILocation(line: 74, column: 5, scope: !77)
!79 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !1, line: 79, type: !3)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 77, column: 9)
!81 = distinct !DILexicalBlock(scope: !74, file: !1, line: 76, column: 5)
!82 = !DILocation(line: 79, column: 19, scope: !80)
!83 = !DILocation(line: 79, column: 39, scope: !80)
!84 = !DILocation(line: 79, column: 32, scope: !80)
!85 = !DILocation(line: 80, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !80, file: !1, line: 80, column: 17)
!87 = !DILocation(line: 80, column: 28, scope: !86)
!88 = !DILocation(line: 80, column: 17, scope: !80)
!89 = !DILocation(line: 82, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !1, line: 81, column: 13)
!91 = !DILocation(line: 83, column: 17, scope: !90)
!92 = !DILocalVariable(name: "i", scope: !93, file: !1, line: 86, type: !32)
!93 = distinct !DILexicalBlock(scope: !80, file: !1, line: 85, column: 13)
!94 = !DILocation(line: 86, column: 24, scope: !93)
!95 = !DILocation(line: 87, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !1, line: 87, column: 17)
!97 = !DILocation(line: 87, column: 22, scope: !96)
!98 = !DILocation(line: 87, column: 29, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !1, line: 87, column: 17)
!100 = !DILocation(line: 87, column: 31, scope: !99)
!101 = !DILocation(line: 87, column: 17, scope: !96)
!102 = !DILocation(line: 89, column: 21, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !1, line: 88, column: 17)
!104 = !DILocation(line: 89, column: 32, scope: !103)
!105 = !DILocation(line: 89, column: 35, scope: !103)
!106 = !DILocation(line: 90, column: 17, scope: !103)
!107 = !DILocation(line: 87, column: 39, scope: !99)
!108 = !DILocation(line: 87, column: 17, scope: !99)
!109 = distinct !{!109, !101, !110, !52}
!110 = !DILocation(line: 90, column: 17, scope: !96)
!111 = !DILocation(line: 92, column: 20, scope: !80)
!112 = !DILocation(line: 92, column: 18, scope: !80)
!113 = !DILocation(line: 95, column: 18, scope: !69)
!114 = !DILocation(line: 95, column: 5, scope: !69)
!115 = !DILocation(line: 97, column: 10, scope: !69)
!116 = !DILocation(line: 97, column: 5, scope: !69)
!117 = !DILocation(line: 98, column: 1, scope: !69)
!118 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !1, file: !1, line: 30, type: !66, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!119 = !DILocation(line: 32, column: 5, scope: !118)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 101, type: !15, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!121 = !DILocalVariable(name: "data", scope: !120, file: !1, line: 103, type: !3)
!122 = !DILocation(line: 103, column: 11, scope: !120)
!123 = !DILocation(line: 104, column: 10, scope: !120)
!124 = !DILocation(line: 105, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !1, line: 105, column: 8)
!126 = !DILocation(line: 105, column: 8, scope: !120)
!127 = !DILocalVariable(name: "dataBuffer", scope: !128, file: !1, line: 109, type: !3)
!128 = distinct !DILexicalBlock(scope: !129, file: !1, line: 107, column: 9)
!129 = distinct !DILexicalBlock(scope: !125, file: !1, line: 106, column: 5)
!130 = !DILocation(line: 109, column: 19, scope: !128)
!131 = !DILocation(line: 109, column: 39, scope: !128)
!132 = !DILocation(line: 109, column: 32, scope: !128)
!133 = !DILocation(line: 110, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !1, line: 110, column: 17)
!135 = !DILocation(line: 110, column: 28, scope: !134)
!136 = !DILocation(line: 110, column: 17, scope: !128)
!137 = !DILocation(line: 112, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !1, line: 111, column: 13)
!139 = !DILocation(line: 113, column: 17, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !141, file: !1, line: 116, type: !32)
!141 = distinct !DILexicalBlock(scope: !128, file: !1, line: 115, column: 13)
!142 = !DILocation(line: 116, column: 24, scope: !141)
!143 = !DILocation(line: 117, column: 24, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !1, line: 117, column: 17)
!145 = !DILocation(line: 117, column: 22, scope: !144)
!146 = !DILocation(line: 117, column: 29, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !1, line: 117, column: 17)
!148 = !DILocation(line: 117, column: 31, scope: !147)
!149 = !DILocation(line: 117, column: 17, scope: !144)
!150 = !DILocation(line: 119, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !1, line: 118, column: 17)
!152 = !DILocation(line: 119, column: 32, scope: !151)
!153 = !DILocation(line: 119, column: 35, scope: !151)
!154 = !DILocation(line: 120, column: 17, scope: !151)
!155 = !DILocation(line: 117, column: 39, scope: !147)
!156 = !DILocation(line: 117, column: 17, scope: !147)
!157 = distinct !{!157, !149, !158, !52}
!158 = !DILocation(line: 120, column: 17, scope: !144)
!159 = !DILocation(line: 122, column: 20, scope: !128)
!160 = !DILocation(line: 122, column: 18, scope: !128)
!161 = !DILocation(line: 124, column: 5, scope: !129)
!162 = !DILocation(line: 125, column: 18, scope: !120)
!163 = !DILocation(line: 125, column: 5, scope: !120)
!164 = !DILocation(line: 127, column: 10, scope: !120)
!165 = !DILocation(line: 127, column: 5, scope: !120)
!166 = !DILocation(line: 128, column: 1, scope: !120)
