; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_16.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_16_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  br label %while.body, !dbg !25

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 800, align 16, !dbg !30
  %1 = bitcast i8* %0 to i64*, !dbg !31
  store i64* %1, i64** %dataBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %while.body
  %2 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %2, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !45
  %4 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !45
  store i64 5, i64* %arrayidx, align 8, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %5, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !55
  store i64* %6, i64** %data, align 8, !dbg !56
  br label %while.end, !dbg !57

while.end:                                        ; preds = %for.end
  %7 = load i64*, i64** %data, align 8, !dbg !58
  %arrayidx1 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !58
  %8 = load i64, i64* %arrayidx1, align 8, !dbg !58
  call void @printLongLongLine(i64 noundef %8), !dbg !59
  %9 = load i64*, i64** %data, align 8, !dbg !60
  %10 = bitcast i64* %9 to i8*, !dbg !60
  call void @free(i8* noundef %10) #5, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_16_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !67, metadata !DIExpression()), !dbg !68
  store i64* null, i64** %data, align 8, !dbg !69
  br label %while.body, !dbg !70

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !74
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !75
  %0 = bitcast i8* %call to i64*, !dbg !76
  store i64* %0, i64** %dataBuffer, align 8, !dbg !74
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !77
  %cmp = icmp eq i64* %1, null, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %while.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @exit(i32 noundef 1) #6, !dbg !83
  unreachable, !dbg !83

if.end:                                           ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !84, metadata !DIExpression()), !dbg !86
  store i64 0, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !89

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !90
  %cmp1 = icmp ult i64 %2, 100, !dbg !92
  br i1 %cmp1, label %for.body, label %for.end, !dbg !93

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !94
  %4 = load i64, i64* %i, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !94
  store i64 5, i64* %arrayidx, align 8, !dbg !97
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !99
  %inc = add i64 %5, 1, !dbg !99
  store i64 %inc, i64* %i, align 8, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !103
  store i64* %6, i64** %data, align 8, !dbg !104
  br label %while.end, !dbg !105

