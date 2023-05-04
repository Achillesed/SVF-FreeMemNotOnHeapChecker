; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_12.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_12_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataBuffer2 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.else, !dbg !25

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !33
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  store i32* %4, i32** %data, align 8, !dbg !37
  br label %if.end7, !dbg !38

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer2, metadata !39, metadata !DIExpression()), !dbg !42
  %call3 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !43
  %5 = bitcast i8* %call3 to i32*, !dbg !44
  store i32* %5, i32** %dataBuffer2, align 8, !dbg !42
  %6 = load i32*, i32** %dataBuffer2, align 8, !dbg !45
  %cmp = icmp eq i32* %6, null, !dbg !47
  br i1 %cmp, label %if.then4, label %if.end, !dbg !48

if.then4:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !49
  call void @exit(i32 noundef 1) #6, !dbg !51
  unreachable, !dbg !51

if.end:                                           ; preds = %if.else
  %7 = load i32*, i32** %dataBuffer2, align 8, !dbg !52
  %call5 = call i32* @wmemset(i32* noundef %7, i32 noundef 65, i64 noundef 99) #5, !dbg !53
  %8 = load i32*, i32** %dataBuffer2, align 8, !dbg !54
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !54
  store i32 0, i32* %arrayidx6, align 4, !dbg !55
  %9 = load i32*, i32** %dataBuffer2, align 8, !dbg !56
  store i32* %9, i32** %data, align 8, !dbg !57
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  %10 = load i32*, i32** %data, align 8, !dbg !58
  call void @printWLine(i32* noundef %10), !dbg !59
  %11 = load i32*, i32** %data, align 8, !dbg !60
  %12 = bitcast i32* %11 to i8*, !dbg !60
  call void @free(i8* noundef %12) #5, !dbg !61
  ret void, !dbg !62
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_12_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataBuffer4 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  store i32* null, i32** %data, align 8, !dbg !69
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !70
  %tobool = icmp ne i32 %call, 0, !dbg !70
  br i1 %tobool, label %if.then, label %if.else, !dbg !72

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !73, metadata !DIExpression()), !dbg !76
  %call1 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !77
  %0 = bitcast i8* %call1 to i32*, !dbg !78
  store i32* %0, i32** %dataBuffer, align 8, !dbg !76
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !79
  %cmp = icmp eq i32* %1, null, !dbg !81
  br i1 %cmp, label %if.then2, label %if.end, !dbg !82

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @exit(i32 noundef 1) #6, !dbg !85
  unreachable, !dbg !85

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !87
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !90
  store i32* %4, i32** %data, align 8, !dbg !91
  br label %if.end11, !dbg !92

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer4, metadata !93, metadata !DIExpression()), !dbg !96
  %call5 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !97
  %5 = bitcast i8* %call5 to i32*, !dbg !98
  store i32* %5, i32** %dataBuffer4, align 8, !dbg !96
  %6 = load i32*, i32** %dataBuffer4, align 8, !dbg !99
  %cmp6 = icmp eq i32* %6, null, !dbg !101
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !102

if.then7:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @exit(i32 noundef 1) #6, !dbg !105
  unreachable, !dbg !105

if.end8:                                          ; preds = %if.else
  %7 = load i32*, i32** %dataBuffer4, align 8, !dbg !106
  %call9 = call i32* @wmemset(i32* noundef %7, i32 noundef 65, i64 noundef 99) #5, !dbg !107
  %8 = load i32*, i32** %dataBuffer4, align 8, !dbg !108
  %arrayidx10 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !108
  store i32 0, i32* %arrayidx10, align 4, !dbg !109
  %9 = load i32*, i32** %dataBuffer4, align 8, !dbg !110
  store i32* %9, i32** %data, align 8, !dbg !111
  br label %if.end11

if.end11:                                         ; preds = %if.end8, %if.end
  %10 = load i32*, i32** %data, align 8, !dbg !112
  call void @printWLine(i32* noundef %10), !dbg !113
  %11 = load i32*, i32** %data, align 8, !dbg !114
  %12 = bitcast i32* %11 to i8*, !dbg !114
  call void @free(i8* noundef %12) #5, !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_12.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "bed9a420c48a36210ac4a58548a04400")
