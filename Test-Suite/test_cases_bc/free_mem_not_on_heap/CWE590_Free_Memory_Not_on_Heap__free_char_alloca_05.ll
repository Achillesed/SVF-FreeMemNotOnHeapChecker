; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_05.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@staticFalse = internal global i32 0, align 4, !dbg !9
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !33
  %1 = alloca i8, i64 100, align 16, !dbg !34
  store i8* %1, i8** %dataBuffer, align 8, !dbg !33
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !36
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !39
  store i8* %4, i8** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  %5 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* noundef %5), !dbg !43
  %6 = load i8*, i8** %data, align 8, !dbg !44
  call void @free(i8* noundef %6) #6, !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_05_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !51 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !52, metadata !DIExpression()), !dbg !53
  store i8* null, i8** %data, align 8, !dbg !54
  %0 = load i32, i32* @staticFalse, align 4, !dbg !55
  %tobool = icmp ne i32 %0, 0, !dbg !55
  br i1 %tobool, label %if.then, label %if.else, !dbg !57

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !58
  br label %if.end2, !dbg !60

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !61, metadata !DIExpression()), !dbg !64
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !65
  store i8* %call, i8** %dataBuffer, align 8, !dbg !64
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !66
  %cmp = icmp eq i8* %1, null, !dbg !68
  br i1 %cmp, label %if.then1, label %if.end, !dbg !69

