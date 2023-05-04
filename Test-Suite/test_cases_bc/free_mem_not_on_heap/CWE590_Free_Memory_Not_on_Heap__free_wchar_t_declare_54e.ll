; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_54e.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_54e.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_54e_badSink(i32* noundef %data) #0 !dbg !10 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32*, i32** %data.addr, align 8, !dbg !20
  call void @printWLine(i32* noundef %0), !dbg !21
  %1 = load i32*, i32** %data.addr, align 8, !dbg !22
  %2 = bitcast i32* %1 to i8*, !dbg !22
  call void @free(i8* noundef %2) #4, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_54e_goodG2BSink(i32* noundef %data) #0 !dbg !25 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i32*, i32** %data.addr, align 8, !dbg !28
  call void @printWLine(i32* noundef %0), !dbg !29
  %1 = load i32*, i32** %data.addr, align 8, !dbg !30
  %2 = bitcast i32* %1 to i8*, !dbg !30
  call void @free(i8* noundef %2) #4, !dbg !31
  ret void, !dbg !32
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_54e.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "cede790b908d51539e07b2317564c7cb")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_54e_badSink", scope: !1, file: !1, line: 25, type: !11, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !15, line: 74, baseType: !16)
!15 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !{}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !10, file: !1, line: 25, type: !13)
!19 = !DILocation(line: 25, column: 81, scope: !10)
!20 = !DILocation(line: 27, column: 16, scope: !10)
!21 = !DILocation(line: 27, column: 5, scope: !10)
!22 = !DILocation(line: 29, column: 10, scope: !10)
!23 = !DILocation(line: 29, column: 5, scope: !10)
!24 = !DILocation(line: 30, column: 1, scope: !10)
!25 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_54e_goodG2BSink", scope: !1, file: !1, line: 37, type: !11, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!26 = !DILocalVariable(name: "data", arg: 1, scope: !25, file: !1, line: 37, type: !13)
!27 = !DILocation(line: 37, column: 85, scope: !25)
!28 = !DILocation(line: 39, column: 16, scope: !25)
!29 = !DILocation(line: 39, column: 5, scope: !25)
!30 = !DILocation(line: 41, column: 10, scope: !25)
!31 = !DILocation(line: 41, column: 5, scope: !25)
!32 = !DILocation(line: 42, column: 1, scope: !25)
