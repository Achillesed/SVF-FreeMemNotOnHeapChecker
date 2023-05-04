; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_declare_18.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_declare_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  br label %source, !dbg !21

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !22), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %source
  %0 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %0, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 %1, !dbg !45
  store i32 5, i32* %arrayidx, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %2, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !53
  store i32* %arraydecay, i32** %data, align 8, !dbg !54
  %3 = load i32*, i32** %data, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds i32, i32* %3, i64 0, !dbg !55
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !55
  call void @printIntLine(i32 noundef %4), !dbg !56
  %5 = load i32*, i32** %data, align 8, !dbg !57
  %6 = bitcast i32* %5 to i8*, !dbg !57
  call void @free(i8* noundef %6) #5, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_18_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !63 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !64, metadata !DIExpression()), !dbg !65
  store i32* null, i32** %data, align 8, !dbg !66
  br label %source, !dbg !67

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !68), !dbg !69
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !72
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !73
  %0 = bitcast i8* %call to i32*, !dbg !74
  store i32* %0, i32** %dataBuffer, align 8, !dbg !72
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !75
  %cmp = icmp eq i32* %1, null, !dbg !77
  br i1 %cmp, label %if.then, label %if.end, !dbg !78

if.then:                                          ; preds = %source
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @exit(i32 noundef 1) #6, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata i64* %i, metadata !82, metadata !DIExpression()), !dbg !84
  store i64 0, i64* %i, align 8, !dbg !85
  br label %for.cond, !dbg !87

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !88
  %cmp1 = icmp ult i64 %2, 100, !dbg !90
  br i1 %cmp1, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !92
  %4 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !92
  store i32 5, i32* %arrayidx, align 4, !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !97
  %inc = add i64 %5, 1, !dbg !97
  store i64 %inc, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !101
  store i32* %6, i32** %data, align 8, !dbg !102
  %7 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !103
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !103
  call void @printIntLine(i32 noundef %8), !dbg !104
  %9 = load i32*, i32** %data, align 8, !dbg !105
  %10 = bitcast i32* %9 to i8*, !dbg !105
  call void @free(i8* noundef %10) #5, !dbg !106
  ret void, !dbg !107
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_18.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "afd78e7da11cfd0daa270264a5594d59")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_18_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 11, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILabel(scope: !14, name: "source", file: !1, line: 28)
!23 = !DILocation(line: 28, column: 1, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !1, line: 31, type: !26)
!25 = distinct !DILexicalBlock(scope: !14, file: !1, line: 29, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 31, column: 13, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !31, file: !1, line: 33, type: !32)
!31 = distinct !DILexicalBlock(scope: !25, file: !1, line: 32, column: 9)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !33, line: 46, baseType: !34)
!33 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!34 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 33, column: 20, scope: !31)
!36 = !DILocation(line: 34, column: 20, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !1, line: 34, column: 13)
!38 = !DILocation(line: 34, column: 18, scope: !37)
!39 = !DILocation(line: 34, column: 25, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !1, line: 34, column: 13)
!41 = !DILocation(line: 34, column: 27, scope: !40)
!42 = !DILocation(line: 34, column: 13, scope: !37)
!43 = !DILocation(line: 36, column: 28, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !1, line: 35, column: 13)
!45 = !DILocation(line: 36, column: 17, scope: !44)
!46 = !DILocation(line: 36, column: 31, scope: !44)
!47 = !DILocation(line: 37, column: 13, scope: !44)
!48 = !DILocation(line: 34, column: 35, scope: !40)
!49 = !DILocation(line: 34, column: 13, scope: !40)
!50 = distinct !{!50, !42, !51, !52}
!51 = !DILocation(line: 37, column: 13, scope: !37)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 39, column: 16, scope: !25)
!54 = !DILocation(line: 39, column: 14, scope: !25)
!55 = !DILocation(line: 41, column: 18, scope: !14)
!56 = !DILocation(line: 41, column: 5, scope: !14)
!57 = !DILocation(line: 43, column: 10, scope: !14)
!58 = !DILocation(line: 43, column: 5, scope: !14)
!59 = !DILocation(line: 44, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_18_good", scope: !1, file: !1, line: 79, type: !15, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!61 = !DILocation(line: 81, column: 5, scope: !60)
!62 = !DILocation(line: 82, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!64 = !DILocalVariable(name: "data", scope: !63, file: !1, line: 53, type: !3)
!65 = !DILocation(line: 53, column: 11, scope: !63)
!66 = !DILocation(line: 54, column: 10, scope: !63)
!67 = !DILocation(line: 55, column: 5, scope: !63)
!68 = !DILabel(scope: !63, name: "source", file: !1, line: 56)
!69 = !DILocation(line: 56, column: 1, scope: !63)
!70 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !1, line: 59, type: !3)
!71 = distinct !DILexicalBlock(scope: !63, file: !1, line: 57, column: 5)
!72 = !DILocation(line: 59, column: 15, scope: !71)
!73 = !DILocation(line: 59, column: 35, scope: !71)
!74 = !DILocation(line: 59, column: 28, scope: !71)
!75 = !DILocation(line: 60, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !71, file: !1, line: 60, column: 13)
!77 = !DILocation(line: 60, column: 24, scope: !76)
!78 = !DILocation(line: 60, column: 13, scope: !71)
!79 = !DILocation(line: 62, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !1, line: 61, column: 9)
!81 = !DILocation(line: 63, column: 13, scope: !80)
!82 = !DILocalVariable(name: "i", scope: !83, file: !1, line: 66, type: !32)
!83 = distinct !DILexicalBlock(scope: !71, file: !1, line: 65, column: 9)
!84 = !DILocation(line: 66, column: 20, scope: !83)
!85 = !DILocation(line: 67, column: 20, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !1, line: 67, column: 13)
!87 = !DILocation(line: 67, column: 18, scope: !86)
!88 = !DILocation(line: 67, column: 25, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !1, line: 67, column: 13)
!90 = !DILocation(line: 67, column: 27, scope: !89)
!91 = !DILocation(line: 67, column: 13, scope: !86)
!92 = !DILocation(line: 69, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !1, line: 68, column: 13)
!94 = !DILocation(line: 69, column: 28, scope: !93)
!95 = !DILocation(line: 69, column: 31, scope: !93)
!96 = !DILocation(line: 70, column: 13, scope: !93)
!97 = !DILocation(line: 67, column: 35, scope: !89)
!98 = !DILocation(line: 67, column: 13, scope: !89)
!99 = distinct !{!99, !91, !100, !52}
!100 = !DILocation(line: 70, column: 13, scope: !86)
!101 = !DILocation(line: 72, column: 16, scope: !71)
!102 = !DILocation(line: 72, column: 14, scope: !71)
!103 = !DILocation(line: 74, column: 18, scope: !63)
!104 = !DILocation(line: 74, column: 5, scope: !63)
!105 = !DILocation(line: 76, column: 10, scope: !63)
!106 = !DILocation(line: 76, column: 5, scope: !63)
!107 = !DILocation(line: 77, column: 1, scope: !63)
