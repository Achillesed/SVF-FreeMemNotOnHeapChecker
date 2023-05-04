; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_45.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_45_badData = internal global i64* null, align 8, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1
@CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_45_goodG2BData = internal global i64* null, align 8, !dbg !13

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_45_bad() #0 !dbg !23 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i64* null, i64** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %0, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %1, !dbg !51
  store i64 5, i64* %arrayidx, align 8, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %2, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !59
  store i64* %arraydecay, i64** %data, align 8, !dbg !60
  %3 = load i64*, i64** %data, align 8, !dbg !61
  store i64* %3, i64** @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_45_badData, align 8, !dbg !62
  call void @badSink(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_45_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink() #0 !dbg !68 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = load i64*, i64** @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_45_badData, align 8, !dbg !71
  store i64* %0, i64** %data, align 8, !dbg !70
  %1 = load i64*, i64** %data, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 0, !dbg !72
  %2 = load i64, i64* %arrayidx, align 8, !dbg !72
  call void @printLongLongLine(i64 noundef %2), !dbg !73
  %3 = load i64*, i64** %data, align 8, !dbg !74
  %4 = bitcast i64* %3 to i8*, !dbg !74
  call void @free(i8* noundef %4) #5, !dbg !75
  ret void, !dbg !76
}

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i64* null, i64** %data, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !83
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !84
  %0 = bitcast i8* %call to i64*, !dbg !85
  store i64* %0, i64** %dataBuffer, align 8, !dbg !83
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !86
  %cmp = icmp eq i64* %1, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @exit(i32 noundef 1) #6, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !93, metadata !DIExpression()), !dbg !95
  store i64 0, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !99
  %cmp1 = icmp ult i64 %2, 100, !dbg !101
  br i1 %cmp1, label %for.body, label %for.end, !dbg !102

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !103
  %4 = load i64, i64* %i, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !103
  store i64 5, i64* %arrayidx, align 8, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !108
  %inc = add i64 %5, 1, !dbg !108
  store i64 %inc, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !112
  store i64* %6, i64** %data, align 8, !dbg !113
  %7 = load i64*, i64** %data, align 8, !dbg !114
  store i64* %7, i64** @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_45_goodG2BData, align 8, !dbg !115
  call void @goodG2BSink(), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink() #0 !dbg !118 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = load i64*, i64** @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_45_goodG2BData, align 8, !dbg !121
  store i64* %0, i64** %data, align 8, !dbg !120
  %1 = load i64*, i64** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 0, !dbg !122
  %2 = load i64, i64* %arrayidx, align 8, !dbg !122
  call void @printLongLongLine(i64 noundef %2), !dbg !123
  %3 = load i64*, i64** %data, align 8, !dbg !124
  %4 = bitcast i64* %3 to i8*, !dbg !124
  call void @free(i8* noundef %4) #5, !dbg !125
  ret void, !dbg !126
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_45_badData", scope: !2, file: !3, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_45.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "68e74517b131382ef3ec7a1782e479be")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!10 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_45_goodG2BData", scope: !2, file: !3, line: 22, type: !5, isLocal: true, isDefinition: true)
!15 = !{i32 7, !"Dwarf Version", i32 5}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{i32 7, !"PIE Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!23 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_45_bad", scope: !3, file: !3, line: 34, type: !24, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !3, line: 36, type: !5)
!28 = !DILocation(line: 36, column: 15, scope: !23)
!29 = !DILocation(line: 37, column: 10, scope: !23)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !3, line: 40, type: !32)
!31 = distinct !DILexicalBlock(scope: !23, file: !3, line: 38, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 40, column: 17, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !37, file: !3, line: 42, type: !38)
!37 = distinct !DILexicalBlock(scope: !31, file: !3, line: 41, column: 9)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 42, column: 20, scope: !37)
!42 = !DILocation(line: 43, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !3, line: 43, column: 13)
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
!59 = !DILocation(line: 48, column: 16, scope: !31)
!60 = !DILocation(line: 48, column: 14, scope: !31)
!61 = !DILocation(line: 50, column: 71, scope: !23)
!62 = !DILocation(line: 50, column: 69, scope: !23)
!63 = !DILocation(line: 51, column: 5, scope: !23)
!64 = !DILocation(line: 52, column: 1, scope: !23)
!65 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_45_good", scope: !3, file: !3, line: 92, type: !24, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!66 = !DILocation(line: 94, column: 5, scope: !65)
!67 = !DILocation(line: 95, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "badSink", scope: !3, file: !3, line: 26, type: !24, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!69 = !DILocalVariable(name: "data", scope: !68, file: !3, line: 28, type: !5)
!70 = !DILocation(line: 28, column: 15, scope: !68)
!71 = !DILocation(line: 28, column: 22, scope: !68)
!72 = !DILocation(line: 29, column: 23, scope: !68)
!73 = !DILocation(line: 29, column: 5, scope: !68)
!74 = !DILocation(line: 31, column: 10, scope: !68)
!75 = !DILocation(line: 31, column: 5, scope: !68)
!76 = !DILocation(line: 32, column: 1, scope: !68)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 67, type: !24, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!78 = !DILocalVariable(name: "data", scope: !77, file: !3, line: 69, type: !5)
!79 = !DILocation(line: 69, column: 15, scope: !77)
!80 = !DILocation(line: 70, column: 10, scope: !77)
!81 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !3, line: 73, type: !5)
!82 = distinct !DILexicalBlock(scope: !77, file: !3, line: 71, column: 5)
!83 = !DILocation(line: 73, column: 19, scope: !82)
!84 = !DILocation(line: 73, column: 43, scope: !82)
!85 = !DILocation(line: 73, column: 32, scope: !82)
!86 = !DILocation(line: 74, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !3, line: 74, column: 13)
!88 = !DILocation(line: 74, column: 24, scope: !87)
!89 = !DILocation(line: 74, column: 13, scope: !82)
!90 = !DILocation(line: 76, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !3, line: 75, column: 9)
!92 = !DILocation(line: 77, column: 13, scope: !91)
!93 = !DILocalVariable(name: "i", scope: !94, file: !3, line: 80, type: !38)
!94 = distinct !DILexicalBlock(scope: !82, file: !3, line: 79, column: 9)
!95 = !DILocation(line: 80, column: 20, scope: !94)
!96 = !DILocation(line: 81, column: 20, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !3, line: 81, column: 13)
!98 = !DILocation(line: 81, column: 18, scope: !97)
!99 = !DILocation(line: 81, column: 25, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !3, line: 81, column: 13)
!101 = !DILocation(line: 81, column: 27, scope: !100)
!102 = !DILocation(line: 81, column: 13, scope: !97)
!103 = !DILocation(line: 83, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !3, line: 82, column: 13)
!105 = !DILocation(line: 83, column: 28, scope: !104)
!106 = !DILocation(line: 83, column: 31, scope: !104)
!107 = !DILocation(line: 84, column: 13, scope: !104)
!108 = !DILocation(line: 81, column: 35, scope: !100)
!109 = !DILocation(line: 81, column: 13, scope: !100)
!110 = distinct !{!110, !102, !111, !58}
!111 = !DILocation(line: 84, column: 13, scope: !97)
!112 = !DILocation(line: 86, column: 16, scope: !82)
!113 = !DILocation(line: 86, column: 14, scope: !82)
!114 = !DILocation(line: 88, column: 75, scope: !77)
!115 = !DILocation(line: 88, column: 73, scope: !77)
!116 = !DILocation(line: 89, column: 5, scope: !77)
!117 = !DILocation(line: 90, column: 1, scope: !77)
!118 = distinct !DISubprogram(name: "goodG2BSink", scope: !3, file: !3, line: 59, type: !24, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!119 = !DILocalVariable(name: "data", scope: !118, file: !3, line: 61, type: !5)
!120 = !DILocation(line: 61, column: 15, scope: !118)
!121 = !DILocation(line: 61, column: 22, scope: !118)
!122 = !DILocation(line: 62, column: 23, scope: !118)
!123 = !DILocation(line: 62, column: 5, scope: !118)
!124 = !DILocation(line: 64, column: 10, scope: !118)
!125 = !DILocation(line: 64, column: 5, scope: !118)
!126 = !DILocation(line: 65, column: 1, scope: !118)
