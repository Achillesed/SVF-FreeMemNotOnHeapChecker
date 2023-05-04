; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_41.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_41_badSink(i64* noundef %data) #0 !dbg !18 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i64*, i64** %data.addr, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0, !dbg !24
  %1 = load i64, i64* %arrayidx, align 8, !dbg !24
  call void @printLongLongLine(i64 noundef %1), !dbg !25
  %2 = load i64*, i64** %data.addr, align 8, !dbg !26
  %3 = bitcast i64* %2 to i8*, !dbg !26
  call void @free(i8* noundef %3) #5, !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_41_bad() #0 !dbg !29 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !32, metadata !DIExpression()), !dbg !33
  store i64* null, i64** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !35, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %0, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %1, !dbg !56
  store i64 5, i64* %arrayidx, align 8, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %2, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !64
  store i64* %arraydecay, i64** %data, align 8, !dbg !65
  %3 = load i64*, i64** %data, align 8, !dbg !66
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_41_badSink(i64* noundef %3), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_41_goodG2BSink(i64* noundef %data) #0 !dbg !69 {
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_41_good() #0 !dbg !77 {
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
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_41_goodG2BSink(i64* noundef %7), !dbg !118
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_41.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "82daad734062665d0abff13a39e0878e")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !5, line: 27, baseType: !6)
!5 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !7, line: 44, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!8 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 5}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"PIE Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_41_badSink", scope: !1, file: !1, line: 23, type: !19, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !3}
!21 = !{}
!22 = !DILocalVariable(name: "data", arg: 1, scope: !18, file: !1, line: 23, type: !3)
!23 = !DILocation(line: 23, column: 80, scope: !18)
!24 = !DILocation(line: 25, column: 23, scope: !18)
!25 = !DILocation(line: 25, column: 5, scope: !18)
!26 = !DILocation(line: 27, column: 10, scope: !18)
!27 = !DILocation(line: 27, column: 5, scope: !18)
!28 = !DILocation(line: 28, column: 1, scope: !18)
!29 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_41_bad", scope: !1, file: !1, line: 30, type: !30, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!30 = !DISubroutineType(types: !31)
!31 = !{null}
!32 = !DILocalVariable(name: "data", scope: !29, file: !1, line: 32, type: !3)
!33 = !DILocation(line: 32, column: 15, scope: !29)
!34 = !DILocation(line: 33, column: 10, scope: !29)
!35 = !DILocalVariable(name: "dataBuffer", scope: !36, file: !1, line: 36, type: !37)
!36 = distinct !DILexicalBlock(scope: !29, file: !1, line: 34, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 36, column: 17, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !42, file: !1, line: 38, type: !43)
!42 = distinct !DILexicalBlock(scope: !36, file: !1, line: 37, column: 9)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!45 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 38, column: 20, scope: !42)
!47 = !DILocation(line: 39, column: 20, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !1, line: 39, column: 13)
!49 = !DILocation(line: 39, column: 18, scope: !48)
!50 = !DILocation(line: 39, column: 25, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !1, line: 39, column: 13)
!52 = !DILocation(line: 39, column: 27, scope: !51)
!53 = !DILocation(line: 39, column: 13, scope: !48)
!54 = !DILocation(line: 41, column: 28, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !1, line: 40, column: 13)
!56 = !DILocation(line: 41, column: 17, scope: !55)
!57 = !DILocation(line: 41, column: 31, scope: !55)
!58 = !DILocation(line: 42, column: 13, scope: !55)
!59 = !DILocation(line: 39, column: 35, scope: !51)
!60 = !DILocation(line: 39, column: 13, scope: !51)
!61 = distinct !{!61, !53, !62, !63}
!62 = !DILocation(line: 42, column: 13, scope: !48)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 44, column: 16, scope: !36)
!65 = !DILocation(line: 44, column: 14, scope: !36)
!66 = !DILocation(line: 46, column: 69, scope: !29)
!67 = !DILocation(line: 46, column: 5, scope: !29)
!68 = !DILocation(line: 47, column: 1, scope: !29)
!69 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_41_goodG2BSink", scope: !1, file: !1, line: 53, type: !19, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!70 = !DILocalVariable(name: "data", arg: 1, scope: !69, file: !1, line: 53, type: !3)
!71 = !DILocation(line: 53, column: 84, scope: !69)
!72 = !DILocation(line: 55, column: 23, scope: !69)
!73 = !DILocation(line: 55, column: 5, scope: !69)
!74 = !DILocation(line: 57, column: 10, scope: !69)
!75 = !DILocation(line: 57, column: 5, scope: !69)
!76 = !DILocation(line: 58, column: 1, scope: !69)
!77 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_41_good", scope: !1, file: !1, line: 85, type: !30, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!78 = !DILocation(line: 87, column: 5, scope: !77)
!79 = !DILocation(line: 88, column: 1, scope: !77)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 61, type: !30, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!81 = !DILocalVariable(name: "data", scope: !80, file: !1, line: 63, type: !3)
!82 = !DILocation(line: 63, column: 15, scope: !80)
!83 = !DILocation(line: 64, column: 10, scope: !80)
!84 = !DILocalVariable(name: "dataBuffer", scope: !85, file: !1, line: 67, type: !3)
!85 = distinct !DILexicalBlock(scope: !80, file: !1, line: 65, column: 5)
!86 = !DILocation(line: 67, column: 19, scope: !85)
!87 = !DILocation(line: 67, column: 43, scope: !85)
!88 = !DILocation(line: 67, column: 32, scope: !85)
!89 = !DILocation(line: 68, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !1, line: 68, column: 13)
!91 = !DILocation(line: 68, column: 24, scope: !90)
!92 = !DILocation(line: 68, column: 13, scope: !85)
!93 = !DILocation(line: 70, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !1, line: 69, column: 9)
!95 = !DILocation(line: 71, column: 13, scope: !94)
!96 = !DILocalVariable(name: "i", scope: !97, file: !1, line: 74, type: !43)
!97 = distinct !DILexicalBlock(scope: !85, file: !1, line: 73, column: 9)
!98 = !DILocation(line: 74, column: 20, scope: !97)
!99 = !DILocation(line: 75, column: 20, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !1, line: 75, column: 13)
!101 = !DILocation(line: 75, column: 18, scope: !100)
!102 = !DILocation(line: 75, column: 25, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !1, line: 75, column: 13)
!104 = !DILocation(line: 75, column: 27, scope: !103)
!105 = !DILocation(line: 75, column: 13, scope: !100)
!106 = !DILocation(line: 77, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !1, line: 76, column: 13)
!108 = !DILocation(line: 77, column: 28, scope: !107)
!109 = !DILocation(line: 77, column: 31, scope: !107)
!110 = !DILocation(line: 78, column: 13, scope: !107)
!111 = !DILocation(line: 75, column: 35, scope: !103)
!112 = !DILocation(line: 75, column: 13, scope: !103)
!113 = distinct !{!113, !105, !114, !63}
!114 = !DILocation(line: 78, column: 13, scope: !100)
!115 = !DILocation(line: 80, column: 16, scope: !85)
!116 = !DILocation(line: 80, column: 14, scope: !85)
!117 = !DILocation(line: 82, column: 73, scope: !80)
!118 = !DILocation(line: 82, column: 5, scope: !80)
!119 = !DILocation(line: 83, column: 1, scope: !80)
