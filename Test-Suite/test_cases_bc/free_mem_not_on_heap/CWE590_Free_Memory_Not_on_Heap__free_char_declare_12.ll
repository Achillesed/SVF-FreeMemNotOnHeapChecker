; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_12.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dataBuffer2 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !31
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !34
  store i8* %arraydecay1, i8** %data, align 8, !dbg !35
  br label %if.end6, !dbg !36

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer2, metadata !37, metadata !DIExpression()), !dbg !40
  %call3 = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !41
  store i8* %call3, i8** %dataBuffer2, align 8, !dbg !40
  %0 = load i8*, i8** %dataBuffer2, align 8, !dbg !42
  %cmp = icmp eq i8* %0, null, !dbg !44
  br i1 %cmp, label %if.then4, label %if.end, !dbg !45

if.then4:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !46
  call void @exit(i32 noundef 1) #7, !dbg !48
  unreachable, !dbg !48

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %dataBuffer2, align 8, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !50
  %2 = load i8*, i8** %dataBuffer2, align 8, !dbg !51
  %arrayidx5 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !51
  store i8 0, i8* %arrayidx5, align 1, !dbg !52
  %3 = load i8*, i8** %dataBuffer2, align 8, !dbg !53
  store i8* %3, i8** %data, align 8, !dbg !54
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then
  %4 = load i8*, i8** %data, align 8, !dbg !55
  call void @printLine(i8* noundef %4), !dbg !56
  %5 = load i8*, i8** %data, align 8, !dbg !57
  call void @free(i8* noundef %5) #6, !dbg !58
  ret void, !dbg !59
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_12_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !63 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataBuffer3 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !64, metadata !DIExpression()), !dbg !65
  store i8* null, i8** %data, align 8, !dbg !66
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !67
  %tobool = icmp ne i32 %call, 0, !dbg !67
  br i1 %tobool, label %if.then, label %if.else, !dbg !69

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !73
  %call1 = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !74
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !73
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !75
  %cmp = icmp eq i8* %0, null, !dbg !77
  br i1 %cmp, label %if.then2, label %if.end, !dbg !78

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @exit(i32 noundef 1) #7, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !83
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !86
  store i8* %3, i8** %data, align 8, !dbg !87
  br label %if.end9, !dbg !88

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer3, metadata !89, metadata !DIExpression()), !dbg !92
  %call4 = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !93
  store i8* %call4, i8** %dataBuffer3, align 8, !dbg !92
  %4 = load i8*, i8** %dataBuffer3, align 8, !dbg !94
  %cmp5 = icmp eq i8* %4, null, !dbg !96
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !97

if.then6:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @exit(i32 noundef 1) #7, !dbg !100
  unreachable, !dbg !100

if.end7:                                          ; preds = %if.else
  %5 = load i8*, i8** %dataBuffer3, align 8, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 1 %5, i8 65, i64 99, i1 false), !dbg !102
  %6 = load i8*, i8** %dataBuffer3, align 8, !dbg !103
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !103
  store i8 0, i8* %arrayidx8, align 1, !dbg !104
  %7 = load i8*, i8** %dataBuffer3, align 8, !dbg !105
  store i8* %7, i8** %data, align 8, !dbg !106
  br label %if.end9

