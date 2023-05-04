; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34_unionType = type { i64* }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34_unionType, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %data1 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store i64* null, i64** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 800, align 16, !dbg !31
  %1 = bitcast i8* %0 to i64*, !dbg !32
  store i64* %1, i64** %dataBuffer, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !42
  %cmp = icmp ult i64 %2, 100, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !46
  %4 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !46
  store i64 5, i64* %arrayidx, align 8, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %5, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !56
  store i64* %6, i64** %data, align 8, !dbg !57
  %7 = load i64*, i64** %data, align 8, !dbg !58
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34_unionType* %myUnion to i64**, !dbg !59
  store i64* %7, i64** %unionFirst, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !61, metadata !DIExpression()), !dbg !63
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34_unionType* %myUnion to i64**, !dbg !64
  %8 = load i64*, i64** %unionSecond, align 8, !dbg !64
  store i64* %8, i64** %data1, align 8, !dbg !63
  %9 = load i64*, i64** %data1, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !65
  %10 = load i64, i64* %arrayidx2, align 8, !dbg !65
  call void @printLongLine(i64 noundef %10), !dbg !66
  %11 = load i64*, i64** %data1, align 8, !dbg !67
  %12 = bitcast i64* %11 to i8*, !dbg !67
  call void @free(i8* noundef %12) #5, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34_unionType, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %data2 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34_unionType* %myUnion, metadata !76, metadata !DIExpression()), !dbg !77
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
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34_unionType* %myUnion to i64**, !dbg !113
  store i64* %7, i64** %unionFirst, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !115, metadata !DIExpression()), !dbg !117
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34_unionType* %myUnion to i64**, !dbg !118
  %8 = load i64*, i64** %unionSecond, align 8, !dbg !118
  store i64* %8, i64** %data2, align 8, !dbg !117
  %9 = load i64*, i64** %data2, align 8, !dbg !119
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !119
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !119
  call void @printLongLine(i64 noundef %10), !dbg !120
  %11 = load i64*, i64** %data2, align 8, !dbg !121
  %12 = bitcast i64* %11 to i8*, !dbg !121
  call void @free(i8* noundef %12) #5, !dbg !122
  ret void, !dbg !123
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "38f41553eca49c1beeb35e28c156e594")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34_bad", scope: !1, file: !1, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 31, type: !3)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !1, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34_unionType", file: !1, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !1, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !1, line: 23, baseType: !3, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !1, line: 24, baseType: !3, size: 64)
!26 = !DILocation(line: 32, column: 67, scope: !14)
!27 = !DILocation(line: 33, column: 10, scope: !14)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !1, line: 36, type: !3)
!29 = distinct !DILexicalBlock(scope: !14, file: !1, line: 34, column: 5)
!30 = !DILocation(line: 36, column: 16, scope: !29)
!31 = !DILocation(line: 36, column: 37, scope: !29)
!32 = !DILocation(line: 36, column: 29, scope: !29)
!33 = !DILocalVariable(name: "i", scope: !34, file: !1, line: 38, type: !35)
!34 = distinct !DILexicalBlock(scope: !29, file: !1, line: 37, column: 9)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!37 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 38, column: 20, scope: !34)
!39 = !DILocation(line: 39, column: 20, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !1, line: 39, column: 13)
!41 = !DILocation(line: 39, column: 18, scope: !40)
!42 = !DILocation(line: 39, column: 25, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !1, line: 39, column: 13)
!44 = !DILocation(line: 39, column: 27, scope: !43)
!45 = !DILocation(line: 39, column: 13, scope: !40)
!46 = !DILocation(line: 41, column: 17, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !1, line: 40, column: 13)
!48 = !DILocation(line: 41, column: 28, scope: !47)
!49 = !DILocation(line: 41, column: 31, scope: !47)
!50 = !DILocation(line: 42, column: 13, scope: !47)
!51 = !DILocation(line: 39, column: 35, scope: !43)
!52 = !DILocation(line: 39, column: 13, scope: !43)
!53 = distinct !{!53, !45, !54, !55}
!54 = !DILocation(line: 42, column: 13, scope: !40)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 44, column: 16, scope: !29)
!57 = !DILocation(line: 44, column: 14, scope: !29)
!58 = !DILocation(line: 46, column: 26, scope: !14)
!59 = !DILocation(line: 46, column: 13, scope: !14)
!60 = !DILocation(line: 46, column: 24, scope: !14)
!61 = !DILocalVariable(name: "data", scope: !62, file: !1, line: 48, type: !3)
!62 = distinct !DILexicalBlock(scope: !14, file: !1, line: 47, column: 5)
!63 = !DILocation(line: 48, column: 16, scope: !62)
!64 = !DILocation(line: 48, column: 31, scope: !62)
!65 = !DILocation(line: 49, column: 23, scope: !62)
!66 = !DILocation(line: 49, column: 9, scope: !62)
!67 = !DILocation(line: 51, column: 14, scope: !62)
!68 = !DILocation(line: 51, column: 9, scope: !62)
!69 = !DILocation(line: 53, column: 1, scope: !14)
!70 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_34_good", scope: !1, file: !1, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!71 = !DILocation(line: 93, column: 5, scope: !70)
!72 = !DILocation(line: 94, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!74 = !DILocalVariable(name: "data", scope: !73, file: !1, line: 62, type: !3)
!75 = !DILocation(line: 62, column: 12, scope: !73)
!76 = !DILocalVariable(name: "myUnion", scope: !73, file: !1, line: 63, type: !21)
!77 = !DILocation(line: 63, column: 67, scope: !73)
!78 = !DILocation(line: 64, column: 10, scope: !73)
!79 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !1, line: 67, type: !3)
!80 = distinct !DILexicalBlock(scope: !73, file: !1, line: 65, column: 5)
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
!91 = !DILocalVariable(name: "i", scope: !92, file: !1, line: 74, type: !35)
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
!108 = distinct !{!108, !100, !109, !55}
!109 = !DILocation(line: 78, column: 13, scope: !95)
!110 = !DILocation(line: 80, column: 16, scope: !80)
!111 = !DILocation(line: 80, column: 14, scope: !80)
!112 = !DILocation(line: 82, column: 26, scope: !73)
!113 = !DILocation(line: 82, column: 13, scope: !73)
!114 = !DILocation(line: 82, column: 24, scope: !73)
!115 = !DILocalVariable(name: "data", scope: !116, file: !1, line: 84, type: !3)
!116 = distinct !DILexicalBlock(scope: !73, file: !1, line: 83, column: 5)
!117 = !DILocation(line: 84, column: 16, scope: !116)
!118 = !DILocation(line: 84, column: 31, scope: !116)
!119 = !DILocation(line: 85, column: 23, scope: !116)
!120 = !DILocation(line: 85, column: 9, scope: !116)
!121 = !DILocation(line: 87, column: 14, scope: !116)
!122 = !DILocation(line: 87, column: 9, scope: !116)
!123 = !DILocation(line: 89, column: 1, scope: !73)
