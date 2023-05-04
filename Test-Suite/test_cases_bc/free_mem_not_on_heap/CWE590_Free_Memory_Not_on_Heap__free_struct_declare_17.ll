; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_17.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_17_bad() #0 !dbg !20 {
entry:
  %i = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca [100 x %struct._twoIntsStruct], align 16
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
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataBuffer, metadata !36, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !43, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i1, align 8, !dbg !49
  br label %for.cond2, !dbg !51

for.cond2:                                        ; preds = %for.inc, %for.body
  %1 = load i64, i64* %i1, align 8, !dbg !52
  %cmp3 = icmp ult i64 %1, 100, !dbg !54
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !55

for.body4:                                        ; preds = %for.cond2
  %2 = load i64, i64* %i1, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %2, !dbg !58
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !59
  store i32 1, i32* %intOne, align 8, !dbg !60
  %3 = load i64, i64* %i1, align 8, !dbg !61
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %3, !dbg !62
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !63
  store i32 1, i32* %intTwo, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body4
  %4 = load i64, i64* %i1, align 8, !dbg !66
  %inc = add i64 %4, 1, !dbg !66
  store i64 %inc, i64* %i1, align 8, !dbg !66
  br label %for.cond2, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond2
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 0, !dbg !71
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !72
  br label %for.inc6, !dbg !73

for.inc6:                                         ; preds = %for.end
  %5 = load i32, i32* %i, align 4, !dbg !74
  %inc7 = add nsw i32 %5, 1, !dbg !74
  store i32 %inc7, i32* %i, align 4, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end8:                                         ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 0, !dbg !78
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx9), !dbg !79
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !80
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !80
  call void @free(i8* noundef %8) #5, !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_17_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %h = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !89, metadata !DIExpression()), !dbg !90
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !91
  store i32 0, i32* %h, align 4, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* %h, align 4, !dbg !95
  %cmp = icmp slt i32 %0, 1, !dbg !97
  br i1 %cmp, label %for.body, label %for.end8, !dbg !98

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !102
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !103
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !104
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !102
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !105
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !107
  br i1 %cmp1, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %for.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !109
  call void @exit(i32 noundef 1) #6, !dbg !111
  unreachable, !dbg !111

if.end:                                           ; preds = %for.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !112, metadata !DIExpression()), !dbg !114
  store i64 0, i64* %i, align 8, !dbg !115
  br label %for.cond2, !dbg !117

for.cond2:                                        ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !118
  %cmp3 = icmp ult i64 %3, 100, !dbg !120
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !121

for.body4:                                        ; preds = %for.cond2
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !122
  %5 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !122
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !125
  store i32 1, i32* %intOne, align 4, !dbg !126
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !127
  %7 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !127
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !129
  store i32 1, i32* %intTwo, align 4, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body4
  %8 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %8, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond2, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond2
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !136
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !137
  br label %for.inc6, !dbg !138

