; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_66a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_66_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataArray = alloca [5 x %struct._twoIntsStruct*], align 16
  %dataBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [5 x %struct._twoIntsStruct*]* %dataArray, metadata !26, metadata !DIExpression()), !dbg !30
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataBuffer, metadata !32, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %0, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %1, !dbg !53
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !54
  store i32 1, i32* %intOne, align 8, !dbg !55
  %2 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %2, !dbg !57
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !58
  store i32 1, i32* %intTwo, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %3, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 0, !dbg !66
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !67
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds [5 x %struct._twoIntsStruct*], [5 x %struct._twoIntsStruct*]* %dataArray, i64 0, i64 2, !dbg !69
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %arrayidx2, align 16, !dbg !70
  %arraydecay3 = getelementptr inbounds [5 x %struct._twoIntsStruct*], [5 x %struct._twoIntsStruct*]* %dataArray, i64 0, i64 0, !dbg !71
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_66b_badSink(%struct._twoIntsStruct** noundef %arraydecay3), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_66b_badSink(%struct._twoIntsStruct** noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_66_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataArray = alloca [5 x %struct._twoIntsStruct*], align 16
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [5 x %struct._twoIntsStruct*]* %dataArray, metadata !80, metadata !DIExpression()), !dbg !81
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
  %arrayidx3 = getelementptr inbounds [5 x %struct._twoIntsStruct*], [5 x %struct._twoIntsStruct*]* %dataArray, i64 0, i64 2, !dbg !122
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %arrayidx3, align 16, !dbg !123
  %arraydecay = getelementptr inbounds [5 x %struct._twoIntsStruct*], [5 x %struct._twoIntsStruct*]* %dataArray, i64 0, i64 0, !dbg !124
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_66b_goodG2BSink(%struct._twoIntsStruct** noundef %arraydecay), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_66b_goodG2BSink(%struct._twoIntsStruct** noundef) #2

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_66a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "263a40c01c3fdffa85eacdca0951f889")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_66_bad", scope: !1, file: !1, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 28, type: !3)
!25 = !DILocation(line: 28, column: 21, scope: !20)
!26 = !DILocalVariable(name: "dataArray", scope: !20, file: !1, line: 29, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 5)
!30 = !DILocation(line: 29, column: 21, scope: !20)
!31 = !DILocation(line: 30, column: 10, scope: !20)
!32 = !DILocalVariable(name: "dataBuffer", scope: !33, file: !1, line: 33, type: !34)
!33 = distinct !DILexicalBlock(scope: !20, file: !1, line: 31, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 33, column: 23, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !39, file: !1, line: 35, type: !40)
!39 = distinct !DILexicalBlock(scope: !33, file: !1, line: 34, column: 9)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 35, column: 20, scope: !39)
!44 = !DILocation(line: 36, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !1, line: 36, column: 13)
!46 = !DILocation(line: 36, column: 18, scope: !45)
!47 = !DILocation(line: 36, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !1, line: 36, column: 13)
!49 = !DILocation(line: 36, column: 27, scope: !48)
!50 = !DILocation(line: 36, column: 13, scope: !45)
!51 = !DILocation(line: 38, column: 28, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !1, line: 37, column: 13)
!53 = !DILocation(line: 38, column: 17, scope: !52)
!54 = !DILocation(line: 38, column: 31, scope: !52)
!55 = !DILocation(line: 38, column: 38, scope: !52)
!56 = !DILocation(line: 39, column: 28, scope: !52)
!57 = !DILocation(line: 39, column: 17, scope: !52)
!58 = !DILocation(line: 39, column: 31, scope: !52)
!59 = !DILocation(line: 39, column: 38, scope: !52)
!60 = !DILocation(line: 40, column: 13, scope: !52)
!61 = !DILocation(line: 36, column: 35, scope: !48)
!62 = !DILocation(line: 36, column: 13, scope: !48)
!63 = distinct !{!63, !50, !64, !65}
!64 = !DILocation(line: 40, column: 13, scope: !45)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 42, column: 16, scope: !33)
!67 = !DILocation(line: 42, column: 14, scope: !33)
!68 = !DILocation(line: 45, column: 20, scope: !20)
!69 = !DILocation(line: 45, column: 5, scope: !20)
!70 = !DILocation(line: 45, column: 18, scope: !20)
!71 = !DILocation(line: 46, column: 69, scope: !20)
!72 = !DILocation(line: 46, column: 5, scope: !20)
!73 = !DILocation(line: 47, column: 1, scope: !20)
!74 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_66_good", scope: !1, file: !1, line: 83, type: !21, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!75 = !DILocation(line: 85, column: 5, scope: !74)
!76 = !DILocation(line: 86, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 56, type: !21, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!78 = !DILocalVariable(name: "data", scope: !77, file: !1, line: 58, type: !3)
!79 = !DILocation(line: 58, column: 21, scope: !77)
!80 = !DILocalVariable(name: "dataArray", scope: !77, file: !1, line: 59, type: !27)
!81 = !DILocation(line: 59, column: 21, scope: !77)
!82 = !DILocation(line: 60, column: 10, scope: !77)
!83 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !1, line: 63, type: !3)
!84 = distinct !DILexicalBlock(scope: !77, file: !1, line: 61, column: 5)
!85 = !DILocation(line: 63, column: 25, scope: !84)
!86 = !DILocation(line: 63, column: 55, scope: !84)
!87 = !DILocation(line: 63, column: 38, scope: !84)
!88 = !DILocation(line: 64, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !1, line: 64, column: 13)
!90 = !DILocation(line: 64, column: 24, scope: !89)
!91 = !DILocation(line: 64, column: 13, scope: !84)
!92 = !DILocation(line: 66, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !1, line: 65, column: 9)
!94 = !DILocation(line: 67, column: 13, scope: !93)
!95 = !DILocalVariable(name: "i", scope: !96, file: !1, line: 70, type: !40)
!96 = distinct !DILexicalBlock(scope: !84, file: !1, line: 69, column: 9)
!97 = !DILocation(line: 70, column: 20, scope: !96)
!98 = !DILocation(line: 71, column: 20, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !1, line: 71, column: 13)
!100 = !DILocation(line: 71, column: 18, scope: !99)
!101 = !DILocation(line: 71, column: 25, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !1, line: 71, column: 13)
!103 = !DILocation(line: 71, column: 27, scope: !102)
!104 = !DILocation(line: 71, column: 13, scope: !99)
!105 = !DILocation(line: 73, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !1, line: 72, column: 13)
!107 = !DILocation(line: 73, column: 28, scope: !106)
!108 = !DILocation(line: 73, column: 31, scope: !106)
!109 = !DILocation(line: 73, column: 38, scope: !106)
!110 = !DILocation(line: 74, column: 17, scope: !106)
!111 = !DILocation(line: 74, column: 28, scope: !106)
!112 = !DILocation(line: 74, column: 31, scope: !106)
!113 = !DILocation(line: 74, column: 38, scope: !106)
!114 = !DILocation(line: 75, column: 13, scope: !106)
!115 = !DILocation(line: 71, column: 35, scope: !102)
!116 = !DILocation(line: 71, column: 13, scope: !102)
!117 = distinct !{!117, !104, !118, !65}
!118 = !DILocation(line: 75, column: 13, scope: !99)
!119 = !DILocation(line: 77, column: 16, scope: !84)
!120 = !DILocation(line: 77, column: 14, scope: !84)
!121 = !DILocation(line: 79, column: 20, scope: !77)
!122 = !DILocation(line: 79, column: 5, scope: !77)
!123 = !DILocation(line: 79, column: 18, scope: !77)
!124 = !DILocation(line: 80, column: 73, scope: !77)
!125 = !DILocation(line: 80, column: 5, scope: !77)
!126 = !DILocation(line: 81, column: 1, scope: !77)
