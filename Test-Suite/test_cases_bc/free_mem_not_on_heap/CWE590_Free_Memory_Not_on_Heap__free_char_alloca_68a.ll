; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68_badData = dso_local global i8* null, align 8, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68_goodG2BData = dso_local global i8* null, align 8, !dbg !9
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %0, i8** %dataBuffer, align 8, !dbg !28
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !31
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !34
  store i8* %3, i8** %data, align 8, !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !36
  store i8* %4, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68_badData, align 8, !dbg !37
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68b_badSink(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68b_badSink(...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !43 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !44, metadata !DIExpression()), !dbg !45
  store i8* null, i8** %data, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !47, metadata !DIExpression()), !dbg !49
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !50
  store i8* %call, i8** %dataBuffer, align 8, !dbg !49
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !51
  %cmp = icmp eq i8* %0, null, !dbg !53
  br i1 %cmp, label %if.then, label %if.end, !dbg !54

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @exit(i32 noundef 1) #7, !dbg !57
  unreachable, !dbg !57

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !59
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !60
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !60
  store i8 0, i8* %arrayidx, align 1, !dbg !61
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !62
  store i8* %3, i8** %data, align 8, !dbg !63
  %4 = load i8*, i8** %data, align 8, !dbg !64
  store i8* %4, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68_goodG2BData, align 8, !dbg !65
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68b_goodG2BSink(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68_badData", scope: !2, file: !3, line: 21, type: !5, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "0052fa8eed6bd7121dbfe2febc06821e")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68_goodG2BData", scope: !2, file: !3, line: 22, type: !5, isLocal: false, isDefinition: true)
!11 = !{i32 7, !"Dwarf Version", i32 5}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"PIE Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!19 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68_bad", scope: !3, file: !3, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !3, line: 31, type: !5)
!24 = !DILocation(line: 31, column: 12, scope: !19)
!25 = !DILocation(line: 32, column: 10, scope: !19)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !3, line: 35, type: !5)
!27 = distinct !DILexicalBlock(scope: !19, file: !3, line: 33, column: 5)
!28 = !DILocation(line: 35, column: 16, scope: !27)
!29 = !DILocation(line: 35, column: 37, scope: !27)
!30 = !DILocation(line: 36, column: 16, scope: !27)
!31 = !DILocation(line: 36, column: 9, scope: !27)
!32 = !DILocation(line: 37, column: 9, scope: !27)
!33 = !DILocation(line: 37, column: 27, scope: !27)
!34 = !DILocation(line: 38, column: 16, scope: !27)
!35 = !DILocation(line: 38, column: 14, scope: !27)
!36 = !DILocation(line: 40, column: 67, scope: !19)
!37 = !DILocation(line: 40, column: 65, scope: !19)
!38 = !DILocation(line: 41, column: 5, scope: !19)
!39 = !DILocation(line: 42, column: 1, scope: !19)
!40 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_68_good", scope: !3, file: !3, line: 72, type: !20, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!41 = !DILocation(line: 74, column: 5, scope: !40)
!42 = !DILocation(line: 75, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!44 = !DILocalVariable(name: "data", scope: !43, file: !3, line: 54, type: !5)
!45 = !DILocation(line: 54, column: 12, scope: !43)
!46 = !DILocation(line: 55, column: 10, scope: !43)
!47 = !DILocalVariable(name: "dataBuffer", scope: !48, file: !3, line: 58, type: !5)
!48 = distinct !DILexicalBlock(scope: !43, file: !3, line: 56, column: 5)
!49 = !DILocation(line: 58, column: 16, scope: !48)
!50 = !DILocation(line: 58, column: 37, scope: !48)
!51 = !DILocation(line: 59, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !3, line: 59, column: 13)
!53 = !DILocation(line: 59, column: 24, scope: !52)
!54 = !DILocation(line: 59, column: 13, scope: !48)
!55 = !DILocation(line: 61, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !3, line: 60, column: 9)
!57 = !DILocation(line: 62, column: 13, scope: !56)
!58 = !DILocation(line: 64, column: 16, scope: !48)
!59 = !DILocation(line: 64, column: 9, scope: !48)
!60 = !DILocation(line: 65, column: 9, scope: !48)
!61 = !DILocation(line: 65, column: 27, scope: !48)
!62 = !DILocation(line: 66, column: 16, scope: !48)
!63 = !DILocation(line: 66, column: 14, scope: !48)
!64 = !DILocation(line: 68, column: 71, scope: !43)
!65 = !DILocation(line: 68, column: 69, scope: !43)
!66 = !DILocation(line: 69, column: 5, scope: !43)
!67 = !DILocation(line: 70, column: 1, scope: !43)
