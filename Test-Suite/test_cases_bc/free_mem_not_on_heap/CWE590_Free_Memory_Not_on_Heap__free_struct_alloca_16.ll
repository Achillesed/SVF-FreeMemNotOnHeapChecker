; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_16.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_16_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  br label %while.body, !dbg !27

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !31
  %0 = alloca i8, i64 800, align 16, !dbg !32
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %while.body
  %2 = load i64, i64* %i, align 8, !dbg !43
  %cmp = icmp ult i64 %2, 100, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !47
  %4 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !47
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !50
  store i32 1, i32* %intOne, align 4, !dbg !51
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !52
  %6 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !52
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !54
  store i32 1, i32* %intTwo, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %7, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !62
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !63
  br label %while.end, !dbg !64

while.end:                                        ; preds = %for.end
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !65
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !66
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !67
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !67
  call void @free(i8* noundef %11) #5, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_16_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !76
  br label %while.body, !dbg !77

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !81
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !82
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !83
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !81
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !84
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %while.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @exit(i32 noundef 1) #6, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %while.body
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
  br label %while.end, !dbg !117

while.end:                                        ; preds = %for.end
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !118
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !118
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !119
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !120
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !120
  call void @free(i8* noundef %11) #5, !dbg !121
  ret void, !dbg !122
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_16.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "9145bd7b4faa6236443de95e678e3435")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_16_bad", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 25, type: !3)
!25 = !DILocation(line: 25, column: 21, scope: !20)
!26 = !DILocation(line: 26, column: 10, scope: !20)
!27 = !DILocation(line: 27, column: 5, scope: !20)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !1, line: 31, type: !3)
!29 = distinct !DILexicalBlock(scope: !30, file: !1, line: 29, column: 9)
!30 = distinct !DILexicalBlock(scope: !20, file: !1, line: 28, column: 5)
!31 = !DILocation(line: 31, column: 29, scope: !29)
!32 = !DILocation(line: 31, column: 59, scope: !29)
!33 = !DILocation(line: 31, column: 42, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !35, file: !1, line: 33, type: !36)
!35 = distinct !DILexicalBlock(scope: !29, file: !1, line: 32, column: 13)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!38 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 33, column: 24, scope: !35)
!40 = !DILocation(line: 34, column: 24, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !1, line: 34, column: 17)
!42 = !DILocation(line: 34, column: 22, scope: !41)
!43 = !DILocation(line: 34, column: 29, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !1, line: 34, column: 17)
!45 = !DILocation(line: 34, column: 31, scope: !44)
!46 = !DILocation(line: 34, column: 17, scope: !41)
!47 = !DILocation(line: 36, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !1, line: 35, column: 17)
!49 = !DILocation(line: 36, column: 32, scope: !48)
!50 = !DILocation(line: 36, column: 35, scope: !48)
!51 = !DILocation(line: 36, column: 42, scope: !48)
!52 = !DILocation(line: 37, column: 21, scope: !48)
!53 = !DILocation(line: 37, column: 32, scope: !48)
!54 = !DILocation(line: 37, column: 35, scope: !48)
!55 = !DILocation(line: 37, column: 42, scope: !48)
!56 = !DILocation(line: 38, column: 17, scope: !48)
!57 = !DILocation(line: 34, column: 39, scope: !44)
!58 = !DILocation(line: 34, column: 17, scope: !44)
!59 = distinct !{!59, !46, !60, !61}
!60 = !DILocation(line: 38, column: 17, scope: !41)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 40, column: 20, scope: !29)
!63 = !DILocation(line: 40, column: 18, scope: !29)
!64 = !DILocation(line: 42, column: 9, scope: !30)
!65 = !DILocation(line: 44, column: 22, scope: !20)
!66 = !DILocation(line: 44, column: 5, scope: !20)
!67 = !DILocation(line: 46, column: 10, scope: !20)
!68 = !DILocation(line: 46, column: 5, scope: !20)
!69 = !DILocation(line: 47, column: 1, scope: !20)
!70 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_16_good", scope: !1, file: !1, line: 85, type: !21, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!71 = !DILocation(line: 87, column: 5, scope: !70)
!72 = !DILocation(line: 88, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!74 = !DILocalVariable(name: "data", scope: !73, file: !1, line: 56, type: !3)
!75 = !DILocation(line: 56, column: 21, scope: !73)
!76 = !DILocation(line: 57, column: 10, scope: !73)
!77 = !DILocation(line: 58, column: 5, scope: !73)
!78 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !1, line: 62, type: !3)
!79 = distinct !DILexicalBlock(scope: !80, file: !1, line: 60, column: 9)
!80 = distinct !DILexicalBlock(scope: !73, file: !1, line: 59, column: 5)
!81 = !DILocation(line: 62, column: 29, scope: !79)
!82 = !DILocation(line: 62, column: 59, scope: !79)
!83 = !DILocation(line: 62, column: 42, scope: !79)
!84 = !DILocation(line: 63, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !1, line: 63, column: 17)
!86 = !DILocation(line: 63, column: 28, scope: !85)
!87 = !DILocation(line: 63, column: 17, scope: !79)
!88 = !DILocation(line: 65, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !1, line: 64, column: 13)
!90 = !DILocation(line: 66, column: 17, scope: !89)
!91 = !DILocalVariable(name: "i", scope: !92, file: !1, line: 69, type: !36)
!92 = distinct !DILexicalBlock(scope: !79, file: !1, line: 68, column: 13)
!93 = !DILocation(line: 69, column: 24, scope: !92)
!94 = !DILocation(line: 70, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !1, line: 70, column: 17)
!96 = !DILocation(line: 70, column: 22, scope: !95)
!97 = !DILocation(line: 70, column: 29, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !1, line: 70, column: 17)
!99 = !DILocation(line: 70, column: 31, scope: !98)
!100 = !DILocation(line: 70, column: 17, scope: !95)
!101 = !DILocation(line: 72, column: 21, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !1, line: 71, column: 17)
!103 = !DILocation(line: 72, column: 32, scope: !102)
!104 = !DILocation(line: 72, column: 35, scope: !102)
!105 = !DILocation(line: 72, column: 42, scope: !102)
!106 = !DILocation(line: 73, column: 21, scope: !102)
!107 = !DILocation(line: 73, column: 32, scope: !102)
!108 = !DILocation(line: 73, column: 35, scope: !102)
!109 = !DILocation(line: 73, column: 42, scope: !102)
!110 = !DILocation(line: 74, column: 17, scope: !102)
!111 = !DILocation(line: 70, column: 39, scope: !98)
!112 = !DILocation(line: 70, column: 17, scope: !98)
!113 = distinct !{!113, !100, !114, !61}
!114 = !DILocation(line: 74, column: 17, scope: !95)
!115 = !DILocation(line: 76, column: 20, scope: !79)
!116 = !DILocation(line: 76, column: 18, scope: !79)
!117 = !DILocation(line: 78, column: 9, scope: !80)
!118 = !DILocation(line: 80, column: 22, scope: !73)
!119 = !DILocation(line: 80, column: 5, scope: !73)
!120 = !DILocation(line: 82, column: 10, scope: !73)
!121 = !DILocation(line: 82, column: 5, scope: !73)
!122 = !DILocation(line: 83, column: 1, scope: !73)
