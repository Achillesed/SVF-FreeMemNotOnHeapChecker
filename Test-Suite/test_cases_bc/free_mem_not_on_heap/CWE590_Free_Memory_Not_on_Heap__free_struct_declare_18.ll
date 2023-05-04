; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_18.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_18_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  br label %source, !dbg !27

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !28), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %source
  %0 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %0, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %1, !dbg !51
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !52
  store i32 1, i32* %intOne, align 8, !dbg !53
  %2 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %2, !dbg !55
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !56
  store i32 1, i32* %intTwo, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %3, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 0, !dbg !64
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !65
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 0, !dbg !66
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !67
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !68
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !68
  call void @free(i8* noundef %6) #5, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_18_good() #0 !dbg !71 {
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
  br label %source, !dbg !78

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !79), !dbg !80
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !83
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !84
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !85
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !83
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !86
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %source
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @exit(i32 noundef 1) #6, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %source
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
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !119
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !119
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !120
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !121
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !121
  call void @free(i8* noundef %11) #5, !dbg !122
  ret void, !dbg !123
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_18.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "804d1c6bb14e0b8aca74f13f3cf44d75")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_18_bad", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 25, type: !3)
!25 = !DILocation(line: 25, column: 21, scope: !20)
!26 = !DILocation(line: 26, column: 10, scope: !20)
!27 = !DILocation(line: 27, column: 5, scope: !20)
!28 = !DILabel(scope: !20, name: "source", file: !1, line: 28)
!29 = !DILocation(line: 28, column: 1, scope: !20)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !1, line: 31, type: !32)
!31 = distinct !DILexicalBlock(scope: !20, file: !1, line: 29, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 31, column: 23, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !37, file: !1, line: 33, type: !38)
!37 = distinct !DILexicalBlock(scope: !31, file: !1, line: 32, column: 9)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 33, column: 20, scope: !37)
!42 = !DILocation(line: 34, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !1, line: 34, column: 13)
!44 = !DILocation(line: 34, column: 18, scope: !43)
!45 = !DILocation(line: 34, column: 25, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !1, line: 34, column: 13)
!47 = !DILocation(line: 34, column: 27, scope: !46)
!48 = !DILocation(line: 34, column: 13, scope: !43)
!49 = !DILocation(line: 36, column: 28, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 35, column: 13)
!51 = !DILocation(line: 36, column: 17, scope: !50)
!52 = !DILocation(line: 36, column: 31, scope: !50)
!53 = !DILocation(line: 36, column: 38, scope: !50)
!54 = !DILocation(line: 37, column: 28, scope: !50)
!55 = !DILocation(line: 37, column: 17, scope: !50)
!56 = !DILocation(line: 37, column: 31, scope: !50)
!57 = !DILocation(line: 37, column: 38, scope: !50)
!58 = !DILocation(line: 38, column: 13, scope: !50)
!59 = !DILocation(line: 34, column: 35, scope: !46)
!60 = !DILocation(line: 34, column: 13, scope: !46)
!61 = distinct !{!61, !48, !62, !63}
!62 = !DILocation(line: 38, column: 13, scope: !43)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 40, column: 16, scope: !31)
!65 = !DILocation(line: 40, column: 14, scope: !31)
!66 = !DILocation(line: 42, column: 22, scope: !20)
!67 = !DILocation(line: 42, column: 5, scope: !20)
!68 = !DILocation(line: 44, column: 10, scope: !20)
!69 = !DILocation(line: 44, column: 5, scope: !20)
!70 = !DILocation(line: 45, column: 1, scope: !20)
!71 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_18_good", scope: !1, file: !1, line: 81, type: !21, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!72 = !DILocation(line: 83, column: 5, scope: !71)
!73 = !DILocation(line: 84, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 52, type: !21, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!75 = !DILocalVariable(name: "data", scope: !74, file: !1, line: 54, type: !3)
!76 = !DILocation(line: 54, column: 21, scope: !74)
!77 = !DILocation(line: 55, column: 10, scope: !74)
!78 = !DILocation(line: 56, column: 5, scope: !74)
!79 = !DILabel(scope: !74, name: "source", file: !1, line: 57)
!80 = !DILocation(line: 57, column: 1, scope: !74)
!81 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !1, line: 60, type: !3)
!82 = distinct !DILexicalBlock(scope: !74, file: !1, line: 58, column: 5)
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
!93 = !DILocalVariable(name: "i", scope: !94, file: !1, line: 67, type: !38)
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
!115 = distinct !{!115, !102, !116, !63}
!116 = !DILocation(line: 72, column: 13, scope: !97)
!117 = !DILocation(line: 74, column: 16, scope: !82)
!118 = !DILocation(line: 74, column: 14, scope: !82)
!119 = !DILocation(line: 76, column: 22, scope: !74)
!120 = !DILocation(line: 76, column: 5, scope: !74)
!121 = !DILocation(line: 78, column: 10, scope: !74)
!122 = !DILocation(line: 78, column: 5, scope: !74)
!123 = !DILocation(line: 79, column: 1, scope: !74)
