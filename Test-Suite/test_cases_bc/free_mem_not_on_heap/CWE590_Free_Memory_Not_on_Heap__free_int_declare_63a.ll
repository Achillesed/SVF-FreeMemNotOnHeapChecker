; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_declare_63a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_declare_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_63_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i64* %i, metadata !27, metadata !DIExpression()), !dbg !32
  store i64 0, i64* %i, align 8, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !36
  %cmp = icmp ult i64 %0, 100, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !40
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 %1, !dbg !42
  store i32 5, i32* %arrayidx, align 4, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !45
  %inc = add i64 %2, 1, !dbg !45
  store i64 %inc, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !50
  store i32* %arraydecay, i32** %data, align 8, !dbg !51
  call void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_63b_badSink(i32** noundef %data), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_63b_badSink(i32** noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_63_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !57 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !58, metadata !DIExpression()), !dbg !59
  store i32* null, i32** %data, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !61, metadata !DIExpression()), !dbg !63
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !64
  %0 = bitcast i8* %call to i32*, !dbg !65
  store i32* %0, i32** %dataBuffer, align 8, !dbg !63
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !66
  %cmp = icmp eq i32* %1, null, !dbg !68
  br i1 %cmp, label %if.then, label %if.end, !dbg !69

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @exit(i32 noundef 1) #6, !dbg !72
  unreachable, !dbg !72

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !73, metadata !DIExpression()), !dbg !75
  store i64 0, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !78

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !79
  %cmp1 = icmp ult i64 %2, 100, !dbg !81
  br i1 %cmp1, label %for.body, label %for.end, !dbg !82

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !83
  %4 = load i64, i64* %i, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !83
  store i32 5, i32* %arrayidx, align 4, !dbg !86
  br label %for.inc, !dbg !87

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !88
  %inc = add i64 %5, 1, !dbg !88
  store i64 %inc, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !89, !llvm.loop !90

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !92
  store i32* %6, i32** %data, align 8, !dbg !93
  call void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_63b_goodG2BSink(i32** noundef %data), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_63b_goodG2BSink(i32** noundef) #2

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_63a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1494be0e74d9860d2c57dc8634c3a0ef")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_63_bad", scope: !1, file: !1, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 28, type: !3)
!19 = !DILocation(line: 28, column: 11, scope: !14)
!20 = !DILocation(line: 29, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !1, line: 32, type: !23)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 30, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 32, column: 13, scope: !22)
!27 = !DILocalVariable(name: "i", scope: !28, file: !1, line: 34, type: !29)
!28 = distinct !DILexicalBlock(scope: !22, file: !1, line: 33, column: 9)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !30, line: 46, baseType: !31)
!30 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!31 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 34, column: 20, scope: !28)
!33 = !DILocation(line: 35, column: 20, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !1, line: 35, column: 13)
!35 = !DILocation(line: 35, column: 18, scope: !34)
!36 = !DILocation(line: 35, column: 25, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !1, line: 35, column: 13)
!38 = !DILocation(line: 35, column: 27, scope: !37)
!39 = !DILocation(line: 35, column: 13, scope: !34)
!40 = !DILocation(line: 37, column: 28, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !1, line: 36, column: 13)
!42 = !DILocation(line: 37, column: 17, scope: !41)
!43 = !DILocation(line: 37, column: 31, scope: !41)
!44 = !DILocation(line: 38, column: 13, scope: !41)
!45 = !DILocation(line: 35, column: 35, scope: !37)
!46 = !DILocation(line: 35, column: 13, scope: !37)
!47 = distinct !{!47, !39, !48, !49}
!48 = !DILocation(line: 38, column: 13, scope: !34)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocation(line: 40, column: 16, scope: !22)
!51 = !DILocation(line: 40, column: 14, scope: !22)
!52 = !DILocation(line: 42, column: 5, scope: !14)
!53 = !DILocation(line: 43, column: 1, scope: !14)
!54 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_63_good", scope: !1, file: !1, line: 76, type: !15, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!55 = !DILocation(line: 78, column: 5, scope: !54)
!56 = !DILocation(line: 79, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!58 = !DILocalVariable(name: "data", scope: !57, file: !1, line: 54, type: !3)
!59 = !DILocation(line: 54, column: 11, scope: !57)
!60 = !DILocation(line: 55, column: 10, scope: !57)
!61 = !DILocalVariable(name: "dataBuffer", scope: !62, file: !1, line: 58, type: !3)
!62 = distinct !DILexicalBlock(scope: !57, file: !1, line: 56, column: 5)
!63 = !DILocation(line: 58, column: 15, scope: !62)
!64 = !DILocation(line: 58, column: 35, scope: !62)
!65 = !DILocation(line: 58, column: 28, scope: !62)
!66 = !DILocation(line: 59, column: 13, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !1, line: 59, column: 13)
!68 = !DILocation(line: 59, column: 24, scope: !67)
!69 = !DILocation(line: 59, column: 13, scope: !62)
!70 = !DILocation(line: 61, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !1, line: 60, column: 9)
!72 = !DILocation(line: 62, column: 13, scope: !71)
!73 = !DILocalVariable(name: "i", scope: !74, file: !1, line: 65, type: !29)
!74 = distinct !DILexicalBlock(scope: !62, file: !1, line: 64, column: 9)
!75 = !DILocation(line: 65, column: 20, scope: !74)
!76 = !DILocation(line: 66, column: 20, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !1, line: 66, column: 13)
!78 = !DILocation(line: 66, column: 18, scope: !77)
!79 = !DILocation(line: 66, column: 25, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !1, line: 66, column: 13)
!81 = !DILocation(line: 66, column: 27, scope: !80)
!82 = !DILocation(line: 66, column: 13, scope: !77)
!83 = !DILocation(line: 68, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !1, line: 67, column: 13)
!85 = !DILocation(line: 68, column: 28, scope: !84)
!86 = !DILocation(line: 68, column: 31, scope: !84)
!87 = !DILocation(line: 69, column: 13, scope: !84)
!88 = !DILocation(line: 66, column: 35, scope: !80)
!89 = !DILocation(line: 66, column: 13, scope: !80)
!90 = distinct !{!90, !82, !91, !49}
!91 = !DILocation(line: 69, column: 13, scope: !77)
!92 = !DILocation(line: 71, column: 16, scope: !62)
!93 = !DILocation(line: 71, column: 14, scope: !62)
!94 = !DILocation(line: 73, column: 5, scope: !57)
!95 = !DILocation(line: 74, column: 1, scope: !57)