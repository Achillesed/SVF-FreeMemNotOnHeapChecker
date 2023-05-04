; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_01.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_01_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_01_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i64* null, i64** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %0, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_01_bad.dataBuffer, i64 0, i64 %1, !dbg !47
  store i64 5, i64* %arrayidx, align 8, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %2, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_01_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !55
  %3 = load i64*, i64** %data, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds i64, i64* %3, i64 0, !dbg !56
  %4 = load i64, i64* %arrayidx1, align 8, !dbg !56
  call void @printLongLongLine(i64 noundef %4), !dbg !57
  %5 = load i64*, i64** %data, align 8, !dbg !58
  %6 = bitcast i64* %5 to i8*, !dbg !58
  call void @free(i8* noundef %6) #5, !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_01_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !64 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !65, metadata !DIExpression()), !dbg !66
  store i64* null, i64** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !68, metadata !DIExpression()), !dbg !70
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !71
  %0 = bitcast i8* %call to i64*, !dbg !72
  store i64* %0, i64** %dataBuffer, align 8, !dbg !70
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !73
  %cmp = icmp eq i64* %1, null, !dbg !75
  br i1 %cmp, label %if.then, label %if.end, !dbg !76

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @exit(i32 noundef 1) #6, !dbg !79
  unreachable, !dbg !79

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !80, metadata !DIExpression()), !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !86
  %cmp1 = icmp ult i64 %2, 100, !dbg !88
  br i1 %cmp1, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !90
  %4 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !90
  store i64 5, i64* %arrayidx, align 8, !dbg !93
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !95
  %inc = add i64 %5, 1, !dbg !95
  store i64 %inc, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !99
  store i64* %6, i64** %data, align 8, !dbg !100
  %7 = load i64*, i64** %data, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !101
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !101
  call void @printLongLongLine(i64 noundef %8), !dbg !102
  %9 = load i64*, i64** %data, align 8, !dbg !103
  %10 = bitcast i64* %9 to i8*, !dbg !103
  call void @free(i8* noundef %10) #5, !dbg !104
  ret void, !dbg !105
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

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!20, !21, !22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 29, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_01_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_01.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "bd8564d76ace1cab64b42df3ae1b9dce")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !15, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !14}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !10, line: 27, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !12, line: 44, baseType: !13)
!12 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!13 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !{!0}
!16 = !{}
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 6400, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 100)
!20 = !{i32 7, !"Dwarf Version", i32 5}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"PIC Level", i32 2}
!24 = !{i32 7, !"PIE Level", i32 2}
!25 = !{i32 7, !"uwtable", i32 1}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!28 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 25, type: !8)
!29 = !DILocation(line: 25, column: 15, scope: !2)
!30 = !DILocation(line: 26, column: 10, scope: !2)
!31 = !DILocalVariable(name: "i", scope: !32, file: !3, line: 31, type: !34)
!32 = distinct !DILexicalBlock(scope: !33, file: !3, line: 30, column: 9)
!33 = distinct !DILexicalBlock(scope: !2, file: !3, line: 27, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 31, column: 20, scope: !32)
!38 = !DILocation(line: 32, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !3, line: 32, column: 13)
!40 = !DILocation(line: 32, column: 18, scope: !39)
!41 = !DILocation(line: 32, column: 25, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !3, line: 32, column: 13)
!43 = !DILocation(line: 32, column: 27, scope: !42)
!44 = !DILocation(line: 32, column: 13, scope: !39)
!45 = !DILocation(line: 34, column: 28, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !3, line: 33, column: 13)
!47 = !DILocation(line: 34, column: 17, scope: !46)
!48 = !DILocation(line: 34, column: 31, scope: !46)
!49 = !DILocation(line: 35, column: 13, scope: !46)
!50 = !DILocation(line: 32, column: 35, scope: !42)
!51 = !DILocation(line: 32, column: 13, scope: !42)
!52 = distinct !{!52, !44, !53, !54}
!53 = !DILocation(line: 35, column: 13, scope: !39)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 37, column: 14, scope: !33)
!56 = !DILocation(line: 39, column: 23, scope: !2)
!57 = !DILocation(line: 39, column: 5, scope: !2)
!58 = !DILocation(line: 41, column: 10, scope: !2)
!59 = !DILocation(line: 41, column: 5, scope: !2)
!60 = !DILocation(line: 42, column: 1, scope: !2)
!61 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_01_good", scope: !3, file: !3, line: 75, type: !4, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!62 = !DILocation(line: 77, column: 5, scope: !61)
!63 = !DILocation(line: 78, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 49, type: !4, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!65 = !DILocalVariable(name: "data", scope: !64, file: !3, line: 51, type: !8)
!66 = !DILocation(line: 51, column: 15, scope: !64)
!67 = !DILocation(line: 52, column: 10, scope: !64)
!68 = !DILocalVariable(name: "dataBuffer", scope: !69, file: !3, line: 55, type: !8)
!69 = distinct !DILexicalBlock(scope: !64, file: !3, line: 53, column: 5)
!70 = !DILocation(line: 55, column: 19, scope: !69)
!71 = !DILocation(line: 55, column: 43, scope: !69)
!72 = !DILocation(line: 55, column: 32, scope: !69)
!73 = !DILocation(line: 56, column: 13, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !3, line: 56, column: 13)
!75 = !DILocation(line: 56, column: 24, scope: !74)
!76 = !DILocation(line: 56, column: 13, scope: !69)
!77 = !DILocation(line: 58, column: 13, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !3, line: 57, column: 9)
!79 = !DILocation(line: 59, column: 13, scope: !78)
!80 = !DILocalVariable(name: "i", scope: !81, file: !3, line: 62, type: !34)
!81 = distinct !DILexicalBlock(scope: !69, file: !3, line: 61, column: 9)
!82 = !DILocation(line: 62, column: 20, scope: !81)
!83 = !DILocation(line: 63, column: 20, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !3, line: 63, column: 13)
!85 = !DILocation(line: 63, column: 18, scope: !84)
!86 = !DILocation(line: 63, column: 25, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !3, line: 63, column: 13)
!88 = !DILocation(line: 63, column: 27, scope: !87)
!89 = !DILocation(line: 63, column: 13, scope: !84)
!90 = !DILocation(line: 65, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !3, line: 64, column: 13)
!92 = !DILocation(line: 65, column: 28, scope: !91)
!93 = !DILocation(line: 65, column: 31, scope: !91)
!94 = !DILocation(line: 66, column: 13, scope: !91)
!95 = !DILocation(line: 63, column: 35, scope: !87)
!96 = !DILocation(line: 63, column: 13, scope: !87)
!97 = distinct !{!97, !89, !98, !54}
!98 = !DILocation(line: 66, column: 13, scope: !84)
!99 = !DILocation(line: 68, column: 16, scope: !69)
!100 = !DILocation(line: 68, column: 14, scope: !69)
!101 = !DILocation(line: 70, column: 23, scope: !64)
!102 = !DILocation(line: 70, column: 5, scope: !64)
!103 = !DILocation(line: 72, column: 10, scope: !64)
!104 = !DILocation(line: 72, column: 5, scope: !64)
!105 = !DILocation(line: 73, column: 1, scope: !64)
