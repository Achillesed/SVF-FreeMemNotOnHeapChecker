; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_declare_32.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_declare_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %data2 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !29
  %1 = load i32*, i32** %0, align 8, !dbg !30
  store i32* %1, i32** %data1, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %2, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 %3, !dbg !52
  store i32 5, i32* %arrayidx, align 4, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %4, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !60
  store i32* %arraydecay, i32** %data1, align 8, !dbg !61
  %5 = load i32*, i32** %data1, align 8, !dbg !62
  %6 = load i32**, i32*** %dataPtr1, align 8, !dbg !63
  store i32* %5, i32** %6, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !65, metadata !DIExpression()), !dbg !67
  %7 = load i32**, i32*** %dataPtr2, align 8, !dbg !68
  %8 = load i32*, i32** %7, align 8, !dbg !69
  store i32* %8, i32** %data2, align 8, !dbg !67
  %9 = load i32*, i32** %data2, align 8, !dbg !70
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !70
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !70
  call void @printIntLine(i32 noundef %10), !dbg !71
  %11 = load i32*, i32** %data2, align 8, !dbg !72
  %12 = bitcast i32* %11 to i8*, !dbg !72
  call void @free(i8* noundef %12) #5, !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_32_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %data3 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !81, metadata !DIExpression()), !dbg !82
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !83, metadata !DIExpression()), !dbg !84
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !84
  store i32* null, i32** %data, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !86, metadata !DIExpression()), !dbg !88
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !89
  %1 = load i32*, i32** %0, align 8, !dbg !90
  store i32* %1, i32** %data1, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !93
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !94
  %2 = bitcast i8* %call to i32*, !dbg !95
  store i32* %2, i32** %dataBuffer, align 8, !dbg !93
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !96
  %cmp = icmp eq i32* %3, null, !dbg !98
  br i1 %cmp, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @exit(i32 noundef 1) #6, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !103, metadata !DIExpression()), !dbg !105
  store i64 0, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !109
  %cmp2 = icmp ult i64 %4, 100, !dbg !111
  br i1 %cmp2, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  %6 = load i64, i64* %i, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !113
  store i32 5, i32* %arrayidx, align 4, !dbg !116
  br label %for.inc, !dbg !117

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !118
  %inc = add i64 %7, 1, !dbg !118
  store i64 %inc, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !119, !llvm.loop !120

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %dataBuffer, align 8, !dbg !122
  store i32* %8, i32** %data1, align 8, !dbg !123
  %9 = load i32*, i32** %data1, align 8, !dbg !124
  %10 = load i32**, i32*** %dataPtr1, align 8, !dbg !125
  store i32* %9, i32** %10, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !127, metadata !DIExpression()), !dbg !129
  %11 = load i32**, i32*** %dataPtr2, align 8, !dbg !130
  %12 = load i32*, i32** %11, align 8, !dbg !131
  store i32* %12, i32** %data3, align 8, !dbg !129
  %13 = load i32*, i32** %data3, align 8, !dbg !132
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !132
  %14 = load i32, i32* %arrayidx4, align 4, !dbg !132
  call void @printIntLine(i32 noundef %14), !dbg !133
  %15 = load i32*, i32** %data3, align 8, !dbg !134
  %16 = bitcast i32* %15 to i8*, !dbg !134
  call void @free(i8* noundef %16) #5, !dbg !135
  ret void, !dbg !136
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_32.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "2f10138cf5897397ef330de7cb9448cf")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_32_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 11, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !1, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!22 = !DILocation(line: 26, column: 12, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !1, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 12, scope: !14)
!25 = !DILocation(line: 28, column: 10, scope: !14)
!26 = !DILocalVariable(name: "data", scope: !27, file: !1, line: 30, type: !3)
!27 = distinct !DILexicalBlock(scope: !14, file: !1, line: 29, column: 5)
!28 = !DILocation(line: 30, column: 15, scope: !27)
!29 = !DILocation(line: 30, column: 23, scope: !27)
!30 = !DILocation(line: 30, column: 22, scope: !27)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !1, line: 33, type: !33)
!32 = distinct !DILexicalBlock(scope: !27, file: !1, line: 31, column: 9)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 33, column: 17, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !38, file: !1, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !32, file: !1, line: 34, column: 13)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 35, column: 24, scope: !38)
!43 = !DILocation(line: 36, column: 24, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !1, line: 36, column: 17)
!45 = !DILocation(line: 36, column: 22, scope: !44)
!46 = !DILocation(line: 36, column: 29, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !1, line: 36, column: 17)
!48 = !DILocation(line: 36, column: 31, scope: !47)
!49 = !DILocation(line: 36, column: 17, scope: !44)
!50 = !DILocation(line: 38, column: 32, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 37, column: 17)
!52 = !DILocation(line: 38, column: 21, scope: !51)
!53 = !DILocation(line: 38, column: 35, scope: !51)
!54 = !DILocation(line: 39, column: 17, scope: !51)
!55 = !DILocation(line: 36, column: 39, scope: !47)
!56 = !DILocation(line: 36, column: 17, scope: !47)
!57 = distinct !{!57, !49, !58, !59}
!58 = !DILocation(line: 39, column: 17, scope: !44)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 41, column: 20, scope: !32)
!61 = !DILocation(line: 41, column: 18, scope: !32)
!62 = !DILocation(line: 43, column: 21, scope: !27)
!63 = !DILocation(line: 43, column: 10, scope: !27)
!64 = !DILocation(line: 43, column: 19, scope: !27)
!65 = !DILocalVariable(name: "data", scope: !66, file: !1, line: 46, type: !3)
!66 = distinct !DILexicalBlock(scope: !14, file: !1, line: 45, column: 5)
!67 = !DILocation(line: 46, column: 15, scope: !66)
!68 = !DILocation(line: 46, column: 23, scope: !66)
!69 = !DILocation(line: 46, column: 22, scope: !66)
!70 = !DILocation(line: 47, column: 22, scope: !66)
!71 = !DILocation(line: 47, column: 9, scope: !66)
!72 = !DILocation(line: 49, column: 14, scope: !66)
!73 = !DILocation(line: 49, column: 9, scope: !66)
!74 = !DILocation(line: 51, column: 1, scope: !14)
!75 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_32_good", scope: !1, file: !1, line: 93, type: !15, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!76 = !DILocation(line: 95, column: 5, scope: !75)
!77 = !DILocation(line: 96, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 58, type: !15, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!79 = !DILocalVariable(name: "data", scope: !78, file: !1, line: 60, type: !3)
!80 = !DILocation(line: 60, column: 11, scope: !78)
!81 = !DILocalVariable(name: "dataPtr1", scope: !78, file: !1, line: 61, type: !21)
!82 = !DILocation(line: 61, column: 12, scope: !78)
!83 = !DILocalVariable(name: "dataPtr2", scope: !78, file: !1, line: 62, type: !21)
!84 = !DILocation(line: 62, column: 12, scope: !78)
!85 = !DILocation(line: 63, column: 10, scope: !78)
!86 = !DILocalVariable(name: "data", scope: !87, file: !1, line: 65, type: !3)
!87 = distinct !DILexicalBlock(scope: !78, file: !1, line: 64, column: 5)
!88 = !DILocation(line: 65, column: 15, scope: !87)
!89 = !DILocation(line: 65, column: 23, scope: !87)
!90 = !DILocation(line: 65, column: 22, scope: !87)
!91 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !1, line: 68, type: !3)
!92 = distinct !DILexicalBlock(scope: !87, file: !1, line: 66, column: 9)
!93 = !DILocation(line: 68, column: 19, scope: !92)
!94 = !DILocation(line: 68, column: 39, scope: !92)
!95 = !DILocation(line: 68, column: 32, scope: !92)
!96 = !DILocation(line: 69, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !1, line: 69, column: 17)
!98 = !DILocation(line: 69, column: 28, scope: !97)
!99 = !DILocation(line: 69, column: 17, scope: !92)
!100 = !DILocation(line: 71, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !1, line: 70, column: 13)
!102 = !DILocation(line: 72, column: 17, scope: !101)
!103 = !DILocalVariable(name: "i", scope: !104, file: !1, line: 75, type: !39)
!104 = distinct !DILexicalBlock(scope: !92, file: !1, line: 74, column: 13)
!105 = !DILocation(line: 75, column: 24, scope: !104)
!106 = !DILocation(line: 76, column: 24, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !1, line: 76, column: 17)
!108 = !DILocation(line: 76, column: 22, scope: !107)
!109 = !DILocation(line: 76, column: 29, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !1, line: 76, column: 17)
!111 = !DILocation(line: 76, column: 31, scope: !110)
!112 = !DILocation(line: 76, column: 17, scope: !107)
!113 = !DILocation(line: 78, column: 21, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !1, line: 77, column: 17)
!115 = !DILocation(line: 78, column: 32, scope: !114)
!116 = !DILocation(line: 78, column: 35, scope: !114)
!117 = !DILocation(line: 79, column: 17, scope: !114)
!118 = !DILocation(line: 76, column: 39, scope: !110)
!119 = !DILocation(line: 76, column: 17, scope: !110)
!120 = distinct !{!120, !112, !121, !59}
!121 = !DILocation(line: 79, column: 17, scope: !107)
!122 = !DILocation(line: 81, column: 20, scope: !92)
!123 = !DILocation(line: 81, column: 18, scope: !92)
!124 = !DILocation(line: 83, column: 21, scope: !87)
!125 = !DILocation(line: 83, column: 10, scope: !87)
!126 = !DILocation(line: 83, column: 19, scope: !87)
!127 = !DILocalVariable(name: "data", scope: !128, file: !1, line: 86, type: !3)
!128 = distinct !DILexicalBlock(scope: !78, file: !1, line: 85, column: 5)
!129 = !DILocation(line: 86, column: 15, scope: !128)
!130 = !DILocation(line: 86, column: 23, scope: !128)
!131 = !DILocation(line: 86, column: 22, scope: !128)
!132 = !DILocation(line: 87, column: 22, scope: !128)
!133 = !DILocation(line: 87, column: 9, scope: !128)
!134 = !DILocation(line: 89, column: 14, scope: !128)
!135 = !DILocation(line: 89, column: 9, scope: !128)
!136 = !DILocation(line: 91, column: 1, scope: !78)
