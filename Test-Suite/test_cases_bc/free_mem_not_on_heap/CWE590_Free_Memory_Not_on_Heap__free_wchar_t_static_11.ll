; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_11.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_11_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_11_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  %call = call i32 (...) @globalReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %call1 = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_11_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !32
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_11_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !35
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_11_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  %0 = load i32*, i32** %data, align 8, !dbg !38
  call void @printWLine(i32* noundef %0), !dbg !39
  %1 = load i32*, i32** %data, align 8, !dbg !40
  %2 = bitcast i32* %1 to i8*, !dbg !40
  call void @free(i8* noundef %2) #5, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #3

declare void @printWLine(i32* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_11_good() #0 !dbg !43 {
entry:
  call void @goodG2B1(), !dbg !44
  call void @goodG2B2(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !47 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !48, metadata !DIExpression()), !dbg !49
  store i32* null, i32** %data, align 8, !dbg !50
  %call = call i32 (...) @globalReturnsFalse(), !dbg !51
  %tobool = icmp ne i32 %call, 0, !dbg !51
  br i1 %tobool, label %if.then, label %if.else, !dbg !53

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !54
  br label %if.end4, !dbg !56

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !57, metadata !DIExpression()), !dbg !60
  %call1 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !61
  %0 = bitcast i8* %call1 to i32*, !dbg !62
  store i32* %0, i32** %dataBuffer, align 8, !dbg !60
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !63
  %cmp = icmp eq i32* %1, null, !dbg !65
  br i1 %cmp, label %if.then2, label %if.end, !dbg !66

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @exit(i32 noundef 1) #6, !dbg !69
  unreachable, !dbg !69

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !70
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !71
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !72
  store i32 0, i32* %arrayidx, align 4, !dbg !73
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  store i32* %4, i32** %data, align 8, !dbg !75
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %5 = load i32*, i32** %data, align 8, !dbg !76
  call void @printWLine(i32* noundef %5), !dbg !77
  %6 = load i32*, i32** %data, align 8, !dbg !78
  %7 = bitcast i32* %6 to i8*, !dbg !78
  call void @free(i8* noundef %7) #5, !dbg !79
  ret void, !dbg !80
}

declare i32 @globalReturnsFalse(...) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i32* null, i32** %data, align 8, !dbg !84
  %call = call i32 (...) @globalReturnsTrue(), !dbg !85
  %tobool = icmp ne i32 %call, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.end4, !dbg !87

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !88, metadata !DIExpression()), !dbg !91
  %call1 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !92
  %0 = bitcast i8* %call1 to i32*, !dbg !93
  store i32* %0, i32** %dataBuffer, align 8, !dbg !91
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !94
  %cmp = icmp eq i32* %1, null, !dbg !96
  br i1 %cmp, label %if.then2, label %if.end, !dbg !97

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @exit(i32 noundef 1) #6, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !101
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !102
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !105
  store i32* %4, i32** %data, align 8, !dbg !106
  br label %if.end4, !dbg !107

