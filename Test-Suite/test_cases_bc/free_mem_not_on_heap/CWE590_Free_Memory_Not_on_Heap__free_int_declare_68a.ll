; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_declare_68a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_declare_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int_declare_68_badData = dso_local global i32* null, align 8, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_int_declare_68_goodG2BData = dso_local global i32* null, align 8, !dbg !9
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_68_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %0, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 %1, !dbg !47
  store i32 5, i32* %arrayidx, align 4, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %2, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !55
  store i32* %arraydecay, i32** %data, align 8, !dbg !56
  %3 = load i32*, i32** %data, align 8, !dbg !57
  store i32* %3, i32** @CWE590_Free_Memory_Not_on_Heap__free_int_declare_68_badData, align 8, !dbg !58
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_int_declare_68b_badSink(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_68b_badSink(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_68_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  store i32* null, i32** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !68, metadata !DIExpression()), !dbg !70
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !71
  %0 = bitcast i8* %call to i32*, !dbg !72
  store i32* %0, i32** %dataBuffer, align 8, !dbg !70
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !73
  %cmp = icmp eq i32* %1, null, !dbg !75
  br i1 %cmp, label %if.then, label %if.end, !dbg !76

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @exit(i32 noundef 1) #6, !dbg !79
  unreachable, !dbg !79

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !80, metadata !DIExpression()), !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !86
  %cmp1 = icmp ult i64 %2, 100, !dbg !88
  br i1 %cmp1, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !90
  %4 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !90
  store i32 5, i32* %arrayidx, align 4, !dbg !93
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !95
  %inc = add i64 %5, 1, !dbg !95
  store i64 %inc, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !99
  store i32* %6, i32** %data, align 8, !dbg !100
  %7 = load i32*, i32** %data, align 8, !dbg !101
  store i32* %7, i32** @CWE590_Free_Memory_Not_on_Heap__free_int_declare_68_goodG2BData, align 8, !dbg !102
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_int_declare_68b_goodG2BSink(), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_68b_goodG2BSink(...) #2

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
!1 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_68_badData", scope: !2, file: !3, line: 21, type: !5, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_68a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "22226a886f0c642c416e378ec64133e8")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_68_goodG2BData", scope: !2, file: !3, line: 22, type: !5, isLocal: false, isDefinition: true)
!11 = !{i32 7, !"Dwarf Version", i32 5}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"PIE Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!19 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_68_bad", scope: !3, file: !3, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !3, line: 31, type: !5)
!24 = !DILocation(line: 31, column: 11, scope: !19)
!25 = !DILocation(line: 32, column: 10, scope: !19)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !3, line: 35, type: !28)
!27 = distinct !DILexicalBlock(scope: !19, file: !3, line: 33, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 35, column: 13, scope: !27)
!32 = !DILocalVariable(name: "i", scope: !33, file: !3, line: 37, type: !34)
!33 = distinct !DILexicalBlock(scope: !27, file: !3, line: 36, column: 9)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 37, column: 20, scope: !33)
!38 = !DILocation(line: 38, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !3, line: 38, column: 13)
!40 = !DILocation(line: 38, column: 18, scope: !39)
!41 = !DILocation(line: 38, column: 25, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !3, line: 38, column: 13)
!43 = !DILocation(line: 38, column: 27, scope: !42)
!44 = !DILocation(line: 38, column: 13, scope: !39)
!45 = !DILocation(line: 40, column: 28, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !3, line: 39, column: 13)
!47 = !DILocation(line: 40, column: 17, scope: !46)
!48 = !DILocation(line: 40, column: 31, scope: !46)
!49 = !DILocation(line: 41, column: 13, scope: !46)
!50 = !DILocation(line: 38, column: 35, scope: !42)
!51 = !DILocation(line: 38, column: 13, scope: !42)
!52 = distinct !{!52, !44, !53, !54}
!53 = !DILocation(line: 41, column: 13, scope: !39)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 43, column: 16, scope: !27)
!56 = !DILocation(line: 43, column: 14, scope: !27)
!57 = !DILocation(line: 45, column: 67, scope: !19)
!58 = !DILocation(line: 45, column: 65, scope: !19)
!59 = !DILocation(line: 46, column: 5, scope: !19)
!60 = !DILocation(line: 47, column: 1, scope: !19)
!61 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_68_good", scope: !3, file: !3, line: 82, type: !20, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!62 = !DILocation(line: 84, column: 5, scope: !61)
!63 = !DILocation(line: 85, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 57, type: !20, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!65 = !DILocalVariable(name: "data", scope: !64, file: !3, line: 59, type: !5)
!66 = !DILocation(line: 59, column: 11, scope: !64)
!67 = !DILocation(line: 60, column: 10, scope: !64)
!68 = !DILocalVariable(name: "dataBuffer", scope: !69, file: !3, line: 63, type: !5)
!69 = distinct !DILexicalBlock(scope: !64, file: !3, line: 61, column: 5)
!70 = !DILocation(line: 63, column: 15, scope: !69)
!71 = !DILocation(line: 63, column: 35, scope: !69)
!72 = !DILocation(line: 63, column: 28, scope: !69)
!73 = !DILocation(line: 64, column: 13, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !3, line: 64, column: 13)
!75 = !DILocation(line: 64, column: 24, scope: !74)
!76 = !DILocation(line: 64, column: 13, scope: !69)
!77 = !DILocation(line: 66, column: 13, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !3, line: 65, column: 9)
!79 = !DILocation(line: 67, column: 13, scope: !78)
!80 = !DILocalVariable(name: "i", scope: !81, file: !3, line: 70, type: !34)
!81 = distinct !DILexicalBlock(scope: !69, file: !3, line: 69, column: 9)
!82 = !DILocation(line: 70, column: 20, scope: !81)
!83 = !DILocation(line: 71, column: 20, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !3, line: 71, column: 13)
!85 = !DILocation(line: 71, column: 18, scope: !84)
!86 = !DILocation(line: 71, column: 25, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !3, line: 71, column: 13)
!88 = !DILocation(line: 71, column: 27, scope: !87)
!89 = !DILocation(line: 71, column: 13, scope: !84)
!90 = !DILocation(line: 73, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !3, line: 72, column: 13)
!92 = !DILocation(line: 73, column: 28, scope: !91)
!93 = !DILocation(line: 73, column: 31, scope: !91)
!94 = !DILocation(line: 74, column: 13, scope: !91)
!95 = !DILocation(line: 71, column: 35, scope: !87)
!96 = !DILocation(line: 71, column: 13, scope: !87)
!97 = distinct !{!97, !89, !98, !54}
!98 = !DILocation(line: 74, column: 13, scope: !84)
!99 = !DILocation(line: 76, column: 16, scope: !69)
!100 = !DILocation(line: 76, column: 14, scope: !69)
!101 = !DILocation(line: 78, column: 71, scope: !64)
!102 = !DILocation(line: 78, column: 69, scope: !64)
!103 = !DILocation(line: 79, column: 5, scope: !64)
!104 = !DILocation(line: 80, column: 1, scope: !64)
