; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_12.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_12_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dataBuffer3 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.else, !dbg !25

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 99) #5, !dbg !34
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !37
  store i32* %arraydecay2, i32** %data, align 8, !dbg !38
  br label %if.end8, !dbg !39

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer3, metadata !40, metadata !DIExpression()), !dbg !43
  %call4 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !44
  %0 = bitcast i8* %call4 to i32*, !dbg !45
  store i32* %0, i32** %dataBuffer3, align 8, !dbg !43
  %1 = load i32*, i32** %dataBuffer3, align 8, !dbg !46
  %cmp = icmp eq i32* %1, null, !dbg !48
  br i1 %cmp, label %if.then5, label %if.end, !dbg !49

if.then5:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !50
  call void @exit(i32 noundef 1) #6, !dbg !52
  unreachable, !dbg !52

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %dataBuffer3, align 8, !dbg !53
  %call6 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !54
  %3 = load i32*, i32** %dataBuffer3, align 8, !dbg !55
  %arrayidx7 = getelementptr inbounds i32, i32* %3, i64 99, !dbg !55
  store i32 0, i32* %arrayidx7, align 4, !dbg !56
  %4 = load i32*, i32** %dataBuffer3, align 8, !dbg !57
  store i32* %4, i32** %data, align 8, !dbg !58
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  %5 = load i32*, i32** %data, align 8, !dbg !59
  call void @printWLine(i32* noundef %5), !dbg !60
  %6 = load i32*, i32** %data, align 8, !dbg !61
  %7 = bitcast i32* %6 to i8*, !dbg !61
  call void @free(i8* noundef %7) #5, !dbg !62
  ret void, !dbg !63
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_12_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataBuffer4 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i32* null, i32** %data, align 8, !dbg !70
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !71
  %tobool = icmp ne i32 %call, 0, !dbg !71
  br i1 %tobool, label %if.then, label %if.else, !dbg !73

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !77
  %call1 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !78
  %0 = bitcast i8* %call1 to i32*, !dbg !79
  store i32* %0, i32** %dataBuffer, align 8, !dbg !77
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !80
  %cmp = icmp eq i32* %1, null, !dbg !82
  br i1 %cmp, label %if.then2, label %if.end, !dbg !83

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @exit(i32 noundef 1) #6, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !87
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !88
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !91
  store i32* %4, i32** %data, align 8, !dbg !92
  br label %if.end11, !dbg !93

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer4, metadata !94, metadata !DIExpression()), !dbg !97
  %call5 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !98
  %5 = bitcast i8* %call5 to i32*, !dbg !99
  store i32* %5, i32** %dataBuffer4, align 8, !dbg !97
  %6 = load i32*, i32** %dataBuffer4, align 8, !dbg !100
  %cmp6 = icmp eq i32* %6, null, !dbg !102
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !103

if.then7:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @exit(i32 noundef 1) #6, !dbg !106
  unreachable, !dbg !106

if.end8:                                          ; preds = %if.else
  %7 = load i32*, i32** %dataBuffer4, align 8, !dbg !107
  %call9 = call i32* @wmemset(i32* noundef %7, i32 noundef 65, i64 noundef 99) #5, !dbg !108
  %8 = load i32*, i32** %dataBuffer4, align 8, !dbg !109
  %arrayidx10 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !109
  store i32 0, i32* %arrayidx10, align 4, !dbg !110
  %9 = load i32*, i32** %dataBuffer4, align 8, !dbg !111
  store i32* %9, i32** %data, align 8, !dbg !112
  br label %if.end11

