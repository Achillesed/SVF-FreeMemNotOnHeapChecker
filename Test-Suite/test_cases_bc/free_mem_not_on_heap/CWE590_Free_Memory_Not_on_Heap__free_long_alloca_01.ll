; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_alloca_01.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i64* null, i64** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 800, align 16, !dbg !24
  %1 = bitcast i8* %0 to i64*, !dbg !25
  store i64* %1, i64** %dataBuffer, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !31
  store i64 0, i64* %i, align 8, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !35
  %cmp = icmp ult i64 %2, 100, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !39
  %4 = load i64, i64* %i, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !39
  store i64 5, i64* %arrayidx, align 8, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !44
  %inc = add i64 %5, 1, !dbg !44
  store i64 %inc, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !49
  store i64* %6, i64** %data, align 8, !dbg !50
  %7 = load i64*, i64** %data, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !51
  %8 = load i64, i64* %arrayidx1, align 8, !dbg !51
  call void @printLongLine(i64 noundef %8), !dbg !52
  %9 = load i64*, i64** %data, align 8, !dbg !53
  %10 = bitcast i64* %9 to i8*, !dbg !53
  call void @free(i8* noundef %10) #5, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_alloca_01_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !59 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !60, metadata !DIExpression()), !dbg !61
  store i64* null, i64** %data, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !63, metadata !DIExpression()), !dbg !65
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !66
  %0 = bitcast i8* %call to i64*, !dbg !67
  store i64* %0, i64** %dataBuffer, align 8, !dbg !65
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !68
  %cmp = icmp eq i64* %1, null, !dbg !70
  br i1 %cmp, label %if.then, label %if.end, !dbg !71

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @exit(i32 noundef 1) #6, !dbg !74
  unreachable, !dbg !74

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !75, metadata !DIExpression()), !dbg !77
  store i64 0, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !80

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !81
  %cmp1 = icmp ult i64 %2, 100, !dbg !83
  br i1 %cmp1, label %for.body, label %for.end, !dbg !84

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !85
  %4 = load i64, i64* %i, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !85
  store i64 5, i64* %arrayidx, align 8, !dbg !88
  br label %for.inc, !dbg !89

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !90
  %inc = add i64 %5, 1, !dbg !90
  store i64 %inc, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !91, !llvm.loop !92

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !94
  store i64* %6, i64** %data, align 8, !dbg !95
  %7 = load i64*, i64** %data, align 8, !dbg !96
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !96
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !96
  call void @printLongLine(i64 noundef %8), !dbg !97
  %9 = load i64*, i64** %data, align 8, !dbg !98
  %10 = bitcast i64* %9 to i8*, !dbg !98
  call void @free(i8* noundef %10) #5, !dbg !99
  ret void, !dbg !100
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_01.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "065a5e4fdc5d9dc0c193bd6cb821c421")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_01_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !1, line: 29, type: !3)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 27, column: 5)
!23 = !DILocation(line: 29, column: 16, scope: !22)
!24 = !DILocation(line: 29, column: 37, scope: !22)
!25 = !DILocation(line: 29, column: 29, scope: !22)
!26 = !DILocalVariable(name: "i", scope: !27, file: !1, line: 31, type: !28)
!27 = distinct !DILexicalBlock(scope: !22, file: !1, line: 30, column: 9)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !29, line: 46, baseType: !30)
!29 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!30 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 31, column: 20, scope: !27)
!32 = !DILocation(line: 32, column: 20, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !1, line: 32, column: 13)
!34 = !DILocation(line: 32, column: 18, scope: !33)
!35 = !DILocation(line: 32, column: 25, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !1, line: 32, column: 13)
!37 = !DILocation(line: 32, column: 27, scope: !36)
!38 = !DILocation(line: 32, column: 13, scope: !33)
!39 = !DILocation(line: 34, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !1, line: 33, column: 13)
!41 = !DILocation(line: 34, column: 28, scope: !40)
!42 = !DILocation(line: 34, column: 31, scope: !40)
!43 = !DILocation(line: 35, column: 13, scope: !40)
!44 = !DILocation(line: 32, column: 35, scope: !36)
!45 = !DILocation(line: 32, column: 13, scope: !36)
!46 = distinct !{!46, !38, !47, !48}
!47 = !DILocation(line: 35, column: 13, scope: !33)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocation(line: 37, column: 16, scope: !22)
!50 = !DILocation(line: 37, column: 14, scope: !22)
!51 = !DILocation(line: 39, column: 19, scope: !14)
!52 = !DILocation(line: 39, column: 5, scope: !14)
!53 = !DILocation(line: 41, column: 10, scope: !14)
!54 = !DILocation(line: 41, column: 5, scope: !14)
!55 = !DILocation(line: 42, column: 1, scope: !14)
!56 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_alloca_01_good", scope: !1, file: !1, line: 75, type: !15, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!57 = !DILocation(line: 77, column: 5, scope: !56)
!58 = !DILocation(line: 78, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 49, type: !15, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!60 = !DILocalVariable(name: "data", scope: !59, file: !1, line: 51, type: !3)
!61 = !DILocation(line: 51, column: 12, scope: !59)
!62 = !DILocation(line: 52, column: 10, scope: !59)
!63 = !DILocalVariable(name: "dataBuffer", scope: !64, file: !1, line: 55, type: !3)
!64 = distinct !DILexicalBlock(scope: !59, file: !1, line: 53, column: 5)
!65 = !DILocation(line: 55, column: 16, scope: !64)
!66 = !DILocation(line: 55, column: 37, scope: !64)
!67 = !DILocation(line: 55, column: 29, scope: !64)
!68 = !DILocation(line: 56, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !1, line: 56, column: 13)
!70 = !DILocation(line: 56, column: 24, scope: !69)
!71 = !DILocation(line: 56, column: 13, scope: !64)
!72 = !DILocation(line: 58, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !1, line: 57, column: 9)
!74 = !DILocation(line: 59, column: 13, scope: !73)
!75 = !DILocalVariable(name: "i", scope: !76, file: !1, line: 62, type: !28)
!76 = distinct !DILexicalBlock(scope: !64, file: !1, line: 61, column: 9)
!77 = !DILocation(line: 62, column: 20, scope: !76)
!78 = !DILocation(line: 63, column: 20, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !1, line: 63, column: 13)
!80 = !DILocation(line: 63, column: 18, scope: !79)
!81 = !DILocation(line: 63, column: 25, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !1, line: 63, column: 13)
!83 = !DILocation(line: 63, column: 27, scope: !82)
!84 = !DILocation(line: 63, column: 13, scope: !79)
!85 = !DILocation(line: 65, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !1, line: 64, column: 13)
!87 = !DILocation(line: 65, column: 28, scope: !86)
!88 = !DILocation(line: 65, column: 31, scope: !86)
!89 = !DILocation(line: 66, column: 13, scope: !86)
!90 = !DILocation(line: 63, column: 35, scope: !82)
!91 = !DILocation(line: 63, column: 13, scope: !82)
!92 = distinct !{!92, !84, !93, !48}
!93 = !DILocation(line: 66, column: 13, scope: !79)
!94 = !DILocation(line: 68, column: 16, scope: !64)
!95 = !DILocation(line: 68, column: 14, scope: !64)
!96 = !DILocation(line: 70, column: 19, scope: !59)
!97 = !DILocation(line: 70, column: 5, scope: !59)
!98 = !DILocation(line: 72, column: 10, scope: !59)
!99 = !DILocation(line: 72, column: 5, scope: !59)
!100 = !DILocation(line: 73, column: 1, scope: !59)
