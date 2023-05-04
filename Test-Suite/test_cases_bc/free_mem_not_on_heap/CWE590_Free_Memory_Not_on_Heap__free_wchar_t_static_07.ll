; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_07.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_07_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !11
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_07_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i32* null, i32** %data, align 8, !dbg !30
  %0 = load i32, i32* @staticFive, align 4, !dbg !31
  %cmp = icmp eq i32 %0, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %call = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_07_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !35
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_07_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !38
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_07_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32*, i32** %data, align 8, !dbg !41
  call void @printWLine(i32* noundef %1), !dbg !42
  %2 = load i32*, i32** %data, align 8, !dbg !43
  %3 = bitcast i32* %2 to i8*, !dbg !43
  call void @free(i8* noundef %3) #5, !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_07_good() #0 !dbg !46 {
entry:
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !50 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !51, metadata !DIExpression()), !dbg !52
  store i32* null, i32** %data, align 8, !dbg !53
  %0 = load i32, i32* @staticFive, align 4, !dbg !54
  %cmp = icmp ne i32 %0, 5, !dbg !56
  br i1 %cmp, label %if.then, label %if.else, !dbg !57

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !58
  br label %if.end4, !dbg !60

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !61, metadata !DIExpression()), !dbg !64
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !65
  %1 = bitcast i8* %call to i32*, !dbg !66
  store i32* %1, i32** %dataBuffer, align 8, !dbg !64
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !67
  %cmp1 = icmp eq i32* %2, null, !dbg !69
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !70

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @exit(i32 noundef 1) #6, !dbg !73
  unreachable, !dbg !73

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !75
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !76
  store i32 0, i32* %arrayidx, align 4, !dbg !77
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !78
  store i32* %5, i32** %data, align 8, !dbg !79
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !89
  %cmp = icmp eq i32 %0, 5, !dbg !91
  br i1 %cmp, label %if.then, label %if.end4, !dbg !92

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !96
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !97
  %1 = bitcast i8* %call to i32*, !dbg !98
  store i32* %1, i32** %dataBuffer, align 8, !dbg !96
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !99
  %cmp1 = icmp eq i32* %2, null, !dbg !101
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !102

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @exit(i32 noundef 1) #6, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !106
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !107
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !110
  store i32* %5, i32** %data, align 8, !dbg !111
  br label %if.end4, !dbg !112

if.end4:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data, align 8, !dbg !113
  call void @printWLine(i32* noundef %6), !dbg !114
  %7 = load i32*, i32** %data, align 8, !dbg !115
  %8 = bitcast i32* %7 to i8*, !dbg !115
  call void @free(i8* noundef %8) #5, !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!20, !21, !22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !3, line: 25, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_07.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "f4c455bd0fb0c0d421ea06af2d82afa1")
