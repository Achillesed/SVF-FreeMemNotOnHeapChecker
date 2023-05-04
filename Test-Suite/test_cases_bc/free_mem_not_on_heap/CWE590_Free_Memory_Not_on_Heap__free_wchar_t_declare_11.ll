; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_11.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_11_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 (...) @globalReturnsTrue(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 99) #5, !dbg !34
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !37
  store i32* %arraydecay2, i32** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  %0 = load i32*, i32** %data, align 8, !dbg !40
  call void @printWLine(i32* noundef %0), !dbg !41
  %1 = load i32*, i32** %data, align 8, !dbg !42
  %2 = bitcast i32* %1 to i8*, !dbg !42
  call void @free(i8* noundef %2) #5, !dbg !43
  ret void, !dbg !44
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_11_good() #0 !dbg !45 {
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
  %call = call i32 (...) @globalReturnsFalse(), !dbg !53
  %tobool = icmp ne i32 %call, 0, !dbg !53
  br i1 %tobool, label %if.then, label %if.else, !dbg !55

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !56
  br label %if.end4, !dbg !58

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !59, metadata !DIExpression()), !dbg !62
  %call1 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !63
  %0 = bitcast i8* %call1 to i32*, !dbg !64
  store i32* %0, i32** %dataBuffer, align 8, !dbg !62
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !65
  %cmp = icmp eq i32* %1, null, !dbg !67
  br i1 %cmp, label %if.then2, label %if.end, !dbg !68

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @exit(i32 noundef 1) #6, !dbg !71
  unreachable, !dbg !71

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !72
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !73
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !74
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !76
  store i32* %4, i32** %data, align 8, !dbg !77
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %5 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* noundef %5), !dbg !79
  %6 = load i32*, i32** %data, align 8, !dbg !80
  %7 = bitcast i32* %6 to i8*, !dbg !80
  call void @free(i8* noundef %7) #5, !dbg !81
  ret void, !dbg !82
}

declare i32 @globalReturnsFalse(...) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i32* null, i32** %data, align 8, !dbg !86
  %call = call i32 (...) @globalReturnsTrue(), !dbg !87
  %tobool = icmp ne i32 %call, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.end4, !dbg !89

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !90, metadata !DIExpression()), !dbg !93
  %call1 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !94
  %0 = bitcast i8* %call1 to i32*, !dbg !95
  store i32* %0, i32** %dataBuffer, align 8, !dbg !93
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !96
  %cmp = icmp eq i32* %1, null, !dbg !98
  br i1 %cmp, label %if.then2, label %if.end, !dbg !99

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @exit(i32 noundef 1) #6, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !103
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !104
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  store i32* %4, i32** %data, align 8, !dbg !108
  br label %if.end4, !dbg !109

