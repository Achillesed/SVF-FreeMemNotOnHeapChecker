; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_10.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@globalTrue = external global i32, align 4
@globalFalse = external global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_10_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalTrue, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !27
  %1 = alloca i8, i64 100, align 16, !dbg !28
  store i8* %1, i8** %dataBuffer, align 8, !dbg !27
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !30
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  store i8* %4, i8** %data, align 8, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  %5 = load i8*, i8** %data, align 8, !dbg !36
  call void @printLine(i8* noundef %5), !dbg !37
  %6 = load i8*, i8** %data, align 8, !dbg !38
  call void @free(i8* noundef %6) #6, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_10_good() #0 !dbg !41 {
entry:
  call void @goodG2B1(), !dbg !42
  call void @goodG2B2(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !45 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !46, metadata !DIExpression()), !dbg !47
  store i8* null, i8** %data, align 8, !dbg !48
  %0 = load i32, i32* @globalFalse, align 4, !dbg !49
  %tobool = icmp ne i32 %0, 0, !dbg !49
  br i1 %tobool, label %if.then, label %if.else, !dbg !51

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !52
  br label %if.end2, !dbg !54

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !55, metadata !DIExpression()), !dbg !58
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !59
  store i8* %call, i8** %dataBuffer, align 8, !dbg !58
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !60
  %cmp = icmp eq i8* %1, null, !dbg !62
  br i1 %cmp, label %if.then1, label %if.end, !dbg !63

