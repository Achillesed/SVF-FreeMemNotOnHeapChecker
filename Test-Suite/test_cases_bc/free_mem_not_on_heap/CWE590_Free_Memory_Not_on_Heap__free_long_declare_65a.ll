; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_declare_65a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_declare_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_declare_65_bad() #0 !dbg !14 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i64*)* @CWE590_Free_Memory_Not_on_Heap__free_long_declare_65b_badSink, void (i64*)** %funcPtr, align 8, !dbg !24
  store i64* null, i64** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %0, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %1, !dbg !47
  store i64 5, i64* %arrayidx, align 8, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %2, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !55
  store i64* %arraydecay, i64** %data, align 8, !dbg !56
  %3 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !57
  %4 = load i64*, i64** %data, align 8, !dbg !58
  call void %3(i64* noundef %4), !dbg !57
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_long_declare_65b_badSink(i64* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_declare_65_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !63 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !66, metadata !DIExpression()), !dbg !67
  store void (i64*)* @CWE590_Free_Memory_Not_on_Heap__free_long_declare_65b_goodG2BSink, void (i64*)** %funcPtr, align 8, !dbg !67
  store i64* null, i64** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !69, metadata !DIExpression()), !dbg !71
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !72
  %0 = bitcast i8* %call to i64*, !dbg !73
  store i64* %0, i64** %dataBuffer, align 8, !dbg !71
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !74
  %cmp = icmp eq i64* %1, null, !dbg !76
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
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !91
  %4 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !91
  store i64 5, i64* %arrayidx, align 8, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %5, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !100
  store i64* %6, i64** %data, align 8, !dbg !101
  %7 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !102
  %8 = load i64*, i64** %data, align 8, !dbg !103
  call void %7(i64* noundef %8), !dbg !102
  ret void, !dbg !104
}

declare void @CWE590_Free_Memory_Not_on_Heap__free_long_declare_65b_goodG2BSink(i64* noundef) #2

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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_65a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "4dac60fdca95b5bd82151b6224e6d0cc")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_65_bad", scope: !1, file: !1, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 28, type: !3)
!19 = !DILocation(line: 28, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !1, line: 30, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !3}
!24 = !DILocation(line: 30, column: 12, scope: !14)
!25 = !DILocation(line: 31, column: 10, scope: !14)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !1, line: 34, type: !28)
!27 = distinct !DILexicalBlock(scope: !14, file: !1, line: 32, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 34, column: 14, scope: !27)
!32 = !DILocalVariable(name: "i", scope: !33, file: !1, line: 36, type: !34)
!33 = distinct !DILexicalBlock(scope: !27, file: !1, line: 35, column: 9)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 36, column: 20, scope: !33)
!38 = !DILocation(line: 37, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !1, line: 37, column: 13)
!40 = !DILocation(line: 37, column: 18, scope: !39)
!41 = !DILocation(line: 37, column: 25, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !1, line: 37, column: 13)
!43 = !DILocation(line: 37, column: 27, scope: !42)
!44 = !DILocation(line: 37, column: 13, scope: !39)
!45 = !DILocation(line: 39, column: 28, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !1, line: 38, column: 13)
!47 = !DILocation(line: 39, column: 17, scope: !46)
!48 = !DILocation(line: 39, column: 31, scope: !46)
!49 = !DILocation(line: 40, column: 13, scope: !46)
!50 = !DILocation(line: 37, column: 35, scope: !42)
!51 = !DILocation(line: 37, column: 13, scope: !42)
!52 = distinct !{!52, !44, !53, !54}
!53 = !DILocation(line: 40, column: 13, scope: !39)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 42, column: 16, scope: !27)
!56 = !DILocation(line: 42, column: 14, scope: !27)
!57 = !DILocation(line: 45, column: 5, scope: !14)
!58 = !DILocation(line: 45, column: 13, scope: !14)
!59 = !DILocation(line: 46, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_65_good", scope: !1, file: !1, line: 80, type: !15, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!61 = !DILocation(line: 82, column: 5, scope: !60)
!62 = !DILocation(line: 83, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!64 = !DILocalVariable(name: "data", scope: !63, file: !1, line: 57, type: !3)
!65 = !DILocation(line: 57, column: 12, scope: !63)
!66 = !DILocalVariable(name: "funcPtr", scope: !63, file: !1, line: 58, type: !21)
!67 = !DILocation(line: 58, column: 12, scope: !63)
!68 = !DILocation(line: 59, column: 10, scope: !63)
!69 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !1, line: 62, type: !3)
!70 = distinct !DILexicalBlock(scope: !63, file: !1, line: 60, column: 5)
!71 = !DILocation(line: 62, column: 16, scope: !70)
!72 = !DILocation(line: 62, column: 37, scope: !70)
!73 = !DILocation(line: 62, column: 29, scope: !70)
!74 = !DILocation(line: 63, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !1, line: 63, column: 13)
!76 = !DILocation(line: 63, column: 24, scope: !75)
!77 = !DILocation(line: 63, column: 13, scope: !70)
!78 = !DILocation(line: 65, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !1, line: 64, column: 9)
!80 = !DILocation(line: 66, column: 13, scope: !79)
!81 = !DILocalVariable(name: "i", scope: !82, file: !1, line: 69, type: !34)
!82 = distinct !DILexicalBlock(scope: !70, file: !1, line: 68, column: 9)
!83 = !DILocation(line: 69, column: 20, scope: !82)
!84 = !DILocation(line: 70, column: 20, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !1, line: 70, column: 13)
!86 = !DILocation(line: 70, column: 18, scope: !85)
!87 = !DILocation(line: 70, column: 25, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !1, line: 70, column: 13)
!89 = !DILocation(line: 70, column: 27, scope: !88)
!90 = !DILocation(line: 70, column: 13, scope: !85)
!91 = !DILocation(line: 72, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !1, line: 71, column: 13)
!93 = !DILocation(line: 72, column: 28, scope: !92)
!94 = !DILocation(line: 72, column: 31, scope: !92)
!95 = !DILocation(line: 73, column: 13, scope: !92)
!96 = !DILocation(line: 70, column: 35, scope: !88)
!97 = !DILocation(line: 70, column: 13, scope: !88)
!98 = distinct !{!98, !90, !99, !54}
!99 = !DILocation(line: 73, column: 13, scope: !85)
!100 = !DILocation(line: 75, column: 16, scope: !70)
!101 = !DILocation(line: 75, column: 14, scope: !70)
!102 = !DILocation(line: 77, column: 5, scope: !63)
!103 = !DILocation(line: 77, column: 13, scope: !63)
!104 = !DILocation(line: 78, column: 1, scope: !63)
