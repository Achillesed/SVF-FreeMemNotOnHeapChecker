; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_static_34.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_static_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.CWE590_Free_Memory_Not_on_Heap__free_long_static_34_unionType = type { i64* }

@CWE590_Free_Memory_Not_on_Heap__free_long_static_34_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_static_34_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_long_static_34_unionType, align 8
  %i = alloca i64, align 8
  %data1 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_long_static_34_unionType* %myUnion, metadata !26, metadata !DIExpression()), !dbg !32
  store i64* null, i64** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !44
  %cmp = icmp ult i64 %0, 100, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_long_static_34_bad.dataBuffer, i64 0, i64 %1, !dbg !50
  store i64 5, i64* %arrayidx, align 8, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %2, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_long_static_34_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !58
  %3 = load i64*, i64** %data, align 8, !dbg !59
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_long_static_34_unionType* %myUnion to i64**, !dbg !60
  store i64* %3, i64** %unionFirst, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !62, metadata !DIExpression()), !dbg !64
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_long_static_34_unionType* %myUnion to i64**, !dbg !65
  %4 = load i64*, i64** %unionSecond, align 8, !dbg !65
  store i64* %4, i64** %data1, align 8, !dbg !64
  %5 = load i64*, i64** %data1, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds i64, i64* %5, i64 0, !dbg !66
  %6 = load i64, i64* %arrayidx2, align 8, !dbg !66
  call void @printLongLine(i64 noundef %6), !dbg !67
  %7 = load i64*, i64** %data1, align 8, !dbg !68
  %8 = bitcast i64* %7 to i8*, !dbg !68
  call void @free(i8* noundef %8) #5, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_static_34_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i64*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_long_static_34_unionType, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %data2 = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_long_static_34_unionType* %myUnion, metadata !77, metadata !DIExpression()), !dbg !78
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
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_long_static_34_unionType* %myUnion to i64**, !dbg !114
  store i64* %7, i64** %unionFirst, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i64** %data2, metadata !116, metadata !DIExpression()), !dbg !118
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_long_static_34_unionType* %myUnion to i64**, !dbg !119
  %8 = load i64*, i64** %unionSecond, align 8, !dbg !119
  store i64* %8, i64** %data2, align 8, !dbg !118
  %9 = load i64*, i64** %data2, align 8, !dbg !120
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !120
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !120
  call void @printLongLine(i64 noundef %10), !dbg !121
  %11 = load i64*, i64** %data2, align 8, !dbg !122
  %12 = bitcast i64* %11 to i8*, !dbg !122
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

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 36, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_34_bad", scope: !3, file: !3, line: 29, type: !4, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_static_34.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "c839dee6ebae83b419a156849b47350d")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0}
!12 = !{}
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 6400, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 100)
!16 = !{i32 7, !"Dwarf Version", i32 5}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"PIE Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 31, type: !8)
!25 = !DILocation(line: 31, column: 12, scope: !2)
!26 = !DILocalVariable(name: "myUnion", scope: !2, file: !3, line: 32, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_34_unionType", file: !3, line: 25, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !3, line: 21, size: 64, elements: !29)
!29 = !{!30, !31}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !28, file: !3, line: 23, baseType: !8, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !28, file: !3, line: 24, baseType: !8, size: 64)
!32 = !DILocation(line: 32, column: 67, scope: !2)
!33 = !DILocation(line: 33, column: 10, scope: !2)
!34 = !DILocalVariable(name: "i", scope: !35, file: !3, line: 38, type: !37)
!35 = distinct !DILexicalBlock(scope: !36, file: !3, line: 37, column: 9)
!36 = distinct !DILexicalBlock(scope: !2, file: !3, line: 34, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!39 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 38, column: 20, scope: !35)
!41 = !DILocation(line: 39, column: 20, scope: !42)
!42 = distinct !DILexicalBlock(scope: !35, file: !3, line: 39, column: 13)
!43 = !DILocation(line: 39, column: 18, scope: !42)
!44 = !DILocation(line: 39, column: 25, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !3, line: 39, column: 13)
!46 = !DILocation(line: 39, column: 27, scope: !45)
!47 = !DILocation(line: 39, column: 13, scope: !42)
!48 = !DILocation(line: 41, column: 28, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !3, line: 40, column: 13)
!50 = !DILocation(line: 41, column: 17, scope: !49)
!51 = !DILocation(line: 41, column: 31, scope: !49)
!52 = !DILocation(line: 42, column: 13, scope: !49)
!53 = !DILocation(line: 39, column: 35, scope: !45)
!54 = !DILocation(line: 39, column: 13, scope: !45)
!55 = distinct !{!55, !47, !56, !57}
!56 = !DILocation(line: 42, column: 13, scope: !42)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 44, column: 14, scope: !36)
!59 = !DILocation(line: 46, column: 26, scope: !2)
!60 = !DILocation(line: 46, column: 13, scope: !2)
!61 = !DILocation(line: 46, column: 24, scope: !2)
!62 = !DILocalVariable(name: "data", scope: !63, file: !3, line: 48, type: !8)
!63 = distinct !DILexicalBlock(scope: !2, file: !3, line: 47, column: 5)
!64 = !DILocation(line: 48, column: 16, scope: !63)
!65 = !DILocation(line: 48, column: 31, scope: !63)
!66 = !DILocation(line: 49, column: 23, scope: !63)
!67 = !DILocation(line: 49, column: 9, scope: !63)
!68 = !DILocation(line: 51, column: 14, scope: !63)
!69 = !DILocation(line: 51, column: 9, scope: !63)
!70 = !DILocation(line: 53, column: 1, scope: !2)
!71 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_34_good", scope: !3, file: !3, line: 91, type: !4, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!72 = !DILocation(line: 93, column: 5, scope: !71)
!73 = !DILocation(line: 94, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 60, type: !4, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!75 = !DILocalVariable(name: "data", scope: !74, file: !3, line: 62, type: !8)
!76 = !DILocation(line: 62, column: 12, scope: !74)
!77 = !DILocalVariable(name: "myUnion", scope: !74, file: !3, line: 63, type: !27)
!78 = !DILocation(line: 63, column: 67, scope: !74)
!79 = !DILocation(line: 64, column: 10, scope: !74)
!80 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !3, line: 67, type: !8)
!81 = distinct !DILexicalBlock(scope: !74, file: !3, line: 65, column: 5)
!82 = !DILocation(line: 67, column: 16, scope: !81)
!83 = !DILocation(line: 67, column: 37, scope: !81)
!84 = !DILocation(line: 67, column: 29, scope: !81)
!85 = !DILocation(line: 68, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !3, line: 68, column: 13)
!87 = !DILocation(line: 68, column: 24, scope: !86)
!88 = !DILocation(line: 68, column: 13, scope: !81)
!89 = !DILocation(line: 70, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !3, line: 69, column: 9)
!91 = !DILocation(line: 71, column: 13, scope: !90)
!92 = !DILocalVariable(name: "i", scope: !93, file: !3, line: 74, type: !37)
!93 = distinct !DILexicalBlock(scope: !81, file: !3, line: 73, column: 9)
!94 = !DILocation(line: 74, column: 20, scope: !93)
!95 = !DILocation(line: 75, column: 20, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !3, line: 75, column: 13)
!97 = !DILocation(line: 75, column: 18, scope: !96)
!98 = !DILocation(line: 75, column: 25, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !3, line: 75, column: 13)
!100 = !DILocation(line: 75, column: 27, scope: !99)
!101 = !DILocation(line: 75, column: 13, scope: !96)
!102 = !DILocation(line: 77, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !3, line: 76, column: 13)
!104 = !DILocation(line: 77, column: 28, scope: !103)
!105 = !DILocation(line: 77, column: 31, scope: !103)
!106 = !DILocation(line: 78, column: 13, scope: !103)
!107 = !DILocation(line: 75, column: 35, scope: !99)
!108 = !DILocation(line: 75, column: 13, scope: !99)
!109 = distinct !{!109, !101, !110, !57}
!110 = !DILocation(line: 78, column: 13, scope: !96)
!111 = !DILocation(line: 80, column: 16, scope: !81)
!112 = !DILocation(line: 80, column: 14, scope: !81)
!113 = !DILocation(line: 82, column: 26, scope: !74)
!114 = !DILocation(line: 82, column: 13, scope: !74)
!115 = !DILocation(line: 82, column: 24, scope: !74)
!116 = !DILocalVariable(name: "data", scope: !117, file: !3, line: 84, type: !8)
!117 = distinct !DILexicalBlock(scope: !74, file: !3, line: 83, column: 5)
!118 = !DILocation(line: 84, column: 16, scope: !117)
!119 = !DILocation(line: 84, column: 31, scope: !117)
!120 = !DILocation(line: 85, column: 23, scope: !117)
!121 = !DILocation(line: 85, column: 9, scope: !117)
!122 = !DILocation(line: 87, column: 14, scope: !117)
!123 = !DILocation(line: 87, column: 9, scope: !117)
!124 = !DILocation(line: 89, column: 1, scope: !74)
