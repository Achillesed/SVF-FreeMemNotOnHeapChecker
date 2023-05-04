; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_14.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_14_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @globalFive, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !30
  %1 = alloca i8, i64 400, align 16, !dbg !31
  %2 = bitcast i8* %1 to i32*, !dbg !32
  store i32* %2, i32** %dataBuffer, align 8, !dbg !30
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !34
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !37
  store i32* %5, i32** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32*, i32** %data, align 8, !dbg !40
  call void @printWLine(i32* noundef %6), !dbg !41
  %7 = load i32*, i32** %data, align 8, !dbg !42
  %8 = bitcast i32* %7 to i8*, !dbg !42
  call void @free(i8* noundef %8) #5, !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_14_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !49 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !50, metadata !DIExpression()), !dbg !51
  store i32* null, i32** %data, align 8, !dbg !52
  %0 = load i32, i32* @globalFive, align 4, !dbg !53
  %cmp = icmp ne i32 %0, 5, !dbg !55
  br i1 %cmp, label %if.then, label %if.else, !dbg !56

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !57
  br label %if.end4, !dbg !59

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !60, metadata !DIExpression()), !dbg !63
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !64
  %1 = bitcast i8* %call to i32*, !dbg !65
  store i32* %1, i32** %dataBuffer, align 8, !dbg !63
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !66
  %cmp1 = icmp eq i32* %2, null, !dbg !68
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !69

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @exit(i32 noundef 1) #6, !dbg !72
  unreachable, !dbg !72

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !73
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !74
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !75
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !75
  store i32 0, i32* %arrayidx, align 4, !dbg !76
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !77
  store i32* %5, i32** %data, align 8, !dbg !78
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %6 = load i32*, i32** %data, align 8, !dbg !79
  call void @printWLine(i32* noundef %6), !dbg !80
  %7 = load i32*, i32** %data, align 8, !dbg !81
  %8 = bitcast i32* %7 to i8*, !dbg !81
  call void @free(i8* noundef %8) #5, !dbg !82
  ret void, !dbg !83
}

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i32* null, i32** %data, align 8, !dbg !87
  %0 = load i32, i32* @globalFive, align 4, !dbg !88
  %cmp = icmp eq i32 %0, 5, !dbg !90
  br i1 %cmp, label %if.then, label %if.end4, !dbg !91

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !95
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !96
  %1 = bitcast i8* %call to i32*, !dbg !97
  store i32* %1, i32** %dataBuffer, align 8, !dbg !95
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !98
  %cmp1 = icmp eq i32* %2, null, !dbg !100
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !101

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @exit(i32 noundef 1) #6, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !105
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !106
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  store i32* %5, i32** %data, align 8, !dbg !110
  br label %if.end4, !dbg !111

