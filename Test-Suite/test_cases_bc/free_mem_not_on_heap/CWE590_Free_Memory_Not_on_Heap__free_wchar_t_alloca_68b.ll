; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68_badData = external global i32*, align 8
@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68_goodG2BData = external global i32*, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68b_badSink() #0 !dbg !10 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !14, metadata !DIExpression()), !dbg !19
  %0 = load i32*, i32** @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68_badData, align 8, !dbg !20
  store i32* %0, i32** %data, align 8, !dbg !19
  %1 = load i32*, i32** %data, align 8, !dbg !21
  call void @printWLine(i32* noundef %1), !dbg !22
  %2 = load i32*, i32** %data, align 8, !dbg !23
  %3 = bitcast i32* %2 to i8*, !dbg !23
  call void @free(i8* noundef %3) #4, !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68b_goodG2BSink() #0 !dbg !26 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = load i32*, i32** @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68_goodG2BData, align 8, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !28
  %1 = load i32*, i32** %data, align 8, !dbg !30
  call void @printWLine(i32* noundef %1), !dbg !31
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %3 = bitcast i32* %2 to i8*, !dbg !32
  call void @free(i8* noundef %3) #4, !dbg !33
  ret void, !dbg !34
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "26992d24fbda122b47dbdae7b6be9c7d")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68b_badSink", scope: !1, file: !1, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocalVariable(name: "data", scope: !10, file: !1, line: 30, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !17, line: 74, baseType: !18)
!17 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 30, column: 15, scope: !10)
!20 = !DILocation(line: 30, column: 22, scope: !10)
!21 = !DILocation(line: 31, column: 16, scope: !10)
!22 = !DILocation(line: 31, column: 5, scope: !10)
!23 = !DILocation(line: 33, column: 10, scope: !10)
!24 = !DILocation(line: 33, column: 5, scope: !10)
!25 = !DILocation(line: 34, column: 1, scope: !10)
!26 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_68b_goodG2BSink", scope: !1, file: !1, line: 41, type: !11, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!27 = !DILocalVariable(name: "data", scope: !26, file: !1, line: 43, type: !15)
!28 = !DILocation(line: 43, column: 15, scope: !26)
!29 = !DILocation(line: 43, column: 22, scope: !26)
!30 = !DILocation(line: 44, column: 16, scope: !26)
!31 = !DILocation(line: 44, column: 5, scope: !26)
!32 = !DILocation(line: 46, column: 10, scope: !26)
!33 = !DILocation(line: 46, column: 5, scope: !26)
!34 = !DILocation(line: 47, column: 1, scope: !26)
