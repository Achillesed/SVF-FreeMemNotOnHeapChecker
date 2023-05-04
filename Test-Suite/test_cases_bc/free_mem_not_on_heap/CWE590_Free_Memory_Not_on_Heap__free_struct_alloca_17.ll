; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_17.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_17_bad() #0 !dbg !20 {
entry:
  %i = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i1 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %0, 1, !dbg !34
  br i1 %cmp, label %for.body, label %for.end8, !dbg !35

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !36, metadata !DIExpression()), !dbg !39
  %1 = alloca i8, i64 800, align 16, !dbg !40
  %2 = bitcast i8* %1 to %struct._twoIntsStruct*, !dbg !41
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !42, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i1, align 8, !dbg !48
  br label %for.cond2, !dbg !50

for.cond2:                                        ; preds = %for.inc, %for.body
  %3 = load i64, i64* %i1, align 8, !dbg !51
  %cmp3 = icmp ult i64 %3, 100, !dbg !53
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !54

for.body4:                                        ; preds = %for.cond2
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !55
  %5 = load i64, i64* %i1, align 8, !dbg !57
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !55
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !58
  store i32 1, i32* %intOne, align 4, !dbg !59
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !60
  %7 = load i64, i64* %i1, align 8, !dbg !61
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !60
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !62
  store i32 1, i32* %intTwo, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body4
  %8 = load i64, i64* %i1, align 8, !dbg !65
  %inc = add i64 %8, 1, !dbg !65
  store i64 %inc, i64* %i1, align 8, !dbg !65
  br label %for.cond2, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond2
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !70
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !71
  br label %for.inc6, !dbg !72

for.inc6:                                         ; preds = %for.end
  %10 = load i32, i32* %i, align 4, !dbg !73
  %inc7 = add nsw i32 %10, 1, !dbg !73
  store i32 %inc7, i32* %i, align 4, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end8:                                         ; preds = %for.cond
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !77
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx9), !dbg !78
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !79
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !79
  call void @free(i8* noundef %13) #5, !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_17_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %h = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !90
  store i32 0, i32* %h, align 4, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* %h, align 4, !dbg !94
  %cmp = icmp slt i32 %0, 1, !dbg !96
  br i1 %cmp, label %for.body, label %for.end8, !dbg !97

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !101
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !102
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !103
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !101
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !104
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !106
  br i1 %cmp1, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %for.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @exit(i32 noundef 1) #6, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %for.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !111, metadata !DIExpression()), !dbg !113
  store i64 0, i64* %i, align 8, !dbg !114
  br label %for.cond2, !dbg !116

for.cond2:                                        ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !117
  %cmp3 = icmp ult i64 %3, 100, !dbg !119
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !120

for.body4:                                        ; preds = %for.cond2
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !121
  %5 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !121
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !124
  store i32 1, i32* %intOne, align 4, !dbg !125
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !126
  %7 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !126
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !128
  store i32 1, i32* %intTwo, align 4, !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body4
  %8 = load i64, i64* %i, align 8, !dbg !131
  %inc = add i64 %8, 1, !dbg !131
  store i64 %inc, i64* %i, align 8, !dbg !131
  br label %for.cond2, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond2
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !135
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !136
  br label %for.inc6, !dbg !137

