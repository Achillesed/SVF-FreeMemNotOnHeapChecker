; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !26, metadata !DIExpression()), !dbg !30
  store void (%struct._twoIntsStruct*)* @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65b_badSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !30
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !32, metadata !DIExpression()), !dbg !34
  %0 = alloca i8, i64 800, align 16, !dbg !35
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !36
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %2, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !50
  %4 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !50
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !53
  store i32 1, i32* %intOne, align 4, !dbg !54
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !55
  %6 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !55
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !57
  store i32 1, i32* %intTwo, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %7, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !65
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !66
  %9 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !67
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !68
  call void %9(%struct._twoIntsStruct* noundef %10), !dbg !67
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65b_badSink(%struct._twoIntsStruct* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !76, metadata !DIExpression()), !dbg !77
  store void (%struct._twoIntsStruct*)* @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65b_goodG2BSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !77
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !81
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !82
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !83
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !81
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !84
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !86
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
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !101
  %4 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !101
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !104
  store i32 1, i32* %intOne, align 4, !dbg !105
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !106
  %6 = load i64, i64* %i, align 8, !dbg !107
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !106
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !108
  store i32 1, i32* %intTwo, align 4, !dbg !109
  br label %for.inc, !dbg !110

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !111
  %inc = add i64 %7, 1, !dbg !111
  store i64 %inc, i64* %i, align 8, !dbg !111
  br label %for.cond, !dbg !112, !llvm.loop !113

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !115
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !116
  %9 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !117
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !118
  call void %9(%struct._twoIntsStruct* noundef %10), !dbg !117
  ret void, !dbg !119
}

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65b_goodG2BSink(%struct._twoIntsStruct* noundef) #2

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
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "2d8c7678d472d7e48fd94df2baeed928")
!2 = !{!3, !11}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !5, line: 100, baseType: !6)
!5 = !DIFile(filename: "./std_testcase.h", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1dccefb0310558c17683ded20b0d6982")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !5, line: 96, size: 64, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !6, file: !5, line: 98, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !6, file: !5, line: 99, baseType: !9, size: 32, offset: 32)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{i32 7, !"Dwarf Version", i32 5}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"PIE Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65_bad", scope: !1, file: !1, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 28, type: !3)
!25 = !DILocation(line: 28, column: 21, scope: !20)
!26 = !DILocalVariable(name: "funcPtr", scope: !20, file: !1, line: 30, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DISubroutineType(types: !29)
!29 = !{null, !3}
!30 = !DILocation(line: 30, column: 12, scope: !20)
!31 = !DILocation(line: 31, column: 10, scope: !20)
!32 = !DILocalVariable(name: "dataBuffer", scope: !33, file: !1, line: 34, type: !3)
!33 = distinct !DILexicalBlock(scope: !20, file: !1, line: 32, column: 5)
!34 = !DILocation(line: 34, column: 25, scope: !33)
!35 = !DILocation(line: 34, column: 55, scope: !33)
!36 = !DILocation(line: 34, column: 38, scope: !33)
!37 = !DILocalVariable(name: "i", scope: !38, file: !1, line: 36, type: !39)
!38 = distinct !DILexicalBlock(scope: !33, file: !1, line: 35, column: 9)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 36, column: 20, scope: !38)
!43 = !DILocation(line: 37, column: 20, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !1, line: 37, column: 13)
!45 = !DILocation(line: 37, column: 18, scope: !44)
!46 = !DILocation(line: 37, column: 25, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !1, line: 37, column: 13)
!48 = !DILocation(line: 37, column: 27, scope: !47)
!49 = !DILocation(line: 37, column: 13, scope: !44)
!50 = !DILocation(line: 39, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 38, column: 13)
!52 = !DILocation(line: 39, column: 28, scope: !51)
!53 = !DILocation(line: 39, column: 31, scope: !51)
!54 = !DILocation(line: 39, column: 38, scope: !51)
!55 = !DILocation(line: 40, column: 17, scope: !51)
!56 = !DILocation(line: 40, column: 28, scope: !51)
!57 = !DILocation(line: 40, column: 31, scope: !51)
!58 = !DILocation(line: 40, column: 38, scope: !51)
!59 = !DILocation(line: 41, column: 13, scope: !51)
!60 = !DILocation(line: 37, column: 35, scope: !47)
!61 = !DILocation(line: 37, column: 13, scope: !47)
!62 = distinct !{!62, !49, !63, !64}
!63 = !DILocation(line: 41, column: 13, scope: !44)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 43, column: 16, scope: !33)
!66 = !DILocation(line: 43, column: 14, scope: !33)
!67 = !DILocation(line: 46, column: 5, scope: !20)
!68 = !DILocation(line: 46, column: 13, scope: !20)
!69 = !DILocation(line: 47, column: 1, scope: !20)
!70 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65_good", scope: !1, file: !1, line: 82, type: !21, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!71 = !DILocation(line: 84, column: 5, scope: !70)
!72 = !DILocation(line: 85, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 56, type: !21, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!74 = !DILocalVariable(name: "data", scope: !73, file: !1, line: 58, type: !3)
!75 = !DILocation(line: 58, column: 21, scope: !73)
!76 = !DILocalVariable(name: "funcPtr", scope: !73, file: !1, line: 59, type: !27)
!77 = !DILocation(line: 59, column: 12, scope: !73)
!78 = !DILocation(line: 60, column: 10, scope: !73)
!79 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !1, line: 63, type: !3)
!80 = distinct !DILexicalBlock(scope: !73, file: !1, line: 61, column: 5)
!81 = !DILocation(line: 63, column: 25, scope: !80)
!82 = !DILocation(line: 63, column: 55, scope: !80)
!83 = !DILocation(line: 63, column: 38, scope: !80)
!84 = !DILocation(line: 64, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !1, line: 64, column: 13)
!86 = !DILocation(line: 64, column: 24, scope: !85)
!87 = !DILocation(line: 64, column: 13, scope: !80)
!88 = !DILocation(line: 66, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !1, line: 65, column: 9)
!90 = !DILocation(line: 67, column: 13, scope: !89)
!91 = !DILocalVariable(name: "i", scope: !92, file: !1, line: 70, type: !39)
!92 = distinct !DILexicalBlock(scope: !80, file: !1, line: 69, column: 9)
!93 = !DILocation(line: 70, column: 20, scope: !92)
!94 = !DILocation(line: 71, column: 20, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !1, line: 71, column: 13)
!96 = !DILocation(line: 71, column: 18, scope: !95)
!97 = !DILocation(line: 71, column: 25, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !1, line: 71, column: 13)
!99 = !DILocation(line: 71, column: 27, scope: !98)
!100 = !DILocation(line: 71, column: 13, scope: !95)
!101 = !DILocation(line: 73, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !1, line: 72, column: 13)
!103 = !DILocation(line: 73, column: 28, scope: !102)
!104 = !DILocation(line: 73, column: 31, scope: !102)
!105 = !DILocation(line: 73, column: 38, scope: !102)
!106 = !DILocation(line: 74, column: 17, scope: !102)
!107 = !DILocation(line: 74, column: 28, scope: !102)
!108 = !DILocation(line: 74, column: 31, scope: !102)
!109 = !DILocation(line: 74, column: 38, scope: !102)
!110 = !DILocation(line: 75, column: 13, scope: !102)
!111 = !DILocation(line: 71, column: 35, scope: !98)
!112 = !DILocation(line: 71, column: 13, scope: !98)
!113 = distinct !{!113, !100, !114, !64}
!114 = !DILocation(line: 75, column: 13, scope: !95)
!115 = !DILocation(line: 77, column: 16, scope: !80)
!116 = !DILocation(line: 77, column: 14, scope: !80)
!117 = !DILocation(line: 79, column: 5, scope: !73)
!118 = !DILocation(line: 79, column: 13, scope: !73)
!119 = !DILocation(line: 80, column: 1, scope: !73)
