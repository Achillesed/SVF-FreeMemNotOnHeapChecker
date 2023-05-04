; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_41.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_41_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_41_badSink(i64* noundef %data) #0 !dbg !28 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = load i64*, i64** %data.addr, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0, !dbg !33
  %1 = load i64, i64* %arrayidx, align 8, !dbg !33
  call void @printLongLongLine(i64 noundef %1), !dbg !34
  %2 = load i64*, i64** %data.addr, align 8, !dbg !35
  %3 = bitcast i64* %2 to i8*, !dbg !35
  call void @free(i8* noundef %3) #5, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_41_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !38, metadata !DIExpression()), !dbg !39
  store i64* null, i64** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %0, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_41_bad.dataBuffer, i64 0, i64 %1, !dbg !57
  store i64 5, i64* %arrayidx, align 8, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %2, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_41_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !65
  %3 = load i64*, i64** %data, align 8, !dbg !66
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_41_badSink(i64* noundef %3), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_41_goodG2BSink(i64* noundef %data) #0 !dbg !69 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = load i64*, i64** %data.addr, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0, !dbg !72
  %1 = load i64, i64* %arrayidx, align 8, !dbg !72
  call void @printLongLongLine(i64 noundef %1), !dbg !73
  %2 = load i64*, i64** %data.addr, align 8, !dbg !74
  %3 = bitcast i64* %2 to i8*, !dbg !74
  call void @free(i8* noundef %3) #5, !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_41_good() #0 !dbg !77 {
