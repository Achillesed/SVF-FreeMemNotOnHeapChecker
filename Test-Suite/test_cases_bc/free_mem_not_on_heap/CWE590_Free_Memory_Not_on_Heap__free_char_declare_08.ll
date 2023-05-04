; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_08.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !31
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !34
  store i8* %arraydecay1, i8** %data, align 8, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  %0 = load i8*, i8** %data, align 8, !dbg !37
  call void @printLine(i8* noundef %0), !dbg !38
  %1 = load i8*, i8** %data, align 8, !dbg !39
  call void @free(i8* noundef %1) #6, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_08_good() #0 !dbg !42 {
entry:
  call void @goodG2B1(), !dbg !43
  call void @goodG2B2(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !46 {
entry:
  ret i32 1, !dbg !50
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !51 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !52, metadata !DIExpression()), !dbg !53
  store i8* null, i8** %data, align 8, !dbg !54
  %call = call i32 @staticReturnsFalse(), !dbg !55
  %tobool = icmp ne i32 %call, 0, !dbg !55
  br i1 %tobool, label %if.then, label %if.else, !dbg !57

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !58
  br label %if.end3, !dbg !60

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !61, metadata !DIExpression()), !dbg !64
  %call1 = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !65
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !64
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !66
  %cmp = icmp eq i8* %0, null, !dbg !68
  br i1 %cmp, label %if.then2, label %if.end, !dbg !69

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @exit(i32 noundef 1) #7, !dbg !72
  unreachable, !dbg !72

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !74
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !75
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !75
  store i8 0, i8* %arrayidx, align 1, !dbg !76
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !77
  store i8* %3, i8** %data, align 8, !dbg !78
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %4 = load i8*, i8** %data, align 8, !dbg !79
  call void @printLine(i8* noundef %4), !dbg !80
  %5 = load i8*, i8** %data, align 8, !dbg !81
  call void @free(i8* noundef %5) #6, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !84 {
entry:
  ret i32 0, !dbg !85
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i8* null, i8** %data, align 8, !dbg !89
  %call = call i32 @staticReturnsTrue(), !dbg !90
  %tobool = icmp ne i32 %call, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.end3, !dbg !92

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !96
  %call1 = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !97
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !96
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !98
  %cmp = icmp eq i8* %0, null, !dbg !100
  br i1 %cmp, label %if.then2, label %if.end, !dbg !101

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @exit(i32 noundef 1) #7, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !106
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !109
  store i8* %3, i8** %data, align 8, !dbg !110
  br label %if.end3, !dbg !111

