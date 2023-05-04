; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_31.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_31_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !42
  %cmp = icmp ult i64 %0, 100, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %1, !dbg !48
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !49
  store i32 1, i32* %intOne, align 8, !dbg !50
  %2 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %2, !dbg !52
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !53
  store i32 1, i32* %intTwo, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %3, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 0, !dbg !61
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !63, metadata !DIExpression()), !dbg !65
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !66
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !67, metadata !DIExpression()), !dbg !68
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !69
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data2, align 8, !dbg !68
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !70
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 0, !dbg !70
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !71
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !72
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !72
  call void @free(i8* noundef %8) #5, !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_31_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data3 = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !84
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !85
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !86
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !84
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !87
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !89
  br i1 %cmp, label %if.then, label %if.end, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @exit(i32 noundef 1) #6, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !94, metadata !DIExpression()), !dbg !96
  store i64 0, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !99

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !100
  %cmp1 = icmp ult i64 %2, 100, !dbg !102
  br i1 %cmp1, label %for.body, label %for.end, !dbg !103

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !104
  %4 = load i64, i64* %i, align 8, !dbg !106
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !104
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !107
  store i32 1, i32* %intOne, align 4, !dbg !108
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !109
  %6 = load i64, i64* %i, align 8, !dbg !110
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !109
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !111
  store i32 1, i32* %intTwo, align 4, !dbg !112
  br label %for.inc, !dbg !113

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !114
  %inc = add i64 %7, 1, !dbg !114
  store i64 %inc, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !115, !llvm.loop !116

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !118
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !120, metadata !DIExpression()), !dbg !122
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !123
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data3, metadata !124, metadata !DIExpression()), !dbg !125
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !126
  store %struct._twoIntsStruct* %10, %struct._twoIntsStruct** %data3, align 8, !dbg !125
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data3, align 8, !dbg !127
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !127
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !128
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data3, align 8, !dbg !129
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !129
  call void @free(i8* noundef %13) #5, !dbg !130
  ret void, !dbg !131
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_31.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "30f8a37078343103ef176ce0ecc2cfae")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_31_bad", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 25, type: !3)
!25 = !DILocation(line: 25, column: 21, scope: !20)
!26 = !DILocation(line: 26, column: 10, scope: !20)
!27 = !DILocalVariable(name: "dataBuffer", scope: !28, file: !1, line: 29, type: !29)
!28 = distinct !DILexicalBlock(scope: !20, file: !1, line: 27, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 29, column: 23, scope: !28)
!33 = !DILocalVariable(name: "i", scope: !34, file: !1, line: 31, type: !35)
!34 = distinct !DILexicalBlock(scope: !28, file: !1, line: 30, column: 9)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!37 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 31, column: 20, scope: !34)
!39 = !DILocation(line: 32, column: 20, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !1, line: 32, column: 13)
!41 = !DILocation(line: 32, column: 18, scope: !40)
!42 = !DILocation(line: 32, column: 25, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !1, line: 32, column: 13)
!44 = !DILocation(line: 32, column: 27, scope: !43)
!45 = !DILocation(line: 32, column: 13, scope: !40)
!46 = !DILocation(line: 34, column: 28, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !1, line: 33, column: 13)
!48 = !DILocation(line: 34, column: 17, scope: !47)
!49 = !DILocation(line: 34, column: 31, scope: !47)
!50 = !DILocation(line: 34, column: 38, scope: !47)
!51 = !DILocation(line: 35, column: 28, scope: !47)
!52 = !DILocation(line: 35, column: 17, scope: !47)
!53 = !DILocation(line: 35, column: 31, scope: !47)
!54 = !DILocation(line: 35, column: 38, scope: !47)
!55 = !DILocation(line: 36, column: 13, scope: !47)
!56 = !DILocation(line: 32, column: 35, scope: !43)
!57 = !DILocation(line: 32, column: 13, scope: !43)
!58 = distinct !{!58, !45, !59, !60}
!59 = !DILocation(line: 36, column: 13, scope: !40)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 38, column: 16, scope: !28)
!62 = !DILocation(line: 38, column: 14, scope: !28)
!63 = !DILocalVariable(name: "dataCopy", scope: !64, file: !1, line: 41, type: !3)
!64 = distinct !DILexicalBlock(scope: !20, file: !1, line: 40, column: 5)
!65 = !DILocation(line: 41, column: 25, scope: !64)
!66 = !DILocation(line: 41, column: 36, scope: !64)
!67 = !DILocalVariable(name: "data", scope: !64, file: !1, line: 42, type: !3)
!68 = !DILocation(line: 42, column: 25, scope: !64)
!69 = !DILocation(line: 42, column: 32, scope: !64)
!70 = !DILocation(line: 43, column: 26, scope: !64)
!71 = !DILocation(line: 43, column: 9, scope: !64)
!72 = !DILocation(line: 45, column: 14, scope: !64)
!73 = !DILocation(line: 45, column: 9, scope: !64)
!74 = !DILocation(line: 47, column: 1, scope: !20)
!75 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_31_good", scope: !1, file: !1, line: 85, type: !21, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!76 = !DILocation(line: 87, column: 5, scope: !75)
!77 = !DILocation(line: 88, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!79 = !DILocalVariable(name: "data", scope: !78, file: !1, line: 56, type: !3)
!80 = !DILocation(line: 56, column: 21, scope: !78)
!81 = !DILocation(line: 57, column: 10, scope: !78)
!82 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !1, line: 60, type: !3)
!83 = distinct !DILexicalBlock(scope: !78, file: !1, line: 58, column: 5)
!84 = !DILocation(line: 60, column: 25, scope: !83)
!85 = !DILocation(line: 60, column: 55, scope: !83)
!86 = !DILocation(line: 60, column: 38, scope: !83)
!87 = !DILocation(line: 61, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !1, line: 61, column: 13)
!89 = !DILocation(line: 61, column: 24, scope: !88)
!90 = !DILocation(line: 61, column: 13, scope: !83)
!91 = !DILocation(line: 63, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !1, line: 62, column: 9)
!93 = !DILocation(line: 64, column: 13, scope: !92)
!94 = !DILocalVariable(name: "i", scope: !95, file: !1, line: 67, type: !35)
!95 = distinct !DILexicalBlock(scope: !83, file: !1, line: 66, column: 9)
!96 = !DILocation(line: 67, column: 20, scope: !95)
!97 = !DILocation(line: 68, column: 20, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !1, line: 68, column: 13)
!99 = !DILocation(line: 68, column: 18, scope: !98)
!100 = !DILocation(line: 68, column: 25, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !1, line: 68, column: 13)
!102 = !DILocation(line: 68, column: 27, scope: !101)
!103 = !DILocation(line: 68, column: 13, scope: !98)
!104 = !DILocation(line: 70, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !1, line: 69, column: 13)
!106 = !DILocation(line: 70, column: 28, scope: !105)
!107 = !DILocation(line: 70, column: 31, scope: !105)
!108 = !DILocation(line: 70, column: 38, scope: !105)
!109 = !DILocation(line: 71, column: 17, scope: !105)
!110 = !DILocation(line: 71, column: 28, scope: !105)
!111 = !DILocation(line: 71, column: 31, scope: !105)
!112 = !DILocation(line: 71, column: 38, scope: !105)
!113 = !DILocation(line: 72, column: 13, scope: !105)
!114 = !DILocation(line: 68, column: 35, scope: !101)
!115 = !DILocation(line: 68, column: 13, scope: !101)
!116 = distinct !{!116, !103, !117, !60}
!117 = !DILocation(line: 72, column: 13, scope: !98)
!118 = !DILocation(line: 74, column: 16, scope: !83)
!119 = !DILocation(line: 74, column: 14, scope: !83)
!120 = !DILocalVariable(name: "dataCopy", scope: !121, file: !1, line: 77, type: !3)
!121 = distinct !DILexicalBlock(scope: !78, file: !1, line: 76, column: 5)
!122 = !DILocation(line: 77, column: 25, scope: !121)
!123 = !DILocation(line: 77, column: 36, scope: !121)
!124 = !DILocalVariable(name: "data", scope: !121, file: !1, line: 78, type: !3)
!125 = !DILocation(line: 78, column: 25, scope: !121)
!126 = !DILocation(line: 78, column: 32, scope: !121)
!127 = !DILocation(line: 79, column: 26, scope: !121)
!128 = !DILocation(line: 79, column: 9, scope: !121)
!129 = !DILocation(line: 81, column: 14, scope: !121)
!130 = !DILocation(line: 81, column: 9, scope: !121)
!131 = !DILocation(line: 83, column: 1, scope: !78)
