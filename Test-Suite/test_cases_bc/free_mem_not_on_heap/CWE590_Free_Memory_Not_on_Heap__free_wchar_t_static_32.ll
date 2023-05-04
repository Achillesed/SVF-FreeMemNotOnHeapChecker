; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_32.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_32_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_32_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !28, metadata !DIExpression()), !dbg !30
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !31, metadata !DIExpression()), !dbg !32
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !32
  store i32* null, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !37
  %1 = load i32*, i32** %0, align 8, !dbg !38
  store i32* %1, i32** %data1, align 8, !dbg !36
  %call = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_32_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !39
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_32_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !41
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_32_bad.dataBuffer, i64 0, i64 0), i32** %data1, align 8, !dbg !42
  %2 = load i32*, i32** %data1, align 8, !dbg !43
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !44
  store i32* %2, i32** %3, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !46, metadata !DIExpression()), !dbg !48
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !49
  %5 = load i32*, i32** %4, align 8, !dbg !50
  store i32* %5, i32** %data2, align 8, !dbg !48
  %6 = load i32*, i32** %data2, align 8, !dbg !51
  call void @printWLine(i32* noundef %6), !dbg !52
  %7 = load i32*, i32** %data2, align 8, !dbg !53
  %8 = bitcast i32* %7 to i8*, !dbg !53
  call void @free(i8* noundef %8) #5, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_32_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !59 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !62, metadata !DIExpression()), !dbg !63
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !64, metadata !DIExpression()), !dbg !65
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !65
  store i32* null, i32** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !67, metadata !DIExpression()), !dbg !69
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !70
  %1 = load i32*, i32** %0, align 8, !dbg !71
  store i32* %1, i32** %data1, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !72, metadata !DIExpression()), !dbg !74
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !75
  %2 = bitcast i8* %call to i32*, !dbg !76
  store i32* %2, i32** %dataBuffer, align 8, !dbg !74
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !77
  %cmp = icmp eq i32* %3, null, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @exit(i32 noundef 1) #6, !dbg !83
  unreachable, !dbg !83

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !84
  %call2 = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 99) #5, !dbg !85
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !88
  store i32* %6, i32** %data1, align 8, !dbg !89
  %7 = load i32*, i32** %data1, align 8, !dbg !90
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !91
  store i32* %7, i32** %8, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !93, metadata !DIExpression()), !dbg !95
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !96
  %10 = load i32*, i32** %9, align 8, !dbg !97
  store i32* %10, i32** %data3, align 8, !dbg !95
  %11 = load i32*, i32** %data3, align 8, !dbg !98
  call void @printWLine(i32* noundef %11), !dbg !99
  %12 = load i32*, i32** %data3, align 8, !dbg !100
  %13 = bitcast i32* %12 to i8*, !dbg !100
  call void @free(i8* noundef %13) #5, !dbg !101
  ret void, !dbg !102
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 33, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_32_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_32.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "f524e97b202c89e6e6e9fa6f3cd75334")
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
!26 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 25, type: !8)
!27 = !DILocation(line: 25, column: 15, scope: !2)
!28 = !DILocalVariable(name: "dataPtr1", scope: !2, file: !3, line: 26, type: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!30 = !DILocation(line: 26, column: 16, scope: !2)
!31 = !DILocalVariable(name: "dataPtr2", scope: !2, file: !3, line: 27, type: !29)
!32 = !DILocation(line: 27, column: 16, scope: !2)
!33 = !DILocation(line: 28, column: 10, scope: !2)
!34 = !DILocalVariable(name: "data", scope: !35, file: !3, line: 30, type: !8)
!35 = distinct !DILexicalBlock(scope: !2, file: !3, line: 29, column: 5)
!36 = !DILocation(line: 30, column: 19, scope: !35)
!37 = !DILocation(line: 30, column: 27, scope: !35)
!38 = !DILocation(line: 30, column: 26, scope: !35)
!39 = !DILocation(line: 34, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !35, file: !3, line: 31, column: 9)
!41 = !DILocation(line: 35, column: 31, scope: !40)
!42 = !DILocation(line: 36, column: 18, scope: !40)
!43 = !DILocation(line: 38, column: 21, scope: !35)
!44 = !DILocation(line: 38, column: 10, scope: !35)
!45 = !DILocation(line: 38, column: 19, scope: !35)
!46 = !DILocalVariable(name: "data", scope: !47, file: !3, line: 41, type: !8)
!47 = distinct !DILexicalBlock(scope: !2, file: !3, line: 40, column: 5)
!48 = !DILocation(line: 41, column: 19, scope: !47)
!49 = !DILocation(line: 41, column: 27, scope: !47)
!50 = !DILocation(line: 41, column: 26, scope: !47)
!51 = !DILocation(line: 42, column: 20, scope: !47)
!52 = !DILocation(line: 42, column: 9, scope: !47)
!53 = !DILocation(line: 44, column: 14, scope: !47)
!54 = !DILocation(line: 44, column: 9, scope: !47)
!55 = !DILocation(line: 46, column: 1, scope: !2)
!56 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_32_good", scope: !3, file: !3, line: 83, type: !4, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!57 = !DILocation(line: 85, column: 5, scope: !56)
!58 = !DILocation(line: 86, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 53, type: !4, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!60 = !DILocalVariable(name: "data", scope: !59, file: !3, line: 55, type: !8)
!61 = !DILocation(line: 55, column: 15, scope: !59)
!62 = !DILocalVariable(name: "dataPtr1", scope: !59, file: !3, line: 56, type: !29)
!63 = !DILocation(line: 56, column: 16, scope: !59)
!64 = !DILocalVariable(name: "dataPtr2", scope: !59, file: !3, line: 57, type: !29)
!65 = !DILocation(line: 57, column: 16, scope: !59)
!66 = !DILocation(line: 58, column: 10, scope: !59)
!67 = !DILocalVariable(name: "data", scope: !68, file: !3, line: 60, type: !8)
!68 = distinct !DILexicalBlock(scope: !59, file: !3, line: 59, column: 5)
!69 = !DILocation(line: 60, column: 19, scope: !68)
!70 = !DILocation(line: 60, column: 27, scope: !68)
!71 = !DILocation(line: 60, column: 26, scope: !68)
!72 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !3, line: 63, type: !8)
!73 = distinct !DILexicalBlock(scope: !68, file: !3, line: 61, column: 9)
!74 = !DILocation(line: 63, column: 23, scope: !73)
!75 = !DILocation(line: 63, column: 47, scope: !73)
!76 = !DILocation(line: 63, column: 36, scope: !73)
!77 = !DILocation(line: 64, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !3, line: 64, column: 17)
!79 = !DILocation(line: 64, column: 28, scope: !78)
!80 = !DILocation(line: 64, column: 17, scope: !73)
!81 = !DILocation(line: 66, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !3, line: 65, column: 13)
!83 = !DILocation(line: 67, column: 17, scope: !82)
!84 = !DILocation(line: 69, column: 21, scope: !73)
!85 = !DILocation(line: 69, column: 13, scope: !73)
!86 = !DILocation(line: 70, column: 13, scope: !73)
!87 = !DILocation(line: 70, column: 31, scope: !73)
!88 = !DILocation(line: 71, column: 20, scope: !73)
!89 = !DILocation(line: 71, column: 18, scope: !73)
!90 = !DILocation(line: 73, column: 21, scope: !68)
!91 = !DILocation(line: 73, column: 10, scope: !68)
!92 = !DILocation(line: 73, column: 19, scope: !68)
!93 = !DILocalVariable(name: "data", scope: !94, file: !3, line: 76, type: !8)
!94 = distinct !DILexicalBlock(scope: !59, file: !3, line: 75, column: 5)
!95 = !DILocation(line: 76, column: 19, scope: !94)
!96 = !DILocation(line: 76, column: 27, scope: !94)
!97 = !DILocation(line: 76, column: 26, scope: !94)
!98 = !DILocation(line: 77, column: 20, scope: !94)
!99 = !DILocation(line: 77, column: 9, scope: !94)
!100 = !DILocation(line: 79, column: 14, scope: !94)
!101 = !DILocation(line: 79, column: 9, scope: !94)
!102 = !DILocation(line: 81, column: 1, scope: !59)
