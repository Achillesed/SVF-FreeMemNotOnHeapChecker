; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_12.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataBuffer1 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 100, align 16, !dbg !28
  store i8* %0, i8** %dataBuffer, align 8, !dbg !27
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !30
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  store i8* %3, i8** %data, align 8, !dbg !34
  br label %if.end5, !dbg !35

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer1, metadata !36, metadata !DIExpression()), !dbg !39
  %call2 = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !40
  store i8* %call2, i8** %dataBuffer1, align 8, !dbg !39
  %4 = load i8*, i8** %dataBuffer1, align 8, !dbg !41
  %cmp = icmp eq i8* %4, null, !dbg !43
  br i1 %cmp, label %if.then3, label %if.end, !dbg !44

if.then3:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !45
  call void @exit(i32 noundef 1) #7, !dbg !47
  unreachable, !dbg !47

if.end:                                           ; preds = %if.else
  %5 = load i8*, i8** %dataBuffer1, align 8, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 1 %5, i8 65, i64 99, i1 false), !dbg !49
  %6 = load i8*, i8** %dataBuffer1, align 8, !dbg !50
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !50
  store i8 0, i8* %arrayidx4, align 1, !dbg !51
  %7 = load i8*, i8** %dataBuffer1, align 8, !dbg !52
  store i8* %7, i8** %data, align 8, !dbg !53
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  %8 = load i8*, i8** %data, align 8, !dbg !54
  call void @printLine(i8* noundef %8), !dbg !55
  %9 = load i8*, i8** %data, align 8, !dbg !56
  call void @free(i8* noundef %9) #6, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_12_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !62 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataBuffer3 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !63, metadata !DIExpression()), !dbg !64
  store i8* null, i8** %data, align 8, !dbg !65
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !66
  %tobool = icmp ne i32 %call, 0, !dbg !66
  br i1 %tobool, label %if.then, label %if.else, !dbg !68

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !69, metadata !DIExpression()), !dbg !72
  %call1 = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !73
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !72
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !74
  %cmp = icmp eq i8* %0, null, !dbg !76
  br i1 %cmp, label %if.then2, label %if.end, !dbg !77

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @exit(i32 noundef 1) #7, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !82
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !85
  store i8* %3, i8** %data, align 8, !dbg !86
  br label %if.end9, !dbg !87

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer3, metadata !88, metadata !DIExpression()), !dbg !91
  %call4 = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !92
  store i8* %call4, i8** %dataBuffer3, align 8, !dbg !91
  %4 = load i8*, i8** %dataBuffer3, align 8, !dbg !93
  %cmp5 = icmp eq i8* %4, null, !dbg !95
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !96

if.then6:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @exit(i32 noundef 1) #7, !dbg !99
  unreachable, !dbg !99

if.end7:                                          ; preds = %if.else
  %5 = load i8*, i8** %dataBuffer3, align 8, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 1 %5, i8 65, i64 99, i1 false), !dbg !101
  %6 = load i8*, i8** %dataBuffer3, align 8, !dbg !102
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !102
  store i8 0, i8* %arrayidx8, align 1, !dbg !103
  %7 = load i8*, i8** %dataBuffer3, align 8, !dbg !104
  store i8* %7, i8** %data, align 8, !dbg !105
  br label %if.end9

if.end9:                                          ; preds = %if.end7, %if.end
  %8 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* noundef %8), !dbg !107
  %9 = load i8*, i8** %data, align 8, !dbg !108
  call void @free(i8* noundef %9) #6, !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_12.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "d02f2b01d917b0b56f123a45d996d82a")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_12_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !1, line: 31, type: !3)
