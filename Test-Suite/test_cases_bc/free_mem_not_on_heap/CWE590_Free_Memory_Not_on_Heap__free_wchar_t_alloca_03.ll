; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_03.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_03_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %call = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !31
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  store i32* %4, i32** %data, align 8, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  call void @printWLine(i32* noundef %5), !dbg !37
  %6 = load i32*, i32** %data, align 8, !dbg !38
  %7 = bitcast i32* %6 to i8*, !dbg !38
  call void @free(i8* noundef %7) #5, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_03_good() #0 !dbg !41 {
entry:
  call void @goodG2B1(), !dbg !42
  call void @goodG2B2(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !45 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !46, metadata !DIExpression()), !dbg !47
  store i32* null, i32** %data, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !49, metadata !DIExpression()), !dbg !53
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !54
  %0 = bitcast i8* %call to i32*, !dbg !55
  store i32* %0, i32** %dataBuffer, align 8, !dbg !53
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !56
  %cmp = icmp eq i32* %1, null, !dbg !58
  br i1 %cmp, label %if.then, label %if.end, !dbg !59

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @exit(i32 noundef 1) #6, !dbg !62
  unreachable, !dbg !62

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !63
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !64
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !65
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !65
  store i32 0, i32* %arrayidx, align 4, !dbg !66
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !67
  store i32* %4, i32** %data, align 8, !dbg !68
  %5 = load i32*, i32** %data, align 8, !dbg !69
  call void @printWLine(i32* noundef %5), !dbg !70
  %6 = load i32*, i32** %data, align 8, !dbg !71
  %7 = bitcast i32* %6 to i8*, !dbg !71
  call void @free(i8* noundef %7) #5, !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  store i32* null, i32** %data, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !82
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !83
  %0 = bitcast i8* %call to i32*, !dbg !84
  store i32* %0, i32** %dataBuffer, align 8, !dbg !82
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  %cmp = icmp eq i32* %1, null, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @exit(i32 noundef 1) #6, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !92
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !93
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !96
  store i32* %4, i32** %data, align 8, !dbg !97
  %5 = load i32*, i32** %data, align 8, !dbg !98
  call void @printWLine(i32* noundef %5), !dbg !99
  %6 = load i32*, i32** %data, align 8, !dbg !100
  %7 = bitcast i32* %6 to i8*, !dbg !100
  call void @free(i8* noundef %7) #5, !dbg !101
  ret void, !dbg !102
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_03.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "e2b13efda9c6fe10088dc1d0191bce81")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_03_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 25, type: !3)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !1, line: 31, type: !3)
!24 = distinct !DILexicalBlock(scope: !25, file: !1, line: 29, column: 9)
!25 = distinct !DILexicalBlock(scope: !26, file: !1, line: 28, column: 5)
!26 = distinct !DILexicalBlock(scope: !16, file: !1, line: 27, column: 8)
!27 = !DILocation(line: 31, column: 23, scope: !24)
!28 = !DILocation(line: 31, column: 47, scope: !24)
!29 = !DILocation(line: 31, column: 36, scope: !24)
!30 = !DILocation(line: 32, column: 21, scope: !24)
!31 = !DILocation(line: 32, column: 13, scope: !24)
!32 = !DILocation(line: 33, column: 13, scope: !24)
!33 = !DILocation(line: 33, column: 31, scope: !24)
!34 = !DILocation(line: 34, column: 20, scope: !24)
!35 = !DILocation(line: 34, column: 18, scope: !24)
!36 = !DILocation(line: 37, column: 16, scope: !16)
!37 = !DILocation(line: 37, column: 5, scope: !16)
!38 = !DILocation(line: 39, column: 10, scope: !16)
!39 = !DILocation(line: 39, column: 5, scope: !16)
!40 = !DILocation(line: 40, column: 1, scope: !16)
!41 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_03_good", scope: !1, file: !1, line: 101, type: !17, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!42 = !DILocation(line: 103, column: 5, scope: !41)
!43 = !DILocation(line: 104, column: 5, scope: !41)
!44 = !DILocation(line: 105, column: 1, scope: !41)
!45 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 47, type: !17, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!46 = !DILocalVariable(name: "data", scope: !45, file: !1, line: 49, type: !3)
!47 = !DILocation(line: 49, column: 15, scope: !45)
!48 = !DILocation(line: 50, column: 10, scope: !45)
!49 = !DILocalVariable(name: "dataBuffer", scope: !50, file: !1, line: 60, type: !3)
!50 = distinct !DILexicalBlock(scope: !51, file: !1, line: 58, column: 9)
!51 = distinct !DILexicalBlock(scope: !52, file: !1, line: 57, column: 5)
!52 = distinct !DILexicalBlock(scope: !45, file: !1, line: 51, column: 8)
!53 = !DILocation(line: 60, column: 23, scope: !50)
!54 = !DILocation(line: 60, column: 47, scope: !50)
!55 = !DILocation(line: 60, column: 36, scope: !50)
!56 = !DILocation(line: 61, column: 17, scope: !57)
!57 = distinct !DILexicalBlock(scope: !50, file: !1, line: 61, column: 17)
!58 = !DILocation(line: 61, column: 28, scope: !57)
!59 = !DILocation(line: 61, column: 17, scope: !50)
!60 = !DILocation(line: 63, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !1, line: 62, column: 13)
!62 = !DILocation(line: 64, column: 17, scope: !61)
!63 = !DILocation(line: 66, column: 21, scope: !50)
!64 = !DILocation(line: 66, column: 13, scope: !50)
!65 = !DILocation(line: 67, column: 13, scope: !50)
!66 = !DILocation(line: 67, column: 31, scope: !50)
!67 = !DILocation(line: 68, column: 20, scope: !50)
!68 = !DILocation(line: 68, column: 18, scope: !50)
!69 = !DILocation(line: 71, column: 16, scope: !45)
!70 = !DILocation(line: 71, column: 5, scope: !45)
!71 = !DILocation(line: 73, column: 10, scope: !45)
!72 = !DILocation(line: 73, column: 5, scope: !45)
!73 = !DILocation(line: 74, column: 1, scope: !45)
!74 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 77, type: !17, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!75 = !DILocalVariable(name: "data", scope: !74, file: !1, line: 79, type: !3)
!76 = !DILocation(line: 79, column: 15, scope: !74)
!77 = !DILocation(line: 80, column: 10, scope: !74)
!78 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !1, line: 85, type: !3)
!79 = distinct !DILexicalBlock(scope: !80, file: !1, line: 83, column: 9)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 82, column: 5)
!81 = distinct !DILexicalBlock(scope: !74, file: !1, line: 81, column: 8)
!82 = !DILocation(line: 85, column: 23, scope: !79)
!83 = !DILocation(line: 85, column: 47, scope: !79)
!84 = !DILocation(line: 85, column: 36, scope: !79)
!85 = !DILocation(line: 86, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !79, file: !1, line: 86, column: 17)
!87 = !DILocation(line: 86, column: 28, scope: !86)
!88 = !DILocation(line: 86, column: 17, scope: !79)
!89 = !DILocation(line: 88, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !1, line: 87, column: 13)
!91 = !DILocation(line: 89, column: 17, scope: !90)
!92 = !DILocation(line: 91, column: 21, scope: !79)
!93 = !DILocation(line: 91, column: 13, scope: !79)
!94 = !DILocation(line: 92, column: 13, scope: !79)
!95 = !DILocation(line: 92, column: 31, scope: !79)
!96 = !DILocation(line: 93, column: 20, scope: !79)
!97 = !DILocation(line: 93, column: 18, scope: !79)
!98 = !DILocation(line: 96, column: 16, scope: !74)
!99 = !DILocation(line: 96, column: 5, scope: !74)
!100 = !DILocation(line: 98, column: 10, scope: !74)
!101 = !DILocation(line: 98, column: 5, scope: !74)
!102 = !DILocation(line: 99, column: 1, scope: !74)