!2 = !{!3, !7}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 74, baseType: !6)
!5 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 5}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{i32 7, !"PIE Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_12_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 25, type: !3)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !1, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 8, scope: !16)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !1, line: 31, type: !3)
!27 = distinct !DILexicalBlock(scope: !28, file: !1, line: 29, column: 9)
!28 = distinct !DILexicalBlock(scope: !24, file: !1, line: 28, column: 5)
!29 = !DILocation(line: 31, column: 23, scope: !27)
!30 = !DILocation(line: 31, column: 47, scope: !27)
!31 = !DILocation(line: 31, column: 36, scope: !27)
!32 = !DILocation(line: 32, column: 21, scope: !27)
!33 = !DILocation(line: 32, column: 13, scope: !27)
!34 = !DILocation(line: 33, column: 13, scope: !27)
!35 = !DILocation(line: 33, column: 31, scope: !27)
!36 = !DILocation(line: 34, column: 20, scope: !27)
!37 = !DILocation(line: 34, column: 18, scope: !27)
!38 = !DILocation(line: 36, column: 5, scope: !28)
!39 = !DILocalVariable(name: "dataBuffer", scope: !40, file: !1, line: 41, type: !3)
!40 = distinct !DILexicalBlock(scope: !41, file: !1, line: 39, column: 9)
!41 = distinct !DILexicalBlock(scope: !24, file: !1, line: 38, column: 5)
!42 = !DILocation(line: 41, column: 23, scope: !40)
!43 = !DILocation(line: 41, column: 47, scope: !40)
!44 = !DILocation(line: 41, column: 36, scope: !40)
!45 = !DILocation(line: 42, column: 17, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !1, line: 42, column: 17)
!47 = !DILocation(line: 42, column: 28, scope: !46)
!48 = !DILocation(line: 42, column: 17, scope: !40)
!49 = !DILocation(line: 44, column: 17, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 43, column: 13)
!51 = !DILocation(line: 45, column: 17, scope: !50)
!52 = !DILocation(line: 47, column: 21, scope: !40)
!53 = !DILocation(line: 47, column: 13, scope: !40)
!54 = !DILocation(line: 48, column: 13, scope: !40)
!55 = !DILocation(line: 48, column: 31, scope: !40)
!56 = !DILocation(line: 49, column: 20, scope: !40)
!57 = !DILocation(line: 49, column: 18, scope: !40)
!58 = !DILocation(line: 52, column: 16, scope: !16)
!59 = !DILocation(line: 52, column: 5, scope: !16)
!60 = !DILocation(line: 54, column: 10, scope: !16)
!61 = !DILocation(line: 54, column: 5, scope: !16)
!62 = !DILocation(line: 55, column: 1, scope: !16)
!63 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_12_good", scope: !1, file: !1, line: 102, type: !17, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!64 = !DILocation(line: 104, column: 5, scope: !63)
!65 = !DILocation(line: 105, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 63, type: !17, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!67 = !DILocalVariable(name: "data", scope: !66, file: !1, line: 65, type: !3)
!68 = !DILocation(line: 65, column: 15, scope: !66)
!69 = !DILocation(line: 66, column: 10, scope: !66)
!70 = !DILocation(line: 67, column: 8, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !1, line: 67, column: 8)
!72 = !DILocation(line: 67, column: 8, scope: !66)
!73 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !1, line: 71, type: !3)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 69, column: 9)
!75 = distinct !DILexicalBlock(scope: !71, file: !1, line: 68, column: 5)
!76 = !DILocation(line: 71, column: 23, scope: !74)
!77 = !DILocation(line: 71, column: 47, scope: !74)
!78 = !DILocation(line: 71, column: 36, scope: !74)
!79 = !DILocation(line: 72, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !74, file: !1, line: 72, column: 17)
!81 = !DILocation(line: 72, column: 28, scope: !80)
!82 = !DILocation(line: 72, column: 17, scope: !74)
!83 = !DILocation(line: 74, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !1, line: 73, column: 13)
!85 = !DILocation(line: 75, column: 17, scope: !84)
!86 = !DILocation(line: 77, column: 21, scope: !74)
!87 = !DILocation(line: 77, column: 13, scope: !74)
!88 = !DILocation(line: 78, column: 13, scope: !74)
!89 = !DILocation(line: 78, column: 31, scope: !74)
!90 = !DILocation(line: 79, column: 20, scope: !74)
!91 = !DILocation(line: 79, column: 18, scope: !74)
!92 = !DILocation(line: 81, column: 5, scope: !75)
!93 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !1, line: 86, type: !3)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 84, column: 9)
!95 = distinct !DILexicalBlock(scope: !71, file: !1, line: 83, column: 5)
!96 = !DILocation(line: 86, column: 23, scope: !94)
!97 = !DILocation(line: 86, column: 47, scope: !94)
!98 = !DILocation(line: 86, column: 36, scope: !94)
!99 = !DILocation(line: 87, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !1, line: 87, column: 17)
!101 = !DILocation(line: 87, column: 28, scope: !100)
!102 = !DILocation(line: 87, column: 17, scope: !94)
!103 = !DILocation(line: 89, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !1, line: 88, column: 13)
!105 = !DILocation(line: 90, column: 17, scope: !104)
!106 = !DILocation(line: 92, column: 21, scope: !94)
!107 = !DILocation(line: 92, column: 13, scope: !94)
!108 = !DILocation(line: 93, column: 13, scope: !94)
!109 = !DILocation(line: 93, column: 31, scope: !94)
!110 = !DILocation(line: 94, column: 20, scope: !94)
!111 = !DILocation(line: 94, column: 18, scope: !94)
!112 = !DILocation(line: 97, column: 16, scope: !66)
!113 = !DILocation(line: 97, column: 5, scope: !66)
!114 = !DILocation(line: 99, column: 10, scope: !66)
!115 = !DILocation(line: 99, column: 5, scope: !66)
!116 = !DILocation(line: 100, column: 1, scope: !66)
