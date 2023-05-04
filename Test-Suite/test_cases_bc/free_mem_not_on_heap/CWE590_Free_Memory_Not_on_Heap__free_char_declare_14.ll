; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_14.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_14_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalFive, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end, !dbg !24

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !32
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !35
  store i8* %arraydecay1, i8** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8*, i8** %data, align 8, !dbg !38
  call void @printLine(i8* noundef %1), !dbg !39
  %2 = load i8*, i8** %data, align 8, !dbg !40
  call void @free(i8* noundef %2) #6, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_14_good() #0 !dbg !43 {
entry:
  call void @goodG2B1(), !dbg !44
  call void @goodG2B2(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !47 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !48, metadata !DIExpression()), !dbg !49
  store i8* null, i8** %data, align 8, !dbg !50
  %0 = load i32, i32* @globalFive, align 4, !dbg !51
  %cmp = icmp ne i32 %0, 5, !dbg !53
  br i1 %cmp, label %if.then, label %if.else, !dbg !54

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !55
  br label %if.end3, !dbg !57

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !58, metadata !DIExpression()), !dbg !61
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !62
  store i8* %call, i8** %dataBuffer, align 8, !dbg !61
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !63
  %cmp1 = icmp eq i8* %1, null, !dbg !65
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !66

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @exit(i32 noundef 1) #7, !dbg !69
  unreachable, !dbg !69

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !71
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !72
  store i8 0, i8* %arrayidx, align 1, !dbg !73
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !74
  store i8* %4, i8** %data, align 8, !dbg !75
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %5 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* noundef %5), !dbg !77
  %6 = load i8*, i8** %data, align 8, !dbg !78
  call void @free(i8* noundef %6) #6, !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i8* null, i8** %data, align 8, !dbg !84
  %0 = load i32, i32* @globalFive, align 4, !dbg !85
  %cmp = icmp eq i32 %0, 5, !dbg !87
  br i1 %cmp, label %if.then, label %if.end3, !dbg !88

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !89, metadata !DIExpression()), !dbg !92
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !93
  store i8* %call, i8** %dataBuffer, align 8, !dbg !92
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !94
  %cmp1 = icmp eq i8* %1, null, !dbg !96
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !97

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @exit(i32 noundef 1) #7, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !102
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !105
  store i8* %4, i8** %data, align 8, !dbg !106
  br label %if.end3, !dbg !107

