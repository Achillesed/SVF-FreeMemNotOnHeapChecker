; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_static_12.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_static_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_char_static_12_bad.dataBuffer = internal global [100 x i8] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_12_bad() #0 !dbg !2 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.memset.p0i8.i64(i8* align 16 getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_12_bad.dataBuffer, i64 0, i64 0), i8 65, i64 99, i1 false), !dbg !30
  store i8 0, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_12_bad.dataBuffer, i64 0, i64 99), align 1, !dbg !33
  store i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_12_bad.dataBuffer, i64 0, i64 0), i8** %data, align 8, !dbg !34
  br label %if.end3, !dbg !35

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !36, metadata !DIExpression()), !dbg !39
  %call1 = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !40
  store i8* %call1, i8** %dataBuffer, align 8, !dbg !39
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !41
  %cmp = icmp eq i8* %0, null, !dbg !43
  br i1 %cmp, label %if.then2, label %if.end, !dbg !44

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !45
  call void @exit(i32 noundef 1) #7, !dbg !47
  unreachable, !dbg !47

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !49
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !50
  store i8 0, i8* %arrayidx, align 1, !dbg !51
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !52
  store i8* %3, i8** %data, align 8, !dbg !53
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %4 = load i8*, i8** %data, align 8, !dbg !54
  call void @printLine(i8* noundef %4), !dbg !55
  %5 = load i8*, i8** %data, align 8, !dbg !56
  call void @free(i8* noundef %5) #6, !dbg !57
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_12_good() #0 !dbg !59 {
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

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 31, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_12_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_static_12.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "771f6631bf9985db2afabb06947ac61c")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0}
!12 = !{}
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 800, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 100)
!16 = !{i32 7, !"Dwarf Version", i32 5}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"PIE Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 25, type: !8)
!25 = !DILocation(line: 25, column: 12, scope: !2)
!26 = !DILocation(line: 26, column: 10, scope: !2)
!27 = !DILocation(line: 27, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !2, file: !3, line: 27, column: 8)
!29 = !DILocation(line: 27, column: 8, scope: !2)
!30 = !DILocation(line: 32, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !3, line: 29, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !3, line: 28, column: 5)
!33 = !DILocation(line: 33, column: 31, scope: !31)
!34 = !DILocation(line: 34, column: 18, scope: !31)
!35 = !DILocation(line: 36, column: 5, scope: !32)
!36 = !DILocalVariable(name: "dataBuffer", scope: !37, file: !3, line: 41, type: !8)
!37 = distinct !DILexicalBlock(scope: !38, file: !3, line: 39, column: 9)
!38 = distinct !DILexicalBlock(scope: !28, file: !3, line: 38, column: 5)
!39 = !DILocation(line: 41, column: 20, scope: !37)
!40 = !DILocation(line: 41, column: 41, scope: !37)
!41 = !DILocation(line: 42, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !37, file: !3, line: 42, column: 17)
!43 = !DILocation(line: 42, column: 28, scope: !42)
!44 = !DILocation(line: 42, column: 17, scope: !37)
!45 = !DILocation(line: 44, column: 17, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !3, line: 43, column: 13)
!47 = !DILocation(line: 45, column: 17, scope: !46)
!48 = !DILocation(line: 47, column: 20, scope: !37)
!49 = !DILocation(line: 47, column: 13, scope: !37)
!50 = !DILocation(line: 48, column: 13, scope: !37)
!51 = !DILocation(line: 48, column: 31, scope: !37)
!52 = !DILocation(line: 49, column: 20, scope: !37)
!53 = !DILocation(line: 49, column: 18, scope: !37)
!54 = !DILocation(line: 52, column: 15, scope: !2)
!55 = !DILocation(line: 52, column: 5, scope: !2)
!56 = !DILocation(line: 54, column: 10, scope: !2)
!57 = !DILocation(line: 54, column: 5, scope: !2)
!58 = !DILocation(line: 55, column: 1, scope: !2)
!59 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_12_good", scope: !3, file: !3, line: 102, type: !4, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!60 = !DILocation(line: 104, column: 5, scope: !59)
!61 = !DILocation(line: 105, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 63, type: !4, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!63 = !DILocalVariable(name: "data", scope: !62, file: !3, line: 65, type: !8)
!64 = !DILocation(line: 65, column: 12, scope: !62)
!65 = !DILocation(line: 66, column: 10, scope: !62)
!66 = !DILocation(line: 67, column: 8, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !3, line: 67, column: 8)
!68 = !DILocation(line: 67, column: 8, scope: !62)
!69 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !3, line: 71, type: !8)
!70 = distinct !DILexicalBlock(scope: !71, file: !3, line: 69, column: 9)
!71 = distinct !DILexicalBlock(scope: !67, file: !3, line: 68, column: 5)
!72 = !DILocation(line: 71, column: 20, scope: !70)
!73 = !DILocation(line: 71, column: 41, scope: !70)
!74 = !DILocation(line: 72, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !3, line: 72, column: 17)
!76 = !DILocation(line: 72, column: 28, scope: !75)
!77 = !DILocation(line: 72, column: 17, scope: !70)
!78 = !DILocation(line: 74, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !3, line: 73, column: 13)
!80 = !DILocation(line: 75, column: 17, scope: !79)
!81 = !DILocation(line: 77, column: 20, scope: !70)
!82 = !DILocation(line: 77, column: 13, scope: !70)
!83 = !DILocation(line: 78, column: 13, scope: !70)
!84 = !DILocation(line: 78, column: 31, scope: !70)
!85 = !DILocation(line: 79, column: 20, scope: !70)
!86 = !DILocation(line: 79, column: 18, scope: !70)
!87 = !DILocation(line: 81, column: 5, scope: !71)
!88 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !3, line: 86, type: !8)
!89 = distinct !DILexicalBlock(scope: !90, file: !3, line: 84, column: 9)
!90 = distinct !DILexicalBlock(scope: !67, file: !3, line: 83, column: 5)
!91 = !DILocation(line: 86, column: 20, scope: !89)
!92 = !DILocation(line: 86, column: 41, scope: !89)
!93 = !DILocation(line: 87, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !89, file: !3, line: 87, column: 17)
!95 = !DILocation(line: 87, column: 28, scope: !94)
!96 = !DILocation(line: 87, column: 17, scope: !89)
!97 = !DILocation(line: 89, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !3, line: 88, column: 13)
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