if.end4:                                          ; preds = %if.end, %entry
  %5 = load i32*, i32** %data, align 8, !dbg !110
  call void @printWLine(i32* noundef %5), !dbg !111
  %6 = load i32*, i32** %data, align 8, !dbg !112
  %7 = bitcast i32* %6 to i8*, !dbg !112
  call void @free(i8* noundef %7) #5, !dbg !113
  ret void, !dbg !114
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_11.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "427d1e96e44c7e14dd1a2868568dac7f")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_11_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
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
!40 = !DILocation(line: 37, column: 16, scope: !16)
!41 = !DILocation(line: 37, column: 5, scope: !16)
!42 = !DILocation(line: 39, column: 10, scope: !16)
!43 = !DILocation(line: 39, column: 5, scope: !16)
!44 = !DILocation(line: 40, column: 1, scope: !16)
!45 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_11_good", scope: !1, file: !1, line: 101, type: !17, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!46 = !DILocation(line: 103, column: 5, scope: !45)
!47 = !DILocation(line: 104, column: 5, scope: !45)
!48 = !DILocation(line: 105, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 47, type: !17, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!50 = !DILocalVariable(name: "data", scope: !49, file: !1, line: 49, type: !3)
!51 = !DILocation(line: 49, column: 15, scope: !49)
!52 = !DILocation(line: 50, column: 10, scope: !49)
!53 = !DILocation(line: 51, column: 8, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !1, line: 51, column: 8)
!55 = !DILocation(line: 51, column: 8, scope: !49)
!56 = !DILocation(line: 54, column: 9, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !1, line: 52, column: 5)
!58 = !DILocation(line: 55, column: 5, scope: !57)
!59 = !DILocalVariable(name: "dataBuffer", scope: !60, file: !1, line: 60, type: !3)
!60 = distinct !DILexicalBlock(scope: !61, file: !1, line: 58, column: 9)
!61 = distinct !DILexicalBlock(scope: !54, file: !1, line: 57, column: 5)
!62 = !DILocation(line: 60, column: 23, scope: !60)
!63 = !DILocation(line: 60, column: 47, scope: !60)
!64 = !DILocation(line: 60, column: 36, scope: !60)
!65 = !DILocation(line: 61, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !1, line: 61, column: 17)
!67 = !DILocation(line: 61, column: 28, scope: !66)
!68 = !DILocation(line: 61, column: 17, scope: !60)
!69 = !DILocation(line: 63, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !1, line: 62, column: 13)
!71 = !DILocation(line: 64, column: 17, scope: !70)
!72 = !DILocation(line: 66, column: 21, scope: !60)
!73 = !DILocation(line: 66, column: 13, scope: !60)
!74 = !DILocation(line: 67, column: 13, scope: !60)
!75 = !DILocation(line: 67, column: 31, scope: !60)
!76 = !DILocation(line: 68, column: 20, scope: !60)
!77 = !DILocation(line: 68, column: 18, scope: !60)
!78 = !DILocation(line: 71, column: 16, scope: !49)
!79 = !DILocation(line: 71, column: 5, scope: !49)
!80 = !DILocation(line: 73, column: 10, scope: !49)
!81 = !DILocation(line: 73, column: 5, scope: !49)
!82 = !DILocation(line: 74, column: 1, scope: !49)
!83 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 77, type: !17, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!84 = !DILocalVariable(name: "data", scope: !83, file: !1, line: 79, type: !3)
!85 = !DILocation(line: 79, column: 15, scope: !83)
!86 = !DILocation(line: 80, column: 10, scope: !83)
!87 = !DILocation(line: 81, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !1, line: 81, column: 8)
!89 = !DILocation(line: 81, column: 8, scope: !83)
!90 = !DILocalVariable(name: "dataBuffer", scope: !91, file: !1, line: 85, type: !3)
!91 = distinct !DILexicalBlock(scope: !92, file: !1, line: 83, column: 9)
!92 = distinct !DILexicalBlock(scope: !88, file: !1, line: 82, column: 5)
!93 = !DILocation(line: 85, column: 23, scope: !91)
!94 = !DILocation(line: 85, column: 47, scope: !91)
!95 = !DILocation(line: 85, column: 36, scope: !91)
!96 = !DILocation(line: 86, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !1, line: 86, column: 17)
!98 = !DILocation(line: 86, column: 28, scope: !97)
!99 = !DILocation(line: 86, column: 17, scope: !91)
!100 = !DILocation(line: 88, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !1, line: 87, column: 13)
!102 = !DILocation(line: 89, column: 17, scope: !101)
!103 = !DILocation(line: 91, column: 21, scope: !91)
!104 = !DILocation(line: 91, column: 13, scope: !91)
!105 = !DILocation(line: 92, column: 13, scope: !91)
!106 = !DILocation(line: 92, column: 31, scope: !91)
!107 = !DILocation(line: 93, column: 20, scope: !91)
!108 = !DILocation(line: 93, column: 18, scope: !91)
!109 = !DILocation(line: 95, column: 5, scope: !92)
!110 = !DILocation(line: 96, column: 16, scope: !83)
!111 = !DILocation(line: 96, column: 5, scope: !83)
!112 = !DILocation(line: 98, column: 10, scope: !83)
!113 = !DILocation(line: 98, column: 5, scope: !83)
!114 = !DILocation(line: 99, column: 1, scope: !83)