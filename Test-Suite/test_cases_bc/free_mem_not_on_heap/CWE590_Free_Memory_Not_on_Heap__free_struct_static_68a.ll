; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_static_68a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_static_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE590_Free_Memory_Not_on_Heap__free_struct_static_68_bad.dataBuffer = internal global [100 x %struct._twoIntsStruct] zeroinitializer, align 16, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_struct_static_68_badData = dso_local global %struct._twoIntsStruct* null, align 8, !dbg !18
@CWE590_Free_Memory_Not_on_Heap__free_struct_static_68_goodG2BData = dso_local global %struct._twoIntsStruct* null, align 8, !dbg !20
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_68_bad() #0 !dbg !2 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !34, metadata !DIExpression()), !dbg !35
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %0, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_68_bad.dataBuffer, i64 0, i64 %1, !dbg !53
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !54
  store i32 1, i32* %intOne, align 8, !dbg !55
  %2 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_68_bad.dataBuffer, i64 0, i64 %2, !dbg !57
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !58
  store i32 1, i32* %intTwo, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %3, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  store %struct._twoIntsStruct* getelementptr inbounds ([100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_68_bad.dataBuffer, i64 0, i64 0), %struct._twoIntsStruct** %data, align 8, !dbg !66
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !67
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** @CWE590_Free_Memory_Not_on_Heap__free_struct_static_68_badData, align 8, !dbg !68
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_struct_static_68b_badSink(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_68b_badSink(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_68_good() #0 !dbg !71 {
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
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** @CWE590_Free_Memory_Not_on_Heap__free_struct_static_68_goodG2BData, align 8, !dbg !117
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_struct_static_68b_goodG2BSink(), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_68b_goodG2BSink(...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!26, !27, !28, !29, !30, !31, !32}
!llvm.ident = !{!33}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 35, type: !23, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_68_bad", scope: !3, file: !3, line: 29, type: !4, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !22)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_68a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "ff2edafd3f3f87436bd386c255e12c97")
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
!17 = !{!0, !18, !20}
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_68_badData", scope: !6, file: !3, line: 21, type: !8, isLocal: false, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_68_goodG2BData", scope: !6, file: !3, line: 22, type: !8, isLocal: false, isDefinition: true)
!22 = !{}
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 6400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !{i32 7, !"Dwarf Version", i32 5}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 4}
!29 = !{i32 7, !"PIC Level", i32 2}
!30 = !{i32 7, !"PIE Level", i32 2}
!31 = !{i32 7, !"uwtable", i32 1}
!32 = !{i32 7, !"frame-pointer", i32 2}
!33 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!34 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 31, type: !8)
!35 = !DILocation(line: 31, column: 21, scope: !2)
!36 = !DILocation(line: 32, column: 10, scope: !2)
!37 = !DILocalVariable(name: "i", scope: !38, file: !3, line: 37, type: !40)
!38 = distinct !DILexicalBlock(scope: !39, file: !3, line: 36, column: 9)
!39 = distinct !DILexicalBlock(scope: !2, file: !3, line: 33, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 37, column: 20, scope: !38)
!44 = !DILocation(line: 38, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !38, file: !3, line: 38, column: 13)
!46 = !DILocation(line: 38, column: 18, scope: !45)
!47 = !DILocation(line: 38, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !3, line: 38, column: 13)
!49 = !DILocation(line: 38, column: 27, scope: !48)
!50 = !DILocation(line: 38, column: 13, scope: !45)
!51 = !DILocation(line: 40, column: 28, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !3, line: 39, column: 13)
!53 = !DILocation(line: 40, column: 17, scope: !52)
!54 = !DILocation(line: 40, column: 31, scope: !52)
!55 = !DILocation(line: 40, column: 38, scope: !52)
!56 = !DILocation(line: 41, column: 28, scope: !52)
!57 = !DILocation(line: 41, column: 17, scope: !52)
!58 = !DILocation(line: 41, column: 31, scope: !52)
!59 = !DILocation(line: 41, column: 38, scope: !52)
!60 = !DILocation(line: 42, column: 13, scope: !52)
!61 = !DILocation(line: 38, column: 35, scope: !48)
!62 = !DILocation(line: 38, column: 13, scope: !48)
!63 = distinct !{!63, !50, !64, !65}
!64 = !DILocation(line: 42, column: 13, scope: !45)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 44, column: 14, scope: !39)
!67 = !DILocation(line: 46, column: 69, scope: !2)
!68 = !DILocation(line: 46, column: 67, scope: !2)
!69 = !DILocation(line: 47, column: 5, scope: !2)
!70 = !DILocation(line: 48, column: 1, scope: !2)
!71 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_68_good", scope: !3, file: !3, line: 84, type: !4, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !22)
!72 = !DILocation(line: 86, column: 5, scope: !71)
!73 = !DILocation(line: 87, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 58, type: !4, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !22)
!75 = !DILocalVariable(name: "data", scope: !74, file: !3, line: 60, type: !8)
!76 = !DILocation(line: 60, column: 21, scope: !74)
!77 = !DILocation(line: 61, column: 10, scope: !74)
!78 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !3, line: 64, type: !8)
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
!90 = !DILocalVariable(name: "i", scope: !91, file: !3, line: 71, type: !40)
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
!112 = distinct !{!112, !99, !113, !65}
!113 = !DILocation(line: 76, column: 13, scope: !94)
!114 = !DILocation(line: 78, column: 16, scope: !79)
!115 = !DILocation(line: 78, column: 14, scope: !79)
!116 = !DILocation(line: 80, column: 73, scope: !74)
!117 = !DILocation(line: 80, column: 71, scope: !74)
!118 = !DILocation(line: 81, column: 5, scope: !74)
!119 = !DILocation(line: 82, column: 1, scope: !74)
