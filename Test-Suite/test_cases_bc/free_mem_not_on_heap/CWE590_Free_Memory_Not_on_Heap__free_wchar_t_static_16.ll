; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_16.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_16_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_16_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  br label %while.body, !dbg !29

while.body:                                       ; preds = %entry
  %call = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_16_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !30
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_16_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !33
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_16_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !34
  br label %while.end, !dbg !35

while.end:                                        ; preds = %while.body
  %0 = load i32*, i32** %data, align 8, !dbg !36
  call void @printWLine(i32* noundef %0), !dbg !37
  %1 = load i32*, i32** %data, align 8, !dbg !38
  %2 = bitcast i32* %1 to i8*, !dbg !38
  call void @free(i8* noundef %2) #5, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_16_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !44 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !45, metadata !DIExpression()), !dbg !46
  store i32* null, i32** %data, align 8, !dbg !47
  br label %while.body, !dbg !48

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !49, metadata !DIExpression()), !dbg !52
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !53
  %0 = bitcast i8* %call to i32*, !dbg !54
  store i32* %0, i32** %dataBuffer, align 8, !dbg !52
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !55
  %cmp = icmp eq i32* %1, null, !dbg !57
  br i1 %cmp, label %if.then, label %if.end, !dbg !58

if.then:                                          ; preds = %while.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @exit(i32 noundef 1) #6, !dbg !61
  unreachable, !dbg !61

if.end:                                           ; preds = %while.body
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !62
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !63
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !64
  store i32 0, i32* %arrayidx, align 4, !dbg !65
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !66
  store i32* %4, i32** %data, align 8, !dbg !67
  br label %while.end, !dbg !68

while.end:                                        ; preds = %if.end
  %5 = load i32*, i32** %data, align 8, !dbg !69
  call void @printWLine(i32* noundef %5), !dbg !70
  %6 = load i32*, i32** %data, align 8, !dbg !71
  %7 = bitcast i32* %6 to i8*, !dbg !71
  call void @free(i8* noundef %7) #5, !dbg !72
  ret void, !dbg !73
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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 31, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_16_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_16.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "9d67c091acd13f559a02c839c02fa4a3")
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
!28 = !DILocation(line: 26, column: 10, scope: !2)
!29 = !DILocation(line: 27, column: 5, scope: !2)
!30 = !DILocation(line: 32, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !3, line: 29, column: 9)
!32 = distinct !DILexicalBlock(scope: !2, file: !3, line: 28, column: 5)
!33 = !DILocation(line: 33, column: 31, scope: !31)
!34 = !DILocation(line: 34, column: 18, scope: !31)
!35 = !DILocation(line: 36, column: 9, scope: !32)
!36 = !DILocation(line: 38, column: 16, scope: !2)
!37 = !DILocation(line: 38, column: 5, scope: !2)
!38 = !DILocation(line: 40, column: 10, scope: !2)
!39 = !DILocation(line: 40, column: 5, scope: !2)
!40 = !DILocation(line: 41, column: 1, scope: !2)
!41 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_16_good", scope: !3, file: !3, line: 73, type: !4, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!42 = !DILocation(line: 75, column: 5, scope: !41)
!43 = !DILocation(line: 76, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 48, type: !4, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!45 = !DILocalVariable(name: "data", scope: !44, file: !3, line: 50, type: !8)
!46 = !DILocation(line: 50, column: 15, scope: !44)
!47 = !DILocation(line: 51, column: 10, scope: !44)
!48 = !DILocation(line: 52, column: 5, scope: !44)
!49 = !DILocalVariable(name: "dataBuffer", scope: !50, file: !3, line: 56, type: !8)
!50 = distinct !DILexicalBlock(scope: !51, file: !3, line: 54, column: 9)
!51 = distinct !DILexicalBlock(scope: !44, file: !3, line: 53, column: 5)
!52 = !DILocation(line: 56, column: 23, scope: !50)
!53 = !DILocation(line: 56, column: 47, scope: !50)
!54 = !DILocation(line: 56, column: 36, scope: !50)
!55 = !DILocation(line: 57, column: 17, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !3, line: 57, column: 17)
!57 = !DILocation(line: 57, column: 28, scope: !56)
!58 = !DILocation(line: 57, column: 17, scope: !50)
!59 = !DILocation(line: 59, column: 17, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !3, line: 58, column: 13)
!61 = !DILocation(line: 60, column: 17, scope: !60)
!62 = !DILocation(line: 62, column: 21, scope: !50)
!63 = !DILocation(line: 62, column: 13, scope: !50)
!64 = !DILocation(line: 63, column: 13, scope: !50)
!65 = !DILocation(line: 63, column: 31, scope: !50)
!66 = !DILocation(line: 64, column: 20, scope: !50)
!67 = !DILocation(line: 64, column: 18, scope: !50)
!68 = !DILocation(line: 66, column: 9, scope: !51)
!69 = !DILocation(line: 68, column: 16, scope: !44)
!70 = !DILocation(line: 68, column: 5, scope: !44)
!71 = !DILocation(line: 70, column: 10, scope: !44)
!72 = !DILocation(line: 70, column: 5, scope: !44)
!73 = !DILocation(line: 71, column: 1, scope: !44)