; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_08.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_08_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 @staticReturnsTrue(), !dbg !23
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

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_08_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !49 {
entry:
  ret i32 1, !dbg !52
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !53 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !54, metadata !DIExpression()), !dbg !55
  store i32* null, i32** %data, align 8, !dbg !56
  %call = call i32 @staticReturnsFalse(), !dbg !57
  %tobool = icmp ne i32 %call, 0, !dbg !57
  br i1 %tobool, label %if.then, label %if.else, !dbg !59

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !60
  br label %if.end4, !dbg !62

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !63, metadata !DIExpression()), !dbg !66
  %call1 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !67
  %0 = bitcast i8* %call1 to i32*, !dbg !68
  store i32* %0, i32** %dataBuffer, align 8, !dbg !66
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !69
  %cmp = icmp eq i32* %1, null, !dbg !71
  br i1 %cmp, label %if.then2, label %if.end, !dbg !72

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @exit(i32 noundef 1) #6, !dbg !75
  unreachable, !dbg !75

if.end:                                           ; preds = %if.else
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !76
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !77
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !80
  store i32* %4, i32** %data, align 8, !dbg !81
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %5 = load i32*, i32** %data, align 8, !dbg !82
  call void @printWLine(i32* noundef %5), !dbg !83
  %6 = load i32*, i32** %data, align 8, !dbg !84
  %7 = bitcast i32* %6 to i8*, !dbg !84
  call void @free(i8* noundef %7) #5, !dbg !85
  ret void, !dbg !86
}

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !87 {
entry:
  ret i32 0, !dbg !88
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i32* null, i32** %data, align 8, !dbg !92
  %call = call i32 @staticReturnsTrue(), !dbg !93
  %tobool = icmp ne i32 %call, 0, !dbg !93
  br i1 %tobool, label %if.then, label %if.end4, !dbg !95

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !99
  %call1 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !100
  %0 = bitcast i8* %call1 to i32*, !dbg !101
  store i32* %0, i32** %dataBuffer, align 8, !dbg !99
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %cmp = icmp eq i32* %1, null, !dbg !104
  br i1 %cmp, label %if.then2, label %if.end, !dbg !105

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @exit(i32 noundef 1) #6, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !110
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  store i32* %4, i32** %data, align 8, !dbg !114
  br label %if.end4, !dbg !115

if.end4:                                          ; preds = %if.end, %entry
  %5 = load i32*, i32** %data, align 8, !dbg !116
  call void @printWLine(i32* noundef %5), !dbg !117
  %6 = load i32*, i32** %data, align 8, !dbg !118
  %7 = bitcast i32* %6 to i8*, !dbg !118
  call void @free(i8* noundef %7) #5, !dbg !119
  ret void, !dbg !120
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_08.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "669a9debcb055e2e5ef6df83bab0360c")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_08_bad", scope: !1, file: !1, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 39, type: !3)
!21 = !DILocation(line: 39, column: 15, scope: !16)
!22 = !DILocation(line: 40, column: 10, scope: !16)
!23 = !DILocation(line: 41, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !1, line: 41, column: 8)
!25 = !DILocation(line: 41, column: 8, scope: !16)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !1, line: 45, type: !29)
!27 = distinct !DILexicalBlock(scope: !28, file: !1, line: 43, column: 9)
!28 = distinct !DILexicalBlock(scope: !24, file: !1, line: 42, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 45, column: 21, scope: !27)
!33 = !DILocation(line: 46, column: 21, scope: !27)
!34 = !DILocation(line: 46, column: 13, scope: !27)
!35 = !DILocation(line: 47, column: 13, scope: !27)
!36 = !DILocation(line: 47, column: 31, scope: !27)
!37 = !DILocation(line: 48, column: 20, scope: !27)
!38 = !DILocation(line: 48, column: 18, scope: !27)
!39 = !DILocation(line: 50, column: 5, scope: !28)
!40 = !DILocation(line: 51, column: 16, scope: !16)
!41 = !DILocation(line: 51, column: 5, scope: !16)
!42 = !DILocation(line: 53, column: 10, scope: !16)
!43 = !DILocation(line: 53, column: 5, scope: !16)
!44 = !DILocation(line: 54, column: 1, scope: !16)
!45 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_08_good", scope: !1, file: !1, line: 115, type: !17, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!46 = !DILocation(line: 117, column: 5, scope: !45)
!47 = !DILocation(line: 118, column: 5, scope: !45)
!48 = !DILocation(line: 119, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !1, file: !1, line: 25, type: !50, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!50 = !DISubroutineType(types: !51)
!51 = !{!6}
!52 = !DILocation(line: 27, column: 5, scope: !49)
!53 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!54 = !DILocalVariable(name: "data", scope: !53, file: !1, line: 63, type: !3)
!55 = !DILocation(line: 63, column: 15, scope: !53)
!56 = !DILocation(line: 64, column: 10, scope: !53)
!57 = !DILocation(line: 65, column: 8, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !1, line: 65, column: 8)
!59 = !DILocation(line: 65, column: 8, scope: !53)
!60 = !DILocation(line: 68, column: 9, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !1, line: 66, column: 5)
!62 = !DILocation(line: 69, column: 5, scope: !61)
!63 = !DILocalVariable(name: "dataBuffer", scope: !64, file: !1, line: 74, type: !3)
!64 = distinct !DILexicalBlock(scope: !65, file: !1, line: 72, column: 9)
!65 = distinct !DILexicalBlock(scope: !58, file: !1, line: 71, column: 5)
!66 = !DILocation(line: 74, column: 23, scope: !64)
!67 = !DILocation(line: 74, column: 47, scope: !64)
!68 = !DILocation(line: 74, column: 36, scope: !64)
!69 = !DILocation(line: 75, column: 17, scope: !70)
!70 = distinct !DILexicalBlock(scope: !64, file: !1, line: 75, column: 17)
!71 = !DILocation(line: 75, column: 28, scope: !70)
!72 = !DILocation(line: 75, column: 17, scope: !64)
!73 = !DILocation(line: 77, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !1, line: 76, column: 13)
!75 = !DILocation(line: 78, column: 17, scope: !74)
!76 = !DILocation(line: 80, column: 21, scope: !64)
!77 = !DILocation(line: 80, column: 13, scope: !64)
!78 = !DILocation(line: 81, column: 13, scope: !64)
!79 = !DILocation(line: 81, column: 31, scope: !64)
!80 = !DILocation(line: 82, column: 20, scope: !64)
!81 = !DILocation(line: 82, column: 18, scope: !64)
!82 = !DILocation(line: 85, column: 16, scope: !53)
!83 = !DILocation(line: 85, column: 5, scope: !53)
!84 = !DILocation(line: 87, column: 10, scope: !53)
!85 = !DILocation(line: 87, column: 5, scope: !53)
!86 = !DILocation(line: 88, column: 1, scope: !53)
!87 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !1, file: !1, line: 30, type: !50, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!88 = !DILocation(line: 32, column: 5, scope: !87)
!89 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 91, type: !17, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!90 = !DILocalVariable(name: "data", scope: !89, file: !1, line: 93, type: !3)
!91 = !DILocation(line: 93, column: 15, scope: !89)
!92 = !DILocation(line: 94, column: 10, scope: !89)
!93 = !DILocation(line: 95, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !89, file: !1, line: 95, column: 8)
!95 = !DILocation(line: 95, column: 8, scope: !89)
!96 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !1, line: 99, type: !3)
!97 = distinct !DILexicalBlock(scope: !98, file: !1, line: 97, column: 9)
!98 = distinct !DILexicalBlock(scope: !94, file: !1, line: 96, column: 5)
!99 = !DILocation(line: 99, column: 23, scope: !97)
!100 = !DILocation(line: 99, column: 47, scope: !97)
!101 = !DILocation(line: 99, column: 36, scope: !97)
!102 = !DILocation(line: 100, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !1, line: 100, column: 17)
!104 = !DILocation(line: 100, column: 28, scope: !103)
!105 = !DILocation(line: 100, column: 17, scope: !97)
!106 = !DILocation(line: 102, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !1, line: 101, column: 13)
!108 = !DILocation(line: 103, column: 17, scope: !107)
!109 = !DILocation(line: 105, column: 21, scope: !97)
!110 = !DILocation(line: 105, column: 13, scope: !97)
!111 = !DILocation(line: 106, column: 13, scope: !97)
!112 = !DILocation(line: 106, column: 31, scope: !97)
!113 = !DILocation(line: 107, column: 20, scope: !97)
!114 = !DILocation(line: 107, column: 18, scope: !97)
!115 = !DILocation(line: 109, column: 5, scope: !98)
!116 = !DILocation(line: 110, column: 16, scope: !89)
!117 = !DILocation(line: 110, column: 5, scope: !89)
!118 = !DILocation(line: 112, column: 10, scope: !89)
!119 = !DILocation(line: 112, column: 5, scope: !89)
!120 = !DILocation(line: 113, column: 1, scope: !89)
