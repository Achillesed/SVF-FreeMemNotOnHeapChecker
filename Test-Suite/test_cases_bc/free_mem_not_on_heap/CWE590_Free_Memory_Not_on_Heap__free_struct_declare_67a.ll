; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }
%struct._CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_structType = type { %struct._twoIntsStruct* }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_structType, align 8
  %dataBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_structType* %myStruct, metadata !26, metadata !DIExpression()), !dbg !31
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataBuffer, metadata !33, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !48
  %cmp = icmp ult i64 %0, 100, !dbg !50
  br i1 %cmp, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %1, !dbg !54
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !55
  store i32 1, i32* %intOne, align 8, !dbg !56
  %2 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %2, !dbg !58
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !59
  store i32 1, i32* %intTwo, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %3, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 0, !dbg !67
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !68
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !69
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_structType* %myStruct, i32 0, i32 0, !dbg !70
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %structFirst, align 8, !dbg !71
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_structType* %myStruct, i32 0, i32 0, !dbg !72
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %coerce.dive, align 8, !dbg !72
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67b_badSink(%struct._twoIntsStruct* %5), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67b_badSink(%struct._twoIntsStruct*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_structType, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_structType* %myStruct, metadata !80, metadata !DIExpression()), !dbg !81
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
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_structType* %myStruct, i32 0, i32 0, !dbg !122
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %structFirst, align 8, !dbg !123
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_structType* %myStruct, i32 0, i32 0, !dbg !124
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %coerce.dive, align 8, !dbg !124
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67b_goodG2BSink(%struct._twoIntsStruct* %10), !dbg !124
  ret void, !dbg !125
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67b_goodG2BSink(%struct._twoIntsStruct*) #2

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "f93e40ec9b17d7750b3adeea63dd9c47")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_bad", scope: !1, file: !1, line: 31, type: !21, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 33, type: !3)
!25 = !DILocation(line: 33, column: 21, scope: !20)
!26 = !DILocalVariable(name: "myStruct", scope: !20, file: !1, line: 34, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_structType", file: !1, line: 24, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_structType", file: !1, line: 21, size: 64, elements: !29)
!29 = !{!30}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !28, file: !1, line: 23, baseType: !3, size: 64)
!31 = !DILocation(line: 34, column: 71, scope: !20)
!32 = !DILocation(line: 35, column: 10, scope: !20)
!33 = !DILocalVariable(name: "dataBuffer", scope: !34, file: !1, line: 38, type: !35)
!34 = distinct !DILexicalBlock(scope: !20, file: !1, line: 36, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 38, column: 23, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !40, file: !1, line: 40, type: !41)
!40 = distinct !DILexicalBlock(scope: !34, file: !1, line: 39, column: 9)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!43 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 40, column: 20, scope: !40)
!45 = !DILocation(line: 41, column: 20, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !1, line: 41, column: 13)
!47 = !DILocation(line: 41, column: 18, scope: !46)
!48 = !DILocation(line: 41, column: 25, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !1, line: 41, column: 13)
!50 = !DILocation(line: 41, column: 27, scope: !49)
!51 = !DILocation(line: 41, column: 13, scope: !46)
!52 = !DILocation(line: 43, column: 28, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !1, line: 42, column: 13)
!54 = !DILocation(line: 43, column: 17, scope: !53)
!55 = !DILocation(line: 43, column: 31, scope: !53)
!56 = !DILocation(line: 43, column: 38, scope: !53)
!57 = !DILocation(line: 44, column: 28, scope: !53)
!58 = !DILocation(line: 44, column: 17, scope: !53)
!59 = !DILocation(line: 44, column: 31, scope: !53)
!60 = !DILocation(line: 44, column: 38, scope: !53)
!61 = !DILocation(line: 45, column: 13, scope: !53)
!62 = !DILocation(line: 41, column: 35, scope: !49)
!63 = !DILocation(line: 41, column: 13, scope: !49)
!64 = distinct !{!64, !51, !65, !66}
!65 = !DILocation(line: 45, column: 13, scope: !46)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 47, column: 16, scope: !34)
!68 = !DILocation(line: 47, column: 14, scope: !34)
!69 = !DILocation(line: 49, column: 28, scope: !20)
!70 = !DILocation(line: 49, column: 14, scope: !20)
!71 = !DILocation(line: 49, column: 26, scope: !20)
!72 = !DILocation(line: 50, column: 5, scope: !20)
!73 = !DILocation(line: 51, column: 1, scope: !20)
!74 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_67_good", scope: !1, file: !1, line: 87, type: !21, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!75 = !DILocation(line: 89, column: 5, scope: !74)
!76 = !DILocation(line: 90, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!78 = !DILocalVariable(name: "data", scope: !77, file: !1, line: 62, type: !3)
!79 = !DILocation(line: 62, column: 21, scope: !77)
!80 = !DILocalVariable(name: "myStruct", scope: !77, file: !1, line: 63, type: !27)
!81 = !DILocation(line: 63, column: 71, scope: !77)
!82 = !DILocation(line: 64, column: 10, scope: !77)
!83 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !1, line: 67, type: !3)
!84 = distinct !DILexicalBlock(scope: !77, file: !1, line: 65, column: 5)
!85 = !DILocation(line: 67, column: 25, scope: !84)
!86 = !DILocation(line: 67, column: 55, scope: !84)
!87 = !DILocation(line: 67, column: 38, scope: !84)
!88 = !DILocation(line: 68, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !1, line: 68, column: 13)
!90 = !DILocation(line: 68, column: 24, scope: !89)
!91 = !DILocation(line: 68, column: 13, scope: !84)
!92 = !DILocation(line: 70, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !1, line: 69, column: 9)
!94 = !DILocation(line: 71, column: 13, scope: !93)
!95 = !DILocalVariable(name: "i", scope: !96, file: !1, line: 74, type: !41)
!96 = distinct !DILexicalBlock(scope: !84, file: !1, line: 73, column: 9)
!97 = !DILocation(line: 74, column: 20, scope: !96)
!98 = !DILocation(line: 75, column: 20, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !1, line: 75, column: 13)
!100 = !DILocation(line: 75, column: 18, scope: !99)
!101 = !DILocation(line: 75, column: 25, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !1, line: 75, column: 13)
!103 = !DILocation(line: 75, column: 27, scope: !102)
!104 = !DILocation(line: 75, column: 13, scope: !99)
!105 = !DILocation(line: 77, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !1, line: 76, column: 13)
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
!117 = distinct !{!117, !104, !118, !66}
!118 = !DILocation(line: 79, column: 13, scope: !99)
!119 = !DILocation(line: 81, column: 16, scope: !84)
!120 = !DILocation(line: 81, column: 14, scope: !84)
!121 = !DILocation(line: 83, column: 28, scope: !77)
!122 = !DILocation(line: 83, column: 14, scope: !77)
!123 = !DILocation(line: 83, column: 26, scope: !77)
!124 = !DILocation(line: 84, column: 5, scope: !77)
!125 = !DILocation(line: 85, column: 1, scope: !77)
