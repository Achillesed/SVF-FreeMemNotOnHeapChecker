; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_32.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_32_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %data2 = alloca i32*, align 8
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
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !33, metadata !DIExpression()), !dbg !35
  %2 = alloca i8, i64 400, align 16, !dbg !36
  %3 = bitcast i8* %2 to i32*, !dbg !37
  store i32* %3, i32** %dataBuffer, align 8, !dbg !35
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 99) #5, !dbg !39
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  store i32* %6, i32** %data1, align 8, !dbg !43
  %7 = load i32*, i32** %data1, align 8, !dbg !44
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !45
  store i32* %7, i32** %8, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !47, metadata !DIExpression()), !dbg !49
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !50
  %10 = load i32*, i32** %9, align 8, !dbg !51
  store i32* %10, i32** %data2, align 8, !dbg !49
  %11 = load i32*, i32** %data2, align 8, !dbg !52
  call void @printWLine(i32* noundef %11), !dbg !53
  %12 = load i32*, i32** %data2, align 8, !dbg !54
  %13 = bitcast i32* %12 to i8*, !dbg !54
  call void @free(i8* noundef %13) #5, !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_32_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !60 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !63, metadata !DIExpression()), !dbg !64
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !65, metadata !DIExpression()), !dbg !66
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !66
  store i32* null, i32** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !68, metadata !DIExpression()), !dbg !70
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !71
  %1 = load i32*, i32** %0, align 8, !dbg !72
  store i32* %1, i32** %data1, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !73, metadata !DIExpression()), !dbg !75
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !76
  %2 = bitcast i8* %call to i32*, !dbg !77
  store i32* %2, i32** %dataBuffer, align 8, !dbg !75
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !78
  %cmp = icmp eq i32* %3, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @exit(i32 noundef 1) #6, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  %call2 = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 99) #5, !dbg !86
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !89
  store i32* %6, i32** %data1, align 8, !dbg !90
  %7 = load i32*, i32** %data1, align 8, !dbg !91
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !92
  store i32* %7, i32** %8, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !94, metadata !DIExpression()), !dbg !96
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !97
  %10 = load i32*, i32** %9, align 8, !dbg !98
  store i32* %10, i32** %data3, align 8, !dbg !96
  %11 = load i32*, i32** %data3, align 8, !dbg !99
  call void @printWLine(i32* noundef %11), !dbg !100
  %12 = load i32*, i32** %data3, align 8, !dbg !101
  %13 = bitcast i32* %12 to i8*, !dbg !101
  call void @free(i8* noundef %13) #5, !dbg !102
  ret void, !dbg !103
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_32.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "c367a62108431a758c66f51d12caadf5")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_32_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
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
!33 = !DILocalVariable(name: "dataBuffer", scope: !34, file: !1, line: 33, type: !3)
!34 = distinct !DILexicalBlock(scope: !29, file: !1, line: 31, column: 9)
!35 = !DILocation(line: 33, column: 23, scope: !34)
!36 = !DILocation(line: 33, column: 47, scope: !34)
!37 = !DILocation(line: 33, column: 36, scope: !34)
!38 = !DILocation(line: 34, column: 21, scope: !34)
!39 = !DILocation(line: 34, column: 13, scope: !34)
!40 = !DILocation(line: 35, column: 13, scope: !34)
!41 = !DILocation(line: 35, column: 31, scope: !34)
!42 = !DILocation(line: 36, column: 20, scope: !34)
!43 = !DILocation(line: 36, column: 18, scope: !34)
!44 = !DILocation(line: 38, column: 21, scope: !29)
!45 = !DILocation(line: 38, column: 10, scope: !29)
!46 = !DILocation(line: 38, column: 19, scope: !29)
!47 = !DILocalVariable(name: "data", scope: !48, file: !1, line: 41, type: !3)
!48 = distinct !DILexicalBlock(scope: !16, file: !1, line: 40, column: 5)
!49 = !DILocation(line: 41, column: 19, scope: !48)
!50 = !DILocation(line: 41, column: 27, scope: !48)
!51 = !DILocation(line: 41, column: 26, scope: !48)
!52 = !DILocation(line: 42, column: 20, scope: !48)
!53 = !DILocation(line: 42, column: 9, scope: !48)
!54 = !DILocation(line: 44, column: 14, scope: !48)
!55 = !DILocation(line: 44, column: 9, scope: !48)
!56 = !DILocation(line: 46, column: 1, scope: !16)
!57 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_32_good", scope: !1, file: !1, line: 83, type: !17, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!58 = !DILocation(line: 85, column: 5, scope: !57)
!59 = !DILocation(line: 86, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!61 = !DILocalVariable(name: "data", scope: !60, file: !1, line: 55, type: !3)
!62 = !DILocation(line: 55, column: 15, scope: !60)
!63 = !DILocalVariable(name: "dataPtr1", scope: !60, file: !1, line: 56, type: !23)
!64 = !DILocation(line: 56, column: 16, scope: !60)
!65 = !DILocalVariable(name: "dataPtr2", scope: !60, file: !1, line: 57, type: !23)
!66 = !DILocation(line: 57, column: 16, scope: !60)
!67 = !DILocation(line: 58, column: 10, scope: !60)
!68 = !DILocalVariable(name: "data", scope: !69, file: !1, line: 60, type: !3)
!69 = distinct !DILexicalBlock(scope: !60, file: !1, line: 59, column: 5)
!70 = !DILocation(line: 60, column: 19, scope: !69)
!71 = !DILocation(line: 60, column: 27, scope: !69)
!72 = !DILocation(line: 60, column: 26, scope: !69)
!73 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !1, line: 63, type: !3)
!74 = distinct !DILexicalBlock(scope: !69, file: !1, line: 61, column: 9)
!75 = !DILocation(line: 63, column: 23, scope: !74)
!76 = !DILocation(line: 63, column: 47, scope: !74)
!77 = !DILocation(line: 63, column: 36, scope: !74)
!78 = !DILocation(line: 64, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !1, line: 64, column: 17)
!80 = !DILocation(line: 64, column: 28, scope: !79)
!81 = !DILocation(line: 64, column: 17, scope: !74)
!82 = !DILocation(line: 66, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !1, line: 65, column: 13)
!84 = !DILocation(line: 67, column: 17, scope: !83)
!85 = !DILocation(line: 69, column: 21, scope: !74)
!86 = !DILocation(line: 69, column: 13, scope: !74)
!87 = !DILocation(line: 70, column: 13, scope: !74)
!88 = !DILocation(line: 70, column: 31, scope: !74)
!89 = !DILocation(line: 71, column: 20, scope: !74)
!90 = !DILocation(line: 71, column: 18, scope: !74)
!91 = !DILocation(line: 73, column: 21, scope: !69)
!92 = !DILocation(line: 73, column: 10, scope: !69)
!93 = !DILocation(line: 73, column: 19, scope: !69)
!94 = !DILocalVariable(name: "data", scope: !95, file: !1, line: 76, type: !3)
!95 = distinct !DILexicalBlock(scope: !60, file: !1, line: 75, column: 5)
!96 = !DILocation(line: 76, column: 19, scope: !95)
!97 = !DILocation(line: 76, column: 27, scope: !95)
!98 = !DILocation(line: 76, column: 26, scope: !95)
!99 = !DILocation(line: 77, column: 20, scope: !95)
!100 = !DILocation(line: 77, column: 9, scope: !95)
!101 = !DILocation(line: 79, column: 14, scope: !95)
!102 = !DILocation(line: 79, column: 9, scope: !95)
!103 = !DILocation(line: 81, column: 1, scope: !60)
