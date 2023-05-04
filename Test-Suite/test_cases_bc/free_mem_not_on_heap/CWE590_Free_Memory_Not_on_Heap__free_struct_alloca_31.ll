; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_31.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_31_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 800, align 16, !dbg !30
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !31
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %2, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !45
  %4 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !45
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !48
  store i32 1, i32* %intOne, align 4, !dbg !49
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !50
  %6 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !50
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !52
  store i32 1, i32* %intTwo, align 4, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %7, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !60
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !62, metadata !DIExpression()), !dbg !64
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !65
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !66, metadata !DIExpression()), !dbg !67
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !68
  store %struct._twoIntsStruct* %10, %struct._twoIntsStruct** %data2, align 8, !dbg !67
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !69
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !69
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !70
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !71
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !71
  call void @free(i8* noundef %13) #5, !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_31_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data3 = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !83
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !84
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !85
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !83
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !86
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @exit(i32 noundef 1) #6, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !93, metadata !DIExpression()), !dbg !95
  store i64 0, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !99
  %cmp1 = icmp ult i64 %2, 100, !dbg !101
  br i1 %cmp1, label %for.body, label %for.end, !dbg !102

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !103
  %4 = load i64, i64* %i, align 8, !dbg !105
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !103
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !106
  store i32 1, i32* %intOne, align 4, !dbg !107
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !108
  %6 = load i64, i64* %i, align 8, !dbg !109
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !108
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !110
  store i32 1, i32* %intTwo, align 4, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !113
  %inc = add i64 %7, 1, !dbg !113
  store i64 %inc, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !117
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !119, metadata !DIExpression()), !dbg !121
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !122
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data3, metadata !123, metadata !DIExpression()), !dbg !124
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !125
  store %struct._twoIntsStruct* %10, %struct._twoIntsStruct** %data3, align 8, !dbg !124
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data3, align 8, !dbg !126
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !126
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !127
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data3, align 8, !dbg !128
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !128
  call void @free(i8* noundef %13) #5, !dbg !129
  ret void, !dbg !130
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_31.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "8c911fae98fac249ff8f3d75b3101094")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_31_bad", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 25, type: !3)
!25 = !DILocation(line: 25, column: 21, scope: !20)
!26 = !DILocation(line: 26, column: 10, scope: !20)
!27 = !DILocalVariable(name: "dataBuffer", scope: !28, file: !1, line: 29, type: !3)
!28 = distinct !DILexicalBlock(scope: !20, file: !1, line: 27, column: 5)
!29 = !DILocation(line: 29, column: 25, scope: !28)
!30 = !DILocation(line: 29, column: 55, scope: !28)
!31 = !DILocation(line: 29, column: 38, scope: !28)
!32 = !DILocalVariable(name: "i", scope: !33, file: !1, line: 31, type: !34)
!33 = distinct !DILexicalBlock(scope: !28, file: !1, line: 30, column: 9)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 31, column: 20, scope: !33)
!38 = !DILocation(line: 32, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !1, line: 32, column: 13)
!40 = !DILocation(line: 32, column: 18, scope: !39)
!41 = !DILocation(line: 32, column: 25, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !1, line: 32, column: 13)
!43 = !DILocation(line: 32, column: 27, scope: !42)
!44 = !DILocation(line: 32, column: 13, scope: !39)
!45 = !DILocation(line: 34, column: 17, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !1, line: 33, column: 13)
!47 = !DILocation(line: 34, column: 28, scope: !46)
!48 = !DILocation(line: 34, column: 31, scope: !46)
!49 = !DILocation(line: 34, column: 38, scope: !46)
!50 = !DILocation(line: 35, column: 17, scope: !46)
!51 = !DILocation(line: 35, column: 28, scope: !46)
!52 = !DILocation(line: 35, column: 31, scope: !46)
!53 = !DILocation(line: 35, column: 38, scope: !46)
!54 = !DILocation(line: 36, column: 13, scope: !46)
!55 = !DILocation(line: 32, column: 35, scope: !42)
!56 = !DILocation(line: 32, column: 13, scope: !42)
!57 = distinct !{!57, !44, !58, !59}
!58 = !DILocation(line: 36, column: 13, scope: !39)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 38, column: 16, scope: !28)
!61 = !DILocation(line: 38, column: 14, scope: !28)
!62 = !DILocalVariable(name: "dataCopy", scope: !63, file: !1, line: 41, type: !3)
!63 = distinct !DILexicalBlock(scope: !20, file: !1, line: 40, column: 5)
!64 = !DILocation(line: 41, column: 25, scope: !63)
!65 = !DILocation(line: 41, column: 36, scope: !63)
!66 = !DILocalVariable(name: "data", scope: !63, file: !1, line: 42, type: !3)
!67 = !DILocation(line: 42, column: 25, scope: !63)
!68 = !DILocation(line: 42, column: 32, scope: !63)
!69 = !DILocation(line: 43, column: 26, scope: !63)
!70 = !DILocation(line: 43, column: 9, scope: !63)
!71 = !DILocation(line: 45, column: 14, scope: !63)
!72 = !DILocation(line: 45, column: 9, scope: !63)
!73 = !DILocation(line: 47, column: 1, scope: !20)
!74 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_31_good", scope: !1, file: !1, line: 85, type: !21, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!75 = !DILocation(line: 87, column: 5, scope: !74)
!76 = !DILocation(line: 88, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!78 = !DILocalVariable(name: "data", scope: !77, file: !1, line: 56, type: !3)
!79 = !DILocation(line: 56, column: 21, scope: !77)
!80 = !DILocation(line: 57, column: 10, scope: !77)
!81 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !1, line: 60, type: !3)
!82 = distinct !DILexicalBlock(scope: !77, file: !1, line: 58, column: 5)
!83 = !DILocation(line: 60, column: 25, scope: !82)
!84 = !DILocation(line: 60, column: 55, scope: !82)
!85 = !DILocation(line: 60, column: 38, scope: !82)
!86 = !DILocation(line: 61, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !1, line: 61, column: 13)
!88 = !DILocation(line: 61, column: 24, scope: !87)
!89 = !DILocation(line: 61, column: 13, scope: !82)
!90 = !DILocation(line: 63, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !1, line: 62, column: 9)
!92 = !DILocation(line: 64, column: 13, scope: !91)
!93 = !DILocalVariable(name: "i", scope: !94, file: !1, line: 67, type: !34)
!94 = distinct !DILexicalBlock(scope: !82, file: !1, line: 66, column: 9)
!95 = !DILocation(line: 67, column: 20, scope: !94)
!96 = !DILocation(line: 68, column: 20, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !1, line: 68, column: 13)
!98 = !DILocation(line: 68, column: 18, scope: !97)
!99 = !DILocation(line: 68, column: 25, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !1, line: 68, column: 13)
!101 = !DILocation(line: 68, column: 27, scope: !100)
!102 = !DILocation(line: 68, column: 13, scope: !97)
!103 = !DILocation(line: 70, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !1, line: 69, column: 13)
!105 = !DILocation(line: 70, column: 28, scope: !104)
!106 = !DILocation(line: 70, column: 31, scope: !104)
!107 = !DILocation(line: 70, column: 38, scope: !104)
!108 = !DILocation(line: 71, column: 17, scope: !104)
!109 = !DILocation(line: 71, column: 28, scope: !104)
!110 = !DILocation(line: 71, column: 31, scope: !104)
!111 = !DILocation(line: 71, column: 38, scope: !104)
!112 = !DILocation(line: 72, column: 13, scope: !104)
!113 = !DILocation(line: 68, column: 35, scope: !100)
!114 = !DILocation(line: 68, column: 13, scope: !100)
!115 = distinct !{!115, !102, !116, !59}
!116 = !DILocation(line: 72, column: 13, scope: !97)
!117 = !DILocation(line: 74, column: 16, scope: !82)
!118 = !DILocation(line: 74, column: 14, scope: !82)
!119 = !DILocalVariable(name: "dataCopy", scope: !120, file: !1, line: 77, type: !3)
!120 = distinct !DILexicalBlock(scope: !77, file: !1, line: 76, column: 5)
!121 = !DILocation(line: 77, column: 25, scope: !120)
!122 = !DILocation(line: 77, column: 36, scope: !120)
!123 = !DILocalVariable(name: "data", scope: !120, file: !1, line: 78, type: !3)
!124 = !DILocation(line: 78, column: 25, scope: !120)
!125 = !DILocation(line: 78, column: 32, scope: !120)
!126 = !DILocation(line: 79, column: 26, scope: !120)
!127 = !DILocation(line: 79, column: 9, scope: !120)
!128 = !DILocation(line: 81, column: 14, scope: !120)
!129 = !DILocation(line: 81, column: 9, scope: !120)
!130 = !DILocation(line: 83, column: 1, scope: !77)
