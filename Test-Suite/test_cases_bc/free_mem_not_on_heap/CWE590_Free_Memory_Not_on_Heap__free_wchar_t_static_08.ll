; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_08.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_08_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_08_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  %call = call i32 @staticReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %call1 = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_08_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !32
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_08_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !35
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_08_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !36
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

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_08_good() #0 !dbg !43 {
entry:
  call void @goodG2B1(), !dbg !44
  call void @goodG2B2(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !47 {
entry:
  ret i32 1, !dbg !50
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !51 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !52, metadata !DIExpression()), !dbg !53
  store i32* null, i32** %data, align 8, !dbg !54
  %call = call i32 @staticReturnsFalse(), !dbg !55
  %tobool = icmp ne i32 %call, 0, !dbg !55
  br i1 %tobool, label %if.then, label %if.else, !dbg !57

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !58
  br label %if.end4, !dbg !60

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !61, metadata !DIExpression()), !dbg !64
  %call1 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !65
  %0 = bitcast i8* %call1 to i32*, !dbg !66
  store i32* %0, i32** %dataBuffer, align 8, !dbg !64
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !67
  %cmp = icmp eq i32* %1, null, !dbg !69
  br i1 %cmp, label %if.then2, label %if.end, !dbg !70

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @exit(i32 noundef 1) #6, !dbg !73
  unreachable, !dbg !73

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !75
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !76
  store i32 0, i32* %arrayidx, align 4, !dbg !77
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !78
  store i32* %4, i32** %data, align 8, !dbg !79
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %5 = load i32*, i32** %data, align 8, !dbg !80
  call void @printWLine(i32* noundef %5), !dbg !81
  %6 = load i32*, i32** %data, align 8, !dbg !82
  %7 = bitcast i32* %6 to i8*, !dbg !82
  call void @free(i8* noundef %7) #5, !dbg !83
  ret void, !dbg !84
}

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !85 {
entry:
  ret i32 0, !dbg !86
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32* null, i32** %data, align 8, !dbg !90
  %call = call i32 @staticReturnsTrue(), !dbg !91
  %tobool = icmp ne i32 %call, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.end4, !dbg !93

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !94, metadata !DIExpression()), !dbg !97
  %call1 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !98
  %0 = bitcast i8* %call1 to i32*, !dbg !99
  store i32* %0, i32** %dataBuffer, align 8, !dbg !97
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  %cmp = icmp eq i32* %1, null, !dbg !102
  br i1 %cmp, label %if.then2, label %if.end, !dbg !103

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @exit(i32 noundef 1) #6, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !108
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  store i32* %4, i32** %data, align 8, !dbg !112
  br label %if.end4, !dbg !113