if.end4:                                          ; preds = %if.end, %entry
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_14.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "e32b02586d2f3d0b0826f934590a60a3")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_14_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 25, type: !3)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !1, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 18, scope: !24)
!26 = !DILocation(line: 27, column: 8, scope: !16)
!27 = !DILocalVariable(name: "dataBuffer", scope: !28, file: !1, line: 31, type: !3)
!28 = distinct !DILexicalBlock(scope: !29, file: !1, line: 29, column: 9)
!29 = distinct !DILexicalBlock(scope: !24, file: !1, line: 28, column: 5)
!30 = !DILocation(line: 31, column: 23, scope: !28)
!31 = !DILocation(line: 31, column: 47, scope: !28)
!32 = !DILocation(line: 31, column: 36, scope: !28)
!33 = !DILocation(line: 32, column: 21, scope: !28)
!34 = !DILocation(line: 32, column: 13, scope: !28)
!35 = !DILocation(line: 33, column: 13, scope: !28)
!36 = !DILocation(line: 33, column: 31, scope: !28)
!37 = !DILocation(line: 34, column: 20, scope: !28)
!38 = !DILocation(line: 34, column: 18, scope: !28)
!39 = !DILocation(line: 36, column: 5, scope: !29)
!40 = !DILocation(line: 37, column: 16, scope: !16)
!41 = !DILocation(line: 37, column: 5, scope: !16)
!42 = !DILocation(line: 39, column: 10, scope: !16)
!43 = !DILocation(line: 39, column: 5, scope: !16)
!44 = !DILocation(line: 40, column: 1, scope: !16)
!45 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_14_good", scope: !1, file: !1, line: 101, type: !17, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!46 = !DILocation(line: 103, column: 5, scope: !45)
!47 = !DILocation(line: 104, column: 5, scope: !45)
!48 = !DILocation(line: 105, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 47, type: !17, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!50 = !DILocalVariable(name: "data", scope: !49, file: !1, line: 49, type: !3)
!51 = !DILocation(line: 49, column: 15, scope: !49)
!52 = !DILocation(line: 50, column: 10, scope: !49)
!53 = !DILocation(line: 51, column: 8, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !1, line: 51, column: 8)
!55 = !DILocation(line: 51, column: 18, scope: !54)
!56 = !DILocation(line: 51, column: 8, scope: !49)
!57 = !DILocation(line: 54, column: 9, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !1, line: 52, column: 5)
!59 = !DILocation(line: 55, column: 5, scope: !58)
!60 = !DILocalVariable(name: "dataBuffer", scope: !61, file: !1, line: 60, type: !3)
!61 = distinct !DILexicalBlock(scope: !62, file: !1, line: 58, column: 9)
!62 = distinct !DILexicalBlock(scope: !54, file: !1, line: 57, column: 5)
!63 = !DILocation(line: 60, column: 23, scope: !61)
!64 = !DILocation(line: 60, column: 47, scope: !61)
!65 = !DILocation(line: 60, column: 36, scope: !61)
!66 = !DILocation(line: 61, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !61, file: !1, line: 61, column: 17)
!68 = !DILocation(line: 61, column: 28, scope: !67)
!69 = !DILocation(line: 61, column: 17, scope: !61)
!70 = !DILocation(line: 63, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !1, line: 62, column: 13)
!72 = !DILocation(line: 64, column: 17, scope: !71)
!73 = !DILocation(line: 66, column: 21, scope: !61)
!74 = !DILocation(line: 66, column: 13, scope: !61)
!75 = !DILocation(line: 67, column: 13, scope: !61)
!76 = !DILocation(line: 67, column: 31, scope: !61)
!77 = !DILocation(line: 68, column: 20, scope: !61)
!78 = !DILocation(line: 68, column: 18, scope: !61)
!79 = !DILocation(line: 71, column: 16, scope: !49)
!80 = !DILocation(line: 71, column: 5, scope: !49)
!81 = !DILocation(line: 73, column: 10, scope: !49)
!82 = !DILocation(line: 73, column: 5, scope: !49)
!83 = !DILocation(line: 74, column: 1, scope: !49)
!84 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 77, type: !17, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!85 = !DILocalVariable(name: "data", scope: !84, file: !1, line: 79, type: !3)
!86 = !DILocation(line: 79, column: 15, scope: !84)
!87 = !DILocation(line: 80, column: 10, scope: !84)
!88 = !DILocation(line: 81, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !1, line: 81, column: 8)
!90 = !DILocation(line: 81, column: 18, scope: !89)
!91 = !DILocation(line: 81, column: 8, scope: !84)
!92 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !1, line: 85, type: !3)
!93 = distinct !DILexicalBlock(scope: !94, file: !1, line: 83, column: 9)
!94 = distinct !DILexicalBlock(scope: !89, file: !1, line: 82, column: 5)
!95 = !DILocation(line: 85, column: 23, scope: !93)
!96 = !DILocation(line: 85, column: 47, scope: !93)
!97 = !DILocation(line: 85, column: 36, scope: !93)
!98 = !DILocation(line: 86, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !1, line: 86, column: 17)
!100 = !DILocation(line: 86, column: 28, scope: !99)
!101 = !DILocation(line: 86, column: 17, scope: !93)
!102 = !DILocation(line: 88, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !1, line: 87, column: 13)
!104 = !DILocation(line: 89, column: 17, scope: !103)
!105 = !DILocation(line: 91, column: 21, scope: !93)
!106 = !DILocation(line: 91, column: 13, scope: !93)
!107 = !DILocation(line: 92, column: 13, scope: !93)
!108 = !DILocation(line: 92, column: 31, scope: !93)
!109 = !DILocation(line: 93, column: 20, scope: !93)
!110 = !DILocation(line: 93, column: 18, scope: !93)
!111 = !DILocation(line: 95, column: 5, scope: !94)
!112 = !DILocation(line: 96, column: 16, scope: !84)
!113 = !DILocation(line: 96, column: 5, scope: !84)
!114 = !DILocation(line: 98, column: 10, scope: !84)
!115 = !DILocation(line: 98, column: 5, scope: !84)
!116 = !DILocation(line: 99, column: 1, scope: !84)
