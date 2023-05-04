; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_static_41.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_static_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE590_Free_Memory_Not_on_Heap__free_struct_static_41_bad.dataBuffer = internal global [100 x %struct._twoIntsStruct] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_41_badSink(%struct._twoIntsStruct* noundef %data) #0 !dbg !30 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !33, metadata !DIExpression()), !dbg !34
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !35
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %0, i64 0, !dbg !35
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx), !dbg !36
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !37
  %2 = bitcast %struct._twoIntsStruct* %1 to i8*, !dbg !37
  call void @free(i8* noundef %2) #5, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_41_bad() #0 !dbg !2 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !40, metadata !DIExpression()), !dbg !41
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !53
  %cmp = icmp ult i64 %0, 100, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_41_bad.dataBuffer, i64 0, i64 %1, !dbg !59
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !60
  store i32 1, i32* %intOne, align 8, !dbg !61
  %2 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_41_bad.dataBuffer, i64 0, i64 %2, !dbg !63
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !64
  store i32 1, i32* %intTwo, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %3, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  store %struct._twoIntsStruct* getelementptr inbounds ([100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_41_bad.dataBuffer, i64 0, i64 0), %struct._twoIntsStruct** %data, align 8, !dbg !72
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !73
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_41_badSink(%struct._twoIntsStruct* noundef %4), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_41_goodG2BSink(%struct._twoIntsStruct* noundef %data) #0 !dbg !76 {
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_41_good() #0 !dbg !84 {
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
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_41_goodG2BSink(%struct._twoIntsStruct* noundef %9), !dbg !130
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

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 36, type: !19, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_41_bad", scope: !3, file: !3, line: 30, type: !4, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_41.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "040a9c356357ff379d7625887a462ab3")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !17, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !16}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !10, line: 100, baseType: !11)
!10 = !DIFile(filename: "./std_testcase.h", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1dccefb0310558c17683ded20b0d6982")
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !10, line: 96, size: 64, elements: !12)
!12 = !{!13, !15}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !11, file: !10, line: 98, baseType: !14, size: 32)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !11, file: !10, line: 99, baseType: !14, size: 32, offset: 32)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!17 = !{!0}
!18 = !{}
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 6400, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 100)
!22 = !{i32 7, !"Dwarf Version", i32 5}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"PIC Level", i32 2}
!26 = !{i32 7, !"PIE Level", i32 2}
!27 = !{i32 7, !"uwtable", i32 1}
!28 = !{i32 7, !"frame-pointer", i32 2}
!29 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!30 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_41_badSink", scope: !3, file: !3, line: 23, type: !31, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !8}
!33 = !DILocalVariable(name: "data", arg: 1, scope: !30, file: !3, line: 23, type: !8)
!34 = !DILocation(line: 23, column: 84, scope: !30)
!35 = !DILocation(line: 25, column: 22, scope: !30)
!36 = !DILocation(line: 25, column: 5, scope: !30)
!37 = !DILocation(line: 27, column: 10, scope: !30)
!38 = !DILocation(line: 27, column: 5, scope: !30)
!39 = !DILocation(line: 28, column: 1, scope: !30)
!40 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 32, type: !8)
!41 = !DILocation(line: 32, column: 21, scope: !2)
!42 = !DILocation(line: 33, column: 10, scope: !2)
!43 = !DILocalVariable(name: "i", scope: !44, file: !3, line: 38, type: !46)
!44 = distinct !DILexicalBlock(scope: !45, file: !3, line: 37, column: 9)
!45 = distinct !DILexicalBlock(scope: !2, file: !3, line: 34, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!48 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 38, column: 20, scope: !44)
!50 = !DILocation(line: 39, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !44, file: !3, line: 39, column: 13)
!52 = !DILocation(line: 39, column: 18, scope: !51)
!53 = !DILocation(line: 39, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !3, line: 39, column: 13)
!55 = !DILocation(line: 39, column: 27, scope: !54)
!56 = !DILocation(line: 39, column: 13, scope: !51)
!57 = !DILocation(line: 41, column: 28, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !3, line: 40, column: 13)
!59 = !DILocation(line: 41, column: 17, scope: !58)
!60 = !DILocation(line: 41, column: 31, scope: !58)
!61 = !DILocation(line: 41, column: 38, scope: !58)
!62 = !DILocation(line: 42, column: 28, scope: !58)
!63 = !DILocation(line: 42, column: 17, scope: !58)
!64 = !DILocation(line: 42, column: 31, scope: !58)
!65 = !DILocation(line: 42, column: 38, scope: !58)
!66 = !DILocation(line: 43, column: 13, scope: !58)
!67 = !DILocation(line: 39, column: 35, scope: !54)
!68 = !DILocation(line: 39, column: 13, scope: !54)
!69 = distinct !{!69, !56, !70, !71}
!70 = !DILocation(line: 43, column: 13, scope: !51)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 45, column: 14, scope: !45)
!73 = !DILocation(line: 47, column: 67, scope: !2)
!74 = !DILocation(line: 47, column: 5, scope: !2)
!75 = !DILocation(line: 48, column: 1, scope: !2)
!76 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_41_goodG2BSink", scope: !3, file: !3, line: 54, type: !31, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!77 = !DILocalVariable(name: "data", arg: 1, scope: !76, file: !3, line: 54, type: !8)
!78 = !DILocation(line: 54, column: 88, scope: !76)
!79 = !DILocation(line: 56, column: 22, scope: !76)
!80 = !DILocation(line: 56, column: 5, scope: !76)
!81 = !DILocation(line: 58, column: 10, scope: !76)
!82 = !DILocation(line: 58, column: 5, scope: !76)
!83 = !DILocation(line: 59, column: 1, scope: !76)
!84 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_41_good", scope: !3, file: !3, line: 87, type: !4, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!85 = !DILocation(line: 89, column: 5, scope: !84)
!86 = !DILocation(line: 90, column: 1, scope: !84)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 62, type: !4, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!88 = !DILocalVariable(name: "data", scope: !87, file: !3, line: 64, type: !8)
!89 = !DILocation(line: 64, column: 21, scope: !87)
!90 = !DILocation(line: 65, column: 10, scope: !87)
!91 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !3, line: 68, type: !8)
!92 = distinct !DILexicalBlock(scope: !87, file: !3, line: 66, column: 5)
!93 = !DILocation(line: 68, column: 25, scope: !92)
!94 = !DILocation(line: 68, column: 55, scope: !92)
!95 = !DILocation(line: 68, column: 38, scope: !92)
!96 = !DILocation(line: 69, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !3, line: 69, column: 13)
!98 = !DILocation(line: 69, column: 24, scope: !97)
!99 = !DILocation(line: 69, column: 13, scope: !92)
!100 = !DILocation(line: 71, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !3, line: 70, column: 9)
!102 = !DILocation(line: 72, column: 13, scope: !101)
!103 = !DILocalVariable(name: "i", scope: !104, file: !3, line: 75, type: !46)
!104 = distinct !DILexicalBlock(scope: !92, file: !3, line: 74, column: 9)
!105 = !DILocation(line: 75, column: 20, scope: !104)
!106 = !DILocation(line: 76, column: 20, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !3, line: 76, column: 13)
!108 = !DILocation(line: 76, column: 18, scope: !107)
!109 = !DILocation(line: 76, column: 25, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !3, line: 76, column: 13)
!111 = !DILocation(line: 76, column: 27, scope: !110)
!112 = !DILocation(line: 76, column: 13, scope: !107)
!113 = !DILocation(line: 78, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !3, line: 77, column: 13)
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
!125 = distinct !{!125, !112, !126, !71}
!126 = !DILocation(line: 80, column: 13, scope: !107)
!127 = !DILocation(line: 82, column: 16, scope: !92)
!128 = !DILocation(line: 82, column: 14, scope: !92)
!129 = !DILocation(line: 84, column: 71, scope: !87)
!130 = !DILocation(line: 84, column: 5, scope: !87)
!131 = !DILocation(line: 85, column: 1, scope: !87)
