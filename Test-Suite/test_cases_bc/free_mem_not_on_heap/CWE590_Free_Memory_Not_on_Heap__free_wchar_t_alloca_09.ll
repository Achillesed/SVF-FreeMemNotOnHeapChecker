; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_09.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@GLOBAL_CONST_TRUE = external constant i32, align 4
@GLOBAL_CONST_FALSE = external constant i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_09_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !23
  %tobool = icmp ne i32 %0, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 400, align 16, !dbg !30
  %2 = bitcast i8* %1 to i32*, !dbg !31
  store i32* %2, i32** %dataBuffer, align 8, !dbg !29
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !33
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  store i32* %5, i32** %data, align 8, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32*, i32** %data, align 8, !dbg !39
  call void @printWLine(i32* noundef %6), !dbg !40
  %7 = load i32*, i32** %data, align 8, !dbg !41
  %8 = bitcast i32* %7 to i8*, !dbg !41
  call void @free(i8* noundef %8) #5, !dbg !42
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_09_good() #0 !dbg !44 {
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
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !52
  %tobool = icmp ne i32 %0, 0, !dbg !52
  br i1 %tobool, label %if.then, label %if.else, !dbg !54

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !55
  br label %if.end3, !dbg !57

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !58, metadata !DIExpression()), !dbg !61
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !62
  %1 = bitcast i8* %call to i32*, !dbg !63
  store i32* %1, i32** %dataBuffer, align 8, !dbg !61
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !64
  %cmp = icmp eq i32* %2, null, !dbg !66
  br i1 %cmp, label %if.then1, label %if.end, !dbg !67

if.then1:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @exit(i32 noundef 1) #6, !dbg !70
  unreachable, !dbg !70

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !71
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !72
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !73
  store i32 0, i32* %arrayidx, align 4, !dbg !74
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !75
  store i32* %5, i32** %data, align 8, !dbg !76
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %6 = load i32*, i32** %data, align 8, !dbg !77
  call void @printWLine(i32* noundef %6), !dbg !78
  %7 = load i32*, i32** %data, align 8, !dbg !79
  %8 = bitcast i32* %7 to i8*, !dbg !79
  call void @free(i8* noundef %8) #5, !dbg !80
  ret void, !dbg !81
}

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32* null, i32** %data, align 8, !dbg !85
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !86
  %tobool = icmp ne i32 %0, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.end3, !dbg !88

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !89, metadata !DIExpression()), !dbg !92
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !93
  %1 = bitcast i8* %call to i32*, !dbg !94
  store i32* %1, i32** %dataBuffer, align 8, !dbg !92
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !95
  %cmp = icmp eq i32* %2, null, !dbg !97
  br i1 %cmp, label %if.then1, label %if.end, !dbg !98

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @exit(i32 noundef 1) #6, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !103
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !106
  store i32* %5, i32** %data, align 8, !dbg !107
  br label %if.end3, !dbg !108

