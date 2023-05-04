; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41_badSink(i32* noundef %data) #0 !dbg !26 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = load i32*, i32** %data.addr, align 8, !dbg !31
  call void @printWLine(i32* noundef %0), !dbg !32
  %1 = load i32*, i32** %data.addr, align 8, !dbg !33
  %2 = bitcast i32* %1 to i8*, !dbg !33
  call void @free(i8* noundef %2) #5, !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !36, metadata !DIExpression()), !dbg !37
  store i32* null, i32** %data, align 8, !dbg !38
  %call = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !39
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !41
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !42
  %0 = load i32*, i32** %data, align 8, !dbg !43
  call void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41_badSink(i32* noundef %0), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41_goodG2BSink(i32* noundef %data) #0 !dbg !46 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %0 = load i32*, i32** %data.addr, align 8, !dbg !49
  call void @printWLine(i32* noundef %0), !dbg !50
  %1 = load i32*, i32** %data.addr, align 8, !dbg !51
  %2 = bitcast i32* %1 to i8*, !dbg !51
  call void @free(i8* noundef %2) #5, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !57 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !58, metadata !DIExpression()), !dbg !59
  store i32* null, i32** %data, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !61, metadata !DIExpression()), !dbg !63
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !64
  %0 = bitcast i8* %call to i32*, !dbg !65
  store i32* %0, i32** %dataBuffer, align 8, !dbg !63
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !66
  %cmp = icmp eq i32* %1, null, !dbg !68
  br i1 %cmp, label %if.then, label %if.end, !dbg !69

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @exit(i32 noundef 1) #6, !dbg !72
  unreachable, !dbg !72

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !73
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !74
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !75
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !75
  store i32 0, i32* %arrayidx, align 4, !dbg !76
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !77
  store i32* %4, i32** %data, align 8, !dbg !78
  %5 = load i32*, i32** %data, align 8, !dbg !79
  call void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41_goodG2BSink(i32* noundef %5), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!18, !19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 36, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41_bad", scope: !3, file: !3, line: 30, type: !4, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "cee4e20a12cb6c6c28aafaf5e1b8217b")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !13, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !12}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !{!0}
!14 = !{}
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 100)
!18 = !{i32 7, !"Dwarf Version", i32 5}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"PIC Level", i32 2}
!22 = !{i32 7, !"PIE Level", i32 2}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!26 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41_badSink", scope: !3, file: !3, line: 23, type: !27, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !8}
!29 = !DILocalVariable(name: "data", arg: 1, scope: !26, file: !3, line: 23, type: !8)
!30 = !DILocation(line: 23, column: 79, scope: !26)
!31 = !DILocation(line: 25, column: 16, scope: !26)
!32 = !DILocation(line: 25, column: 5, scope: !26)
!33 = !DILocation(line: 27, column: 10, scope: !26)
!34 = !DILocation(line: 27, column: 5, scope: !26)
!35 = !DILocation(line: 28, column: 1, scope: !26)
!36 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 32, type: !8)
!37 = !DILocation(line: 32, column: 15, scope: !2)
!38 = !DILocation(line: 33, column: 10, scope: !2)
!39 = !DILocation(line: 37, column: 9, scope: !40)
!40 = distinct !DILexicalBlock(scope: !2, file: !3, line: 34, column: 5)
!41 = !DILocation(line: 38, column: 27, scope: !40)
!42 = !DILocation(line: 39, column: 14, scope: !40)
!43 = !DILocation(line: 41, column: 68, scope: !2)
!44 = !DILocation(line: 41, column: 5, scope: !2)
!45 = !DILocation(line: 42, column: 1, scope: !2)
!46 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41_goodG2BSink", scope: !3, file: !3, line: 48, type: !27, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!47 = !DILocalVariable(name: "data", arg: 1, scope: !46, file: !3, line: 48, type: !8)
!48 = !DILocation(line: 48, column: 83, scope: !46)
!49 = !DILocation(line: 50, column: 16, scope: !46)
!50 = !DILocation(line: 50, column: 5, scope: !46)
!51 = !DILocation(line: 52, column: 10, scope: !46)
!52 = !DILocation(line: 52, column: 5, scope: !46)
!53 = !DILocation(line: 53, column: 1, scope: !46)
!54 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_41_good", scope: !3, file: !3, line: 75, type: !4, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!55 = !DILocation(line: 77, column: 5, scope: !54)
!56 = !DILocation(line: 78, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 56, type: !4, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!58 = !DILocalVariable(name: "data", scope: !57, file: !3, line: 58, type: !8)
!59 = !DILocation(line: 58, column: 15, scope: !57)
!60 = !DILocation(line: 59, column: 10, scope: !57)
!61 = !DILocalVariable(name: "dataBuffer", scope: !62, file: !3, line: 62, type: !8)
!62 = distinct !DILexicalBlock(scope: !57, file: !3, line: 60, column: 5)
!63 = !DILocation(line: 62, column: 19, scope: !62)
!64 = !DILocation(line: 62, column: 43, scope: !62)
!65 = !DILocation(line: 62, column: 32, scope: !62)
!66 = !DILocation(line: 63, column: 13, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !3, line: 63, column: 13)
!68 = !DILocation(line: 63, column: 24, scope: !67)
!69 = !DILocation(line: 63, column: 13, scope: !62)
!70 = !DILocation(line: 65, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !3, line: 64, column: 9)
!72 = !DILocation(line: 66, column: 13, scope: !71)
!73 = !DILocation(line: 68, column: 17, scope: !62)
!74 = !DILocation(line: 68, column: 9, scope: !62)
!75 = !DILocation(line: 69, column: 9, scope: !62)
!76 = !DILocation(line: 69, column: 27, scope: !62)
!77 = !DILocation(line: 70, column: 16, scope: !62)
!78 = !DILocation(line: 70, column: 14, scope: !62)
!79 = !DILocation(line: 72, column: 72, scope: !57)
!80 = !DILocation(line: 72, column: 5, scope: !57)
!81 = !DILocation(line: 73, column: 1, scope: !57)
