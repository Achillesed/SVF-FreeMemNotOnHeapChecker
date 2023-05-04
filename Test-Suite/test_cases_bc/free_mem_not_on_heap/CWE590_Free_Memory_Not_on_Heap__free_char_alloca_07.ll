; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_07.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i32, i32* @staticFive, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !29, metadata !DIExpression()), !dbg !32
  %1 = alloca i8, i64 100, align 16, !dbg !33
  store i8* %1, i8** %dataBuffer, align 8, !dbg !32
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !35
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !38
  store i8* %4, i8** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  %5 = load i8*, i8** %data, align 8, !dbg !41
  call void @printLine(i8* noundef %5), !dbg !42
  %6 = load i8*, i8** %data, align 8, !dbg !43
  call void @free(i8* noundef %6) #6, !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_07_good() #0 !dbg !46 {
entry:
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !50 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !51, metadata !DIExpression()), !dbg !52
  store i8* null, i8** %data, align 8, !dbg !53
  %0 = load i32, i32* @staticFive, align 4, !dbg !54
  %cmp = icmp ne i32 %0, 5, !dbg !56
  br i1 %cmp, label %if.then, label %if.else, !dbg !57

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !58
  br label %if.end3, !dbg !60

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !61, metadata !DIExpression()), !dbg !64
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !65
  store i8* %call, i8** %dataBuffer, align 8, !dbg !64
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !66
  %cmp1 = icmp eq i8* %1, null, !dbg !68
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !69

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @exit(i32 noundef 1) #7, !dbg !72
  unreachable, !dbg !72

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !74
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !75
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !75
  store i8 0, i8* %arrayidx, align 1, !dbg !76
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !77
  store i8* %4, i8** %data, align 8, !dbg !78
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %5 = load i8*, i8** %data, align 8, !dbg !79
  call void @printLine(i8* noundef %5), !dbg !80
  %6 = load i8*, i8** %data, align 8, !dbg !81
  call void @free(i8* noundef %6) #6, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !84 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i8* null, i8** %data, align 8, !dbg !87
  %0 = load i32, i32* @staticFive, align 4, !dbg !88
  %cmp = icmp eq i32 %0, 5, !dbg !90
  br i1 %cmp, label %if.then, label %if.end3, !dbg !91

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !95
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !96
  store i8* %call, i8** %dataBuffer, align 8, !dbg !95
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !97
  %cmp1 = icmp eq i8* %1, null, !dbg !99
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !100

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @exit(i32 noundef 1) #7, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !105
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  store i8* %4, i8** %data, align 8, !dbg !109
  br label %if.end3, !dbg !110

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* noundef %5), !dbg !112
  %6 = load i8*, i8** %data, align 8, !dbg !113
  call void @free(i8* noundef %6) #6, !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !3, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_07.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "d2214fc1e63fc0f74ec852b9842a0823")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{!0}
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 5}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"PIE Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_07_bad", scope: !3, file: !3, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !3, line: 31, type: !5)
!23 = !DILocation(line: 31, column: 12, scope: !18)
!24 = !DILocation(line: 32, column: 10, scope: !18)
!25 = !DILocation(line: 33, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !3, line: 33, column: 8)
!27 = !DILocation(line: 33, column: 18, scope: !26)
!28 = !DILocation(line: 33, column: 8, scope: !18)
!29 = !DILocalVariable(name: "dataBuffer", scope: !30, file: !3, line: 37, type: !5)
!30 = distinct !DILexicalBlock(scope: !31, file: !3, line: 35, column: 9)
!31 = distinct !DILexicalBlock(scope: !26, file: !3, line: 34, column: 5)
!32 = !DILocation(line: 37, column: 20, scope: !30)
!33 = !DILocation(line: 37, column: 41, scope: !30)
!34 = !DILocation(line: 38, column: 20, scope: !30)
!35 = !DILocation(line: 38, column: 13, scope: !30)
!36 = !DILocation(line: 39, column: 13, scope: !30)
!37 = !DILocation(line: 39, column: 31, scope: !30)
!38 = !DILocation(line: 40, column: 20, scope: !30)
!39 = !DILocation(line: 40, column: 18, scope: !30)
!40 = !DILocation(line: 42, column: 5, scope: !31)
!41 = !DILocation(line: 43, column: 15, scope: !18)
!42 = !DILocation(line: 43, column: 5, scope: !18)
!43 = !DILocation(line: 45, column: 10, scope: !18)
!44 = !DILocation(line: 45, column: 5, scope: !18)
!45 = !DILocation(line: 46, column: 1, scope: !18)
!46 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_07_good", scope: !3, file: !3, line: 107, type: !19, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!47 = !DILocation(line: 109, column: 5, scope: !46)
!48 = !DILocation(line: 110, column: 5, scope: !46)
!49 = !DILocation(line: 111, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!51 = !DILocalVariable(name: "data", scope: !50, file: !3, line: 55, type: !5)
!52 = !DILocation(line: 55, column: 12, scope: !50)
!53 = !DILocation(line: 56, column: 10, scope: !50)
!54 = !DILocation(line: 57, column: 8, scope: !55)
!55 = distinct !DILexicalBlock(scope: !50, file: !3, line: 57, column: 8)
!56 = !DILocation(line: 57, column: 18, scope: !55)
!57 = !DILocation(line: 57, column: 8, scope: !50)
!58 = !DILocation(line: 60, column: 9, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !3, line: 58, column: 5)
!60 = !DILocation(line: 61, column: 5, scope: !59)
!61 = !DILocalVariable(name: "dataBuffer", scope: !62, file: !3, line: 66, type: !5)
!62 = distinct !DILexicalBlock(scope: !63, file: !3, line: 64, column: 9)
!63 = distinct !DILexicalBlock(scope: !55, file: !3, line: 63, column: 5)
!64 = !DILocation(line: 66, column: 20, scope: !62)
!65 = !DILocation(line: 66, column: 41, scope: !62)
!66 = !DILocation(line: 67, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !3, line: 67, column: 17)
!68 = !DILocation(line: 67, column: 28, scope: !67)
!69 = !DILocation(line: 67, column: 17, scope: !62)
!70 = !DILocation(line: 69, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !3, line: 68, column: 13)
!72 = !DILocation(line: 70, column: 17, scope: !71)
!73 = !DILocation(line: 72, column: 20, scope: !62)
!74 = !DILocation(line: 72, column: 13, scope: !62)
!75 = !DILocation(line: 73, column: 13, scope: !62)
!76 = !DILocation(line: 73, column: 31, scope: !62)
!77 = !DILocation(line: 74, column: 20, scope: !62)
!78 = !DILocation(line: 74, column: 18, scope: !62)
!79 = !DILocation(line: 77, column: 15, scope: !50)
!80 = !DILocation(line: 77, column: 5, scope: !50)
!81 = !DILocation(line: 79, column: 10, scope: !50)
!82 = !DILocation(line: 79, column: 5, scope: !50)
!83 = !DILocation(line: 80, column: 1, scope: !50)
!84 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 83, type: !19, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!85 = !DILocalVariable(name: "data", scope: !84, file: !3, line: 85, type: !5)
!86 = !DILocation(line: 85, column: 12, scope: !84)
!87 = !DILocation(line: 86, column: 10, scope: !84)
!88 = !DILocation(line: 87, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !3, line: 87, column: 8)
!90 = !DILocation(line: 87, column: 18, scope: !89)
!91 = !DILocation(line: 87, column: 8, scope: !84)
!92 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !3, line: 91, type: !5)
!93 = distinct !DILexicalBlock(scope: !94, file: !3, line: 89, column: 9)
!94 = distinct !DILexicalBlock(scope: !89, file: !3, line: 88, column: 5)
!95 = !DILocation(line: 91, column: 20, scope: !93)
!96 = !DILocation(line: 91, column: 41, scope: !93)
!97 = !DILocation(line: 92, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !3, line: 92, column: 17)
!99 = !DILocation(line: 92, column: 28, scope: !98)
!100 = !DILocation(line: 92, column: 17, scope: !93)
!101 = !DILocation(line: 94, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !3, line: 93, column: 13)
!103 = !DILocation(line: 95, column: 17, scope: !102)
!104 = !DILocation(line: 97, column: 20, scope: !93)
!105 = !DILocation(line: 97, column: 13, scope: !93)
!106 = !DILocation(line: 98, column: 13, scope: !93)
!107 = !DILocation(line: 98, column: 31, scope: !93)
!108 = !DILocation(line: 99, column: 20, scope: !93)
!109 = !DILocation(line: 99, column: 18, scope: !93)
!110 = !DILocation(line: 101, column: 5, scope: !94)
!111 = !DILocation(line: 102, column: 15, scope: !84)
!112 = !DILocation(line: 102, column: 5, scope: !84)
!113 = !DILocation(line: 104, column: 10, scope: !84)
!114 = !DILocation(line: 104, column: 5, scope: !84)
!115 = !DILocation(line: 105, column: 1, scope: !84)
