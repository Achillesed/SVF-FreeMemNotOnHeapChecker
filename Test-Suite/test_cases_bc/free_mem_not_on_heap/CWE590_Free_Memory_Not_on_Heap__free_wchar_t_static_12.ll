; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_12.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_12_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_12_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  %call1 = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_12_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !32
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_12_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !35
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_12_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !36
  br label %if.end5, !dbg !37

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !38, metadata !DIExpression()), !dbg !41
  %call2 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !42
  %0 = bitcast i8* %call2 to i32*, !dbg !43
  store i32* %0, i32** %dataBuffer, align 8, !dbg !41
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !44
  %cmp = icmp eq i32* %1, null, !dbg !46
  br i1 %cmp, label %if.then3, label %if.end, !dbg !47

if.then3:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !48
  call void @exit(i32 noundef 1) #6, !dbg !50
  unreachable, !dbg !50

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !51
  %call4 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !52
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !53
  store i32 0, i32* %arrayidx, align 4, !dbg !54
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !55
  store i32* %4, i32** %data, align 8, !dbg !56
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  %5 = load i32*, i32** %data, align 8, !dbg !57
  call void @printWLine(i32* noundef %5), !dbg !58
  %6 = load i32*, i32** %data, align 8, !dbg !59
  %7 = bitcast i32* %6 to i8*, !dbg !59
  call void @free(i8* noundef %7) #5, !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @printWLine(i32* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_12_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataBuffer4 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  store i32* null, i32** %data, align 8, !dbg !68
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !69
  %tobool = icmp ne i32 %call, 0, !dbg !69
  br i1 %tobool, label %if.then, label %if.else, !dbg !71

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !72, metadata !DIExpression()), !dbg !75
  %call1 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !76
  %0 = bitcast i8* %call1 to i32*, !dbg !77
  store i32* %0, i32** %dataBuffer, align 8, !dbg !75
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !78
  %cmp = icmp eq i32* %1, null, !dbg !80
  br i1 %cmp, label %if.then2, label %if.end, !dbg !81

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @exit(i32 noundef 1) #6, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !86
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !89
  store i32* %4, i32** %data, align 8, !dbg !90
  br label %if.end11, !dbg !91

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer4, metadata !92, metadata !DIExpression()), !dbg !95
  %call5 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !96
  %5 = bitcast i8* %call5 to i32*, !dbg !97
  store i32* %5, i32** %dataBuffer4, align 8, !dbg !95
  %6 = load i32*, i32** %dataBuffer4, align 8, !dbg !98
  %cmp6 = icmp eq i32* %6, null, !dbg !100
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !101

if.then7:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @exit(i32 noundef 1) #6, !dbg !104
  unreachable, !dbg !104

if.end8:                                          ; preds = %if.else
  %7 = load i32*, i32** %dataBuffer4, align 8, !dbg !105
  %call9 = call i32* @wmemset(i32* noundef %7, i32 noundef 65, i64 noundef 99) #5, !dbg !106
  %8 = load i32*, i32** %dataBuffer4, align 8, !dbg !107
  %arrayidx10 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !107
  store i32 0, i32* %arrayidx10, align 4, !dbg !108
  %9 = load i32*, i32** %dataBuffer4, align 8, !dbg !109
  store i32* %9, i32** %data, align 8, !dbg !110
  br label %if.end11

