; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_alloca_41.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_41_badSink(i64* noundef %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i64*, i64** %data.addr, align 8, !dbg !20
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0, !dbg !20
  %1 = load i64, i64* %arrayidx, align 8, !dbg !20
  call void @printLongLine(i64 noundef %1), !dbg !21
  %2 = load i64*, i64** %data.addr, align 8, !dbg !22
  %3 = bitcast i64* %2 to i8*, !dbg !22
  call void @free(i8* noundef %3) #5, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_41_bad() #0 !dbg !25 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i64* null, i64** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !33
  %0 = alloca i8, i64 800, align 16, !dbg !34
  %1 = bitcast i8* %0 to i64*, !dbg !35
  store i64* %1, i64** %dataBuffer, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %2, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !49
  %4 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !49
  store i64 5, i64* %arrayidx, align 8, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %5, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !59
  store i64* %6, i64** %data, align 8, !dbg !60
  %7 = load i64*, i64** %data, align 8, !dbg !61
  call void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_41_badSink(i64* noundef %7), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_41_goodG2BSink(i64* noundef %data) #0 !dbg !64 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i64*, i64** %data.addr, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0, !dbg !67
  %1 = load i64, i64* %arrayidx, align 8, !dbg !67
  call void @printLongLine(i64 noundef %1), !dbg !68
  %2 = load i64*, i64** %data.addr, align 8, !dbg !69
  %3 = bitcast i64* %2 to i8*, !dbg !69
  call void @free(i8* noundef %3) #5, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_41_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i64* null, i64** %data, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !81
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !82
  %0 = bitcast i8* %call to i64*, !dbg !83
  store i64* %0, i64** %dataBuffer, align 8, !dbg !81
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !84
  %cmp = icmp eq i64* %1, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @exit(i32 noundef 1) #6, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !91, metadata !DIExpression()), !dbg !93
  store i64 0, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !96

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !97
  %cmp1 = icmp ult i64 %2, 100, !dbg !99
  br i1 %cmp1, label %for.body, label %for.end, !dbg !100

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !101
  %4 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !101
  store i64 5, i64* %arrayidx, align 8, !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !106
  %inc = add i64 %5, 1, !dbg !106
  store i64 %inc, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !110
  store i64* %6, i64** %data, align 8, !dbg !111
  %7 = load i64*, i64** %data, align 8, !dbg !112
  call void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_41_goodG2BSink(i64* noundef %7), !dbg !113
  ret void, !dbg !114
}

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_41.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "74481fd801a21d539f591df4da0ca79d")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_41_badSink", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !3}
!17 = !{}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !1, line: 23, type: !3)
!19 = !DILocation(line: 23, column: 73, scope: !14)
!20 = !DILocation(line: 25, column: 19, scope: !14)
!21 = !DILocation(line: 25, column: 5, scope: !14)
!22 = !DILocation(line: 27, column: 10, scope: !14)
!23 = !DILocation(line: 27, column: 5, scope: !14)
!24 = !DILocation(line: 28, column: 1, scope: !14)
!25 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_41_bad", scope: !1, file: !1, line: 30, type: !26, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "data", scope: !25, file: !1, line: 32, type: !3)
!29 = !DILocation(line: 32, column: 12, scope: !25)
!30 = !DILocation(line: 33, column: 10, scope: !25)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !1, line: 36, type: !3)
!32 = distinct !DILexicalBlock(scope: !25, file: !1, line: 34, column: 5)
!33 = !DILocation(line: 36, column: 16, scope: !32)
!34 = !DILocation(line: 36, column: 37, scope: !32)
!35 = !DILocation(line: 36, column: 29, scope: !32)
!36 = !DILocalVariable(name: "i", scope: !37, file: !1, line: 38, type: !38)
!37 = distinct !DILexicalBlock(scope: !32, file: !1, line: 37, column: 9)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 38, column: 20, scope: !37)
!42 = !DILocation(line: 39, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !1, line: 39, column: 13)
!44 = !DILocation(line: 39, column: 18, scope: !43)
!45 = !DILocation(line: 39, column: 25, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !1, line: 39, column: 13)
!47 = !DILocation(line: 39, column: 27, scope: !46)
!48 = !DILocation(line: 39, column: 13, scope: !43)
!49 = !DILocation(line: 41, column: 17, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 40, column: 13)
!51 = !DILocation(line: 41, column: 28, scope: !50)
!52 = !DILocation(line: 41, column: 31, scope: !50)
!53 = !DILocation(line: 42, column: 13, scope: !50)
!54 = !DILocation(line: 39, column: 35, scope: !46)
!55 = !DILocation(line: 39, column: 13, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 42, column: 13, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 44, column: 16, scope: !32)
!60 = !DILocation(line: 44, column: 14, scope: !32)
!61 = !DILocation(line: 46, column: 65, scope: !25)
!62 = !DILocation(line: 46, column: 5, scope: !25)
!63 = !DILocation(line: 47, column: 1, scope: !25)
!64 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_41_goodG2BSink", scope: !1, file: !1, line: 53, type: !15, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!65 = !DILocalVariable(name: "data", arg: 1, scope: !64, file: !1, line: 53, type: !3)
!66 = !DILocation(line: 53, column: 77, scope: !64)
!67 = !DILocation(line: 55, column: 19, scope: !64)
!68 = !DILocation(line: 55, column: 5, scope: !64)
!69 = !DILocation(line: 57, column: 10, scope: !64)
!70 = !DILocation(line: 57, column: 5, scope: !64)
!71 = !DILocation(line: 58, column: 1, scope: !64)
!72 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_41_good", scope: !1, file: !1, line: 85, type: !26, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!73 = !DILocation(line: 87, column: 5, scope: !72)
!74 = !DILocation(line: 88, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 61, type: !26, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!76 = !DILocalVariable(name: "data", scope: !75, file: !1, line: 63, type: !3)
!77 = !DILocation(line: 63, column: 12, scope: !75)
!78 = !DILocation(line: 64, column: 10, scope: !75)
!79 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !1, line: 67, type: !3)
!80 = distinct !DILexicalBlock(scope: !75, file: !1, line: 65, column: 5)
!81 = !DILocation(line: 67, column: 16, scope: !80)
!82 = !DILocation(line: 67, column: 37, scope: !80)
!83 = !DILocation(line: 67, column: 29, scope: !80)
!84 = !DILocation(line: 68, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !1, line: 68, column: 13)
!86 = !DILocation(line: 68, column: 24, scope: !85)
!87 = !DILocation(line: 68, column: 13, scope: !80)
!88 = !DILocation(line: 70, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !1, line: 69, column: 9)
!90 = !DILocation(line: 71, column: 13, scope: !89)
!91 = !DILocalVariable(name: "i", scope: !92, file: !1, line: 74, type: !38)
!92 = distinct !DILexicalBlock(scope: !80, file: !1, line: 73, column: 9)
!93 = !DILocation(line: 74, column: 20, scope: !92)
!94 = !DILocation(line: 75, column: 20, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !1, line: 75, column: 13)
!96 = !DILocation(line: 75, column: 18, scope: !95)
!97 = !DILocation(line: 75, column: 25, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !1, line: 75, column: 13)
!99 = !DILocation(line: 75, column: 27, scope: !98)
!100 = !DILocation(line: 75, column: 13, scope: !95)
!101 = !DILocation(line: 77, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !1, line: 76, column: 13)
!103 = !DILocation(line: 77, column: 28, scope: !102)
!104 = !DILocation(line: 77, column: 31, scope: !102)
!105 = !DILocation(line: 78, column: 13, scope: !102)
!106 = !DILocation(line: 75, column: 35, scope: !98)
!107 = !DILocation(line: 75, column: 13, scope: !98)
!108 = distinct !{!108, !100, !109, !58}
!109 = !DILocation(line: 78, column: 13, scope: !95)
!110 = !DILocation(line: 80, column: 16, scope: !80)
!111 = !DILocation(line: 80, column: 14, scope: !80)
!112 = !DILocation(line: 82, column: 69, scope: !75)
!113 = !DILocation(line: 82, column: 5, scope: !75)
!114 = !DILocation(line: 83, column: 1, scope: !75)
