; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_54a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_54a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_54_bad() #0 !dbg !20 {
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
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_54b_badSink(%struct._twoIntsStruct* noundef %9), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_54b_badSink(%struct._twoIntsStruct* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_54_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !68 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !69, metadata !DIExpression()), !dbg !70
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !72, metadata !DIExpression()), !dbg !74
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !75
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !76
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !74
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !77
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @exit(i32 noundef 1) #6, !dbg !83
  unreachable, !dbg !83

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !84, metadata !DIExpression()), !dbg !86
  store i64 0, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !89

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !90
  %cmp1 = icmp ult i64 %2, 100, !dbg !92
  br i1 %cmp1, label %for.body, label %for.end, !dbg !93

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !94
  %4 = load i64, i64* %i, align 8, !dbg !96
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !94
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !97
  store i32 1, i32* %intOne, align 4, !dbg !98
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !99
  %6 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !99
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !101
  store i32 1, i32* %intTwo, align 4, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !104
  %inc = add i64 %7, 1, !dbg !104
  store i64 %inc, i64* %i, align 8, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !108
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !109
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !110
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_54b_goodG2BSink(%struct._twoIntsStruct* noundef %9), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_54b_goodG2BSink(%struct._twoIntsStruct* noundef) #2

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_54a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "c8db7842e4d1c64620ee5f346b0f6a34")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_54_bad", scope: !1, file: !1, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 28, type: !3)
!25 = !DILocation(line: 28, column: 21, scope: !20)
!26 = !DILocation(line: 29, column: 10, scope: !20)
!27 = !DILocalVariable(name: "dataBuffer", scope: !28, file: !1, line: 32, type: !3)
!28 = distinct !DILexicalBlock(scope: !20, file: !1, line: 30, column: 5)
!29 = !DILocation(line: 32, column: 25, scope: !28)
!30 = !DILocation(line: 32, column: 55, scope: !28)
!31 = !DILocation(line: 32, column: 38, scope: !28)
!32 = !DILocalVariable(name: "i", scope: !33, file: !1, line: 34, type: !34)
!33 = distinct !DILexicalBlock(scope: !28, file: !1, line: 33, column: 9)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 34, column: 20, scope: !33)
!38 = !DILocation(line: 35, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !1, line: 35, column: 13)
!40 = !DILocation(line: 35, column: 18, scope: !39)
!41 = !DILocation(line: 35, column: 25, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !1, line: 35, column: 13)
!43 = !DILocation(line: 35, column: 27, scope: !42)
!44 = !DILocation(line: 35, column: 13, scope: !39)
!45 = !DILocation(line: 37, column: 17, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !1, line: 36, column: 13)
!47 = !DILocation(line: 37, column: 28, scope: !46)
!48 = !DILocation(line: 37, column: 31, scope: !46)
!49 = !DILocation(line: 37, column: 38, scope: !46)
!50 = !DILocation(line: 38, column: 17, scope: !46)
!51 = !DILocation(line: 38, column: 28, scope: !46)
!52 = !DILocation(line: 38, column: 31, scope: !46)
!53 = !DILocation(line: 38, column: 38, scope: !46)
!54 = !DILocation(line: 39, column: 13, scope: !46)
!55 = !DILocation(line: 35, column: 35, scope: !42)
!56 = !DILocation(line: 35, column: 13, scope: !42)
!57 = distinct !{!57, !44, !58, !59}
!58 = !DILocation(line: 39, column: 13, scope: !39)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 41, column: 16, scope: !28)
!61 = !DILocation(line: 41, column: 14, scope: !28)
!62 = !DILocation(line: 43, column: 68, scope: !20)
!63 = !DILocation(line: 43, column: 5, scope: !20)
!64 = !DILocation(line: 44, column: 1, scope: !20)
!65 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_54_good", scope: !1, file: !1, line: 79, type: !21, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!66 = !DILocation(line: 81, column: 5, scope: !65)
!67 = !DILocation(line: 82, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!69 = !DILocalVariable(name: "data", scope: !68, file: !1, line: 56, type: !3)
!70 = !DILocation(line: 56, column: 21, scope: !68)
!71 = !DILocation(line: 57, column: 10, scope: !68)
!72 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !1, line: 60, type: !3)
!73 = distinct !DILexicalBlock(scope: !68, file: !1, line: 58, column: 5)
!74 = !DILocation(line: 60, column: 25, scope: !73)
!75 = !DILocation(line: 60, column: 55, scope: !73)
!76 = !DILocation(line: 60, column: 38, scope: !73)
!77 = !DILocation(line: 61, column: 13, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !1, line: 61, column: 13)
!79 = !DILocation(line: 61, column: 24, scope: !78)
!80 = !DILocation(line: 61, column: 13, scope: !73)
!81 = !DILocation(line: 63, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !1, line: 62, column: 9)
!83 = !DILocation(line: 64, column: 13, scope: !82)
!84 = !DILocalVariable(name: "i", scope: !85, file: !1, line: 67, type: !34)
!85 = distinct !DILexicalBlock(scope: !73, file: !1, line: 66, column: 9)
!86 = !DILocation(line: 67, column: 20, scope: !85)
!87 = !DILocation(line: 68, column: 20, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !1, line: 68, column: 13)
!89 = !DILocation(line: 68, column: 18, scope: !88)
!90 = !DILocation(line: 68, column: 25, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !1, line: 68, column: 13)
!92 = !DILocation(line: 68, column: 27, scope: !91)
!93 = !DILocation(line: 68, column: 13, scope: !88)
!94 = !DILocation(line: 70, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !1, line: 69, column: 13)
!96 = !DILocation(line: 70, column: 28, scope: !95)
!97 = !DILocation(line: 70, column: 31, scope: !95)
!98 = !DILocation(line: 70, column: 38, scope: !95)
!99 = !DILocation(line: 71, column: 17, scope: !95)
!100 = !DILocation(line: 71, column: 28, scope: !95)
!101 = !DILocation(line: 71, column: 31, scope: !95)
!102 = !DILocation(line: 71, column: 38, scope: !95)
!103 = !DILocation(line: 72, column: 13, scope: !95)
!104 = !DILocation(line: 68, column: 35, scope: !91)
!105 = !DILocation(line: 68, column: 13, scope: !91)
!106 = distinct !{!106, !93, !107, !59}
!107 = !DILocation(line: 72, column: 13, scope: !88)
!108 = !DILocation(line: 74, column: 16, scope: !73)
!109 = !DILocation(line: 74, column: 14, scope: !73)
!110 = !DILocation(line: 76, column: 72, scope: !68)
!111 = !DILocation(line: 76, column: 5, scope: !68)
!112 = !DILocation(line: 77, column: 1, scope: !68)
