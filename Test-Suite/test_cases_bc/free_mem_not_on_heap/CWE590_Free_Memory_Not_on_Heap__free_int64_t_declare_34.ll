; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34_unionType = type { i64* }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34_unionType, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  %data1 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34_unionType* %myUnion, metadata !24, metadata !DIExpression()), !dbg !30
  store i64* null, i64** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !32, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %0, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %1, !dbg !53
  store i64 5, i64* %arrayidx, align 8, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %2, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !61
  store i64* %arraydecay, i64** %data, align 8, !dbg !62
  %3 = load i64*, i64** %data, align 8, !dbg !63
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34_unionType* %myUnion to i64**, !dbg !64
  store i64* %3, i64** %unionFirst, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !66, metadata !DIExpression()), !dbg !68
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34_unionType* %myUnion to i64**, !dbg !69
  %4 = load i64*, i64** %unionSecond, align 8, !dbg !69
  store i64* %4, i64** %data1, align 8, !dbg !68
  %5 = load i64*, i64** %data1, align 8, !dbg !70
  %arrayidx2 = getelementptr inbounds i64, i64* %5, i64 0, !dbg !70
  %6 = load i64, i64* %arrayidx2, align 8, !dbg !70
  call void @printLongLongLine(i64 noundef %6), !dbg !71
  %7 = load i64*, i64** %data1, align 8, !dbg !72
  %8 = bitcast i64* %7 to i8*, !dbg !72
  call void @free(i8* noundef %8) #5, !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34_unionType, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %data2 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34_unionType* %myUnion, metadata !81, metadata !DIExpression()), !dbg !82
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
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34_unionType* %myUnion to i64**, !dbg !118
  store i64* %7, i64** %unionFirst, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !120, metadata !DIExpression()), !dbg !122
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34_unionType* %myUnion to i64**, !dbg !123
  %8 = load i64*, i64** %unionSecond, align 8, !dbg !123
  store i64* %8, i64** %data2, align 8, !dbg !122
  %9 = load i64*, i64** %data2, align 8, !dbg !124
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !124
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !124
  call void @printLongLongLine(i64 noundef %10), !dbg !125
  %11 = load i64*, i64** %data2, align 8, !dbg !126
  %12 = bitcast i64* %11 to i8*, !dbg !126
  call void @free(i8* noundef %12) #5, !dbg !127
  ret void, !dbg !128
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "cc58bdd03c7839a16d2842d00cfa43fa")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34_bad", scope: !1, file: !1, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 31, type: !3)
!23 = !DILocation(line: 31, column: 15, scope: !18)
!24 = !DILocalVariable(name: "myUnion", scope: !18, file: !1, line: 32, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34_unionType", file: !1, line: 25, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !1, line: 21, size: 64, elements: !27)
!27 = !{!28, !29}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !26, file: !1, line: 23, baseType: !3, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !26, file: !1, line: 24, baseType: !3, size: 64)
!30 = !DILocation(line: 32, column: 71, scope: !18)
!31 = !DILocation(line: 33, column: 10, scope: !18)
!32 = !DILocalVariable(name: "dataBuffer", scope: !33, file: !1, line: 36, type: !34)
!33 = distinct !DILexicalBlock(scope: !18, file: !1, line: 34, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 36, column: 17, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !39, file: !1, line: 38, type: !40)
!39 = distinct !DILexicalBlock(scope: !33, file: !1, line: 37, column: 9)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 38, column: 20, scope: !39)
!44 = !DILocation(line: 39, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !1, line: 39, column: 13)
!46 = !DILocation(line: 39, column: 18, scope: !45)
!47 = !DILocation(line: 39, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !1, line: 39, column: 13)
!49 = !DILocation(line: 39, column: 27, scope: !48)
!50 = !DILocation(line: 39, column: 13, scope: !45)
!51 = !DILocation(line: 41, column: 28, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !1, line: 40, column: 13)
!53 = !DILocation(line: 41, column: 17, scope: !52)
!54 = !DILocation(line: 41, column: 31, scope: !52)
!55 = !DILocation(line: 42, column: 13, scope: !52)
!56 = !DILocation(line: 39, column: 35, scope: !48)
!57 = !DILocation(line: 39, column: 13, scope: !48)
!58 = distinct !{!58, !50, !59, !60}
!59 = !DILocation(line: 42, column: 13, scope: !45)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 44, column: 16, scope: !33)
!62 = !DILocation(line: 44, column: 14, scope: !33)
!63 = !DILocation(line: 46, column: 26, scope: !18)
!64 = !DILocation(line: 46, column: 13, scope: !18)
!65 = !DILocation(line: 46, column: 24, scope: !18)
!66 = !DILocalVariable(name: "data", scope: !67, file: !1, line: 48, type: !3)
!67 = distinct !DILexicalBlock(scope: !18, file: !1, line: 47, column: 5)
!68 = !DILocation(line: 48, column: 19, scope: !67)
!69 = !DILocation(line: 48, column: 34, scope: !67)
!70 = !DILocation(line: 49, column: 27, scope: !67)
!71 = !DILocation(line: 49, column: 9, scope: !67)
!72 = !DILocation(line: 51, column: 14, scope: !67)
!73 = !DILocation(line: 51, column: 9, scope: !67)
!74 = !DILocation(line: 53, column: 1, scope: !18)
!75 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_34_good", scope: !1, file: !1, line: 91, type: !19, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!76 = !DILocation(line: 93, column: 5, scope: !75)
!77 = !DILocation(line: 94, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 60, type: !19, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!79 = !DILocalVariable(name: "data", scope: !78, file: !1, line: 62, type: !3)
!80 = !DILocation(line: 62, column: 15, scope: !78)
!81 = !DILocalVariable(name: "myUnion", scope: !78, file: !1, line: 63, type: !25)
!82 = !DILocation(line: 63, column: 71, scope: !78)
!83 = !DILocation(line: 64, column: 10, scope: !78)
!84 = !DILocalVariable(name: "dataBuffer", scope: !85, file: !1, line: 67, type: !3)
!85 = distinct !DILexicalBlock(scope: !78, file: !1, line: 65, column: 5)
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
!96 = !DILocalVariable(name: "i", scope: !97, file: !1, line: 74, type: !40)
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
!113 = distinct !{!113, !105, !114, !60}
!114 = !DILocation(line: 78, column: 13, scope: !100)
!115 = !DILocation(line: 80, column: 16, scope: !85)
!116 = !DILocation(line: 80, column: 14, scope: !85)
!117 = !DILocation(line: 82, column: 26, scope: !78)
!118 = !DILocation(line: 82, column: 13, scope: !78)
!119 = !DILocation(line: 82, column: 24, scope: !78)
!120 = !DILocalVariable(name: "data", scope: !121, file: !1, line: 84, type: !3)
!121 = distinct !DILexicalBlock(scope: !78, file: !1, line: 83, column: 5)
!122 = !DILocation(line: 84, column: 19, scope: !121)
!123 = !DILocation(line: 84, column: 34, scope: !121)
!124 = !DILocation(line: 85, column: 27, scope: !121)
!125 = !DILocation(line: 85, column: 9, scope: !121)
!126 = !DILocation(line: 87, column: 14, scope: !121)
!127 = !DILocation(line: 87, column: 9, scope: !121)
!128 = !DILocation(line: 89, column: 1, scope: !78)