entry:
  call void @goodG2B(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i64* null, i64** %data, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !84, metadata !DIExpression()), !dbg !86
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !87
  %0 = bitcast i8* %call to i64*, !dbg !88
  store i64* %0, i64** %dataBuffer, align 8, !dbg !86
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !89
  %cmp = icmp eq i64* %1, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @exit(i32 noundef 1) #6, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !96, metadata !DIExpression()), !dbg !98
  store i64 0, i64* %i, align 8, !dbg !99
  br label %for.cond, !dbg !101

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !102
  %cmp1 = icmp ult i64 %2, 100, !dbg !104
  br i1 %cmp1, label %for.body, label %for.end, !dbg !105

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !106
  %4 = load i64, i64* %i, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !106
  store i64 5, i64* %arrayidx, align 8, !dbg !109
  br label %for.inc, !dbg !110

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !111
  %inc = add i64 %5, 1, !dbg !111
  store i64 %inc, i64* %i, align 8, !dbg !111
  br label %for.cond, !dbg !112, !llvm.loop !113

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !115
  store i64* %6, i64** %data, align 8, !dbg !116
  %7 = load i64*, i64** %data, align 8, !dbg !117
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_41_goodG2BSink(i64* noundef %7), !dbg !118
  ret void, !dbg !119
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

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!20, !21, !22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 36, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_41_bad", scope: !3, file: !3, line: 30, type: !4, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_41.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "6448b2be59a7f650f0188cf445d0743a")
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
!15 = !{!0}
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
!28 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_41_badSink", scope: !3, file: !3, line: 23, type: !29, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!29 = !DISubroutineType(types: !30)
!30 = !{null, !8}
!31 = !DILocalVariable(name: "data", arg: 1, scope: !28, file: !3, line: 23, type: !8)
!32 = !DILocation(line: 23, column: 79, scope: !28)
!33 = !DILocation(line: 25, column: 23, scope: !28)
!34 = !DILocation(line: 25, column: 5, scope: !28)
!35 = !DILocation(line: 27, column: 10, scope: !28)
!36 = !DILocation(line: 27, column: 5, scope: !28)
!37 = !DILocation(line: 28, column: 1, scope: !28)
!38 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 32, type: !8)
!39 = !DILocation(line: 32, column: 15, scope: !2)
!40 = !DILocation(line: 33, column: 10, scope: !2)
!41 = !DILocalVariable(name: "i", scope: !42, file: !3, line: 38, type: !44)
!42 = distinct !DILexicalBlock(scope: !43, file: !3, line: 37, column: 9)
!43 = distinct !DILexicalBlock(scope: !2, file: !3, line: 34, column: 5)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 38, column: 20, scope: !42)
!48 = !DILocation(line: 39, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !42, file: !3, line: 39, column: 13)
!50 = !DILocation(line: 39, column: 18, scope: !49)
!51 = !DILocation(line: 39, column: 25, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !3, line: 39, column: 13)
!53 = !DILocation(line: 39, column: 27, scope: !52)
!54 = !DILocation(line: 39, column: 13, scope: !49)
!55 = !DILocation(line: 41, column: 28, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !3, line: 40, column: 13)
!57 = !DILocation(line: 41, column: 17, scope: !56)
!58 = !DILocation(line: 41, column: 31, scope: !56)
!59 = !DILocation(line: 42, column: 13, scope: !56)
!60 = !DILocation(line: 39, column: 35, scope: !52)
!61 = !DILocation(line: 39, column: 13, scope: !52)
!62 = distinct !{!62, !54, !63, !64}
!63 = !DILocation(line: 42, column: 13, scope: !49)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 44, column: 14, scope: !43)
!66 = !DILocation(line: 46, column: 68, scope: !2)
!67 = !DILocation(line: 46, column: 5, scope: !2)
!68 = !DILocation(line: 47, column: 1, scope: !2)
!69 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_41_goodG2BSink", scope: !3, file: !3, line: 53, type: !29, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!70 = !DILocalVariable(name: "data", arg: 1, scope: !69, file: !3, line: 53, type: !8)
!71 = !DILocation(line: 53, column: 83, scope: !69)
!72 = !DILocation(line: 55, column: 23, scope: !69)
!73 = !DILocation(line: 55, column: 5, scope: !69)
!74 = !DILocation(line: 57, column: 10, scope: !69)
!75 = !DILocation(line: 57, column: 5, scope: !69)
!76 = !DILocation(line: 58, column: 1, scope: !69)
!77 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_41_good", scope: !3, file: !3, line: 85, type: !4, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!78 = !DILocation(line: 87, column: 5, scope: !77)
!79 = !DILocation(line: 88, column: 1, scope: !77)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 61, type: !4, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!81 = !DILocalVariable(name: "data", scope: !80, file: !3, line: 63, type: !8)
!82 = !DILocation(line: 63, column: 15, scope: !80)
!83 = !DILocation(line: 64, column: 10, scope: !80)
!84 = !DILocalVariable(name: "dataBuffer", scope: !85, file: !3, line: 67, type: !8)
!85 = distinct !DILexicalBlock(scope: !80, file: !3, line: 65, column: 5)
!86 = !DILocation(line: 67, column: 19, scope: !85)
!87 = !DILocation(line: 67, column: 43, scope: !85)
!88 = !DILocation(line: 67, column: 32, scope: !85)
!89 = !DILocation(line: 68, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !3, line: 68, column: 13)
!91 = !DILocation(line: 68, column: 24, scope: !90)
!92 = !DILocation(line: 68, column: 13, scope: !85)
!93 = !DILocation(line: 70, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !3, line: 69, column: 9)
!95 = !DILocation(line: 71, column: 13, scope: !94)
!96 = !DILocalVariable(name: "i", scope: !97, file: !3, line: 74, type: !44)
!97 = distinct !DILexicalBlock(scope: !85, file: !3, line: 73, column: 9)
!98 = !DILocation(line: 74, column: 20, scope: !97)
!99 = !DILocation(line: 75, column: 20, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !3, line: 75, column: 13)
!101 = !DILocation(line: 75, column: 18, scope: !100)
!102 = !DILocation(line: 75, column: 25, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !3, line: 75, column: 13)
!104 = !DILocation(line: 75, column: 27, scope: !103)
!105 = !DILocation(line: 75, column: 13, scope: !100)
!106 = !DILocation(line: 77, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !3, line: 76, column: 13)
!108 = !DILocation(line: 77, column: 28, scope: !107)
!109 = !DILocation(line: 77, column: 31, scope: !107)
!110 = !DILocation(line: 78, column: 13, scope: !107)
!111 = !DILocation(line: 75, column: 35, scope: !103)
!112 = !DILocation(line: 75, column: 13, scope: !103)
!113 = distinct !{!113, !105, !114, !64}
!114 = !DILocation(line: 78, column: 13, scope: !100)
!115 = !DILocation(line: 80, column: 16, scope: !85)
!116 = !DILocation(line: 80, column: 14, scope: !85)
!117 = !DILocation(line: 82, column: 72, scope: !80)
!118 = !DILocation(line: 82, column: 5, scope: !80)
!119 = !DILocation(line: 83, column: 1, scope: !80)
