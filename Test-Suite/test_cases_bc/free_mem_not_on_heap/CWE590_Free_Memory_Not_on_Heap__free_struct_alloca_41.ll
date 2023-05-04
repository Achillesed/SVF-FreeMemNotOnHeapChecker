; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_41.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_41_badSink(%struct._twoIntsStruct* noundef %data) #0 !dbg !20 {
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_41_bad() #0 !dbg !31 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !34, metadata !DIExpression()), !dbg !35
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !37, metadata !DIExpression()), !dbg !39
  %0 = alloca i8, i64 800, align 16, !dbg !40
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !41
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %2, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !55
  %4 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !55
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !58
  store i32 1, i32* %intOne, align 4, !dbg !59
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !60
  %6 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !60
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !62
  store i32 1, i32* %intTwo, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %7, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !70
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !71
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !72
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_41_badSink(%struct._twoIntsStruct* noundef %9), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_41_goodG2BSink(%struct._twoIntsStruct* noundef %data) #0 !dbg !75 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !78
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %0, i64 0, !dbg !78
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx), !dbg !79
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !80
  %2 = bitcast %struct._twoIntsStruct* %1 to i8*, !dbg !80
  call void @free(i8* noundef %2) #5, !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_41_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !90, metadata !DIExpression()), !dbg !92
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !93
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !94
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !92
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !95
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @exit(i32 noundef 1) #6, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !102, metadata !DIExpression()), !dbg !104
  store i64 0, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !107

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !108
  %cmp1 = icmp ult i64 %2, 100, !dbg !110
  br i1 %cmp1, label %for.body, label %for.end, !dbg !111

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !112
  %4 = load i64, i64* %i, align 8, !dbg !114
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !112
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !115
  store i32 1, i32* %intOne, align 4, !dbg !116
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !117
  %6 = load i64, i64* %i, align 8, !dbg !118
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !117
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !119
  store i32 1, i32* %intTwo, align 4, !dbg !120
  br label %for.inc, !dbg !121

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !122
  %inc = add i64 %7, 1, !dbg !122
  store i64 %inc, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !123, !llvm.loop !124

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !126
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !127
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !128
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_41_goodG2BSink(%struct._twoIntsStruct* noundef %9), !dbg !129
  ret void, !dbg !130
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_41.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "7660893741d14ea29eb7be1e496309a3")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_41_badSink", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !3}
!23 = !{}
!24 = !DILocalVariable(name: "data", arg: 1, scope: !20, file: !1, line: 23, type: !3)
!25 = !DILocation(line: 23, column: 84, scope: !20)
!26 = !DILocation(line: 25, column: 22, scope: !20)
!27 = !DILocation(line: 25, column: 5, scope: !20)
!28 = !DILocation(line: 27, column: 10, scope: !20)
!29 = !DILocation(line: 27, column: 5, scope: !20)
!30 = !DILocation(line: 28, column: 1, scope: !20)
!31 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_41_bad", scope: !1, file: !1, line: 30, type: !32, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!32 = !DISubroutineType(types: !33)
!33 = !{null}
!34 = !DILocalVariable(name: "data", scope: !31, file: !1, line: 32, type: !3)
!35 = !DILocation(line: 32, column: 21, scope: !31)
!36 = !DILocation(line: 33, column: 10, scope: !31)
!37 = !DILocalVariable(name: "dataBuffer", scope: !38, file: !1, line: 36, type: !3)
!38 = distinct !DILexicalBlock(scope: !31, file: !1, line: 34, column: 5)
!39 = !DILocation(line: 36, column: 25, scope: !38)
!40 = !DILocation(line: 36, column: 55, scope: !38)
!41 = !DILocation(line: 36, column: 38, scope: !38)
!42 = !DILocalVariable(name: "i", scope: !43, file: !1, line: 38, type: !44)
!43 = distinct !DILexicalBlock(scope: !38, file: !1, line: 37, column: 9)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 38, column: 20, scope: !43)
!48 = !DILocation(line: 39, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !1, line: 39, column: 13)
!50 = !DILocation(line: 39, column: 18, scope: !49)
!51 = !DILocation(line: 39, column: 25, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !1, line: 39, column: 13)
!53 = !DILocation(line: 39, column: 27, scope: !52)
!54 = !DILocation(line: 39, column: 13, scope: !49)
!55 = !DILocation(line: 41, column: 17, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !1, line: 40, column: 13)
!57 = !DILocation(line: 41, column: 28, scope: !56)
!58 = !DILocation(line: 41, column: 31, scope: !56)
!59 = !DILocation(line: 41, column: 38, scope: !56)
!60 = !DILocation(line: 42, column: 17, scope: !56)
!61 = !DILocation(line: 42, column: 28, scope: !56)
!62 = !DILocation(line: 42, column: 31, scope: !56)
!63 = !DILocation(line: 42, column: 38, scope: !56)
!64 = !DILocation(line: 43, column: 13, scope: !56)
!65 = !DILocation(line: 39, column: 35, scope: !52)
!66 = !DILocation(line: 39, column: 13, scope: !52)
!67 = distinct !{!67, !54, !68, !69}
!68 = !DILocation(line: 43, column: 13, scope: !49)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 45, column: 16, scope: !38)
!71 = !DILocation(line: 45, column: 14, scope: !38)
!72 = !DILocation(line: 47, column: 67, scope: !31)
!73 = !DILocation(line: 47, column: 5, scope: !31)
!74 = !DILocation(line: 48, column: 1, scope: !31)
!75 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_41_goodG2BSink", scope: !1, file: !1, line: 54, type: !21, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!76 = !DILocalVariable(name: "data", arg: 1, scope: !75, file: !1, line: 54, type: !3)
!77 = !DILocation(line: 54, column: 88, scope: !75)
!78 = !DILocation(line: 56, column: 22, scope: !75)
!79 = !DILocation(line: 56, column: 5, scope: !75)
!80 = !DILocation(line: 58, column: 10, scope: !75)
!81 = !DILocation(line: 58, column: 5, scope: !75)
!82 = !DILocation(line: 59, column: 1, scope: !75)
!83 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_41_good", scope: !1, file: !1, line: 87, type: !32, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!84 = !DILocation(line: 89, column: 5, scope: !83)
!85 = !DILocation(line: 90, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 62, type: !32, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!87 = !DILocalVariable(name: "data", scope: !86, file: !1, line: 64, type: !3)
!88 = !DILocation(line: 64, column: 21, scope: !86)
!89 = !DILocation(line: 65, column: 10, scope: !86)
!90 = !DILocalVariable(name: "dataBuffer", scope: !91, file: !1, line: 68, type: !3)
!91 = distinct !DILexicalBlock(scope: !86, file: !1, line: 66, column: 5)
!92 = !DILocation(line: 68, column: 25, scope: !91)
!93 = !DILocation(line: 68, column: 55, scope: !91)
!94 = !DILocation(line: 68, column: 38, scope: !91)
!95 = !DILocation(line: 69, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !1, line: 69, column: 13)
!97 = !DILocation(line: 69, column: 24, scope: !96)
!98 = !DILocation(line: 69, column: 13, scope: !91)
!99 = !DILocation(line: 71, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !1, line: 70, column: 9)
!101 = !DILocation(line: 72, column: 13, scope: !100)
!102 = !DILocalVariable(name: "i", scope: !103, file: !1, line: 75, type: !44)
!103 = distinct !DILexicalBlock(scope: !91, file: !1, line: 74, column: 9)
!104 = !DILocation(line: 75, column: 20, scope: !103)
!105 = !DILocation(line: 76, column: 20, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !1, line: 76, column: 13)
!107 = !DILocation(line: 76, column: 18, scope: !106)
!108 = !DILocation(line: 76, column: 25, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !1, line: 76, column: 13)
!110 = !DILocation(line: 76, column: 27, scope: !109)
!111 = !DILocation(line: 76, column: 13, scope: !106)
!112 = !DILocation(line: 78, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !1, line: 77, column: 13)
!114 = !DILocation(line: 78, column: 28, scope: !113)
!115 = !DILocation(line: 78, column: 31, scope: !113)
!116 = !DILocation(line: 78, column: 38, scope: !113)
!117 = !DILocation(line: 79, column: 17, scope: !113)
!118 = !DILocation(line: 79, column: 28, scope: !113)
!119 = !DILocation(line: 79, column: 31, scope: !113)
!120 = !DILocation(line: 79, column: 38, scope: !113)
!121 = !DILocation(line: 80, column: 13, scope: !113)
!122 = !DILocation(line: 76, column: 35, scope: !109)
!123 = !DILocation(line: 76, column: 13, scope: !109)
!124 = distinct !{!124, !111, !125, !69}
!125 = !DILocation(line: 80, column: 13, scope: !106)
!126 = !DILocation(line: 82, column: 16, scope: !91)
!127 = !DILocation(line: 82, column: 14, scope: !91)
!128 = !DILocation(line: 84, column: 71, scope: !86)
!129 = !DILocation(line: 84, column: 5, scope: !86)
!130 = !DILocation(line: 85, column: 1, scope: !86)