if.end3:                                          ; preds = %if.end, %entry
  %4 = load i8*, i8** %data, align 8, !dbg !112
  call void @printLine(i8* noundef %4), !dbg !113
  %5 = load i8*, i8** %data, align 8, !dbg !114
  call void @free(i8* noundef %5) #6, !dbg !115
  ret void, !dbg !116
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_08.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "f9fdad25e47b7ab0d41ad5e8091c4732")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_08_bad", scope: !1, file: !1, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 39, type: !3)
!19 = !DILocation(line: 39, column: 12, scope: !14)
!20 = !DILocation(line: 40, column: 10, scope: !14)
!21 = !DILocation(line: 41, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 41, column: 8)
!23 = !DILocation(line: 41, column: 8, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !1, line: 45, type: !27)
!25 = distinct !DILexicalBlock(scope: !26, file: !1, line: 43, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !1, line: 42, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 45, column: 18, scope: !25)
!31 = !DILocation(line: 46, column: 13, scope: !25)
!32 = !DILocation(line: 47, column: 13, scope: !25)
!33 = !DILocation(line: 47, column: 31, scope: !25)
!34 = !DILocation(line: 48, column: 20, scope: !25)
!35 = !DILocation(line: 48, column: 18, scope: !25)
!36 = !DILocation(line: 50, column: 5, scope: !26)
!37 = !DILocation(line: 51, column: 15, scope: !14)
!38 = !DILocation(line: 51, column: 5, scope: !14)
!39 = !DILocation(line: 53, column: 10, scope: !14)
!40 = !DILocation(line: 53, column: 5, scope: !14)
!41 = !DILocation(line: 54, column: 1, scope: !14)
!42 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_08_good", scope: !1, file: !1, line: 115, type: !15, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!43 = !DILocation(line: 117, column: 5, scope: !42)
!44 = !DILocation(line: 118, column: 5, scope: !42)
!45 = !DILocation(line: 119, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !1, file: !1, line: 25, type: !47, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!47 = !DISubroutineType(types: !48)
!48 = !{!49}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DILocation(line: 27, column: 5, scope: !46)
!51 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 61, type: !15, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!52 = !DILocalVariable(name: "data", scope: !51, file: !1, line: 63, type: !3)
!53 = !DILocation(line: 63, column: 12, scope: !51)
!54 = !DILocation(line: 64, column: 10, scope: !51)
!55 = !DILocation(line: 65, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !1, line: 65, column: 8)
!57 = !DILocation(line: 65, column: 8, scope: !51)
!58 = !DILocation(line: 68, column: 9, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !1, line: 66, column: 5)
!60 = !DILocation(line: 69, column: 5, scope: !59)
!61 = !DILocalVariable(name: "dataBuffer", scope: !62, file: !1, line: 74, type: !3)
!62 = distinct !DILexicalBlock(scope: !63, file: !1, line: 72, column: 9)
!63 = distinct !DILexicalBlock(scope: !56, file: !1, line: 71, column: 5)
!64 = !DILocation(line: 74, column: 20, scope: !62)
!65 = !DILocation(line: 74, column: 41, scope: !62)
!66 = !DILocation(line: 75, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !1, line: 75, column: 17)
!68 = !DILocation(line: 75, column: 28, scope: !67)
!69 = !DILocation(line: 75, column: 17, scope: !62)
!70 = !DILocation(line: 77, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !1, line: 76, column: 13)
!72 = !DILocation(line: 78, column: 17, scope: !71)
!73 = !DILocation(line: 80, column: 20, scope: !62)
!74 = !DILocation(line: 80, column: 13, scope: !62)
!75 = !DILocation(line: 81, column: 13, scope: !62)
!76 = !DILocation(line: 81, column: 31, scope: !62)
!77 = !DILocation(line: 82, column: 20, scope: !62)
!78 = !DILocation(line: 82, column: 18, scope: !62)
!79 = !DILocation(line: 85, column: 15, scope: !51)
!80 = !DILocation(line: 85, column: 5, scope: !51)
!81 = !DILocation(line: 87, column: 10, scope: !51)
!82 = !DILocation(line: 87, column: 5, scope: !51)
!83 = !DILocation(line: 88, column: 1, scope: !51)
!84 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !1, file: !1, line: 30, type: !47, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!85 = !DILocation(line: 32, column: 5, scope: !84)
!86 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!87 = !DILocalVariable(name: "data", scope: !86, file: !1, line: 93, type: !3)
!88 = !DILocation(line: 93, column: 12, scope: !86)
!89 = !DILocation(line: 94, column: 10, scope: !86)
!90 = !DILocation(line: 95, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !1, line: 95, column: 8)
!92 = !DILocation(line: 95, column: 8, scope: !86)
!93 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !1, line: 99, type: !3)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 97, column: 9)
!95 = distinct !DILexicalBlock(scope: !91, file: !1, line: 96, column: 5)
!96 = !DILocation(line: 99, column: 20, scope: !94)
!97 = !DILocation(line: 99, column: 41, scope: !94)
!98 = !DILocation(line: 100, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !1, line: 100, column: 17)
!100 = !DILocation(line: 100, column: 28, scope: !99)
!101 = !DILocation(line: 100, column: 17, scope: !94)
!102 = !DILocation(line: 102, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !1, line: 101, column: 13)
!104 = !DILocation(line: 103, column: 17, scope: !103)
!105 = !DILocation(line: 105, column: 20, scope: !94)
!106 = !DILocation(line: 105, column: 13, scope: !94)
!107 = !DILocation(line: 106, column: 13, scope: !94)
!108 = !DILocation(line: 106, column: 31, scope: !94)
!109 = !DILocation(line: 107, column: 20, scope: !94)
!110 = !DILocation(line: 107, column: 18, scope: !94)
!111 = !DILocation(line: 109, column: 5, scope: !95)
!112 = !DILocation(line: 110, column: 15, scope: !86)
!113 = !DILocation(line: 110, column: 5, scope: !86)
!114 = !DILocation(line: 112, column: 10, scope: !86)
!115 = !DILocation(line: 112, column: 5, scope: !86)
!116 = !DILocation(line: 113, column: 1, scope: !86)