if.end3:                                          ; preds = %if.end, %entry
  %5 = load i8*, i8** %data, align 8, !dbg !108
  call void @printLine(i8* noundef %5), !dbg !109
  %6 = load i8*, i8** %data, align 8, !dbg !110
  call void @free(i8* noundef %6) #6, !dbg !111
  ret void, !dbg !112
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_14.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "9d245f6e8856e0269ccb6835df0323b4")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_14_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 18, scope: !22)
!24 = !DILocation(line: 27, column: 8, scope: !14)
!25 = !DILocalVariable(name: "dataBuffer", scope: !26, file: !1, line: 31, type: !28)
!26 = distinct !DILexicalBlock(scope: !27, file: !1, line: 29, column: 9)
!27 = distinct !DILexicalBlock(scope: !22, file: !1, line: 28, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 31, column: 18, scope: !26)
!32 = !DILocation(line: 32, column: 13, scope: !26)
!33 = !DILocation(line: 33, column: 13, scope: !26)
!34 = !DILocation(line: 33, column: 31, scope: !26)
!35 = !DILocation(line: 34, column: 20, scope: !26)
!36 = !DILocation(line: 34, column: 18, scope: !26)
!37 = !DILocation(line: 36, column: 5, scope: !27)
!38 = !DILocation(line: 37, column: 15, scope: !14)
!39 = !DILocation(line: 37, column: 5, scope: !14)
!40 = !DILocation(line: 39, column: 10, scope: !14)
!41 = !DILocation(line: 39, column: 5, scope: !14)
!42 = !DILocation(line: 40, column: 1, scope: !14)
!43 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_14_good", scope: !1, file: !1, line: 101, type: !15, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!44 = !DILocation(line: 103, column: 5, scope: !43)
!45 = !DILocation(line: 104, column: 5, scope: !43)
!46 = !DILocation(line: 105, column: 1, scope: !43)
!47 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 47, type: !15, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!48 = !DILocalVariable(name: "data", scope: !47, file: !1, line: 49, type: !3)
!49 = !DILocation(line: 49, column: 12, scope: !47)
!50 = !DILocation(line: 50, column: 10, scope: !47)
!51 = !DILocation(line: 51, column: 8, scope: !52)
!52 = distinct !DILexicalBlock(scope: !47, file: !1, line: 51, column: 8)
!53 = !DILocation(line: 51, column: 18, scope: !52)
!54 = !DILocation(line: 51, column: 8, scope: !47)
!55 = !DILocation(line: 54, column: 9, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !1, line: 52, column: 5)
!57 = !DILocation(line: 55, column: 5, scope: !56)
!58 = !DILocalVariable(name: "dataBuffer", scope: !59, file: !1, line: 60, type: !3)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 58, column: 9)
!60 = distinct !DILexicalBlock(scope: !52, file: !1, line: 57, column: 5)
!61 = !DILocation(line: 60, column: 20, scope: !59)
!62 = !DILocation(line: 60, column: 41, scope: !59)
!63 = !DILocation(line: 61, column: 17, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !1, line: 61, column: 17)
!65 = !DILocation(line: 61, column: 28, scope: !64)
!66 = !DILocation(line: 61, column: 17, scope: !59)
!67 = !DILocation(line: 63, column: 17, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !1, line: 62, column: 13)
!69 = !DILocation(line: 64, column: 17, scope: !68)
!70 = !DILocation(line: 66, column: 20, scope: !59)
!71 = !DILocation(line: 66, column: 13, scope: !59)
!72 = !DILocation(line: 67, column: 13, scope: !59)
!73 = !DILocation(line: 67, column: 31, scope: !59)
!74 = !DILocation(line: 68, column: 20, scope: !59)
!75 = !DILocation(line: 68, column: 18, scope: !59)
!76 = !DILocation(line: 71, column: 15, scope: !47)
!77 = !DILocation(line: 71, column: 5, scope: !47)
!78 = !DILocation(line: 73, column: 10, scope: !47)
!79 = !DILocation(line: 73, column: 5, scope: !47)
!80 = !DILocation(line: 74, column: 1, scope: !47)
!81 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 77, type: !15, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!82 = !DILocalVariable(name: "data", scope: !81, file: !1, line: 79, type: !3)
!83 = !DILocation(line: 79, column: 12, scope: !81)
!84 = !DILocation(line: 80, column: 10, scope: !81)
!85 = !DILocation(line: 81, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !1, line: 81, column: 8)
!87 = !DILocation(line: 81, column: 18, scope: !86)
!88 = !DILocation(line: 81, column: 8, scope: !81)
!89 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !1, line: 85, type: !3)
!90 = distinct !DILexicalBlock(scope: !91, file: !1, line: 83, column: 9)
!91 = distinct !DILexicalBlock(scope: !86, file: !1, line: 82, column: 5)
!92 = !DILocation(line: 85, column: 20, scope: !90)
!93 = !DILocation(line: 85, column: 41, scope: !90)
!94 = !DILocation(line: 86, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !1, line: 86, column: 17)
!96 = !DILocation(line: 86, column: 28, scope: !95)
!97 = !DILocation(line: 86, column: 17, scope: !90)
!98 = !DILocation(line: 88, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !1, line: 87, column: 13)
!100 = !DILocation(line: 89, column: 17, scope: !99)
!101 = !DILocation(line: 91, column: 20, scope: !90)
!102 = !DILocation(line: 91, column: 13, scope: !90)
!103 = !DILocation(line: 92, column: 13, scope: !90)
!104 = !DILocation(line: 92, column: 31, scope: !90)
!105 = !DILocation(line: 93, column: 20, scope: !90)
!106 = !DILocation(line: 93, column: 18, scope: !90)
!107 = !DILocation(line: 95, column: 5, scope: !91)
!108 = !DILocation(line: 96, column: 15, scope: !81)
!109 = !DILocation(line: 96, column: 5, scope: !81)
!110 = !DILocation(line: 98, column: 10, scope: !81)
!111 = !DILocation(line: 98, column: 5, scope: !81)
!112 = !DILocation(line: 99, column: 1, scope: !81)
