; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_static_08.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_static_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_char_static_08_bad.dataBuffer = internal global [100 x i8] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_08_bad() #0 !dbg !2 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %call = call i32 @staticReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.memset.p0i8.i64(i8* align 16 getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_08_bad.dataBuffer, i64 0, i64 0), i8 65, i64 99, i1 false), !dbg !30
  store i8 0, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_08_bad.dataBuffer, i64 0, i64 99), align 1, !dbg !33
  store i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_08_bad.dataBuffer, i64 0, i64 0), i8** %data, align 8, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  %0 = load i8*, i8** %data, align 8, !dbg !36
  call void @printLine(i8* noundef %0), !dbg !37
  %1 = load i8*, i8** %data, align 8, !dbg !38
  call void @free(i8* noundef %1) #6, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_08_good() #0 !dbg !41 {
entry:
  call void @goodG2B1(), !dbg !42
  call void @goodG2B2(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !45 {
entry:
  ret i32 1, !dbg !49
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !50 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !51, metadata !DIExpression()), !dbg !52
  store i8* null, i8** %data, align 8, !dbg !53
  %call = call i32 @staticReturnsFalse(), !dbg !54
  %tobool = icmp ne i32 %call, 0, !dbg !54
  br i1 %tobool, label %if.then, label %if.else, !dbg !56

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !57
  br label %if.end3, !dbg !59

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !60, metadata !DIExpression()), !dbg !63
  %call1 = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !64
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !63
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !65
  %cmp = icmp eq i8* %0, null, !dbg !67
  br i1 %cmp, label %if.then2, label %if.end, !dbg !68

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @exit(i32 noundef 1) #7, !dbg !71
  unreachable, !dbg !71

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !73
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !74
  store i8 0, i8* %arrayidx, align 1, !dbg !75
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !76
  store i8* %3, i8** %data, align 8, !dbg !77
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %4 = load i8*, i8** %data, align 8, !dbg !78
  call void @printLine(i8* noundef %4), !dbg !79
  %5 = load i8*, i8** %data, align 8, !dbg !80
  call void @free(i8* noundef %5) #6, !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !83 {
entry:
  ret i32 0, !dbg !84
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i8* null, i8** %data, align 8, !dbg !88
  %call = call i32 @staticReturnsTrue(), !dbg !89
  %tobool = icmp ne i32 %call, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.end3, !dbg !91

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !95
  %call1 = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !96
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !95
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !97
  %cmp = icmp eq i8* %0, null, !dbg !99
  br i1 %cmp, label %if.then2, label %if.end, !dbg !100

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @exit(i32 noundef 1) #7, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !105
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  store i8* %3, i8** %data, align 8, !dbg !109
  br label %if.end3, !dbg !110

