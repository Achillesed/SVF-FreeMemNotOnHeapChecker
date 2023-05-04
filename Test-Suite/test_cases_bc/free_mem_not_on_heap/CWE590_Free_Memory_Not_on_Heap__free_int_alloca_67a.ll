; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_structType = type { i32* }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_structType, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_structType* %myStruct, metadata !20, metadata !DIExpression()), !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %2, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !45
  %4 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !45
  store i32 5, i32* %arrayidx, align 4, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %5, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !55
  store i32* %6, i32** %data, align 8, !dbg !56
  %7 = load i32*, i32** %data, align 8, !dbg !57
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !58
  store i32* %7, i32** %structFirst, align 8, !dbg !59
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !60
  %8 = load i32*, i32** %coerce.dive, align 8, !dbg !60
  call void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67b_badSink(i32* %8), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67b_badSink(i32*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_structType, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_structType* %myStruct, metadata !68, metadata !DIExpression()), !dbg !69
  store i32* null, i32** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !73
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !74
  %0 = bitcast i8* %call to i32*, !dbg !75
  store i32* %0, i32** %dataBuffer, align 8, !dbg !73
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !76
  %cmp = icmp eq i32* %1, null, !dbg !78
  br i1 %cmp, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @exit(i32 noundef 1) #6, !dbg !82
  unreachable, !dbg !82

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !83, metadata !DIExpression()), !dbg !85
  store i64 0, i64* %i, align 8, !dbg !86
  br label %for.cond, !dbg !88

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !89
  %cmp1 = icmp ult i64 %2, 100, !dbg !91
  br i1 %cmp1, label %for.body, label %for.end, !dbg !92

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !93
  %4 = load i64, i64* %i, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !93
  store i32 5, i32* %arrayidx, align 4, !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !98
  %inc = add i64 %5, 1, !dbg !98
  store i64 %inc, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  store i32* %6, i32** %data, align 8, !dbg !103
  %7 = load i32*, i32** %data, align 8, !dbg !104
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !105
  store i32* %7, i32** %structFirst, align 8, !dbg !106
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !107
  %8 = load i32*, i32** %coerce.dive, align 8, !dbg !107
  call void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67b_goodG2BSink(i32* %8), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67b_goodG2BSink(i32*) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "8de5dfc861776d7394cb71950518c4f5")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_bad", scope: !1, file: !1, line: 31, type: !15, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 33, type: !3)
