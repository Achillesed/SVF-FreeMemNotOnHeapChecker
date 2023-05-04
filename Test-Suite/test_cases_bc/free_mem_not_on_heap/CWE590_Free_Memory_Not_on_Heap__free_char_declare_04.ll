; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_04.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_04_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay1, i8** %data, align 8, !dbg !33
  %0 = load i8*, i8** %data, align 8, !dbg !34
  call void @printLine(i8* noundef %0), !dbg !35
  %1 = load i8*, i8** %data, align 8, !dbg !36
  call void @free(i8* noundef %1) #6, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_04_good() #0 !dbg !39 {
entry:
  call void @goodG2B1(), !dbg !40
  call void @goodG2B2(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !43 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !44, metadata !DIExpression()), !dbg !45
  store i8* null, i8** %data, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !47, metadata !DIExpression()), !dbg !51
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !52
  store i8* %call, i8** %dataBuffer, align 8, !dbg !51
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !53
  %cmp = icmp eq i8* %0, null, !dbg !55
  br i1 %cmp, label %if.then, label %if.end, !dbg !56

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @exit(i32 noundef 1) #7, !dbg !59
  unreachable, !dbg !59

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !61
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !62
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !62
  store i8 0, i8* %arrayidx, align 1, !dbg !63
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !64
  store i8* %3, i8** %data, align 8, !dbg !65
  %4 = load i8*, i8** %data, align 8, !dbg !66
  call void @printLine(i8* noundef %4), !dbg !67
  %5 = load i8*, i8** %data, align 8, !dbg !68
  call void @free(i8* noundef %5) #6, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  store i8* null, i8** %data, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !79
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !80
  store i8* %call, i8** %dataBuffer, align 8, !dbg !79
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !81
  %cmp = icmp eq i8* %0, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @exit(i32 noundef 1) #7, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !89
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !92
  store i8* %3, i8** %data, align 8, !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* noundef %4), !dbg !95
  %5 = load i8*, i8** %data, align 8, !dbg !96
  call void @free(i8* noundef %5) #6, !dbg !97
  ret void, !dbg !98
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_04.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "c48634b0a38efdea4ae3dc48c2538633")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_04_bad", scope: !1, file: !1, line: 30, type: !15, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 32, type: !3)
!19 = !DILocation(line: 32, column: 12, scope: !14)
!20 = !DILocation(line: 33, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !1, line: 38, type: !25)
!22 = distinct !DILexicalBlock(scope: !23, file: !1, line: 36, column: 9)
!23 = distinct !DILexicalBlock(scope: !24, file: !1, line: 35, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !1, line: 34, column: 8)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 38, column: 18, scope: !22)
!29 = !DILocation(line: 39, column: 13, scope: !22)
!30 = !DILocation(line: 40, column: 13, scope: !22)
!31 = !DILocation(line: 40, column: 31, scope: !22)
!32 = !DILocation(line: 41, column: 20, scope: !22)
!33 = !DILocation(line: 41, column: 18, scope: !22)
!34 = !DILocation(line: 44, column: 15, scope: !14)
!35 = !DILocation(line: 44, column: 5, scope: !14)
!36 = !DILocation(line: 46, column: 10, scope: !14)
!37 = !DILocation(line: 46, column: 5, scope: !14)
!38 = !DILocation(line: 47, column: 1, scope: !14)
!39 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_04_good", scope: !1, file: !1, line: 108, type: !15, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!40 = !DILocation(line: 110, column: 5, scope: !39)
!41 = !DILocation(line: 111, column: 5, scope: !39)
!42 = !DILocation(line: 112, column: 1, scope: !39)
!43 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!44 = !DILocalVariable(name: "data", scope: !43, file: !1, line: 56, type: !3)
!45 = !DILocation(line: 56, column: 12, scope: !43)
!46 = !DILocation(line: 57, column: 10, scope: !43)
!47 = !DILocalVariable(name: "dataBuffer", scope: !48, file: !1, line: 67, type: !3)
!48 = distinct !DILexicalBlock(scope: !49, file: !1, line: 65, column: 9)
!49 = distinct !DILexicalBlock(scope: !50, file: !1, line: 64, column: 5)
!50 = distinct !DILexicalBlock(scope: !43, file: !1, line: 58, column: 8)
!51 = !DILocation(line: 67, column: 20, scope: !48)
!52 = !DILocation(line: 67, column: 41, scope: !48)
!53 = !DILocation(line: 68, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !1, line: 68, column: 17)
!55 = !DILocation(line: 68, column: 28, scope: !54)
!56 = !DILocation(line: 68, column: 17, scope: !48)
!57 = !DILocation(line: 70, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !1, line: 69, column: 13)
!59 = !DILocation(line: 71, column: 17, scope: !58)
!60 = !DILocation(line: 73, column: 20, scope: !48)
!61 = !DILocation(line: 73, column: 13, scope: !48)
!62 = !DILocation(line: 74, column: 13, scope: !48)
!63 = !DILocation(line: 74, column: 31, scope: !48)
!64 = !DILocation(line: 75, column: 20, scope: !48)
!65 = !DILocation(line: 75, column: 18, scope: !48)
!66 = !DILocation(line: 78, column: 15, scope: !43)
!67 = !DILocation(line: 78, column: 5, scope: !43)
!68 = !DILocation(line: 80, column: 10, scope: !43)
!69 = !DILocation(line: 80, column: 5, scope: !43)
!70 = !DILocation(line: 81, column: 1, scope: !43)
!71 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 84, type: !15, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!72 = !DILocalVariable(name: "data", scope: !71, file: !1, line: 86, type: !3)
!73 = !DILocation(line: 86, column: 12, scope: !71)
!74 = !DILocation(line: 87, column: 10, scope: !71)
!75 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !1, line: 92, type: !3)
!76 = distinct !DILexicalBlock(scope: !77, file: !1, line: 90, column: 9)
!77 = distinct !DILexicalBlock(scope: !78, file: !1, line: 89, column: 5)
!78 = distinct !DILexicalBlock(scope: !71, file: !1, line: 88, column: 8)
!79 = !DILocation(line: 92, column: 20, scope: !76)
!80 = !DILocation(line: 92, column: 41, scope: !76)
!81 = !DILocation(line: 93, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !1, line: 93, column: 17)
!83 = !DILocation(line: 93, column: 28, scope: !82)
!84 = !DILocation(line: 93, column: 17, scope: !76)
!85 = !DILocation(line: 95, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !1, line: 94, column: 13)
!87 = !DILocation(line: 96, column: 17, scope: !86)
!88 = !DILocation(line: 98, column: 20, scope: !76)
!89 = !DILocation(line: 98, column: 13, scope: !76)
!90 = !DILocation(line: 99, column: 13, scope: !76)
!91 = !DILocation(line: 99, column: 31, scope: !76)
!92 = !DILocation(line: 100, column: 20, scope: !76)
!93 = !DILocation(line: 100, column: 18, scope: !76)
!94 = !DILocation(line: 103, column: 15, scope: !71)
!95 = !DILocation(line: 103, column: 5, scope: !71)
!96 = !DILocation(line: 105, column: 10, scope: !71)
!97 = !DILocation(line: 105, column: 5, scope: !71)
!98 = !DILocation(line: 106, column: 1, scope: !71)
