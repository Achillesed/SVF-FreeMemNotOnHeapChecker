; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_31.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_31_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_31_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  %call = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_31_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !29
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_31_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !31
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_31_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !33, metadata !DIExpression()), !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  store i32* %0, i32** %dataCopy, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !37, metadata !DIExpression()), !dbg !38
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !39
  store i32* %1, i32** %data1, align 8, !dbg !38
  %2 = load i32*, i32** %data1, align 8, !dbg !40
  call void @printWLine(i32* noundef %2), !dbg !41
  %3 = load i32*, i32** %data1, align 8, !dbg !42
  %4 = bitcast i32* %3 to i8*, !dbg !42
  call void @free(i8* noundef %4) #5, !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_31_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !48 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !49, metadata !DIExpression()), !dbg !50
  store i32* null, i32** %data, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !52, metadata !DIExpression()), !dbg !54
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !55
  %0 = bitcast i8* %call to i32*, !dbg !56
  store i32* %0, i32** %dataBuffer, align 8, !dbg !54
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !57
  %cmp = icmp eq i32* %1, null, !dbg !59
  br i1 %cmp, label %if.then, label %if.end, !dbg !60

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @exit(i32 noundef 1) #6, !dbg !63
  unreachable, !dbg !63

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !64
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !65
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !66
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !66
  store i32 0, i32* %arrayidx, align 4, !dbg !67
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !68
  store i32* %4, i32** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !70, metadata !DIExpression()), !dbg !72
  %5 = load i32*, i32** %data, align 8, !dbg !73
  store i32* %5, i32** %dataCopy, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !74, metadata !DIExpression()), !dbg !75
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !76
  store i32* %6, i32** %data2, align 8, !dbg !75
  %7 = load i32*, i32** %data2, align 8, !dbg !77
  call void @printWLine(i32* noundef %7), !dbg !78
  %8 = load i32*, i32** %data2, align 8, !dbg !79
  %9 = bitcast i32* %8 to i8*, !dbg !79
  call void @free(i8* noundef %9) #5, !dbg !80
  ret void, !dbg !81
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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 29, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_31_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_31.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "83e4830e0299b8629eabd3178dc6d873")
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
!29 = !DILocation(line: 30, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !2, file: !3, line: 27, column: 5)
!31 = !DILocation(line: 31, column: 27, scope: !30)
!32 = !DILocation(line: 32, column: 14, scope: !30)
!33 = !DILocalVariable(name: "dataCopy", scope: !34, file: !3, line: 35, type: !8)
!34 = distinct !DILexicalBlock(scope: !2, file: !3, line: 34, column: 5)
!35 = !DILocation(line: 35, column: 19, scope: !34)
!36 = !DILocation(line: 35, column: 30, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !3, line: 36, type: !8)
!38 = !DILocation(line: 36, column: 19, scope: !34)
!39 = !DILocation(line: 36, column: 26, scope: !34)
!40 = !DILocation(line: 37, column: 20, scope: !34)
!41 = !DILocation(line: 37, column: 9, scope: !34)
!42 = !DILocation(line: 39, column: 14, scope: !34)
!43 = !DILocation(line: 39, column: 9, scope: !34)
!44 = !DILocation(line: 41, column: 1, scope: !2)
!45 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_31_good", scope: !3, file: !3, line: 73, type: !4, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!46 = !DILocation(line: 75, column: 5, scope: !45)
!47 = !DILocation(line: 76, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 48, type: !4, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!49 = !DILocalVariable(name: "data", scope: !48, file: !3, line: 50, type: !8)
!50 = !DILocation(line: 50, column: 15, scope: !48)
!51 = !DILocation(line: 51, column: 10, scope: !48)
!52 = !DILocalVariable(name: "dataBuffer", scope: !53, file: !3, line: 54, type: !8)
!53 = distinct !DILexicalBlock(scope: !48, file: !3, line: 52, column: 5)
!54 = !DILocation(line: 54, column: 19, scope: !53)
!55 = !DILocation(line: 54, column: 43, scope: !53)
!56 = !DILocation(line: 54, column: 32, scope: !53)
!57 = !DILocation(line: 55, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !3, line: 55, column: 13)
!59 = !DILocation(line: 55, column: 24, scope: !58)
!60 = !DILocation(line: 55, column: 13, scope: !53)
!61 = !DILocation(line: 57, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !3, line: 56, column: 9)
!63 = !DILocation(line: 58, column: 13, scope: !62)
!64 = !DILocation(line: 60, column: 17, scope: !53)
!65 = !DILocation(line: 60, column: 9, scope: !53)
!66 = !DILocation(line: 61, column: 9, scope: !53)
!67 = !DILocation(line: 61, column: 27, scope: !53)
!68 = !DILocation(line: 62, column: 16, scope: !53)
!69 = !DILocation(line: 62, column: 14, scope: !53)
!70 = !DILocalVariable(name: "dataCopy", scope: !71, file: !3, line: 65, type: !8)
!71 = distinct !DILexicalBlock(scope: !48, file: !3, line: 64, column: 5)
!72 = !DILocation(line: 65, column: 19, scope: !71)
!73 = !DILocation(line: 65, column: 30, scope: !71)
!74 = !DILocalVariable(name: "data", scope: !71, file: !3, line: 66, type: !8)
!75 = !DILocation(line: 66, column: 19, scope: !71)
!76 = !DILocation(line: 66, column: 26, scope: !71)
!77 = !DILocation(line: 67, column: 20, scope: !71)
!78 = !DILocation(line: 67, column: 9, scope: !71)
!79 = !DILocation(line: 69, column: 14, scope: !71)
!80 = !DILocation(line: 69, column: 9, scope: !71)
!81 = !DILocation(line: 71, column: 1, scope: !48)
