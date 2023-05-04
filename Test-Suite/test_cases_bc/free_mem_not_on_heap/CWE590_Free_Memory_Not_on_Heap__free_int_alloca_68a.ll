; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68_badData = dso_local global i32* null, align 8, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68_goodG2BData = dso_local global i32* null, align 8, !dbg !9
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 400, align 16, !dbg !29
  %1 = bitcast i8* %0 to i32*, !dbg !30
  store i32* %1, i32** %dataBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !40
  %cmp = icmp ult i64 %2, 100, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !44
  %4 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !44
  store i32 5, i32* %arrayidx, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %5, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !54
  store i32* %6, i32** %data, align 8, !dbg !55
  %7 = load i32*, i32** %data, align 8, !dbg !56
  store i32* %7, i32** @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68_badData, align 8, !dbg !57
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68b_badSink(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68b_badSink(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !63 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !64, metadata !DIExpression()), !dbg !65
  store i32* null, i32** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !67, metadata !DIExpression()), !dbg !69
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !70
  %0 = bitcast i8* %call to i32*, !dbg !71
  store i32* %0, i32** %dataBuffer, align 8, !dbg !69
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !72
  %cmp = icmp eq i32* %1, null, !dbg !74
  br i1 %cmp, label %if.then, label %if.end, !dbg !75

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @exit(i32 noundef 1) #6, !dbg !78
  unreachable, !dbg !78

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !79, metadata !DIExpression()), !dbg !81
  store i64 0, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !85
  %cmp1 = icmp ult i64 %2, 100, !dbg !87
  br i1 %cmp1, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !89
  %4 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !89
  store i32 5, i32* %arrayidx, align 4, !dbg !92
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !94
  %inc = add i64 %5, 1, !dbg !94
  store i64 %inc, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !98
  store i32* %6, i32** %data, align 8, !dbg !99
  %7 = load i32*, i32** %data, align 8, !dbg !100
  store i32* %7, i32** @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68_goodG2BData, align 8, !dbg !101
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68b_goodG2BSink(), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68b_goodG2BSink(...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68_badData", scope: !2, file: !3, line: 21, type: !5, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "8d2a93853f0b6aeb6a55c06f0da98a70")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68_goodG2BData", scope: !2, file: !3, line: 22, type: !5, isLocal: false, isDefinition: true)
!11 = !{i32 7, !"Dwarf Version", i32 5}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"PIE Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!19 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68_bad", scope: !3, file: !3, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !3, line: 31, type: !5)
!24 = !DILocation(line: 31, column: 11, scope: !19)
!25 = !DILocation(line: 32, column: 10, scope: !19)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !3, line: 35, type: !5)
!27 = distinct !DILexicalBlock(scope: !19, file: !3, line: 33, column: 5)
!28 = !DILocation(line: 35, column: 15, scope: !27)
!29 = !DILocation(line: 35, column: 35, scope: !27)
!30 = !DILocation(line: 35, column: 28, scope: !27)
!31 = !DILocalVariable(name: "i", scope: !32, file: !3, line: 37, type: !33)
!32 = distinct !DILexicalBlock(scope: !27, file: !3, line: 36, column: 9)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!35 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 37, column: 20, scope: !32)
!37 = !DILocation(line: 38, column: 20, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !3, line: 38, column: 13)
!39 = !DILocation(line: 38, column: 18, scope: !38)
!40 = !DILocation(line: 38, column: 25, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !3, line: 38, column: 13)
!42 = !DILocation(line: 38, column: 27, scope: !41)
!43 = !DILocation(line: 38, column: 13, scope: !38)
!44 = !DILocation(line: 40, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !3, line: 39, column: 13)
!46 = !DILocation(line: 40, column: 28, scope: !45)
!47 = !DILocation(line: 40, column: 31, scope: !45)
!48 = !DILocation(line: 41, column: 13, scope: !45)
!49 = !DILocation(line: 38, column: 35, scope: !41)
!50 = !DILocation(line: 38, column: 13, scope: !41)
!51 = distinct !{!51, !43, !52, !53}
!52 = !DILocation(line: 41, column: 13, scope: !38)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 43, column: 16, scope: !27)
!55 = !DILocation(line: 43, column: 14, scope: !27)
!56 = !DILocation(line: 45, column: 66, scope: !19)
!57 = !DILocation(line: 45, column: 64, scope: !19)
!58 = !DILocation(line: 46, column: 5, scope: !19)
!59 = !DILocation(line: 47, column: 1, scope: !19)
!60 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_68_good", scope: !3, file: !3, line: 82, type: !20, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!61 = !DILocation(line: 84, column: 5, scope: !60)
!62 = !DILocation(line: 85, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 57, type: !20, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!64 = !DILocalVariable(name: "data", scope: !63, file: !3, line: 59, type: !5)
!65 = !DILocation(line: 59, column: 11, scope: !63)
!66 = !DILocation(line: 60, column: 10, scope: !63)
!67 = !DILocalVariable(name: "dataBuffer", scope: !68, file: !3, line: 63, type: !5)
!68 = distinct !DILexicalBlock(scope: !63, file: !3, line: 61, column: 5)
!69 = !DILocation(line: 63, column: 15, scope: !68)
!70 = !DILocation(line: 63, column: 35, scope: !68)
!71 = !DILocation(line: 63, column: 28, scope: !68)
!72 = !DILocation(line: 64, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !3, line: 64, column: 13)
!74 = !DILocation(line: 64, column: 24, scope: !73)
!75 = !DILocation(line: 64, column: 13, scope: !68)
!76 = !DILocation(line: 66, column: 13, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !3, line: 65, column: 9)
!78 = !DILocation(line: 67, column: 13, scope: !77)
!79 = !DILocalVariable(name: "i", scope: !80, file: !3, line: 70, type: !33)
!80 = distinct !DILexicalBlock(scope: !68, file: !3, line: 69, column: 9)
!81 = !DILocation(line: 70, column: 20, scope: !80)
!82 = !DILocation(line: 71, column: 20, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !3, line: 71, column: 13)
!84 = !DILocation(line: 71, column: 18, scope: !83)
!85 = !DILocation(line: 71, column: 25, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !3, line: 71, column: 13)
!87 = !DILocation(line: 71, column: 27, scope: !86)
!88 = !DILocation(line: 71, column: 13, scope: !83)
!89 = !DILocation(line: 73, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !3, line: 72, column: 13)
!91 = !DILocation(line: 73, column: 28, scope: !90)
!92 = !DILocation(line: 73, column: 31, scope: !90)
!93 = !DILocation(line: 74, column: 13, scope: !90)
!94 = !DILocation(line: 71, column: 35, scope: !86)
!95 = !DILocation(line: 71, column: 13, scope: !86)
!96 = distinct !{!96, !88, !97, !53}
!97 = !DILocation(line: 74, column: 13, scope: !83)
!98 = !DILocation(line: 76, column: 16, scope: !68)
!99 = !DILocation(line: 76, column: 14, scope: !68)
!100 = !DILocation(line: 78, column: 70, scope: !63)
!101 = !DILocation(line: 78, column: 68, scope: !63)
!102 = !DILocation(line: 79, column: 5, scope: !63)
!103 = !DILocation(line: 80, column: 1, scope: !63)
