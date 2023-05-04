; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_structType = type { i64* }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_structType, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_structType* %myStruct, metadata !24, metadata !DIExpression()), !dbg !29
  store i64* null, i64** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %0, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %1, !dbg !52
  store i64 5, i64* %arrayidx, align 8, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %2, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !60
  store i64* %arraydecay, i64** %data, align 8, !dbg !61
  %3 = load i64*, i64** %data, align 8, !dbg !62
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_structType* %myStruct, i32 0, i32 0, !dbg !63
  store i64* %3, i64** %structFirst, align 8, !dbg !64
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_structType* %myStruct, i32 0, i32 0, !dbg !65
  %4 = load i64*, i64** %coerce.dive, align 8, !dbg !65
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67b_badSink(i64* %4), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67b_badSink(i64*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i64*, align 8
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_structType, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_structType* %myStruct, metadata !73, metadata !DIExpression()), !dbg !74
  store i64* null, i64** %data, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !78
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !79
  %0 = bitcast i8* %call to i64*, !dbg !80
  store i64* %0, i64** %dataBuffer, align 8, !dbg !78
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !81
  %cmp = icmp eq i64* %1, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @exit(i32 noundef 1) #6, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !88, metadata !DIExpression()), !dbg !90
  store i64 0, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !94
  %cmp1 = icmp ult i64 %2, 100, !dbg !96
  br i1 %cmp1, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !98
  %4 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !98
  store i64 5, i64* %arrayidx, align 8, !dbg !101
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !103
  %inc = add i64 %5, 1, !dbg !103
  store i64 %inc, i64* %i, align 8, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !107
  store i64* %6, i64** %data, align 8, !dbg !108
  %7 = load i64*, i64** %data, align 8, !dbg !109
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_structType* %myStruct, i32 0, i32 0, !dbg !110
  store i64* %7, i64** %structFirst, align 8, !dbg !111
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_structType* %myStruct, i32 0, i32 0, !dbg !112
  %8 = load i64*, i64** %coerce.dive, align 8, !dbg !112
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67b_goodG2BSink(i64* %8), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67b_goodG2BSink(i64*) #2

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "0fdee2f57d952c22974ba5d9430b3da1")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_bad", scope: !1, file: !1, line: 31, type: !19, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 33, type: !3)
!23 = !DILocation(line: 33, column: 15, scope: !18)
!24 = !DILocalVariable(name: "myStruct", scope: !18, file: !1, line: 34, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_structType", file: !1, line: 24, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_structType", file: !1, line: 21, size: 64, elements: !27)
!27 = !{!28}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !26, file: !1, line: 23, baseType: !3, size: 64)
!29 = !DILocation(line: 34, column: 72, scope: !18)
!30 = !DILocation(line: 35, column: 10, scope: !18)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !1, line: 38, type: !33)
!32 = distinct !DILexicalBlock(scope: !18, file: !1, line: 36, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 38, column: 17, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !38, file: !1, line: 40, type: !39)
!38 = distinct !DILexicalBlock(scope: !32, file: !1, line: 39, column: 9)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 40, column: 20, scope: !38)
!43 = !DILocation(line: 41, column: 20, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !1, line: 41, column: 13)
!45 = !DILocation(line: 41, column: 18, scope: !44)
!46 = !DILocation(line: 41, column: 25, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !1, line: 41, column: 13)
!48 = !DILocation(line: 41, column: 27, scope: !47)
!49 = !DILocation(line: 41, column: 13, scope: !44)
!50 = !DILocation(line: 43, column: 28, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 42, column: 13)
!52 = !DILocation(line: 43, column: 17, scope: !51)
!53 = !DILocation(line: 43, column: 31, scope: !51)
!54 = !DILocation(line: 44, column: 13, scope: !51)
!55 = !DILocation(line: 41, column: 35, scope: !47)
!56 = !DILocation(line: 41, column: 13, scope: !47)
!57 = distinct !{!57, !49, !58, !59}
!58 = !DILocation(line: 44, column: 13, scope: !44)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 46, column: 16, scope: !32)
!61 = !DILocation(line: 46, column: 14, scope: !32)
!62 = !DILocation(line: 48, column: 28, scope: !18)
!63 = !DILocation(line: 48, column: 14, scope: !18)
!64 = !DILocation(line: 48, column: 26, scope: !18)
!65 = !DILocation(line: 49, column: 5, scope: !18)
!66 = !DILocation(line: 50, column: 1, scope: !18)
!67 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_67_good", scope: !1, file: !1, line: 85, type: !19, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!68 = !DILocation(line: 87, column: 5, scope: !67)
!69 = !DILocation(line: 88, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 59, type: !19, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!71 = !DILocalVariable(name: "data", scope: !70, file: !1, line: 61, type: !3)
!72 = !DILocation(line: 61, column: 15, scope: !70)
!73 = !DILocalVariable(name: "myStruct", scope: !70, file: !1, line: 62, type: !25)
!74 = !DILocation(line: 62, column: 72, scope: !70)
!75 = !DILocation(line: 63, column: 10, scope: !70)
!76 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !1, line: 66, type: !3)
!77 = distinct !DILexicalBlock(scope: !70, file: !1, line: 64, column: 5)
!78 = !DILocation(line: 66, column: 19, scope: !77)
!79 = !DILocation(line: 66, column: 43, scope: !77)
!80 = !DILocation(line: 66, column: 32, scope: !77)
!81 = !DILocation(line: 67, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !1, line: 67, column: 13)
!83 = !DILocation(line: 67, column: 24, scope: !82)
!84 = !DILocation(line: 67, column: 13, scope: !77)
!85 = !DILocation(line: 69, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !1, line: 68, column: 9)
!87 = !DILocation(line: 70, column: 13, scope: !86)
!88 = !DILocalVariable(name: "i", scope: !89, file: !1, line: 73, type: !39)
!89 = distinct !DILexicalBlock(scope: !77, file: !1, line: 72, column: 9)
!90 = !DILocation(line: 73, column: 20, scope: !89)
!91 = !DILocation(line: 74, column: 20, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !1, line: 74, column: 13)
!93 = !DILocation(line: 74, column: 18, scope: !92)
!94 = !DILocation(line: 74, column: 25, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !1, line: 74, column: 13)
!96 = !DILocation(line: 74, column: 27, scope: !95)
!97 = !DILocation(line: 74, column: 13, scope: !92)
!98 = !DILocation(line: 76, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !1, line: 75, column: 13)
!100 = !DILocation(line: 76, column: 28, scope: !99)
!101 = !DILocation(line: 76, column: 31, scope: !99)
!102 = !DILocation(line: 77, column: 13, scope: !99)
!103 = !DILocation(line: 74, column: 35, scope: !95)
!104 = !DILocation(line: 74, column: 13, scope: !95)
!105 = distinct !{!105, !97, !106, !59}
!106 = !DILocation(line: 77, column: 13, scope: !92)
!107 = !DILocation(line: 79, column: 16, scope: !77)
!108 = !DILocation(line: 79, column: 14, scope: !77)
!109 = !DILocation(line: 81, column: 28, scope: !70)
!110 = !DILocation(line: 81, column: 14, scope: !70)
!111 = !DILocation(line: 81, column: 26, scope: !70)
!112 = !DILocation(line: 82, column: 5, scope: !70)
!113 = !DILocation(line: 83, column: 1, scope: !70)
