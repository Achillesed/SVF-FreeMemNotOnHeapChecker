; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_06.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_06_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_06_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  %call = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_06_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !29
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_06_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !33
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_06_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !34
  %0 = load i32*, i32** %data, align 8, !dbg !35
  call void @printWLine(i32* noundef %0), !dbg !36
  %1 = load i32*, i32** %data, align 8, !dbg !37
  %2 = bitcast i32* %1 to i8*, !dbg !37
  call void @free(i8* noundef %2) #5, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_06_good() #0 !dbg !40 {
entry:
  call void @goodG2B1(), !dbg !41
  call void @goodG2B2(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !44 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !45, metadata !DIExpression()), !dbg !46
  store i32* null, i32** %data, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !48, metadata !DIExpression()), !dbg !52
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
  call void @printWLine(i32* noundef %5), !dbg !69
  %6 = load i32*, i32** %data, align 8, !dbg !70
  %7 = bitcast i32* %6 to i8*, !dbg !70
  call void @free(i8* noundef %7) #5, !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store i32* null, i32** %data, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !81
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !82
  %0 = bitcast i8* %call to i32*, !dbg !83
  store i32* %0, i32** %dataBuffer, align 8, !dbg !81
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !84
  %cmp = icmp eq i32* %1, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @exit(i32 noundef 1) #6, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !91
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !92
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !95
  store i32* %4, i32** %data, align 8, !dbg !96
  %5 = load i32*, i32** %data, align 8, !dbg !97
  call void @printWLine(i32* noundef %5), !dbg !98
  %6 = load i32*, i32** %data, align 8, !dbg !99
  %7 = bitcast i32* %6 to i8*, !dbg !99
  call void @free(i8* noundef %7) #5, !dbg !100
  ret void, !dbg !101
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!18, !19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 35, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_06_bad", scope: !3, file: !3, line: 27, type: !4, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_06.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "f821d894d817722b45081c0dc50750e1")
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
!26 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 29, type: !8)
!27 = !DILocation(line: 29, column: 15, scope: !2)
!28 = !DILocation(line: 30, column: 10, scope: !2)
!29 = !DILocation(line: 36, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !3, line: 33, column: 9)
!31 = distinct !DILexicalBlock(scope: !32, file: !3, line: 32, column: 5)
!32 = distinct !DILexicalBlock(scope: !2, file: !3, line: 31, column: 8)
!33 = !DILocation(line: 37, column: 31, scope: !30)
!34 = !DILocation(line: 38, column: 18, scope: !30)
!35 = !DILocation(line: 41, column: 16, scope: !2)
!36 = !DILocation(line: 41, column: 5, scope: !2)
!37 = !DILocation(line: 43, column: 10, scope: !2)
!38 = !DILocation(line: 43, column: 5, scope: !2)
!39 = !DILocation(line: 44, column: 1, scope: !2)
!40 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_06_good", scope: !3, file: !3, line: 105, type: !4, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!41 = !DILocation(line: 107, column: 5, scope: !40)
!42 = !DILocation(line: 108, column: 5, scope: !40)
!43 = !DILocation(line: 109, column: 1, scope: !40)
!44 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 51, type: !4, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!45 = !DILocalVariable(name: "data", scope: !44, file: !3, line: 53, type: !8)
!46 = !DILocation(line: 53, column: 15, scope: !44)
!47 = !DILocation(line: 54, column: 10, scope: !44)
!48 = !DILocalVariable(name: "dataBuffer", scope: !49, file: !3, line: 64, type: !8)
!49 = distinct !DILexicalBlock(scope: !50, file: !3, line: 62, column: 9)
!50 = distinct !DILexicalBlock(scope: !51, file: !3, line: 61, column: 5)
!51 = distinct !DILexicalBlock(scope: !44, file: !3, line: 55, column: 8)
!52 = !DILocation(line: 64, column: 23, scope: !49)
!53 = !DILocation(line: 64, column: 47, scope: !49)
!54 = !DILocation(line: 64, column: 36, scope: !49)
!55 = !DILocation(line: 65, column: 17, scope: !56)
!56 = distinct !DILexicalBlock(scope: !49, file: !3, line: 65, column: 17)
!57 = !DILocation(line: 65, column: 28, scope: !56)
!58 = !DILocation(line: 65, column: 17, scope: !49)
!59 = !DILocation(line: 67, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !3, line: 66, column: 13)
!61 = !DILocation(line: 68, column: 17, scope: !60)
!62 = !DILocation(line: 70, column: 21, scope: !49)
!63 = !DILocation(line: 70, column: 13, scope: !49)
!64 = !DILocation(line: 71, column: 13, scope: !49)
!65 = !DILocation(line: 71, column: 31, scope: !49)
!66 = !DILocation(line: 72, column: 20, scope: !49)
!67 = !DILocation(line: 72, column: 18, scope: !49)
!68 = !DILocation(line: 75, column: 16, scope: !44)
!69 = !DILocation(line: 75, column: 5, scope: !44)
!70 = !DILocation(line: 77, column: 10, scope: !44)
!71 = !DILocation(line: 77, column: 5, scope: !44)
!72 = !DILocation(line: 78, column: 1, scope: !44)
!73 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 81, type: !4, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!74 = !DILocalVariable(name: "data", scope: !73, file: !3, line: 83, type: !8)
!75 = !DILocation(line: 83, column: 15, scope: !73)
!76 = !DILocation(line: 84, column: 10, scope: !73)
!77 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !3, line: 89, type: !8)
!78 = distinct !DILexicalBlock(scope: !79, file: !3, line: 87, column: 9)
!79 = distinct !DILexicalBlock(scope: !80, file: !3, line: 86, column: 5)
!80 = distinct !DILexicalBlock(scope: !73, file: !3, line: 85, column: 8)
!81 = !DILocation(line: 89, column: 23, scope: !78)
!82 = !DILocation(line: 89, column: 47, scope: !78)
!83 = !DILocation(line: 89, column: 36, scope: !78)
!84 = !DILocation(line: 90, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !78, file: !3, line: 90, column: 17)
!86 = !DILocation(line: 90, column: 28, scope: !85)
!87 = !DILocation(line: 90, column: 17, scope: !78)
!88 = !DILocation(line: 92, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !3, line: 91, column: 13)
!90 = !DILocation(line: 93, column: 17, scope: !89)
!91 = !DILocation(line: 95, column: 21, scope: !78)
!92 = !DILocation(line: 95, column: 13, scope: !78)
!93 = !DILocation(line: 96, column: 13, scope: !78)
!94 = !DILocation(line: 96, column: 31, scope: !78)
!95 = !DILocation(line: 97, column: 20, scope: !78)
!96 = !DILocation(line: 97, column: 18, scope: !78)
!97 = !DILocation(line: 100, column: 16, scope: !73)
!98 = !DILocation(line: 100, column: 5, scope: !73)
!99 = !DILocation(line: 102, column: 10, scope: !73)
!100 = !DILocation(line: 102, column: 5, scope: !73)
!101 = !DILocation(line: 103, column: 1, scope: !73)