if.then1:                                         ; preds = %if.else
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
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !88
  %tobool = icmp ne i32 %0, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.end2, !dbg !90

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !94
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !95
  store i8* %call, i8** %dataBuffer, align 8, !dbg !94
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !96
  %cmp = icmp eq i8* %1, null, !dbg !98
  br i1 %cmp, label %if.then1, label %if.end, !dbg !99

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @exit(i32 noundef 1) #7, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !104
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !105
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  store i8* %4, i8** %data, align 8, !dbg !108
  br label %if.end2, !dbg !109

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data, align 8, !dbg !110
  call void @printLine(i8* noundef %5), !dbg !111
  %6 = load i8*, i8** %data, align 8, !dbg !112
  call void @free(i8* noundef %6) #6, !dbg !113
  ret void, !dbg !114
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
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !3, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_05.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "8cfe297f3244fce5ab6c90345f64fd0f")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !3, line: 26, type: !11, isLocal: true, isDefinition: true)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 5}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"PIE Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_05_bad", scope: !3, file: !3, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !3, line: 32, type: !5)
!25 = !DILocation(line: 32, column: 12, scope: !20)
!26 = !DILocation(line: 33, column: 10, scope: !20)
!27 = !DILocation(line: 34, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !3, line: 34, column: 8)
!29 = !DILocation(line: 34, column: 8, scope: !20)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !3, line: 38, type: !5)
!31 = distinct !DILexicalBlock(scope: !32, file: !3, line: 36, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !3, line: 35, column: 5)
!33 = !DILocation(line: 38, column: 20, scope: !31)
!34 = !DILocation(line: 38, column: 41, scope: !31)
!35 = !DILocation(line: 39, column: 20, scope: !31)
!36 = !DILocation(line: 39, column: 13, scope: !31)
!37 = !DILocation(line: 40, column: 13, scope: !31)
!38 = !DILocation(line: 40, column: 31, scope: !31)
!39 = !DILocation(line: 41, column: 20, scope: !31)
!40 = !DILocation(line: 41, column: 18, scope: !31)
!41 = !DILocation(line: 43, column: 5, scope: !32)
!42 = !DILocation(line: 44, column: 15, scope: !20)
!43 = !DILocation(line: 44, column: 5, scope: !20)
!44 = !DILocation(line: 46, column: 10, scope: !20)
!45 = !DILocation(line: 46, column: 5, scope: !20)
!46 = !DILocation(line: 47, column: 1, scope: !20)
!47 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_05_good", scope: !3, file: !3, line: 108, type: !21, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!48 = !DILocation(line: 110, column: 5, scope: !47)
!49 = !DILocation(line: 111, column: 5, scope: !47)
!50 = !DILocation(line: 112, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!52 = !DILocalVariable(name: "data", scope: !51, file: !3, line: 56, type: !5)
!53 = !DILocation(line: 56, column: 12, scope: !51)
!54 = !DILocation(line: 57, column: 10, scope: !51)
!55 = !DILocation(line: 58, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !3, line: 58, column: 8)
!57 = !DILocation(line: 58, column: 8, scope: !51)
!58 = !DILocation(line: 61, column: 9, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !3, line: 59, column: 5)
!60 = !DILocation(line: 62, column: 5, scope: !59)
!61 = !DILocalVariable(name: "dataBuffer", scope: !62, file: !3, line: 67, type: !5)
!62 = distinct !DILexicalBlock(scope: !63, file: !3, line: 65, column: 9)
!63 = distinct !DILexicalBlock(scope: !56, file: !3, line: 64, column: 5)
!64 = !DILocation(line: 67, column: 20, scope: !62)
!65 = !DILocation(line: 67, column: 41, scope: !62)
!66 = !DILocation(line: 68, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !3, line: 68, column: 17)
!68 = !DILocation(line: 68, column: 28, scope: !67)
!69 = !DILocation(line: 68, column: 17, scope: !62)
!70 = !DILocation(line: 70, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !3, line: 69, column: 13)
!72 = !DILocation(line: 71, column: 17, scope: !71)
!73 = !DILocation(line: 73, column: 20, scope: !62)
!74 = !DILocation(line: 73, column: 13, scope: !62)
!75 = !DILocation(line: 74, column: 13, scope: !62)
!76 = !DILocation(line: 74, column: 31, scope: !62)
!77 = !DILocation(line: 75, column: 20, scope: !62)
!78 = !DILocation(line: 75, column: 18, scope: !62)
!79 = !DILocation(line: 78, column: 15, scope: !51)
!80 = !DILocation(line: 78, column: 5, scope: !51)
!81 = !DILocation(line: 80, column: 10, scope: !51)
!82 = !DILocation(line: 80, column: 5, scope: !51)
!83 = !DILocation(line: 81, column: 1, scope: !51)
!84 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 84, type: !21, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!85 = !DILocalVariable(name: "data", scope: !84, file: !3, line: 86, type: !5)
!86 = !DILocation(line: 86, column: 12, scope: !84)
!87 = !DILocation(line: 87, column: 10, scope: !84)
!88 = !DILocation(line: 88, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !3, line: 88, column: 8)
!90 = !DILocation(line: 88, column: 8, scope: !84)
!91 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !3, line: 92, type: !5)
!92 = distinct !DILexicalBlock(scope: !93, file: !3, line: 90, column: 9)
!93 = distinct !DILexicalBlock(scope: !89, file: !3, line: 89, column: 5)
!94 = !DILocation(line: 92, column: 20, scope: !92)
!95 = !DILocation(line: 92, column: 41, scope: !92)
!96 = !DILocation(line: 93, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !3, line: 93, column: 17)
!98 = !DILocation(line: 93, column: 28, scope: !97)
!99 = !DILocation(line: 93, column: 17, scope: !92)
!100 = !DILocation(line: 95, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !3, line: 94, column: 13)
!102 = !DILocation(line: 96, column: 17, scope: !101)
!103 = !DILocation(line: 98, column: 20, scope: !92)
!104 = !DILocation(line: 98, column: 13, scope: !92)
!105 = !DILocation(line: 99, column: 13, scope: !92)
!106 = !DILocation(line: 99, column: 31, scope: !92)
!107 = !DILocation(line: 100, column: 20, scope: !92)
!108 = !DILocation(line: 100, column: 18, scope: !92)
!109 = !DILocation(line: 102, column: 5, scope: !93)
!110 = !DILocation(line: 103, column: 15, scope: !84)
!111 = !DILocation(line: 103, column: 5, scope: !84)
!112 = !DILocation(line: 105, column: 10, scope: !84)
!113 = !DILocation(line: 105, column: 5, scope: !84)
!114 = !DILocation(line: 106, column: 1, scope: !84)