for.inc6:                                         ; preds = %for.end
  %10 = load i32, i32* %h, align 4, !dbg !139
  %inc7 = add nsw i32 %10, 1, !dbg !139
  store i32 %inc7, i32* %h, align 4, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end8:                                         ; preds = %for.cond
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !143
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !143
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx9), !dbg !144
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !145
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !145
  call void @free(i8* noundef %13) #5, !dbg !146
  ret void, !dbg !147
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_17.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "4839b132c38ef9999f47652259c4b5ea")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_17_bad", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
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
!36 = !DILocalVariable(name: "dataBuffer", scope: !37, file: !1, line: 32, type: !39)
!37 = distinct !DILexicalBlock(scope: !38, file: !1, line: 30, column: 9)
!38 = distinct !DILexicalBlock(scope: !33, file: !1, line: 29, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 32, column: 27, scope: !37)
!43 = !DILocalVariable(name: "i", scope: !44, file: !1, line: 34, type: !45)
!44 = distinct !DILexicalBlock(scope: !37, file: !1, line: 33, column: 13)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!47 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 34, column: 24, scope: !44)
!49 = !DILocation(line: 35, column: 24, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !1, line: 35, column: 17)
!51 = !DILocation(line: 35, column: 22, scope: !50)
!52 = !DILocation(line: 35, column: 29, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !1, line: 35, column: 17)
!54 = !DILocation(line: 35, column: 31, scope: !53)
!55 = !DILocation(line: 35, column: 17, scope: !50)
!56 = !DILocation(line: 37, column: 32, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !1, line: 36, column: 17)
!58 = !DILocation(line: 37, column: 21, scope: !57)
!59 = !DILocation(line: 37, column: 35, scope: !57)
!60 = !DILocation(line: 37, column: 42, scope: !57)
!61 = !DILocation(line: 38, column: 32, scope: !57)
!62 = !DILocation(line: 38, column: 21, scope: !57)
!63 = !DILocation(line: 38, column: 35, scope: !57)
!64 = !DILocation(line: 38, column: 42, scope: !57)
!65 = !DILocation(line: 39, column: 17, scope: !57)
!66 = !DILocation(line: 35, column: 39, scope: !53)
!67 = !DILocation(line: 35, column: 17, scope: !53)
!68 = distinct !{!68, !55, !69, !70}
!69 = !DILocation(line: 39, column: 17, scope: !50)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 41, column: 20, scope: !37)
!72 = !DILocation(line: 41, column: 18, scope: !37)
!73 = !DILocation(line: 43, column: 5, scope: !38)
!74 = !DILocation(line: 28, column: 24, scope: !33)
!75 = !DILocation(line: 28, column: 5, scope: !33)
!76 = distinct !{!76, !35, !77, !70}
!77 = !DILocation(line: 43, column: 5, scope: !30)
!78 = !DILocation(line: 44, column: 22, scope: !20)
!79 = !DILocation(line: 44, column: 5, scope: !20)
!80 = !DILocation(line: 46, column: 10, scope: !20)
!81 = !DILocation(line: 46, column: 5, scope: !20)
!82 = !DILocation(line: 47, column: 1, scope: !20)
!83 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_17_good", scope: !1, file: !1, line: 85, type: !21, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!84 = !DILocation(line: 87, column: 5, scope: !83)
!85 = !DILocation(line: 88, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!87 = !DILocalVariable(name: "h", scope: !86, file: !1, line: 56, type: !9)
!88 = !DILocation(line: 56, column: 9, scope: !86)
!89 = !DILocalVariable(name: "data", scope: !86, file: !1, line: 57, type: !3)
!90 = !DILocation(line: 57, column: 21, scope: !86)
!91 = !DILocation(line: 58, column: 10, scope: !86)
!92 = !DILocation(line: 59, column: 11, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !1, line: 59, column: 5)
!94 = !DILocation(line: 59, column: 9, scope: !93)
!95 = !DILocation(line: 59, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !1, line: 59, column: 5)
!97 = !DILocation(line: 59, column: 18, scope: !96)
!98 = !DILocation(line: 59, column: 5, scope: !93)
!99 = !DILocalVariable(name: "dataBuffer", scope: !100, file: !1, line: 63, type: !3)
!100 = distinct !DILexicalBlock(scope: !101, file: !1, line: 61, column: 9)
!101 = distinct !DILexicalBlock(scope: !96, file: !1, line: 60, column: 5)
!102 = !DILocation(line: 63, column: 29, scope: !100)
!103 = !DILocation(line: 63, column: 59, scope: !100)
!104 = !DILocation(line: 63, column: 42, scope: !100)
!105 = !DILocation(line: 64, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !100, file: !1, line: 64, column: 17)
!107 = !DILocation(line: 64, column: 28, scope: !106)
!108 = !DILocation(line: 64, column: 17, scope: !100)
!109 = !DILocation(line: 66, column: 17, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !1, line: 65, column: 13)
!111 = !DILocation(line: 67, column: 17, scope: !110)
!112 = !DILocalVariable(name: "i", scope: !113, file: !1, line: 70, type: !45)
!113 = distinct !DILexicalBlock(scope: !100, file: !1, line: 69, column: 13)
!114 = !DILocation(line: 70, column: 24, scope: !113)
!115 = !DILocation(line: 71, column: 24, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !1, line: 71, column: 17)
!117 = !DILocation(line: 71, column: 22, scope: !116)
!118 = !DILocation(line: 71, column: 29, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !1, line: 71, column: 17)
!120 = !DILocation(line: 71, column: 31, scope: !119)
!121 = !DILocation(line: 71, column: 17, scope: !116)
!122 = !DILocation(line: 73, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !1, line: 72, column: 17)
!124 = !DILocation(line: 73, column: 32, scope: !123)
!125 = !DILocation(line: 73, column: 35, scope: !123)
!126 = !DILocation(line: 73, column: 42, scope: !123)
!127 = !DILocation(line: 74, column: 21, scope: !123)
!128 = !DILocation(line: 74, column: 32, scope: !123)
!129 = !DILocation(line: 74, column: 35, scope: !123)
!130 = !DILocation(line: 74, column: 42, scope: !123)
!131 = !DILocation(line: 75, column: 17, scope: !123)
!132 = !DILocation(line: 71, column: 39, scope: !119)
!133 = !DILocation(line: 71, column: 17, scope: !119)
!134 = distinct !{!134, !121, !135, !70}
!135 = !DILocation(line: 75, column: 17, scope: !116)
!136 = !DILocation(line: 77, column: 20, scope: !100)
!137 = !DILocation(line: 77, column: 18, scope: !100)
!138 = !DILocation(line: 79, column: 5, scope: !101)
!139 = !DILocation(line: 59, column: 24, scope: !96)
!140 = !DILocation(line: 59, column: 5, scope: !96)
!141 = distinct !{!141, !98, !142, !70}
!142 = !DILocation(line: 79, column: 5, scope: !93)
!143 = !DILocation(line: 80, column: 22, scope: !86)
!144 = !DILocation(line: 80, column: 5, scope: !86)
!145 = !DILocation(line: 82, column: 10, scope: !86)
!146 = !DILocation(line: 82, column: 5, scope: !86)
!147 = !DILocation(line: 83, column: 1, scope: !86)
