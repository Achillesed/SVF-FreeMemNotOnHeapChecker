; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68_badData = dso_local global i32* null, align 8, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68_goodG2BData = dso_local global i32* null, align 8, !dbg !11
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !34
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 99) #5, !dbg !35
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay1, i32** %data, align 8, !dbg !39
  %0 = load i32*, i32** %data, align 8, !dbg !40
  store i32* %0, i32** @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68_badData, align 8, !dbg !41
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68b_badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68b_badSink(...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !47 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !48, metadata !DIExpression()), !dbg !49
  store i32* null, i32** %data, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !51, metadata !DIExpression()), !dbg !53
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !54
  %0 = bitcast i8* %call to i32*, !dbg !55
  store i32* %0, i32** %dataBuffer, align 8, !dbg !53
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !56
  %cmp = icmp eq i32* %1, null, !dbg !58
  br i1 %cmp, label %if.then, label %if.end, !dbg !59

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @exit(i32 noundef 1) #6, !dbg !62
  unreachable, !dbg !62

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !63
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !64
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !65
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !65
  store i32 0, i32* %arrayidx, align 4, !dbg !66
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !67
  store i32* %4, i32** %data, align 8, !dbg !68
  %5 = load i32*, i32** %data, align 8, !dbg !69
  store i32* %5, i32** @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68_goodG2BData, align 8, !dbg !70
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68b_goodG2BSink(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68b_goodG2BSink(...) #3

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
!1 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68_badData", scope: !2, file: !3, line: 21, type: !5, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "49293531c2cc8b573a059de763ccdb75")
!4 = !{!5, !9}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68_goodG2BData", scope: !2, file: !3, line: 22, type: !5, isLocal: false, isDefinition: true)
!13 = !{i32 7, !"Dwarf Version", i32 5}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"PIE Level", i32 2}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!21 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68_bad", scope: !3, file: !3, line: 29, type: !22, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !{}
!25 = !DILocalVariable(name: "data", scope: !21, file: !3, line: 31, type: !5)
!26 = !DILocation(line: 31, column: 15, scope: !21)
!27 = !DILocation(line: 32, column: 10, scope: !21)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !3, line: 35, type: !30)
!29 = distinct !DILexicalBlock(scope: !21, file: !3, line: 33, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 35, column: 17, scope: !29)
!34 = !DILocation(line: 36, column: 17, scope: !29)
!35 = !DILocation(line: 36, column: 9, scope: !29)
!36 = !DILocation(line: 37, column: 9, scope: !29)
!37 = !DILocation(line: 37, column: 27, scope: !29)
!38 = !DILocation(line: 38, column: 16, scope: !29)
!39 = !DILocation(line: 38, column: 14, scope: !29)
!40 = !DILocation(line: 40, column: 71, scope: !21)
!41 = !DILocation(line: 40, column: 69, scope: !21)
!42 = !DILocation(line: 41, column: 5, scope: !21)
!43 = !DILocation(line: 42, column: 1, scope: !21)
!44 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_68_good", scope: !3, file: !3, line: 72, type: !22, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!45 = !DILocation(line: 74, column: 5, scope: !44)
!46 = !DILocation(line: 75, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 52, type: !22, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!48 = !DILocalVariable(name: "data", scope: !47, file: !3, line: 54, type: !5)
!49 = !DILocation(line: 54, column: 15, scope: !47)
!50 = !DILocation(line: 55, column: 10, scope: !47)
!51 = !DILocalVariable(name: "dataBuffer", scope: !52, file: !3, line: 58, type: !5)
!52 = distinct !DILexicalBlock(scope: !47, file: !3, line: 56, column: 5)
!53 = !DILocation(line: 58, column: 19, scope: !52)
!54 = !DILocation(line: 58, column: 43, scope: !52)
!55 = !DILocation(line: 58, column: 32, scope: !52)
!56 = !DILocation(line: 59, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !52, file: !3, line: 59, column: 13)
!58 = !DILocation(line: 59, column: 24, scope: !57)
!59 = !DILocation(line: 59, column: 13, scope: !52)
!60 = !DILocation(line: 61, column: 13, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !3, line: 60, column: 9)
!62 = !DILocation(line: 62, column: 13, scope: !61)
!63 = !DILocation(line: 64, column: 17, scope: !52)
!64 = !DILocation(line: 64, column: 9, scope: !52)
!65 = !DILocation(line: 65, column: 9, scope: !52)
!66 = !DILocation(line: 65, column: 27, scope: !52)
!67 = !DILocation(line: 66, column: 16, scope: !52)
!68 = !DILocation(line: 66, column: 14, scope: !52)
!69 = !DILocation(line: 68, column: 75, scope: !47)
!70 = !DILocation(line: 68, column: 73, scope: !47)
!71 = !DILocation(line: 69, column: 5, scope: !47)
!72 = !DILocation(line: 70, column: 1, scope: !47)
