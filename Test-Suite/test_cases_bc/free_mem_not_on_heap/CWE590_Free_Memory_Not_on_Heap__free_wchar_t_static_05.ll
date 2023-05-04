; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_05.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_05_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !11
@staticFalse = internal global i32 0, align 4, !dbg !20
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_05_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !30, metadata !DIExpression()), !dbg !31
  store i32* null, i32** %data, align 8, !dbg !32
  %0 = load i32, i32* @staticTrue, align 4, !dbg !33
  %tobool = icmp ne i32 %0, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %call = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_05_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !36
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_05_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !39
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_05_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32*, i32** %data, align 8, !dbg !42
  call void @printWLine(i32* noundef %1), !dbg !43
  %2 = load i32*, i32** %data, align 8, !dbg !44
  %3 = bitcast i32* %2 to i8*, !dbg !44
  call void @free(i8* noundef %3) #5, !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_05_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !51 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !52, metadata !DIExpression()), !dbg !53
  store i32* null, i32** %data, align 8, !dbg !54
  %0 = load i32, i32* @staticFalse, align 4, !dbg !55
  %tobool = icmp ne i32 %0, 0, !dbg !55
  br i1 %tobool, label %if.then, label %if.else, !dbg !57

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !58
  br label %if.end3, !dbg !60

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !61, metadata !DIExpression()), !dbg !64
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !65
  %1 = bitcast i8* %call to i32*, !dbg !66
  store i32* %1, i32** %dataBuffer, align 8, !dbg !64
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !67
  %cmp = icmp eq i32* %2, null, !dbg !69
  br i1 %cmp, label %if.then1, label %if.end, !dbg !70

if.then1:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @exit(i32 noundef 1) #6, !dbg !73
  unreachable, !dbg !73

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !75
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !76
  store i32 0, i32* %arrayidx, align 4, !dbg !77
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !78
  store i32* %5, i32** %data, align 8, !dbg !79
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %6 = load i32*, i32** %data, align 8, !dbg !80
  call void @printWLine(i32* noundef %6), !dbg !81
  %7 = load i32*, i32** %data, align 8, !dbg !82
  %8 = bitcast i32* %7 to i8*, !dbg !82
  call void @free(i8* noundef %8) #5, !dbg !83
  ret void, !dbg !84
}

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  store i32* null, i32** %data, align 8, !dbg !88
  %0 = load i32, i32* @staticTrue, align 4, !dbg !89
  %tobool = icmp ne i32 %0, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.end3, !dbg !91

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !95
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !96
  %1 = bitcast i8* %call to i32*, !dbg !97
  store i32* %1, i32** %dataBuffer, align 8, !dbg !95
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !98
  %cmp = icmp eq i32* %2, null, !dbg !100
  br i1 %cmp, label %if.then1, label %if.end, !dbg !101

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @exit(i32 noundef 1) #6, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !105
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !106
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  store i32* %5, i32** %data, align 8, !dbg !110
  br label %if.end3, !dbg !111

if.end3:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data, align 8, !dbg !112
  call void @printWLine(i32* noundef %6), !dbg !113
  %7 = load i32*, i32** %data, align 8, !dbg !114
  %8 = bitcast i32* %7 to i8*, !dbg !114
  call void @free(i8* noundef %8) #5, !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !3, line: 25, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_05.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "961fc13eea89e75f2548e98acee1588a")
