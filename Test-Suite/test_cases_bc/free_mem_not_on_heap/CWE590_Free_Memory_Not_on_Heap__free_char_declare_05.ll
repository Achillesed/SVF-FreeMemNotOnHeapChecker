; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_05.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@staticFalse = internal global i32 0, align 4, !dbg !9
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !37
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !40
  store i8* %arraydecay1, i8** %data, align 8, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* noundef %1), !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  call void @free(i8* noundef %2) #6, !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_05_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !52 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !53, metadata !DIExpression()), !dbg !54
  store i8* null, i8** %data, align 8, !dbg !55
  %0 = load i32, i32* @staticFalse, align 4, !dbg !56
  %tobool = icmp ne i32 %0, 0, !dbg !56
  br i1 %tobool, label %if.then, label %if.else, !dbg !58

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !59
  br label %if.end2, !dbg !61

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !62, metadata !DIExpression()), !dbg !65
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !66
  store i8* %call, i8** %dataBuffer, align 8, !dbg !65
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !67
  %cmp = icmp eq i8* %1, null, !dbg !69
  br i1 %cmp, label %if.then1, label %if.end, !dbg !70

if.then1:                                         ; preds = %if.else
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
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !89
  %tobool = icmp ne i32 %0, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.end2, !dbg !91

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !95
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !96
  store i8* %call, i8** %dataBuffer, align 8, !dbg !95
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !97
  %cmp = icmp eq i8* %1, null, !dbg !99
  br i1 %cmp, label %if.then1, label %if.end, !dbg !100

if.then1:                                         ; preds = %if.then
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
  br label %if.end2, !dbg !110

if.end2:                                          ; preds = %if.end, %entry
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
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !3, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_05.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "90c6551a6984dfd795a1335fc1651f55")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_05_bad", scope: !3, file: !3, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !3, line: 32, type: !5)
!25 = !DILocation(line: 32, column: 12, scope: !20)
!26 = !DILocation(line: 33, column: 10, scope: !20)
!27 = !DILocation(line: 34, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !3, line: 34, column: 8)
!29 = !DILocation(line: 34, column: 8, scope: !20)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !3, line: 38, type: !33)
!31 = distinct !DILexicalBlock(scope: !32, file: !3, line: 36, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !3, line: 35, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 38, column: 18, scope: !31)
!37 = !DILocation(line: 39, column: 13, scope: !31)
!38 = !DILocation(line: 40, column: 13, scope: !31)
!39 = !DILocation(line: 40, column: 31, scope: !31)
!40 = !DILocation(line: 41, column: 20, scope: !31)
!41 = !DILocation(line: 41, column: 18, scope: !31)
!42 = !DILocation(line: 43, column: 5, scope: !32)
!43 = !DILocation(line: 44, column: 15, scope: !20)
!44 = !DILocation(line: 44, column: 5, scope: !20)
!45 = !DILocation(line: 46, column: 10, scope: !20)
!46 = !DILocation(line: 46, column: 5, scope: !20)
!47 = !DILocation(line: 47, column: 1, scope: !20)
!48 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_05_good", scope: !3, file: !3, line: 108, type: !21, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!49 = !DILocation(line: 110, column: 5, scope: !48)
!50 = !DILocation(line: 111, column: 5, scope: !48)
!51 = !DILocation(line: 112, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!53 = !DILocalVariable(name: "data", scope: !52, file: !3, line: 56, type: !5)
!54 = !DILocation(line: 56, column: 12, scope: !52)
!55 = !DILocation(line: 57, column: 10, scope: !52)
!56 = !DILocation(line: 58, column: 8, scope: !57)
!57 = distinct !DILexicalBlock(scope: !52, file: !3, line: 58, column: 8)
!58 = !DILocation(line: 58, column: 8, scope: !52)
!59 = !DILocation(line: 61, column: 9, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !3, line: 59, column: 5)
!61 = !DILocation(line: 62, column: 5, scope: !60)
!62 = !DILocalVariable(name: "dataBuffer", scope: !63, file: !3, line: 67, type: !5)
!63 = distinct !DILexicalBlock(scope: !64, file: !3, line: 65, column: 9)
!64 = distinct !DILexicalBlock(scope: !57, file: !3, line: 64, column: 5)
!65 = !DILocation(line: 67, column: 20, scope: !63)
!66 = !DILocation(line: 67, column: 41, scope: !63)
!67 = !DILocation(line: 68, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !3, line: 68, column: 17)
!69 = !DILocation(line: 68, column: 28, scope: !68)
!70 = !DILocation(line: 68, column: 17, scope: !63)
!71 = !DILocation(line: 70, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !3, line: 69, column: 13)
!73 = !DILocation(line: 71, column: 17, scope: !72)
!74 = !DILocation(line: 73, column: 20, scope: !63)
!75 = !DILocation(line: 73, column: 13, scope: !63)
!76 = !DILocation(line: 74, column: 13, scope: !63)
!77 = !DILocation(line: 74, column: 31, scope: !63)
!78 = !DILocation(line: 75, column: 20, scope: !63)
!79 = !DILocation(line: 75, column: 18, scope: !63)
!80 = !DILocation(line: 78, column: 15, scope: !52)
!81 = !DILocation(line: 78, column: 5, scope: !52)
!82 = !DILocation(line: 80, column: 10, scope: !52)
!83 = !DILocation(line: 80, column: 5, scope: !52)
!84 = !DILocation(line: 81, column: 1, scope: !52)
!85 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 84, type: !21, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!86 = !DILocalVariable(name: "data", scope: !85, file: !3, line: 86, type: !5)
!87 = !DILocation(line: 86, column: 12, scope: !85)
!88 = !DILocation(line: 87, column: 10, scope: !85)
!89 = !DILocation(line: 88, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !3, line: 88, column: 8)
!91 = !DILocation(line: 88, column: 8, scope: !85)
!92 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !3, line: 92, type: !5)
!93 = distinct !DILexicalBlock(scope: !94, file: !3, line: 90, column: 9)
!94 = distinct !DILexicalBlock(scope: !90, file: !3, line: 89, column: 5)
!95 = !DILocation(line: 92, column: 20, scope: !93)
!96 = !DILocation(line: 92, column: 41, scope: !93)
!97 = !DILocation(line: 93, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !3, line: 93, column: 17)
!99 = !DILocation(line: 93, column: 28, scope: !98)
!100 = !DILocation(line: 93, column: 17, scope: !93)
!101 = !DILocation(line: 95, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !3, line: 94, column: 13)
!103 = !DILocation(line: 96, column: 17, scope: !102)
!104 = !DILocation(line: 98, column: 20, scope: !93)
!105 = !DILocation(line: 98, column: 13, scope: !93)
!106 = !DILocation(line: 99, column: 13, scope: !93)
!107 = !DILocation(line: 99, column: 31, scope: !93)
!108 = !DILocation(line: 100, column: 20, scope: !93)
!109 = !DILocation(line: 100, column: 18, scope: !93)
!110 = !DILocation(line: 102, column: 5, scope: !94)
!111 = !DILocation(line: 103, column: 15, scope: !85)
!112 = !DILocation(line: 103, column: 5, scope: !85)
!113 = !DILocation(line: 105, column: 10, scope: !85)
!114 = !DILocation(line: 105, column: 5, scope: !85)
!115 = !DILocation(line: 106, column: 1, scope: !85)
