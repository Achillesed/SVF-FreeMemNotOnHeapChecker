; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_static_68a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_static_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_long_static_68_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_long_static_68_badData = dso_local global i64* null, align 8, !dbg !12
@CWE590_Free_Memory_Not_on_Heap__free_long_static_68_goodG2BData = dso_local global i64* null, align 8, !dbg !14
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_static_68_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i64* null, i64** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %0, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_long_static_68_bad.dataBuffer, i64 0, i64 %1, !dbg !47
  store i64 5, i64* %arrayidx, align 8, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %2, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_long_static_68_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !55
  %3 = load i64*, i64** %data, align 8, !dbg !56
  store i64* %3, i64** @CWE590_Free_Memory_Not_on_Heap__free_long_static_68_badData, align 8, !dbg !57
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_long_static_68b_badSink(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_long_static_68b_badSink(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_static_68_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !63 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !64, metadata !DIExpression()), !dbg !65
  store i64* null, i64** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !67, metadata !DIExpression()), !dbg !69
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !70
  %0 = bitcast i8* %call to i64*, !dbg !71
  store i64* %0, i64** %dataBuffer, align 8, !dbg !69
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !72
  %cmp = icmp eq i64* %1, null, !dbg !74
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
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !89
  %4 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !89
  store i64 5, i64* %arrayidx, align 8, !dbg !92
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !94
  %inc = add i64 %5, 1, !dbg !94
  store i64 %inc, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !98
  store i64* %6, i64** %data, align 8, !dbg !99
  %7 = load i64*, i64** %data, align 8, !dbg !100
  store i64* %7, i64** @CWE590_Free_Memory_Not_on_Heap__free_long_static_68_goodG2BData, align 8, !dbg !101
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_long_static_68b_goodG2BSink(), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_long_static_68b_goodG2BSink(...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!20, !21, !22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 35, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_68_bad", scope: !3, file: !3, line: 29, type: !4, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_static_68a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "2dace5bc75bbe59012a9fceb1ed288e3")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0, !12, !14}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_68_badData", scope: !6, file: !3, line: 21, type: !8, isLocal: false, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_68_goodG2BData", scope: !6, file: !3, line: 22, type: !8, isLocal: false, isDefinition: true)
!16 = !{}
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 6400, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 100)
!20 = !{i32 7, !"Dwarf Version", i32 5}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"PIC Level", i32 2}
!24 = !{i32 7, !"PIE Level", i32 2}
!25 = !{i32 7, !"uwtable", i32 1}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!28 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 31, type: !8)
!29 = !DILocation(line: 31, column: 12, scope: !2)
!30 = !DILocation(line: 32, column: 10, scope: !2)
!31 = !DILocalVariable(name: "i", scope: !32, file: !3, line: 37, type: !34)
!32 = distinct !DILexicalBlock(scope: !33, file: !3, line: 36, column: 9)
!33 = distinct !DILexicalBlock(scope: !2, file: !3, line: 33, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 37, column: 20, scope: !32)
!38 = !DILocation(line: 38, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !3, line: 38, column: 13)
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
!55 = !DILocation(line: 43, column: 14, scope: !33)
!56 = !DILocation(line: 45, column: 67, scope: !2)
!57 = !DILocation(line: 45, column: 65, scope: !2)
!58 = !DILocation(line: 46, column: 5, scope: !2)
!59 = !DILocation(line: 47, column: 1, scope: !2)
!60 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_68_good", scope: !3, file: !3, line: 82, type: !4, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!61 = !DILocation(line: 84, column: 5, scope: !60)
!62 = !DILocation(line: 85, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 57, type: !4, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!64 = !DILocalVariable(name: "data", scope: !63, file: !3, line: 59, type: !8)
!65 = !DILocation(line: 59, column: 12, scope: !63)
!66 = !DILocation(line: 60, column: 10, scope: !63)
!67 = !DILocalVariable(name: "dataBuffer", scope: !68, file: !3, line: 63, type: !8)
!68 = distinct !DILexicalBlock(scope: !63, file: !3, line: 61, column: 5)
!69 = !DILocation(line: 63, column: 16, scope: !68)
!70 = !DILocation(line: 63, column: 37, scope: !68)
!71 = !DILocation(line: 63, column: 29, scope: !68)
!72 = !DILocation(line: 64, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !3, line: 64, column: 13)
!74 = !DILocation(line: 64, column: 24, scope: !73)
!75 = !DILocation(line: 64, column: 13, scope: !68)
!76 = !DILocation(line: 66, column: 13, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !3, line: 65, column: 9)
!78 = !DILocation(line: 67, column: 13, scope: !77)
!79 = !DILocalVariable(name: "i", scope: !80, file: !3, line: 70, type: !34)
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
!96 = distinct !{!96, !88, !97, !54}
!97 = !DILocation(line: 74, column: 13, scope: !83)
!98 = !DILocation(line: 76, column: 16, scope: !68)
!99 = !DILocation(line: 76, column: 14, scope: !68)
!100 = !DILocation(line: 78, column: 71, scope: !63)
!101 = !DILocation(line: 78, column: 69, scope: !63)
!102 = !DILocation(line: 79, column: 5, scope: !63)
!103 = !DILocation(line: 80, column: 1, scope: !63)
