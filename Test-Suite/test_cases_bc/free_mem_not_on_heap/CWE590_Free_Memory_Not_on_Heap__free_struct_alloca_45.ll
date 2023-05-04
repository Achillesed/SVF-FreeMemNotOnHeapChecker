; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_45.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_45_badData = internal global %struct._twoIntsStruct* null, align 8, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1
@CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_45_goodG2BData = internal global %struct._twoIntsStruct* null, align 8, !dbg !15

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_45_bad() #0 !dbg !25 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !29, metadata !DIExpression()), !dbg !30
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !32, metadata !DIExpression()), !dbg !34
  %0 = alloca i8, i64 800, align 16, !dbg !35
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !36
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %2, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !50
  %4 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !50
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !53
  store i32 1, i32* %intOne, align 4, !dbg !54
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !55
  %6 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !55
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !57
  store i32 1, i32* %intTwo, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %7, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !65
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !66
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !67
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_45_badData, align 8, !dbg !68
  call void @badSink(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_45_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink() #0 !dbg !74 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_45_badData, align 8, !dbg !77
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %1, i64 0, !dbg !78
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx), !dbg !79
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !80
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !80
  call void @free(i8* noundef %3) #5, !dbg !81
  ret void, !dbg !82
}

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !89
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !90
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !91
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !89
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !92
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @exit(i32 noundef 1) #6, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !99, metadata !DIExpression()), !dbg !101
  store i64 0, i64* %i, align 8, !dbg !102
  br label %for.cond, !dbg !104

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !105
  %cmp1 = icmp ult i64 %2, 100, !dbg !107
  br i1 %cmp1, label %for.body, label %for.end, !dbg !108

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !109
  %4 = load i64, i64* %i, align 8, !dbg !111
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !109
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !112
  store i32 1, i32* %intOne, align 4, !dbg !113
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !114
  %6 = load i64, i64* %i, align 8, !dbg !115
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !114
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !116
  store i32 1, i32* %intTwo, align 4, !dbg !117
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !119
  %inc = add i64 %7, 1, !dbg !119
  store i64 %inc, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !120, !llvm.loop !121

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !123
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !124
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !125
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_45_goodG2BData, align 8, !dbg !126
  call void @goodG2BSink(), !dbg !127
  ret void, !dbg !128
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink() #0 !dbg !129 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !130, metadata !DIExpression()), !dbg !131
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_45_goodG2BData, align 8, !dbg !132
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !131
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !133
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %1, i64 0, !dbg !133
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx), !dbg !134
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !135
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !135
  call void @free(i8* noundef %3) #5, !dbg !136
  ret void, !dbg !137
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_45_badData", scope: !2, file: !3, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_45.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "637baa13756dab229cb58c55a00cec3c")
!4 = !{!5, !13}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !7, line: 100, baseType: !8)
!7 = !DIFile(filename: "./std_testcase.h", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1dccefb0310558c17683ded20b0d6982")
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !7, line: 96, size: 64, elements: !9)
!9 = !{!10, !12}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !8, file: !7, line: 98, baseType: !11, size: 32)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !8, file: !7, line: 99, baseType: !11, size: 32, offset: 32)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_45_goodG2BData", scope: !2, file: !3, line: 22, type: !5, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 5}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"PIC Level", i32 2}
!21 = !{i32 7, !"PIE Level", i32 2}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!25 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_45_bad", scope: !3, file: !3, line: 34, type: !26, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !{}
!29 = !DILocalVariable(name: "data", scope: !25, file: !3, line: 36, type: !5)
!30 = !DILocation(line: 36, column: 21, scope: !25)
!31 = !DILocation(line: 37, column: 10, scope: !25)
!32 = !DILocalVariable(name: "dataBuffer", scope: !33, file: !3, line: 40, type: !5)
!33 = distinct !DILexicalBlock(scope: !25, file: !3, line: 38, column: 5)
!34 = !DILocation(line: 40, column: 25, scope: !33)
!35 = !DILocation(line: 40, column: 55, scope: !33)
!36 = !DILocation(line: 40, column: 38, scope: !33)
!37 = !DILocalVariable(name: "i", scope: !38, file: !3, line: 42, type: !39)
!38 = distinct !DILexicalBlock(scope: !33, file: !3, line: 41, column: 9)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 42, column: 20, scope: !38)
!43 = !DILocation(line: 43, column: 20, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !3, line: 43, column: 13)
!45 = !DILocation(line: 43, column: 18, scope: !44)
!46 = !DILocation(line: 43, column: 25, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !3, line: 43, column: 13)
!48 = !DILocation(line: 43, column: 27, scope: !47)
!49 = !DILocation(line: 43, column: 13, scope: !44)
!50 = !DILocation(line: 45, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !3, line: 44, column: 13)
!52 = !DILocation(line: 45, column: 28, scope: !51)
!53 = !DILocation(line: 45, column: 31, scope: !51)
!54 = !DILocation(line: 45, column: 38, scope: !51)
!55 = !DILocation(line: 46, column: 17, scope: !51)
!56 = !DILocation(line: 46, column: 28, scope: !51)
!57 = !DILocation(line: 46, column: 31, scope: !51)
!58 = !DILocation(line: 46, column: 38, scope: !51)
!59 = !DILocation(line: 47, column: 13, scope: !51)
!60 = !DILocation(line: 43, column: 35, scope: !47)
!61 = !DILocation(line: 43, column: 13, scope: !47)
!62 = distinct !{!62, !49, !63, !64}
!63 = !DILocation(line: 47, column: 13, scope: !44)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 49, column: 16, scope: !33)
!66 = !DILocation(line: 49, column: 14, scope: !33)
!67 = !DILocation(line: 51, column: 69, scope: !25)
!68 = !DILocation(line: 51, column: 67, scope: !25)
!69 = !DILocation(line: 52, column: 5, scope: !25)
!70 = !DILocation(line: 53, column: 1, scope: !25)
!71 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_45_good", scope: !3, file: !3, line: 94, type: !26, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!72 = !DILocation(line: 96, column: 5, scope: !71)
!73 = !DILocation(line: 97, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "badSink", scope: !3, file: !3, line: 26, type: !26, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!75 = !DILocalVariable(name: "data", scope: !74, file: !3, line: 28, type: !5)
!76 = !DILocation(line: 28, column: 21, scope: !74)
!77 = !DILocation(line: 28, column: 28, scope: !74)
!78 = !DILocation(line: 29, column: 22, scope: !74)
!79 = !DILocation(line: 29, column: 5, scope: !74)
!80 = !DILocation(line: 31, column: 10, scope: !74)
!81 = !DILocation(line: 31, column: 5, scope: !74)
!82 = !DILocation(line: 32, column: 1, scope: !74)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 68, type: !26, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!84 = !DILocalVariable(name: "data", scope: !83, file: !3, line: 70, type: !5)
!85 = !DILocation(line: 70, column: 21, scope: !83)
!86 = !DILocation(line: 71, column: 10, scope: !83)
!87 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !3, line: 74, type: !5)
!88 = distinct !DILexicalBlock(scope: !83, file: !3, line: 72, column: 5)
!89 = !DILocation(line: 74, column: 25, scope: !88)
!90 = !DILocation(line: 74, column: 55, scope: !88)
!91 = !DILocation(line: 74, column: 38, scope: !88)
!92 = !DILocation(line: 75, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !3, line: 75, column: 13)
!94 = !DILocation(line: 75, column: 24, scope: !93)
!95 = !DILocation(line: 75, column: 13, scope: !88)
!96 = !DILocation(line: 77, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !3, line: 76, column: 9)
!98 = !DILocation(line: 78, column: 13, scope: !97)
!99 = !DILocalVariable(name: "i", scope: !100, file: !3, line: 81, type: !39)
!100 = distinct !DILexicalBlock(scope: !88, file: !3, line: 80, column: 9)
!101 = !DILocation(line: 81, column: 20, scope: !100)
!102 = !DILocation(line: 82, column: 20, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !3, line: 82, column: 13)
!104 = !DILocation(line: 82, column: 18, scope: !103)
!105 = !DILocation(line: 82, column: 25, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !3, line: 82, column: 13)
!107 = !DILocation(line: 82, column: 27, scope: !106)
!108 = !DILocation(line: 82, column: 13, scope: !103)
!109 = !DILocation(line: 84, column: 17, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !3, line: 83, column: 13)
!111 = !DILocation(line: 84, column: 28, scope: !110)
!112 = !DILocation(line: 84, column: 31, scope: !110)
!113 = !DILocation(line: 84, column: 38, scope: !110)
!114 = !DILocation(line: 85, column: 17, scope: !110)
!115 = !DILocation(line: 85, column: 28, scope: !110)
!116 = !DILocation(line: 85, column: 31, scope: !110)
!117 = !DILocation(line: 85, column: 38, scope: !110)
!118 = !DILocation(line: 86, column: 13, scope: !110)
!119 = !DILocation(line: 82, column: 35, scope: !106)
!120 = !DILocation(line: 82, column: 13, scope: !106)
!121 = distinct !{!121, !108, !122, !64}
!122 = !DILocation(line: 86, column: 13, scope: !103)
!123 = !DILocation(line: 88, column: 16, scope: !88)
!124 = !DILocation(line: 88, column: 14, scope: !88)
!125 = !DILocation(line: 90, column: 73, scope: !83)
!126 = !DILocation(line: 90, column: 71, scope: !83)
!127 = !DILocation(line: 91, column: 5, scope: !83)
!128 = !DILocation(line: 92, column: 1, scope: !83)
!129 = distinct !DISubprogram(name: "goodG2BSink", scope: !3, file: !3, line: 60, type: !26, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!130 = !DILocalVariable(name: "data", scope: !129, file: !3, line: 62, type: !5)
!131 = !DILocation(line: 62, column: 21, scope: !129)
!132 = !DILocation(line: 62, column: 28, scope: !129)
!133 = !DILocation(line: 63, column: 22, scope: !129)
!134 = !DILocation(line: 63, column: 5, scope: !129)
!135 = !DILocation(line: 65, column: 10, scope: !129)
!136 = !DILocation(line: 65, column: 5, scope: !129)
!137 = !DILocation(line: 66, column: 1, scope: !129)
