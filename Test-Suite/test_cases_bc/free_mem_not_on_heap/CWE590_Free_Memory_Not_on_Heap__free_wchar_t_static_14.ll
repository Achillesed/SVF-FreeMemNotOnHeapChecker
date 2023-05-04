; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_14.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@globalFive = external global i32, align 4
@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_14_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_14_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  %0 = load i32, i32* @globalFive, align 4, !dbg !29
  %cmp = icmp eq i32 %0, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %call = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_14_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !33
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_14_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !36
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_14_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32*, i32** %data, align 8, !dbg !39
  call void @printWLine(i32* noundef %1), !dbg !40
  %2 = load i32*, i32** %data, align 8, !dbg !41
  %3 = bitcast i32* %2 to i8*, !dbg !41
  call void @free(i8* noundef %3) #5, !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_14_good() #0 !dbg !44 {
entry:
  call void @goodG2B1(), !dbg !45
  call void @goodG2B2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !48 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !49, metadata !DIExpression()), !dbg !50
  store i32* null, i32** %data, align 8, !dbg !51
  %0 = load i32, i32* @globalFive, align 4, !dbg !52
  %cmp = icmp ne i32 %0, 5, !dbg !54
  br i1 %cmp, label %if.then, label %if.else, !dbg !55

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !56
  br label %if.end4, !dbg !58

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !59, metadata !DIExpression()), !dbg !62
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !63
  %1 = bitcast i8* %call to i32*, !dbg !64
  store i32* %1, i32** %dataBuffer, align 8, !dbg !62
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !65
  %cmp1 = icmp eq i32* %2, null, !dbg !67
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !68

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @exit(i32 noundef 1) #6, !dbg !71
  unreachable, !dbg !71

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !72
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !73
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !74
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !76
  store i32* %5, i32** %data, align 8, !dbg !77
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %6 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* noundef %6), !dbg !79
  %7 = load i32*, i32** %data, align 8, !dbg !80
  %8 = bitcast i32* %7 to i8*, !dbg !80
  call void @free(i8* noundef %8) #5, !dbg !81
  ret void, !dbg !82
}

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i32* null, i32** %data, align 8, !dbg !86
  %0 = load i32, i32* @globalFive, align 4, !dbg !87
  %cmp = icmp eq i32 %0, 5, !dbg !89
  br i1 %cmp, label %if.then, label %if.end4, !dbg !90

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !94
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !95
  %1 = bitcast i8* %call to i32*, !dbg !96
  store i32* %1, i32** %dataBuffer, align 8, !dbg !94
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !97
  %cmp1 = icmp eq i32* %2, null, !dbg !99
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !100

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @exit(i32 noundef 1) #6, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !105
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  store i32* %5, i32** %data, align 8, !dbg !109
  br label %if.end4, !dbg !110

if.end4:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data, align 8, !dbg !111
  call void @printWLine(i32* noundef %6), !dbg !112
  %7 = load i32*, i32** %data, align 8, !dbg !113
  %8 = bitcast i32* %7 to i8*, !dbg !113
  call void @free(i8* noundef %8) #5, !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!18, !19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 31, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_14_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_14.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "4e2b960c245c5df56527fd658a81fd23")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !13, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !12}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !{!0}
