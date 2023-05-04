; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_07.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %0 = load i32, i32* @staticFive, align 4, !dbg !26
  %cmp = icmp eq i32 %0, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !37
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 99) #5, !dbg !38
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !41
  store i32* %arraydecay1, i32** %data, align 8, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* noundef %1), !dbg !45
  %2 = load i32*, i32** %data, align 8, !dbg !46
  %3 = bitcast i32* %2 to i8*, !dbg !46
  call void @free(i8* noundef %3) #5, !dbg !47
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_07_good() #0 !dbg !49 {
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !57
  %cmp = icmp ne i32 %0, 5, !dbg !59
  br i1 %cmp, label %if.then, label %if.else, !dbg !60

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !61
  br label %if.end4, !dbg !63

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !64, metadata !DIExpression()), !dbg !67
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !68
  %1 = bitcast i8* %call to i32*, !dbg !69
  store i32* %1, i32** %dataBuffer, align 8, !dbg !67
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !70
  %cmp1 = icmp eq i32* %2, null, !dbg !72
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !73

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @exit(i32 noundef 1) #6, !dbg !76
  unreachable, !dbg !76

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !77
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !78
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !79
  store i32 0, i32* %arrayidx, align 4, !dbg !80
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !81
  store i32* %5, i32** %data, align 8, !dbg !82
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %6 = load i32*, i32** %data, align 8, !dbg !83
  call void @printWLine(i32* noundef %6), !dbg !84
  %7 = load i32*, i32** %data, align 8, !dbg !85
  %8 = bitcast i32* %7 to i8*, !dbg !85
  call void @free(i8* noundef %8) #5, !dbg !86
  ret void, !dbg !87
}

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32* null, i32** %data, align 8, !dbg !91
  %0 = load i32, i32* @staticFive, align 4, !dbg !92
  %cmp = icmp eq i32 %0, 5, !dbg !94
  br i1 %cmp, label %if.then, label %if.end4, !dbg !95

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !99
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !100
  %1 = bitcast i8* %call to i32*, !dbg !101
  store i32* %1, i32** %dataBuffer, align 8, !dbg !99
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %cmp1 = icmp eq i32* %2, null, !dbg !104
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !105

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @exit(i32 noundef 1) #6, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !110
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  store i32* %5, i32** %data, align 8, !dbg !114
  br label %if.end4, !dbg !115

if.end4:                                          ; preds = %if.end, %entry
  %6 = load i32*, i32** %data, align 8, !dbg !116
  call void @printWLine(i32* noundef %6), !dbg !117
  %7 = load i32*, i32** %data, align 8, !dbg !118
  %8 = bitcast i32* %7 to i8*, !dbg !118
  call void @free(i8* noundef %8) #5, !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !3, line: 25, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_07.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "6162a30f8c3a4f900a8cedb93670bced")
