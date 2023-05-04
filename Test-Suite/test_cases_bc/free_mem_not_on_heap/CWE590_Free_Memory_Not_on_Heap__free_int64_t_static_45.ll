; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45_badData = internal global i64* null, align 8, !dbg !16
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1
@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45_goodG2BData = internal global i64* null, align 8, !dbg !18

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !32, metadata !DIExpression()), !dbg !33
  store i64* null, i64** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %0, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45_bad.dataBuffer, i64 0, i64 %1, !dbg !51
  store i64 5, i64* %arrayidx, align 8, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %2, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !59
  %3 = load i64*, i64** %data, align 8, !dbg !60
  store i64* %3, i64** @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45_badData, align 8, !dbg !61
  call void @badSink(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink() #0 !dbg !67 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i64*, i64** @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45_badData, align 8, !dbg !70
  store i64* %0, i64** %data, align 8, !dbg !69
  %1 = load i64*, i64** %data, align 8, !dbg !71
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 0, !dbg !71
  %2 = load i64, i64* %arrayidx, align 8, !dbg !71
  call void @printLongLongLine(i64 noundef %2), !dbg !72
  %3 = load i64*, i64** %data, align 8, !dbg !73
  %4 = bitcast i64* %3 to i8*, !dbg !73
  call void @free(i8* noundef %4) #5, !dbg !74
  ret void, !dbg !75
}

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i64* null, i64** %data, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !82
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !83
  %0 = bitcast i8* %call to i64*, !dbg !84
  store i64* %0, i64** %dataBuffer, align 8, !dbg !82
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !85
  %cmp = icmp eq i64* %1, null, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @exit(i32 noundef 1) #6, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !92, metadata !DIExpression()), !dbg !94
  store i64 0, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !97

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !98
  %cmp1 = icmp ult i64 %2, 100, !dbg !100
  br i1 %cmp1, label %for.body, label %for.end, !dbg !101

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !102
  %4 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !102
  store i64 5, i64* %arrayidx, align 8, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !107
  %inc = add i64 %5, 1, !dbg !107
  store i64 %inc, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !111
  store i64* %6, i64** %data, align 8, !dbg !112
  %7 = load i64*, i64** %data, align 8, !dbg !113
  store i64* %7, i64** @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45_goodG2BData, align 8, !dbg !114
  call void @goodG2BSink(), !dbg !115
  ret void, !dbg !116
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink() #0 !dbg !117 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !118, metadata !DIExpression()), !dbg !119
  %0 = load i64*, i64** @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45_goodG2BData, align 8, !dbg !120
  store i64* %0, i64** %data, align 8, !dbg !119
  %1 = load i64*, i64** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 0, !dbg !121
  %2 = load i64, i64* %arrayidx, align 8, !dbg !121
  call void @printLongLongLine(i64 noundef %2), !dbg !122
  %3 = load i64*, i64** %data, align 8, !dbg !123
  %4 = bitcast i64* %3 to i8*, !dbg !123
  call void @free(i8* noundef %4) #5, !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29, !30}
