; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_05.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %0 = load i32, i32* @staticTrue, align 4, !dbg !28
  %tobool = icmp ne i32 %0, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !34
  %1 = alloca i8, i64 400, align 16, !dbg !35
  %2 = bitcast i8* %1 to i32*, !dbg !36
  store i32* %2, i32** %dataBuffer, align 8, !dbg !34
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !37
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !38
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !41
  store i32* %5, i32** %data, align 8, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* noundef %6), !dbg !45
  %7 = load i32*, i32** %data, align 8, !dbg !46
  %8 = bitcast i32* %7 to i8*, !dbg !46
  call void @free(i8* noundef %8) #5, !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_05_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !53 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !54, metadata !DIExpression()), !dbg !55
  store i32* null, i32** %data, align 8, !dbg !56
  %0 = load i32, i32* @staticFalse, align 4, !dbg !57
  %tobool = icmp ne i32 %0, 0, !dbg !57
  br i1 %tobool, label %if.then, label %if.else, !dbg !59

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !60
  br label %if.end3, !dbg !62

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !63, metadata !DIExpression()), !dbg !66
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !67
  %1 = bitcast i8* %call to i32*, !dbg !68
  store i32* %1, i32** %dataBuffer, align 8, !dbg !66
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !69
  %cmp = icmp eq i32* %2, null, !dbg !71
  br i1 %cmp, label %if.then1, label %if.end, !dbg !72

if.then1:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @exit(i32 noundef 1) #6, !dbg !75
  unreachable, !dbg !75

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !76
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !77
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !80
  store i32* %5, i32** %data, align 8, !dbg !81
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %6 = load i32*, i32** %data, align 8, !dbg !82
  call void @printWLine(i32* noundef %6), !dbg !83
  %7 = load i32*, i32** %data, align 8, !dbg !84
  %8 = bitcast i32* %7 to i8*, !dbg !84
  call void @free(i8* noundef %8) #5, !dbg !85
  ret void, !dbg !86
}

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32* null, i32** %data, align 8, !dbg !90
  %0 = load i32, i32* @staticTrue, align 4, !dbg !91
  %tobool = icmp ne i32 %0, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.end3, !dbg !93

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !94, metadata !DIExpression()), !dbg !97
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !98
  %1 = bitcast i8* %call to i32*, !dbg !99
  store i32* %1, i32** %dataBuffer, align 8, !dbg !97
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  %cmp = icmp eq i32* %2, null, !dbg !102
  br i1 %cmp, label %if.then1, label %if.end, !dbg !103

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @exit(i32 noundef 1) #6, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !108
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  store i32* %5, i32** %data, align 8, !dbg !112
  br label %if.end3, !dbg !113

