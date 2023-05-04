; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_07.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i32, i32* @staticFive, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !29, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !36
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !39
  store i8* %arraydecay1, i8** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* noundef %1), !dbg !43
  %2 = load i8*, i8** %data, align 8, !dbg !44
  call void @free(i8* noundef %2) #6, !dbg !45
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_07_good() #0 !dbg !47 {
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !55
  %cmp = icmp ne i32 %0, 5, !dbg !57
  br i1 %cmp, label %if.then, label %if.else, !dbg !58

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !59
  br label %if.end3, !dbg !61

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !62, metadata !DIExpression()), !dbg !65
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !66
  store i8* %call, i8** %dataBuffer, align 8, !dbg !65
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !67
  %cmp1 = icmp eq i8* %1, null, !dbg !69
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !70

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @exit(i32 noundef 1) #7, !dbg !73
  unreachable, !dbg !73

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !75
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !76
  store i8 0, i8* %arrayidx, align 1, !dbg !77
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !78
  store i8* %4, i8** %data, align 8, !dbg !79
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %5 = load i8*, i8** %data, align 8, !dbg !80
  call void @printLine(i8* noundef %5), !dbg !81
  %6 = load i8*, i8** %data, align 8, !dbg !82
  call void @free(i8* noundef %6) #6, !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i8* null, i8** %data, align 8, !dbg !88
  %0 = load i32, i32* @staticFive, align 4, !dbg !89
  %cmp = icmp eq i32 %0, 5, !dbg !91
  br i1 %cmp, label %if.then, label %if.end3, !dbg !92

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !96
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !97
  store i8* %call, i8** %dataBuffer, align 8, !dbg !96
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !98
  %cmp1 = icmp eq i8* %1, null, !dbg !100
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !101

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @exit(i32 noundef 1) #7, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !106
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !109
  store i8* %4, i8** %data, align 8, !dbg !110
  br label %if.end3, !dbg !111

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data, align 8, !dbg !112
  call void @printLine(i8* noundef %5), !dbg !113
  %6 = load i8*, i8** %data, align 8, !dbg !114
  call void @free(i8* noundef %6) #6, !dbg !115
  ret void, !dbg !116
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
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_07.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "94294b030bf838204b0baba1b8893d02")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_07_bad", scope: !3, file: !3, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
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
!29 = !DILocalVariable(name: "dataBuffer", scope: !30, file: !3, line: 37, type: !32)
!30 = distinct !DILexicalBlock(scope: !31, file: !3, line: 35, column: 9)
!31 = distinct !DILexicalBlock(scope: !26, file: !3, line: 34, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 37, column: 18, scope: !30)
!36 = !DILocation(line: 38, column: 13, scope: !30)
!37 = !DILocation(line: 39, column: 13, scope: !30)
!38 = !DILocation(line: 39, column: 31, scope: !30)
!39 = !DILocation(line: 40, column: 20, scope: !30)
!40 = !DILocation(line: 40, column: 18, scope: !30)
!41 = !DILocation(line: 42, column: 5, scope: !31)
!42 = !DILocation(line: 43, column: 15, scope: !18)
!43 = !DILocation(line: 43, column: 5, scope: !18)
!44 = !DILocation(line: 45, column: 10, scope: !18)
!45 = !DILocation(line: 45, column: 5, scope: !18)
!46 = !DILocation(line: 46, column: 1, scope: !18)
!47 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_07_good", scope: !3, file: !3, line: 107, type: !19, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!48 = !DILocation(line: 109, column: 5, scope: !47)
!49 = !DILocation(line: 110, column: 5, scope: !47)
!50 = !DILocation(line: 111, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!52 = !DILocalVariable(name: "data", scope: !51, file: !3, line: 55, type: !5)
!53 = !DILocation(line: 55, column: 12, scope: !51)
!54 = !DILocation(line: 56, column: 10, scope: !51)
!55 = !DILocation(line: 57, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !3, line: 57, column: 8)
!57 = !DILocation(line: 57, column: 18, scope: !56)
!58 = !DILocation(line: 57, column: 8, scope: !51)
!59 = !DILocation(line: 60, column: 9, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !3, line: 58, column: 5)
!61 = !DILocation(line: 61, column: 5, scope: !60)
!62 = !DILocalVariable(name: "dataBuffer", scope: !63, file: !3, line: 66, type: !5)
!63 = distinct !DILexicalBlock(scope: !64, file: !3, line: 64, column: 9)
!64 = distinct !DILexicalBlock(scope: !56, file: !3, line: 63, column: 5)
!65 = !DILocation(line: 66, column: 20, scope: !63)
!66 = !DILocation(line: 66, column: 41, scope: !63)
!67 = !DILocation(line: 67, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !3, line: 67, column: 17)
!69 = !DILocation(line: 67, column: 28, scope: !68)
!70 = !DILocation(line: 67, column: 17, scope: !63)
!71 = !DILocation(line: 69, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !3, line: 68, column: 13)
!73 = !DILocation(line: 70, column: 17, scope: !72)
!74 = !DILocation(line: 72, column: 20, scope: !63)
!75 = !DILocation(line: 72, column: 13, scope: !63)
!76 = !DILocation(line: 73, column: 13, scope: !63)
!77 = !DILocation(line: 73, column: 31, scope: !63)
!78 = !DILocation(line: 74, column: 20, scope: !63)
!79 = !DILocation(line: 74, column: 18, scope: !63)
!80 = !DILocation(line: 77, column: 15, scope: !51)
!81 = !DILocation(line: 77, column: 5, scope: !51)
!82 = !DILocation(line: 79, column: 10, scope: !51)
!83 = !DILocation(line: 79, column: 5, scope: !51)
!84 = !DILocation(line: 80, column: 1, scope: !51)
!85 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 83, type: !19, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!86 = !DILocalVariable(name: "data", scope: !85, file: !3, line: 85, type: !5)
!87 = !DILocation(line: 85, column: 12, scope: !85)
!88 = !DILocation(line: 86, column: 10, scope: !85)
!89 = !DILocation(line: 87, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !3, line: 87, column: 8)
!91 = !DILocation(line: 87, column: 18, scope: !90)
!92 = !DILocation(line: 87, column: 8, scope: !85)
!93 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !3, line: 91, type: !5)
!94 = distinct !DILexicalBlock(scope: !95, file: !3, line: 89, column: 9)
!95 = distinct !DILexicalBlock(scope: !90, file: !3, line: 88, column: 5)
!96 = !DILocation(line: 91, column: 20, scope: !94)
!97 = !DILocation(line: 91, column: 41, scope: !94)
!98 = !DILocation(line: 92, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !3, line: 92, column: 17)
!100 = !DILocation(line: 92, column: 28, scope: !99)
!101 = !DILocation(line: 92, column: 17, scope: !94)
!102 = !DILocation(line: 94, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !3, line: 93, column: 13)
!104 = !DILocation(line: 95, column: 17, scope: !103)
!105 = !DILocation(line: 97, column: 20, scope: !94)
!106 = !DILocation(line: 97, column: 13, scope: !94)
!107 = !DILocation(line: 98, column: 13, scope: !94)
!108 = !DILocation(line: 98, column: 31, scope: !94)
!109 = !DILocation(line: 99, column: 20, scope: !94)
!110 = !DILocation(line: 99, column: 18, scope: !94)
!111 = !DILocation(line: 101, column: 5, scope: !95)
!112 = !DILocation(line: 102, column: 15, scope: !85)
!113 = !DILocation(line: 102, column: 5, scope: !85)
!114 = !DILocation(line: 104, column: 10, scope: !85)
!115 = !DILocation(line: 104, column: 5, scope: !85)
!116 = !DILocation(line: 105, column: 1, scope: !85)
