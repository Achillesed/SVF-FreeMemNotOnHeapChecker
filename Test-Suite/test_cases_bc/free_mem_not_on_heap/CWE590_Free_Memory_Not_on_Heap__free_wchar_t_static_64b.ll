; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_64b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_64b_badSink(i8* noundef %dataVoidPtr) #0 !dbg !16 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !25
  %1 = bitcast i8* %0 to i32**, !dbg !26
  store i32** %1, i32*** %dataPtr, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !29
  %3 = load i32*, i32** %2, align 8, !dbg !30
  store i32* %3, i32** %data, align 8, !dbg !28
  %4 = load i32*, i32** %data, align 8, !dbg !31
  call void @printWLine(i32* noundef %4), !dbg !32
  %5 = load i32*, i32** %data, align 8, !dbg !33
  %6 = bitcast i32* %5 to i8*, !dbg !33
  call void @free(i8* noundef %6) #4, !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_64b_goodG2BSink(i8* noundef %dataVoidPtr) #0 !dbg !36 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !39, metadata !DIExpression()), !dbg !40
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !41
  %1 = bitcast i8* %0 to i32**, !dbg !42
  store i32** %1, i32*** %dataPtr, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32** %data, metadata !43, metadata !DIExpression()), !dbg !44
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !45
  %3 = load i32*, i32** %2, align 8, !dbg !46
  store i32* %3, i32** %data, align 8, !dbg !44
  %4 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* noundef %4), !dbg !48
  %5 = load i32*, i32** %data, align 8, !dbg !49
  %6 = bitcast i32* %5 to i8*, !dbg !49
  call void @free(i8* noundef %6) #4, !dbg !50
  ret void, !dbg !51
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_64b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "574900a0801d4938634655db06cee583")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 5}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{i32 7, !"PIE Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_64b_badSink", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !{}
!21 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !16, file: !1, line: 23, type: !19)
!22 = !DILocation(line: 23, column: 77, scope: !16)
!23 = !DILocalVariable(name: "dataPtr", scope: !16, file: !1, line: 26, type: !3)
!24 = !DILocation(line: 26, column: 17, scope: !16)
!25 = !DILocation(line: 26, column: 40, scope: !16)
!26 = !DILocation(line: 26, column: 27, scope: !16)
!27 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 28, type: !4)
!28 = !DILocation(line: 28, column: 15, scope: !16)
!29 = !DILocation(line: 28, column: 24, scope: !16)
!30 = !DILocation(line: 28, column: 23, scope: !16)
!31 = !DILocation(line: 29, column: 16, scope: !16)
!32 = !DILocation(line: 29, column: 5, scope: !16)
!33 = !DILocation(line: 31, column: 10, scope: !16)
!34 = !DILocation(line: 31, column: 5, scope: !16)
!35 = !DILocation(line: 32, column: 1, scope: !16)
!36 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_64b_goodG2BSink", scope: !1, file: !1, line: 39, type: !17, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!37 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !36, file: !1, line: 39, type: !19)
!38 = !DILocation(line: 39, column: 81, scope: !36)
!39 = !DILocalVariable(name: "dataPtr", scope: !36, file: !1, line: 42, type: !3)
!40 = !DILocation(line: 42, column: 17, scope: !36)
!41 = !DILocation(line: 42, column: 40, scope: !36)
!42 = !DILocation(line: 42, column: 27, scope: !36)
!43 = !DILocalVariable(name: "data", scope: !36, file: !1, line: 44, type: !4)
!44 = !DILocation(line: 44, column: 15, scope: !36)
!45 = !DILocation(line: 44, column: 24, scope: !36)
!46 = !DILocation(line: 44, column: 23, scope: !36)
!47 = !DILocation(line: 45, column: 16, scope: !36)
!48 = !DILocation(line: 45, column: 5, scope: !36)
!49 = !DILocation(line: 47, column: 10, scope: !36)
!50 = !DILocation(line: 47, column: 5, scope: !36)
!51 = !DILocation(line: 48, column: 1, scope: !36)