if.end3:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data, align 8, !dbg !109
  call void @printWLine(i32* noundef %6), !dbg !110
  %7 = load i32*, i32** %data, align 8, !dbg !111
  %8 = bitcast i32* %7 to i8*, !dbg !111
  call void @free(i8* noundef %8) #5, !dbg !112
  ret void, !dbg !113
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_09.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "65addaca515de0b5503d6e3d27d8fb43")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_09_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
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
!39 = !DILocation(line: 37, column: 16, scope: !16)
!40 = !DILocation(line: 37, column: 5, scope: !16)
!41 = !DILocation(line: 39, column: 10, scope: !16)
!42 = !DILocation(line: 39, column: 5, scope: !16)
!43 = !DILocation(line: 40, column: 1, scope: !16)
!44 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_09_good", scope: !1, file: !1, line: 101, type: !17, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!45 = !DILocation(line: 103, column: 5, scope: !44)
!46 = !DILocation(line: 104, column: 5, scope: !44)
!47 = !DILocation(line: 105, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 47, type: !17, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!49 = !DILocalVariable(name: "data", scope: !48, file: !1, line: 49, type: !3)
!50 = !DILocation(line: 49, column: 15, scope: !48)
!51 = !DILocation(line: 50, column: 10, scope: !48)
!52 = !DILocation(line: 51, column: 8, scope: !53)
!53 = distinct !DILexicalBlock(scope: !48, file: !1, line: 51, column: 8)
!54 = !DILocation(line: 51, column: 8, scope: !48)
!55 = !DILocation(line: 54, column: 9, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !1, line: 52, column: 5)
!57 = !DILocation(line: 55, column: 5, scope: !56)
!58 = !DILocalVariable(name: "dataBuffer", scope: !59, file: !1, line: 60, type: !3)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 58, column: 9)
!60 = distinct !DILexicalBlock(scope: !53, file: !1, line: 57, column: 5)
!61 = !DILocation(line: 60, column: 23, scope: !59)
!62 = !DILocation(line: 60, column: 47, scope: !59)
!63 = !DILocation(line: 60, column: 36, scope: !59)
!64 = !DILocation(line: 61, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !1, line: 61, column: 17)
!66 = !DILocation(line: 61, column: 28, scope: !65)
!67 = !DILocation(line: 61, column: 17, scope: !59)
!68 = !DILocation(line: 63, column: 17, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !1, line: 62, column: 13)
!70 = !DILocation(line: 64, column: 17, scope: !69)
!71 = !DILocation(line: 66, column: 21, scope: !59)
!72 = !DILocation(line: 66, column: 13, scope: !59)
!73 = !DILocation(line: 67, column: 13, scope: !59)
!74 = !DILocation(line: 67, column: 31, scope: !59)
!75 = !DILocation(line: 68, column: 20, scope: !59)
!76 = !DILocation(line: 68, column: 18, scope: !59)
!77 = !DILocation(line: 71, column: 16, scope: !48)
!78 = !DILocation(line: 71, column: 5, scope: !48)
!79 = !DILocation(line: 73, column: 10, scope: !48)
!80 = !DILocation(line: 73, column: 5, scope: !48)
!81 = !DILocation(line: 74, column: 1, scope: !48)
!82 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 77, type: !17, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!83 = !DILocalVariable(name: "data", scope: !82, file: !1, line: 79, type: !3)
!84 = !DILocation(line: 79, column: 15, scope: !82)
!85 = !DILocation(line: 80, column: 10, scope: !82)
!86 = !DILocation(line: 81, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !1, line: 81, column: 8)
!88 = !DILocation(line: 81, column: 8, scope: !82)
!89 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !1, line: 85, type: !3)
!90 = distinct !DILexicalBlock(scope: !91, file: !1, line: 83, column: 9)
!91 = distinct !DILexicalBlock(scope: !87, file: !1, line: 82, column: 5)
!92 = !DILocation(line: 85, column: 23, scope: !90)
!93 = !DILocation(line: 85, column: 47, scope: !90)
!94 = !DILocation(line: 85, column: 36, scope: !90)
!95 = !DILocation(line: 86, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !1, line: 86, column: 17)
!97 = !DILocation(line: 86, column: 28, scope: !96)
!98 = !DILocation(line: 86, column: 17, scope: !90)
!99 = !DILocation(line: 88, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !1, line: 87, column: 13)
!101 = !DILocation(line: 89, column: 17, scope: !100)
!102 = !DILocation(line: 91, column: 21, scope: !90)
!103 = !DILocation(line: 91, column: 13, scope: !90)
!104 = !DILocation(line: 92, column: 13, scope: !90)
!105 = !DILocation(line: 92, column: 31, scope: !90)
!106 = !DILocation(line: 93, column: 20, scope: !90)
!107 = !DILocation(line: 93, column: 18, scope: !90)
!108 = !DILocation(line: 95, column: 5, scope: !91)
!109 = !DILocation(line: 96, column: 16, scope: !82)
!110 = !DILocation(line: 96, column: 5, scope: !82)
!111 = !DILocation(line: 98, column: 10, scope: !82)
!112 = !DILocation(line: 98, column: 5, scope: !82)
!113 = !DILocation(line: 99, column: 1, scope: !82)