while.end:                                        ; preds = %for.end
  %7 = load i64*, i64** %data, align 8, !dbg !106
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !106
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !106
  call void @printLongLongLine(i64 noundef %8), !dbg !107
  %9 = load i64*, i64** %data, align 8, !dbg !108
  %10 = bitcast i64* %9 to i8*, !dbg !108
  call void @free(i8* noundef %10) #5, !dbg !109
  ret void, !dbg !110
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
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_16.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "99e2c8d5df48d31dcec9f29058183006")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_16_bad", scope: !1, file: !1, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !18)
!24 = !DILocation(line: 26, column: 10, scope: !18)
!25 = !DILocation(line: 27, column: 5, scope: !18)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !1, line: 31, type: !3)
!27 = distinct !DILexicalBlock(scope: !28, file: !1, line: 29, column: 9)
!28 = distinct !DILexicalBlock(scope: !18, file: !1, line: 28, column: 5)
!29 = !DILocation(line: 31, column: 23, scope: !27)
!30 = !DILocation(line: 31, column: 47, scope: !27)
!31 = !DILocation(line: 31, column: 36, scope: !27)
!32 = !DILocalVariable(name: "i", scope: !33, file: !1, line: 33, type: !34)
!33 = distinct !DILexicalBlock(scope: !27, file: !1, line: 32, column: 13)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 33, column: 24, scope: !33)
!38 = !DILocation(line: 34, column: 24, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !1, line: 34, column: 17)
!40 = !DILocation(line: 34, column: 22, scope: !39)
!41 = !DILocation(line: 34, column: 29, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !1, line: 34, column: 17)
!43 = !DILocation(line: 34, column: 31, scope: !42)
!44 = !DILocation(line: 34, column: 17, scope: !39)
!45 = !DILocation(line: 36, column: 21, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !1, line: 35, column: 17)
!47 = !DILocation(line: 36, column: 32, scope: !46)
!48 = !DILocation(line: 36, column: 35, scope: !46)
!49 = !DILocation(line: 37, column: 17, scope: !46)
!50 = !DILocation(line: 34, column: 39, scope: !42)
!51 = !DILocation(line: 34, column: 17, scope: !42)
!52 = distinct !{!52, !44, !53, !54}
!53 = !DILocation(line: 37, column: 17, scope: !39)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 39, column: 20, scope: !27)
!56 = !DILocation(line: 39, column: 18, scope: !27)
!57 = !DILocation(line: 41, column: 9, scope: !28)
!58 = !DILocation(line: 43, column: 23, scope: !18)
!59 = !DILocation(line: 43, column: 5, scope: !18)
!60 = !DILocation(line: 45, column: 10, scope: !18)
!61 = !DILocation(line: 45, column: 5, scope: !18)
!62 = !DILocation(line: 46, column: 1, scope: !18)
!63 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_16_good", scope: !1, file: !1, line: 83, type: !19, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!64 = !DILocation(line: 85, column: 5, scope: !63)
!65 = !DILocation(line: 86, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!67 = !DILocalVariable(name: "data", scope: !66, file: !1, line: 55, type: !3)
!68 = !DILocation(line: 55, column: 15, scope: !66)
!69 = !DILocation(line: 56, column: 10, scope: !66)
!70 = !DILocation(line: 57, column: 5, scope: !66)
!71 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !1, line: 61, type: !3)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 59, column: 9)
!73 = distinct !DILexicalBlock(scope: !66, file: !1, line: 58, column: 5)
!74 = !DILocation(line: 61, column: 23, scope: !72)
!75 = !DILocation(line: 61, column: 47, scope: !72)
!76 = !DILocation(line: 61, column: 36, scope: !72)
!77 = !DILocation(line: 62, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !72, file: !1, line: 62, column: 17)
!79 = !DILocation(line: 62, column: 28, scope: !78)
!80 = !DILocation(line: 62, column: 17, scope: !72)
!81 = !DILocation(line: 64, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !1, line: 63, column: 13)
!83 = !DILocation(line: 65, column: 17, scope: !82)
!84 = !DILocalVariable(name: "i", scope: !85, file: !1, line: 68, type: !34)
!85 = distinct !DILexicalBlock(scope: !72, file: !1, line: 67, column: 13)
!86 = !DILocation(line: 68, column: 24, scope: !85)
!87 = !DILocation(line: 69, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !1, line: 69, column: 17)
!89 = !DILocation(line: 69, column: 22, scope: !88)
!90 = !DILocation(line: 69, column: 29, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !1, line: 69, column: 17)
!92 = !DILocation(line: 69, column: 31, scope: !91)
!93 = !DILocation(line: 69, column: 17, scope: !88)
!94 = !DILocation(line: 71, column: 21, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !1, line: 70, column: 17)
!96 = !DILocation(line: 71, column: 32, scope: !95)
!97 = !DILocation(line: 71, column: 35, scope: !95)
!98 = !DILocation(line: 72, column: 17, scope: !95)
!99 = !DILocation(line: 69, column: 39, scope: !91)
!100 = !DILocation(line: 69, column: 17, scope: !91)
!101 = distinct !{!101, !93, !102, !54}
!102 = !DILocation(line: 72, column: 17, scope: !88)
!103 = !DILocation(line: 74, column: 20, scope: !72)
!104 = !DILocation(line: 74, column: 18, scope: !72)
!105 = !DILocation(line: 76, column: 9, scope: !73)
!106 = !DILocation(line: 78, column: 23, scope: !66)
!107 = !DILocation(line: 78, column: 5, scope: !66)
!108 = !DILocation(line: 80, column: 10, scope: !66)
!109 = !DILocation(line: 80, column: 5, scope: !66)
!110 = !DILocation(line: 81, column: 1, scope: !66)
