; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_32.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_32_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data3 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !22, metadata !DIExpression()), !dbg !24
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !25, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !28, metadata !DIExpression()), !dbg !30
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !31
  %1 = load i32*, i32** %0, align 8, !dbg !32
  store i32* %1, i32** %data1, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !33, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !39
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 99) #5, !dbg !40
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !43
  store i32* %arraydecay2, i32** %data1, align 8, !dbg !44
  %2 = load i32*, i32** %data1, align 8, !dbg !45
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !46
  store i32* %2, i32** %3, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !48, metadata !DIExpression()), !dbg !50
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !51
  %5 = load i32*, i32** %4, align 8, !dbg !52
  store i32* %5, i32** %data3, align 8, !dbg !50
  %6 = load i32*, i32** %data3, align 8, !dbg !53
  call void @printWLine(i32* noundef %6), !dbg !54
  %7 = load i32*, i32** %data3, align 8, !dbg !55
  %8 = bitcast i32* %7 to i8*, !dbg !55
  call void @free(i8* noundef %8) #5, !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_32_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !61 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !64, metadata !DIExpression()), !dbg !65
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !66, metadata !DIExpression()), !dbg !67
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !67
  store i32* null, i32** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !69, metadata !DIExpression()), !dbg !71
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !72
  %1 = load i32*, i32** %0, align 8, !dbg !73
  store i32* %1, i32** %data1, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !76
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !77
  %2 = bitcast i8* %call to i32*, !dbg !78
  store i32* %2, i32** %dataBuffer, align 8, !dbg !76
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !79
  %cmp = icmp eq i32* %3, null, !dbg !81
  br i1 %cmp, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @exit(i32 noundef 1) #6, !dbg !85
  unreachable, !dbg !85

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  %call2 = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 99) #5, !dbg !87
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !90
  store i32* %6, i32** %data1, align 8, !dbg !91
  %7 = load i32*, i32** %data1, align 8, !dbg !92
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !93
  store i32* %7, i32** %8, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !95, metadata !DIExpression()), !dbg !97
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !98
  %10 = load i32*, i32** %9, align 8, !dbg !99
  store i32* %10, i32** %data3, align 8, !dbg !97
  %11 = load i32*, i32** %data3, align 8, !dbg !100
  call void @printWLine(i32* noundef %11), !dbg !101
  %12 = load i32*, i32** %data3, align 8, !dbg !102
  %13 = bitcast i32* %12 to i8*, !dbg !102
  call void @free(i8* noundef %13) #5, !dbg !103
  ret void, !dbg !104
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_32.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "ebb3435076ed21168d06c6d8698ebad2")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_32_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 25, type: !3)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocalVariable(name: "dataPtr1", scope: !16, file: !1, line: 26, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!24 = !DILocation(line: 26, column: 16, scope: !16)
!25 = !DILocalVariable(name: "dataPtr2", scope: !16, file: !1, line: 27, type: !23)
!26 = !DILocation(line: 27, column: 16, scope: !16)
!27 = !DILocation(line: 28, column: 10, scope: !16)
!28 = !DILocalVariable(name: "data", scope: !29, file: !1, line: 30, type: !3)
!29 = distinct !DILexicalBlock(scope: !16, file: !1, line: 29, column: 5)
!30 = !DILocation(line: 30, column: 19, scope: !29)
!31 = !DILocation(line: 30, column: 27, scope: !29)
!32 = !DILocation(line: 30, column: 26, scope: !29)
!33 = !DILocalVariable(name: "dataBuffer", scope: !34, file: !1, line: 33, type: !35)
!34 = distinct !DILexicalBlock(scope: !29, file: !1, line: 31, column: 9)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 33, column: 21, scope: !34)
!39 = !DILocation(line: 34, column: 21, scope: !34)
!40 = !DILocation(line: 34, column: 13, scope: !34)
!41 = !DILocation(line: 35, column: 13, scope: !34)
!42 = !DILocation(line: 35, column: 31, scope: !34)
!43 = !DILocation(line: 36, column: 20, scope: !34)
!44 = !DILocation(line: 36, column: 18, scope: !34)
!45 = !DILocation(line: 38, column: 21, scope: !29)
!46 = !DILocation(line: 38, column: 10, scope: !29)
!47 = !DILocation(line: 38, column: 19, scope: !29)
!48 = !DILocalVariable(name: "data", scope: !49, file: !1, line: 41, type: !3)
!49 = distinct !DILexicalBlock(scope: !16, file: !1, line: 40, column: 5)
!50 = !DILocation(line: 41, column: 19, scope: !49)
!51 = !DILocation(line: 41, column: 27, scope: !49)
!52 = !DILocation(line: 41, column: 26, scope: !49)
!53 = !DILocation(line: 42, column: 20, scope: !49)
!54 = !DILocation(line: 42, column: 9, scope: !49)
!55 = !DILocation(line: 44, column: 14, scope: !49)
!56 = !DILocation(line: 44, column: 9, scope: !49)
!57 = !DILocation(line: 46, column: 1, scope: !16)
!58 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_32_good", scope: !1, file: !1, line: 83, type: !17, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!59 = !DILocation(line: 85, column: 5, scope: !58)
!60 = !DILocation(line: 86, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!62 = !DILocalVariable(name: "data", scope: !61, file: !1, line: 55, type: !3)
!63 = !DILocation(line: 55, column: 15, scope: !61)
!64 = !DILocalVariable(name: "dataPtr1", scope: !61, file: !1, line: 56, type: !23)
!65 = !DILocation(line: 56, column: 16, scope: !61)
!66 = !DILocalVariable(name: "dataPtr2", scope: !61, file: !1, line: 57, type: !23)
!67 = !DILocation(line: 57, column: 16, scope: !61)
!68 = !DILocation(line: 58, column: 10, scope: !61)
!69 = !DILocalVariable(name: "data", scope: !70, file: !1, line: 60, type: !3)
!70 = distinct !DILexicalBlock(scope: !61, file: !1, line: 59, column: 5)
!71 = !DILocation(line: 60, column: 19, scope: !70)
!72 = !DILocation(line: 60, column: 27, scope: !70)
!73 = !DILocation(line: 60, column: 26, scope: !70)
!74 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !1, line: 63, type: !3)
!75 = distinct !DILexicalBlock(scope: !70, file: !1, line: 61, column: 9)
!76 = !DILocation(line: 63, column: 23, scope: !75)
!77 = !DILocation(line: 63, column: 47, scope: !75)
!78 = !DILocation(line: 63, column: 36, scope: !75)
!79 = !DILocation(line: 64, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !1, line: 64, column: 17)
!81 = !DILocation(line: 64, column: 28, scope: !80)
!82 = !DILocation(line: 64, column: 17, scope: !75)
!83 = !DILocation(line: 66, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !1, line: 65, column: 13)
!85 = !DILocation(line: 67, column: 17, scope: !84)
!86 = !DILocation(line: 69, column: 21, scope: !75)
!87 = !DILocation(line: 69, column: 13, scope: !75)
!88 = !DILocation(line: 70, column: 13, scope: !75)
!89 = !DILocation(line: 70, column: 31, scope: !75)
!90 = !DILocation(line: 71, column: 20, scope: !75)
!91 = !DILocation(line: 71, column: 18, scope: !75)
!92 = !DILocation(line: 73, column: 21, scope: !70)
!93 = !DILocation(line: 73, column: 10, scope: !70)
!94 = !DILocation(line: 73, column: 19, scope: !70)
!95 = !DILocalVariable(name: "data", scope: !96, file: !1, line: 76, type: !3)
!96 = distinct !DILexicalBlock(scope: !61, file: !1, line: 75, column: 5)
!97 = !DILocation(line: 76, column: 19, scope: !96)
!98 = !DILocation(line: 76, column: 27, scope: !96)
!99 = !DILocation(line: 76, column: 26, scope: !96)
!100 = !DILocation(line: 77, column: 20, scope: !96)
!101 = !DILocation(line: 77, column: 9, scope: !96)
!102 = !DILocation(line: 79, column: 14, scope: !96)
!103 = !DILocation(line: 79, column: 9, scope: !96)
!104 = !DILocation(line: 81, column: 1, scope: !61)
