; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_alloca_45.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_long_alloca_45_badData = internal global i64* null, align 8, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1
@CWE590_Free_Memory_Not_on_Heap__free_long_alloca_45_goodG2BData = internal global i64* null, align 8, !dbg !9

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i64* null, i64** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 800, align 16, !dbg !29
  %1 = bitcast i8* %0 to i64*, !dbg !30
  store i64* %1, i64** %dataBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !40
  %cmp = icmp ult i64 %2, 100, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !44
  %4 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !44
  store i64 5, i64* %arrayidx, align 8, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %5, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !54
  store i64* %6, i64** %data, align 8, !dbg !55
  %7 = load i64*, i64** %data, align 8, !dbg !56
  store i64* %7, i64** @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_45_badData, align 8, !dbg !57
  call void @badSink(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_45_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink() #0 !dbg !63 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i64*, i64** @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_45_badData, align 8, !dbg !66
  store i64* %0, i64** %data, align 8, !dbg !65
  %1 = load i64*, i64** %data, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 0, !dbg !67
  %2 = load i64, i64* %arrayidx, align 8, !dbg !67
  call void @printLongLine(i64 noundef %2), !dbg !68
  %3 = load i64*, i64** %data, align 8, !dbg !69
  %4 = bitcast i64* %3 to i8*, !dbg !69
  call void @free(i8* noundef %4) #5, !dbg !70
  ret void, !dbg !71
}

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !72 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i64* null, i64** %data, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !78
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !79
  %0 = bitcast i8* %call to i64*, !dbg !80
  store i64* %0, i64** %dataBuffer, align 8, !dbg !78
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !81
  %cmp = icmp eq i64* %1, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @exit(i32 noundef 1) #6, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !88, metadata !DIExpression()), !dbg !90
  store i64 0, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !94
  %cmp1 = icmp ult i64 %2, 100, !dbg !96
  br i1 %cmp1, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !98
  %4 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !98
  store i64 5, i64* %arrayidx, align 8, !dbg !101
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !103
  %inc = add i64 %5, 1, !dbg !103
  store i64 %inc, i64* %i, align 8, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !107
  store i64* %6, i64** %data, align 8, !dbg !108
  %7 = load i64*, i64** %data, align 8, !dbg !109
  store i64* %7, i64** @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_45_goodG2BData, align 8, !dbg !110
  call void @goodG2BSink(), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink() #0 !dbg !113 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = load i64*, i64** @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_45_goodG2BData, align 8, !dbg !116
  store i64* %0, i64** %data, align 8, !dbg !115
  %1 = load i64*, i64** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 0, !dbg !117
  %2 = load i64, i64* %arrayidx, align 8, !dbg !117
  call void @printLongLine(i64 noundef %2), !dbg !118
  %3 = load i64*, i64** %data, align 8, !dbg !119
  %4 = bitcast i64* %3 to i8*, !dbg !119
  call void @free(i8* noundef %4) #5, !dbg !120
  ret void, !dbg !121
}

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
!1 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_45_badData", scope: !2, file: !3, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_45.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "bb7ca2fad9d648e45180076f7f19c05c")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_45_goodG2BData", scope: !2, file: !3, line: 22, type: !5, isLocal: true, isDefinition: true)
!11 = !{i32 7, !"Dwarf Version", i32 5}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"PIE Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!19 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_45_bad", scope: !3, file: !3, line: 34, type: !20, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !3, line: 36, type: !5)
!24 = !DILocation(line: 36, column: 12, scope: !19)
!25 = !DILocation(line: 37, column: 10, scope: !19)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !3, line: 40, type: !5)
!27 = distinct !DILexicalBlock(scope: !19, file: !3, line: 38, column: 5)
!28 = !DILocation(line: 40, column: 16, scope: !27)
!29 = !DILocation(line: 40, column: 37, scope: !27)
!30 = !DILocation(line: 40, column: 29, scope: !27)
!31 = !DILocalVariable(name: "i", scope: !32, file: !3, line: 42, type: !33)
!32 = distinct !DILexicalBlock(scope: !27, file: !3, line: 41, column: 9)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!35 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 42, column: 20, scope: !32)
!37 = !DILocation(line: 43, column: 20, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !3, line: 43, column: 13)
!39 = !DILocation(line: 43, column: 18, scope: !38)
!40 = !DILocation(line: 43, column: 25, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !3, line: 43, column: 13)
!42 = !DILocation(line: 43, column: 27, scope: !41)
!43 = !DILocation(line: 43, column: 13, scope: !38)
!44 = !DILocation(line: 45, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !3, line: 44, column: 13)
!46 = !DILocation(line: 45, column: 28, scope: !45)
!47 = !DILocation(line: 45, column: 31, scope: !45)
!48 = !DILocation(line: 46, column: 13, scope: !45)
!49 = !DILocation(line: 43, column: 35, scope: !41)
!50 = !DILocation(line: 43, column: 13, scope: !41)
!51 = distinct !{!51, !43, !52, !53}
!52 = !DILocation(line: 46, column: 13, scope: !38)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 48, column: 16, scope: !27)
!55 = !DILocation(line: 48, column: 14, scope: !27)
!56 = !DILocation(line: 50, column: 67, scope: !19)
!57 = !DILocation(line: 50, column: 65, scope: !19)
!58 = !DILocation(line: 51, column: 5, scope: !19)
!59 = !DILocation(line: 52, column: 1, scope: !19)
!60 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_45_good", scope: !3, file: !3, line: 92, type: !20, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!61 = !DILocation(line: 94, column: 5, scope: !60)
!62 = !DILocation(line: 95, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "badSink", scope: !3, file: !3, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!64 = !DILocalVariable(name: "data", scope: !63, file: !3, line: 28, type: !5)
!65 = !DILocation(line: 28, column: 12, scope: !63)
!66 = !DILocation(line: 28, column: 19, scope: !63)
!67 = !DILocation(line: 29, column: 19, scope: !63)
!68 = !DILocation(line: 29, column: 5, scope: !63)
!69 = !DILocation(line: 31, column: 10, scope: !63)
!70 = !DILocation(line: 31, column: 5, scope: !63)
!71 = !DILocation(line: 32, column: 1, scope: !63)
!72 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 67, type: !20, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!73 = !DILocalVariable(name: "data", scope: !72, file: !3, line: 69, type: !5)
!74 = !DILocation(line: 69, column: 12, scope: !72)
!75 = !DILocation(line: 70, column: 10, scope: !72)
!76 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !3, line: 73, type: !5)
!77 = distinct !DILexicalBlock(scope: !72, file: !3, line: 71, column: 5)
!78 = !DILocation(line: 73, column: 16, scope: !77)
!79 = !DILocation(line: 73, column: 37, scope: !77)
!80 = !DILocation(line: 73, column: 29, scope: !77)
!81 = !DILocation(line: 74, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !3, line: 74, column: 13)
!83 = !DILocation(line: 74, column: 24, scope: !82)
!84 = !DILocation(line: 74, column: 13, scope: !77)
!85 = !DILocation(line: 76, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !3, line: 75, column: 9)
!87 = !DILocation(line: 77, column: 13, scope: !86)
!88 = !DILocalVariable(name: "i", scope: !89, file: !3, line: 80, type: !33)
!89 = distinct !DILexicalBlock(scope: !77, file: !3, line: 79, column: 9)
!90 = !DILocation(line: 80, column: 20, scope: !89)
!91 = !DILocation(line: 81, column: 20, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !3, line: 81, column: 13)
!93 = !DILocation(line: 81, column: 18, scope: !92)
!94 = !DILocation(line: 81, column: 25, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !3, line: 81, column: 13)
!96 = !DILocation(line: 81, column: 27, scope: !95)
!97 = !DILocation(line: 81, column: 13, scope: !92)
!98 = !DILocation(line: 83, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !3, line: 82, column: 13)
!100 = !DILocation(line: 83, column: 28, scope: !99)
!101 = !DILocation(line: 83, column: 31, scope: !99)
!102 = !DILocation(line: 84, column: 13, scope: !99)
!103 = !DILocation(line: 81, column: 35, scope: !95)
!104 = !DILocation(line: 81, column: 13, scope: !95)
!105 = distinct !{!105, !97, !106, !53}
!106 = !DILocation(line: 84, column: 13, scope: !92)
!107 = !DILocation(line: 86, column: 16, scope: !77)
!108 = !DILocation(line: 86, column: 14, scope: !77)
!109 = !DILocation(line: 88, column: 71, scope: !72)
!110 = !DILocation(line: 88, column: 69, scope: !72)
!111 = !DILocation(line: 89, column: 5, scope: !72)
!112 = !DILocation(line: 90, column: 1, scope: !72)
!113 = distinct !DISubprogram(name: "goodG2BSink", scope: !3, file: !3, line: 59, type: !20, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!114 = !DILocalVariable(name: "data", scope: !113, file: !3, line: 61, type: !5)
!115 = !DILocation(line: 61, column: 12, scope: !113)
!116 = !DILocation(line: 61, column: 19, scope: !113)
!117 = !DILocation(line: 62, column: 19, scope: !113)
!118 = !DILocation(line: 62, column: 5, scope: !113)
!119 = !DILocation(line: 64, column: 10, scope: !113)
!120 = !DILocation(line: 64, column: 5, scope: !113)
!121 = !DILocation(line: 65, column: 1, scope: !113)
