; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_static_04.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_static_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_char_static_04_bad.dataBuffer = internal global [100 x i8] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_04_bad() #0 !dbg !2 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_04_bad.dataBuffer, i64 0, i64 0), i8 65, i64 99, i1 false), !dbg !27
  store i8 0, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_04_bad.dataBuffer, i64 0, i64 99), align 1, !dbg !31
  store i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_04_bad.dataBuffer, i64 0, i64 0), i8** %data, align 8, !dbg !32
  %0 = load i8*, i8** %data, align 8, !dbg !33
  call void @printLine(i8* noundef %0), !dbg !34
  %1 = load i8*, i8** %data, align 8, !dbg !35
  call void @free(i8* noundef %1) #6, !dbg !36
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_04_good() #0 !dbg !38 {
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

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 38, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_04_bad", scope: !3, file: !3, line: 30, type: !4, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_static_04.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "d1aa4412bcd756d2d2cce00e691f448d")
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
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 32, type: !8)
!25 = !DILocation(line: 32, column: 12, scope: !2)
!26 = !DILocation(line: 33, column: 10, scope: !2)
!27 = !DILocation(line: 39, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !3, line: 36, column: 9)
!29 = distinct !DILexicalBlock(scope: !30, file: !3, line: 35, column: 5)
!30 = distinct !DILexicalBlock(scope: !2, file: !3, line: 34, column: 8)
!31 = !DILocation(line: 40, column: 31, scope: !28)
!32 = !DILocation(line: 41, column: 18, scope: !28)
!33 = !DILocation(line: 44, column: 15, scope: !2)
!34 = !DILocation(line: 44, column: 5, scope: !2)
!35 = !DILocation(line: 46, column: 10, scope: !2)
!36 = !DILocation(line: 46, column: 5, scope: !2)
!37 = !DILocation(line: 47, column: 1, scope: !2)
!38 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_04_good", scope: !3, file: !3, line: 108, type: !4, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!39 = !DILocation(line: 110, column: 5, scope: !38)
!40 = !DILocation(line: 111, column: 5, scope: !38)
!41 = !DILocation(line: 112, column: 1, scope: !38)
!42 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 54, type: !4, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!43 = !DILocalVariable(name: "data", scope: !42, file: !3, line: 56, type: !8)
!44 = !DILocation(line: 56, column: 12, scope: !42)
!45 = !DILocation(line: 57, column: 10, scope: !42)
!46 = !DILocalVariable(name: "dataBuffer", scope: !47, file: !3, line: 67, type: !8)
!47 = distinct !DILexicalBlock(scope: !48, file: !3, line: 65, column: 9)
!48 = distinct !DILexicalBlock(scope: !49, file: !3, line: 64, column: 5)
!49 = distinct !DILexicalBlock(scope: !42, file: !3, line: 58, column: 8)
!50 = !DILocation(line: 67, column: 20, scope: !47)
!51 = !DILocation(line: 67, column: 41, scope: !47)
!52 = !DILocation(line: 68, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !3, line: 68, column: 17)
!54 = !DILocation(line: 68, column: 28, scope: !53)
!55 = !DILocation(line: 68, column: 17, scope: !47)
!56 = !DILocation(line: 70, column: 17, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !3, line: 69, column: 13)
!58 = !DILocation(line: 71, column: 17, scope: !57)
!59 = !DILocation(line: 73, column: 20, scope: !47)
!60 = !DILocation(line: 73, column: 13, scope: !47)
!61 = !DILocation(line: 74, column: 13, scope: !47)
!62 = !DILocation(line: 74, column: 31, scope: !47)
!63 = !DILocation(line: 75, column: 20, scope: !47)
!64 = !DILocation(line: 75, column: 18, scope: !47)
!65 = !DILocation(line: 78, column: 15, scope: !42)
!66 = !DILocation(line: 78, column: 5, scope: !42)
!67 = !DILocation(line: 80, column: 10, scope: !42)
!68 = !DILocation(line: 80, column: 5, scope: !42)
!69 = !DILocation(line: 81, column: 1, scope: !42)
!70 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 84, type: !4, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!71 = !DILocalVariable(name: "data", scope: !70, file: !3, line: 86, type: !8)
!72 = !DILocation(line: 86, column: 12, scope: !70)
!73 = !DILocation(line: 87, column: 10, scope: !70)
!74 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !3, line: 92, type: !8)
!75 = distinct !DILexicalBlock(scope: !76, file: !3, line: 90, column: 9)
!76 = distinct !DILexicalBlock(scope: !77, file: !3, line: 89, column: 5)
!77 = distinct !DILexicalBlock(scope: !70, file: !3, line: 88, column: 8)
!78 = !DILocation(line: 92, column: 20, scope: !75)
!79 = !DILocation(line: 92, column: 41, scope: !75)
!80 = !DILocation(line: 93, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !3, line: 93, column: 17)
!82 = !DILocation(line: 93, column: 28, scope: !81)
!83 = !DILocation(line: 93, column: 17, scope: !75)
!84 = !DILocation(line: 95, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !3, line: 94, column: 13)
!86 = !DILocation(line: 96, column: 17, scope: !85)
!87 = !DILocation(line: 98, column: 20, scope: !75)
!88 = !DILocation(line: 98, column: 13, scope: !75)
!89 = !DILocation(line: 99, column: 13, scope: !75)
!90 = !DILocation(line: 99, column: 31, scope: !75)
!91 = !DILocation(line: 100, column: 20, scope: !75)
!92 = !DILocation(line: 100, column: 18, scope: !75)
!93 = !DILocation(line: 103, column: 15, scope: !70)
!94 = !DILocation(line: 103, column: 5, scope: !70)
!95 = !DILocation(line: 105, column: 10, scope: !70)
!96 = !DILocation(line: 105, column: 5, scope: !70)
!97 = !DILocation(line: 106, column: 1, scope: !70)
