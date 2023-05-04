; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_static_07.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_static_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_char_static_07_bad.dataBuffer = internal global [100 x i8] zeroinitializer, align 16, !dbg !9
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_07_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i8* null, i8** %data, align 8, !dbg !29
  %0 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp = icmp eq i32 %0, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @llvm.memset.p0i8.i64(i8* align 16 getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_07_bad.dataBuffer, i64 0, i64 0), i8 65, i64 99, i1 false), !dbg !34
  store i8 0, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_07_bad.dataBuffer, i64 0, i64 99), align 1, !dbg !37
  store i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_07_bad.dataBuffer, i64 0, i64 0), i8** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8*, i8** %data, align 8, !dbg !40
  call void @printLine(i8* noundef %1), !dbg !41
  %2 = load i8*, i8** %data, align 8, !dbg !42
  call void @free(i8* noundef %2) #6, !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_07_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !49 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !50, metadata !DIExpression()), !dbg !51
  store i8* null, i8** %data, align 8, !dbg !52
  %0 = load i32, i32* @staticFive, align 4, !dbg !53
  %cmp = icmp ne i32 %0, 5, !dbg !55
  br i1 %cmp, label %if.then, label %if.else, !dbg !56

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !57
  br label %if.end3, !dbg !59

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !60, metadata !DIExpression()), !dbg !63
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !64
  store i8* %call, i8** %dataBuffer, align 8, !dbg !63
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !65
  %cmp1 = icmp eq i8* %1, null, !dbg !67
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !68

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @exit(i32 noundef 1) #7, !dbg !71
  unreachable, !dbg !71

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !73
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !74
  store i8 0, i8* %arrayidx, align 1, !dbg !75
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !76
  store i8* %4, i8** %data, align 8, !dbg !77
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %5 = load i8*, i8** %data, align 8, !dbg !78
  call void @printLine(i8* noundef %5), !dbg !79
  %6 = load i8*, i8** %data, align 8, !dbg !80
  call void @free(i8* noundef %6) #6, !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i8* null, i8** %data, align 8, !dbg !86
  %0 = load i32, i32* @staticFive, align 4, !dbg !87
  %cmp = icmp eq i32 %0, 5, !dbg !89
  br i1 %cmp, label %if.then, label %if.end3, !dbg !90

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !94
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !95
  store i8* %call, i8** %dataBuffer, align 8, !dbg !94
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !96
  %cmp1 = icmp eq i8* %1, null, !dbg !98
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !99

if.then2:                                         ; preds = %if.then
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
  br label %if.end3, !dbg !109

