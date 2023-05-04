; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataArray = alloca [5 x i64*], align 16
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [5 x i64*]* %dataArray, metadata !24, metadata !DIExpression()), !dbg !28
  store i64* null, i64** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !32
  %0 = alloca i8, i64 800, align 16, !dbg !33
  %1 = bitcast i8* %0 to i64*, !dbg !34
  store i64* %1, i64** %dataBuffer, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !44
  %cmp = icmp ult i64 %2, 100, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !48
  %4 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !48
  store i64 5, i64* %arrayidx, align 8, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %5, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !58
  store i64* %6, i64** %data, align 8, !dbg !59
  %7 = load i64*, i64** %data, align 8, !dbg !60
  %arrayidx1 = getelementptr inbounds [5 x i64*], [5 x i64*]* %dataArray, i64 0, i64 2, !dbg !61
  store i64* %7, i64** %arrayidx1, align 16, !dbg !62
  %arraydecay = getelementptr inbounds [5 x i64*], [5 x i64*]* %dataArray, i64 0, i64 0, !dbg !63
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66b_badSink(i64** noundef %arraydecay), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66b_badSink(i64** noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca i64*, align 8
  %dataArray = alloca [5 x i64*], align 16
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [5 x i64*]* %dataArray, metadata !72, metadata !DIExpression()), !dbg !73
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
  %arrayidx2 = getelementptr inbounds [5 x i64*], [5 x i64*]* %dataArray, i64 0, i64 2, !dbg !109
  store i64* %7, i64** %arrayidx2, align 16, !dbg !110
  %arraydecay = getelementptr inbounds [5 x i64*], [5 x i64*]* %dataArray, i64 0, i64 0, !dbg !111
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66b_goodG2BSink(i64** noundef %arraydecay), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66b_goodG2BSink(i64** noundef) #2

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "af521dfacef16bec99eb6ef2ac9266ef")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66_bad", scope: !1, file: !1, line: 26, type: !19, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 28, type: !3)
!23 = !DILocation(line: 28, column: 15, scope: !18)
!24 = !DILocalVariable(name: "dataArray", scope: !18, file: !1, line: 29, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 5)
!28 = !DILocation(line: 29, column: 15, scope: !18)
!29 = !DILocation(line: 30, column: 10, scope: !18)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !1, line: 33, type: !3)
!31 = distinct !DILexicalBlock(scope: !18, file: !1, line: 31, column: 5)
!32 = !DILocation(line: 33, column: 19, scope: !31)
!33 = !DILocation(line: 33, column: 43, scope: !31)
!34 = !DILocation(line: 33, column: 32, scope: !31)
!35 = !DILocalVariable(name: "i", scope: !36, file: !1, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !31, file: !1, line: 34, column: 9)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!39 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 35, column: 20, scope: !36)
!41 = !DILocation(line: 36, column: 20, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !1, line: 36, column: 13)
!43 = !DILocation(line: 36, column: 18, scope: !42)
!44 = !DILocation(line: 36, column: 25, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !1, line: 36, column: 13)
!46 = !DILocation(line: 36, column: 27, scope: !45)
!47 = !DILocation(line: 36, column: 13, scope: !42)
!48 = !DILocation(line: 38, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !1, line: 37, column: 13)
!50 = !DILocation(line: 38, column: 28, scope: !49)
!51 = !DILocation(line: 38, column: 31, scope: !49)
!52 = !DILocation(line: 39, column: 13, scope: !49)
!53 = !DILocation(line: 36, column: 35, scope: !45)
!54 = !DILocation(line: 36, column: 13, scope: !45)
!55 = distinct !{!55, !47, !56, !57}
!56 = !DILocation(line: 39, column: 13, scope: !42)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 41, column: 16, scope: !31)
!59 = !DILocation(line: 41, column: 14, scope: !31)
!60 = !DILocation(line: 44, column: 20, scope: !18)
!61 = !DILocation(line: 44, column: 5, scope: !18)
!62 = !DILocation(line: 44, column: 18, scope: !18)
!63 = !DILocation(line: 45, column: 69, scope: !18)
!64 = !DILocation(line: 45, column: 5, scope: !18)
!65 = !DILocation(line: 46, column: 1, scope: !18)
!66 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66_good", scope: !1, file: !1, line: 81, type: !19, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!67 = !DILocation(line: 83, column: 5, scope: !66)
!68 = !DILocation(line: 84, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 55, type: !19, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!70 = !DILocalVariable(name: "data", scope: !69, file: !1, line: 57, type: !3)
!71 = !DILocation(line: 57, column: 15, scope: !69)
!72 = !DILocalVariable(name: "dataArray", scope: !69, file: !1, line: 58, type: !25)
!73 = !DILocation(line: 58, column: 15, scope: !69)
!74 = !DILocation(line: 59, column: 10, scope: !69)
!75 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !1, line: 62, type: !3)
!76 = distinct !DILexicalBlock(scope: !69, file: !1, line: 60, column: 5)
!77 = !DILocation(line: 62, column: 19, scope: !76)
!78 = !DILocation(line: 62, column: 43, scope: !76)
!79 = !DILocation(line: 62, column: 32, scope: !76)
!80 = !DILocation(line: 63, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !1, line: 63, column: 13)
!82 = !DILocation(line: 63, column: 24, scope: !81)
!83 = !DILocation(line: 63, column: 13, scope: !76)
!84 = !DILocation(line: 65, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !1, line: 64, column: 9)
!86 = !DILocation(line: 66, column: 13, scope: !85)
!87 = !DILocalVariable(name: "i", scope: !88, file: !1, line: 69, type: !37)
!88 = distinct !DILexicalBlock(scope: !76, file: !1, line: 68, column: 9)
!89 = !DILocation(line: 69, column: 20, scope: !88)
!90 = !DILocation(line: 70, column: 20, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !1, line: 70, column: 13)
!92 = !DILocation(line: 70, column: 18, scope: !91)
!93 = !DILocation(line: 70, column: 25, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !1, line: 70, column: 13)
!95 = !DILocation(line: 70, column: 27, scope: !94)
!96 = !DILocation(line: 70, column: 13, scope: !91)
!97 = !DILocation(line: 72, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !1, line: 71, column: 13)
!99 = !DILocation(line: 72, column: 28, scope: !98)
!100 = !DILocation(line: 72, column: 31, scope: !98)
!101 = !DILocation(line: 73, column: 13, scope: !98)
!102 = !DILocation(line: 70, column: 35, scope: !94)
!103 = !DILocation(line: 70, column: 13, scope: !94)
!104 = distinct !{!104, !96, !105, !57}
!105 = !DILocation(line: 73, column: 13, scope: !91)
!106 = !DILocation(line: 75, column: 16, scope: !76)
!107 = !DILocation(line: 75, column: 14, scope: !76)
!108 = !DILocation(line: 77, column: 20, scope: !69)
!109 = !DILocation(line: 77, column: 5, scope: !69)
!110 = !DILocation(line: 77, column: 18, scope: !69)
!111 = !DILocation(line: 78, column: 73, scope: !69)
!112 = !DILocation(line: 78, column: 5, scope: !69)
!113 = !DILocation(line: 79, column: 1, scope: !69)