!llvm.ident = !{!31}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 40, type: !21, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45_bad", scope: !3, file: !3, line: 34, type: !4, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !20)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "88858f51ad9c73ad13909dba308fd903")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !15, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !14}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !10, line: 27, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !12, line: 44, baseType: !13)
!12 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!13 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !{!0, !16, !18}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45_badData", scope: !6, file: !3, line: 21, type: !8, isLocal: true, isDefinition: true)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45_goodG2BData", scope: !6, file: !3, line: 22, type: !8, isLocal: true, isDefinition: true)
!20 = !{}
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 6400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !{i32 7, !"Dwarf Version", i32 5}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{i32 1, !"wchar_size", i32 4}
!27 = !{i32 7, !"PIC Level", i32 2}
!28 = !{i32 7, !"PIE Level", i32 2}
!29 = !{i32 7, !"uwtable", i32 1}
!30 = !{i32 7, !"frame-pointer", i32 2}
!31 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!32 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 36, type: !8)
!33 = !DILocation(line: 36, column: 15, scope: !2)
!34 = !DILocation(line: 37, column: 10, scope: !2)
!35 = !DILocalVariable(name: "i", scope: !36, file: !3, line: 42, type: !38)
!36 = distinct !DILexicalBlock(scope: !37, file: !3, line: 41, column: 9)
!37 = distinct !DILexicalBlock(scope: !2, file: !3, line: 38, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 42, column: 20, scope: !36)
!42 = !DILocation(line: 43, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !36, file: !3, line: 43, column: 13)
!44 = !DILocation(line: 43, column: 18, scope: !43)
!45 = !DILocation(line: 43, column: 25, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !3, line: 43, column: 13)
!47 = !DILocation(line: 43, column: 27, scope: !46)
!48 = !DILocation(line: 43, column: 13, scope: !43)
!49 = !DILocation(line: 45, column: 28, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !3, line: 44, column: 13)
!51 = !DILocation(line: 45, column: 17, scope: !50)
!52 = !DILocation(line: 45, column: 31, scope: !50)
!53 = !DILocation(line: 46, column: 13, scope: !50)
!54 = !DILocation(line: 43, column: 35, scope: !46)
!55 = !DILocation(line: 43, column: 13, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 46, column: 13, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 48, column: 14, scope: !37)
!60 = !DILocation(line: 50, column: 70, scope: !2)
!61 = !DILocation(line: 50, column: 68, scope: !2)
!62 = !DILocation(line: 51, column: 5, scope: !2)
!63 = !DILocation(line: 52, column: 1, scope: !2)
!64 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_45_good", scope: !3, file: !3, line: 92, type: !4, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !20)
!65 = !DILocation(line: 94, column: 5, scope: !64)
!66 = !DILocation(line: 95, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "badSink", scope: !3, file: !3, line: 26, type: !4, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !20)
!68 = !DILocalVariable(name: "data", scope: !67, file: !3, line: 28, type: !8)
!69 = !DILocation(line: 28, column: 15, scope: !67)
!70 = !DILocation(line: 28, column: 22, scope: !67)
!71 = !DILocation(line: 29, column: 23, scope: !67)
!72 = !DILocation(line: 29, column: 5, scope: !67)
!73 = !DILocation(line: 31, column: 10, scope: !67)
!74 = !DILocation(line: 31, column: 5, scope: !67)
!75 = !DILocation(line: 32, column: 1, scope: !67)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 67, type: !4, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !20)
!77 = !DILocalVariable(name: "data", scope: !76, file: !3, line: 69, type: !8)
!78 = !DILocation(line: 69, column: 15, scope: !76)
!79 = !DILocation(line: 70, column: 10, scope: !76)
!80 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !3, line: 73, type: !8)
!81 = distinct !DILexicalBlock(scope: !76, file: !3, line: 71, column: 5)
!82 = !DILocation(line: 73, column: 19, scope: !81)
!83 = !DILocation(line: 73, column: 43, scope: !81)
!84 = !DILocation(line: 73, column: 32, scope: !81)
!85 = !DILocation(line: 74, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !3, line: 74, column: 13)
!87 = !DILocation(line: 74, column: 24, scope: !86)
!88 = !DILocation(line: 74, column: 13, scope: !81)
!89 = !DILocation(line: 76, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !3, line: 75, column: 9)
!91 = !DILocation(line: 77, column: 13, scope: !90)
!92 = !DILocalVariable(name: "i", scope: !93, file: !3, line: 80, type: !38)
!93 = distinct !DILexicalBlock(scope: !81, file: !3, line: 79, column: 9)
!94 = !DILocation(line: 80, column: 20, scope: !93)
!95 = !DILocation(line: 81, column: 20, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !3, line: 81, column: 13)
!97 = !DILocation(line: 81, column: 18, scope: !96)
!98 = !DILocation(line: 81, column: 25, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !3, line: 81, column: 13)
!100 = !DILocation(line: 81, column: 27, scope: !99)
!101 = !DILocation(line: 81, column: 13, scope: !96)
!102 = !DILocation(line: 83, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !3, line: 82, column: 13)
!104 = !DILocation(line: 83, column: 28, scope: !103)
!105 = !DILocation(line: 83, column: 31, scope: !103)
!106 = !DILocation(line: 84, column: 13, scope: !103)
!107 = !DILocation(line: 81, column: 35, scope: !99)
!108 = !DILocation(line: 81, column: 13, scope: !99)
!109 = distinct !{!109, !101, !110, !58}
!110 = !DILocation(line: 84, column: 13, scope: !96)
!111 = !DILocation(line: 86, column: 16, scope: !81)
!112 = !DILocation(line: 86, column: 14, scope: !81)
!113 = !DILocation(line: 88, column: 74, scope: !76)
!114 = !DILocation(line: 88, column: 72, scope: !76)
!115 = !DILocation(line: 89, column: 5, scope: !76)
!116 = !DILocation(line: 90, column: 1, scope: !76)
!117 = distinct !DISubprogram(name: "goodG2BSink", scope: !3, file: !3, line: 59, type: !4, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !20)
!118 = !DILocalVariable(name: "data", scope: !117, file: !3, line: 61, type: !8)
!119 = !DILocation(line: 61, column: 15, scope: !117)
!120 = !DILocation(line: 61, column: 22, scope: !117)
!121 = !DILocation(line: 62, column: 23, scope: !117)
!122 = !DILocation(line: 62, column: 5, scope: !117)
!123 = !DILocation(line: 64, column: 10, scope: !117)
!124 = !DILocation(line: 64, column: 5, scope: !117)
!125 = !DILocation(line: 65, column: 1, scope: !117)