!4 = !{!5, !9}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!11, !0, !20}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !13, file: !3, line: 38, type: !17, isLocal: true, isDefinition: true)
!13 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_05_bad", scope: !3, file: !3, line: 30, type: !14, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !16)
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 100)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !3, line: 26, type: !8, isLocal: true, isDefinition: true)
!22 = !{i32 7, !"Dwarf Version", i32 5}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"PIC Level", i32 2}
!26 = !{i32 7, !"PIE Level", i32 2}
!27 = !{i32 7, !"uwtable", i32 1}
!28 = !{i32 7, !"frame-pointer", i32 2}
!29 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!30 = !DILocalVariable(name: "data", scope: !13, file: !3, line: 32, type: !5)
!31 = !DILocation(line: 32, column: 15, scope: !13)
!32 = !DILocation(line: 33, column: 10, scope: !13)
!33 = !DILocation(line: 34, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !13, file: !3, line: 34, column: 8)
!35 = !DILocation(line: 34, column: 8, scope: !13)
!36 = !DILocation(line: 39, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !38, file: !3, line: 36, column: 9)
!38 = distinct !DILexicalBlock(scope: !34, file: !3, line: 35, column: 5)
!39 = !DILocation(line: 40, column: 31, scope: !37)
!40 = !DILocation(line: 41, column: 18, scope: !37)
!41 = !DILocation(line: 43, column: 5, scope: !38)
!42 = !DILocation(line: 44, column: 16, scope: !13)
!43 = !DILocation(line: 44, column: 5, scope: !13)
!44 = !DILocation(line: 46, column: 10, scope: !13)
!45 = !DILocation(line: 46, column: 5, scope: !13)
!46 = !DILocation(line: 47, column: 1, scope: !13)
!47 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_05_good", scope: !3, file: !3, line: 108, type: !14, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !16)
!48 = !DILocation(line: 110, column: 5, scope: !47)
!49 = !DILocation(line: 111, column: 5, scope: !47)
!50 = !DILocation(line: 112, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 54, type: !14, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !16)
!52 = !DILocalVariable(name: "data", scope: !51, file: !3, line: 56, type: !5)
!53 = !DILocation(line: 56, column: 15, scope: !51)
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
!64 = !DILocation(line: 67, column: 23, scope: !62)
!65 = !DILocation(line: 67, column: 47, scope: !62)
!66 = !DILocation(line: 67, column: 36, scope: !62)
!67 = !DILocation(line: 68, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !62, file: !3, line: 68, column: 17)
!69 = !DILocation(line: 68, column: 28, scope: !68)
!70 = !DILocation(line: 68, column: 17, scope: !62)
!71 = !DILocation(line: 70, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !3, line: 69, column: 13)
!73 = !DILocation(line: 71, column: 17, scope: !72)
!74 = !DILocation(line: 73, column: 21, scope: !62)
!75 = !DILocation(line: 73, column: 13, scope: !62)
!76 = !DILocation(line: 74, column: 13, scope: !62)
!77 = !DILocation(line: 74, column: 31, scope: !62)
!78 = !DILocation(line: 75, column: 20, scope: !62)
!79 = !DILocation(line: 75, column: 18, scope: !62)
!80 = !DILocation(line: 78, column: 16, scope: !51)
!81 = !DILocation(line: 78, column: 5, scope: !51)
!82 = !DILocation(line: 80, column: 10, scope: !51)
!83 = !DILocation(line: 80, column: 5, scope: !51)
!84 = !DILocation(line: 81, column: 1, scope: !51)
!85 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 84, type: !14, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !16)
!86 = !DILocalVariable(name: "data", scope: !85, file: !3, line: 86, type: !5)
!87 = !DILocation(line: 86, column: 15, scope: !85)
!88 = !DILocation(line: 87, column: 10, scope: !85)
!89 = !DILocation(line: 88, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !3, line: 88, column: 8)
!91 = !DILocation(line: 88, column: 8, scope: !85)
!92 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !3, line: 92, type: !5)
!93 = distinct !DILexicalBlock(scope: !94, file: !3, line: 90, column: 9)
!94 = distinct !DILexicalBlock(scope: !90, file: !3, line: 89, column: 5)
!95 = !DILocation(line: 92, column: 23, scope: !93)
!96 = !DILocation(line: 92, column: 47, scope: !93)
!97 = !DILocation(line: 92, column: 36, scope: !93)
!98 = !DILocation(line: 93, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !3, line: 93, column: 17)
!100 = !DILocation(line: 93, column: 28, scope: !99)
!101 = !DILocation(line: 93, column: 17, scope: !93)
!102 = !DILocation(line: 95, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !3, line: 94, column: 13)
!104 = !DILocation(line: 96, column: 17, scope: !103)
!105 = !DILocation(line: 98, column: 21, scope: !93)
!106 = !DILocation(line: 98, column: 13, scope: !93)
!107 = !DILocation(line: 99, column: 13, scope: !93)
!108 = !DILocation(line: 99, column: 31, scope: !93)
!109 = !DILocation(line: 100, column: 20, scope: !93)
!110 = !DILocation(line: 100, column: 18, scope: !93)
!111 = !DILocation(line: 102, column: 5, scope: !94)
!112 = !DILocation(line: 103, column: 16, scope: !85)
!113 = !DILocation(line: 103, column: 5, scope: !85)
!114 = !DILocation(line: 105, column: 10, scope: !85)
!115 = !DILocation(line: 105, column: 5, scope: !85)
!116 = !DILocation(line: 106, column: 1, scope: !85)
