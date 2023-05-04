; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63b_badSink(i32** noundef %dataPtr) #0 !dbg !10 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !23
  %1 = load i32*, i32** %0, align 8, !dbg !24
  store i32* %1, i32** %data, align 8, !dbg !22
  %2 = load i32*, i32** %data, align 8, !dbg !25
  call void @printWLine(i32* noundef %2), !dbg !26
  %3 = load i32*, i32** %data, align 8, !dbg !27
  %4 = bitcast i32* %3 to i8*, !dbg !27
  call void @free(i8* noundef %4) #4, !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63b_goodG2BSink(i32** noundef %dataPtr) #0 !dbg !30 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i32** %data, metadata !33, metadata !DIExpression()), !dbg !34
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !35
  %1 = load i32*, i32** %0, align 8, !dbg !36
  store i32* %1, i32** %data, align 8, !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !37
  call void @printWLine(i32* noundef %2), !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %4 = bitcast i32* %3 to i8*, !dbg !39
  call void @free(i8* noundef %4) #4, !dbg !40
  ret void, !dbg !41
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "3cb7b7643ec58aeb72a24fef15e3ed82")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63b_badSink", scope: !1, file: !1, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !{}
!19 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !10, file: !1, line: 23, type: !13)
!20 = !DILocation(line: 23, column: 82, scope: !10)
!21 = !DILocalVariable(name: "data", scope: !10, file: !1, line: 25, type: !14)
!22 = !DILocation(line: 25, column: 15, scope: !10)
!23 = !DILocation(line: 25, column: 23, scope: !10)
!24 = !DILocation(line: 25, column: 22, scope: !10)
!25 = !DILocation(line: 26, column: 16, scope: !10)
!26 = !DILocation(line: 26, column: 5, scope: !10)
!27 = !DILocation(line: 28, column: 10, scope: !10)
!28 = !DILocation(line: 28, column: 5, scope: !10)
!29 = !DILocation(line: 29, column: 1, scope: !10)
!30 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63b_goodG2BSink", scope: !1, file: !1, line: 36, type: !11, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!31 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !30, file: !1, line: 36, type: !13)
!32 = !DILocation(line: 36, column: 86, scope: !30)
!33 = !DILocalVariable(name: "data", scope: !30, file: !1, line: 38, type: !14)
!34 = !DILocation(line: 38, column: 15, scope: !30)
!35 = !DILocation(line: 38, column: 23, scope: !30)
!36 = !DILocation(line: 38, column: 22, scope: !30)
!37 = !DILocation(line: 39, column: 16, scope: !30)
!38 = !DILocation(line: 39, column: 5, scope: !30)
!39 = !DILocation(line: 41, column: 10, scope: !30)
!40 = !DILocation(line: 41, column: 5, scope: !30)
!41 = !DILocation(line: 42, column: 1, scope: !30)
