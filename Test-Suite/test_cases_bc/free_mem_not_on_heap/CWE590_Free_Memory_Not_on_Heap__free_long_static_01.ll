; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_static_01.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_static_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_long_static_01_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_static_01_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i64* null, i64** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i64* %i, metadata !27, metadata !DIExpression()), !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !37
  %cmp = icmp ult i64 %0, 100, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !41
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_long_static_01_bad.dataBuffer, i64 0, i64 %1, !dbg !43
  store i64 5, i64* %arrayidx, align 8, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !46
  %inc = add i64 %2, 1, !dbg !46
  store i64 %inc, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_long_static_01_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !51
  %3 = load i64*, i64** %data, align 8, !dbg !52
  %arrayidx1 = getelementptr inbounds i64, i64* %3, i64 0, !dbg !52
  %4 = load i64, i64* %arrayidx1, align 8, !dbg !52
  call void @printLongLine(i64 noundef %4), !dbg !53
  %5 = load i64*, i64** %data, align 8, !dbg !54
  %6 = bitcast i64* %5 to i8*, !dbg !54
  call void @free(i8* noundef %6) #5, !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_static_01_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !60 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !61, metadata !DIExpression()), !dbg !62
  store i64* null, i64** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !64, metadata !DIExpression()), !dbg !66
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !67
  %0 = bitcast i8* %call to i64*, !dbg !68
  store i64* %0, i64** %dataBuffer, align 8, !dbg !66
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !69
  %cmp = icmp eq i64* %1, null, !dbg !71
  br i1 %cmp, label %if.then, label %if.end, !dbg !72

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @exit(i32 noundef 1) #6, !dbg !75
  unreachable, !dbg !75

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !76, metadata !DIExpression()), !dbg !78
  store i64 0, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !82
  %cmp1 = icmp ult i64 %2, 100, !dbg !84
  br i1 %cmp1, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !86
  %4 = load i64, i64* %i, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !86
  store i64 5, i64* %arrayidx, align 8, !dbg !89
  br label %for.inc, !dbg !90

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !91
  %inc = add i64 %5, 1, !dbg !91
  store i64 %inc, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !92, !llvm.loop !93

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !95
  store i64* %6, i64** %data, align 8, !dbg !96
  %7 = load i64*, i64** %data, align 8, !dbg !97
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !97
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !97
  call void @printLongLine(i64 noundef %8), !dbg !98
  %9 = load i64*, i64** %data, align 8, !dbg !99
  %10 = bitcast i64* %9 to i8*, !dbg !99
  call void @free(i8* noundef %10) #5, !dbg !100
  ret void, !dbg !101
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
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 29, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_01_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_static_01.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1b9314e05ccb0a04776a13ab6b45bec2")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0}
!12 = !{}
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 6400, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 100)
!16 = !{i32 7, !"Dwarf Version", i32 5}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"PIE Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 25, type: !8)
!25 = !DILocation(line: 25, column: 12, scope: !2)
!26 = !DILocation(line: 26, column: 10, scope: !2)
!27 = !DILocalVariable(name: "i", scope: !28, file: !3, line: 31, type: !30)
!28 = distinct !DILexicalBlock(scope: !29, file: !3, line: 30, column: 9)
!29 = distinct !DILexicalBlock(scope: !2, file: !3, line: 27, column: 5)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 46, baseType: !32)
!31 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!32 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 31, column: 20, scope: !28)
!34 = !DILocation(line: 32, column: 20, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !3, line: 32, column: 13)
!36 = !DILocation(line: 32, column: 18, scope: !35)
!37 = !DILocation(line: 32, column: 25, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !3, line: 32, column: 13)
!39 = !DILocation(line: 32, column: 27, scope: !38)
!40 = !DILocation(line: 32, column: 13, scope: !35)
!41 = !DILocation(line: 34, column: 28, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !3, line: 33, column: 13)
!43 = !DILocation(line: 34, column: 17, scope: !42)
!44 = !DILocation(line: 34, column: 31, scope: !42)
!45 = !DILocation(line: 35, column: 13, scope: !42)
!46 = !DILocation(line: 32, column: 35, scope: !38)
!47 = !DILocation(line: 32, column: 13, scope: !38)
!48 = distinct !{!48, !40, !49, !50}
!49 = !DILocation(line: 35, column: 13, scope: !35)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocation(line: 37, column: 14, scope: !29)
!52 = !DILocation(line: 39, column: 19, scope: !2)
!53 = !DILocation(line: 39, column: 5, scope: !2)
!54 = !DILocation(line: 41, column: 10, scope: !2)
!55 = !DILocation(line: 41, column: 5, scope: !2)
!56 = !DILocation(line: 42, column: 1, scope: !2)
!57 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_01_good", scope: !3, file: !3, line: 75, type: !4, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!58 = !DILocation(line: 77, column: 5, scope: !57)
!59 = !DILocation(line: 78, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 49, type: !4, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!61 = !DILocalVariable(name: "data", scope: !60, file: !3, line: 51, type: !8)
!62 = !DILocation(line: 51, column: 12, scope: !60)
!63 = !DILocation(line: 52, column: 10, scope: !60)
!64 = !DILocalVariable(name: "dataBuffer", scope: !65, file: !3, line: 55, type: !8)
!65 = distinct !DILexicalBlock(scope: !60, file: !3, line: 53, column: 5)
!66 = !DILocation(line: 55, column: 16, scope: !65)
!67 = !DILocation(line: 55, column: 37, scope: !65)
!68 = !DILocation(line: 55, column: 29, scope: !65)
!69 = !DILocation(line: 56, column: 13, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !3, line: 56, column: 13)
!71 = !DILocation(line: 56, column: 24, scope: !70)
!72 = !DILocation(line: 56, column: 13, scope: !65)
!73 = !DILocation(line: 58, column: 13, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !3, line: 57, column: 9)
!75 = !DILocation(line: 59, column: 13, scope: !74)
!76 = !DILocalVariable(name: "i", scope: !77, file: !3, line: 62, type: !30)
!77 = distinct !DILexicalBlock(scope: !65, file: !3, line: 61, column: 9)
!78 = !DILocation(line: 62, column: 20, scope: !77)
!79 = !DILocation(line: 63, column: 20, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !3, line: 63, column: 13)
!81 = !DILocation(line: 63, column: 18, scope: !80)
!82 = !DILocation(line: 63, column: 25, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !3, line: 63, column: 13)
!84 = !DILocation(line: 63, column: 27, scope: !83)
!85 = !DILocation(line: 63, column: 13, scope: !80)
!86 = !DILocation(line: 65, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !3, line: 64, column: 13)
!88 = !DILocation(line: 65, column: 28, scope: !87)
!89 = !DILocation(line: 65, column: 31, scope: !87)
!90 = !DILocation(line: 66, column: 13, scope: !87)
!91 = !DILocation(line: 63, column: 35, scope: !83)
!92 = !DILocation(line: 63, column: 13, scope: !83)
!93 = distinct !{!93, !85, !94, !50}
!94 = !DILocation(line: 66, column: 13, scope: !80)
!95 = !DILocation(line: 68, column: 16, scope: !65)
!96 = !DILocation(line: 68, column: 14, scope: !65)
!97 = !DILocation(line: 70, column: 19, scope: !60)
!98 = !DILocation(line: 70, column: 5, scope: !60)
!99 = !DILocation(line: 72, column: 10, scope: !60)
!100 = !DILocation(line: 72, column: 5, scope: !60)
!101 = !DILocation(line: 73, column: 1, scope: !60)
