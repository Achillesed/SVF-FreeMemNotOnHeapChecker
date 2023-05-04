; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }
%struct._CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_structType = type { %struct._twoIntsStruct* }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_structType, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_structType* %myStruct, metadata !26, metadata !DIExpression()), !dbg !31
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !33, metadata !DIExpression()), !dbg !35
  %0 = alloca i8, i64 800, align 16, !dbg !36
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !37
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %2, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !51
  %4 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !51
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !54
  store i32 1, i32* %intOne, align 4, !dbg !55
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !56
  %6 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !56
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !58
  store i32 1, i32* %intTwo, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %7, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !66
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !67
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !68
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !69
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %structFirst, align 8, !dbg !70
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !71
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %coerce.dive, align 8, !dbg !71
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67b_badSink(%struct._twoIntsStruct* %10), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67b_badSink(%struct._twoIntsStruct*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_good() #0 !dbg !73 {
entry:
  call void @goodG2B(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_structType, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_structType* %myStruct, metadata !79, metadata !DIExpression()), !dbg !80
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
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !120
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !121
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %structFirst, align 8, !dbg !122
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !123
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %coerce.dive, align 8, !dbg !123
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67b_goodG2BSink(%struct._twoIntsStruct* %10), !dbg !123
  ret void, !dbg !124
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67b_goodG2BSink(%struct._twoIntsStruct*) #2

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "46fe19414fe905ba90ff206e99650362")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_bad", scope: !1, file: !1, line: 31, type: !21, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 33, type: !3)
!25 = !DILocation(line: 33, column: 21, scope: !20)
!26 = !DILocalVariable(name: "myStruct", scope: !20, file: !1, line: 34, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_structType", file: !1, line: 24, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_structType", file: !1, line: 21, size: 64, elements: !29)
!29 = !{!30}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !28, file: !1, line: 23, baseType: !3, size: 64)
!31 = !DILocation(line: 34, column: 70, scope: !20)
!32 = !DILocation(line: 35, column: 10, scope: !20)
!33 = !DILocalVariable(name: "dataBuffer", scope: !34, file: !1, line: 38, type: !3)
!34 = distinct !DILexicalBlock(scope: !20, file: !1, line: 36, column: 5)
!35 = !DILocation(line: 38, column: 25, scope: !34)
!36 = !DILocation(line: 38, column: 55, scope: !34)
!37 = !DILocation(line: 38, column: 38, scope: !34)
!38 = !DILocalVariable(name: "i", scope: !39, file: !1, line: 40, type: !40)
!39 = distinct !DILexicalBlock(scope: !34, file: !1, line: 39, column: 9)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 40, column: 20, scope: !39)
!44 = !DILocation(line: 41, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !1, line: 41, column: 13)
!46 = !DILocation(line: 41, column: 18, scope: !45)
!47 = !DILocation(line: 41, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !1, line: 41, column: 13)
!49 = !DILocation(line: 41, column: 27, scope: !48)
!50 = !DILocation(line: 41, column: 13, scope: !45)
!51 = !DILocation(line: 43, column: 17, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !1, line: 42, column: 13)
!53 = !DILocation(line: 43, column: 28, scope: !52)
!54 = !DILocation(line: 43, column: 31, scope: !52)
!55 = !DILocation(line: 43, column: 38, scope: !52)
!56 = !DILocation(line: 44, column: 17, scope: !52)
!57 = !DILocation(line: 44, column: 28, scope: !52)
!58 = !DILocation(line: 44, column: 31, scope: !52)
!59 = !DILocation(line: 44, column: 38, scope: !52)
!60 = !DILocation(line: 45, column: 13, scope: !52)
!61 = !DILocation(line: 41, column: 35, scope: !48)
!62 = !DILocation(line: 41, column: 13, scope: !48)
!63 = distinct !{!63, !50, !64, !65}
!64 = !DILocation(line: 45, column: 13, scope: !45)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 47, column: 16, scope: !34)
!67 = !DILocation(line: 47, column: 14, scope: !34)
!68 = !DILocation(line: 49, column: 28, scope: !20)
!69 = !DILocation(line: 49, column: 14, scope: !20)
!70 = !DILocation(line: 49, column: 26, scope: !20)
!71 = !DILocation(line: 50, column: 5, scope: !20)
!72 = !DILocation(line: 51, column: 1, scope: !20)
!73 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_67_good", scope: !1, file: !1, line: 87, type: !21, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!74 = !DILocation(line: 89, column: 5, scope: !73)
!75 = !DILocation(line: 90, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!77 = !DILocalVariable(name: "data", scope: !76, file: !1, line: 62, type: !3)
!78 = !DILocation(line: 62, column: 21, scope: !76)
!79 = !DILocalVariable(name: "myStruct", scope: !76, file: !1, line: 63, type: !27)
!80 = !DILocation(line: 63, column: 70, scope: !76)
!81 = !DILocation(line: 64, column: 10, scope: !76)
!82 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !1, line: 67, type: !3)
!83 = distinct !DILexicalBlock(scope: !76, file: !1, line: 65, column: 5)
!84 = !DILocation(line: 67, column: 25, scope: !83)
!85 = !DILocation(line: 67, column: 55, scope: !83)
!86 = !DILocation(line: 67, column: 38, scope: !83)
!87 = !DILocation(line: 68, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !1, line: 68, column: 13)
!89 = !DILocation(line: 68, column: 24, scope: !88)
!90 = !DILocation(line: 68, column: 13, scope: !83)
!91 = !DILocation(line: 70, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !1, line: 69, column: 9)
!93 = !DILocation(line: 71, column: 13, scope: !92)
!94 = !DILocalVariable(name: "i", scope: !95, file: !1, line: 74, type: !40)
!95 = distinct !DILexicalBlock(scope: !83, file: !1, line: 73, column: 9)
!96 = !DILocation(line: 74, column: 20, scope: !95)
!97 = !DILocation(line: 75, column: 20, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !1, line: 75, column: 13)
!99 = !DILocation(line: 75, column: 18, scope: !98)
!100 = !DILocation(line: 75, column: 25, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !1, line: 75, column: 13)
!102 = !DILocation(line: 75, column: 27, scope: !101)
!103 = !DILocation(line: 75, column: 13, scope: !98)
!104 = !DILocation(line: 77, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !1, line: 76, column: 13)
!106 = !DILocation(line: 77, column: 28, scope: !105)
!107 = !DILocation(line: 77, column: 31, scope: !105)
!108 = !DILocation(line: 77, column: 38, scope: !105)
!109 = !DILocation(line: 78, column: 17, scope: !105)
!110 = !DILocation(line: 78, column: 28, scope: !105)
!111 = !DILocation(line: 78, column: 31, scope: !105)
!112 = !DILocation(line: 78, column: 38, scope: !105)
!113 = !DILocation(line: 79, column: 13, scope: !105)
!114 = !DILocation(line: 75, column: 35, scope: !101)
!115 = !DILocation(line: 75, column: 13, scope: !101)
!116 = distinct !{!116, !103, !117, !65}
!117 = !DILocation(line: 79, column: 13, scope: !98)
!118 = !DILocation(line: 81, column: 16, scope: !83)
!119 = !DILocation(line: 81, column: 14, scope: !83)
!120 = !DILocation(line: 83, column: 28, scope: !76)
!121 = !DILocation(line: 83, column: 14, scope: !76)
!122 = !DILocation(line: 83, column: 26, scope: !76)
!123 = !DILocation(line: 84, column: 5, scope: !76)
!124 = !DILocation(line: 85, column: 1, scope: !76)