if.end11:                                         ; preds = %if.end8, %if.end
  %10 = load i32*, i32** %data, align 8, !dbg !113
  call void @printWLine(i32* noundef %10), !dbg !114
  %11 = load i32*, i32** %data, align 8, !dbg !115
  %12 = bitcast i32* %11 to i8*, !dbg !115
  call void @free(i8* noundef %12) #5, !dbg !116
  ret void, !dbg !117
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_12.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "da3e5bc4166302e69db504ba90d00f3c")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_12_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 25, type: !3)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !1, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 8, scope: !16)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !1, line: 31, type: !29)
!27 = distinct !DILexicalBlock(scope: !28, file: !1, line: 29, column: 9)
!28 = distinct !DILexicalBlock(scope: !24, file: !1, line: 28, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 31, column: 21, scope: !27)
!33 = !DILocation(line: 32, column: 21, scope: !27)
!34 = !DILocation(line: 32, column: 13, scope: !27)
!35 = !DILocation(line: 33, column: 13, scope: !27)
!36 = !DILocation(line: 33, column: 31, scope: !27)
!37 = !DILocation(line: 34, column: 20, scope: !27)
!38 = !DILocation(line: 34, column: 18, scope: !27)
!39 = !DILocation(line: 36, column: 5, scope: !28)
!40 = !DILocalVariable(name: "dataBuffer", scope: !41, file: !1, line: 41, type: !3)
!41 = distinct !DILexicalBlock(scope: !42, file: !1, line: 39, column: 9)
!42 = distinct !DILexicalBlock(scope: !24, file: !1, line: 38, column: 5)
!43 = !DILocation(line: 41, column: 23, scope: !41)
!44 = !DILocation(line: 41, column: 47, scope: !41)
!45 = !DILocation(line: 41, column: 36, scope: !41)
!46 = !DILocation(line: 42, column: 17, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !1, line: 42, column: 17)
!48 = !DILocation(line: 42, column: 28, scope: !47)
!49 = !DILocation(line: 42, column: 17, scope: !41)
!50 = !DILocation(line: 44, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 43, column: 13)
!52 = !DILocation(line: 45, column: 17, scope: !51)
!53 = !DILocation(line: 47, column: 21, scope: !41)
!54 = !DILocation(line: 47, column: 13, scope: !41)
!55 = !DILocation(line: 48, column: 13, scope: !41)
!56 = !DILocation(line: 48, column: 31, scope: !41)
!57 = !DILocation(line: 49, column: 20, scope: !41)
!58 = !DILocation(line: 49, column: 18, scope: !41)
!59 = !DILocation(line: 52, column: 16, scope: !16)
!60 = !DILocation(line: 52, column: 5, scope: !16)
!61 = !DILocation(line: 54, column: 10, scope: !16)
!62 = !DILocation(line: 54, column: 5, scope: !16)
!63 = !DILocation(line: 55, column: 1, scope: !16)
!64 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_12_good", scope: !1, file: !1, line: 102, type: !17, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!65 = !DILocation(line: 104, column: 5, scope: !64)
!66 = !DILocation(line: 105, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 63, type: !17, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!68 = !DILocalVariable(name: "data", scope: !67, file: !1, line: 65, type: !3)
!69 = !DILocation(line: 65, column: 15, scope: !67)
!70 = !DILocation(line: 66, column: 10, scope: !67)
!71 = !DILocation(line: 67, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !1, line: 67, column: 8)
!73 = !DILocation(line: 67, column: 8, scope: !67)
!74 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !1, line: 71, type: !3)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 69, column: 9)
!76 = distinct !DILexicalBlock(scope: !72, file: !1, line: 68, column: 5)
!77 = !DILocation(line: 71, column: 23, scope: !75)
!78 = !DILocation(line: 71, column: 47, scope: !75)
!79 = !DILocation(line: 71, column: 36, scope: !75)
!80 = !DILocation(line: 72, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !1, line: 72, column: 17)
!82 = !DILocation(line: 72, column: 28, scope: !81)
!83 = !DILocation(line: 72, column: 17, scope: !75)
!84 = !DILocation(line: 74, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !1, line: 73, column: 13)
!86 = !DILocation(line: 75, column: 17, scope: !85)
!87 = !DILocation(line: 77, column: 21, scope: !75)
!88 = !DILocation(line: 77, column: 13, scope: !75)
!89 = !DILocation(line: 78, column: 13, scope: !75)
!90 = !DILocation(line: 78, column: 31, scope: !75)
!91 = !DILocation(line: 79, column: 20, scope: !75)
!92 = !DILocation(line: 79, column: 18, scope: !75)
!93 = !DILocation(line: 81, column: 5, scope: !76)
!94 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !1, line: 86, type: !3)
!95 = distinct !DILexicalBlock(scope: !96, file: !1, line: 84, column: 9)
!96 = distinct !DILexicalBlock(scope: !72, file: !1, line: 83, column: 5)
!97 = !DILocation(line: 86, column: 23, scope: !95)
!98 = !DILocation(line: 86, column: 47, scope: !95)
!99 = !DILocation(line: 86, column: 36, scope: !95)
!100 = !DILocation(line: 87, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !1, line: 87, column: 17)
!102 = !DILocation(line: 87, column: 28, scope: !101)
!103 = !DILocation(line: 87, column: 17, scope: !95)
!104 = !DILocation(line: 89, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !1, line: 88, column: 13)
!106 = !DILocation(line: 90, column: 17, scope: !105)
!107 = !DILocation(line: 92, column: 21, scope: !95)
!108 = !DILocation(line: 92, column: 13, scope: !95)
!109 = !DILocation(line: 93, column: 13, scope: !95)
!110 = !DILocation(line: 93, column: 31, scope: !95)
!111 = !DILocation(line: 94, column: 20, scope: !95)
!112 = !DILocation(line: 94, column: 18, scope: !95)
!113 = !DILocation(line: 97, column: 16, scope: !67)
!114 = !DILocation(line: 97, column: 5, scope: !67)
!115 = !DILocation(line: 99, column: 10, scope: !67)
!116 = !DILocation(line: 99, column: 5, scope: !67)
!117 = !DILocation(line: 100, column: 1, scope: !67)
