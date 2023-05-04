; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_static_65a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_static_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int_static_65_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_65_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !26, metadata !DIExpression()), !dbg !30
  store void (i32*)* @CWE590_Free_Memory_Not_on_Heap__free_int_static_65b_badSink, void (i32*)** %funcPtr, align 8, !dbg !30
  store i32* null, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !42
  %cmp = icmp ult i64 %0, 100, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_65_bad.dataBuffer, i64 0, i64 %1, !dbg !48
  store i32 5, i32* %arrayidx, align 4, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %2, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_65_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !56
  %3 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !57
  %4 = load i32*, i32** %data, align 8, !dbg !58
  call void %3(i32* noundef %4), !dbg !57
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int_static_65b_badSink(i32* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_65_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !63 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !66, metadata !DIExpression()), !dbg !67
  store void (i32*)* @CWE590_Free_Memory_Not_on_Heap__free_int_static_65b_goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !67
  store i32* null, i32** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !69, metadata !DIExpression()), !dbg !71
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !72
  %0 = bitcast i8* %call to i32*, !dbg !73
  store i32* %0, i32** %dataBuffer, align 8, !dbg !71
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  %cmp = icmp eq i32* %1, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @exit(i32 noundef 1) #6, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !81, metadata !DIExpression()), !dbg !83
  store i64 0, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !87
  %cmp1 = icmp ult i64 %2, 100, !dbg !89
  br i1 %cmp1, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !91
  %4 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !91
  store i32 5, i32* %arrayidx, align 4, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %5, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  store i32* %6, i32** %data, align 8, !dbg !101
  %7 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !102
  %8 = load i32*, i32** %data, align 8, !dbg !103
  call void %7(i32* noundef %8), !dbg !102
  ret void, !dbg !104
}

declare void @CWE590_Free_Memory_Not_on_Heap__free_int_static_65b_goodG2BSink(i32* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 34, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_65_bad", scope: !3, file: !3, line: 26, type: !4, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_static_65a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "05921cba198bbab8bc9f7922fe243a3a")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0}
!12 = !{}
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 100)
!16 = !{i32 7, !"Dwarf Version", i32 5}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"PIE Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 28, type: !8)
!25 = !DILocation(line: 28, column: 11, scope: !2)
!26 = !DILocalVariable(name: "funcPtr", scope: !2, file: !3, line: 30, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DISubroutineType(types: !29)
!29 = !{null, !8}
!30 = !DILocation(line: 30, column: 12, scope: !2)
!31 = !DILocation(line: 31, column: 10, scope: !2)
!32 = !DILocalVariable(name: "i", scope: !33, file: !3, line: 36, type: !35)
!33 = distinct !DILexicalBlock(scope: !34, file: !3, line: 35, column: 9)
!34 = distinct !DILexicalBlock(scope: !2, file: !3, line: 32, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!37 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 36, column: 20, scope: !33)
!39 = !DILocation(line: 37, column: 20, scope: !40)
!40 = distinct !DILexicalBlock(scope: !33, file: !3, line: 37, column: 13)
!41 = !DILocation(line: 37, column: 18, scope: !40)
!42 = !DILocation(line: 37, column: 25, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !3, line: 37, column: 13)
!44 = !DILocation(line: 37, column: 27, scope: !43)
!45 = !DILocation(line: 37, column: 13, scope: !40)
!46 = !DILocation(line: 39, column: 28, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !3, line: 38, column: 13)
!48 = !DILocation(line: 39, column: 17, scope: !47)
!49 = !DILocation(line: 39, column: 31, scope: !47)
!50 = !DILocation(line: 40, column: 13, scope: !47)
!51 = !DILocation(line: 37, column: 35, scope: !43)
!52 = !DILocation(line: 37, column: 13, scope: !43)
!53 = distinct !{!53, !45, !54, !55}
!54 = !DILocation(line: 40, column: 13, scope: !40)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 42, column: 14, scope: !34)
!57 = !DILocation(line: 45, column: 5, scope: !2)
!58 = !DILocation(line: 45, column: 13, scope: !2)
!59 = !DILocation(line: 46, column: 1, scope: !2)
!60 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_65_good", scope: !3, file: !3, line: 80, type: !4, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!61 = !DILocation(line: 82, column: 5, scope: !60)
!62 = !DILocation(line: 83, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 55, type: !4, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!64 = !DILocalVariable(name: "data", scope: !63, file: !3, line: 57, type: !8)
!65 = !DILocation(line: 57, column: 11, scope: !63)
!66 = !DILocalVariable(name: "funcPtr", scope: !63, file: !3, line: 58, type: !27)
!67 = !DILocation(line: 58, column: 12, scope: !63)
!68 = !DILocation(line: 59, column: 10, scope: !63)
!69 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !3, line: 62, type: !8)
!70 = distinct !DILexicalBlock(scope: !63, file: !3, line: 60, column: 5)
!71 = !DILocation(line: 62, column: 15, scope: !70)
!72 = !DILocation(line: 62, column: 35, scope: !70)
!73 = !DILocation(line: 62, column: 28, scope: !70)
!74 = !DILocation(line: 63, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !3, line: 63, column: 13)
!76 = !DILocation(line: 63, column: 24, scope: !75)
!77 = !DILocation(line: 63, column: 13, scope: !70)
!78 = !DILocation(line: 65, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !3, line: 64, column: 9)
!80 = !DILocation(line: 66, column: 13, scope: !79)
!81 = !DILocalVariable(name: "i", scope: !82, file: !3, line: 69, type: !35)
!82 = distinct !DILexicalBlock(scope: !70, file: !3, line: 68, column: 9)
!83 = !DILocation(line: 69, column: 20, scope: !82)
!84 = !DILocation(line: 70, column: 20, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !3, line: 70, column: 13)
!86 = !DILocation(line: 70, column: 18, scope: !85)
!87 = !DILocation(line: 70, column: 25, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !3, line: 70, column: 13)
!89 = !DILocation(line: 70, column: 27, scope: !88)
!90 = !DILocation(line: 70, column: 13, scope: !85)
!91 = !DILocation(line: 72, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !3, line: 71, column: 13)
!93 = !DILocation(line: 72, column: 28, scope: !92)
!94 = !DILocation(line: 72, column: 31, scope: !92)
!95 = !DILocation(line: 73, column: 13, scope: !92)
!96 = !DILocation(line: 70, column: 35, scope: !88)
!97 = !DILocation(line: 70, column: 13, scope: !88)
!98 = distinct !{!98, !90, !99, !55}
!99 = !DILocation(line: 73, column: 13, scope: !85)
!100 = !DILocation(line: 75, column: 16, scope: !70)
!101 = !DILocation(line: 75, column: 14, scope: !70)
!102 = !DILocation(line: 77, column: 5, scope: !63)
!103 = !DILocation(line: 77, column: 13, scope: !63)
!104 = !DILocation(line: 78, column: 1, scope: !63)
