; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_alloca_63a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_63_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 400, align 16, !dbg !24
  %1 = bitcast i8* %0 to i32*, !dbg !25
  store i32* %1, i32** %dataBuffer, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !31
  store i64 0, i64* %i, align 8, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !35
  %cmp = icmp ult i64 %2, 100, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %4 = load i64, i64* %i, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !39
  store i32 5, i32* %arrayidx, align 4, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !44
  %inc = add i64 %5, 1, !dbg !44
  store i64 %inc, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !49
  store i32* %6, i32** %data, align 8, !dbg !50
  call void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_63b_badSink(i32** noundef %data), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_63b_badSink(i32** noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_63_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !56 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !57, metadata !DIExpression()), !dbg !58
  store i32* null, i32** %data, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !60, metadata !DIExpression()), !dbg !62
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !63
  %0 = bitcast i8* %call to i32*, !dbg !64
  store i32* %0, i32** %dataBuffer, align 8, !dbg !62
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !65
  %cmp = icmp eq i32* %1, null, !dbg !67
  br i1 %cmp, label %if.then, label %if.end, !dbg !68

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @exit(i32 noundef 1) #6, !dbg !71
  unreachable, !dbg !71

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !72, metadata !DIExpression()), !dbg !74
  store i64 0, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !77

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !78
  %cmp1 = icmp ult i64 %2, 100, !dbg !80
  br i1 %cmp1, label %for.body, label %for.end, !dbg !81

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !82
  %4 = load i64, i64* %i, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !82
  store i32 5, i32* %arrayidx, align 4, !dbg !85
  br label %for.inc, !dbg !86

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !87
  %inc = add i64 %5, 1, !dbg !87
  store i64 %inc, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !88, !llvm.loop !89

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !91
  store i32* %6, i32** %data, align 8, !dbg !92
  call void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_63b_goodG2BSink(i32** noundef %data), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_int_alloca_63b_goodG2BSink(i32** noundef) #2

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_63a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "3fd4509c3002458019aa3660c2436ac8")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_63_bad", scope: !1, file: !1, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 28, type: !3)
!19 = !DILocation(line: 28, column: 11, scope: !14)
!20 = !DILocation(line: 29, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !1, line: 32, type: !3)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 30, column: 5)
!23 = !DILocation(line: 32, column: 15, scope: !22)
!24 = !DILocation(line: 32, column: 35, scope: !22)
!25 = !DILocation(line: 32, column: 28, scope: !22)
!26 = !DILocalVariable(name: "i", scope: !27, file: !1, line: 34, type: !28)
!27 = distinct !DILexicalBlock(scope: !22, file: !1, line: 33, column: 9)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !29, line: 46, baseType: !30)
!29 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!30 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 34, column: 20, scope: !27)
!32 = !DILocation(line: 35, column: 20, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !1, line: 35, column: 13)
!34 = !DILocation(line: 35, column: 18, scope: !33)
!35 = !DILocation(line: 35, column: 25, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !1, line: 35, column: 13)
!37 = !DILocation(line: 35, column: 27, scope: !36)
!38 = !DILocation(line: 35, column: 13, scope: !33)
!39 = !DILocation(line: 37, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !1, line: 36, column: 13)
!41 = !DILocation(line: 37, column: 28, scope: !40)
!42 = !DILocation(line: 37, column: 31, scope: !40)
!43 = !DILocation(line: 38, column: 13, scope: !40)
!44 = !DILocation(line: 35, column: 35, scope: !36)
!45 = !DILocation(line: 35, column: 13, scope: !36)
!46 = distinct !{!46, !38, !47, !48}
!47 = !DILocation(line: 38, column: 13, scope: !33)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocation(line: 40, column: 16, scope: !22)
!50 = !DILocation(line: 40, column: 14, scope: !22)
!51 = !DILocation(line: 42, column: 5, scope: !14)
!52 = !DILocation(line: 43, column: 1, scope: !14)
!53 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_alloca_63_good", scope: !1, file: !1, line: 76, type: !15, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!54 = !DILocation(line: 78, column: 5, scope: !53)
!55 = !DILocation(line: 79, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!57 = !DILocalVariable(name: "data", scope: !56, file: !1, line: 54, type: !3)
!58 = !DILocation(line: 54, column: 11, scope: !56)
!59 = !DILocation(line: 55, column: 10, scope: !56)
!60 = !DILocalVariable(name: "dataBuffer", scope: !61, file: !1, line: 58, type: !3)
!61 = distinct !DILexicalBlock(scope: !56, file: !1, line: 56, column: 5)
!62 = !DILocation(line: 58, column: 15, scope: !61)
!63 = !DILocation(line: 58, column: 35, scope: !61)
!64 = !DILocation(line: 58, column: 28, scope: !61)
!65 = !DILocation(line: 59, column: 13, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !1, line: 59, column: 13)
!67 = !DILocation(line: 59, column: 24, scope: !66)
!68 = !DILocation(line: 59, column: 13, scope: !61)
!69 = !DILocation(line: 61, column: 13, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !1, line: 60, column: 9)
!71 = !DILocation(line: 62, column: 13, scope: !70)
!72 = !DILocalVariable(name: "i", scope: !73, file: !1, line: 65, type: !28)
!73 = distinct !DILexicalBlock(scope: !61, file: !1, line: 64, column: 9)
!74 = !DILocation(line: 65, column: 20, scope: !73)
!75 = !DILocation(line: 66, column: 20, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !1, line: 66, column: 13)
!77 = !DILocation(line: 66, column: 18, scope: !76)
!78 = !DILocation(line: 66, column: 25, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !1, line: 66, column: 13)
!80 = !DILocation(line: 66, column: 27, scope: !79)
!81 = !DILocation(line: 66, column: 13, scope: !76)
!82 = !DILocation(line: 68, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !1, line: 67, column: 13)
!84 = !DILocation(line: 68, column: 28, scope: !83)
!85 = !DILocation(line: 68, column: 31, scope: !83)
!86 = !DILocation(line: 69, column: 13, scope: !83)
!87 = !DILocation(line: 66, column: 35, scope: !79)
!88 = !DILocation(line: 66, column: 13, scope: !79)
!89 = distinct !{!89, !81, !90, !48}
!90 = !DILocation(line: 69, column: 13, scope: !76)
!91 = !DILocation(line: 71, column: 16, scope: !61)
!92 = !DILocation(line: 71, column: 14, scope: !61)
!93 = !DILocation(line: 73, column: 5, scope: !56)
!94 = !DILocation(line: 74, column: 1, scope: !56)
