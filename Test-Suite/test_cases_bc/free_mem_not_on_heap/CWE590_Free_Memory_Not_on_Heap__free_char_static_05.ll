; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_static_05.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_static_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_char_static_05_bad.dataBuffer = internal global [100 x i8] zeroinitializer, align 16, !dbg !9
@staticFalse = internal global i32 0, align 4, !dbg !18
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_05_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !29, metadata !DIExpression()), !dbg !30
  store i8* null, i8** %data, align 8, !dbg !31
  %0 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool = icmp ne i32 %0, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @llvm.memset.p0i8.i64(i8* align 16 getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_05_bad.dataBuffer, i64 0, i64 0), i8 65, i64 99, i1 false), !dbg !35
  store i8 0, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_05_bad.dataBuffer, i64 0, i64 99), align 1, !dbg !38
  store i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_05_bad.dataBuffer, i64 0, i64 0), i8** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8*, i8** %data, align 8, !dbg !41
  call void @printLine(i8* noundef %1), !dbg !42
  %2 = load i8*, i8** %data, align 8, !dbg !43
  call void @free(i8* noundef %2) #6, !dbg !44
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_05_good() #0 !dbg !46 {
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
  %0 = load i32, i32* @staticFalse, align 4, !dbg !54
  %tobool = icmp ne i32 %0, 0, !dbg !54
  br i1 %tobool, label %if.then, label %if.else, !dbg !56

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !57
  br label %if.end2, !dbg !59

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !60, metadata !DIExpression()), !dbg !63
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !64
  store i8* %call, i8** %dataBuffer, align 8, !dbg !63
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !65
  %cmp = icmp eq i8* %1, null, !dbg !67
  br i1 %cmp, label %if.then1, label %if.end, !dbg !68