if.end3:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data, align 8, !dbg !114
  call void @printWLine(i32* noundef %6), !dbg !115
  %7 = load i32*, i32** %data, align 8, !dbg !116
  %8 = bitcast i32* %7 to i8*, !dbg !116
  call void @free(i8* noundef %8) #5, !dbg !117
  ret void, !dbg !118
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !3, line: 25, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_05.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "88c57e6024630e2d0455ccd86c351738")
!4 = !{!5, !9}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !3, line: 26, type: !8, isLocal: true, isDefinition: true)
!13 = !{i32 7, !"Dwarf Version", i32 5}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"PIE Level", i32 2}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!21 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_05_bad", scope: !3, file: !3, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !{}
!25 = !DILocalVariable(name: "data", scope: !21, file: !3, line: 32, type: !5)
!26 = !DILocation(line: 32, column: 15, scope: !21)
!27 = !DILocation(line: 33, column: 10, scope: !21)
!28 = !DILocation(line: 34, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !3, line: 34, column: 8)
!30 = !DILocation(line: 34, column: 8, scope: !21)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !3, line: 38, type: !5)
!32 = distinct !DILexicalBlock(scope: !33, file: !3, line: 36, column: 9)
!33 = distinct !DILexicalBlock(scope: !29, file: !3, line: 35, column: 5)
!34 = !DILocation(line: 38, column: 23, scope: !32)
!35 = !DILocation(line: 38, column: 47, scope: !32)
!36 = !DILocation(line: 38, column: 36, scope: !32)
!37 = !DILocation(line: 39, column: 21, scope: !32)
!38 = !DILocation(line: 39, column: 13, scope: !32)
!39 = !DILocation(line: 40, column: 13, scope: !32)
!40 = !DILocation(line: 40, column: 31, scope: !32)
!41 = !DILocation(line: 41, column: 20, scope: !32)
!42 = !DILocation(line: 41, column: 18, scope: !32)
!43 = !DILocation(line: 43, column: 5, scope: !33)
!44 = !DILocation(line: 44, column: 16, scope: !21)
!45 = !DILocation(line: 44, column: 5, scope: !21)
!46 = !DILocation(line: 46, column: 10, scope: !21)
!47 = !DILocation(line: 46, column: 5, scope: !21)
!48 = !DILocation(line: 47, column: 1, scope: !21)
!49 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_05_good", scope: !3, file: !3, line: 108, type: !22, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!50 = !DILocation(line: 110, column: 5, scope: !49)
!51 = !DILocation(line: 111, column: 5, scope: !49)
!52 = !DILocation(line: 112, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 54, type: !22, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!54 = !DILocalVariable(name: "data", scope: !53, file: !3, line: 56, type: !5)
!55 = !DILocation(line: 56, column: 15, scope: !53)
!56 = !DILocation(line: 57, column: 10, scope: !53)
!57 = !DILocation(line: 58, column: 8, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !3, line: 58, column: 8)
!59 = !DILocation(line: 58, column: 8, scope: !53)
!60 = !DILocation(line: 61, column: 9, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !3, line: 59, column: 5)
!62 = !DILocation(line: 62, column: 5, scope: !61)
!63 = !DILocalVariable(name: "dataBuffer", scope: !64, file: !3, line: 67, type: !5)
!64 = distinct !DILexicalBlock(scope: !65, file: !3, line: 65, column: 9)
!65 = distinct !DILexicalBlock(scope: !58, file: !3, line: 64, column: 5)
!66 = !DILocation(line: 67, column: 23, scope: !64)
!67 = !DILocation(line: 67, column: 47, scope: !64)
!68 = !DILocation(line: 67, column: 36, scope: !64)
!69 = !DILocation(line: 68, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !64, file: !3, line: 68, column: 17)
!71 = !DILocation(line: 68, column: 28, scope: !70)
!72 = !DILocation(line: 68, column: 17, scope: !64)
!73 = !DILocation(line: 70, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !3, line: 69, column: 13)
!75 = !DILocation(line: 71, column: 17, scope: !74)
!76 = !DILocation(line: 73, column: 21, scope: !64)
!77 = !DILocation(line: 73, column: 13, scope: !64)
!78 = !DILocation(line: 74, column: 13, scope: !64)
!79 = !DILocation(line: 74, column: 31, scope: !64)
!80 = !DILocation(line: 75, column: 20, scope: !64)
!81 = !DILocation(line: 75, column: 18, scope: !64)
!82 = !DILocation(line: 78, column: 16, scope: !53)
!83 = !DILocation(line: 78, column: 5, scope: !53)
!84 = !DILocation(line: 80, column: 10, scope: !53)
!85 = !DILocation(line: 80, column: 5, scope: !53)
!86 = !DILocation(line: 81, column: 1, scope: !53)
!87 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 84, type: !22, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!88 = !DILocalVariable(name: "data", scope: !87, file: !3, line: 86, type: !5)
!89 = !DILocation(line: 86, column: 15, scope: !87)
!90 = !DILocation(line: 87, column: 10, scope: !87)
!91 = !DILocation(line: 88, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !3, line: 88, column: 8)
!93 = !DILocation(line: 88, column: 8, scope: !87)
!94 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !3, line: 92, type: !5)
!95 = distinct !DILexicalBlock(scope: !96, file: !3, line: 90, column: 9)
!96 = distinct !DILexicalBlock(scope: !92, file: !3, line: 89, column: 5)
!97 = !DILocation(line: 92, column: 23, scope: !95)
!98 = !DILocation(line: 92, column: 47, scope: !95)
!99 = !DILocation(line: 92, column: 36, scope: !95)
!100 = !DILocation(line: 93, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !3, line: 93, column: 17)
!102 = !DILocation(line: 93, column: 28, scope: !101)
!103 = !DILocation(line: 93, column: 17, scope: !95)
!104 = !DILocation(line: 95, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !3, line: 94, column: 13)
!106 = !DILocation(line: 96, column: 17, scope: !105)
!107 = !DILocation(line: 98, column: 21, scope: !95)
!108 = !DILocation(line: 98, column: 13, scope: !95)
!109 = !DILocation(line: 99, column: 13, scope: !95)
!110 = !DILocation(line: 99, column: 31, scope: !95)
!111 = !DILocation(line: 100, column: 20, scope: !95)
!112 = !DILocation(line: 100, column: 18, scope: !95)
!113 = !DILocation(line: 102, column: 5, scope: !96)
!114 = !DILocation(line: 103, column: 16, scope: !87)
!115 = !DILocation(line: 103, column: 5, scope: !87)
!116 = !DILocation(line: 105, column: 10, scope: !87)
!117 = !DILocation(line: 105, column: 5, scope: !87)
!118 = !DILocation(line: 106, column: 1, scope: !87)