if.end11:                                         ; preds = %if.end8, %if.end
  %10 = load i32*, i32** %data, align 8, !dbg !111
  call void @printWLine(i32* noundef %10), !dbg !112
  %11 = load i32*, i32** %data, align 8, !dbg !113
  %12 = bitcast i32* %11 to i8*, !dbg !113
  call void @free(i8* noundef %12) #5, !dbg !114
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!18, !19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 31, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_12_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_12.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "6bcdd9af4e402f6be0b4216be1ba2d88")
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
!31 = !DILocation(line: 27, column: 8, scope: !2)
!32 = !DILocation(line: 32, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !3, line: 29, column: 9)
!34 = distinct !DILexicalBlock(scope: !30, file: !3, line: 28, column: 5)
!35 = !DILocation(line: 33, column: 31, scope: !33)
!36 = !DILocation(line: 34, column: 18, scope: !33)
!37 = !DILocation(line: 36, column: 5, scope: !34)
!38 = !DILocalVariable(name: "dataBuffer", scope: !39, file: !3, line: 41, type: !8)
!39 = distinct !DILexicalBlock(scope: !40, file: !3, line: 39, column: 9)
!40 = distinct !DILexicalBlock(scope: !30, file: !3, line: 38, column: 5)
!41 = !DILocation(line: 41, column: 23, scope: !39)
!42 = !DILocation(line: 41, column: 47, scope: !39)
!43 = !DILocation(line: 41, column: 36, scope: !39)
!44 = !DILocation(line: 42, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !3, line: 42, column: 17)
!46 = !DILocation(line: 42, column: 28, scope: !45)
!47 = !DILocation(line: 42, column: 17, scope: !39)
!48 = !DILocation(line: 44, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !3, line: 43, column: 13)
!50 = !DILocation(line: 45, column: 17, scope: !49)
!51 = !DILocation(line: 47, column: 21, scope: !39)
!52 = !DILocation(line: 47, column: 13, scope: !39)
!53 = !DILocation(line: 48, column: 13, scope: !39)
!54 = !DILocation(line: 48, column: 31, scope: !39)
!55 = !DILocation(line: 49, column: 20, scope: !39)
!56 = !DILocation(line: 49, column: 18, scope: !39)
!57 = !DILocation(line: 52, column: 16, scope: !2)
!58 = !DILocation(line: 52, column: 5, scope: !2)
!59 = !DILocation(line: 54, column: 10, scope: !2)
!60 = !DILocation(line: 54, column: 5, scope: !2)
!61 = !DILocation(line: 55, column: 1, scope: !2)
!62 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_12_good", scope: !3, file: !3, line: 102, type: !4, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!63 = !DILocation(line: 104, column: 5, scope: !62)
!64 = !DILocation(line: 105, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 63, type: !4, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!66 = !DILocalVariable(name: "data", scope: !65, file: !3, line: 65, type: !8)
!67 = !DILocation(line: 65, column: 15, scope: !65)
!68 = !DILocation(line: 66, column: 10, scope: !65)
!69 = !DILocation(line: 67, column: 8, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !3, line: 67, column: 8)
!71 = !DILocation(line: 67, column: 8, scope: !65)
!72 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !3, line: 71, type: !8)
!73 = distinct !DILexicalBlock(scope: !74, file: !3, line: 69, column: 9)
!74 = distinct !DILexicalBlock(scope: !70, file: !3, line: 68, column: 5)
!75 = !DILocation(line: 71, column: 23, scope: !73)
!76 = !DILocation(line: 71, column: 47, scope: !73)
!77 = !DILocation(line: 71, column: 36, scope: !73)
!78 = !DILocation(line: 72, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !73, file: !3, line: 72, column: 17)
!80 = !DILocation(line: 72, column: 28, scope: !79)
!81 = !DILocation(line: 72, column: 17, scope: !73)
!82 = !DILocation(line: 74, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !3, line: 73, column: 13)
!84 = !DILocation(line: 75, column: 17, scope: !83)
!85 = !DILocation(line: 77, column: 21, scope: !73)
!86 = !DILocation(line: 77, column: 13, scope: !73)
!87 = !DILocation(line: 78, column: 13, scope: !73)
!88 = !DILocation(line: 78, column: 31, scope: !73)
!89 = !DILocation(line: 79, column: 20, scope: !73)
!90 = !DILocation(line: 79, column: 18, scope: !73)
!91 = !DILocation(line: 81, column: 5, scope: !74)
!92 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !3, line: 86, type: !8)
!93 = distinct !DILexicalBlock(scope: !94, file: !3, line: 84, column: 9)
!94 = distinct !DILexicalBlock(scope: !70, file: !3, line: 83, column: 5)
!95 = !DILocation(line: 86, column: 23, scope: !93)
!96 = !DILocation(line: 86, column: 47, scope: !93)
!97 = !DILocation(line: 86, column: 36, scope: !93)
!98 = !DILocation(line: 87, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !3, line: 87, column: 17)
!100 = !DILocation(line: 87, column: 28, scope: !99)
!101 = !DILocation(line: 87, column: 17, scope: !93)
!102 = !DILocation(line: 89, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !3, line: 88, column: 13)
!104 = !DILocation(line: 90, column: 17, scope: !103)
!105 = !DILocation(line: 92, column: 21, scope: !93)
!106 = !DILocation(line: 92, column: 13, scope: !93)
!107 = !DILocation(line: 93, column: 13, scope: !93)
!108 = !DILocation(line: 93, column: 31, scope: !93)
!109 = !DILocation(line: 94, column: 20, scope: !93)
!110 = !DILocation(line: 94, column: 18, scope: !93)
!111 = !DILocation(line: 97, column: 16, scope: !65)
!112 = !DILocation(line: 97, column: 5, scope: !65)
!113 = !DILocation(line: 99, column: 10, scope: !65)
!114 = !DILocation(line: 99, column: 5, scope: !65)
!115 = !DILocation(line: 100, column: 1, scope: !65)