!19 = !DILocation(line: 33, column: 11, scope: !14)
!20 = !DILocalVariable(name: "myStruct", scope: !14, file: !1, line: 34, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_structType", file: !1, line: 24, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_structType", file: !1, line: 21, size: 64, elements: !23)
!23 = !{!24}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !22, file: !1, line: 23, baseType: !3, size: 64)
!25 = !DILocation(line: 34, column: 67, scope: !14)
!26 = !DILocation(line: 35, column: 10, scope: !14)
!27 = !DILocalVariable(name: "dataBuffer", scope: !28, file: !1, line: 38, type: !3)
!28 = distinct !DILexicalBlock(scope: !14, file: !1, line: 36, column: 5)
!29 = !DILocation(line: 38, column: 15, scope: !28)
!30 = !DILocation(line: 38, column: 35, scope: !28)
!31 = !DILocation(line: 38, column: 28, scope: !28)
!32 = !DILocalVariable(name: "i", scope: !33, file: !1, line: 40, type: !34)
!33 = distinct !DILexicalBlock(scope: !28, file: !1, line: 39, column: 9)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 40, column: 20, scope: !33)
!38 = !DILocation(line: 41, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !1, line: 41, column: 13)
!40 = !DILocation(line: 41, column: 18, scope: !39)
!41 = !DILocation(line: 41, column: 25, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !1, line: 41, column: 13)
!43 = !DILocation(line: 41, column: 27, scope: !42)
!44 = !DILocation(line: 41, column: 13, scope: !39)
!45 = !DILocation(line: 43, column: 17, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !1, line: 42, column: 13)
!47 = !DILocation(line: 43, column: 28, scope: !46)
!48 = !DILocation(line: 43, column: 31, scope: !46)
!49 = !DILocation(line: 44, column: 13, scope: !46)
!50 = !DILocation(line: 41, column: 35, scope: !42)
!51 = !DILocation(line: 41, column: 13, scope: !42)
!52 = distinct !{!52, !44, !53, !54}
!53 = !DILocation(line: 44, column: 13, scope: !39)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 46, column: 16, scope: !28)
!56 = !DILocation(line: 46, column: 14, scope: !28)
!57 = !DILocation(line: 48, column: 28, scope: !14)
!58 = !DILocation(line: 48, column: 14, scope: !14)
!59 = !DILocation(line: 48, column: 26, scope: !14)
!60 = !DILocation(line: 49, column: 5, scope: !14)
!61 = !DILocation(line: 50, column: 1, scope: !14)
!62 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_67_good", scope: !1, file: !1, line: 85, type: !15, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!63 = !DILocation(line: 87, column: 5, scope: !62)
!64 = !DILocation(line: 88, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!66 = !DILocalVariable(name: "data", scope: !65, file: !1, line: 61, type: !3)
!67 = !DILocation(line: 61, column: 11, scope: !65)
!68 = !DILocalVariable(name: "myStruct", scope: !65, file: !1, line: 62, type: !21)
!69 = !DILocation(line: 62, column: 67, scope: !65)
!70 = !DILocation(line: 63, column: 10, scope: !65)
!71 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !1, line: 66, type: !3)
!72 = distinct !DILexicalBlock(scope: !65, file: !1, line: 64, column: 5)
!73 = !DILocation(line: 66, column: 15, scope: !72)
!74 = !DILocation(line: 66, column: 35, scope: !72)
!75 = !DILocation(line: 66, column: 28, scope: !72)
!76 = !DILocation(line: 67, column: 13, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !1, line: 67, column: 13)
!78 = !DILocation(line: 67, column: 24, scope: !77)
!79 = !DILocation(line: 67, column: 13, scope: !72)
!80 = !DILocation(line: 69, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !1, line: 68, column: 9)
!82 = !DILocation(line: 70, column: 13, scope: !81)
!83 = !DILocalVariable(name: "i", scope: !84, file: !1, line: 73, type: !34)
!84 = distinct !DILexicalBlock(scope: !72, file: !1, line: 72, column: 9)
!85 = !DILocation(line: 73, column: 20, scope: !84)
!86 = !DILocation(line: 74, column: 20, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !1, line: 74, column: 13)
!88 = !DILocation(line: 74, column: 18, scope: !87)
!89 = !DILocation(line: 74, column: 25, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !1, line: 74, column: 13)
!91 = !DILocation(line: 74, column: 27, scope: !90)
!92 = !DILocation(line: 74, column: 13, scope: !87)
!93 = !DILocation(line: 76, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !1, line: 75, column: 13)
!95 = !DILocation(line: 76, column: 28, scope: !94)
!96 = !DILocation(line: 76, column: 31, scope: !94)
!97 = !DILocation(line: 77, column: 13, scope: !94)
!98 = !DILocation(line: 74, column: 35, scope: !90)
!99 = !DILocation(line: 74, column: 13, scope: !90)
!100 = distinct !{!100, !92, !101, !54}
!101 = !DILocation(line: 77, column: 13, scope: !87)
!102 = !DILocation(line: 79, column: 16, scope: !72)
!103 = !DILocation(line: 79, column: 14, scope: !72)
!104 = !DILocation(line: 81, column: 28, scope: !65)
!105 = !DILocation(line: 81, column: 14, scope: !65)
!106 = !DILocation(line: 81, column: 26, scope: !65)
!107 = !DILocation(line: 82, column: 5, scope: !65)
!108 = !DILocation(line: 83, column: 1, scope: !65)