!14 = !{}
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 100)
!18 = !{i32 7, !"Dwarf Version", i32 5}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"PIC Level", i32 2}
!22 = !{i32 7, !"PIE Level", i32 2}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!26 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 25, type: !8)
!27 = !DILocation(line: 25, column: 15, scope: !2)
!28 = !DILocation(line: 26, column: 10, scope: !2)
!29 = !DILocation(line: 27, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !2, file: !3, line: 27, column: 8)
!31 = !DILocation(line: 27, column: 18, scope: !30)
!32 = !DILocation(line: 27, column: 8, scope: !2)
!33 = !DILocation(line: 32, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !35, file: !3, line: 29, column: 9)
!35 = distinct !DILexicalBlock(scope: !30, file: !3, line: 28, column: 5)
!36 = !DILocation(line: 33, column: 31, scope: !34)
!37 = !DILocation(line: 34, column: 18, scope: !34)
!38 = !DILocation(line: 36, column: 5, scope: !35)
!39 = !DILocation(line: 37, column: 16, scope: !2)
!40 = !DILocation(line: 37, column: 5, scope: !2)
!41 = !DILocation(line: 39, column: 10, scope: !2)
!42 = !DILocation(line: 39, column: 5, scope: !2)
!43 = !DILocation(line: 40, column: 1, scope: !2)
!44 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_14_good", scope: !3, file: !3, line: 101, type: !4, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!45 = !DILocation(line: 103, column: 5, scope: !44)
!46 = !DILocation(line: 104, column: 5, scope: !44)
!47 = !DILocation(line: 105, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 47, type: !4, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!49 = !DILocalVariable(name: "data", scope: !48, file: !3, line: 49, type: !8)
!50 = !DILocation(line: 49, column: 15, scope: !48)
!51 = !DILocation(line: 50, column: 10, scope: !48)
!52 = !DILocation(line: 51, column: 8, scope: !53)
!53 = distinct !DILexicalBlock(scope: !48, file: !3, line: 51, column: 8)
!54 = !DILocation(line: 51, column: 18, scope: !53)
!55 = !DILocation(line: 51, column: 8, scope: !48)
!56 = !DILocation(line: 54, column: 9, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !3, line: 52, column: 5)
!58 = !DILocation(line: 55, column: 5, scope: !57)
!59 = !DILocalVariable(name: "dataBuffer", scope: !60, file: !3, line: 60, type: !8)
!60 = distinct !DILexicalBlock(scope: !61, file: !3, line: 58, column: 9)
!61 = distinct !DILexicalBlock(scope: !53, file: !3, line: 57, column: 5)
!62 = !DILocation(line: 60, column: 23, scope: !60)
!63 = !DILocation(line: 60, column: 47, scope: !60)
!64 = !DILocation(line: 60, column: 36, scope: !60)
!65 = !DILocation(line: 61, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !3, line: 61, column: 17)
!67 = !DILocation(line: 61, column: 28, scope: !66)
!68 = !DILocation(line: 61, column: 17, scope: !60)
!69 = !DILocation(line: 63, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !3, line: 62, column: 13)
!71 = !DILocation(line: 64, column: 17, scope: !70)
!72 = !DILocation(line: 66, column: 21, scope: !60)
!73 = !DILocation(line: 66, column: 13, scope: !60)
!74 = !DILocation(line: 67, column: 13, scope: !60)
!75 = !DILocation(line: 67, column: 31, scope: !60)
!76 = !DILocation(line: 68, column: 20, scope: !60)
!77 = !DILocation(line: 68, column: 18, scope: !60)
!78 = !DILocation(line: 71, column: 16, scope: !48)
!79 = !DILocation(line: 71, column: 5, scope: !48)
!80 = !DILocation(line: 73, column: 10, scope: !48)
!81 = !DILocation(line: 73, column: 5, scope: !48)
!82 = !DILocation(line: 74, column: 1, scope: !48)
!83 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 77, type: !4, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!84 = !DILocalVariable(name: "data", scope: !83, file: !3, line: 79, type: !8)
!85 = !DILocation(line: 79, column: 15, scope: !83)
!86 = !DILocation(line: 80, column: 10, scope: !83)
!87 = !DILocation(line: 81, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !3, line: 81, column: 8)
!89 = !DILocation(line: 81, column: 18, scope: !88)
!90 = !DILocation(line: 81, column: 8, scope: !83)
!91 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !3, line: 85, type: !8)
!92 = distinct !DILexicalBlock(scope: !93, file: !3, line: 83, column: 9)
!93 = distinct !DILexicalBlock(scope: !88, file: !3, line: 82, column: 5)
!94 = !DILocation(line: 85, column: 23, scope: !92)
!95 = !DILocation(line: 85, column: 47, scope: !92)
!96 = !DILocation(line: 85, column: 36, scope: !92)
!97 = !DILocation(line: 86, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !3, line: 86, column: 17)
!99 = !DILocation(line: 86, column: 28, scope: !98)
!100 = !DILocation(line: 86, column: 17, scope: !92)
!101 = !DILocation(line: 88, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !3, line: 87, column: 13)
!103 = !DILocation(line: 89, column: 17, scope: !102)
!104 = !DILocation(line: 91, column: 21, scope: !92)
!105 = !DILocation(line: 91, column: 13, scope: !92)
!106 = !DILocation(line: 92, column: 13, scope: !92)
!107 = !DILocation(line: 92, column: 31, scope: !92)
!108 = !DILocation(line: 93, column: 20, scope: !92)
!109 = !DILocation(line: 93, column: 18, scope: !92)
!110 = !DILocation(line: 95, column: 5, scope: !93)
!111 = !DILocation(line: 96, column: 16, scope: !83)
!112 = !DILocation(line: 96, column: 5, scope: !83)
!113 = !DILocation(line: 98, column: 10, scope: !83)
!114 = !DILocation(line: 98, column: 5, scope: !83)
!115 = !DILocation(line: 99, column: 1, scope: !83)