if.then1:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @exit(i32 noundef 1) #7, !dbg !66
  unreachable, !dbg !66

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !67
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !68
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !69
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !69
  store i8 0, i8* %arrayidx, align 1, !dbg !70
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !71
  store i8* %4, i8** %data, align 8, !dbg !72
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %5 = load i8*, i8** %data, align 8, !dbg !73
  call void @printLine(i8* noundef %5), !dbg !74
  %6 = load i8*, i8** %data, align 8, !dbg !75
  call void @free(i8* noundef %6) #6, !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i8* null, i8** %data, align 8, !dbg !81
  %0 = load i32, i32* @globalTrue, align 4, !dbg !82
  %tobool = icmp ne i32 %0, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.end2, !dbg !84

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !88
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !89
  store i8* %call, i8** %dataBuffer, align 8, !dbg !88
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !90
  %cmp = icmp eq i8* %1, null, !dbg !92
  br i1 %cmp, label %if.then1, label %if.end, !dbg !93

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @exit(i32 noundef 1) #7, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !98
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !101
  store i8* %4, i8** %data, align 8, !dbg !102
  br label %if.end2, !dbg !103

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data, align 8, !dbg !104
  call void @printLine(i8* noundef %5), !dbg !105
  %6 = load i8*, i8** %data, align 8, !dbg !106
  call void @free(i8* noundef %6) #6, !dbg !107
  ret void, !dbg !108
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_10.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "626fc1f23992f5344d5023052d8ab2b1")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_10_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
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
!36 = !DILocation(line: 37, column: 15, scope: !14)
!37 = !DILocation(line: 37, column: 5, scope: !14)
!38 = !DILocation(line: 39, column: 10, scope: !14)
!39 = !DILocation(line: 39, column: 5, scope: !14)
!40 = !DILocation(line: 40, column: 1, scope: !14)
!41 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_10_good", scope: !1, file: !1, line: 101, type: !15, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!42 = !DILocation(line: 103, column: 5, scope: !41)
!43 = !DILocation(line: 104, column: 5, scope: !41)
!44 = !DILocation(line: 105, column: 1, scope: !41)
!45 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 47, type: !15, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!46 = !DILocalVariable(name: "data", scope: !45, file: !1, line: 49, type: !3)
!47 = !DILocation(line: 49, column: 12, scope: !45)
!48 = !DILocation(line: 50, column: 10, scope: !45)
!49 = !DILocation(line: 51, column: 8, scope: !50)
!50 = distinct !DILexicalBlock(scope: !45, file: !1, line: 51, column: 8)
!51 = !DILocation(line: 51, column: 8, scope: !45)
!52 = !DILocation(line: 54, column: 9, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !1, line: 52, column: 5)
!54 = !DILocation(line: 55, column: 5, scope: !53)
!55 = !DILocalVariable(name: "dataBuffer", scope: !56, file: !1, line: 60, type: !3)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 58, column: 9)
!57 = distinct !DILexicalBlock(scope: !50, file: !1, line: 57, column: 5)
!58 = !DILocation(line: 60, column: 20, scope: !56)
!59 = !DILocation(line: 60, column: 41, scope: !56)
!60 = !DILocation(line: 61, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !56, file: !1, line: 61, column: 17)
!62 = !DILocation(line: 61, column: 28, scope: !61)
!63 = !DILocation(line: 61, column: 17, scope: !56)
!64 = !DILocation(line: 63, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !1, line: 62, column: 13)
!66 = !DILocation(line: 64, column: 17, scope: !65)
!67 = !DILocation(line: 66, column: 20, scope: !56)
!68 = !DILocation(line: 66, column: 13, scope: !56)
!69 = !DILocation(line: 67, column: 13, scope: !56)
!70 = !DILocation(line: 67, column: 31, scope: !56)
!71 = !DILocation(line: 68, column: 20, scope: !56)
!72 = !DILocation(line: 68, column: 18, scope: !56)
!73 = !DILocation(line: 71, column: 15, scope: !45)
!74 = !DILocation(line: 71, column: 5, scope: !45)
!75 = !DILocation(line: 73, column: 10, scope: !45)
!76 = !DILocation(line: 73, column: 5, scope: !45)
!77 = !DILocation(line: 74, column: 1, scope: !45)
!78 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 77, type: !15, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!79 = !DILocalVariable(name: "data", scope: !78, file: !1, line: 79, type: !3)
!80 = !DILocation(line: 79, column: 12, scope: !78)
!81 = !DILocation(line: 80, column: 10, scope: !78)
!82 = !DILocation(line: 81, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !1, line: 81, column: 8)
!84 = !DILocation(line: 81, column: 8, scope: !78)
!85 = !DILocalVariable(name: "dataBuffer", scope: !86, file: !1, line: 85, type: !3)
!86 = distinct !DILexicalBlock(scope: !87, file: !1, line: 83, column: 9)
!87 = distinct !DILexicalBlock(scope: !83, file: !1, line: 82, column: 5)
!88 = !DILocation(line: 85, column: 20, scope: !86)
!89 = !DILocation(line: 85, column: 41, scope: !86)
!90 = !DILocation(line: 86, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !1, line: 86, column: 17)
!92 = !DILocation(line: 86, column: 28, scope: !91)
!93 = !DILocation(line: 86, column: 17, scope: !86)
!94 = !DILocation(line: 88, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !1, line: 87, column: 13)
!96 = !DILocation(line: 89, column: 17, scope: !95)
!97 = !DILocation(line: 91, column: 20, scope: !86)
!98 = !DILocation(line: 91, column: 13, scope: !86)
!99 = !DILocation(line: 92, column: 13, scope: !86)
!100 = !DILocation(line: 92, column: 31, scope: !86)
!101 = !DILocation(line: 93, column: 20, scope: !86)
!102 = !DILocation(line: 93, column: 18, scope: !86)
!103 = !DILocation(line: 95, column: 5, scope: !87)
!104 = !DILocation(line: 96, column: 15, scope: !78)
!105 = !DILocation(line: 96, column: 5, scope: !78)
!106 = !DILocation(line: 98, column: 10, scope: !78)
!107 = !DILocation(line: 98, column: 5, scope: !78)
!108 = !DILocation(line: 99, column: 1, scope: !78)
