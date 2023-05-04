; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68_badData = dso_local global i32* null, align 8, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68_goodG2BData = dso_local global i32* null, align 8, !dbg !11
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 400, align 16, !dbg !31
  %1 = bitcast i8* %0 to i32*, !dbg !32
  store i32* %1, i32** %dataBuffer, align 8, !dbg !30
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  %call = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !34
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !37
  store i32* %4, i32** %data, align 8, !dbg !38
  %5 = load i32*, i32** %data, align 8, !dbg !39
  store i32* %5, i32** @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68_badData, align 8, !dbg !40
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68b_badSink(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68b_badSink(...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !46 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !47, metadata !DIExpression()), !dbg !48
  store i32* null, i32** %data, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !50, metadata !DIExpression()), !dbg !52
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !53
  %0 = bitcast i8* %call to i32*, !dbg !54
  store i32* %0, i32** %dataBuffer, align 8, !dbg !52
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !55
  %cmp = icmp eq i32* %1, null, !dbg !57
  br i1 %cmp, label %if.then, label %if.end, !dbg !58

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @exit(i32 noundef 1) #6, !dbg !61
  unreachable, !dbg !61

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !62
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !63
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !64
  store i32 0, i32* %arrayidx, align 4, !dbg !65
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !66
  store i32* %4, i32** %data, align 8, !dbg !67
  %5 = load i32*, i32** %data, align 8, !dbg !68
  store i32* %5, i32** @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68_goodG2BData, align 8, !dbg !69
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68b_goodG2BSink(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68_badData", scope: !2, file: !3, line: 21, type: !5, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "36f63c05f4f08f6decf8366ee20fd43c")
!4 = !{!5, !9}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68_goodG2BData", scope: !2, file: !3, line: 22, type: !5, isLocal: false, isDefinition: true)
!13 = !{i32 7, !"Dwarf Version", i32 5}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"PIE Level", i32 2}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!21 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68_bad", scope: !3, file: !3, line: 29, type: !22, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !{}
!25 = !DILocalVariable(name: "data", scope: !21, file: !3, line: 31, type: !5)
!26 = !DILocation(line: 31, column: 15, scope: !21)
!27 = !DILocation(line: 32, column: 10, scope: !21)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !3, line: 35, type: !5)
!29 = distinct !DILexicalBlock(scope: !21, file: !3, line: 33, column: 5)
!30 = !DILocation(line: 35, column: 19, scope: !29)
!31 = !DILocation(line: 35, column: 43, scope: !29)
!32 = !DILocation(line: 35, column: 32, scope: !29)
!33 = !DILocation(line: 36, column: 17, scope: !29)
!34 = !DILocation(line: 36, column: 9, scope: !29)
!35 = !DILocation(line: 37, column: 9, scope: !29)
!36 = !DILocation(line: 37, column: 27, scope: !29)
!37 = !DILocation(line: 38, column: 16, scope: !29)
!38 = !DILocation(line: 38, column: 14, scope: !29)
!39 = !DILocation(line: 40, column: 70, scope: !21)
!40 = !DILocation(line: 40, column: 68, scope: !21)
!41 = !DILocation(line: 41, column: 5, scope: !21)
!42 = !DILocation(line: 42, column: 1, scope: !21)
!43 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68_good", scope: !3, file: !3, line: 72, type: !22, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!44 = !DILocation(line: 74, column: 5, scope: !43)
!45 = !DILocation(line: 75, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 52, type: !22, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!47 = !DILocalVariable(name: "data", scope: !46, file: !3, line: 54, type: !5)
!48 = !DILocation(line: 54, column: 15, scope: !46)
!49 = !DILocation(line: 55, column: 10, scope: !46)
!50 = !DILocalVariable(name: "dataBuffer", scope: !51, file: !3, line: 58, type: !5)
!51 = distinct !DILexicalBlock(scope: !46, file: !3, line: 56, column: 5)
!52 = !DILocation(line: 58, column: 19, scope: !51)
!53 = !DILocation(line: 58, column: 43, scope: !51)
!54 = !DILocation(line: 58, column: 32, scope: !51)
!55 = !DILocation(line: 59, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !3, line: 59, column: 13)
!57 = !DILocation(line: 59, column: 24, scope: !56)
!58 = !DILocation(line: 59, column: 13, scope: !51)
!59 = !DILocation(line: 61, column: 13, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !3, line: 60, column: 9)
!61 = !DILocation(line: 62, column: 13, scope: !60)
!62 = !DILocation(line: 64, column: 17, scope: !51)
!63 = !DILocation(line: 64, column: 9, scope: !51)
!64 = !DILocation(line: 65, column: 9, scope: !51)
!65 = !DILocation(line: 65, column: 27, scope: !51)
!66 = !DILocation(line: 66, column: 16, scope: !51)
!67 = !DILocation(line: 66, column: 14, scope: !51)
!68 = !DILocation(line: 68, column: 74, scope: !46)
!69 = !DILocation(line: 68, column: 72, scope: !46)
!70 = !DILocation(line: 69, column: 5, scope: !46)
!71 = !DILocation(line: 70, column: 1, scope: !46)