if.end4:                                          ; preds = %if.end, %entry
  %5 = load i32*, i32** %data, align 8, !dbg !114
  call void @printWLine(i32* noundef %5), !dbg !115
  %6 = load i32*, i32** %data, align 8, !dbg !116
  %7 = bitcast i32* %6 to i8*, !dbg !116
  call void @free(i8* noundef %7) #5, !dbg !117
  ret void, !dbg !118
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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 45, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_08_bad", scope: !3, file: !3, line: 37, type: !4, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_08.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "483af988b21e531091d92d94c9677ced")
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
!26 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 39, type: !8)
!27 = !DILocation(line: 39, column: 15, scope: !2)
!28 = !DILocation(line: 40, column: 10, scope: !2)
!29 = !DILocation(line: 41, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !2, file: !3, line: 41, column: 8)
!31 = !DILocation(line: 41, column: 8, scope: !2)
!32 = !DILocation(line: 46, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !3, line: 43, column: 9)
!34 = distinct !DILexicalBlock(scope: !30, file: !3, line: 42, column: 5)
!35 = !DILocation(line: 47, column: 31, scope: !33)
!36 = !DILocation(line: 48, column: 18, scope: !33)
!37 = !DILocation(line: 50, column: 5, scope: !34)
!38 = !DILocation(line: 51, column: 16, scope: !2)
!39 = !DILocation(line: 51, column: 5, scope: !2)
!40 = !DILocation(line: 53, column: 10, scope: !2)
!41 = !DILocation(line: 53, column: 5, scope: !2)
!42 = !DILocation(line: 54, column: 1, scope: !2)
!43 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_08_good", scope: !3, file: !3, line: 115, type: !4, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!44 = !DILocation(line: 117, column: 5, scope: !43)
!45 = !DILocation(line: 118, column: 5, scope: !43)
!46 = !DILocation(line: 119, column: 1, scope: !43)
!47 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !3, file: !3, line: 25, type: !48, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!48 = !DISubroutineType(types: !49)
!49 = !{!11}
!50 = !DILocation(line: 27, column: 5, scope: !47)
!51 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 61, type: !4, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!52 = !DILocalVariable(name: "data", scope: !51, file: !3, line: 63, type: !8)
!53 = !DILocation(line: 63, column: 15, scope: !51)
!54 = !DILocation(line: 64, column: 10, scope: !51)
!55 = !DILocation(line: 65, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !3, line: 65, column: 8)
!57 = !DILocation(line: 65, column: 8, scope: !51)
!58 = !DILocation(line: 68, column: 9, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !3, line: 66, column: 5)
!60 = !DILocation(line: 69, column: 5, scope: !59)
!61 = !DILocalVariable(name: "dataBuffer", scope: !62, file: !3, line: 74, type: !8)
!62 = distinct !DILexicalBlock(scope: !63, file: !3, line: 72, column: 9)
!63 = distinct !DILexicalBlock(scope: !56, file: !3, line: 71, column: 5)
!64 = !DILocation(line: 74, column: 23, scope: !62)
!65 = !DILocation(line: 74, column: 47, scope: !62)
!66 = !DILocation(line: 74, column: 36, scope: !62)
!67 = !DILocation(line: 75, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !62, file: !3, line: 75, column: 17)
!69 = !DILocation(line: 75, column: 28, scope: !68)
!70 = !DILocation(line: 75, column: 17, scope: !62)
!71 = !DILocation(line: 77, column: 17, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !3, line: 76, column: 13)
!73 = !DILocation(line: 78, column: 17, scope: !72)
!74 = !DILocation(line: 80, column: 21, scope: !62)
!75 = !DILocation(line: 80, column: 13, scope: !62)
!76 = !DILocation(line: 81, column: 13, scope: !62)
!77 = !DILocation(line: 81, column: 31, scope: !62)
!78 = !DILocation(line: 82, column: 20, scope: !62)
!79 = !DILocation(line: 82, column: 18, scope: !62)
!80 = !DILocation(line: 85, column: 16, scope: !51)
!81 = !DILocation(line: 85, column: 5, scope: !51)
!82 = !DILocation(line: 87, column: 10, scope: !51)
!83 = !DILocation(line: 87, column: 5, scope: !51)
!84 = !DILocation(line: 88, column: 1, scope: !51)
!85 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !3, file: !3, line: 30, type: !48, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!86 = !DILocation(line: 32, column: 5, scope: !85)
!87 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 91, type: !4, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!88 = !DILocalVariable(name: "data", scope: !87, file: !3, line: 93, type: !8)
!89 = !DILocation(line: 93, column: 15, scope: !87)
!90 = !DILocation(line: 94, column: 10, scope: !87)
!91 = !DILocation(line: 95, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !3, line: 95, column: 8)
!93 = !DILocation(line: 95, column: 8, scope: !87)
!94 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !3, line: 99, type: !8)
!95 = distinct !DILexicalBlock(scope: !96, file: !3, line: 97, column: 9)
!96 = distinct !DILexicalBlock(scope: !92, file: !3, line: 96, column: 5)
!97 = !DILocation(line: 99, column: 23, scope: !95)
!98 = !DILocation(line: 99, column: 47, scope: !95)
!99 = !DILocation(line: 99, column: 36, scope: !95)
!100 = !DILocation(line: 100, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !3, line: 100, column: 17)
!102 = !DILocation(line: 100, column: 28, scope: !101)
!103 = !DILocation(line: 100, column: 17, scope: !95)
!104 = !DILocation(line: 102, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !3, line: 101, column: 13)
!106 = !DILocation(line: 103, column: 17, scope: !105)
!107 = !DILocation(line: 105, column: 21, scope: !95)
!108 = !DILocation(line: 105, column: 13, scope: !95)
!109 = !DILocation(line: 106, column: 13, scope: !95)
!110 = !DILocation(line: 106, column: 31, scope: !95)
!111 = !DILocation(line: 107, column: 20, scope: !95)
!112 = !DILocation(line: 107, column: 18, scope: !95)
!113 = !DILocation(line: 109, column: 5, scope: !96)
!114 = !DILocation(line: 110, column: 16, scope: !87)
!115 = !DILocation(line: 110, column: 5, scope: !87)
!116 = !DILocation(line: 112, column: 10, scope: !87)
!117 = !DILocation(line: 112, column: 5, scope: !87)
!118 = !DILocation(line: 113, column: 1, scope: !87)
