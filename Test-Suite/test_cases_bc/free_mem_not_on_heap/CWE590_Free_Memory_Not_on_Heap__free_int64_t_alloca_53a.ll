; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_53a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_53a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_53_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 800, align 16, !dbg !28
  %1 = bitcast i8* %0 to i64*, !dbg !29
  store i64* %1, i64** %dataBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %2, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !43
  %4 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !43
  store i64 5, i64* %arrayidx, align 8, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %5, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !53
  store i64* %6, i64** %data, align 8, !dbg !54
  %7 = load i64*, i64** %data, align 8, !dbg !55
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_53b_badSink(i64* noundef %7), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_53b_badSink(i64* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_53_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !61 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !62, metadata !DIExpression()), !dbg !63
  store i64* null, i64** %data, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !65, metadata !DIExpression()), !dbg !67
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !68
  %0 = bitcast i8* %call to i64*, !dbg !69
  store i64* %0, i64** %dataBuffer, align 8, !dbg !67
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !70
  %cmp = icmp eq i64* %1, null, !dbg !72
  br i1 %cmp, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @exit(i32 noundef 1) #6, !dbg !76
  unreachable, !dbg !76

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !77, metadata !DIExpression()), !dbg !79
  store i64 0, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !83
  %cmp1 = icmp ult i64 %2, 100, !dbg !85
  br i1 %cmp1, label %for.body, label %for.end, !dbg !86

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !87
  %4 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !87
  store i64 5, i64* %arrayidx, align 8, !dbg !90
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !92
  %inc = add i64 %5, 1, !dbg !92
  store i64 %inc, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !93, !llvm.loop !94

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !96
  store i64* %6, i64** %data, align 8, !dbg !97
  %7 = load i64*, i64** %data, align 8, !dbg !98
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_53b_goodG2BSink(i64* noundef %7), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_53b_goodG2BSink(i64* noundef) #2

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_53a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "53b67447b90f76fce97bc75f13877678")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_53_bad", scope: !1, file: !1, line: 26, type: !19, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 28, type: !3)
!23 = !DILocation(line: 28, column: 15, scope: !18)
!24 = !DILocation(line: 29, column: 10, scope: !18)
!25 = !DILocalVariable(name: "dataBuffer", scope: !26, file: !1, line: 32, type: !3)
!26 = distinct !DILexicalBlock(scope: !18, file: !1, line: 30, column: 5)
!27 = !DILocation(line: 32, column: 19, scope: !26)
!28 = !DILocation(line: 32, column: 43, scope: !26)
!29 = !DILocation(line: 32, column: 32, scope: !26)
!30 = !DILocalVariable(name: "i", scope: !31, file: !1, line: 34, type: !32)
!31 = distinct !DILexicalBlock(scope: !26, file: !1, line: 33, column: 9)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !33, line: 46, baseType: !34)
!33 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!34 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 34, column: 20, scope: !31)
!36 = !DILocation(line: 35, column: 20, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !1, line: 35, column: 13)
!38 = !DILocation(line: 35, column: 18, scope: !37)
!39 = !DILocation(line: 35, column: 25, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !1, line: 35, column: 13)
!41 = !DILocation(line: 35, column: 27, scope: !40)
!42 = !DILocation(line: 35, column: 13, scope: !37)
!43 = !DILocation(line: 37, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !1, line: 36, column: 13)
!45 = !DILocation(line: 37, column: 28, scope: !44)
!46 = !DILocation(line: 37, column: 31, scope: !44)
!47 = !DILocation(line: 38, column: 13, scope: !44)
!48 = !DILocation(line: 35, column: 35, scope: !40)
!49 = !DILocation(line: 35, column: 13, scope: !40)
!50 = distinct !{!50, !42, !51, !52}
!51 = !DILocation(line: 38, column: 13, scope: !37)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 40, column: 16, scope: !26)
!54 = !DILocation(line: 40, column: 14, scope: !26)
!55 = !DILocation(line: 42, column: 69, scope: !18)
!56 = !DILocation(line: 42, column: 5, scope: !18)
!57 = !DILocation(line: 43, column: 1, scope: !18)
!58 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_53_good", scope: !1, file: !1, line: 77, type: !19, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!59 = !DILocation(line: 79, column: 5, scope: !58)
!60 = !DILocation(line: 80, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!62 = !DILocalVariable(name: "data", scope: !61, file: !1, line: 55, type: !3)
!63 = !DILocation(line: 55, column: 15, scope: !61)
!64 = !DILocation(line: 56, column: 10, scope: !61)
!65 = !DILocalVariable(name: "dataBuffer", scope: !66, file: !1, line: 59, type: !3)
!66 = distinct !DILexicalBlock(scope: !61, file: !1, line: 57, column: 5)
!67 = !DILocation(line: 59, column: 19, scope: !66)
!68 = !DILocation(line: 59, column: 43, scope: !66)
!69 = !DILocation(line: 59, column: 32, scope: !66)
!70 = !DILocation(line: 60, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !1, line: 60, column: 13)
!72 = !DILocation(line: 60, column: 24, scope: !71)
!73 = !DILocation(line: 60, column: 13, scope: !66)
!74 = !DILocation(line: 62, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !1, line: 61, column: 9)
!76 = !DILocation(line: 63, column: 13, scope: !75)
!77 = !DILocalVariable(name: "i", scope: !78, file: !1, line: 66, type: !32)
!78 = distinct !DILexicalBlock(scope: !66, file: !1, line: 65, column: 9)
!79 = !DILocation(line: 66, column: 20, scope: !78)
!80 = !DILocation(line: 67, column: 20, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !1, line: 67, column: 13)
!82 = !DILocation(line: 67, column: 18, scope: !81)
!83 = !DILocation(line: 67, column: 25, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !1, line: 67, column: 13)
!85 = !DILocation(line: 67, column: 27, scope: !84)
!86 = !DILocation(line: 67, column: 13, scope: !81)
!87 = !DILocation(line: 69, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !1, line: 68, column: 13)
!89 = !DILocation(line: 69, column: 28, scope: !88)
!90 = !DILocation(line: 69, column: 31, scope: !88)
!91 = !DILocation(line: 70, column: 13, scope: !88)
!92 = !DILocation(line: 67, column: 35, scope: !84)
!93 = !DILocation(line: 67, column: 13, scope: !84)
!94 = distinct !{!94, !86, !95, !52}
!95 = !DILocation(line: 70, column: 13, scope: !81)
!96 = !DILocation(line: 72, column: 16, scope: !66)
!97 = !DILocation(line: 72, column: 14, scope: !66)
!98 = !DILocation(line: 74, column: 73, scope: !61)
!99 = !DILocation(line: 74, column: 5, scope: !61)
!100 = !DILocation(line: 75, column: 1, scope: !61)
