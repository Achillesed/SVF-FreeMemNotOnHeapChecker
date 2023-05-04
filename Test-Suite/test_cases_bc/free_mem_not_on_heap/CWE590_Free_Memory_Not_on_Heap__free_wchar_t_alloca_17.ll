; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_17.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_17_bad() #0 !dbg !16 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* null, i32** %data, align 8, !dbg !24
  store i32 0, i32* %i, align 4, !dbg !25
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !28
  %cmp = icmp slt i32 %0, 1, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !32, metadata !DIExpression()), !dbg !35
  %1 = alloca i8, i64 400, align 16, !dbg !36
  %2 = bitcast i8* %1 to i32*, !dbg !37
  store i32* %2, i32** %dataBuffer, align 8, !dbg !35
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !39
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  store i32* %5, i32** %data, align 8, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !45
  %inc = add nsw i32 %6, 1, !dbg !45
  store i32 %inc, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* noundef %7), !dbg !51
  %8 = load i32*, i32** %data, align 8, !dbg !52
  %9 = bitcast i32* %8 to i8*, !dbg !52
  call void @free(i8* noundef %9) #5, !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_17_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !58 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i32** %data, metadata !61, metadata !DIExpression()), !dbg !62
  store i32* null, i32** %data, align 8, !dbg !63
  store i32 0, i32* %h, align 4, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !67
  %cmp = icmp slt i32 %0, 1, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !74
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !75
  %1 = bitcast i8* %call to i32*, !dbg !76
  store i32* %1, i32** %dataBuffer, align 8, !dbg !74
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !77
  %cmp1 = icmp eq i32* %2, null, !dbg !79
  br i1 %cmp1, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %for.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @exit(i32 noundef 1) #6, !dbg !83
  unreachable, !dbg !83

if.end:                                           ; preds = %for.body
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !84
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !85
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !88
  store i32* %5, i32** %data, align 8, !dbg !89
  br label %for.inc, !dbg !90

for.inc:                                          ; preds = %if.end
  %6 = load i32, i32* %h, align 4, !dbg !91
  %inc = add nsw i32 %6, 1, !dbg !91
  store i32 %inc, i32* %h, align 4, !dbg !91
  br label %for.cond, !dbg !92, !llvm.loop !93

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !95
  call void @printWLine(i32* noundef %7), !dbg !96
  %8 = load i32*, i32** %data, align 8, !dbg !97
  %9 = bitcast i32* %8 to i8*, !dbg !97
  call void @free(i8* noundef %9) #5, !dbg !98
  ret void, !dbg !99
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_17.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "a5de0899e69c3f1d162194be8e879048")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_17_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "i", scope: !16, file: !1, line: 25, type: !6)
!21 = !DILocation(line: 25, column: 9, scope: !16)
!22 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 26, type: !3)
!23 = !DILocation(line: 26, column: 15, scope: !16)
!24 = !DILocation(line: 27, column: 10, scope: !16)
!25 = !DILocation(line: 28, column: 11, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !1, line: 28, column: 5)
!27 = !DILocation(line: 28, column: 9, scope: !26)
!28 = !DILocation(line: 28, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !1, line: 28, column: 5)
!30 = !DILocation(line: 28, column: 18, scope: !29)
!31 = !DILocation(line: 28, column: 5, scope: !26)
!32 = !DILocalVariable(name: "dataBuffer", scope: !33, file: !1, line: 32, type: !3)
!33 = distinct !DILexicalBlock(scope: !34, file: !1, line: 30, column: 9)
!34 = distinct !DILexicalBlock(scope: !29, file: !1, line: 29, column: 5)
!35 = !DILocation(line: 32, column: 23, scope: !33)
!36 = !DILocation(line: 32, column: 47, scope: !33)
!37 = !DILocation(line: 32, column: 36, scope: !33)
!38 = !DILocation(line: 33, column: 21, scope: !33)
!39 = !DILocation(line: 33, column: 13, scope: !33)
!40 = !DILocation(line: 34, column: 13, scope: !33)
!41 = !DILocation(line: 34, column: 31, scope: !33)
!42 = !DILocation(line: 35, column: 20, scope: !33)
!43 = !DILocation(line: 35, column: 18, scope: !33)
!44 = !DILocation(line: 37, column: 5, scope: !34)
!45 = !DILocation(line: 28, column: 24, scope: !29)
!46 = !DILocation(line: 28, column: 5, scope: !29)
!47 = distinct !{!47, !31, !48, !49}
!48 = !DILocation(line: 37, column: 5, scope: !26)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocation(line: 38, column: 16, scope: !16)
!51 = !DILocation(line: 38, column: 5, scope: !16)
!52 = !DILocation(line: 40, column: 10, scope: !16)
!53 = !DILocation(line: 40, column: 5, scope: !16)
!54 = !DILocation(line: 41, column: 1, scope: !16)
!55 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_17_good", scope: !1, file: !1, line: 73, type: !17, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!56 = !DILocation(line: 75, column: 5, scope: !55)
!57 = !DILocation(line: 76, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!59 = !DILocalVariable(name: "h", scope: !58, file: !1, line: 50, type: !6)
!60 = !DILocation(line: 50, column: 9, scope: !58)
!61 = !DILocalVariable(name: "data", scope: !58, file: !1, line: 51, type: !3)
!62 = !DILocation(line: 51, column: 15, scope: !58)
!63 = !DILocation(line: 52, column: 10, scope: !58)
!64 = !DILocation(line: 53, column: 11, scope: !65)
!65 = distinct !DILexicalBlock(scope: !58, file: !1, line: 53, column: 5)
!66 = !DILocation(line: 53, column: 9, scope: !65)
!67 = !DILocation(line: 53, column: 16, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !1, line: 53, column: 5)
!69 = !DILocation(line: 53, column: 18, scope: !68)
!70 = !DILocation(line: 53, column: 5, scope: !65)
!71 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !1, line: 57, type: !3)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 55, column: 9)
!73 = distinct !DILexicalBlock(scope: !68, file: !1, line: 54, column: 5)
!74 = !DILocation(line: 57, column: 23, scope: !72)
!75 = !DILocation(line: 57, column: 47, scope: !72)
!76 = !DILocation(line: 57, column: 36, scope: !72)
!77 = !DILocation(line: 58, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !72, file: !1, line: 58, column: 17)
!79 = !DILocation(line: 58, column: 28, scope: !78)
!80 = !DILocation(line: 58, column: 17, scope: !72)
!81 = !DILocation(line: 60, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !1, line: 59, column: 13)
!83 = !DILocation(line: 61, column: 17, scope: !82)
!84 = !DILocation(line: 63, column: 21, scope: !72)
!85 = !DILocation(line: 63, column: 13, scope: !72)
!86 = !DILocation(line: 64, column: 13, scope: !72)
!87 = !DILocation(line: 64, column: 31, scope: !72)
!88 = !DILocation(line: 65, column: 20, scope: !72)
!89 = !DILocation(line: 65, column: 18, scope: !72)
!90 = !DILocation(line: 67, column: 5, scope: !73)
!91 = !DILocation(line: 53, column: 24, scope: !68)
!92 = !DILocation(line: 53, column: 5, scope: !68)
!93 = distinct !{!93, !70, !94, !49}
!94 = !DILocation(line: 67, column: 5, scope: !65)
!95 = !DILocation(line: 68, column: 16, scope: !58)
!96 = !DILocation(line: 68, column: 5, scope: !58)
!97 = !DILocation(line: 70, column: 10, scope: !58)
!98 = !DILocation(line: 70, column: 5, scope: !58)
!99 = !DILocation(line: 71, column: 1, scope: !58)
