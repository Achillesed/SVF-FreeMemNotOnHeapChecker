; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_03.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_03_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !28
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  store i8* %3, i8** %data, align 8, !dbg !32
  %4 = load i8*, i8** %data, align 8, !dbg !33
  call void @printLine(i8* noundef %4), !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  call void @free(i8* noundef %5) #6, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_03_good() #0 !dbg !38 {
entry:
  call void @goodG2B1(), !dbg !39
  call void @goodG2B2(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !42 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !43, metadata !DIExpression()), !dbg !44
  store i8* null, i8** %data, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !46, metadata !DIExpression()), !dbg !50
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !51
  store i8* %call, i8** %dataBuffer, align 8, !dbg !50
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !52
  %cmp = icmp eq i8* %0, null, !dbg !54
  br i1 %cmp, label %if.then, label %if.end, !dbg !55

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @exit(i32 noundef 1) #7, !dbg !58
  unreachable, !dbg !58

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !60
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !61
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !61
  store i8 0, i8* %arrayidx, align 1, !dbg !62
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !63
  store i8* %3, i8** %data, align 8, !dbg !64
  %4 = load i8*, i8** %data, align 8, !dbg !65
  call void @printLine(i8* noundef %4), !dbg !66
  %5 = load i8*, i8** %data, align 8, !dbg !67
  call void @free(i8* noundef %5) #6, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i8* null, i8** %data, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !78
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !79
  store i8* %call, i8** %dataBuffer, align 8, !dbg !78
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !80
  %cmp = icmp eq i8* %0, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @exit(i32 noundef 1) #7, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !88
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !89
  store i8 0, i8* %arrayidx, align 1, !dbg !90
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !91
  store i8* %3, i8** %data, align 8, !dbg !92
  %4 = load i8*, i8** %data, align 8, !dbg !93
  call void @printLine(i8* noundef %4), !dbg !94
  %5 = load i8*, i8** %data, align 8, !dbg !95
  call void @free(i8* noundef %5) #6, !dbg !96
  ret void, !dbg !97
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_03.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "c0db347c00e0d8e2d5a856e4b7335e49")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_03_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !1, line: 31, type: !3)
!22 = distinct !DILexicalBlock(scope: !23, file: !1, line: 29, column: 9)
!23 = distinct !DILexicalBlock(scope: !24, file: !1, line: 28, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !1, line: 27, column: 8)
!25 = !DILocation(line: 31, column: 20, scope: !22)
!26 = !DILocation(line: 31, column: 41, scope: !22)
!27 = !DILocation(line: 32, column: 20, scope: !22)
!28 = !DILocation(line: 32, column: 13, scope: !22)
!29 = !DILocation(line: 33, column: 13, scope: !22)
!30 = !DILocation(line: 33, column: 31, scope: !22)
!31 = !DILocation(line: 34, column: 20, scope: !22)
!32 = !DILocation(line: 34, column: 18, scope: !22)
!33 = !DILocation(line: 37, column: 15, scope: !14)
!34 = !DILocation(line: 37, column: 5, scope: !14)
!35 = !DILocation(line: 39, column: 10, scope: !14)
!36 = !DILocation(line: 39, column: 5, scope: !14)
!37 = !DILocation(line: 40, column: 1, scope: !14)
!38 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_03_good", scope: !1, file: !1, line: 101, type: !15, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!39 = !DILocation(line: 103, column: 5, scope: !38)
!40 = !DILocation(line: 104, column: 5, scope: !38)
!41 = !DILocation(line: 105, column: 1, scope: !38)
!42 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 47, type: !15, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!43 = !DILocalVariable(name: "data", scope: !42, file: !1, line: 49, type: !3)
!44 = !DILocation(line: 49, column: 12, scope: !42)
!45 = !DILocation(line: 50, column: 10, scope: !42)
!46 = !DILocalVariable(name: "dataBuffer", scope: !47, file: !1, line: 60, type: !3)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 58, column: 9)
!48 = distinct !DILexicalBlock(scope: !49, file: !1, line: 57, column: 5)
!49 = distinct !DILexicalBlock(scope: !42, file: !1, line: 51, column: 8)
!50 = !DILocation(line: 60, column: 20, scope: !47)
!51 = !DILocation(line: 60, column: 41, scope: !47)
!52 = !DILocation(line: 61, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !1, line: 61, column: 17)
!54 = !DILocation(line: 61, column: 28, scope: !53)
!55 = !DILocation(line: 61, column: 17, scope: !47)
!56 = !DILocation(line: 63, column: 17, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !1, line: 62, column: 13)
!58 = !DILocation(line: 64, column: 17, scope: !57)
!59 = !DILocation(line: 66, column: 20, scope: !47)
!60 = !DILocation(line: 66, column: 13, scope: !47)
!61 = !DILocation(line: 67, column: 13, scope: !47)
!62 = !DILocation(line: 67, column: 31, scope: !47)
!63 = !DILocation(line: 68, column: 20, scope: !47)
!64 = !DILocation(line: 68, column: 18, scope: !47)
!65 = !DILocation(line: 71, column: 15, scope: !42)
!66 = !DILocation(line: 71, column: 5, scope: !42)
!67 = !DILocation(line: 73, column: 10, scope: !42)
!68 = !DILocation(line: 73, column: 5, scope: !42)
!69 = !DILocation(line: 74, column: 1, scope: !42)
!70 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 77, type: !15, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!71 = !DILocalVariable(name: "data", scope: !70, file: !1, line: 79, type: !3)
!72 = !DILocation(line: 79, column: 12, scope: !70)
!73 = !DILocation(line: 80, column: 10, scope: !70)
!74 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !1, line: 85, type: !3)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 83, column: 9)
!76 = distinct !DILexicalBlock(scope: !77, file: !1, line: 82, column: 5)
!77 = distinct !DILexicalBlock(scope: !70, file: !1, line: 81, column: 8)
!78 = !DILocation(line: 85, column: 20, scope: !75)
!79 = !DILocation(line: 85, column: 41, scope: !75)
!80 = !DILocation(line: 86, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !1, line: 86, column: 17)
!82 = !DILocation(line: 86, column: 28, scope: !81)
!83 = !DILocation(line: 86, column: 17, scope: !75)
!84 = !DILocation(line: 88, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !1, line: 87, column: 13)
!86 = !DILocation(line: 89, column: 17, scope: !85)
!87 = !DILocation(line: 91, column: 20, scope: !75)
!88 = !DILocation(line: 91, column: 13, scope: !75)
!89 = !DILocation(line: 92, column: 13, scope: !75)
!90 = !DILocation(line: 92, column: 31, scope: !75)
!91 = !DILocation(line: 93, column: 20, scope: !75)
!92 = !DILocation(line: 93, column: 18, scope: !75)
!93 = !DILocation(line: 96, column: 15, scope: !70)
!94 = !DILocation(line: 96, column: 5, scope: !70)
!95 = !DILocation(line: 98, column: 10, scope: !70)
!96 = !DILocation(line: 98, column: 5, scope: !70)
!97 = !DILocation(line: 99, column: 1, scope: !70)
