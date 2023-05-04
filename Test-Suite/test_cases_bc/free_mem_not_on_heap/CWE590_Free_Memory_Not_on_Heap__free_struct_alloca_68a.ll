; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68_badData = dso_local global %struct._twoIntsStruct* null, align 8, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68_goodG2BData = dso_local global %struct._twoIntsStruct* null, align 8, !dbg !15
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68_bad() #0 !dbg !25 {
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
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68_badData, align 8, !dbg !68
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68b_badSink(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68b_badSink(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68_good() #0 !dbg !71 {
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
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !80
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !81
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !82
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !80
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !83
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @exit(i32 noundef 1) #6, !dbg !89
  unreachable, !dbg !89

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !90, metadata !DIExpression()), !dbg !92
  store i64 0, i64* %i, align 8, !dbg !93
  br label %for.cond, !dbg !95

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !96
  %cmp1 = icmp ult i64 %2, 100, !dbg !98
  br i1 %cmp1, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !100
  %4 = load i64, i64* %i, align 8, !dbg !102
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !100
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !103
  store i32 1, i32* %intOne, align 4, !dbg !104
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !105
  %6 = load i64, i64* %i, align 8, !dbg !106
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !105
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !107
  store i32 1, i32* %intTwo, align 4, !dbg !108
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !110
  %inc = add i64 %7, 1, !dbg !110
  store i64 %inc, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !111, !llvm.loop !112

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !114
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !115
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !116
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68_goodG2BData, align 8, !dbg !117
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68b_goodG2BSink(), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68b_goodG2BSink(...) #2

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
!1 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68_badData", scope: !2, file: !3, line: 21, type: !5, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "cd9a28d58a3bbc827ea5ef2aee021233")
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
!16 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68_goodG2BData", scope: !2, file: !3, line: 22, type: !5, isLocal: false, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 5}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"PIC Level", i32 2}
!21 = !{i32 7, !"PIE Level", i32 2}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!25 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68_bad", scope: !3, file: !3, line: 29, type: !26, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !{}
!29 = !DILocalVariable(name: "data", scope: !25, file: !3, line: 31, type: !5)
!30 = !DILocation(line: 31, column: 21, scope: !25)
!31 = !DILocation(line: 32, column: 10, scope: !25)
!32 = !DILocalVariable(name: "dataBuffer", scope: !33, file: !3, line: 35, type: !5)
!33 = distinct !DILexicalBlock(scope: !25, file: !3, line: 33, column: 5)
!34 = !DILocation(line: 35, column: 25, scope: !33)
!35 = !DILocation(line: 35, column: 55, scope: !33)
!36 = !DILocation(line: 35, column: 38, scope: !33)
!37 = !DILocalVariable(name: "i", scope: !38, file: !3, line: 37, type: !39)
!38 = distinct !DILexicalBlock(scope: !33, file: !3, line: 36, column: 9)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 37, column: 20, scope: !38)
!43 = !DILocation(line: 38, column: 20, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !3, line: 38, column: 13)
!45 = !DILocation(line: 38, column: 18, scope: !44)
!46 = !DILocation(line: 38, column: 25, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !3, line: 38, column: 13)
!48 = !DILocation(line: 38, column: 27, scope: !47)
!49 = !DILocation(line: 38, column: 13, scope: !44)
!50 = !DILocation(line: 40, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !3, line: 39, column: 13)
!52 = !DILocation(line: 40, column: 28, scope: !51)
!53 = !DILocation(line: 40, column: 31, scope: !51)
!54 = !DILocation(line: 40, column: 38, scope: !51)
!55 = !DILocation(line: 41, column: 17, scope: !51)
!56 = !DILocation(line: 41, column: 28, scope: !51)
!57 = !DILocation(line: 41, column: 31, scope: !51)
!58 = !DILocation(line: 41, column: 38, scope: !51)
!59 = !DILocation(line: 42, column: 13, scope: !51)
!60 = !DILocation(line: 38, column: 35, scope: !47)
!61 = !DILocation(line: 38, column: 13, scope: !47)
!62 = distinct !{!62, !49, !63, !64}
!63 = !DILocation(line: 42, column: 13, scope: !44)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 44, column: 16, scope: !33)
!66 = !DILocation(line: 44, column: 14, scope: !33)
!67 = !DILocation(line: 46, column: 69, scope: !25)
!68 = !DILocation(line: 46, column: 67, scope: !25)
!69 = !DILocation(line: 47, column: 5, scope: !25)
!70 = !DILocation(line: 48, column: 1, scope: !25)
!71 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_68_good", scope: !3, file: !3, line: 84, type: !26, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!72 = !DILocation(line: 86, column: 5, scope: !71)
!73 = !DILocation(line: 87, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 58, type: !26, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!75 = !DILocalVariable(name: "data", scope: !74, file: !3, line: 60, type: !5)
!76 = !DILocation(line: 60, column: 21, scope: !74)
!77 = !DILocation(line: 61, column: 10, scope: !74)
!78 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !3, line: 64, type: !5)
!79 = distinct !DILexicalBlock(scope: !74, file: !3, line: 62, column: 5)
!80 = !DILocation(line: 64, column: 25, scope: !79)
!81 = !DILocation(line: 64, column: 55, scope: !79)
!82 = !DILocation(line: 64, column: 38, scope: !79)
!83 = !DILocation(line: 65, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !79, file: !3, line: 65, column: 13)
!85 = !DILocation(line: 65, column: 24, scope: !84)
!86 = !DILocation(line: 65, column: 13, scope: !79)
!87 = !DILocation(line: 67, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !3, line: 66, column: 9)
!89 = !DILocation(line: 68, column: 13, scope: !88)
!90 = !DILocalVariable(name: "i", scope: !91, file: !3, line: 71, type: !39)
!91 = distinct !DILexicalBlock(scope: !79, file: !3, line: 70, column: 9)
!92 = !DILocation(line: 71, column: 20, scope: !91)
!93 = !DILocation(line: 72, column: 20, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !3, line: 72, column: 13)
!95 = !DILocation(line: 72, column: 18, scope: !94)
!96 = !DILocation(line: 72, column: 25, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !3, line: 72, column: 13)
!98 = !DILocation(line: 72, column: 27, scope: !97)
!99 = !DILocation(line: 72, column: 13, scope: !94)
!100 = !DILocation(line: 74, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !3, line: 73, column: 13)
!102 = !DILocation(line: 74, column: 28, scope: !101)
!103 = !DILocation(line: 74, column: 31, scope: !101)
!104 = !DILocation(line: 74, column: 38, scope: !101)
!105 = !DILocation(line: 75, column: 17, scope: !101)
!106 = !DILocation(line: 75, column: 28, scope: !101)
!107 = !DILocation(line: 75, column: 31, scope: !101)
!108 = !DILocation(line: 75, column: 38, scope: !101)
!109 = !DILocation(line: 76, column: 13, scope: !101)
!110 = !DILocation(line: 72, column: 35, scope: !97)
!111 = !DILocation(line: 72, column: 13, scope: !97)
!112 = distinct !{!112, !99, !113, !64}
!113 = !DILocation(line: 76, column: 13, scope: !94)
!114 = !DILocation(line: 78, column: 16, scope: !79)
!115 = !DILocation(line: 78, column: 14, scope: !79)
!116 = !DILocation(line: 80, column: 73, scope: !74)
!117 = !DILocation(line: 80, column: 71, scope: !74)
!118 = !DILocation(line: 81, column: 5, scope: !74)
!119 = !DILocation(line: 82, column: 1, scope: !74)
