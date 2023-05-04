; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34_unionType = type { i64* }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34_unionType, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %data1 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34_unionType* %myUnion, metadata !24, metadata !DIExpression()), !dbg !30
  store i64* null, i64** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !32, metadata !DIExpression()), !dbg !34
  %0 = alloca i8, i64 800, align 16, !dbg !35
  %1 = bitcast i8* %0 to i64*, !dbg !36
  store i64* %1, i64** %dataBuffer, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %2, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !50
  %4 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !50
  store i64 5, i64* %arrayidx, align 8, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %5, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !60
  store i64* %6, i64** %data, align 8, !dbg !61
  %7 = load i64*, i64** %data, align 8, !dbg !62
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34_unionType* %myUnion to i64**, !dbg !63
  store i64* %7, i64** %unionFirst, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !65, metadata !DIExpression()), !dbg !67
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34_unionType* %myUnion to i64**, !dbg !68
  %8 = load i64*, i64** %unionSecond, align 8, !dbg !68
  store i64* %8, i64** %data1, align 8, !dbg !67
  %9 = load i64*, i64** %data1, align 8, !dbg !69
  %arrayidx2 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !69
  %10 = load i64, i64* %arrayidx2, align 8, !dbg !69
  call void @printLongLongLine(i64 noundef %10), !dbg !70
  %11 = load i64*, i64** %data1, align 8, !dbg !71
  %12 = bitcast i64* %11 to i8*, !dbg !71
  call void @free(i8* noundef %12) #5, !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34_unionType, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %data2 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34_unionType* %myUnion, metadata !80, metadata !DIExpression()), !dbg !81
  store i64* null, i64** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !85
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !86
  %0 = bitcast i8* %call to i64*, !dbg !87
  store i64* %0, i64** %dataBuffer, align 8, !dbg !85
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !88
  %cmp = icmp eq i64* %1, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @exit(i32 noundef 1) #6, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !95, metadata !DIExpression()), !dbg !97
  store i64 0, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !101
  %cmp1 = icmp ult i64 %2, 100, !dbg !103
  br i1 %cmp1, label %for.body, label %for.end, !dbg !104

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !105
  %4 = load i64, i64* %i, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !105
  store i64 5, i64* %arrayidx, align 8, !dbg !108
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !110
  %inc = add i64 %5, 1, !dbg !110
  store i64 %inc, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !111, !llvm.loop !112

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !114
  store i64* %6, i64** %data, align 8, !dbg !115
  %7 = load i64*, i64** %data, align 8, !dbg !116
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34_unionType* %myUnion to i64**, !dbg !117
  store i64* %7, i64** %unionFirst, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !119, metadata !DIExpression()), !dbg !121
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34_unionType* %myUnion to i64**, !dbg !122
  %8 = load i64*, i64** %unionSecond, align 8, !dbg !122
  store i64* %8, i64** %data2, align 8, !dbg !121
  %9 = load i64*, i64** %data2, align 8, !dbg !123
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !123
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !123
  call void @printLongLongLine(i64 noundef %10), !dbg !124
  %11 = load i64*, i64** %data2, align 8, !dbg !125
  %12 = bitcast i64* %11 to i8*, !dbg !125
  call void @free(i8* noundef %12) #5, !dbg !126
  ret void, !dbg !127
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "0e111b27a3554a210142aee1ac23b05b")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34_bad", scope: !1, file: !1, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 31, type: !3)
!23 = !DILocation(line: 31, column: 15, scope: !18)
!24 = !DILocalVariable(name: "myUnion", scope: !18, file: !1, line: 32, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34_unionType", file: !1, line: 25, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !1, line: 21, size: 64, elements: !27)
!27 = !{!28, !29}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !26, file: !1, line: 23, baseType: !3, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !26, file: !1, line: 24, baseType: !3, size: 64)
!30 = !DILocation(line: 32, column: 70, scope: !18)
!31 = !DILocation(line: 33, column: 10, scope: !18)
!32 = !DILocalVariable(name: "dataBuffer", scope: !33, file: !1, line: 36, type: !3)
!33 = distinct !DILexicalBlock(scope: !18, file: !1, line: 34, column: 5)
!34 = !DILocation(line: 36, column: 19, scope: !33)
!35 = !DILocation(line: 36, column: 43, scope: !33)
!36 = !DILocation(line: 36, column: 32, scope: !33)
!37 = !DILocalVariable(name: "i", scope: !38, file: !1, line: 38, type: !39)
!38 = distinct !DILexicalBlock(scope: !33, file: !1, line: 37, column: 9)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 38, column: 20, scope: !38)
!43 = !DILocation(line: 39, column: 20, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !1, line: 39, column: 13)
!45 = !DILocation(line: 39, column: 18, scope: !44)
!46 = !DILocation(line: 39, column: 25, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !1, line: 39, column: 13)
!48 = !DILocation(line: 39, column: 27, scope: !47)
!49 = !DILocation(line: 39, column: 13, scope: !44)
!50 = !DILocation(line: 41, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 40, column: 13)
!52 = !DILocation(line: 41, column: 28, scope: !51)
!53 = !DILocation(line: 41, column: 31, scope: !51)
!54 = !DILocation(line: 42, column: 13, scope: !51)
!55 = !DILocation(line: 39, column: 35, scope: !47)
!56 = !DILocation(line: 39, column: 13, scope: !47)
!57 = distinct !{!57, !49, !58, !59}
!58 = !DILocation(line: 42, column: 13, scope: !44)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 44, column: 16, scope: !33)
!61 = !DILocation(line: 44, column: 14, scope: !33)
!62 = !DILocation(line: 46, column: 26, scope: !18)
!63 = !DILocation(line: 46, column: 13, scope: !18)
!64 = !DILocation(line: 46, column: 24, scope: !18)
!65 = !DILocalVariable(name: "data", scope: !66, file: !1, line: 48, type: !3)
!66 = distinct !DILexicalBlock(scope: !18, file: !1, line: 47, column: 5)
!67 = !DILocation(line: 48, column: 19, scope: !66)
!68 = !DILocation(line: 48, column: 34, scope: !66)
!69 = !DILocation(line: 49, column: 27, scope: !66)
!70 = !DILocation(line: 49, column: 9, scope: !66)
!71 = !DILocation(line: 51, column: 14, scope: !66)
!72 = !DILocation(line: 51, column: 9, scope: !66)
!73 = !DILocation(line: 53, column: 1, scope: !18)
!74 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_34_good", scope: !1, file: !1, line: 91, type: !19, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!75 = !DILocation(line: 93, column: 5, scope: !74)
!76 = !DILocation(line: 94, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 60, type: !19, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!78 = !DILocalVariable(name: "data", scope: !77, file: !1, line: 62, type: !3)
!79 = !DILocation(line: 62, column: 15, scope: !77)
!80 = !DILocalVariable(name: "myUnion", scope: !77, file: !1, line: 63, type: !25)
!81 = !DILocation(line: 63, column: 70, scope: !77)
!82 = !DILocation(line: 64, column: 10, scope: !77)
!83 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !1, line: 67, type: !3)
!84 = distinct !DILexicalBlock(scope: !77, file: !1, line: 65, column: 5)
!85 = !DILocation(line: 67, column: 19, scope: !84)
!86 = !DILocation(line: 67, column: 43, scope: !84)
!87 = !DILocation(line: 67, column: 32, scope: !84)
!88 = !DILocation(line: 68, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !1, line: 68, column: 13)
!90 = !DILocation(line: 68, column: 24, scope: !89)
!91 = !DILocation(line: 68, column: 13, scope: !84)
!92 = !DILocation(line: 70, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !1, line: 69, column: 9)
!94 = !DILocation(line: 71, column: 13, scope: !93)
!95 = !DILocalVariable(name: "i", scope: !96, file: !1, line: 74, type: !39)
!96 = distinct !DILexicalBlock(scope: !84, file: !1, line: 73, column: 9)
!97 = !DILocation(line: 74, column: 20, scope: !96)
!98 = !DILocation(line: 75, column: 20, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !1, line: 75, column: 13)
!100 = !DILocation(line: 75, column: 18, scope: !99)
!101 = !DILocation(line: 75, column: 25, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !1, line: 75, column: 13)
!103 = !DILocation(line: 75, column: 27, scope: !102)
!104 = !DILocation(line: 75, column: 13, scope: !99)
!105 = !DILocation(line: 77, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !1, line: 76, column: 13)
!107 = !DILocation(line: 77, column: 28, scope: !106)
!108 = !DILocation(line: 77, column: 31, scope: !106)
!109 = !DILocation(line: 78, column: 13, scope: !106)
!110 = !DILocation(line: 75, column: 35, scope: !102)
!111 = !DILocation(line: 75, column: 13, scope: !102)
!112 = distinct !{!112, !104, !113, !59}
!113 = !DILocation(line: 78, column: 13, scope: !99)
!114 = !DILocation(line: 80, column: 16, scope: !84)
!115 = !DILocation(line: 80, column: 14, scope: !84)
!116 = !DILocation(line: 82, column: 26, scope: !77)
!117 = !DILocation(line: 82, column: 13, scope: !77)
!118 = !DILocation(line: 82, column: 24, scope: !77)
!119 = !DILocalVariable(name: "data", scope: !120, file: !1, line: 84, type: !3)
!120 = distinct !DILexicalBlock(scope: !77, file: !1, line: 83, column: 5)
!121 = !DILocation(line: 84, column: 19, scope: !120)
!122 = !DILocation(line: 84, column: 34, scope: !120)
!123 = !DILocation(line: 85, column: 27, scope: !120)
!124 = !DILocation(line: 85, column: 9, scope: !120)
!125 = !DILocation(line: 87, column: 14, scope: !120)
!126 = !DILocation(line: 87, column: 9, scope: !120)
!127 = !DILocation(line: 89, column: 1, scope: !77)