if.end4:                                          ; preds = %if.end, %entry
  %5 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* noundef %5), !dbg !109
  %6 = load i32*, i32** %data, align 8, !dbg !110
  %7 = bitcast i32* %6 to i8*, !dbg !110
  call void @free(i8* noundef %7) #5, !dbg !111
  ret void, !dbg !112
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
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_11_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_11.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "5dd8203407cda4510c6cbea0920bc908")
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
!38 = !DILocation(line: 37, column: 16, scope: !2)
!39 = !DILocation(line: 37, column: 5, scope: !2)
!40 = !DILocation(line: 39, column: 10, scope: !2)
!41 = !DILocation(line: 39, column: 5, scope: !2)
!42 = !DILocation(line: 40, column: 1, scope: !2)
!43 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_11_good", scope: !3, file: !3, line: 101, type: !4, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!44 = !DILocation(line: 103, column: 5, scope: !43)
!45 = !DILocation(line: 104, column: 5, scope: !43)
!46 = !DILocation(line: 105, column: 1, scope: !43)
!47 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 47, type: !4, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!48 = !DILocalVariable(name: "data", scope: !47, file: !3, line: 49, type: !8)
!49 = !DILocation(line: 49, column: 15, scope: !47)
!50 = !DILocation(line: 50, column: 10, scope: !47)
!51 = !DILocation(line: 51, column: 8, scope: !52)
!52 = distinct !DILexicalBlock(scope: !47, file: !3, line: 51, column: 8)
!53 = !DILocation(line: 51, column: 8, scope: !47)
!54 = !DILocation(line: 54, column: 9, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !3, line: 52, column: 5)
!56 = !DILocation(line: 55, column: 5, scope: !55)
!57 = !DILocalVariable(name: "dataBuffer", scope: !58, file: !3, line: 60, type: !8)
!58 = distinct !DILexicalBlock(scope: !59, file: !3, line: 58, column: 9)
!59 = distinct !DILexicalBlock(scope: !52, file: !3, line: 57, column: 5)
!60 = !DILocation(line: 60, column: 23, scope: !58)
!61 = !DILocation(line: 60, column: 47, scope: !58)
!62 = !DILocation(line: 60, column: 36, scope: !58)
!63 = !DILocation(line: 61, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !3, line: 61, column: 17)
!65 = !DILocation(line: 61, column: 28, scope: !64)
!66 = !DILocation(line: 61, column: 17, scope: !58)
!67 = !DILocation(line: 63, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !3, line: 62, column: 13)
!69 = !DILocation(line: 64, column: 17, scope: !68)
!70 = !DILocation(line: 66, column: 21, scope: !58)
!71 = !DILocation(line: 66, column: 13, scope: !58)
!72 = !DILocation(line: 67, column: 13, scope: !58)
!73 = !DILocation(line: 67, column: 31, scope: !58)
!74 = !DILocation(line: 68, column: 20, scope: !58)
!75 = !DILocation(line: 68, column: 18, scope: !58)
!76 = !DILocation(line: 71, column: 16, scope: !47)
!77 = !DILocation(line: 71, column: 5, scope: !47)
!78 = !DILocation(line: 73, column: 10, scope: !47)
!79 = !DILocation(line: 73, column: 5, scope: !47)
!80 = !DILocation(line: 74, column: 1, scope: !47)
!81 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 77, type: !4, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!82 = !DILocalVariable(name: "data", scope: !81, file: !3, line: 79, type: !8)
!83 = !DILocation(line: 79, column: 15, scope: !81)
!84 = !DILocation(line: 80, column: 10, scope: !81)
!85 = !DILocation(line: 81, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !3, line: 81, column: 8)
!87 = !DILocation(line: 81, column: 8, scope: !81)
!88 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !3, line: 85, type: !8)
!89 = distinct !DILexicalBlock(scope: !90, file: !3, line: 83, column: 9)
!90 = distinct !DILexicalBlock(scope: !86, file: !3, line: 82, column: 5)
!91 = !DILocation(line: 85, column: 23, scope: !89)
!92 = !DILocation(line: 85, column: 47, scope: !89)
!93 = !DILocation(line: 85, column: 36, scope: !89)
!94 = !DILocation(line: 86, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !3, line: 86, column: 17)
!96 = !DILocation(line: 86, column: 28, scope: !95)
!97 = !DILocation(line: 86, column: 17, scope: !89)
!98 = !DILocation(line: 88, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !3, line: 87, column: 13)
!100 = !DILocation(line: 89, column: 17, scope: !99)
!101 = !DILocation(line: 91, column: 21, scope: !89)
!102 = !DILocation(line: 91, column: 13, scope: !89)
!103 = !DILocation(line: 92, column: 13, scope: !89)
!104 = !DILocation(line: 92, column: 31, scope: !89)
!105 = !DILocation(line: 93, column: 20, scope: !89)
!106 = !DILocation(line: 93, column: 18, scope: !89)
!107 = !DILocation(line: 95, column: 5, scope: !90)
!108 = !DILocation(line: 96, column: 16, scope: !81)
!109 = !DILocation(line: 96, column: 5, scope: !81)
!110 = !DILocation(line: 98, column: 10, scope: !81)
!111 = !DILocation(line: 98, column: 5, scope: !81)
!112 = !DILocation(line: 99, column: 1, scope: !81)