for.inc6:                                         ; preds = %for.end
  %10 = load i32, i32* %h, align 4, !dbg !138
  %inc7 = add nsw i32 %10, 1, !dbg !138
  store i32 %inc7, i32* %h, align 4, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end8:                                         ; preds = %for.cond
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !142
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !142
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx9), !dbg !143
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !144
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !144
  call void @free(i8* noundef %13) #5, !dbg !145
  ret void, !dbg !146
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_17.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "655319cc1a0c6feeeed324288a0deda2")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_17_bad", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "i", scope: !20, file: !1, line: 25, type: !9)
!25 = !DILocation(line: 25, column: 9, scope: !20)
!26 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 26, type: !3)
!27 = !DILocation(line: 26, column: 21, scope: !20)
!28 = !DILocation(line: 27, column: 10, scope: !20)
!29 = !DILocation(line: 28, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !1, line: 28, column: 5)
!31 = !DILocation(line: 28, column: 9, scope: !30)
!32 = !DILocation(line: 28, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !1, line: 28, column: 5)
!34 = !DILocation(line: 28, column: 18, scope: !33)
!35 = !DILocation(line: 28, column: 5, scope: !30)
!36 = !DILocalVariable(name: "dataBuffer", scope: !37, file: !1, line: 32, type: !3)
!37 = distinct !DILexicalBlock(scope: !38, file: !1, line: 30, column: 9)
!38 = distinct !DILexicalBlock(scope: !33, file: !1, line: 29, column: 5)
!39 = !DILocation(line: 32, column: 29, scope: !37)
!40 = !DILocation(line: 32, column: 59, scope: !37)
!41 = !DILocation(line: 32, column: 42, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !43, file: !1, line: 34, type: !44)
!43 = distinct !DILexicalBlock(scope: !37, file: !1, line: 33, column: 13)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 34, column: 24, scope: !43)
!48 = !DILocation(line: 35, column: 24, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !1, line: 35, column: 17)
!50 = !DILocation(line: 35, column: 22, scope: !49)
!51 = !DILocation(line: 35, column: 29, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !1, line: 35, column: 17)
!53 = !DILocation(line: 35, column: 31, scope: !52)
!54 = !DILocation(line: 35, column: 17, scope: !49)
!55 = !DILocation(line: 37, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !1, line: 36, column: 17)
!57 = !DILocation(line: 37, column: 32, scope: !56)
!58 = !DILocation(line: 37, column: 35, scope: !56)
!59 = !DILocation(line: 37, column: 42, scope: !56)
!60 = !DILocation(line: 38, column: 21, scope: !56)
!61 = !DILocation(line: 38, column: 32, scope: !56)
!62 = !DILocation(line: 38, column: 35, scope: !56)
!63 = !DILocation(line: 38, column: 42, scope: !56)
!64 = !DILocation(line: 39, column: 17, scope: !56)
!65 = !DILocation(line: 35, column: 39, scope: !52)
!66 = !DILocation(line: 35, column: 17, scope: !52)
!67 = distinct !{!67, !54, !68, !69}
!68 = !DILocation(line: 39, column: 17, scope: !49)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 41, column: 20, scope: !37)
!71 = !DILocation(line: 41, column: 18, scope: !37)
!72 = !DILocation(line: 43, column: 5, scope: !38)
!73 = !DILocation(line: 28, column: 24, scope: !33)
!74 = !DILocation(line: 28, column: 5, scope: !33)
!75 = distinct !{!75, !35, !76, !69}
!76 = !DILocation(line: 43, column: 5, scope: !30)
!77 = !DILocation(line: 44, column: 22, scope: !20)
!78 = !DILocation(line: 44, column: 5, scope: !20)
!79 = !DILocation(line: 46, column: 10, scope: !20)
!80 = !DILocation(line: 46, column: 5, scope: !20)
!81 = !DILocation(line: 47, column: 1, scope: !20)
!82 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_17_good", scope: !1, file: !1, line: 85, type: !21, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!83 = !DILocation(line: 87, column: 5, scope: !82)
!84 = !DILocation(line: 88, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!86 = !DILocalVariable(name: "h", scope: !85, file: !1, line: 56, type: !9)
!87 = !DILocation(line: 56, column: 9, scope: !85)
!88 = !DILocalVariable(name: "data", scope: !85, file: !1, line: 57, type: !3)
!89 = !DILocation(line: 57, column: 21, scope: !85)
!90 = !DILocation(line: 58, column: 10, scope: !85)
!91 = !DILocation(line: 59, column: 11, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !1, line: 59, column: 5)
!93 = !DILocation(line: 59, column: 9, scope: !92)
!94 = !DILocation(line: 59, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !1, line: 59, column: 5)
!96 = !DILocation(line: 59, column: 18, scope: !95)
!97 = !DILocation(line: 59, column: 5, scope: !92)
!98 = !DILocalVariable(name: "dataBuffer", scope: !99, file: !1, line: 63, type: !3)
!99 = distinct !DILexicalBlock(scope: !100, file: !1, line: 61, column: 9)
!100 = distinct !DILexicalBlock(scope: !95, file: !1, line: 60, column: 5)
!101 = !DILocation(line: 63, column: 29, scope: !99)
!102 = !DILocation(line: 63, column: 59, scope: !99)
!103 = !DILocation(line: 63, column: 42, scope: !99)
!104 = !DILocation(line: 64, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !1, line: 64, column: 17)
!106 = !DILocation(line: 64, column: 28, scope: !105)
!107 = !DILocation(line: 64, column: 17, scope: !99)
!108 = !DILocation(line: 66, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !1, line: 65, column: 13)
!110 = !DILocation(line: 67, column: 17, scope: !109)
!111 = !DILocalVariable(name: "i", scope: !112, file: !1, line: 70, type: !44)
!112 = distinct !DILexicalBlock(scope: !99, file: !1, line: 69, column: 13)
!113 = !DILocation(line: 70, column: 24, scope: !112)
!114 = !DILocation(line: 71, column: 24, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !1, line: 71, column: 17)
!116 = !DILocation(line: 71, column: 22, scope: !115)
!117 = !DILocation(line: 71, column: 29, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !1, line: 71, column: 17)
!119 = !DILocation(line: 71, column: 31, scope: !118)
!120 = !DILocation(line: 71, column: 17, scope: !115)
!121 = !DILocation(line: 73, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !1, line: 72, column: 17)
!123 = !DILocation(line: 73, column: 32, scope: !122)
!124 = !DILocation(line: 73, column: 35, scope: !122)
!125 = !DILocation(line: 73, column: 42, scope: !122)
!126 = !DILocation(line: 74, column: 21, scope: !122)
!127 = !DILocation(line: 74, column: 32, scope: !122)
!128 = !DILocation(line: 74, column: 35, scope: !122)
!129 = !DILocation(line: 74, column: 42, scope: !122)
!130 = !DILocation(line: 75, column: 17, scope: !122)
!131 = !DILocation(line: 71, column: 39, scope: !118)
!132 = !DILocation(line: 71, column: 17, scope: !118)
!133 = distinct !{!133, !120, !134, !69}
!134 = !DILocation(line: 75, column: 17, scope: !115)
!135 = !DILocation(line: 77, column: 20, scope: !99)
!136 = !DILocation(line: 77, column: 18, scope: !99)
!137 = !DILocation(line: 79, column: 5, scope: !100)
!138 = !DILocation(line: 59, column: 24, scope: !95)
!139 = !DILocation(line: 59, column: 5, scope: !95)
!140 = distinct !{!140, !97, !141, !69}
!141 = !DILocation(line: 79, column: 5, scope: !92)
!142 = !DILocation(line: 80, column: 22, scope: !85)
!143 = !DILocation(line: 80, column: 5, scope: !85)
!144 = !DILocation(line: 82, column: 10, scope: !85)
!145 = !DILocation(line: 82, column: 5, scope: !85)
!146 = !DILocation(line: 83, column: 1, scope: !85)
