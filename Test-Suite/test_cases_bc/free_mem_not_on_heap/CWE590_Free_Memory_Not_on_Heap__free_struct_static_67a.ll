; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_static_67a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_static_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }
%struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType = type { %struct._twoIntsStruct* }

@CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_bad.dataBuffer = internal global [100 x %struct._twoIntsStruct] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_bad() #0 !dbg !2 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType* %myStruct, metadata !32, metadata !DIExpression()), !dbg !37
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %0, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_bad.dataBuffer, i64 0, i64 %1, !dbg !55
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !56
  store i32 1, i32* %intOne, align 8, !dbg !57
  %2 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_bad.dataBuffer, i64 0, i64 %2, !dbg !59
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !60
  store i32 1, i32* %intTwo, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %3, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  store %struct._twoIntsStruct* getelementptr inbounds ([100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_bad.dataBuffer, i64 0, i64 0), %struct._twoIntsStruct** %data, align 8, !dbg !68
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !69
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType* %myStruct, i32 0, i32 0, !dbg !70
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %structFirst, align 8, !dbg !71
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType* %myStruct, i32 0, i32 0, !dbg !72
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %coerce.dive, align 8, !dbg !72
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_67b_badSink(%struct._twoIntsStruct* %5), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_67b_badSink(%struct._twoIntsStruct*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType* %myStruct, metadata !80, metadata !DIExpression()), !dbg !81
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !85
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !86
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !87
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !85
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !88
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @exit(i32 noundef 1) #6, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !95, metadata !DIExpression()), !dbg !97
  store i64 0, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !101
  %cmp1 = icmp ult i64 %2, 100, !dbg !103
  br i1 %cmp1, label %for.body, label %for.end, !dbg !104

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !105
  %4 = load i64, i64* %i, align 8, !dbg !107
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !105
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !108
  store i32 1, i32* %intOne, align 4, !dbg !109
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !110
  %6 = load i64, i64* %i, align 8, !dbg !111
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !110
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !112
  store i32 1, i32* %intTwo, align 4, !dbg !113
  br label %for.inc, !dbg !114

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !115
  %inc = add i64 %7, 1, !dbg !115
  store i64 %inc, i64* %i, align 8, !dbg !115
  br label %for.cond, !dbg !116, !llvm.loop !117

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !119
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !120
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !121
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType* %myStruct, i32 0, i32 0, !dbg !122
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %structFirst, align 8, !dbg !123
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType* %myStruct, i32 0, i32 0, !dbg !124
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %coerce.dive, align 8, !dbg !124
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_67b_goodG2BSink(%struct._twoIntsStruct* %10), !dbg !124
  ret void, !dbg !125
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_67b_goodG2BSink(%struct._twoIntsStruct*) #2

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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 38, type: !19, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_bad", scope: !3, file: !3, line: 31, type: !4, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_67a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "7de954106323f6cf6b9438b86227ce18")
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
!30 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 33, type: !8)
!31 = !DILocation(line: 33, column: 21, scope: !2)
!32 = !DILocalVariable(name: "myStruct", scope: !2, file: !3, line: 34, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType", file: !3, line: 24, baseType: !34)
!34 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType", file: !3, line: 21, size: 64, elements: !35)
!35 = !{!36}
!36 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !34, file: !3, line: 23, baseType: !8, size: 64)
!37 = !DILocation(line: 34, column: 70, scope: !2)
!38 = !DILocation(line: 35, column: 10, scope: !2)
!39 = !DILocalVariable(name: "i", scope: !40, file: !3, line: 40, type: !42)
!40 = distinct !DILexicalBlock(scope: !41, file: !3, line: 39, column: 9)
!41 = distinct !DILexicalBlock(scope: !2, file: !3, line: 36, column: 5)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!44 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 40, column: 20, scope: !40)
!46 = !DILocation(line: 41, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !40, file: !3, line: 41, column: 13)
!48 = !DILocation(line: 41, column: 18, scope: !47)
!49 = !DILocation(line: 41, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !3, line: 41, column: 13)
!51 = !DILocation(line: 41, column: 27, scope: !50)
!52 = !DILocation(line: 41, column: 13, scope: !47)
!53 = !DILocation(line: 43, column: 28, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !3, line: 42, column: 13)
!55 = !DILocation(line: 43, column: 17, scope: !54)
!56 = !DILocation(line: 43, column: 31, scope: !54)
!57 = !DILocation(line: 43, column: 38, scope: !54)
!58 = !DILocation(line: 44, column: 28, scope: !54)
!59 = !DILocation(line: 44, column: 17, scope: !54)
!60 = !DILocation(line: 44, column: 31, scope: !54)
!61 = !DILocation(line: 44, column: 38, scope: !54)
!62 = !DILocation(line: 45, column: 13, scope: !54)
!63 = !DILocation(line: 41, column: 35, scope: !50)
!64 = !DILocation(line: 41, column: 13, scope: !50)
!65 = distinct !{!65, !52, !66, !67}
!66 = !DILocation(line: 45, column: 13, scope: !47)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 47, column: 14, scope: !41)
!69 = !DILocation(line: 49, column: 28, scope: !2)
!70 = !DILocation(line: 49, column: 14, scope: !2)
!71 = !DILocation(line: 49, column: 26, scope: !2)
!72 = !DILocation(line: 50, column: 5, scope: !2)
!73 = !DILocation(line: 51, column: 1, scope: !2)
!74 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_good", scope: !3, file: !3, line: 87, type: !4, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!75 = !DILocation(line: 89, column: 5, scope: !74)
!76 = !DILocation(line: 90, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 60, type: !4, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!78 = !DILocalVariable(name: "data", scope: !77, file: !3, line: 62, type: !8)
!79 = !DILocation(line: 62, column: 21, scope: !77)
!80 = !DILocalVariable(name: "myStruct", scope: !77, file: !3, line: 63, type: !33)
!81 = !DILocation(line: 63, column: 70, scope: !77)
!82 = !DILocation(line: 64, column: 10, scope: !77)
!83 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !3, line: 67, type: !8)
!84 = distinct !DILexicalBlock(scope: !77, file: !3, line: 65, column: 5)
!85 = !DILocation(line: 67, column: 25, scope: !84)
!86 = !DILocation(line: 67, column: 55, scope: !84)
!87 = !DILocation(line: 67, column: 38, scope: !84)
!88 = !DILocation(line: 68, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !3, line: 68, column: 13)
!90 = !DILocation(line: 68, column: 24, scope: !89)
!91 = !DILocation(line: 68, column: 13, scope: !84)
!92 = !DILocation(line: 70, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !3, line: 69, column: 9)
!94 = !DILocation(line: 71, column: 13, scope: !93)
!95 = !DILocalVariable(name: "i", scope: !96, file: !3, line: 74, type: !42)
!96 = distinct !DILexicalBlock(scope: !84, file: !3, line: 73, column: 9)
!97 = !DILocation(line: 74, column: 20, scope: !96)
!98 = !DILocation(line: 75, column: 20, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !3, line: 75, column: 13)
!100 = !DILocation(line: 75, column: 18, scope: !99)
!101 = !DILocation(line: 75, column: 25, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !3, line: 75, column: 13)
!103 = !DILocation(line: 75, column: 27, scope: !102)
!104 = !DILocation(line: 75, column: 13, scope: !99)
!105 = !DILocation(line: 77, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !3, line: 76, column: 13)
!107 = !DILocation(line: 77, column: 28, scope: !106)
!108 = !DILocation(line: 77, column: 31, scope: !106)
!109 = !DILocation(line: 77, column: 38, scope: !106)
!110 = !DILocation(line: 78, column: 17, scope: !106)
!111 = !DILocation(line: 78, column: 28, scope: !106)
!112 = !DILocation(line: 78, column: 31, scope: !106)
!113 = !DILocation(line: 78, column: 38, scope: !106)
!114 = !DILocation(line: 79, column: 13, scope: !106)
!115 = !DILocation(line: 75, column: 35, scope: !102)
!116 = !DILocation(line: 75, column: 13, scope: !102)
!117 = distinct !{!117, !104, !118, !67}
!118 = !DILocation(line: 79, column: 13, scope: !99)
!119 = !DILocation(line: 81, column: 16, scope: !84)
!120 = !DILocation(line: 81, column: 14, scope: !84)
!121 = !DILocation(line: 83, column: 28, scope: !77)
!122 = !DILocation(line: 83, column: 14, scope: !77)
!123 = !DILocation(line: 83, column: 26, scope: !77)
!124 = !DILocation(line: 84, column: 5, scope: !77)
!125 = !DILocation(line: 85, column: 1, scope: !77)
