; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_alloca_65a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_65_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i32*)* @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_65b_badSink, void (i32*)** %funcPtr, align 8, !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 400, align 16, !dbg !29
  %1 = bitcast i8* %0 to i32*, !dbg !30
  store i32* %1, i32** %dataBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !40
  %cmp = icmp ult i64 %2, 100, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !44
  %4 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !44
  store i32 5, i32* %arrayidx, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %5, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !54
  store i32* %6, i32** %data, align 8, !dbg !55
  %7 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !56
  %8 = load i32*, i32** %data, align 8, !dbg !57
  call void %7(i32* noundef %8), !dbg !56
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_65b_badSink(i32* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_65_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !62 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !65, metadata !DIExpression()), !dbg !66
  store void (i32*)* @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_65b_goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !66
  store i32* null, i32** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !68, metadata !DIExpression()), !dbg !70
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !71
  %0 = bitcast i8* %call to i32*, !dbg !72
  store i32* %0, i32** %dataBuffer, align 8, !dbg !70
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !73
  %cmp = icmp eq i32* %1, null, !dbg !75
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
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !90
  %4 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !90
  store i32 5, i32* %arrayidx, align 4, !dbg !93
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !95
  %inc = add i64 %5, 1, !dbg !95
  store i64 %inc, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !99
  store i32* %6, i32** %data, align 8, !dbg !100
  %7 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !101
  %8 = load i32*, i32** %data, align 8, !dbg !102
  call void %7(i32* noundef %8), !dbg !101
  ret void, !dbg !103
}

declare void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_65b_goodG2BSink(i32* noundef) #2

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
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_65a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "832877054c9d5e6dd61dd2a1818bab88")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_65_bad", scope: !1, file: !1, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 28, type: !3)
!19 = !DILocation(line: 28, column: 11, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !1, line: 30, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !3}
!24 = !DILocation(line: 30, column: 12, scope: !14)
!25 = !DILocation(line: 31, column: 10, scope: !14)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !1, line: 34, type: !3)
!27 = distinct !DILexicalBlock(scope: !14, file: !1, line: 32, column: 5)
!28 = !DILocation(line: 34, column: 15, scope: !27)
!29 = !DILocation(line: 34, column: 35, scope: !27)
!30 = !DILocation(line: 34, column: 28, scope: !27)
!31 = !DILocalVariable(name: "i", scope: !32, file: !1, line: 36, type: !33)
!32 = distinct !DILexicalBlock(scope: !27, file: !1, line: 35, column: 9)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!35 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 36, column: 20, scope: !32)
!37 = !DILocation(line: 37, column: 20, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !1, line: 37, column: 13)
!39 = !DILocation(line: 37, column: 18, scope: !38)
!40 = !DILocation(line: 37, column: 25, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !1, line: 37, column: 13)
!42 = !DILocation(line: 37, column: 27, scope: !41)
!43 = !DILocation(line: 37, column: 13, scope: !38)
!44 = !DILocation(line: 39, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !1, line: 38, column: 13)
!46 = !DILocation(line: 39, column: 28, scope: !45)
!47 = !DILocation(line: 39, column: 31, scope: !45)
!48 = !DILocation(line: 40, column: 13, scope: !45)
!49 = !DILocation(line: 37, column: 35, scope: !41)
!50 = !DILocation(line: 37, column: 13, scope: !41)
!51 = distinct !{!51, !43, !52, !53}
!52 = !DILocation(line: 40, column: 13, scope: !38)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 42, column: 16, scope: !27)
!55 = !DILocation(line: 42, column: 14, scope: !27)
!56 = !DILocation(line: 45, column: 5, scope: !14)
!57 = !DILocation(line: 45, column: 13, scope: !14)
!58 = !DILocation(line: 46, column: 1, scope: !14)
!59 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_65_good", scope: !1, file: !1, line: 80, type: !15, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!60 = !DILocation(line: 82, column: 5, scope: !59)
!61 = !DILocation(line: 83, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!63 = !DILocalVariable(name: "data", scope: !62, file: !1, line: 57, type: !3)
!64 = !DILocation(line: 57, column: 11, scope: !62)
!65 = !DILocalVariable(name: "funcPtr", scope: !62, file: !1, line: 58, type: !21)
!66 = !DILocation(line: 58, column: 12, scope: !62)
!67 = !DILocation(line: 59, column: 10, scope: !62)
!68 = !DILocalVariable(name: "dataBuffer", scope: !69, file: !1, line: 62, type: !3)
!69 = distinct !DILexicalBlock(scope: !62, file: !1, line: 60, column: 5)
!70 = !DILocation(line: 62, column: 15, scope: !69)
!71 = !DILocation(line: 62, column: 35, scope: !69)
!72 = !DILocation(line: 62, column: 28, scope: !69)
!73 = !DILocation(line: 63, column: 13, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !1, line: 63, column: 13)
!75 = !DILocation(line: 63, column: 24, scope: !74)
!76 = !DILocation(line: 63, column: 13, scope: !69)
!77 = !DILocation(line: 65, column: 13, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !1, line: 64, column: 9)
!79 = !DILocation(line: 66, column: 13, scope: !78)
!80 = !DILocalVariable(name: "i", scope: !81, file: !1, line: 69, type: !33)
!81 = distinct !DILexicalBlock(scope: !69, file: !1, line: 68, column: 9)
!82 = !DILocation(line: 69, column: 20, scope: !81)
!83 = !DILocation(line: 70, column: 20, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !1, line: 70, column: 13)
!85 = !DILocation(line: 70, column: 18, scope: !84)
!86 = !DILocation(line: 70, column: 25, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !1, line: 70, column: 13)
!88 = !DILocation(line: 70, column: 27, scope: !87)
!89 = !DILocation(line: 70, column: 13, scope: !84)
!90 = !DILocation(line: 72, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !1, line: 71, column: 13)
!92 = !DILocation(line: 72, column: 28, scope: !91)
!93 = !DILocation(line: 72, column: 31, scope: !91)
!94 = !DILocation(line: 73, column: 13, scope: !91)
!95 = !DILocation(line: 70, column: 35, scope: !87)
!96 = !DILocation(line: 70, column: 13, scope: !87)
!97 = distinct !{!97, !89, !98, !53}
!98 = !DILocation(line: 73, column: 13, scope: !84)
!99 = !DILocation(line: 75, column: 16, scope: !69)
!100 = !DILocation(line: 75, column: 14, scope: !69)
!101 = !DILocation(line: 77, column: 5, scope: !62)
!102 = !DILocation(line: 77, column: 13, scope: !62)
!103 = !DILocation(line: 78, column: 1, scope: !62)