!4 = !{!5, !9}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0}
!11 = !{i32 7, !"Dwarf Version", i32 5}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"PIE Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!19 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_07_bad", scope: !3, file: !3, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !3, line: 31, type: !5)
!24 = !DILocation(line: 31, column: 15, scope: !19)
!25 = !DILocation(line: 32, column: 10, scope: !19)
!26 = !DILocation(line: 33, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !19, file: !3, line: 33, column: 8)
!28 = !DILocation(line: 33, column: 18, scope: !27)
!29 = !DILocation(line: 33, column: 8, scope: !19)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !3, line: 37, type: !33)
!31 = distinct !DILexicalBlock(scope: !32, file: !3, line: 35, column: 9)
!32 = distinct !DILexicalBlock(scope: !27, file: !3, line: 34, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 37, column: 21, scope: !31)
!37 = !DILocation(line: 38, column: 21, scope: !31)
!38 = !DILocation(line: 38, column: 13, scope: !31)
!39 = !DILocation(line: 39, column: 13, scope: !31)
!40 = !DILocation(line: 39, column: 31, scope: !31)
!41 = !DILocation(line: 40, column: 20, scope: !31)
!42 = !DILocation(line: 40, column: 18, scope: !31)
!43 = !DILocation(line: 42, column: 5, scope: !32)
!44 = !DILocation(line: 43, column: 16, scope: !19)
!45 = !DILocation(line: 43, column: 5, scope: !19)
!46 = !DILocation(line: 45, column: 10, scope: !19)
!47 = !DILocation(line: 45, column: 5, scope: !19)
!48 = !DILocation(line: 46, column: 1, scope: !19)
!49 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_07_good", scope: !3, file: !3, line: 107, type: !20, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!50 = !DILocation(line: 109, column: 5, scope: !49)
!51 = !DILocation(line: 110, column: 5, scope: !49)
!52 = !DILocation(line: 111, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 53, type: !20, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!54 = !DILocalVariable(name: "data", scope: !53, file: !3, line: 55, type: !5)
!55 = !DILocation(line: 55, column: 15, scope: !53)
!56 = !DILocation(line: 56, column: 10, scope: !53)
!57 = !DILocation(line: 57, column: 8, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !3, line: 57, column: 8)
!59 = !DILocation(line: 57, column: 18, scope: !58)
!60 = !DILocation(line: 57, column: 8, scope: !53)
!61 = !DILocation(line: 60, column: 9, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !3, line: 58, column: 5)
!63 = !DILocation(line: 61, column: 5, scope: !62)
!64 = !DILocalVariable(name: "dataBuffer", scope: !65, file: !3, line: 66, type: !5)
!65 = distinct !DILexicalBlock(scope: !66, file: !3, line: 64, column: 9)
!66 = distinct !DILexicalBlock(scope: !58, file: !3, line: 63, column: 5)
!67 = !DILocation(line: 66, column: 23, scope: !65)
!68 = !DILocation(line: 66, column: 47, scope: !65)
!69 = !DILocation(line: 66, column: 36, scope: !65)
!70 = !DILocation(line: 67, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !65, file: !3, line: 67, column: 17)
!72 = !DILocation(line: 67, column: 28, scope: !71)
!73 = !DILocation(line: 67, column: 17, scope: !65)
!74 = !DILocation(line: 69, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !3, line: 68, column: 13)
!76 = !DILocation(line: 70, column: 17, scope: !75)
!77 = !DILocation(line: 72, column: 21, scope: !65)
!78 = !DILocation(line: 72, column: 13, scope: !65)
!79 = !DILocation(line: 73, column: 13, scope: !65)
!80 = !DILocation(line: 73, column: 31, scope: !65)
!81 = !DILocation(line: 74, column: 20, scope: !65)
!82 = !DILocation(line: 74, column: 18, scope: !65)
!83 = !DILocation(line: 77, column: 16, scope: !53)
!84 = !DILocation(line: 77, column: 5, scope: !53)
!85 = !DILocation(line: 79, column: 10, scope: !53)
!86 = !DILocation(line: 79, column: 5, scope: !53)
!87 = !DILocation(line: 80, column: 1, scope: !53)
!88 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 83, type: !20, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!89 = !DILocalVariable(name: "data", scope: !88, file: !3, line: 85, type: !5)
!90 = !DILocation(line: 85, column: 15, scope: !88)
!91 = !DILocation(line: 86, column: 10, scope: !88)
!92 = !DILocation(line: 87, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !3, line: 87, column: 8)
!94 = !DILocation(line: 87, column: 18, scope: !93)
!95 = !DILocation(line: 87, column: 8, scope: !88)
!96 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !3, line: 91, type: !5)
!97 = distinct !DILexicalBlock(scope: !98, file: !3, line: 89, column: 9)
!98 = distinct !DILexicalBlock(scope: !93, file: !3, line: 88, column: 5)
!99 = !DILocation(line: 91, column: 23, scope: !97)
!100 = !DILocation(line: 91, column: 47, scope: !97)
!101 = !DILocation(line: 91, column: 36, scope: !97)
!102 = !DILocation(line: 92, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !3, line: 92, column: 17)
!104 = !DILocation(line: 92, column: 28, scope: !103)
!105 = !DILocation(line: 92, column: 17, scope: !97)
!106 = !DILocation(line: 94, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !3, line: 93, column: 13)
!108 = !DILocation(line: 95, column: 17, scope: !107)
!109 = !DILocation(line: 97, column: 21, scope: !97)
!110 = !DILocation(line: 97, column: 13, scope: !97)
!111 = !DILocation(line: 98, column: 13, scope: !97)
!112 = !DILocation(line: 98, column: 31, scope: !97)
!113 = !DILocation(line: 99, column: 20, scope: !97)
!114 = !DILocation(line: 99, column: 18, scope: !97)
!115 = !DILocation(line: 101, column: 5, scope: !98)
!116 = !DILocation(line: 102, column: 16, scope: !88)
!117 = !DILocation(line: 102, column: 5, scope: !88)
!118 = !DILocation(line: 104, column: 10, scope: !88)
!119 = !DILocation(line: 104, column: 5, scope: !88)
!120 = !DILocation(line: 105, column: 1, scope: !88)