!4 = !{!5, !9}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!11, !0}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !13, file: !3, line: 37, type: !17, isLocal: true, isDefinition: true)
!13 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_07_bad", scope: !3, file: !3, line: 29, type: !14, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !16)
!14 = !DISubroutineType(types: !15)
!15 = !{null}
!16 = !{}
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 100)
!20 = !{i32 7, !"Dwarf Version", i32 5}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"PIC Level", i32 2}
!24 = !{i32 7, !"PIE Level", i32 2}
!25 = !{i32 7, !"uwtable", i32 1}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!28 = !DILocalVariable(name: "data", scope: !13, file: !3, line: 31, type: !5)
!29 = !DILocation(line: 31, column: 15, scope: !13)
!30 = !DILocation(line: 32, column: 10, scope: !13)
!31 = !DILocation(line: 33, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !13, file: !3, line: 33, column: 8)
!33 = !DILocation(line: 33, column: 18, scope: !32)
!34 = !DILocation(line: 33, column: 8, scope: !13)
!35 = !DILocation(line: 38, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !37, file: !3, line: 35, column: 9)
!37 = distinct !DILexicalBlock(scope: !32, file: !3, line: 34, column: 5)
!38 = !DILocation(line: 39, column: 31, scope: !36)
!39 = !DILocation(line: 40, column: 18, scope: !36)
!40 = !DILocation(line: 42, column: 5, scope: !37)
!41 = !DILocation(line: 43, column: 16, scope: !13)
!42 = !DILocation(line: 43, column: 5, scope: !13)
!43 = !DILocation(line: 45, column: 10, scope: !13)
!44 = !DILocation(line: 45, column: 5, scope: !13)
!45 = !DILocation(line: 46, column: 1, scope: !13)
!46 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_07_good", scope: !3, file: !3, line: 107, type: !14, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !16)
!47 = !DILocation(line: 109, column: 5, scope: !46)
!48 = !DILocation(line: 110, column: 5, scope: !46)
!49 = !DILocation(line: 111, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 53, type: !14, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !16)
!51 = !DILocalVariable(name: "data", scope: !50, file: !3, line: 55, type: !5)
!52 = !DILocation(line: 55, column: 15, scope: !50)
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
!64 = !DILocation(line: 66, column: 23, scope: !62)
!65 = !DILocation(line: 66, column: 47, scope: !62)
!66 = !DILocation(line: 66, column: 36, scope: !62)
!67 = !DILocation(line: 67, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !62, file: !3, line: 67, column: 17)
!69 = !DILocation(line: 67, column: 28, scope: !68)
!70 = !DILocation(line: 67, column: 17, scope: !62)
!71 = !DILocation(line: 69, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !3, line: 68, column: 13)
!73 = !DILocation(line: 70, column: 17, scope: !72)
!74 = !DILocation(line: 72, column: 21, scope: !62)
!75 = !DILocation(line: 72, column: 13, scope: !62)
!76 = !DILocation(line: 73, column: 13, scope: !62)
!77 = !DILocation(line: 73, column: 31, scope: !62)
!78 = !DILocation(line: 74, column: 20, scope: !62)
!79 = !DILocation(line: 74, column: 18, scope: !62)
!80 = !DILocation(line: 77, column: 16, scope: !50)
!81 = !DILocation(line: 77, column: 5, scope: !50)
!82 = !DILocation(line: 79, column: 10, scope: !50)
!83 = !DILocation(line: 79, column: 5, scope: !50)
!84 = !DILocation(line: 80, column: 1, scope: !50)
!85 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 83, type: !14, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !16)
!86 = !DILocalVariable(name: "data", scope: !85, file: !3, line: 85, type: !5)
!87 = !DILocation(line: 85, column: 15, scope: !85)
!88 = !DILocation(line: 86, column: 10, scope: !85)
!89 = !DILocation(line: 87, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !3, line: 87, column: 8)
!91 = !DILocation(line: 87, column: 18, scope: !90)
!92 = !DILocation(line: 87, column: 8, scope: !85)
!93 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !3, line: 91, type: !5)
!94 = distinct !DILexicalBlock(scope: !95, file: !3, line: 89, column: 9)
!95 = distinct !DILexicalBlock(scope: !90, file: !3, line: 88, column: 5)
!96 = !DILocation(line: 91, column: 23, scope: !94)
!97 = !DILocation(line: 91, column: 47, scope: !94)
!98 = !DILocation(line: 91, column: 36, scope: !94)
!99 = !DILocation(line: 92, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !3, line: 92, column: 17)
!101 = !DILocation(line: 92, column: 28, scope: !100)
!102 = !DILocation(line: 92, column: 17, scope: !94)
!103 = !DILocation(line: 94, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !3, line: 93, column: 13)
!105 = !DILocation(line: 95, column: 17, scope: !104)
!106 = !DILocation(line: 97, column: 21, scope: !94)
!107 = !DILocation(line: 97, column: 13, scope: !94)
!108 = !DILocation(line: 98, column: 13, scope: !94)
!109 = !DILocation(line: 98, column: 31, scope: !94)
!110 = !DILocation(line: 99, column: 20, scope: !94)
!111 = !DILocation(line: 99, column: 18, scope: !94)
!112 = !DILocation(line: 101, column: 5, scope: !95)
!113 = !DILocation(line: 102, column: 16, scope: !85)
!114 = !DILocation(line: 102, column: 5, scope: !85)
!115 = !DILocation(line: 104, column: 10, scope: !85)
!116 = !DILocation(line: 104, column: 5, scope: !85)
!117 = !DILocation(line: 105, column: 1, scope: !85)
