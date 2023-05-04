; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_declare_34.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_declare_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.CWE590_Free_Memory_Not_on_Heap__free_int_declare_34_unionType = type { i32* }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_int_declare_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %data1 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_int_declare_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !43
  %cmp = icmp ult i64 %0, 100, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 %1, !dbg !49
  store i32 5, i32* %arrayidx, align 4, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %2, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !57
  store i32* %arraydecay, i32** %data, align 8, !dbg !58
  %3 = load i32*, i32** %data, align 8, !dbg !59
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_int_declare_34_unionType* %myUnion to i32**, !dbg !60
  store i32* %3, i32** %unionFirst, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !62, metadata !DIExpression()), !dbg !64
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_int_declare_34_unionType* %myUnion to i32**, !dbg !65
  %4 = load i32*, i32** %unionSecond, align 8, !dbg !65
  store i32* %4, i32** %data1, align 8, !dbg !64
  %5 = load i32*, i32** %data1, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i64 0, !dbg !66
  %6 = load i32, i32* %arrayidx2, align 4, !dbg !66
  call void @printIntLine(i32 noundef %6), !dbg !67
  %7 = load i32*, i32** %data1, align 8, !dbg !68
  %8 = bitcast i32* %7 to i8*, !dbg !68
  call void @free(i8* noundef %8) #5, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_34_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_int_declare_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %data2 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_int_declare_34_unionType* %myUnion, metadata !77, metadata !DIExpression()), !dbg !78
  store i32* null, i32** %data, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !82
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !83
  %0 = bitcast i8* %call to i32*, !dbg !84
  store i32* %0, i32** %dataBuffer, align 8, !dbg !82
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  %cmp = icmp eq i32* %1, null, !dbg !87
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
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %4 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !102
  store i32 5, i32* %arrayidx, align 4, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !107
  %inc = add i64 %5, 1, !dbg !107
  store i64 %inc, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  store i32* %6, i32** %data, align 8, !dbg !112
  %7 = load i32*, i32** %data, align 8, !dbg !113
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_int_declare_34_unionType* %myUnion to i32**, !dbg !114
  store i32* %7, i32** %unionFirst, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !116, metadata !DIExpression()), !dbg !118
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_int_declare_34_unionType* %myUnion to i32**, !dbg !119
  %8 = load i32*, i32** %unionSecond, align 8, !dbg !119
  store i32* %8, i32** %data2, align 8, !dbg !118
  %9 = load i32*, i32** %data2, align 8, !dbg !120
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !120
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !120
  call void @printIntLine(i32 noundef %10), !dbg !121
  %11 = load i32*, i32** %data2, align 8, !dbg !122
  %12 = bitcast i32* %11 to i8*, !dbg !122
  call void @free(i8* noundef %12) #5, !dbg !123
  ret void, !dbg !124
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_34.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "d2c5ab62654a271e8f3a0bb5c47c5333")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_34_bad", scope: !1, file: !1, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 31, type: !3)
!19 = !DILocation(line: 31, column: 11, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !1, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_34_unionType", file: !1, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !1, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !1, line: 23, baseType: !3, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !1, line: 24, baseType: !3, size: 64)
!26 = !DILocation(line: 32, column: 67, scope: !14)
!27 = !DILocation(line: 33, column: 10, scope: !14)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !1, line: 36, type: !30)
!29 = distinct !DILexicalBlock(scope: !14, file: !1, line: 34, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 36, column: 13, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !35, file: !1, line: 38, type: !36)
!35 = distinct !DILexicalBlock(scope: !29, file: !1, line: 37, column: 9)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!38 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 38, column: 20, scope: !35)
!40 = !DILocation(line: 39, column: 20, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !1, line: 39, column: 13)
!42 = !DILocation(line: 39, column: 18, scope: !41)
!43 = !DILocation(line: 39, column: 25, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !1, line: 39, column: 13)
!45 = !DILocation(line: 39, column: 27, scope: !44)
!46 = !DILocation(line: 39, column: 13, scope: !41)
!47 = !DILocation(line: 41, column: 28, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !1, line: 40, column: 13)
!49 = !DILocation(line: 41, column: 17, scope: !48)
!50 = !DILocation(line: 41, column: 31, scope: !48)
!51 = !DILocation(line: 42, column: 13, scope: !48)
!52 = !DILocation(line: 39, column: 35, scope: !44)
!53 = !DILocation(line: 39, column: 13, scope: !44)
!54 = distinct !{!54, !46, !55, !56}
!55 = !DILocation(line: 42, column: 13, scope: !41)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 44, column: 16, scope: !29)
!58 = !DILocation(line: 44, column: 14, scope: !29)
!59 = !DILocation(line: 46, column: 26, scope: !14)
!60 = !DILocation(line: 46, column: 13, scope: !14)
!61 = !DILocation(line: 46, column: 24, scope: !14)
!62 = !DILocalVariable(name: "data", scope: !63, file: !1, line: 48, type: !3)
!63 = distinct !DILexicalBlock(scope: !14, file: !1, line: 47, column: 5)
!64 = !DILocation(line: 48, column: 15, scope: !63)
!65 = !DILocation(line: 48, column: 30, scope: !63)
!66 = !DILocation(line: 49, column: 22, scope: !63)
!67 = !DILocation(line: 49, column: 9, scope: !63)
!68 = !DILocation(line: 51, column: 14, scope: !63)
!69 = !DILocation(line: 51, column: 9, scope: !63)
!70 = !DILocation(line: 53, column: 1, scope: !14)
!71 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_34_good", scope: !1, file: !1, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!72 = !DILocation(line: 93, column: 5, scope: !71)
!73 = !DILocation(line: 94, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!75 = !DILocalVariable(name: "data", scope: !74, file: !1, line: 62, type: !3)
!76 = !DILocation(line: 62, column: 11, scope: !74)
!77 = !DILocalVariable(name: "myUnion", scope: !74, file: !1, line: 63, type: !21)
!78 = !DILocation(line: 63, column: 67, scope: !74)
!79 = !DILocation(line: 64, column: 10, scope: !74)
!80 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !1, line: 67, type: !3)
!81 = distinct !DILexicalBlock(scope: !74, file: !1, line: 65, column: 5)
!82 = !DILocation(line: 67, column: 15, scope: !81)
!83 = !DILocation(line: 67, column: 35, scope: !81)
!84 = !DILocation(line: 67, column: 28, scope: !81)
!85 = !DILocation(line: 68, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !1, line: 68, column: 13)
!87 = !DILocation(line: 68, column: 24, scope: !86)
!88 = !DILocation(line: 68, column: 13, scope: !81)
!89 = !DILocation(line: 70, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !1, line: 69, column: 9)
!91 = !DILocation(line: 71, column: 13, scope: !90)
!92 = !DILocalVariable(name: "i", scope: !93, file: !1, line: 74, type: !36)
!93 = distinct !DILexicalBlock(scope: !81, file: !1, line: 73, column: 9)
!94 = !DILocation(line: 74, column: 20, scope: !93)
!95 = !DILocation(line: 75, column: 20, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !1, line: 75, column: 13)
!97 = !DILocation(line: 75, column: 18, scope: !96)
!98 = !DILocation(line: 75, column: 25, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !1, line: 75, column: 13)
!100 = !DILocation(line: 75, column: 27, scope: !99)
!101 = !DILocation(line: 75, column: 13, scope: !96)
!102 = !DILocation(line: 77, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !1, line: 76, column: 13)
!104 = !DILocation(line: 77, column: 28, scope: !103)
!105 = !DILocation(line: 77, column: 31, scope: !103)
!106 = !DILocation(line: 78, column: 13, scope: !103)
!107 = !DILocation(line: 75, column: 35, scope: !99)
!108 = !DILocation(line: 75, column: 13, scope: !99)
!109 = distinct !{!109, !101, !110, !56}
!110 = !DILocation(line: 78, column: 13, scope: !96)
!111 = !DILocation(line: 80, column: 16, scope: !81)
!112 = !DILocation(line: 80, column: 14, scope: !81)
!113 = !DILocation(line: 82, column: 26, scope: !74)
!114 = !DILocation(line: 82, column: 13, scope: !74)
!115 = !DILocation(line: 82, column: 24, scope: !74)
!116 = !DILocalVariable(name: "data", scope: !117, file: !1, line: 84, type: !3)
!117 = distinct !DILexicalBlock(scope: !74, file: !1, line: 83, column: 5)
!118 = !DILocation(line: 84, column: 15, scope: !117)
!119 = !DILocation(line: 84, column: 30, scope: !117)
!120 = !DILocation(line: 85, column: 22, scope: !117)
!121 = !DILocation(line: 85, column: 9, scope: !117)
!122 = !DILocation(line: 87, column: 14, scope: !117)
!123 = !DILocation(line: 87, column: 9, scope: !117)
!124 = !DILocation(line: 89, column: 1, scope: !74)