!25 = distinct !DILexicalBlock(scope: !26, file: !1, line: 29, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !1, line: 28, column: 5)
!27 = !DILocation(line: 31, column: 20, scope: !25)
!28 = !DILocation(line: 31, column: 41, scope: !25)
!29 = !DILocation(line: 32, column: 20, scope: !25)
!30 = !DILocation(line: 32, column: 13, scope: !25)
!31 = !DILocation(line: 33, column: 13, scope: !25)
!32 = !DILocation(line: 33, column: 31, scope: !25)
!33 = !DILocation(line: 34, column: 20, scope: !25)
!34 = !DILocation(line: 34, column: 18, scope: !25)
!35 = !DILocation(line: 36, column: 5, scope: !26)
!36 = !DILocalVariable(name: "dataBuffer", scope: !37, file: !1, line: 41, type: !3)
!37 = distinct !DILexicalBlock(scope: !38, file: !1, line: 39, column: 9)
!38 = distinct !DILexicalBlock(scope: !22, file: !1, line: 38, column: 5)
!39 = !DILocation(line: 41, column: 20, scope: !37)
!40 = !DILocation(line: 41, column: 41, scope: !37)
!41 = !DILocation(line: 42, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !37, file: !1, line: 42, column: 17)
!43 = !DILocation(line: 42, column: 28, scope: !42)
!44 = !DILocation(line: 42, column: 17, scope: !37)
!45 = !DILocation(line: 44, column: 17, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !1, line: 43, column: 13)
!47 = !DILocation(line: 45, column: 17, scope: !46)
!48 = !DILocation(line: 47, column: 20, scope: !37)
!49 = !DILocation(line: 47, column: 13, scope: !37)
!50 = !DILocation(line: 48, column: 13, scope: !37)
!51 = !DILocation(line: 48, column: 31, scope: !37)
!52 = !DILocation(line: 49, column: 20, scope: !37)
!53 = !DILocation(line: 49, column: 18, scope: !37)
!54 = !DILocation(line: 52, column: 15, scope: !14)
!55 = !DILocation(line: 52, column: 5, scope: !14)
!56 = !DILocation(line: 54, column: 10, scope: !14)
!57 = !DILocation(line: 54, column: 5, scope: !14)
!58 = !DILocation(line: 55, column: 1, scope: !14)
!59 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_12_good", scope: !1, file: !1, line: 102, type: !15, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!60 = !DILocation(line: 104, column: 5, scope: !59)
!61 = !DILocation(line: 105, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 63, type: !15, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!63 = !DILocalVariable(name: "data", scope: !62, file: !1, line: 65, type: !3)
!64 = !DILocation(line: 65, column: 12, scope: !62)
!65 = !DILocation(line: 66, column: 10, scope: !62)
!66 = !DILocation(line: 67, column: 8, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !1, line: 67, column: 8)
!68 = !DILocation(line: 67, column: 8, scope: !62)
!69 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !1, line: 71, type: !3)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 69, column: 9)
!71 = distinct !DILexicalBlock(scope: !67, file: !1, line: 68, column: 5)
!72 = !DILocation(line: 71, column: 20, scope: !70)
!73 = !DILocation(line: 71, column: 41, scope: !70)
!74 = !DILocation(line: 72, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !1, line: 72, column: 17)
!76 = !DILocation(line: 72, column: 28, scope: !75)
!77 = !DILocation(line: 72, column: 17, scope: !70)
!78 = !DILocation(line: 74, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !1, line: 73, column: 13)
!80 = !DILocation(line: 75, column: 17, scope: !79)
!81 = !DILocation(line: 77, column: 20, scope: !70)
!82 = !DILocation(line: 77, column: 13, scope: !70)
!83 = !DILocation(line: 78, column: 13, scope: !70)
!84 = !DILocation(line: 78, column: 31, scope: !70)
!85 = !DILocation(line: 79, column: 20, scope: !70)
!86 = !DILocation(line: 79, column: 18, scope: !70)
!87 = !DILocation(line: 81, column: 5, scope: !71)
!88 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !1, line: 86, type: !3)
!89 = distinct !DILexicalBlock(scope: !90, file: !1, line: 84, column: 9)
!90 = distinct !DILexicalBlock(scope: !67, file: !1, line: 83, column: 5)
!91 = !DILocation(line: 86, column: 20, scope: !89)
!92 = !DILocation(line: 86, column: 41, scope: !89)
!93 = !DILocation(line: 87, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !89, file: !1, line: 87, column: 17)
!95 = !DILocation(line: 87, column: 28, scope: !94)
!96 = !DILocation(line: 87, column: 17, scope: !89)
!97 = !DILocation(line: 89, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !1, line: 88, column: 13)
!99 = !DILocation(line: 90, column: 17, scope: !98)
!100 = !DILocation(line: 92, column: 20, scope: !89)
!101 = !DILocation(line: 92, column: 13, scope: !89)
!102 = !DILocation(line: 93, column: 13, scope: !89)
!103 = !DILocation(line: 93, column: 31, scope: !89)
!104 = !DILocation(line: 94, column: 20, scope: !89)
!105 = !DILocation(line: 94, column: 18, scope: !89)
!106 = !DILocation(line: 97, column: 15, scope: !62)
!107 = !DILocation(line: 97, column: 5, scope: !62)
!108 = !DILocation(line: 99, column: 10, scope: !62)
!109 = !DILocation(line: 99, column: 5, scope: !62)
!110 = !DILocation(line: 100, column: 1, scope: !62)
