; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType = type { i64* }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType* %myStruct, metadata !24, metadata !DIExpression()), !dbg !29
  store i64* null, i64** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !33
  %0 = alloca i8, i64 800, align 16, !dbg !34
  %1 = bitcast i8* %0 to i64*, !dbg !35
  store i64* %1, i64** %dataBuffer, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %2, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !49
  %4 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !49
  store i64 5, i64* %arrayidx, align 8, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %5, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !59
  store i64* %6, i64** %data, align 8, !dbg !60
  %7 = load i64*, i64** %data, align 8, !dbg !61
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !62
  store i64* %7, i64** %structFirst, align 8, !dbg !63
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !64
  %8 = load i64*, i64** %coerce.dive, align 8, !dbg !64
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67b_badSink(i64* %8), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67b_badSink(i64*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca i64*, align 8
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType* %myStruct, metadata !72, metadata !DIExpression()), !dbg !73
  store i64* null, i64** %data, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !77
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !78
  %0 = bitcast i8* %call to i64*, !dbg !79
  store i64* %0, i64** %dataBuffer, align 8, !dbg !77
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !80
  %cmp = icmp eq i64* %1, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @exit(i32 noundef 1) #6, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !87, metadata !DIExpression()), !dbg !89
  store i64 0, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !93
  %cmp1 = icmp ult i64 %2, 100, !dbg !95
  br i1 %cmp1, label %for.body, label %for.end, !dbg !96

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !97
  %4 = load i64, i64* %i, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !97
  store i64 5, i64* %arrayidx, align 8, !dbg !100
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !102
  %inc = add i64 %5, 1, !dbg !102
  store i64 %inc, i64* %i, align 8, !dbg !102
  br label %for.cond, !dbg !103, !llvm.loop !104

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !106
  store i64* %6, i64** %data, align 8, !dbg !107
  %7 = load i64*, i64** %data, align 8, !dbg !108
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !109
  store i64* %7, i64** %structFirst, align 8, !dbg !110
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !111
  %8 = load i64*, i64** %coerce.dive, align 8, !dbg !111
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67b_goodG2BSink(i64* %8), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67b_goodG2BSink(i64*) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "bc4601e0dd5a6ecedca22ed6f6f724b5")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !5, line: 27, baseType: !6)
!5 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !7, line: 44, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!8 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 5}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"PIE Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_bad", scope: !1, file: !1, line: 31, type: !19, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 33, type: !3)
!23 = !DILocation(line: 33, column: 15, scope: !18)
!24 = !DILocalVariable(name: "myStruct", scope: !18, file: !1, line: 34, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType", file: !1, line: 24, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType", file: !1, line: 21, size: 64, elements: !27)
!27 = !{!28}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !26, file: !1, line: 23, baseType: !3, size: 64)
!29 = !DILocation(line: 34, column: 71, scope: !18)
!30 = !DILocation(line: 35, column: 10, scope: !18)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !1, line: 38, type: !3)
!32 = distinct !DILexicalBlock(scope: !18, file: !1, line: 36, column: 5)
!33 = !DILocation(line: 38, column: 19, scope: !32)
!34 = !DILocation(line: 38, column: 43, scope: !32)
!35 = !DILocation(line: 38, column: 32, scope: !32)
!36 = !DILocalVariable(name: "i", scope: !37, file: !1, line: 40, type: !38)
!37 = distinct !DILexicalBlock(scope: !32, file: !1, line: 39, column: 9)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 40, column: 20, scope: !37)
!42 = !DILocation(line: 41, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !1, line: 41, column: 13)
!44 = !DILocation(line: 41, column: 18, scope: !43)
!45 = !DILocation(line: 41, column: 25, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !1, line: 41, column: 13)
!47 = !DILocation(line: 41, column: 27, scope: !46)
!48 = !DILocation(line: 41, column: 13, scope: !43)
!49 = !DILocation(line: 43, column: 17, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 42, column: 13)
!51 = !DILocation(line: 43, column: 28, scope: !50)
!52 = !DILocation(line: 43, column: 31, scope: !50)
!53 = !DILocation(line: 44, column: 13, scope: !50)
!54 = !DILocation(line: 41, column: 35, scope: !46)
!55 = !DILocation(line: 41, column: 13, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 44, column: 13, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 46, column: 16, scope: !32)
!60 = !DILocation(line: 46, column: 14, scope: !32)
!61 = !DILocation(line: 48, column: 28, scope: !18)
!62 = !DILocation(line: 48, column: 14, scope: !18)
!63 = !DILocation(line: 48, column: 26, scope: !18)
!64 = !DILocation(line: 49, column: 5, scope: !18)
!65 = !DILocation(line: 50, column: 1, scope: !18)
!66 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_good", scope: !1, file: !1, line: 85, type: !19, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!67 = !DILocation(line: 87, column: 5, scope: !66)
!68 = !DILocation(line: 88, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 59, type: !19, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!70 = !DILocalVariable(name: "data", scope: !69, file: !1, line: 61, type: !3)
!71 = !DILocation(line: 61, column: 15, scope: !69)
!72 = !DILocalVariable(name: "myStruct", scope: !69, file: !1, line: 62, type: !25)
!73 = !DILocation(line: 62, column: 71, scope: !69)
!74 = !DILocation(line: 63, column: 10, scope: !69)
!75 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !1, line: 66, type: !3)
!76 = distinct !DILexicalBlock(scope: !69, file: !1, line: 64, column: 5)
!77 = !DILocation(line: 66, column: 19, scope: !76)
!78 = !DILocation(line: 66, column: 43, scope: !76)
!79 = !DILocation(line: 66, column: 32, scope: !76)
!80 = !DILocation(line: 67, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !1, line: 67, column: 13)
!82 = !DILocation(line: 67, column: 24, scope: !81)
!83 = !DILocation(line: 67, column: 13, scope: !76)
!84 = !DILocation(line: 69, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !1, line: 68, column: 9)
!86 = !DILocation(line: 70, column: 13, scope: !85)
!87 = !DILocalVariable(name: "i", scope: !88, file: !1, line: 73, type: !38)
!88 = distinct !DILexicalBlock(scope: !76, file: !1, line: 72, column: 9)
!89 = !DILocation(line: 73, column: 20, scope: !88)
!90 = !DILocation(line: 74, column: 20, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !1, line: 74, column: 13)
!92 = !DILocation(line: 74, column: 18, scope: !91)
!93 = !DILocation(line: 74, column: 25, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !1, line: 74, column: 13)
!95 = !DILocation(line: 74, column: 27, scope: !94)
!96 = !DILocation(line: 74, column: 13, scope: !91)
!97 = !DILocation(line: 76, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !1, line: 75, column: 13)
!99 = !DILocation(line: 76, column: 28, scope: !98)
!100 = !DILocation(line: 76, column: 31, scope: !98)
!101 = !DILocation(line: 77, column: 13, scope: !98)
!102 = !DILocation(line: 74, column: 35, scope: !94)
!103 = !DILocation(line: 74, column: 13, scope: !94)
!104 = distinct !{!104, !96, !105, !58}
!105 = !DILocation(line: 77, column: 13, scope: !91)
!106 = !DILocation(line: 79, column: 16, scope: !76)
!107 = !DILocation(line: 79, column: 14, scope: !76)
!108 = !DILocation(line: 81, column: 28, scope: !69)
!109 = !DILocation(line: 81, column: 14, scope: !69)
!110 = !DILocation(line: 81, column: 26, scope: !69)
!111 = !DILocation(line: 82, column: 5, scope: !69)
!112 = !DILocation(line: 83, column: 1, scope: !69)
