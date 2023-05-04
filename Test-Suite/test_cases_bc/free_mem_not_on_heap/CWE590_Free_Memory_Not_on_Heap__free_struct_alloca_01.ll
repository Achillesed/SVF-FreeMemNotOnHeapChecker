; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_01.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_01_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 800, align 16, !dbg !30
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !31
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %2, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !45
  %4 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !45
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !48
  store i32 1, i32* %intOne, align 4, !dbg !49
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !50
  %6 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !50
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !52
  store i32 1, i32* %intTwo, align 4, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %7, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !60
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !61
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !62
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !63
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !64
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !64
  call void @free(i8* noundef %11) #5, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_01_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !76
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !77
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !78
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !76
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !79
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !81
  br i1 %cmp, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @exit(i32 noundef 1) #6, !dbg !85
  unreachable, !dbg !85

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !86, metadata !DIExpression()), !dbg !88
  store i64 0, i64* %i, align 8, !dbg !89
  br label %for.cond, !dbg !91

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !92
  %cmp1 = icmp ult i64 %2, 100, !dbg !94
  br i1 %cmp1, label %for.body, label %for.end, !dbg !95

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !96
  %4 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !96
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !99
  store i32 1, i32* %intOne, align 4, !dbg !100
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !101
  %6 = load i64, i64* %i, align 8, !dbg !102
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !101
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !103
  store i32 1, i32* %intTwo, align 4, !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !106
  %inc = add i64 %7, 1, !dbg !106
  store i64 %inc, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !110
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !111
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !112
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !112
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !113
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !114
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !114
  call void @free(i8* noundef %11) #5, !dbg !115
  ret void, !dbg !116
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
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_01.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "711705dd7286623e324f48c257eaee92")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_01_bad", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 25, type: !3)
!25 = !DILocation(line: 25, column: 21, scope: !20)
!26 = !DILocation(line: 26, column: 10, scope: !20)
!27 = !DILocalVariable(name: "dataBuffer", scope: !28, file: !1, line: 29, type: !3)
!28 = distinct !DILexicalBlock(scope: !20, file: !1, line: 27, column: 5)
!29 = !DILocation(line: 29, column: 25, scope: !28)
!30 = !DILocation(line: 29, column: 55, scope: !28)
!31 = !DILocation(line: 29, column: 38, scope: !28)
!32 = !DILocalVariable(name: "i", scope: !33, file: !1, line: 31, type: !34)
!33 = distinct !DILexicalBlock(scope: !28, file: !1, line: 30, column: 9)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 31, column: 20, scope: !33)
!38 = !DILocation(line: 32, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !1, line: 32, column: 13)
!40 = !DILocation(line: 32, column: 18, scope: !39)
!41 = !DILocation(line: 32, column: 25, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !1, line: 32, column: 13)
!43 = !DILocation(line: 32, column: 27, scope: !42)
!44 = !DILocation(line: 32, column: 13, scope: !39)
!45 = !DILocation(line: 34, column: 17, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !1, line: 33, column: 13)
!47 = !DILocation(line: 34, column: 28, scope: !46)
!48 = !DILocation(line: 34, column: 31, scope: !46)
!49 = !DILocation(line: 34, column: 38, scope: !46)
!50 = !DILocation(line: 35, column: 17, scope: !46)
!51 = !DILocation(line: 35, column: 28, scope: !46)
!52 = !DILocation(line: 35, column: 31, scope: !46)
!53 = !DILocation(line: 35, column: 38, scope: !46)
!54 = !DILocation(line: 36, column: 13, scope: !46)
!55 = !DILocation(line: 32, column: 35, scope: !42)
!56 = !DILocation(line: 32, column: 13, scope: !42)
!57 = distinct !{!57, !44, !58, !59}
!58 = !DILocation(line: 36, column: 13, scope: !39)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 38, column: 16, scope: !28)
!61 = !DILocation(line: 38, column: 14, scope: !28)
!62 = !DILocation(line: 40, column: 22, scope: !20)
!63 = !DILocation(line: 40, column: 5, scope: !20)
!64 = !DILocation(line: 42, column: 10, scope: !20)
!65 = !DILocation(line: 42, column: 5, scope: !20)
!66 = !DILocation(line: 43, column: 1, scope: !20)
!67 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_01_good", scope: !1, file: !1, line: 77, type: !21, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!68 = !DILocation(line: 79, column: 5, scope: !67)
!69 = !DILocation(line: 80, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 50, type: !21, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!71 = !DILocalVariable(name: "data", scope: !70, file: !1, line: 52, type: !3)
!72 = !DILocation(line: 52, column: 21, scope: !70)
!73 = !DILocation(line: 53, column: 10, scope: !70)
!74 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !1, line: 56, type: !3)
!75 = distinct !DILexicalBlock(scope: !70, file: !1, line: 54, column: 5)
!76 = !DILocation(line: 56, column: 25, scope: !75)
!77 = !DILocation(line: 56, column: 55, scope: !75)
!78 = !DILocation(line: 56, column: 38, scope: !75)
!79 = !DILocation(line: 57, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !1, line: 57, column: 13)
!81 = !DILocation(line: 57, column: 24, scope: !80)
!82 = !DILocation(line: 57, column: 13, scope: !75)
!83 = !DILocation(line: 59, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !1, line: 58, column: 9)
!85 = !DILocation(line: 60, column: 13, scope: !84)
!86 = !DILocalVariable(name: "i", scope: !87, file: !1, line: 63, type: !34)
!87 = distinct !DILexicalBlock(scope: !75, file: !1, line: 62, column: 9)
!88 = !DILocation(line: 63, column: 20, scope: !87)
!89 = !DILocation(line: 64, column: 20, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !1, line: 64, column: 13)
!91 = !DILocation(line: 64, column: 18, scope: !90)
!92 = !DILocation(line: 64, column: 25, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !1, line: 64, column: 13)
!94 = !DILocation(line: 64, column: 27, scope: !93)
!95 = !DILocation(line: 64, column: 13, scope: !90)
!96 = !DILocation(line: 66, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !1, line: 65, column: 13)
!98 = !DILocation(line: 66, column: 28, scope: !97)
!99 = !DILocation(line: 66, column: 31, scope: !97)
!100 = !DILocation(line: 66, column: 38, scope: !97)
!101 = !DILocation(line: 67, column: 17, scope: !97)
!102 = !DILocation(line: 67, column: 28, scope: !97)
!103 = !DILocation(line: 67, column: 31, scope: !97)
!104 = !DILocation(line: 67, column: 38, scope: !97)
!105 = !DILocation(line: 68, column: 13, scope: !97)
!106 = !DILocation(line: 64, column: 35, scope: !93)
!107 = !DILocation(line: 64, column: 13, scope: !93)
!108 = distinct !{!108, !95, !109, !59}
!109 = !DILocation(line: 68, column: 13, scope: !90)
!110 = !DILocation(line: 70, column: 16, scope: !75)
!111 = !DILocation(line: 70, column: 14, scope: !75)
!112 = !DILocation(line: 72, column: 22, scope: !70)
!113 = !DILocation(line: 72, column: 5, scope: !70)
!114 = !DILocation(line: 74, column: 10, scope: !70)
!115 = !DILocation(line: 74, column: 5, scope: !70)
!116 = !DILocation(line: 75, column: 1, scope: !70)
