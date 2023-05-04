; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_alloca_32.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
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
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 400, align 16, !dbg !34
  %3 = bitcast i8* %2 to i32*, !dbg !35
  store i32* %3, i32** %dataBuffer, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %4, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !49
  %6 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !49
  store i32 5, i32* %arrayidx, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %7, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %dataBuffer, align 8, !dbg !59
  store i32* %8, i32** %data1, align 8, !dbg !60
  %9 = load i32*, i32** %data1, align 8, !dbg !61
  %10 = load i32**, i32*** %dataPtr1, align 8, !dbg !62
  store i32* %9, i32** %10, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !64, metadata !DIExpression()), !dbg !66
  %11 = load i32**, i32*** %dataPtr2, align 8, !dbg !67
  %12 = load i32*, i32** %11, align 8, !dbg !68
  store i32* %12, i32** %data2, align 8, !dbg !66
  %13 = load i32*, i32** %data2, align 8, !dbg !69
  %arrayidx3 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !69
  %14 = load i32, i32* %arrayidx3, align 4, !dbg !69
  call void @printIntLine(i32 noundef %14), !dbg !70
  %15 = load i32*, i32** %data2, align 8, !dbg !71
  %16 = bitcast i32* %15 to i8*, !dbg !71
  call void @free(i8* noundef %16) #5, !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_32_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %data3 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !80, metadata !DIExpression()), !dbg !81
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !82, metadata !DIExpression()), !dbg !83
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !83
  store i32* null, i32** %data, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !85, metadata !DIExpression()), !dbg !87
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !88
  %1 = load i32*, i32** %0, align 8, !dbg !89
  store i32* %1, i32** %data1, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !90, metadata !DIExpression()), !dbg !92
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !93
  %2 = bitcast i8* %call to i32*, !dbg !94
  store i32* %2, i32** %dataBuffer, align 8, !dbg !92
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !95
  %cmp = icmp eq i32* %3, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @exit(i32 noundef 1) #6, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !102, metadata !DIExpression()), !dbg !104
  store i64 0, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !107

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !108
  %cmp2 = icmp ult i64 %4, 100, !dbg !110
  br i1 %cmp2, label %for.body, label %for.end, !dbg !111

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !112
  %6 = load i64, i64* %i, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !112
  store i32 5, i32* %arrayidx, align 4, !dbg !115
  br label %for.inc, !dbg !116

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !117
  %inc = add i64 %7, 1, !dbg !117
  store i64 %inc, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !118, !llvm.loop !119

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %dataBuffer, align 8, !dbg !121
  store i32* %8, i32** %data1, align 8, !dbg !122
  %9 = load i32*, i32** %data1, align 8, !dbg !123
  %10 = load i32**, i32*** %dataPtr1, align 8, !dbg !124
  store i32* %9, i32** %10, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !126, metadata !DIExpression()), !dbg !128
  %11 = load i32**, i32*** %dataPtr2, align 8, !dbg !129
  %12 = load i32*, i32** %11, align 8, !dbg !130
  store i32* %12, i32** %data3, align 8, !dbg !128
  %13 = load i32*, i32** %data3, align 8, !dbg !131
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !131
  %14 = load i32, i32* %arrayidx4, align 4, !dbg !131
  call void @printIntLine(i32 noundef %14), !dbg !132
  %15 = load i32*, i32** %data3, align 8, !dbg !133
  %16 = bitcast i32* %15 to i8*, !dbg !133
  call void @free(i8* noundef %16) #5, !dbg !134
  ret void, !dbg !135
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_32.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "d3105b3781af50f81ec360261e8aef43")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_32_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
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
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !1, line: 33, type: !3)
!32 = distinct !DILexicalBlock(scope: !27, file: !1, line: 31, column: 9)
!33 = !DILocation(line: 33, column: 19, scope: !32)
!34 = !DILocation(line: 33, column: 39, scope: !32)
!35 = !DILocation(line: 33, column: 32, scope: !32)
!36 = !DILocalVariable(name: "i", scope: !37, file: !1, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !32, file: !1, line: 34, column: 13)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 35, column: 24, scope: !37)
!42 = !DILocation(line: 36, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !1, line: 36, column: 17)
!44 = !DILocation(line: 36, column: 22, scope: !43)
!45 = !DILocation(line: 36, column: 29, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !1, line: 36, column: 17)
!47 = !DILocation(line: 36, column: 31, scope: !46)
!48 = !DILocation(line: 36, column: 17, scope: !43)
!49 = !DILocation(line: 38, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 37, column: 17)
!51 = !DILocation(line: 38, column: 32, scope: !50)
!52 = !DILocation(line: 38, column: 35, scope: !50)
!53 = !DILocation(line: 39, column: 17, scope: !50)
!54 = !DILocation(line: 36, column: 39, scope: !46)
!55 = !DILocation(line: 36, column: 17, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 39, column: 17, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 41, column: 20, scope: !32)
!60 = !DILocation(line: 41, column: 18, scope: !32)
!61 = !DILocation(line: 43, column: 21, scope: !27)
!62 = !DILocation(line: 43, column: 10, scope: !27)
!63 = !DILocation(line: 43, column: 19, scope: !27)
!64 = !DILocalVariable(name: "data", scope: !65, file: !1, line: 46, type: !3)
!65 = distinct !DILexicalBlock(scope: !14, file: !1, line: 45, column: 5)
!66 = !DILocation(line: 46, column: 15, scope: !65)
!67 = !DILocation(line: 46, column: 23, scope: !65)
!68 = !DILocation(line: 46, column: 22, scope: !65)
!69 = !DILocation(line: 47, column: 22, scope: !65)
!70 = !DILocation(line: 47, column: 9, scope: !65)
!71 = !DILocation(line: 49, column: 14, scope: !65)
!72 = !DILocation(line: 49, column: 9, scope: !65)
!73 = !DILocation(line: 51, column: 1, scope: !14)
!74 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_32_good", scope: !1, file: !1, line: 93, type: !15, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!75 = !DILocation(line: 95, column: 5, scope: !74)
!76 = !DILocation(line: 96, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 58, type: !15, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!78 = !DILocalVariable(name: "data", scope: !77, file: !1, line: 60, type: !3)
!79 = !DILocation(line: 60, column: 11, scope: !77)
!80 = !DILocalVariable(name: "dataPtr1", scope: !77, file: !1, line: 61, type: !21)
!81 = !DILocation(line: 61, column: 12, scope: !77)
!82 = !DILocalVariable(name: "dataPtr2", scope: !77, file: !1, line: 62, type: !21)
!83 = !DILocation(line: 62, column: 12, scope: !77)
!84 = !DILocation(line: 63, column: 10, scope: !77)
!85 = !DILocalVariable(name: "data", scope: !86, file: !1, line: 65, type: !3)
!86 = distinct !DILexicalBlock(scope: !77, file: !1, line: 64, column: 5)
!87 = !DILocation(line: 65, column: 15, scope: !86)
!88 = !DILocation(line: 65, column: 23, scope: !86)
!89 = !DILocation(line: 65, column: 22, scope: !86)
!90 = !DILocalVariable(name: "dataBuffer", scope: !91, file: !1, line: 68, type: !3)
!91 = distinct !DILexicalBlock(scope: !86, file: !1, line: 66, column: 9)
!92 = !DILocation(line: 68, column: 19, scope: !91)
!93 = !DILocation(line: 68, column: 39, scope: !91)
!94 = !DILocation(line: 68, column: 32, scope: !91)
!95 = !DILocation(line: 69, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !1, line: 69, column: 17)
!97 = !DILocation(line: 69, column: 28, scope: !96)
!98 = !DILocation(line: 69, column: 17, scope: !91)
!99 = !DILocation(line: 71, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !1, line: 70, column: 13)
!101 = !DILocation(line: 72, column: 17, scope: !100)
!102 = !DILocalVariable(name: "i", scope: !103, file: !1, line: 75, type: !38)
!103 = distinct !DILexicalBlock(scope: !91, file: !1, line: 74, column: 13)
!104 = !DILocation(line: 75, column: 24, scope: !103)
!105 = !DILocation(line: 76, column: 24, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !1, line: 76, column: 17)
!107 = !DILocation(line: 76, column: 22, scope: !106)
!108 = !DILocation(line: 76, column: 29, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !1, line: 76, column: 17)
!110 = !DILocation(line: 76, column: 31, scope: !109)
!111 = !DILocation(line: 76, column: 17, scope: !106)
!112 = !DILocation(line: 78, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !1, line: 77, column: 17)
!114 = !DILocation(line: 78, column: 32, scope: !113)
!115 = !DILocation(line: 78, column: 35, scope: !113)
!116 = !DILocation(line: 79, column: 17, scope: !113)
!117 = !DILocation(line: 76, column: 39, scope: !109)
!118 = !DILocation(line: 76, column: 17, scope: !109)
!119 = distinct !{!119, !111, !120, !58}
!120 = !DILocation(line: 79, column: 17, scope: !106)
!121 = !DILocation(line: 81, column: 20, scope: !91)
!122 = !DILocation(line: 81, column: 18, scope: !91)
!123 = !DILocation(line: 83, column: 21, scope: !86)
!124 = !DILocation(line: 83, column: 10, scope: !86)
!125 = !DILocation(line: 83, column: 19, scope: !86)
!126 = !DILocalVariable(name: "data", scope: !127, file: !1, line: 86, type: !3)
!127 = distinct !DILexicalBlock(scope: !77, file: !1, line: 85, column: 5)
!128 = !DILocation(line: 86, column: 15, scope: !127)
!129 = !DILocation(line: 86, column: 23, scope: !127)
!130 = !DILocation(line: 86, column: 22, scope: !127)
!131 = !DILocation(line: 87, column: 22, scope: !127)
!132 = !DILocation(line: 87, column: 9, scope: !127)
!133 = !DILocation(line: 89, column: 14, scope: !127)
!134 = !DILocation(line: 89, column: 9, scope: !127)
!135 = !DILocation(line: 91, column: 1, scope: !77)