if.end9:                                          ; preds = %if.end7, %if.end
  %8 = load i8*, i8** %data, align 8, !dbg !107
  call void @printLine(i8* noundef %8), !dbg !108
  %9 = load i8*, i8** %data, align 8, !dbg !109
  call void @free(i8* noundef %9) #6, !dbg !110
  ret void, !dbg !111
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_12.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "d601bbfe63780cfe96f420aa7be6d9ff")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_12_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !1, line: 31, type: !27)
!25 = distinct !DILexicalBlock(scope: !26, file: !1, line: 29, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !1, line: 28, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 31, column: 18, scope: !25)
!31 = !DILocation(line: 32, column: 13, scope: !25)
!32 = !DILocation(line: 33, column: 13, scope: !25)
!33 = !DILocation(line: 33, column: 31, scope: !25)
!34 = !DILocation(line: 34, column: 20, scope: !25)
!35 = !DILocation(line: 34, column: 18, scope: !25)
!36 = !DILocation(line: 36, column: 5, scope: !26)
!37 = !DILocalVariable(name: "dataBuffer", scope: !38, file: !1, line: 41, type: !3)
!38 = distinct !DILexicalBlock(scope: !39, file: !1, line: 39, column: 9)
!39 = distinct !DILexicalBlock(scope: !22, file: !1, line: 38, column: 5)
!40 = !DILocation(line: 41, column: 20, scope: !38)
!41 = !DILocation(line: 41, column: 41, scope: !38)
!42 = !DILocation(line: 42, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !38, file: !1, line: 42, column: 17)
!44 = !DILocation(line: 42, column: 28, scope: !43)
!45 = !DILocation(line: 42, column: 17, scope: !38)
!46 = !DILocation(line: 44, column: 17, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !1, line: 43, column: 13)
!48 = !DILocation(line: 45, column: 17, scope: !47)
!49 = !DILocation(line: 47, column: 20, scope: !38)
!50 = !DILocation(line: 47, column: 13, scope: !38)
!51 = !DILocation(line: 48, column: 13, scope: !38)
!52 = !DILocation(line: 48, column: 31, scope: !38)
!53 = !DILocation(line: 49, column: 20, scope: !38)
!54 = !DILocation(line: 49, column: 18, scope: !38)
!55 = !DILocation(line: 52, column: 15, scope: !14)
!56 = !DILocation(line: 52, column: 5, scope: !14)
!57 = !DILocation(line: 54, column: 10, scope: !14)
!58 = !DILocation(line: 54, column: 5, scope: !14)
!59 = !DILocation(line: 55, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_12_good", scope: !1, file: !1, line: 102, type: !15, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!61 = !DILocation(line: 104, column: 5, scope: !60)
!62 = !DILocation(line: 105, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 63, type: !15, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!64 = !DILocalVariable(name: "data", scope: !63, file: !1, line: 65, type: !3)
!65 = !DILocation(line: 65, column: 12, scope: !63)
!66 = !DILocation(line: 66, column: 10, scope: !63)
!67 = !DILocation(line: 67, column: 8, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !1, line: 67, column: 8)
!69 = !DILocation(line: 67, column: 8, scope: !63)
!70 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !1, line: 71, type: !3)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 69, column: 9)
!72 = distinct !DILexicalBlock(scope: !68, file: !1, line: 68, column: 5)
!73 = !DILocation(line: 71, column: 20, scope: !71)
!74 = !DILocation(line: 71, column: 41, scope: !71)
!75 = !DILocation(line: 72, column: 17, scope: !76)
!76 = distinct !DILexicalBlock(scope: !71, file: !1, line: 72, column: 17)
!77 = !DILocation(line: 72, column: 28, scope: !76)
!78 = !DILocation(line: 72, column: 17, scope: !71)
!79 = !DILocation(line: 74, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !1, line: 73, column: 13)
!81 = !DILocation(line: 75, column: 17, scope: !80)
!82 = !DILocation(line: 77, column: 20, scope: !71)
!83 = !DILocation(line: 77, column: 13, scope: !71)
!84 = !DILocation(line: 78, column: 13, scope: !71)
!85 = !DILocation(line: 78, column: 31, scope: !71)
!86 = !DILocation(line: 79, column: 20, scope: !71)
!87 = !DILocation(line: 79, column: 18, scope: !71)
!88 = !DILocation(line: 81, column: 5, scope: !72)
!89 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !1, line: 86, type: !3)
!90 = distinct !DILexicalBlock(scope: !91, file: !1, line: 84, column: 9)
!91 = distinct !DILexicalBlock(scope: !68, file: !1, line: 83, column: 5)
!92 = !DILocation(line: 86, column: 20, scope: !90)
!93 = !DILocation(line: 86, column: 41, scope: !90)
!94 = !DILocation(line: 87, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !1, line: 87, column: 17)
!96 = !DILocation(line: 87, column: 28, scope: !95)
!97 = !DILocation(line: 87, column: 17, scope: !90)
!98 = !DILocation(line: 89, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !1, line: 88, column: 13)
!100 = !DILocation(line: 90, column: 17, scope: !99)
!101 = !DILocation(line: 92, column: 20, scope: !90)
!102 = !DILocation(line: 92, column: 13, scope: !90)
!103 = !DILocation(line: 93, column: 13, scope: !90)
!104 = !DILocation(line: 93, column: 31, scope: !90)
!105 = !DILocation(line: 94, column: 20, scope: !90)
!106 = !DILocation(line: 94, column: 18, scope: !90)
!107 = !DILocation(line: 97, column: 15, scope: !63)
!108 = !DILocation(line: 97, column: 5, scope: !63)
!109 = !DILocation(line: 99, column: 10, scope: !63)
!110 = !DILocation(line: 99, column: 5, scope: !63)
!111 = !DILocation(line: 100, column: 1, scope: !63)
