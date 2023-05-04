; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_15.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_15_bad() #0 !dbg !20 {
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_15_good() #0 !dbg !67 {
entry:
  call void @goodG2B1(), !dbg !68
  call void @goodG2B2(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !72, metadata !DIExpression()), !dbg !73
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !77
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !78
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !79
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !77
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !80
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @exit(i32 noundef 1) #6, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !87, metadata !DIExpression()), !dbg !89
  store i64 0, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !93
  %cmp1 = icmp ult i64 %2, 100, !dbg !95
  br i1 %cmp1, label %for.body, label %for.end, !dbg !96

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !97
  %4 = load i64, i64* %i, align 8, !dbg !99
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !97
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !100
  store i32 1, i32* %intOne, align 4, !dbg !101
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !102
  %6 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !102
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !104
  store i32 1, i32* %intTwo, align 4, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !107
  %inc = add i64 %7, 1, !dbg !107
  store i64 %inc, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !111
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !112
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !113
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !113
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !114
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !115
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !115
  call void @free(i8* noundef %11) #5, !dbg !116
  ret void, !dbg !117
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !118 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !119, metadata !DIExpression()), !dbg !120
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !122, metadata !DIExpression()), !dbg !124
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !125
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !126
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !124
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !127
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !129
  br i1 %cmp, label %if.then, label %if.end, !dbg !130

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !131
  call void @exit(i32 noundef 1) #6, !dbg !133
  unreachable, !dbg !133

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !140
  %cmp1 = icmp ult i64 %2, 100, !dbg !142
  br i1 %cmp1, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !144
  %4 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !144
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !147
  store i32 1, i32* %intOne, align 4, !dbg !148
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !149
  %6 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !149
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !151
  store i32 1, i32* %intTwo, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %7, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !158
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !159
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !160
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !160
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !161
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !162
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !162
  call void @free(i8* noundef %11) #5, !dbg !163
  ret void, !dbg !164
}

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_15.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "bc90e5530ccd151aee3650bf5d7e26a9")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_15_bad", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 25, type: !3)
!25 = !DILocation(line: 25, column: 21, scope: !20)
!26 = !DILocation(line: 26, column: 10, scope: !20)
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
!62 = !DILocation(line: 49, column: 22, scope: !20)
!63 = !DILocation(line: 49, column: 5, scope: !20)
!64 = !DILocation(line: 51, column: 10, scope: !20)
!65 = !DILocation(line: 51, column: 5, scope: !20)
!66 = !DILocation(line: 52, column: 1, scope: !20)
!67 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_15_good", scope: !1, file: !1, line: 132, type: !21, scopeLine: 133, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!68 = !DILocation(line: 134, column: 5, scope: !67)
!69 = !DILocation(line: 135, column: 5, scope: !67)
!70 = !DILocation(line: 136, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 59, type: !21, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!72 = !DILocalVariable(name: "data", scope: !71, file: !1, line: 61, type: !3)
!73 = !DILocation(line: 61, column: 21, scope: !71)
!74 = !DILocation(line: 62, column: 10, scope: !71)
!75 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !1, line: 72, type: !3)
!76 = distinct !DILexicalBlock(scope: !71, file: !1, line: 70, column: 5)
!77 = !DILocation(line: 72, column: 25, scope: !76)
!78 = !DILocation(line: 72, column: 55, scope: !76)
!79 = !DILocation(line: 72, column: 38, scope: !76)
!80 = !DILocation(line: 73, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !1, line: 73, column: 13)
!82 = !DILocation(line: 73, column: 24, scope: !81)
!83 = !DILocation(line: 73, column: 13, scope: !76)
!84 = !DILocation(line: 75, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !1, line: 74, column: 9)
!86 = !DILocation(line: 76, column: 13, scope: !85)
!87 = !DILocalVariable(name: "i", scope: !88, file: !1, line: 79, type: !34)
!88 = distinct !DILexicalBlock(scope: !76, file: !1, line: 78, column: 9)
!89 = !DILocation(line: 79, column: 20, scope: !88)
!90 = !DILocation(line: 80, column: 20, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !1, line: 80, column: 13)
!92 = !DILocation(line: 80, column: 18, scope: !91)
!93 = !DILocation(line: 80, column: 25, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !1, line: 80, column: 13)
!95 = !DILocation(line: 80, column: 27, scope: !94)
!96 = !DILocation(line: 80, column: 13, scope: !91)
!97 = !DILocation(line: 82, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !1, line: 81, column: 13)
!99 = !DILocation(line: 82, column: 28, scope: !98)
!100 = !DILocation(line: 82, column: 31, scope: !98)
!101 = !DILocation(line: 82, column: 38, scope: !98)
!102 = !DILocation(line: 83, column: 17, scope: !98)
!103 = !DILocation(line: 83, column: 28, scope: !98)
!104 = !DILocation(line: 83, column: 31, scope: !98)
!105 = !DILocation(line: 83, column: 38, scope: !98)
!106 = !DILocation(line: 84, column: 13, scope: !98)
!107 = !DILocation(line: 80, column: 35, scope: !94)
!108 = !DILocation(line: 80, column: 13, scope: !94)
!109 = distinct !{!109, !96, !110, !59}
!110 = !DILocation(line: 84, column: 13, scope: !91)
!111 = !DILocation(line: 86, column: 16, scope: !76)
!112 = !DILocation(line: 86, column: 14, scope: !76)
!113 = !DILocation(line: 90, column: 22, scope: !71)
!114 = !DILocation(line: 90, column: 5, scope: !71)
!115 = !DILocation(line: 92, column: 10, scope: !71)
!116 = !DILocation(line: 92, column: 5, scope: !71)
!117 = !DILocation(line: 93, column: 1, scope: !71)
!118 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 96, type: !21, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!119 = !DILocalVariable(name: "data", scope: !118, file: !1, line: 98, type: !3)
!120 = !DILocation(line: 98, column: 21, scope: !118)
!121 = !DILocation(line: 99, column: 10, scope: !118)
!122 = !DILocalVariable(name: "dataBuffer", scope: !123, file: !1, line: 105, type: !3)
!123 = distinct !DILexicalBlock(scope: !118, file: !1, line: 103, column: 5)
!124 = !DILocation(line: 105, column: 25, scope: !123)
!125 = !DILocation(line: 105, column: 55, scope: !123)
!126 = !DILocation(line: 105, column: 38, scope: !123)
!127 = !DILocation(line: 106, column: 13, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !1, line: 106, column: 13)
!129 = !DILocation(line: 106, column: 24, scope: !128)
!130 = !DILocation(line: 106, column: 13, scope: !123)
!131 = !DILocation(line: 108, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !1, line: 107, column: 9)
!133 = !DILocation(line: 109, column: 13, scope: !132)
!134 = !DILocalVariable(name: "i", scope: !135, file: !1, line: 112, type: !34)
!135 = distinct !DILexicalBlock(scope: !123, file: !1, line: 111, column: 9)
!136 = !DILocation(line: 112, column: 20, scope: !135)
!137 = !DILocation(line: 113, column: 20, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !1, line: 113, column: 13)
!139 = !DILocation(line: 113, column: 18, scope: !138)
!140 = !DILocation(line: 113, column: 25, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !1, line: 113, column: 13)
!142 = !DILocation(line: 113, column: 27, scope: !141)
!143 = !DILocation(line: 113, column: 13, scope: !138)
!144 = !DILocation(line: 115, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !1, line: 114, column: 13)
!146 = !DILocation(line: 115, column: 28, scope: !145)
!147 = !DILocation(line: 115, column: 31, scope: !145)
!148 = !DILocation(line: 115, column: 38, scope: !145)
!149 = !DILocation(line: 116, column: 17, scope: !145)
!150 = !DILocation(line: 116, column: 28, scope: !145)
!151 = !DILocation(line: 116, column: 31, scope: !145)
!152 = !DILocation(line: 116, column: 38, scope: !145)
!153 = !DILocation(line: 117, column: 13, scope: !145)
!154 = !DILocation(line: 113, column: 35, scope: !141)
!155 = !DILocation(line: 113, column: 13, scope: !141)
!156 = distinct !{!156, !143, !157, !59}
!157 = !DILocation(line: 117, column: 13, scope: !138)
!158 = !DILocation(line: 119, column: 16, scope: !123)
!159 = !DILocation(line: 119, column: 14, scope: !123)
!160 = !DILocation(line: 127, column: 22, scope: !118)
!161 = !DILocation(line: 127, column: 5, scope: !118)
!162 = !DILocation(line: 129, column: 10, scope: !118)
!163 = !DILocation(line: 129, column: 5, scope: !118)
!164 = !DILocation(line: 130, column: 1, scope: !118)