if.end3:                                          ; preds = %if.end, %entry
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
!llvm.module.flags = !{!19, !20, !21, !22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !3, line: 25, type: !18, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_static_07.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "5abfdd6765235f10ae3ba89286acec99")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{!9, !0}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !11, file: !3, line: 37, type: !15, isLocal: true, isDefinition: true)
!11 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_07_bad", scope: !3, file: !3, line: 29, type: !12, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !14)
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !{}
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 100)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !{i32 7, !"Dwarf Version", i32 5}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"PIC Level", i32 2}
!23 = !{i32 7, !"PIE Level", i32 2}
!24 = !{i32 7, !"uwtable", i32 1}
!25 = !{i32 7, !"frame-pointer", i32 2}
!26 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!27 = !DILocalVariable(name: "data", scope: !11, file: !3, line: 31, type: !5)
!28 = !DILocation(line: 31, column: 12, scope: !11)
!29 = !DILocation(line: 32, column: 10, scope: !11)
!30 = !DILocation(line: 33, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !3, line: 33, column: 8)
!32 = !DILocation(line: 33, column: 18, scope: !31)
!33 = !DILocation(line: 33, column: 8, scope: !11)
!34 = !DILocation(line: 38, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !36, file: !3, line: 35, column: 9)
!36 = distinct !DILexicalBlock(scope: !31, file: !3, line: 34, column: 5)
!37 = !DILocation(line: 39, column: 31, scope: !35)
!38 = !DILocation(line: 40, column: 18, scope: !35)
!39 = !DILocation(line: 42, column: 5, scope: !36)
!40 = !DILocation(line: 43, column: 15, scope: !11)
!41 = !DILocation(line: 43, column: 5, scope: !11)
!42 = !DILocation(line: 45, column: 10, scope: !11)
!43 = !DILocation(line: 45, column: 5, scope: !11)
!44 = !DILocation(line: 46, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_07_good", scope: !3, file: !3, line: 107, type: !12, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !14)
!46 = !DILocation(line: 109, column: 5, scope: !45)
!47 = !DILocation(line: 110, column: 5, scope: !45)
!48 = !DILocation(line: 111, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 53, type: !12, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !14)
!50 = !DILocalVariable(name: "data", scope: !49, file: !3, line: 55, type: !5)
!51 = !DILocation(line: 55, column: 12, scope: !49)
!52 = !DILocation(line: 56, column: 10, scope: !49)
!53 = !DILocation(line: 57, column: 8, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !3, line: 57, column: 8)
!55 = !DILocation(line: 57, column: 18, scope: !54)
!56 = !DILocation(line: 57, column: 8, scope: !49)
!57 = !DILocation(line: 60, column: 9, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !3, line: 58, column: 5)
!59 = !DILocation(line: 61, column: 5, scope: !58)
!60 = !DILocalVariable(name: "dataBuffer", scope: !61, file: !3, line: 66, type: !5)
!61 = distinct !DILexicalBlock(scope: !62, file: !3, line: 64, column: 9)
!62 = distinct !DILexicalBlock(scope: !54, file: !3, line: 63, column: 5)
!63 = !DILocation(line: 66, column: 20, scope: !61)
!64 = !DILocation(line: 66, column: 41, scope: !61)
!65 = !DILocation(line: 67, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !3, line: 67, column: 17)
!67 = !DILocation(line: 67, column: 28, scope: !66)
!68 = !DILocation(line: 67, column: 17, scope: !61)
!69 = !DILocation(line: 69, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !3, line: 68, column: 13)
!71 = !DILocation(line: 70, column: 17, scope: !70)
!72 = !DILocation(line: 72, column: 20, scope: !61)
!73 = !DILocation(line: 72, column: 13, scope: !61)
!74 = !DILocation(line: 73, column: 13, scope: !61)
!75 = !DILocation(line: 73, column: 31, scope: !61)
!76 = !DILocation(line: 74, column: 20, scope: !61)
!77 = !DILocation(line: 74, column: 18, scope: !61)
!78 = !DILocation(line: 77, column: 15, scope: !49)
!79 = !DILocation(line: 77, column: 5, scope: !49)
!80 = !DILocation(line: 79, column: 10, scope: !49)
!81 = !DILocation(line: 79, column: 5, scope: !49)
!82 = !DILocation(line: 80, column: 1, scope: !49)
!83 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 83, type: !12, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !14)
!84 = !DILocalVariable(name: "data", scope: !83, file: !3, line: 85, type: !5)
!85 = !DILocation(line: 85, column: 12, scope: !83)
!86 = !DILocation(line: 86, column: 10, scope: !83)
!87 = !DILocation(line: 87, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !3, line: 87, column: 8)
!89 = !DILocation(line: 87, column: 18, scope: !88)
!90 = !DILocation(line: 87, column: 8, scope: !83)
!91 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !3, line: 91, type: !5)
!92 = distinct !DILexicalBlock(scope: !93, file: !3, line: 89, column: 9)
!93 = distinct !DILexicalBlock(scope: !88, file: !3, line: 88, column: 5)
!94 = !DILocation(line: 91, column: 20, scope: !92)
!95 = !DILocation(line: 91, column: 41, scope: !92)
!96 = !DILocation(line: 92, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !3, line: 92, column: 17)
!98 = !DILocation(line: 92, column: 28, scope: !97)
!99 = !DILocation(line: 92, column: 17, scope: !92)
!100 = !DILocation(line: 94, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !3, line: 93, column: 13)
!102 = !DILocation(line: 95, column: 17, scope: !101)
!103 = !DILocation(line: 97, column: 20, scope: !92)
!104 = !DILocation(line: 97, column: 13, scope: !92)
!105 = !DILocation(line: 98, column: 13, scope: !92)
!106 = !DILocation(line: 98, column: 31, scope: !92)
!107 = !DILocation(line: 99, column: 20, scope: !92)
!108 = !DILocation(line: 99, column: 18, scope: !92)
!109 = !DILocation(line: 101, column: 5, scope: !93)
!110 = !DILocation(line: 102, column: 15, scope: !83)
!111 = !DILocation(line: 102, column: 5, scope: !83)
!112 = !DILocation(line: 104, column: 10, scope: !83)
!113 = !DILocation(line: 104, column: 5, scope: !83)
!114 = !DILocation(line: 105, column: 1, scope: !83)
