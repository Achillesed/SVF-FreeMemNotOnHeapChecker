; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68_badData = dso_local global i64* null, align 8, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68_goodG2BData = dso_local global i64* null, align 8, !dbg !13
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68_bad() #0 !dbg !23 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !27, metadata !DIExpression()), !dbg !28
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
  store i64* %7, i64** @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68_badData, align 8, !dbg !61
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68b_badSink(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68b_badSink(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !67 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i64* null, i64** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !73
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !74
  %0 = bitcast i8* %call to i64*, !dbg !75
  store i64* %0, i64** %dataBuffer, align 8, !dbg !73
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !76
  %cmp = icmp eq i64* %1, null, !dbg !78
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
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !93
  %4 = load i64, i64* %i, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !93
  store i64 5, i64* %arrayidx, align 8, !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !98
  %inc = add i64 %5, 1, !dbg !98
  store i64 %inc, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !102
  store i64* %6, i64** %data, align 8, !dbg !103
  %7 = load i64*, i64** %data, align 8, !dbg !104
  store i64* %7, i64** @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68_goodG2BData, align 8, !dbg !105
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68b_goodG2BSink(), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68b_goodG2BSink(...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68_badData", scope: !2, file: !3, line: 21, type: !5, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "30fc64818c077fe83bbc7d4a979f60fa")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!10 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68_goodG2BData", scope: !2, file: !3, line: 22, type: !5, isLocal: false, isDefinition: true)
!15 = !{i32 7, !"Dwarf Version", i32 5}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{i32 7, !"PIE Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!23 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68_bad", scope: !3, file: !3, line: 29, type: !24, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !3, line: 31, type: !5)
!28 = !DILocation(line: 31, column: 15, scope: !23)
!29 = !DILocation(line: 32, column: 10, scope: !23)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !3, line: 35, type: !5)
!31 = distinct !DILexicalBlock(scope: !23, file: !3, line: 33, column: 5)
!32 = !DILocation(line: 35, column: 19, scope: !31)
!33 = !DILocation(line: 35, column: 43, scope: !31)
!34 = !DILocation(line: 35, column: 32, scope: !31)
!35 = !DILocalVariable(name: "i", scope: !36, file: !3, line: 37, type: !37)
!36 = distinct !DILexicalBlock(scope: !31, file: !3, line: 36, column: 9)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!39 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 37, column: 20, scope: !36)
!41 = !DILocation(line: 38, column: 20, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !3, line: 38, column: 13)
!43 = !DILocation(line: 38, column: 18, scope: !42)
!44 = !DILocation(line: 38, column: 25, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !3, line: 38, column: 13)
!46 = !DILocation(line: 38, column: 27, scope: !45)
!47 = !DILocation(line: 38, column: 13, scope: !42)
!48 = !DILocation(line: 40, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !3, line: 39, column: 13)
!50 = !DILocation(line: 40, column: 28, scope: !49)
!51 = !DILocation(line: 40, column: 31, scope: !49)
!52 = !DILocation(line: 41, column: 13, scope: !49)
!53 = !DILocation(line: 38, column: 35, scope: !45)
!54 = !DILocation(line: 38, column: 13, scope: !45)
!55 = distinct !{!55, !47, !56, !57}
!56 = !DILocation(line: 41, column: 13, scope: !42)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 43, column: 16, scope: !31)
!59 = !DILocation(line: 43, column: 14, scope: !31)
!60 = !DILocation(line: 45, column: 70, scope: !23)
!61 = !DILocation(line: 45, column: 68, scope: !23)
!62 = !DILocation(line: 46, column: 5, scope: !23)
!63 = !DILocation(line: 47, column: 1, scope: !23)
!64 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68_good", scope: !3, file: !3, line: 82, type: !24, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!65 = !DILocation(line: 84, column: 5, scope: !64)
!66 = !DILocation(line: 85, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 57, type: !24, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!68 = !DILocalVariable(name: "data", scope: !67, file: !3, line: 59, type: !5)
!69 = !DILocation(line: 59, column: 15, scope: !67)
!70 = !DILocation(line: 60, column: 10, scope: !67)
!71 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !3, line: 63, type: !5)
!72 = distinct !DILexicalBlock(scope: !67, file: !3, line: 61, column: 5)
!73 = !DILocation(line: 63, column: 19, scope: !72)
!74 = !DILocation(line: 63, column: 43, scope: !72)
!75 = !DILocation(line: 63, column: 32, scope: !72)
!76 = !DILocation(line: 64, column: 13, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !3, line: 64, column: 13)
!78 = !DILocation(line: 64, column: 24, scope: !77)
!79 = !DILocation(line: 64, column: 13, scope: !72)
!80 = !DILocation(line: 66, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !3, line: 65, column: 9)
!82 = !DILocation(line: 67, column: 13, scope: !81)
!83 = !DILocalVariable(name: "i", scope: !84, file: !3, line: 70, type: !37)
!84 = distinct !DILexicalBlock(scope: !72, file: !3, line: 69, column: 9)
!85 = !DILocation(line: 70, column: 20, scope: !84)
!86 = !DILocation(line: 71, column: 20, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !3, line: 71, column: 13)
!88 = !DILocation(line: 71, column: 18, scope: !87)
!89 = !DILocation(line: 71, column: 25, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !3, line: 71, column: 13)
!91 = !DILocation(line: 71, column: 27, scope: !90)
!92 = !DILocation(line: 71, column: 13, scope: !87)
!93 = !DILocation(line: 73, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !3, line: 72, column: 13)
!95 = !DILocation(line: 73, column: 28, scope: !94)
!96 = !DILocation(line: 73, column: 31, scope: !94)
!97 = !DILocation(line: 74, column: 13, scope: !94)
!98 = !DILocation(line: 71, column: 35, scope: !90)
!99 = !DILocation(line: 71, column: 13, scope: !90)
!100 = distinct !{!100, !92, !101, !57}
!101 = !DILocation(line: 74, column: 13, scope: !87)
!102 = !DILocation(line: 76, column: 16, scope: !72)
!103 = !DILocation(line: 76, column: 14, scope: !72)
!104 = !DILocation(line: 78, column: 74, scope: !67)
!105 = !DILocation(line: 78, column: 72, scope: !67)
!106 = !DILocation(line: 79, column: 5, scope: !67)
!107 = !DILocation(line: 80, column: 1, scope: !67)