if.then1:                                         ; preds = %if.else
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
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !87
  %tobool = icmp ne i32 %0, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.end2, !dbg !89

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !90, metadata !DIExpression()), !dbg !93
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !94
  store i8* %call, i8** %dataBuffer, align 8, !dbg !93
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !95
  %cmp = icmp eq i8* %1, null, !dbg !97
  br i1 %cmp, label %if.then1, label %if.end, !dbg !98

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @exit(i32 noundef 1) #7, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !103
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  store i8* %4, i8** %data, align 8, !dbg !107
  br label %if.end2, !dbg !108

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* noundef %5), !dbg !110
  %6 = load i8*, i8** %data, align 8, !dbg !111
  call void @free(i8* noundef %6) #6, !dbg !112
  ret void, !dbg !113
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
!llvm.module.flags = !{!21, !22, !23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !3, line: 25, type: !20, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_static_05.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "ed8b95c6fea1ccf52ee8f7f3222c46b6")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{!9, !0, !18}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !11, file: !3, line: 38, type: !15, isLocal: true, isDefinition: true)
!11 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_05_bad", scope: !3, file: !3, line: 30, type: !12, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !14)
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !{}
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 100)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !3, line: 26, type: !20, isLocal: true, isDefinition: true)
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{i32 7, !"Dwarf Version", i32 5}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{i32 7, !"PIC Level", i32 2}
!25 = !{i32 7, !"PIE Level", i32 2}
!26 = !{i32 7, !"uwtable", i32 1}
!27 = !{i32 7, !"frame-pointer", i32 2}
!28 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!29 = !DILocalVariable(name: "data", scope: !11, file: !3, line: 32, type: !5)
!30 = !DILocation(line: 32, column: 12, scope: !11)
!31 = !DILocation(line: 33, column: 10, scope: !11)
!32 = !DILocation(line: 34, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !11, file: !3, line: 34, column: 8)
!34 = !DILocation(line: 34, column: 8, scope: !11)
!35 = !DILocation(line: 39, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !37, file: !3, line: 36, column: 9)
!37 = distinct !DILexicalBlock(scope: !33, file: !3, line: 35, column: 5)
!38 = !DILocation(line: 40, column: 31, scope: !36)
!39 = !DILocation(line: 41, column: 18, scope: !36)
!40 = !DILocation(line: 43, column: 5, scope: !37)
!41 = !DILocation(line: 44, column: 15, scope: !11)
!42 = !DILocation(line: 44, column: 5, scope: !11)
!43 = !DILocation(line: 46, column: 10, scope: !11)
!44 = !DILocation(line: 46, column: 5, scope: !11)
!45 = !DILocation(line: 47, column: 1, scope: !11)
!46 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_05_good", scope: !3, file: !3, line: 108, type: !12, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !14)
!47 = !DILocation(line: 110, column: 5, scope: !46)
!48 = !DILocation(line: 111, column: 5, scope: !46)
!49 = !DILocation(line: 112, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 54, type: !12, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !14)
!51 = !DILocalVariable(name: "data", scope: !50, file: !3, line: 56, type: !5)
!52 = !DILocation(line: 56, column: 12, scope: !50)
!53 = !DILocation(line: 57, column: 10, scope: !50)
!54 = !DILocation(line: 58, column: 8, scope: !55)
!55 = distinct !DILexicalBlock(scope: !50, file: !3, line: 58, column: 8)
!56 = !DILocation(line: 58, column: 8, scope: !50)
!57 = !DILocation(line: 61, column: 9, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !3, line: 59, column: 5)
!59 = !DILocation(line: 62, column: 5, scope: !58)
!60 = !DILocalVariable(name: "dataBuffer", scope: !61, file: !3, line: 67, type: !5)
!61 = distinct !DILexicalBlock(scope: !62, file: !3, line: 65, column: 9)
!62 = distinct !DILexicalBlock(scope: !55, file: !3, line: 64, column: 5)
!63 = !DILocation(line: 67, column: 20, scope: !61)
!64 = !DILocation(line: 67, column: 41, scope: !61)
!65 = !DILocation(line: 68, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !3, line: 68, column: 17)
!67 = !DILocation(line: 68, column: 28, scope: !66)
!68 = !DILocation(line: 68, column: 17, scope: !61)
!69 = !DILocation(line: 70, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !3, line: 69, column: 13)
!71 = !DILocation(line: 71, column: 17, scope: !70)
!72 = !DILocation(line: 73, column: 20, scope: !61)
!73 = !DILocation(line: 73, column: 13, scope: !61)
!74 = !DILocation(line: 74, column: 13, scope: !61)
!75 = !DILocation(line: 74, column: 31, scope: !61)
!76 = !DILocation(line: 75, column: 20, scope: !61)
!77 = !DILocation(line: 75, column: 18, scope: !61)
!78 = !DILocation(line: 78, column: 15, scope: !50)
!79 = !DILocation(line: 78, column: 5, scope: !50)
!80 = !DILocation(line: 80, column: 10, scope: !50)
!81 = !DILocation(line: 80, column: 5, scope: !50)
!82 = !DILocation(line: 81, column: 1, scope: !50)
!83 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 84, type: !12, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !14)
!84 = !DILocalVariable(name: "data", scope: !83, file: !3, line: 86, type: !5)
!85 = !DILocation(line: 86, column: 12, scope: !83)
!86 = !DILocation(line: 87, column: 10, scope: !83)
!87 = !DILocation(line: 88, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !3, line: 88, column: 8)
!89 = !DILocation(line: 88, column: 8, scope: !83)
!90 = !DILocalVariable(name: "dataBuffer", scope: !91, file: !3, line: 92, type: !5)
!91 = distinct !DILexicalBlock(scope: !92, file: !3, line: 90, column: 9)
!92 = distinct !DILexicalBlock(scope: !88, file: !3, line: 89, column: 5)
!93 = !DILocation(line: 92, column: 20, scope: !91)
!94 = !DILocation(line: 92, column: 41, scope: !91)
!95 = !DILocation(line: 93, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !3, line: 93, column: 17)
!97 = !DILocation(line: 93, column: 28, scope: !96)
!98 = !DILocation(line: 93, column: 17, scope: !91)
!99 = !DILocation(line: 95, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !3, line: 94, column: 13)
!101 = !DILocation(line: 96, column: 17, scope: !100)
!102 = !DILocation(line: 98, column: 20, scope: !91)
!103 = !DILocation(line: 98, column: 13, scope: !91)
!104 = !DILocation(line: 99, column: 13, scope: !91)
!105 = !DILocation(line: 99, column: 31, scope: !91)
!106 = !DILocation(line: 100, column: 20, scope: !91)
!107 = !DILocation(line: 100, column: 18, scope: !91)
!108 = !DILocation(line: 102, column: 5, scope: !92)
!109 = !DILocation(line: 103, column: 15, scope: !83)
!110 = !DILocation(line: 103, column: 5, scope: !83)
!111 = !DILocation(line: 105, column: 10, scope: !83)
!112 = !DILocation(line: 105, column: 5, scope: !83)
!113 = !DILocation(line: 106, column: 1, scope: !83)
