; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !42
  %cmp = icmp ult i64 %0, 100, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %1, !dbg !48
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !49
  store i32 1, i32* %intOne, align 8, !dbg !50
  %2 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %2, !dbg !52
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !53
  store i32 1, i32* %intTwo, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %3, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 0, !dbg !61
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !62
  %4 = bitcast %struct._twoIntsStruct** %data to i8*, !dbg !63
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64b_badSink(i8* noundef %4), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64b_badSink(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !73, metadata !DIExpression()), !dbg !75
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !76
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !77
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !75
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !78
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @exit(i32 noundef 1) #6, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !85, metadata !DIExpression()), !dbg !87
  store i64 0, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !91
  %cmp1 = icmp ult i64 %2, 100, !dbg !93
  br i1 %cmp1, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !95
  %4 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !95
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !98
  store i32 1, i32* %intOne, align 4, !dbg !99
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !100
  %6 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !100
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !102
  store i32 1, i32* %intTwo, align 4, !dbg !103
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !105
  %inc = add i64 %7, 1, !dbg !105
  store i64 %inc, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !106, !llvm.loop !107

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !109
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !110
  %9 = bitcast %struct._twoIntsStruct** %data to i8*, !dbg !111
  call void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64b_goodG2BSink(i8* noundef %9), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64b_goodG2BSink(i8* noundef) #2

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "a2e6e23ebb73a485a063dd1e05fd1279")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64_bad", scope: !1, file: !1, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 28, type: !3)
!25 = !DILocation(line: 28, column: 21, scope: !20)
!26 = !DILocation(line: 29, column: 10, scope: !20)
!27 = !DILocalVariable(name: "dataBuffer", scope: !28, file: !1, line: 32, type: !29)
!28 = distinct !DILexicalBlock(scope: !20, file: !1, line: 30, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 32, column: 23, scope: !28)
!33 = !DILocalVariable(name: "i", scope: !34, file: !1, line: 34, type: !35)
!34 = distinct !DILexicalBlock(scope: !28, file: !1, line: 33, column: 9)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!37 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 34, column: 20, scope: !34)
!39 = !DILocation(line: 35, column: 20, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !1, line: 35, column: 13)
!41 = !DILocation(line: 35, column: 18, scope: !40)
!42 = !DILocation(line: 35, column: 25, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !1, line: 35, column: 13)
!44 = !DILocation(line: 35, column: 27, scope: !43)
!45 = !DILocation(line: 35, column: 13, scope: !40)
!46 = !DILocation(line: 37, column: 28, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !1, line: 36, column: 13)
!48 = !DILocation(line: 37, column: 17, scope: !47)
!49 = !DILocation(line: 37, column: 31, scope: !47)
!50 = !DILocation(line: 37, column: 38, scope: !47)
!51 = !DILocation(line: 38, column: 28, scope: !47)
!52 = !DILocation(line: 38, column: 17, scope: !47)
!53 = !DILocation(line: 38, column: 31, scope: !47)
!54 = !DILocation(line: 38, column: 38, scope: !47)
!55 = !DILocation(line: 39, column: 13, scope: !47)
!56 = !DILocation(line: 35, column: 35, scope: !43)
!57 = !DILocation(line: 35, column: 13, scope: !43)
!58 = distinct !{!58, !45, !59, !60}
!59 = !DILocation(line: 39, column: 13, scope: !40)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 41, column: 16, scope: !28)
!62 = !DILocation(line: 41, column: 14, scope: !28)
!63 = !DILocation(line: 43, column: 69, scope: !20)
!64 = !DILocation(line: 43, column: 5, scope: !20)
!65 = !DILocation(line: 44, column: 1, scope: !20)
!66 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64_good", scope: !1, file: !1, line: 78, type: !21, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!67 = !DILocation(line: 80, column: 5, scope: !66)
!68 = !DILocation(line: 81, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 53, type: !21, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!70 = !DILocalVariable(name: "data", scope: !69, file: !1, line: 55, type: !3)
!71 = !DILocation(line: 55, column: 21, scope: !69)
!72 = !DILocation(line: 56, column: 10, scope: !69)
!73 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !1, line: 59, type: !3)
!74 = distinct !DILexicalBlock(scope: !69, file: !1, line: 57, column: 5)
!75 = !DILocation(line: 59, column: 25, scope: !74)
!76 = !DILocation(line: 59, column: 55, scope: !74)
!77 = !DILocation(line: 59, column: 38, scope: !74)
!78 = !DILocation(line: 60, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !1, line: 60, column: 13)
!80 = !DILocation(line: 60, column: 24, scope: !79)
!81 = !DILocation(line: 60, column: 13, scope: !74)
!82 = !DILocation(line: 62, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !1, line: 61, column: 9)
!84 = !DILocation(line: 63, column: 13, scope: !83)
!85 = !DILocalVariable(name: "i", scope: !86, file: !1, line: 66, type: !35)
!86 = distinct !DILexicalBlock(scope: !74, file: !1, line: 65, column: 9)
!87 = !DILocation(line: 66, column: 20, scope: !86)
!88 = !DILocation(line: 67, column: 20, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !1, line: 67, column: 13)
!90 = !DILocation(line: 67, column: 18, scope: !89)
!91 = !DILocation(line: 67, column: 25, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !1, line: 67, column: 13)
!93 = !DILocation(line: 67, column: 27, scope: !92)
!94 = !DILocation(line: 67, column: 13, scope: !89)
!95 = !DILocation(line: 69, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !1, line: 68, column: 13)
!97 = !DILocation(line: 69, column: 28, scope: !96)
!98 = !DILocation(line: 69, column: 31, scope: !96)
!99 = !DILocation(line: 69, column: 38, scope: !96)
!100 = !DILocation(line: 70, column: 17, scope: !96)
!101 = !DILocation(line: 70, column: 28, scope: !96)
!102 = !DILocation(line: 70, column: 31, scope: !96)
!103 = !DILocation(line: 70, column: 38, scope: !96)
!104 = !DILocation(line: 71, column: 13, scope: !96)
!105 = !DILocation(line: 67, column: 35, scope: !92)
!106 = !DILocation(line: 67, column: 13, scope: !92)
!107 = distinct !{!107, !94, !108, !60}
!108 = !DILocation(line: 71, column: 13, scope: !89)
!109 = !DILocation(line: 73, column: 16, scope: !74)
!110 = !DILocation(line: 73, column: 14, scope: !74)
!111 = !DILocation(line: 75, column: 73, scope: !69)
!112 = !DILocation(line: 75, column: 5, scope: !69)
!113 = !DILocation(line: 76, column: 1, scope: !69)