if.end3:                                          ; preds = %if.end, %entry
  %4 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* noundef %4), !dbg !112
  %5 = load i8*, i8** %data, align 8, !dbg !113
  call void @free(i8* noundef %5) #6, !dbg !114
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

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 45, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_08_bad", scope: !3, file: !3, line: 37, type: !4, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_static_08.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1fd9742c0e10602ade79a801e834ea7f")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0}
!12 = !{}
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 800, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 100)
!16 = !{i32 7, !"Dwarf Version", i32 5}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"PIE Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 39, type: !8)
!25 = !DILocation(line: 39, column: 12, scope: !2)
!26 = !DILocation(line: 40, column: 10, scope: !2)
!27 = !DILocation(line: 41, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !2, file: !3, line: 41, column: 8)
!29 = !DILocation(line: 41, column: 8, scope: !2)
!30 = !DILocation(line: 46, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !3, line: 43, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !3, line: 42, column: 5)
!33 = !DILocation(line: 47, column: 31, scope: !31)
!34 = !DILocation(line: 48, column: 18, scope: !31)
!35 = !DILocation(line: 50, column: 5, scope: !32)
!36 = !DILocation(line: 51, column: 15, scope: !2)
!37 = !DILocation(line: 51, column: 5, scope: !2)
!38 = !DILocation(line: 53, column: 10, scope: !2)
!39 = !DILocation(line: 53, column: 5, scope: !2)
!40 = !DILocation(line: 54, column: 1, scope: !2)
!41 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_08_good", scope: !3, file: !3, line: 115, type: !4, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!42 = !DILocation(line: 117, column: 5, scope: !41)
!43 = !DILocation(line: 118, column: 5, scope: !41)
!44 = !DILocation(line: 119, column: 1, scope: !41)
!45 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !3, file: !3, line: 25, type: !46, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!46 = !DISubroutineType(types: !47)
!47 = !{!48}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DILocation(line: 27, column: 5, scope: !45)
!50 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 61, type: !4, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!51 = !DILocalVariable(name: "data", scope: !50, file: !3, line: 63, type: !8)
!52 = !DILocation(line: 63, column: 12, scope: !50)
!53 = !DILocation(line: 64, column: 10, scope: !50)
!54 = !DILocation(line: 65, column: 8, scope: !55)
!55 = distinct !DILexicalBlock(scope: !50, file: !3, line: 65, column: 8)
!56 = !DILocation(line: 65, column: 8, scope: !50)
!57 = !DILocation(line: 68, column: 9, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !3, line: 66, column: 5)
!59 = !DILocation(line: 69, column: 5, scope: !58)
!60 = !DILocalVariable(name: "dataBuffer", scope: !61, file: !3, line: 74, type: !8)
!61 = distinct !DILexicalBlock(scope: !62, file: !3, line: 72, column: 9)
!62 = distinct !DILexicalBlock(scope: !55, file: !3, line: 71, column: 5)
!63 = !DILocation(line: 74, column: 20, scope: !61)
!64 = !DILocation(line: 74, column: 41, scope: !61)
!65 = !DILocation(line: 75, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !3, line: 75, column: 17)
!67 = !DILocation(line: 75, column: 28, scope: !66)
!68 = !DILocation(line: 75, column: 17, scope: !61)
!69 = !DILocation(line: 77, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !3, line: 76, column: 13)
!71 = !DILocation(line: 78, column: 17, scope: !70)
!72 = !DILocation(line: 80, column: 20, scope: !61)
!73 = !DILocation(line: 80, column: 13, scope: !61)
!74 = !DILocation(line: 81, column: 13, scope: !61)
!75 = !DILocation(line: 81, column: 31, scope: !61)
!76 = !DILocation(line: 82, column: 20, scope: !61)
!77 = !DILocation(line: 82, column: 18, scope: !61)
!78 = !DILocation(line: 85, column: 15, scope: !50)
!79 = !DILocation(line: 85, column: 5, scope: !50)
!80 = !DILocation(line: 87, column: 10, scope: !50)
!81 = !DILocation(line: 87, column: 5, scope: !50)
!82 = !DILocation(line: 88, column: 1, scope: !50)
!83 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !3, file: !3, line: 30, type: !46, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!84 = !DILocation(line: 32, column: 5, scope: !83)
!85 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 91, type: !4, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!86 = !DILocalVariable(name: "data", scope: !85, file: !3, line: 93, type: !8)
!87 = !DILocation(line: 93, column: 12, scope: !85)
!88 = !DILocation(line: 94, column: 10, scope: !85)
!89 = !DILocation(line: 95, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !3, line: 95, column: 8)
!91 = !DILocation(line: 95, column: 8, scope: !85)
!92 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !3, line: 99, type: !8)
!93 = distinct !DILexicalBlock(scope: !94, file: !3, line: 97, column: 9)
!94 = distinct !DILexicalBlock(scope: !90, file: !3, line: 96, column: 5)
!95 = !DILocation(line: 99, column: 20, scope: !93)
!96 = !DILocation(line: 99, column: 41, scope: !93)
!97 = !DILocation(line: 100, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !3, line: 100, column: 17)
!99 = !DILocation(line: 100, column: 28, scope: !98)
!100 = !DILocation(line: 100, column: 17, scope: !93)
!101 = !DILocation(line: 102, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !3, line: 101, column: 13)
!103 = !DILocation(line: 103, column: 17, scope: !102)
!104 = !DILocation(line: 105, column: 20, scope: !93)
!105 = !DILocation(line: 105, column: 13, scope: !93)
!106 = !DILocation(line: 106, column: 13, scope: !93)
!107 = !DILocation(line: 106, column: 31, scope: !93)
!108 = !DILocation(line: 107, column: 20, scope: !93)
!109 = !DILocation(line: 107, column: 18, scope: !93)
!110 = !DILocation(line: 109, column: 5, scope: !94)
!111 = !DILocation(line: 110, column: 15, scope: !85)
!112 = !DILocation(line: 110, column: 5, scope: !85)
!113 = !DILocation(line: 112, column: 10, scope: !85)
!114 = !DILocation(line: 112, column: 5, scope: !85)
!115 = !DILocation(line: 113, column: 1, scope: !85)
