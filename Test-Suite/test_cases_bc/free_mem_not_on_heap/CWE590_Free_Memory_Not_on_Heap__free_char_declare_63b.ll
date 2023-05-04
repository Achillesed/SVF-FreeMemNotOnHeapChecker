; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_63b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_63b_badSink(i8** noundef %dataPtr) #0 !dbg !10 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !21
  %1 = load i8*, i8** %0, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !20
  %2 = load i8*, i8** %data, align 8, !dbg !23
  call void @printLine(i8* noundef %2), !dbg !24
  %3 = load i8*, i8** %data, align 8, !dbg !25
  call void @free(i8* noundef %3) #4, !dbg !26
  ret void, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_63b_goodG2BSink(i8** noundef %dataPtr) #0 !dbg !28 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i8** %data, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !33
  %1 = load i8*, i8** %0, align 8, !dbg !34
  store i8* %1, i8** %data, align 8, !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !35
  call void @printLine(i8* noundef %2), !dbg !36
  %3 = load i8*, i8** %data, align 8, !dbg !37
  call void @free(i8* noundef %3) #4, !dbg !38
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_63b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "444923dd967b31803315fc44c778bc33")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_63b_badSink", scope: !1, file: !1, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !{}
!17 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !10, file: !1, line: 23, type: !13)
!18 = !DILocation(line: 23, column: 77, scope: !10)
!19 = !DILocalVariable(name: "data", scope: !10, file: !1, line: 25, type: !14)
!20 = !DILocation(line: 25, column: 12, scope: !10)
!21 = !DILocation(line: 25, column: 20, scope: !10)
!22 = !DILocation(line: 25, column: 19, scope: !10)
!23 = !DILocation(line: 26, column: 15, scope: !10)
!24 = !DILocation(line: 26, column: 5, scope: !10)
!25 = !DILocation(line: 28, column: 10, scope: !10)
!26 = !DILocation(line: 28, column: 5, scope: !10)
!27 = !DILocation(line: 29, column: 1, scope: !10)
!28 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_63b_goodG2BSink", scope: !1, file: !1, line: 36, type: !11, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!29 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !28, file: !1, line: 36, type: !13)
!30 = !DILocation(line: 36, column: 81, scope: !28)
!31 = !DILocalVariable(name: "data", scope: !28, file: !1, line: 38, type: !14)
!32 = !DILocation(line: 38, column: 12, scope: !28)
!33 = !DILocation(line: 38, column: 20, scope: !28)
!34 = !DILocation(line: 38, column: 19, scope: !28)
!35 = !DILocation(line: 39, column: 15, scope: !28)
!36 = !DILocation(line: 39, column: 5, scope: !28)
!37 = !DILocation(line: 41, column: 10, scope: !28)
!38 = !DILocation(line: 41, column: 5, scope: !28)
!39 = !DILocation(line: 42, column: 1, scope: !28)
