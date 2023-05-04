; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_41.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_41_badSink(%struct._twoIntsStruct* noundef %data) #0 !dbg !20 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !26
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %0, i64 0, !dbg !26
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx), !dbg !27
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !28
  %2 = bitcast %struct._twoIntsStruct* %1 to i8*, !dbg !28
  call void @free(i8* noundef %2) #5, !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_41_bad() #0 !dbg !31 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !34, metadata !DIExpression()), !dbg !35
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataBuffer, metadata !37, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %0, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %1, !dbg !58
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !59
  store i32 1, i32* %intOne, align 8, !dbg !60
  %2 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %2, !dbg !62
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !63
  store i32 1, i32* %intTwo, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %3, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 0, !dbg !71
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !72
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !73
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_41_badSink(%struct._twoIntsStruct* noundef %4), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_41_goodG2BSink(%struct._twoIntsStruct* noundef %data) #0 !dbg !76 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !79
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %0, i64 0, !dbg !79
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx), !dbg !80
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !81
  %2 = bitcast %struct._twoIntsStruct* %1 to i8*, !dbg !81
  call void @free(i8* noundef %2) #5, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_41_good() #0 !dbg !84 {
entry:
  call void @goodG2B(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !93
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !94
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !95
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !93
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !96
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !98
  br i1 %cmp, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @exit(i32 noundef 1) #6, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !103, metadata !DIExpression()), !dbg !105
  store i64 0, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !109
  %cmp1 = icmp ult i64 %2, 100, !dbg !111
  br i1 %cmp1, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !113
  %4 = load i64, i64* %i, align 8, !dbg !115
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !113
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !116
  store i32 1, i32* %intOne, align 4, !dbg !117
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !118
  %6 = load i64, i64* %i, align 8, !dbg !119
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !118
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !120
  store i32 1, i32* %intTwo, align 4, !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !123
  %inc = add i64 %7, 1, !dbg !123
  store i64 %inc, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !127
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !128
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !129
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_41_goodG2BSink(%struct._twoIntsStruct* noundef %9), !dbg !130
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_41.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "89a23af9f53c2822c41984e4b84cc2fa")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_41_badSink", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !3}
!23 = !{}
!24 = !DILocalVariable(name: "data", arg: 1, scope: !20, file: !1, line: 23, type: !3)
!25 = !DILocation(line: 23, column: 85, scope: !20)
!26 = !DILocation(line: 25, column: 22, scope: !20)
!27 = !DILocation(line: 25, column: 5, scope: !20)
!28 = !DILocation(line: 27, column: 10, scope: !20)
!29 = !DILocation(line: 27, column: 5, scope: !20)
!30 = !DILocation(line: 28, column: 1, scope: !20)
!31 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_41_bad", scope: !1, file: !1, line: 30, type: !32, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!32 = !DISubroutineType(types: !33)
!33 = !{null}
!34 = !DILocalVariable(name: "data", scope: !31, file: !1, line: 32, type: !3)
!35 = !DILocation(line: 32, column: 21, scope: !31)
!36 = !DILocation(line: 33, column: 10, scope: !31)
!37 = !DILocalVariable(name: "dataBuffer", scope: !38, file: !1, line: 36, type: !39)
!38 = distinct !DILexicalBlock(scope: !31, file: !1, line: 34, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 36, column: 23, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !44, file: !1, line: 38, type: !45)
!44 = distinct !DILexicalBlock(scope: !38, file: !1, line: 37, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!47 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 38, column: 20, scope: !44)
!49 = !DILocation(line: 39, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !1, line: 39, column: 13)
!51 = !DILocation(line: 39, column: 18, scope: !50)
!52 = !DILocation(line: 39, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !1, line: 39, column: 13)
!54 = !DILocation(line: 39, column: 27, scope: !53)
!55 = !DILocation(line: 39, column: 13, scope: !50)
!56 = !DILocation(line: 41, column: 28, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !1, line: 40, column: 13)
!58 = !DILocation(line: 41, column: 17, scope: !57)
!59 = !DILocation(line: 41, column: 31, scope: !57)
!60 = !DILocation(line: 41, column: 38, scope: !57)
!61 = !DILocation(line: 42, column: 28, scope: !57)
!62 = !DILocation(line: 42, column: 17, scope: !57)
!63 = !DILocation(line: 42, column: 31, scope: !57)
!64 = !DILocation(line: 42, column: 38, scope: !57)
!65 = !DILocation(line: 43, column: 13, scope: !57)
!66 = !DILocation(line: 39, column: 35, scope: !53)
!67 = !DILocation(line: 39, column: 13, scope: !53)
!68 = distinct !{!68, !55, !69, !70}
!69 = !DILocation(line: 43, column: 13, scope: !50)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 45, column: 16, scope: !38)
!72 = !DILocation(line: 45, column: 14, scope: !38)
!73 = !DILocation(line: 47, column: 68, scope: !31)
!74 = !DILocation(line: 47, column: 5, scope: !31)
!75 = !DILocation(line: 48, column: 1, scope: !31)
!76 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_41_goodG2BSink", scope: !1, file: !1, line: 54, type: !21, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!77 = !DILocalVariable(name: "data", arg: 1, scope: !76, file: !1, line: 54, type: !3)
!78 = !DILocation(line: 54, column: 89, scope: !76)
!79 = !DILocation(line: 56, column: 22, scope: !76)
!80 = !DILocation(line: 56, column: 5, scope: !76)
!81 = !DILocation(line: 58, column: 10, scope: !76)
!82 = !DILocation(line: 58, column: 5, scope: !76)
!83 = !DILocation(line: 59, column: 1, scope: !76)
!84 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_41_good", scope: !1, file: !1, line: 87, type: !32, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!85 = !DILocation(line: 89, column: 5, scope: !84)
!86 = !DILocation(line: 90, column: 1, scope: !84)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 62, type: !32, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!88 = !DILocalVariable(name: "data", scope: !87, file: !1, line: 64, type: !3)
!89 = !DILocation(line: 64, column: 21, scope: !87)
!90 = !DILocation(line: 65, column: 10, scope: !87)
!91 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !1, line: 68, type: !3)
!92 = distinct !DILexicalBlock(scope: !87, file: !1, line: 66, column: 5)
!93 = !DILocation(line: 68, column: 25, scope: !92)
!94 = !DILocation(line: 68, column: 55, scope: !92)
!95 = !DILocation(line: 68, column: 38, scope: !92)
!96 = !DILocation(line: 69, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !1, line: 69, column: 13)
!98 = !DILocation(line: 69, column: 24, scope: !97)
!99 = !DILocation(line: 69, column: 13, scope: !92)
!100 = !DILocation(line: 71, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !1, line: 70, column: 9)
!102 = !DILocation(line: 72, column: 13, scope: !101)
!103 = !DILocalVariable(name: "i", scope: !104, file: !1, line: 75, type: !45)
!104 = distinct !DILexicalBlock(scope: !92, file: !1, line: 74, column: 9)
!105 = !DILocation(line: 75, column: 20, scope: !104)
!106 = !DILocation(line: 76, column: 20, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !1, line: 76, column: 13)
!108 = !DILocation(line: 76, column: 18, scope: !107)
!109 = !DILocation(line: 76, column: 25, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !1, line: 76, column: 13)
!111 = !DILocation(line: 76, column: 27, scope: !110)
!112 = !DILocation(line: 76, column: 13, scope: !107)
!113 = !DILocation(line: 78, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !1, line: 77, column: 13)
!115 = !DILocation(line: 78, column: 28, scope: !114)
!116 = !DILocation(line: 78, column: 31, scope: !114)
!117 = !DILocation(line: 78, column: 38, scope: !114)
!118 = !DILocation(line: 79, column: 17, scope: !114)
!119 = !DILocation(line: 79, column: 28, scope: !114)
!120 = !DILocation(line: 79, column: 31, scope: !114)
!121 = !DILocation(line: 79, column: 38, scope: !114)
!122 = !DILocation(line: 80, column: 13, scope: !114)
!123 = !DILocation(line: 76, column: 35, scope: !110)
!124 = !DILocation(line: 76, column: 13, scope: !110)
!125 = distinct !{!125, !112, !126, !70}
!126 = !DILocation(line: 80, column: 13, scope: !107)
!127 = !DILocation(line: 82, column: 16, scope: !92)
!128 = !DILocation(line: 82, column: 14, scope: !92)
!129 = !DILocation(line: 84, column: 72, scope: !87)
!130 = !DILocation(line: 84, column: 5, scope: !87)
!131 = !DILocation(line: 85, column: 1, scope: !87)
