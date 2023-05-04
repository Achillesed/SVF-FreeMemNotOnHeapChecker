; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_alloca_18.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  br label %source, !dbg !21

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !22), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 400, align 16, !dbg !27
  %1 = bitcast i8* %0 to i32*, !dbg !28
  store i32* %1, i32** %dataBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !34
  store i64 0, i64* %i, align 8, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %source
  %2 = load i64, i64* %i, align 8, !dbg !38
  %cmp = icmp ult i64 %2, 100, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  %4 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !42
  store i32 5, i32* %arrayidx, align 4, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !47
  %inc = add i64 %5, 1, !dbg !47
  store i64 %inc, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !52
  store i32* %6, i32** %data, align 8, !dbg !53
  %7 = load i32*, i32** %data, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !54
  %8 = load i32, i32* %arrayidx1, align 4, !dbg !54
  call void @printIntLine(i32 noundef %8), !dbg !55
  %9 = load i32*, i32** %data, align 8, !dbg !56
  %10 = bitcast i32* %9 to i8*, !dbg !56
  call void @free(i8* noundef %10) #5, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_18_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !62 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !63, metadata !DIExpression()), !dbg !64
  store i32* null, i32** %data, align 8, !dbg !65
  br label %source, !dbg !66

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !67), !dbg !68
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !69, metadata !DIExpression()), !dbg !71
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !72
  %0 = bitcast i8* %call to i32*, !dbg !73
  store i32* %0, i32** %dataBuffer, align 8, !dbg !71
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  %cmp = icmp eq i32* %1, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %source
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @exit(i32 noundef 1) #6, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata i64* %i, metadata !81, metadata !DIExpression()), !dbg !83
  store i64 0, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !87
  %cmp1 = icmp ult i64 %2, 100, !dbg !89
  br i1 %cmp1, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !91
  %4 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !91
  store i32 5, i32* %arrayidx, align 4, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %5, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  store i32* %6, i32** %data, align 8, !dbg !101
  %7 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !102
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !102
  call void @printIntLine(i32 noundef %8), !dbg !103
  %9 = load i32*, i32** %data, align 8, !dbg !104
  %10 = bitcast i32* %9 to i8*, !dbg !104
  call void @free(i8* noundef %10) #5, !dbg !105
  ret void, !dbg !106
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_18.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "43976ee9c28f08046d4f64d2ed352240")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_18_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 11, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILabel(scope: !14, name: "source", file: !1, line: 28)
!23 = !DILocation(line: 28, column: 1, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !1, line: 31, type: !3)
!25 = distinct !DILexicalBlock(scope: !14, file: !1, line: 29, column: 5)
!26 = !DILocation(line: 31, column: 15, scope: !25)
!27 = !DILocation(line: 31, column: 35, scope: !25)
!28 = !DILocation(line: 31, column: 28, scope: !25)
!29 = !DILocalVariable(name: "i", scope: !30, file: !1, line: 33, type: !31)
!30 = distinct !DILexicalBlock(scope: !25, file: !1, line: 32, column: 9)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!33 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 33, column: 20, scope: !30)
!35 = !DILocation(line: 34, column: 20, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !1, line: 34, column: 13)
!37 = !DILocation(line: 34, column: 18, scope: !36)
!38 = !DILocation(line: 34, column: 25, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !1, line: 34, column: 13)
!40 = !DILocation(line: 34, column: 27, scope: !39)
!41 = !DILocation(line: 34, column: 13, scope: !36)
!42 = !DILocation(line: 36, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !1, line: 35, column: 13)
!44 = !DILocation(line: 36, column: 28, scope: !43)
!45 = !DILocation(line: 36, column: 31, scope: !43)
!46 = !DILocation(line: 37, column: 13, scope: !43)
!47 = !DILocation(line: 34, column: 35, scope: !39)
!48 = !DILocation(line: 34, column: 13, scope: !39)
!49 = distinct !{!49, !41, !50, !51}
!50 = !DILocation(line: 37, column: 13, scope: !36)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 39, column: 16, scope: !25)
!53 = !DILocation(line: 39, column: 14, scope: !25)
!54 = !DILocation(line: 41, column: 18, scope: !14)
!55 = !DILocation(line: 41, column: 5, scope: !14)
!56 = !DILocation(line: 43, column: 10, scope: !14)
!57 = !DILocation(line: 43, column: 5, scope: !14)
!58 = !DILocation(line: 44, column: 1, scope: !14)
!59 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_18_good", scope: !1, file: !1, line: 79, type: !15, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!60 = !DILocation(line: 81, column: 5, scope: !59)
!61 = !DILocation(line: 82, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!63 = !DILocalVariable(name: "data", scope: !62, file: !1, line: 53, type: !3)
!64 = !DILocation(line: 53, column: 11, scope: !62)
!65 = !DILocation(line: 54, column: 10, scope: !62)
!66 = !DILocation(line: 55, column: 5, scope: !62)
!67 = !DILabel(scope: !62, name: "source", file: !1, line: 56)
!68 = !DILocation(line: 56, column: 1, scope: !62)
!69 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !1, line: 59, type: !3)
!70 = distinct !DILexicalBlock(scope: !62, file: !1, line: 57, column: 5)
!71 = !DILocation(line: 59, column: 15, scope: !70)
!72 = !DILocation(line: 59, column: 35, scope: !70)
!73 = !DILocation(line: 59, column: 28, scope: !70)
!74 = !DILocation(line: 60, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !1, line: 60, column: 13)
!76 = !DILocation(line: 60, column: 24, scope: !75)
!77 = !DILocation(line: 60, column: 13, scope: !70)
!78 = !DILocation(line: 62, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !1, line: 61, column: 9)
!80 = !DILocation(line: 63, column: 13, scope: !79)
!81 = !DILocalVariable(name: "i", scope: !82, file: !1, line: 66, type: !31)
!82 = distinct !DILexicalBlock(scope: !70, file: !1, line: 65, column: 9)
!83 = !DILocation(line: 66, column: 20, scope: !82)
!84 = !DILocation(line: 67, column: 20, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !1, line: 67, column: 13)
!86 = !DILocation(line: 67, column: 18, scope: !85)
!87 = !DILocation(line: 67, column: 25, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !1, line: 67, column: 13)
!89 = !DILocation(line: 67, column: 27, scope: !88)
!90 = !DILocation(line: 67, column: 13, scope: !85)
!91 = !DILocation(line: 69, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !1, line: 68, column: 13)
!93 = !DILocation(line: 69, column: 28, scope: !92)
!94 = !DILocation(line: 69, column: 31, scope: !92)
!95 = !DILocation(line: 70, column: 13, scope: !92)
!96 = !DILocation(line: 67, column: 35, scope: !88)
!97 = !DILocation(line: 67, column: 13, scope: !88)
!98 = distinct !{!98, !90, !99, !51}
!99 = !DILocation(line: 70, column: 13, scope: !85)
!100 = !DILocation(line: 72, column: 16, scope: !70)
!101 = !DILocation(line: 72, column: 14, scope: !70)
!102 = !DILocation(line: 74, column: 18, scope: !62)
!103 = !DILocation(line: 74, column: 5, scope: !62)
!104 = !DILocation(line: 76, column: 10, scope: !62)
!105 = !DILocation(line: 76, column: 5, scope: !62)
!106 = !DILocation(line: 77, column: 1, scope: !62)
