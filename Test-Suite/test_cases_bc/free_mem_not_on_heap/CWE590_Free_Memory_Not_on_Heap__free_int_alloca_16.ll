; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_alloca_16.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_16_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  br label %while.body, !dbg !21

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !22, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 400, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !28, metadata !DIExpression()), !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %while.body
  %2 = load i64, i64* %i, align 8, !dbg !37
  %cmp = icmp ult i64 %2, 100, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !41
  %4 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !41
  store i32 5, i32* %arrayidx, align 4, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !46
  %inc = add i64 %5, 1, !dbg !46
  store i64 %inc, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !51
  store i32* %6, i32** %data, align 8, !dbg !52
  br label %while.end, !dbg !53

while.end:                                        ; preds = %for.end
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

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_16_good() #0 !dbg !59 {
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
  br label %while.body, !dbg !66

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !67, metadata !DIExpression()), !dbg !70
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !71
  %0 = bitcast i8* %call to i32*, !dbg !72
  store i32* %0, i32** %dataBuffer, align 8, !dbg !70
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !73
  %cmp = icmp eq i32* %1, null, !dbg !75
  br i1 %cmp, label %if.then, label %if.end, !dbg !76

if.then:                                          ; preds = %while.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @exit(i32 noundef 1) #6, !dbg !79
  unreachable, !dbg !79

if.end:                                           ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !80, metadata !DIExpression()), !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !86
  %cmp1 = icmp ult i64 %2, 100, !dbg !88
  br i1 %cmp1, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !90
  %4 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !90
  store i32 5, i32* %arrayidx, align 4, !dbg !93
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !95
  %inc = add i64 %5, 1, !dbg !95
  store i64 %inc, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !99
  store i32* %6, i32** %data, align 8, !dbg !100
  br label %while.end, !dbg !101

while.end:                                        ; preds = %for.end
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_16.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "28b2afa0db52592a7bce0912fb1b0f0e")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_16_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 11, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !1, line: 31, type: !3)
!23 = distinct !DILexicalBlock(scope: !24, file: !1, line: 29, column: 9)
!24 = distinct !DILexicalBlock(scope: !14, file: !1, line: 28, column: 5)
!25 = !DILocation(line: 31, column: 19, scope: !23)
!26 = !DILocation(line: 31, column: 39, scope: !23)
!27 = !DILocation(line: 31, column: 32, scope: !23)
!28 = !DILocalVariable(name: "i", scope: !29, file: !1, line: 33, type: !30)
!29 = distinct !DILexicalBlock(scope: !23, file: !1, line: 32, column: 13)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 46, baseType: !32)
!31 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!32 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 33, column: 24, scope: !29)
!34 = !DILocation(line: 34, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !1, line: 34, column: 17)
!36 = !DILocation(line: 34, column: 22, scope: !35)
!37 = !DILocation(line: 34, column: 29, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !1, line: 34, column: 17)
!39 = !DILocation(line: 34, column: 31, scope: !38)
!40 = !DILocation(line: 34, column: 17, scope: !35)
!41 = !DILocation(line: 36, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !1, line: 35, column: 17)
!43 = !DILocation(line: 36, column: 32, scope: !42)
!44 = !DILocation(line: 36, column: 35, scope: !42)
!45 = !DILocation(line: 37, column: 17, scope: !42)
!46 = !DILocation(line: 34, column: 39, scope: !38)
!47 = !DILocation(line: 34, column: 17, scope: !38)
!48 = distinct !{!48, !40, !49, !50}
!49 = !DILocation(line: 37, column: 17, scope: !35)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocation(line: 39, column: 20, scope: !23)
!52 = !DILocation(line: 39, column: 18, scope: !23)
!53 = !DILocation(line: 41, column: 9, scope: !24)
!54 = !DILocation(line: 43, column: 18, scope: !14)
!55 = !DILocation(line: 43, column: 5, scope: !14)
!56 = !DILocation(line: 45, column: 10, scope: !14)
!57 = !DILocation(line: 45, column: 5, scope: !14)
!58 = !DILocation(line: 46, column: 1, scope: !14)
!59 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_16_good", scope: !1, file: !1, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!60 = !DILocation(line: 85, column: 5, scope: !59)
!61 = !DILocation(line: 86, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!63 = !DILocalVariable(name: "data", scope: !62, file: !1, line: 55, type: !3)
!64 = !DILocation(line: 55, column: 11, scope: !62)
!65 = !DILocation(line: 56, column: 10, scope: !62)
!66 = !DILocation(line: 57, column: 5, scope: !62)
!67 = !DILocalVariable(name: "dataBuffer", scope: !68, file: !1, line: 61, type: !3)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 59, column: 9)
!69 = distinct !DILexicalBlock(scope: !62, file: !1, line: 58, column: 5)
!70 = !DILocation(line: 61, column: 19, scope: !68)
!71 = !DILocation(line: 61, column: 39, scope: !68)
!72 = !DILocation(line: 61, column: 32, scope: !68)
!73 = !DILocation(line: 62, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !68, file: !1, line: 62, column: 17)
!75 = !DILocation(line: 62, column: 28, scope: !74)
!76 = !DILocation(line: 62, column: 17, scope: !68)
!77 = !DILocation(line: 64, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !1, line: 63, column: 13)
!79 = !DILocation(line: 65, column: 17, scope: !78)
!80 = !DILocalVariable(name: "i", scope: !81, file: !1, line: 68, type: !30)
!81 = distinct !DILexicalBlock(scope: !68, file: !1, line: 67, column: 13)
!82 = !DILocation(line: 68, column: 24, scope: !81)
!83 = !DILocation(line: 69, column: 24, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !1, line: 69, column: 17)
!85 = !DILocation(line: 69, column: 22, scope: !84)
!86 = !DILocation(line: 69, column: 29, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !1, line: 69, column: 17)
!88 = !DILocation(line: 69, column: 31, scope: !87)
!89 = !DILocation(line: 69, column: 17, scope: !84)
!90 = !DILocation(line: 71, column: 21, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !1, line: 70, column: 17)
!92 = !DILocation(line: 71, column: 32, scope: !91)
!93 = !DILocation(line: 71, column: 35, scope: !91)
!94 = !DILocation(line: 72, column: 17, scope: !91)
!95 = !DILocation(line: 69, column: 39, scope: !87)
!96 = !DILocation(line: 69, column: 17, scope: !87)
!97 = distinct !{!97, !89, !98, !50}
!98 = !DILocation(line: 72, column: 17, scope: !84)
!99 = !DILocation(line: 74, column: 20, scope: !68)
!100 = !DILocation(line: 74, column: 18, scope: !68)
!101 = !DILocation(line: 76, column: 9, scope: !69)
!102 = !DILocation(line: 78, column: 18, scope: !62)
!103 = !DILocation(line: 78, column: 5, scope: !62)
!104 = !DILocation(line: 80, column: 10, scope: !62)
!105 = !DILocation(line: 80, column: 5, scope: !62)
!106 = !DILocation(line: 81, column: 1, scope: !62)
