; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_14.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_14_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalFive, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end, !dbg !24

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %1, i8** %dataBuffer, align 8, !dbg !28
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !31
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !34
  store i8* %4, i8** %data, align 8, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  %5 = load i8*, i8** %data, align 8, !dbg !37
  call void @printLine(i8* noundef %5), !dbg !38
  %6 = load i8*, i8** %data, align 8, !dbg !39
  call void @free(i8* noundef %6) #6, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_14_good() #0 !dbg !42 {
entry:
  call void @goodG2B1(), !dbg !43
  call void @goodG2B2(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !46 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !47, metadata !DIExpression()), !dbg !48
  store i8* null, i8** %data, align 8, !dbg !49
  %0 = load i32, i32* @globalFive, align 4, !dbg !50
  %cmp = icmp ne i32 %0, 5, !dbg !52
  br i1 %cmp, label %if.then, label %if.else, !dbg !53

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !54
  br label %if.end3, !dbg !56

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !57, metadata !DIExpression()), !dbg !60
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !61
  store i8* %call, i8** %dataBuffer, align 8, !dbg !60
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !62
  %cmp1 = icmp eq i8* %1, null, !dbg !64
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !65

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @exit(i32 noundef 1) #7, !dbg !68
  unreachable, !dbg !68

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !69
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !70
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !71
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !71
  store i8 0, i8* %arrayidx, align 1, !dbg !72
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !73
  store i8* %4, i8** %data, align 8, !dbg !74
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %5 = load i8*, i8** %data, align 8, !dbg !75
  call void @printLine(i8* noundef %5), !dbg !76
  %6 = load i8*, i8** %data, align 8, !dbg !77
  call void @free(i8* noundef %6) #6, !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i8* null, i8** %data, align 8, !dbg !83
  %0 = load i32, i32* @globalFive, align 4, !dbg !84
  %cmp = icmp eq i32 %0, 5, !dbg !86
  br i1 %cmp, label %if.then, label %if.end3, !dbg !87

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !88, metadata !DIExpression()), !dbg !91
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !92
  store i8* %call, i8** %dataBuffer, align 8, !dbg !91
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !93
  %cmp1 = icmp eq i8* %1, null, !dbg !95
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !96

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @exit(i32 noundef 1) #7, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !101
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !104
  store i8* %4, i8** %data, align 8, !dbg !105
  br label %if.end3, !dbg !106

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data, align 8, !dbg !107
  call void @printLine(i8* noundef %5), !dbg !108
  %6 = load i8*, i8** %data, align 8, !dbg !109
  call void @free(i8* noundef %6) #6, !dbg !110
  ret void, !dbg !111
}

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_14.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "5ed79564d1d00b047fb352356367ec3e")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_14_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 18, scope: !22)
!24 = !DILocation(line: 27, column: 8, scope: !14)
!25 = !DILocalVariable(name: "dataBuffer", scope: !26, file: !1, line: 31, type: !3)
!26 = distinct !DILexicalBlock(scope: !27, file: !1, line: 29, column: 9)
!27 = distinct !DILexicalBlock(scope: !22, file: !1, line: 28, column: 5)
!28 = !DILocation(line: 31, column: 20, scope: !26)
!29 = !DILocation(line: 31, column: 41, scope: !26)
!30 = !DILocation(line: 32, column: 20, scope: !26)
!31 = !DILocation(line: 32, column: 13, scope: !26)
!32 = !DILocation(line: 33, column: 13, scope: !26)
!33 = !DILocation(line: 33, column: 31, scope: !26)
!34 = !DILocation(line: 34, column: 20, scope: !26)
!35 = !DILocation(line: 34, column: 18, scope: !26)
!36 = !DILocation(line: 36, column: 5, scope: !27)
!37 = !DILocation(line: 37, column: 15, scope: !14)
!38 = !DILocation(line: 37, column: 5, scope: !14)
!39 = !DILocation(line: 39, column: 10, scope: !14)
!40 = !DILocation(line: 39, column: 5, scope: !14)
!41 = !DILocation(line: 40, column: 1, scope: !14)
!42 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_14_good", scope: !1, file: !1, line: 101, type: !15, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!43 = !DILocation(line: 103, column: 5, scope: !42)
!44 = !DILocation(line: 104, column: 5, scope: !42)
!45 = !DILocation(line: 105, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 47, type: !15, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!47 = !DILocalVariable(name: "data", scope: !46, file: !1, line: 49, type: !3)
!48 = !DILocation(line: 49, column: 12, scope: !46)
!49 = !DILocation(line: 50, column: 10, scope: !46)
!50 = !DILocation(line: 51, column: 8, scope: !51)
!51 = distinct !DILexicalBlock(scope: !46, file: !1, line: 51, column: 8)
!52 = !DILocation(line: 51, column: 18, scope: !51)
!53 = !DILocation(line: 51, column: 8, scope: !46)
!54 = !DILocation(line: 54, column: 9, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !1, line: 52, column: 5)
!56 = !DILocation(line: 55, column: 5, scope: !55)
!57 = !DILocalVariable(name: "dataBuffer", scope: !58, file: !1, line: 60, type: !3)
!58 = distinct !DILexicalBlock(scope: !59, file: !1, line: 58, column: 9)
!59 = distinct !DILexicalBlock(scope: !51, file: !1, line: 57, column: 5)
!60 = !DILocation(line: 60, column: 20, scope: !58)
!61 = !DILocation(line: 60, column: 41, scope: !58)
!62 = !DILocation(line: 61, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !1, line: 61, column: 17)
!64 = !DILocation(line: 61, column: 28, scope: !63)
!65 = !DILocation(line: 61, column: 17, scope: !58)
!66 = !DILocation(line: 63, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !1, line: 62, column: 13)
!68 = !DILocation(line: 64, column: 17, scope: !67)
!69 = !DILocation(line: 66, column: 20, scope: !58)
!70 = !DILocation(line: 66, column: 13, scope: !58)
!71 = !DILocation(line: 67, column: 13, scope: !58)
!72 = !DILocation(line: 67, column: 31, scope: !58)
!73 = !DILocation(line: 68, column: 20, scope: !58)
!74 = !DILocation(line: 68, column: 18, scope: !58)
!75 = !DILocation(line: 71, column: 15, scope: !46)
!76 = !DILocation(line: 71, column: 5, scope: !46)
!77 = !DILocation(line: 73, column: 10, scope: !46)
!78 = !DILocation(line: 73, column: 5, scope: !46)
!79 = !DILocation(line: 74, column: 1, scope: !46)
!80 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 77, type: !15, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!81 = !DILocalVariable(name: "data", scope: !80, file: !1, line: 79, type: !3)
!82 = !DILocation(line: 79, column: 12, scope: !80)
!83 = !DILocation(line: 80, column: 10, scope: !80)
!84 = !DILocation(line: 81, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !1, line: 81, column: 8)
!86 = !DILocation(line: 81, column: 18, scope: !85)
!87 = !DILocation(line: 81, column: 8, scope: !80)
!88 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !1, line: 85, type: !3)
!89 = distinct !DILexicalBlock(scope: !90, file: !1, line: 83, column: 9)
!90 = distinct !DILexicalBlock(scope: !85, file: !1, line: 82, column: 5)
!91 = !DILocation(line: 85, column: 20, scope: !89)
!92 = !DILocation(line: 85, column: 41, scope: !89)
!93 = !DILocation(line: 86, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !89, file: !1, line: 86, column: 17)
!95 = !DILocation(line: 86, column: 28, scope: !94)
!96 = !DILocation(line: 86, column: 17, scope: !89)
!97 = !DILocation(line: 88, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !1, line: 87, column: 13)
!99 = !DILocation(line: 89, column: 17, scope: !98)
!100 = !DILocation(line: 91, column: 20, scope: !89)
!101 = !DILocation(line: 91, column: 13, scope: !89)
!102 = !DILocation(line: 92, column: 13, scope: !89)
!103 = !DILocation(line: 92, column: 31, scope: !89)
!104 = !DILocation(line: 93, column: 20, scope: !89)
!105 = !DILocation(line: 93, column: 18, scope: !89)
!106 = !DILocation(line: 95, column: 5, scope: !90)
!107 = !DILocation(line: 96, column: 15, scope: !80)
!108 = !DILocation(line: 96, column: 5, scope: !80)
!109 = !DILocation(line: 98, column: 10, scope: !80)
!110 = !DILocation(line: 98, column: 5, scope: !80)
!111 = !DILocation(line: 99, column: 1, scope: !80)
