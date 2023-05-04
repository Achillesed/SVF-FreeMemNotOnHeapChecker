; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_65a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_65_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_65_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !28, metadata !DIExpression()), !dbg !32
  store void (i32*)* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_65b_badSink, void (i32*)** %funcPtr, align 8, !dbg !32
  store i32* null, i32** %data, align 8, !dbg !33
  %call = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_65_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !34
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_65_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !36
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_65_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !37
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !38
  %1 = load i32*, i32** %data, align 8, !dbg !39
  call void %0(i32* noundef %1), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_65b_badSink(i32* noundef) #2

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_65_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !44 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !47, metadata !DIExpression()), !dbg !48
  store void (i32*)* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_65b_goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !48
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
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !68
  %6 = load i32*, i32** %data, align 8, !dbg !69
  call void %5(i32* noundef %6), !dbg !68
  ret void, !dbg !70
}

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_65b_goodG2BSink(i32* noundef) #2

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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 34, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_65_bad", scope: !3, file: !3, line: 26, type: !4, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_65a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "e5a2fb58613d6ac215aa3aae1f61247d")
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
!26 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 28, type: !8)
!27 = !DILocation(line: 28, column: 15, scope: !2)
!28 = !DILocalVariable(name: "funcPtr", scope: !2, file: !3, line: 30, type: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DISubroutineType(types: !31)
!31 = !{null, !8}
!32 = !DILocation(line: 30, column: 12, scope: !2)
!33 = !DILocation(line: 31, column: 10, scope: !2)
!34 = !DILocation(line: 35, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !2, file: !3, line: 32, column: 5)
!36 = !DILocation(line: 36, column: 27, scope: !35)
!37 = !DILocation(line: 37, column: 14, scope: !35)
!38 = !DILocation(line: 40, column: 5, scope: !2)
!39 = !DILocation(line: 40, column: 13, scope: !2)
!40 = !DILocation(line: 41, column: 1, scope: !2)
!41 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_65_good", scope: !3, file: !3, line: 70, type: !4, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!42 = !DILocation(line: 72, column: 5, scope: !41)
!43 = !DILocation(line: 73, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 50, type: !4, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!45 = !DILocalVariable(name: "data", scope: !44, file: !3, line: 52, type: !8)
!46 = !DILocation(line: 52, column: 15, scope: !44)
!47 = !DILocalVariable(name: "funcPtr", scope: !44, file: !3, line: 53, type: !29)
!48 = !DILocation(line: 53, column: 12, scope: !44)
!49 = !DILocation(line: 54, column: 10, scope: !44)
!50 = !DILocalVariable(name: "dataBuffer", scope: !51, file: !3, line: 57, type: !8)
!51 = distinct !DILexicalBlock(scope: !44, file: !3, line: 55, column: 5)
!52 = !DILocation(line: 57, column: 19, scope: !51)
!53 = !DILocation(line: 57, column: 43, scope: !51)
!54 = !DILocation(line: 57, column: 32, scope: !51)
!55 = !DILocation(line: 58, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !3, line: 58, column: 13)
!57 = !DILocation(line: 58, column: 24, scope: !56)
!58 = !DILocation(line: 58, column: 13, scope: !51)
!59 = !DILocation(line: 60, column: 13, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !3, line: 59, column: 9)
!61 = !DILocation(line: 61, column: 13, scope: !60)
!62 = !DILocation(line: 63, column: 17, scope: !51)
!63 = !DILocation(line: 63, column: 9, scope: !51)
!64 = !DILocation(line: 64, column: 9, scope: !51)
!65 = !DILocation(line: 64, column: 27, scope: !51)
!66 = !DILocation(line: 65, column: 16, scope: !51)
!67 = !DILocation(line: 65, column: 14, scope: !51)
!68 = !DILocation(line: 67, column: 5, scope: !44)
!69 = !DILocation(line: 67, column: 13, scope: !44)
!70 = !DILocation(line: 68, column: 1, scope: !44)
