; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_17.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_17_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_17_bad() #0 !dbg !2 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i32* null, i32** %data, align 8, !dbg !30
  store i32 0, i32* %i, align 4, !dbg !31
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !34
  %cmp = icmp slt i32 %0, 1, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %call = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_17_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !38
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_17_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !41
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_17_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %1, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* noundef %2), !dbg !50
  %3 = load i32*, i32** %data, align 8, !dbg !51
  %4 = bitcast i32* %3 to i8*, !dbg !51
  call void @free(i8* noundef %4) #5, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_17_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !57 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i32** %data, metadata !60, metadata !DIExpression()), !dbg !61
  store i32* null, i32** %data, align 8, !dbg !62
  store i32 0, i32* %h, align 4, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !66
  %cmp = icmp slt i32 %0, 1, !dbg !68
  br i1 %cmp, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !73
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !74
  %1 = bitcast i8* %call to i32*, !dbg !75
  store i32* %1, i32** %dataBuffer, align 8, !dbg !73
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !76
  %cmp1 = icmp eq i32* %2, null, !dbg !78
  br i1 %cmp1, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %for.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @exit(i32 noundef 1) #6, !dbg !82
  unreachable, !dbg !82

if.end:                                           ; preds = %for.body
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !83
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !84
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !87
  store i32* %5, i32** %data, align 8, !dbg !88
  br label %for.inc, !dbg !89

for.inc:                                          ; preds = %if.end
  %6 = load i32, i32* %h, align 4, !dbg !90
  %inc = add nsw i32 %6, 1, !dbg !90
  store i32 %inc, i32* %h, align 4, !dbg !90
  br label %for.cond, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !94
  call void @printWLine(i32* noundef %7), !dbg !95
  %8 = load i32*, i32** %data, align 8, !dbg !96
  %9 = bitcast i32* %8 to i8*, !dbg !96
  call void @free(i8* noundef %9) #5, !dbg !97
  ret void, !dbg !98
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!18, !19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 32, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_17_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_17.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "b800b6775b1675507a743d82d2379721")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !13, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !12}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !{!0}
!14 = !{}
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 100)
!18 = !{i32 7, !"Dwarf Version", i32 5}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"PIC Level", i32 2}
!22 = !{i32 7, !"PIE Level", i32 2}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!26 = !DILocalVariable(name: "i", scope: !2, file: !3, line: 25, type: !11)
!27 = !DILocation(line: 25, column: 9, scope: !2)
!28 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 26, type: !8)
!29 = !DILocation(line: 26, column: 15, scope: !2)
!30 = !DILocation(line: 27, column: 10, scope: !2)
!31 = !DILocation(line: 28, column: 11, scope: !32)
!32 = distinct !DILexicalBlock(scope: !2, file: !3, line: 28, column: 5)
!33 = !DILocation(line: 28, column: 9, scope: !32)
!34 = !DILocation(line: 28, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !3, line: 28, column: 5)
!36 = !DILocation(line: 28, column: 18, scope: !35)
!37 = !DILocation(line: 28, column: 5, scope: !32)
!38 = !DILocation(line: 33, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !40, file: !3, line: 30, column: 9)
!40 = distinct !DILexicalBlock(scope: !35, file: !3, line: 29, column: 5)
!41 = !DILocation(line: 34, column: 31, scope: !39)
!42 = !DILocation(line: 35, column: 18, scope: !39)
!43 = !DILocation(line: 37, column: 5, scope: !40)
!44 = !DILocation(line: 28, column: 24, scope: !35)
!45 = !DILocation(line: 28, column: 5, scope: !35)
!46 = distinct !{!46, !37, !47, !48}
!47 = !DILocation(line: 37, column: 5, scope: !32)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocation(line: 38, column: 16, scope: !2)
!50 = !DILocation(line: 38, column: 5, scope: !2)
!51 = !DILocation(line: 40, column: 10, scope: !2)
!52 = !DILocation(line: 40, column: 5, scope: !2)
!53 = !DILocation(line: 41, column: 1, scope: !2)
!54 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_17_good", scope: !3, file: !3, line: 73, type: !4, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!55 = !DILocation(line: 75, column: 5, scope: !54)
!56 = !DILocation(line: 76, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 48, type: !4, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!58 = !DILocalVariable(name: "h", scope: !57, file: !3, line: 50, type: !11)
!59 = !DILocation(line: 50, column: 9, scope: !57)
!60 = !DILocalVariable(name: "data", scope: !57, file: !3, line: 51, type: !8)
!61 = !DILocation(line: 51, column: 15, scope: !57)
!62 = !DILocation(line: 52, column: 10, scope: !57)
!63 = !DILocation(line: 53, column: 11, scope: !64)
!64 = distinct !DILexicalBlock(scope: !57, file: !3, line: 53, column: 5)
!65 = !DILocation(line: 53, column: 9, scope: !64)
!66 = !DILocation(line: 53, column: 16, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !3, line: 53, column: 5)
!68 = !DILocation(line: 53, column: 18, scope: !67)
!69 = !DILocation(line: 53, column: 5, scope: !64)
!70 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !3, line: 57, type: !8)
!71 = distinct !DILexicalBlock(scope: !72, file: !3, line: 55, column: 9)
!72 = distinct !DILexicalBlock(scope: !67, file: !3, line: 54, column: 5)
!73 = !DILocation(line: 57, column: 23, scope: !71)
!74 = !DILocation(line: 57, column: 47, scope: !71)
!75 = !DILocation(line: 57, column: 36, scope: !71)
!76 = !DILocation(line: 58, column: 17, scope: !77)
!77 = distinct !DILexicalBlock(scope: !71, file: !3, line: 58, column: 17)
!78 = !DILocation(line: 58, column: 28, scope: !77)
!79 = !DILocation(line: 58, column: 17, scope: !71)
!80 = !DILocation(line: 60, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !3, line: 59, column: 13)
!82 = !DILocation(line: 61, column: 17, scope: !81)
!83 = !DILocation(line: 63, column: 21, scope: !71)
!84 = !DILocation(line: 63, column: 13, scope: !71)
!85 = !DILocation(line: 64, column: 13, scope: !71)
!86 = !DILocation(line: 64, column: 31, scope: !71)
!87 = !DILocation(line: 65, column: 20, scope: !71)
!88 = !DILocation(line: 65, column: 18, scope: !71)
!89 = !DILocation(line: 67, column: 5, scope: !72)
!90 = !DILocation(line: 53, column: 24, scope: !67)
!91 = !DILocation(line: 53, column: 5, scope: !67)
!92 = distinct !{!92, !69, !93, !48}
!93 = !DILocation(line: 67, column: 5, scope: !64)
!94 = !DILocation(line: 68, column: 16, scope: !57)
!95 = !DILocation(line: 68, column: 5, scope: !57)
!96 = !DILocation(line: 70, column: 10, scope: !57)
!97 = !DILocation(line: 70, column: 5, scope: !57)
!98 = !DILocation(line: 71, column: 1, scope: !57)
