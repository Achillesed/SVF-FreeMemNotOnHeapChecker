; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_static_64a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_static_64a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_long_static_64_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_static_64_bad() #0 !dbg !2 {
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
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_long_static_64_bad.dataBuffer, i64 0, i64 %1, !dbg !43
  store i64 5, i64* %arrayidx, align 8, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !46
  %inc = add i64 %2, 1, !dbg !46
  store i64 %inc, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_long_static_64_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !51
  %3 = bitcast i64** %data to i8*, !dbg !52
  call void @CWE590_Free_Memory_Not_on_Heap__free_long_static_64b_badSink(i8* noundef %3), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_long_static_64b_badSink(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_static_64_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !58 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !59, metadata !DIExpression()), !dbg !60
  store i64* null, i64** %data, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !62, metadata !DIExpression()), !dbg !64
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !65
  %0 = bitcast i8* %call to i64*, !dbg !66
  store i64* %0, i64** %dataBuffer, align 8, !dbg !64
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !67
  %cmp = icmp eq i64* %1, null, !dbg !69
  br i1 %cmp, label %if.then, label %if.end, !dbg !70

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @exit(i32 noundef 1) #6, !dbg !73
  unreachable, !dbg !73

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !74, metadata !DIExpression()), !dbg !76
  store i64 0, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !79

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !80
  %cmp1 = icmp ult i64 %2, 100, !dbg !82
  br i1 %cmp1, label %for.body, label %for.end, !dbg !83

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !84
  %4 = load i64, i64* %i, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !84
  store i64 5, i64* %arrayidx, align 8, !dbg !87
  br label %for.inc, !dbg !88

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !89
  %inc = add i64 %5, 1, !dbg !89
  store i64 %inc, i64* %i, align 8, !dbg !89
  br label %for.cond, !dbg !90, !llvm.loop !91

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !93
  store i64* %6, i64** %data, align 8, !dbg !94
  %7 = bitcast i64** %data to i8*, !dbg !95
  call void @CWE590_Free_Memory_Not_on_Heap__free_long_static_64b_goodG2BSink(i8* noundef %7), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_long_static_64b_goodG2BSink(i8* noundef) #2

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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 32, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_64_bad", scope: !3, file: !3, line: 26, type: !4, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_static_64a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "4066bd3beb16e98f346c139fed02a287")
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
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 28, type: !8)
!25 = !DILocation(line: 28, column: 12, scope: !2)
!26 = !DILocation(line: 29, column: 10, scope: !2)
!27 = !DILocalVariable(name: "i", scope: !28, file: !3, line: 34, type: !30)
!28 = distinct !DILexicalBlock(scope: !29, file: !3, line: 33, column: 9)
!29 = distinct !DILexicalBlock(scope: !2, file: !3, line: 30, column: 5)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 46, baseType: !32)
!31 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!32 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 34, column: 20, scope: !28)
!34 = !DILocation(line: 35, column: 20, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !3, line: 35, column: 13)
!36 = !DILocation(line: 35, column: 18, scope: !35)
!37 = !DILocation(line: 35, column: 25, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !3, line: 35, column: 13)
!39 = !DILocation(line: 35, column: 27, scope: !38)
!40 = !DILocation(line: 35, column: 13, scope: !35)
!41 = !DILocation(line: 37, column: 28, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !3, line: 36, column: 13)
!43 = !DILocation(line: 37, column: 17, scope: !42)
!44 = !DILocation(line: 37, column: 31, scope: !42)
!45 = !DILocation(line: 38, column: 13, scope: !42)
!46 = !DILocation(line: 35, column: 35, scope: !38)
!47 = !DILocation(line: 35, column: 13, scope: !38)
!48 = distinct !{!48, !40, !49, !50}
!49 = !DILocation(line: 38, column: 13, scope: !35)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocation(line: 40, column: 14, scope: !29)
!52 = !DILocation(line: 42, column: 66, scope: !2)
!53 = !DILocation(line: 42, column: 5, scope: !2)
!54 = !DILocation(line: 43, column: 1, scope: !2)
!55 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_64_good", scope: !3, file: !3, line: 76, type: !4, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!56 = !DILocation(line: 78, column: 5, scope: !55)
!57 = !DILocation(line: 79, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 52, type: !4, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!59 = !DILocalVariable(name: "data", scope: !58, file: !3, line: 54, type: !8)
!60 = !DILocation(line: 54, column: 12, scope: !58)
!61 = !DILocation(line: 55, column: 10, scope: !58)
!62 = !DILocalVariable(name: "dataBuffer", scope: !63, file: !3, line: 58, type: !8)
!63 = distinct !DILexicalBlock(scope: !58, file: !3, line: 56, column: 5)
!64 = !DILocation(line: 58, column: 16, scope: !63)
!65 = !DILocation(line: 58, column: 37, scope: !63)
!66 = !DILocation(line: 58, column: 29, scope: !63)
!67 = !DILocation(line: 59, column: 13, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !3, line: 59, column: 13)
!69 = !DILocation(line: 59, column: 24, scope: !68)
!70 = !DILocation(line: 59, column: 13, scope: !63)
!71 = !DILocation(line: 61, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !3, line: 60, column: 9)
!73 = !DILocation(line: 62, column: 13, scope: !72)
!74 = !DILocalVariable(name: "i", scope: !75, file: !3, line: 65, type: !30)
!75 = distinct !DILexicalBlock(scope: !63, file: !3, line: 64, column: 9)
!76 = !DILocation(line: 65, column: 20, scope: !75)
!77 = !DILocation(line: 66, column: 20, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !3, line: 66, column: 13)
!79 = !DILocation(line: 66, column: 18, scope: !78)
!80 = !DILocation(line: 66, column: 25, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !3, line: 66, column: 13)
!82 = !DILocation(line: 66, column: 27, scope: !81)
!83 = !DILocation(line: 66, column: 13, scope: !78)
!84 = !DILocation(line: 68, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !3, line: 67, column: 13)
!86 = !DILocation(line: 68, column: 28, scope: !85)
!87 = !DILocation(line: 68, column: 31, scope: !85)
!88 = !DILocation(line: 69, column: 13, scope: !85)
!89 = !DILocation(line: 66, column: 35, scope: !81)
!90 = !DILocation(line: 66, column: 13, scope: !81)
!91 = distinct !{!91, !83, !92, !50}
!92 = !DILocation(line: 69, column: 13, scope: !78)
!93 = !DILocation(line: 71, column: 16, scope: !63)
!94 = !DILocation(line: 71, column: 14, scope: !63)
!95 = !DILocation(line: 73, column: 70, scope: !58)
!96 = !DILocation(line: 73, column: 5, scope: !58)
!97 = !DILocation(line: 74, column: 1, scope: !58)
