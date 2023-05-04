; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_32.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !29
  %1 = load i8*, i8** %0, align 8, !dbg !30
  store i8* %1, i8** %data1, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 100, align 16, !dbg !34
  store i8* %2, i8** %dataBuffer, align 8, !dbg !33
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !36
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %5 = load i8*, i8** %dataBuffer, align 8, !dbg !39
  store i8* %5, i8** %data1, align 8, !dbg !40
  %6 = load i8*, i8** %data1, align 8, !dbg !41
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !42
  store i8* %6, i8** %7, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !44, metadata !DIExpression()), !dbg !46
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !47
  %9 = load i8*, i8** %8, align 8, !dbg !48
  store i8* %9, i8** %data2, align 8, !dbg !46
  %10 = load i8*, i8** %data2, align 8, !dbg !49
  call void @printLine(i8* noundef %10), !dbg !50
  %11 = load i8*, i8** %data2, align 8, !dbg !51
  call void @free(i8* noundef %11) #6, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_32_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !57 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !63
  store i8* null, i8** %data, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !65, metadata !DIExpression()), !dbg !67
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !68
  %1 = load i8*, i8** %0, align 8, !dbg !69
  store i8* %1, i8** %data1, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !72
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !73
  store i8* %call, i8** %dataBuffer, align 8, !dbg !72
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !74
  %cmp = icmp eq i8* %2, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @exit(i32 noundef 1) #7, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !82
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  %5 = load i8*, i8** %dataBuffer, align 8, !dbg !85
  store i8* %5, i8** %data1, align 8, !dbg !86
  %6 = load i8*, i8** %data1, align 8, !dbg !87
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !88
  store i8* %6, i8** %7, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !90, metadata !DIExpression()), !dbg !92
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !93
  %9 = load i8*, i8** %8, align 8, !dbg !94
  store i8* %9, i8** %data2, align 8, !dbg !92
  %10 = load i8*, i8** %data2, align 8, !dbg !95
  call void @printLine(i8* noundef %10), !dbg !96
  %11 = load i8*, i8** %data2, align 8, !dbg !97
  call void @free(i8* noundef %11) #6, !dbg !98
  ret void, !dbg !99
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_32.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "2b3c1255913a2eba8676785f8370fcbf")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_32_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !1, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !1, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !14)
!25 = !DILocation(line: 28, column: 10, scope: !14)
!26 = !DILocalVariable(name: "data", scope: !27, file: !1, line: 30, type: !3)
!27 = distinct !DILexicalBlock(scope: !14, file: !1, line: 29, column: 5)
!28 = !DILocation(line: 30, column: 16, scope: !27)
!29 = !DILocation(line: 30, column: 24, scope: !27)
!30 = !DILocation(line: 30, column: 23, scope: !27)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !1, line: 33, type: !3)
!32 = distinct !DILexicalBlock(scope: !27, file: !1, line: 31, column: 9)
!33 = !DILocation(line: 33, column: 20, scope: !32)
!34 = !DILocation(line: 33, column: 41, scope: !32)
!35 = !DILocation(line: 34, column: 20, scope: !32)
!36 = !DILocation(line: 34, column: 13, scope: !32)
!37 = !DILocation(line: 35, column: 13, scope: !32)
!38 = !DILocation(line: 35, column: 31, scope: !32)
!39 = !DILocation(line: 36, column: 20, scope: !32)
!40 = !DILocation(line: 36, column: 18, scope: !32)
!41 = !DILocation(line: 38, column: 21, scope: !27)
!42 = !DILocation(line: 38, column: 10, scope: !27)
!43 = !DILocation(line: 38, column: 19, scope: !27)
!44 = !DILocalVariable(name: "data", scope: !45, file: !1, line: 41, type: !3)
!45 = distinct !DILexicalBlock(scope: !14, file: !1, line: 40, column: 5)
!46 = !DILocation(line: 41, column: 16, scope: !45)
!47 = !DILocation(line: 41, column: 24, scope: !45)
!48 = !DILocation(line: 41, column: 23, scope: !45)
!49 = !DILocation(line: 42, column: 19, scope: !45)
!50 = !DILocation(line: 42, column: 9, scope: !45)
!51 = !DILocation(line: 44, column: 14, scope: !45)
!52 = !DILocation(line: 44, column: 9, scope: !45)
!53 = !DILocation(line: 46, column: 1, scope: !14)
!54 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_32_good", scope: !1, file: !1, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!55 = !DILocation(line: 85, column: 5, scope: !54)
!56 = !DILocation(line: 86, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!58 = !DILocalVariable(name: "data", scope: !57, file: !1, line: 55, type: !3)
!59 = !DILocation(line: 55, column: 12, scope: !57)
!60 = !DILocalVariable(name: "dataPtr1", scope: !57, file: !1, line: 56, type: !21)
!61 = !DILocation(line: 56, column: 13, scope: !57)
!62 = !DILocalVariable(name: "dataPtr2", scope: !57, file: !1, line: 57, type: !21)
!63 = !DILocation(line: 57, column: 13, scope: !57)
!64 = !DILocation(line: 58, column: 10, scope: !57)
!65 = !DILocalVariable(name: "data", scope: !66, file: !1, line: 60, type: !3)
!66 = distinct !DILexicalBlock(scope: !57, file: !1, line: 59, column: 5)
!67 = !DILocation(line: 60, column: 16, scope: !66)
!68 = !DILocation(line: 60, column: 24, scope: !66)
!69 = !DILocation(line: 60, column: 23, scope: !66)
!70 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !1, line: 63, type: !3)
!71 = distinct !DILexicalBlock(scope: !66, file: !1, line: 61, column: 9)
!72 = !DILocation(line: 63, column: 20, scope: !71)
!73 = !DILocation(line: 63, column: 41, scope: !71)
!74 = !DILocation(line: 64, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !1, line: 64, column: 17)
!76 = !DILocation(line: 64, column: 28, scope: !75)
!77 = !DILocation(line: 64, column: 17, scope: !71)
!78 = !DILocation(line: 66, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !1, line: 65, column: 13)
!80 = !DILocation(line: 67, column: 17, scope: !79)
!81 = !DILocation(line: 69, column: 20, scope: !71)
!82 = !DILocation(line: 69, column: 13, scope: !71)
!83 = !DILocation(line: 70, column: 13, scope: !71)
!84 = !DILocation(line: 70, column: 31, scope: !71)
!85 = !DILocation(line: 71, column: 20, scope: !71)
!86 = !DILocation(line: 71, column: 18, scope: !71)
!87 = !DILocation(line: 73, column: 21, scope: !66)
!88 = !DILocation(line: 73, column: 10, scope: !66)
!89 = !DILocation(line: 73, column: 19, scope: !66)
!90 = !DILocalVariable(name: "data", scope: !91, file: !1, line: 76, type: !3)
!91 = distinct !DILexicalBlock(scope: !57, file: !1, line: 75, column: 5)
!92 = !DILocation(line: 76, column: 16, scope: !91)
!93 = !DILocation(line: 76, column: 24, scope: !91)
!94 = !DILocation(line: 76, column: 23, scope: !91)
!95 = !DILocation(line: 77, column: 19, scope: !91)
!96 = !DILocation(line: 77, column: 9, scope: !91)
!97 = !DILocation(line: 79, column: 14, scope: !91)
!98 = !DILocation(line: 79, column: 9, scope: !91)
!99 = !DILocation(line: 81, column: 1, scope: !57)
