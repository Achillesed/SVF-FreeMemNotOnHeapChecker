; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66b_badSink(i32** noundef %dataArray) #0 !dbg !10 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !23
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !23
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !23
  store i32* %1, i32** %data, align 8, !dbg !22
  %2 = load i32*, i32** %data, align 8, !dbg !24
  call void @printWLine(i32* noundef %2), !dbg !25
  %3 = load i32*, i32** %data, align 8, !dbg !26
  %4 = bitcast i32* %3 to i8*, !dbg !26
  call void @free(i8* noundef %4) #4, !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66b_goodG2BSink(i32** noundef %dataArray) #0 !dbg !29 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i32** %data, metadata !32, metadata !DIExpression()), !dbg !33
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !34
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !34
  store i32* %1, i32** %data, align 8, !dbg !33
  %2 = load i32*, i32** %data, align 8, !dbg !35
  call void @printWLine(i32* noundef %2), !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %4 = bitcast i32* %3 to i8*, !dbg !37
  call void @free(i8* noundef %4) #4, !dbg !38
  ret void, !dbg !39
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "e2f5b49e85a559aeea30af2d5e33e69b")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66b_badSink", scope: !1, file: !1, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !{}
!19 = !DILocalVariable(name: "dataArray", arg: 1, scope: !10, file: !1, line: 23, type: !13)
!20 = !DILocation(line: 23, column: 80, scope: !10)
!21 = !DILocalVariable(name: "data", scope: !10, file: !1, line: 26, type: !14)
!22 = !DILocation(line: 26, column: 15, scope: !10)
!23 = !DILocation(line: 26, column: 22, scope: !10)
!24 = !DILocation(line: 27, column: 16, scope: !10)
!25 = !DILocation(line: 27, column: 5, scope: !10)
!26 = !DILocation(line: 29, column: 10, scope: !10)
!27 = !DILocation(line: 29, column: 5, scope: !10)
!28 = !DILocation(line: 30, column: 1, scope: !10)
!29 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66b_goodG2BSink", scope: !1, file: !1, line: 37, type: !11, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!30 = !DILocalVariable(name: "dataArray", arg: 1, scope: !29, file: !1, line: 37, type: !13)
!31 = !DILocation(line: 37, column: 84, scope: !29)
!32 = !DILocalVariable(name: "data", scope: !29, file: !1, line: 39, type: !14)
!33 = !DILocation(line: 39, column: 15, scope: !29)
!34 = !DILocation(line: 39, column: 22, scope: !29)
!35 = !DILocation(line: 40, column: 16, scope: !29)
!36 = !DILocation(line: 40, column: 5, scope: !29)
!37 = !DILocation(line: 42, column: 10, scope: !29)
!38 = !DILocation(line: 42, column: 5, scope: !29)
!39 = !DILocation(line: 43, column: 1, scope: !29)