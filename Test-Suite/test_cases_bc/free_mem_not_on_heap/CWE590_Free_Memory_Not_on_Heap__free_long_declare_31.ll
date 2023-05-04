; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_declare_31.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_declare_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_declare_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i64* null, i64** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i64* %i, metadata !27, metadata !DIExpression()), !dbg !32
  store i64 0, i64* %i, align 8, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !36
  %cmp = icmp ult i64 %0, 100, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !40
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %1, !dbg !42
  store i64 5, i64* %arrayidx, align 8, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !45
  %inc = add i64 %2, 1, !dbg !45
  store i64 %inc, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !50
  store i64* %arraydecay, i64** %data, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !52, metadata !DIExpression()), !dbg !54
  %3 = load i64*, i64** %data, align 8, !dbg !55
  store i64* %3, i64** %dataCopy, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !56, metadata !DIExpression()), !dbg !57
  %4 = load i64*, i64** %dataCopy, align 8, !dbg !58
  store i64* %4, i64** %data1, align 8, !dbg !57
  %5 = load i64*, i64** %data1, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds i64, i64* %5, i64 0, !dbg !59
  %6 = load i64, i64* %arrayidx2, align 8, !dbg !59
  call void @printLongLine(i64 noundef %6), !dbg !60
  %7 = load i64*, i64** %data1, align 8, !dbg !61
  %8 = bitcast i64* %7 to i8*, !dbg !61
  call void @free(i8* noundef %8) #5, !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_declare_31_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !67 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %dataCopy = alloca i64*, align 8
  %data2 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i64* null, i64** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !73
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !74
  %0 = bitcast i8* %call to i64*, !dbg !75
  store i64* %0, i64** %dataBuffer, align 8, !dbg !73
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !76
  %cmp = icmp eq i64* %1, null, !dbg !78
  br i1 %cmp, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @exit(i32 noundef 1) #6, !dbg !82
  unreachable, !dbg !82

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !83, metadata !DIExpression()), !dbg !85
  store i64 0, i64* %i, align 8, !dbg !86
  br label %for.cond, !dbg !88

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !89
  %cmp1 = icmp ult i64 %2, 100, !dbg !91
  br i1 %cmp1, label %for.body, label %for.end, !dbg !92

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !93
  %4 = load i64, i64* %i, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !93
  store i64 5, i64* %arrayidx, align 8, !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !98
  %inc = add i64 %5, 1, !dbg !98
  store i64 %inc, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !102
  store i64* %6, i64** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !104, metadata !DIExpression()), !dbg !106
  %7 = load i64*, i64** %data, align 8, !dbg !107
  store i64* %7, i64** %dataCopy, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !108, metadata !DIExpression()), !dbg !109
  %8 = load i64*, i64** %dataCopy, align 8, !dbg !110
  store i64* %8, i64** %data2, align 8, !dbg !109
  %9 = load i64*, i64** %data2, align 8, !dbg !111
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !111
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !111
  call void @printLongLine(i64 noundef %10), !dbg !112
  %11 = load i64*, i64** %data2, align 8, !dbg !113
  %12 = bitcast i64* %11 to i8*, !dbg !113
  call void @free(i8* noundef %12) #5, !dbg !114
  ret void, !dbg !115
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_31.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "cf9b16d7986b0dbb53e866a8e64e3030")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_31_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !1, line: 29, type: !23)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 27, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 29, column: 14, scope: !22)
!27 = !DILocalVariable(name: "i", scope: !28, file: !1, line: 31, type: !29)
!28 = distinct !DILexicalBlock(scope: !22, file: !1, line: 30, column: 9)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !30, line: 46, baseType: !31)
!30 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!31 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 31, column: 20, scope: !28)
!33 = !DILocation(line: 32, column: 20, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !1, line: 32, column: 13)
!35 = !DILocation(line: 32, column: 18, scope: !34)
!36 = !DILocation(line: 32, column: 25, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !1, line: 32, column: 13)
!38 = !DILocation(line: 32, column: 27, scope: !37)
!39 = !DILocation(line: 32, column: 13, scope: !34)
!40 = !DILocation(line: 34, column: 28, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !1, line: 33, column: 13)
!42 = !DILocation(line: 34, column: 17, scope: !41)
!43 = !DILocation(line: 34, column: 31, scope: !41)
!44 = !DILocation(line: 35, column: 13, scope: !41)
!45 = !DILocation(line: 32, column: 35, scope: !37)
!46 = !DILocation(line: 32, column: 13, scope: !37)
!47 = distinct !{!47, !39, !48, !49}
!48 = !DILocation(line: 35, column: 13, scope: !34)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocation(line: 37, column: 16, scope: !22)
!51 = !DILocation(line: 37, column: 14, scope: !22)
!52 = !DILocalVariable(name: "dataCopy", scope: !53, file: !1, line: 40, type: !3)
!53 = distinct !DILexicalBlock(scope: !14, file: !1, line: 39, column: 5)
!54 = !DILocation(line: 40, column: 16, scope: !53)
!55 = !DILocation(line: 40, column: 27, scope: !53)
!56 = !DILocalVariable(name: "data", scope: !53, file: !1, line: 41, type: !3)
!57 = !DILocation(line: 41, column: 16, scope: !53)
!58 = !DILocation(line: 41, column: 23, scope: !53)
!59 = !DILocation(line: 42, column: 23, scope: !53)
!60 = !DILocation(line: 42, column: 9, scope: !53)
!61 = !DILocation(line: 44, column: 14, scope: !53)
!62 = !DILocation(line: 44, column: 9, scope: !53)
!63 = !DILocation(line: 46, column: 1, scope: !14)
!64 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_31_good", scope: !1, file: !1, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!65 = !DILocation(line: 85, column: 5, scope: !64)
!66 = !DILocation(line: 86, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!68 = !DILocalVariable(name: "data", scope: !67, file: !1, line: 55, type: !3)
!69 = !DILocation(line: 55, column: 12, scope: !67)
!70 = !DILocation(line: 56, column: 10, scope: !67)
!71 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !1, line: 59, type: !3)
!72 = distinct !DILexicalBlock(scope: !67, file: !1, line: 57, column: 5)
!73 = !DILocation(line: 59, column: 16, scope: !72)
!74 = !DILocation(line: 59, column: 37, scope: !72)
!75 = !DILocation(line: 59, column: 29, scope: !72)
!76 = !DILocation(line: 60, column: 13, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !1, line: 60, column: 13)
!78 = !DILocation(line: 60, column: 24, scope: !77)
!79 = !DILocation(line: 60, column: 13, scope: !72)
!80 = !DILocation(line: 62, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !1, line: 61, column: 9)
!82 = !DILocation(line: 63, column: 13, scope: !81)
!83 = !DILocalVariable(name: "i", scope: !84, file: !1, line: 66, type: !29)
!84 = distinct !DILexicalBlock(scope: !72, file: !1, line: 65, column: 9)
!85 = !DILocation(line: 66, column: 20, scope: !84)
!86 = !DILocation(line: 67, column: 20, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !1, line: 67, column: 13)
!88 = !DILocation(line: 67, column: 18, scope: !87)
!89 = !DILocation(line: 67, column: 25, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !1, line: 67, column: 13)
!91 = !DILocation(line: 67, column: 27, scope: !90)
!92 = !DILocation(line: 67, column: 13, scope: !87)
!93 = !DILocation(line: 69, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !1, line: 68, column: 13)
!95 = !DILocation(line: 69, column: 28, scope: !94)
!96 = !DILocation(line: 69, column: 31, scope: !94)
!97 = !DILocation(line: 70, column: 13, scope: !94)
!98 = !DILocation(line: 67, column: 35, scope: !90)
!99 = !DILocation(line: 67, column: 13, scope: !90)
!100 = distinct !{!100, !92, !101, !49}
!101 = !DILocation(line: 70, column: 13, scope: !87)
!102 = !DILocation(line: 72, column: 16, scope: !72)
!103 = !DILocation(line: 72, column: 14, scope: !72)
!104 = !DILocalVariable(name: "dataCopy", scope: !105, file: !1, line: 75, type: !3)
!105 = distinct !DILexicalBlock(scope: !67, file: !1, line: 74, column: 5)
!106 = !DILocation(line: 75, column: 16, scope: !105)
!107 = !DILocation(line: 75, column: 27, scope: !105)
!108 = !DILocalVariable(name: "data", scope: !105, file: !1, line: 76, type: !3)
!109 = !DILocation(line: 76, column: 16, scope: !105)
!110 = !DILocation(line: 76, column: 23, scope: !105)
!111 = !DILocation(line: 77, column: 23, scope: !105)
!112 = !DILocation(line: 77, column: 9, scope: !105)
!113 = !DILocation(line: 79, column: 14, scope: !105)
!114 = !DILocation(line: 79, column: 9, scope: !105)
!115 = !DILocation(line: 81, column: 1, scope: !67)
