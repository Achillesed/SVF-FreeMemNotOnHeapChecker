; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_16.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_16_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  br label %while.body, !dbg !27

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %while.body
  %0 = load i64, i64* %i, align 8, !dbg !44
  %cmp = icmp ult i64 %0, 100, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %1, !dbg !50
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !51
  store i32 1, i32* %intOne, align 8, !dbg !52
  %2 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %2, !dbg !54
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !55
  store i32 1, i32* %intTwo, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %3, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 0, !dbg !63
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !64
  br label %while.end, !dbg !65

while.end:                                        ; preds = %for.end
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 0, !dbg !66
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !67
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !68
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !68
  call void @free(i8* noundef %6) #5, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_16_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !75, metadata !DIExpression()), !dbg !76
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !77
  br label %while.body, !dbg !78

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !82
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !83
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !84
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !82
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !85
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %while.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @exit(i32 noundef 1) #6, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !92, metadata !DIExpression()), !dbg !94
  store i64 0, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !97

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !98
  %cmp1 = icmp ult i64 %2, 100, !dbg !100
  br i1 %cmp1, label %for.body, label %for.end, !dbg !101

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !102
  %4 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !102
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !105
  store i32 1, i32* %intOne, align 4, !dbg !106
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !107
  %6 = load i64, i64* %i, align 8, !dbg !108
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !107
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !109
  store i32 1, i32* %intTwo, align 4, !dbg !110
  br label %for.inc, !dbg !111

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !112
  %inc = add i64 %7, 1, !dbg !112
  store i64 %inc, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !113, !llvm.loop !114

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !116
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !117
  br label %while.end, !dbg !118

while.end:                                        ; preds = %for.end
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !119
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !119
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !120
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !121
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !121
  call void @free(i8* noundef %11) #5, !dbg !122
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
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_16.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "2ad23d790acfe7e8ce359fcb63573e9f")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_16_bad", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 25, type: !3)
!25 = !DILocation(line: 25, column: 21, scope: !20)
!26 = !DILocation(line: 26, column: 10, scope: !20)
!27 = !DILocation(line: 27, column: 5, scope: !20)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !1, line: 31, type: !31)
!29 = distinct !DILexicalBlock(scope: !30, file: !1, line: 29, column: 9)
!30 = distinct !DILexicalBlock(scope: !20, file: !1, line: 28, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 31, column: 27, scope: !29)
!35 = !DILocalVariable(name: "i", scope: !36, file: !1, line: 33, type: !37)
!36 = distinct !DILexicalBlock(scope: !29, file: !1, line: 32, column: 13)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!39 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 33, column: 24, scope: !36)
!41 = !DILocation(line: 34, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !1, line: 34, column: 17)
!43 = !DILocation(line: 34, column: 22, scope: !42)
!44 = !DILocation(line: 34, column: 29, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !1, line: 34, column: 17)
!46 = !DILocation(line: 34, column: 31, scope: !45)
!47 = !DILocation(line: 34, column: 17, scope: !42)
!48 = !DILocation(line: 36, column: 32, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !1, line: 35, column: 17)
!50 = !DILocation(line: 36, column: 21, scope: !49)
!51 = !DILocation(line: 36, column: 35, scope: !49)
!52 = !DILocation(line: 36, column: 42, scope: !49)
!53 = !DILocation(line: 37, column: 32, scope: !49)
!54 = !DILocation(line: 37, column: 21, scope: !49)
!55 = !DILocation(line: 37, column: 35, scope: !49)
!56 = !DILocation(line: 37, column: 42, scope: !49)
!57 = !DILocation(line: 38, column: 17, scope: !49)
!58 = !DILocation(line: 34, column: 39, scope: !45)
!59 = !DILocation(line: 34, column: 17, scope: !45)
!60 = distinct !{!60, !47, !61, !62}
!61 = !DILocation(line: 38, column: 17, scope: !42)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 40, column: 20, scope: !29)
!64 = !DILocation(line: 40, column: 18, scope: !29)
!65 = !DILocation(line: 42, column: 9, scope: !30)
!66 = !DILocation(line: 44, column: 22, scope: !20)
!67 = !DILocation(line: 44, column: 5, scope: !20)
!68 = !DILocation(line: 46, column: 10, scope: !20)
!69 = !DILocation(line: 46, column: 5, scope: !20)
!70 = !DILocation(line: 47, column: 1, scope: !20)
!71 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_16_good", scope: !1, file: !1, line: 85, type: !21, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!72 = !DILocation(line: 87, column: 5, scope: !71)
!73 = !DILocation(line: 88, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!75 = !DILocalVariable(name: "data", scope: !74, file: !1, line: 56, type: !3)
!76 = !DILocation(line: 56, column: 21, scope: !74)
!77 = !DILocation(line: 57, column: 10, scope: !74)
!78 = !DILocation(line: 58, column: 5, scope: !74)
!79 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !1, line: 62, type: !3)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 60, column: 9)
!81 = distinct !DILexicalBlock(scope: !74, file: !1, line: 59, column: 5)
!82 = !DILocation(line: 62, column: 29, scope: !80)
!83 = !DILocation(line: 62, column: 59, scope: !80)
!84 = !DILocation(line: 62, column: 42, scope: !80)
!85 = !DILocation(line: 63, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !80, file: !1, line: 63, column: 17)
!87 = !DILocation(line: 63, column: 28, scope: !86)
!88 = !DILocation(line: 63, column: 17, scope: !80)
!89 = !DILocation(line: 65, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !1, line: 64, column: 13)
!91 = !DILocation(line: 66, column: 17, scope: !90)
!92 = !DILocalVariable(name: "i", scope: !93, file: !1, line: 69, type: !37)
!93 = distinct !DILexicalBlock(scope: !80, file: !1, line: 68, column: 13)
!94 = !DILocation(line: 69, column: 24, scope: !93)
!95 = !DILocation(line: 70, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !1, line: 70, column: 17)
!97 = !DILocation(line: 70, column: 22, scope: !96)
!98 = !DILocation(line: 70, column: 29, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !1, line: 70, column: 17)
!100 = !DILocation(line: 70, column: 31, scope: !99)
!101 = !DILocation(line: 70, column: 17, scope: !96)
!102 = !DILocation(line: 72, column: 21, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !1, line: 71, column: 17)
!104 = !DILocation(line: 72, column: 32, scope: !103)
!105 = !DILocation(line: 72, column: 35, scope: !103)
!106 = !DILocation(line: 72, column: 42, scope: !103)
!107 = !DILocation(line: 73, column: 21, scope: !103)
!108 = !DILocation(line: 73, column: 32, scope: !103)
!109 = !DILocation(line: 73, column: 35, scope: !103)
!110 = !DILocation(line: 73, column: 42, scope: !103)
!111 = !DILocation(line: 74, column: 17, scope: !103)
!112 = !DILocation(line: 70, column: 39, scope: !99)
!113 = !DILocation(line: 70, column: 17, scope: !99)
!114 = distinct !{!114, !101, !115, !62}
!115 = !DILocation(line: 74, column: 17, scope: !96)
!116 = !DILocation(line: 76, column: 20, scope: !80)
!117 = !DILocation(line: 76, column: 18, scope: !80)
!118 = !DILocation(line: 78, column: 9, scope: !81)
!119 = !DILocation(line: 80, column: 22, scope: !74)
!120 = !DILocation(line: 80, column: 5, scope: !74)
!121 = !DILocation(line: 82, column: 10, scope: !74)
!122 = !DILocation(line: 82, column: 5, scope: !74)
!123 = !DILocation(line: 83, column: 1, scope: !74)
