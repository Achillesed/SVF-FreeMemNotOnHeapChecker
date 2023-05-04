; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_static_64b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_static_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_64b_badSink(i8* noundef %dataVoidPtr) #0 !dbg !14 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !23
  %1 = bitcast i8* %0 to i8**, !dbg !24
  store i8** %1, i8*** %dataPtr, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !27
  %3 = load i8*, i8** %2, align 8, !dbg !28
  store i8* %3, i8** %data, align 8, !dbg !26
  %4 = load i8*, i8** %data, align 8, !dbg !29
  call void @printLine(i8* noundef %4), !dbg !30
  %5 = load i8*, i8** %data, align 8, !dbg !31
  call void @free(i8* noundef %5) #4, !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_64b_goodG2BSink(i8* noundef %dataVoidPtr) #0 !dbg !34 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i8**, align 8
  %data = alloca i8*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i8*** %dataPtr, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !39
  %1 = bitcast i8* %0 to i8**, !dbg !40
  store i8** %1, i8*** %dataPtr, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i8** %data, metadata !41, metadata !DIExpression()), !dbg !42
  %2 = load i8**, i8*** %dataPtr, align 8, !dbg !43
  %3 = load i8*, i8** %2, align 8, !dbg !44
  store i8* %3, i8** %data, align 8, !dbg !42
  %4 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* noundef %4), !dbg !46
  %5 = load i8*, i8** %data, align 8, !dbg !47
  call void @free(i8* noundef %5) #4, !dbg !48
  ret void, !dbg !49
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_static_64b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "fc429ad34590210d9a2595d5683983da")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_64b_badSink", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !{}
!19 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !14, file: !1, line: 23, type: !17)
!20 = !DILocation(line: 23, column: 74, scope: !14)
!21 = !DILocalVariable(name: "dataPtr", scope: !14, file: !1, line: 26, type: !3)
!22 = !DILocation(line: 26, column: 14, scope: !14)
!23 = !DILocation(line: 26, column: 34, scope: !14)
!24 = !DILocation(line: 26, column: 24, scope: !14)
!25 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 28, type: !4)
!26 = !DILocation(line: 28, column: 12, scope: !14)
!27 = !DILocation(line: 28, column: 21, scope: !14)
!28 = !DILocation(line: 28, column: 20, scope: !14)
!29 = !DILocation(line: 29, column: 15, scope: !14)
!30 = !DILocation(line: 29, column: 5, scope: !14)
!31 = !DILocation(line: 31, column: 10, scope: !14)
!32 = !DILocation(line: 31, column: 5, scope: !14)
!33 = !DILocation(line: 32, column: 1, scope: !14)
!34 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_64b_goodG2BSink", scope: !1, file: !1, line: 39, type: !15, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!35 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !34, file: !1, line: 39, type: !17)
!36 = !DILocation(line: 39, column: 78, scope: !34)
!37 = !DILocalVariable(name: "dataPtr", scope: !34, file: !1, line: 42, type: !3)
!38 = !DILocation(line: 42, column: 14, scope: !34)
!39 = !DILocation(line: 42, column: 34, scope: !34)
!40 = !DILocation(line: 42, column: 24, scope: !34)
!41 = !DILocalVariable(name: "data", scope: !34, file: !1, line: 44, type: !4)
!42 = !DILocation(line: 44, column: 12, scope: !34)
!43 = !DILocation(line: 44, column: 21, scope: !34)
!44 = !DILocation(line: 44, column: 20, scope: !34)
!45 = !DILocation(line: 45, column: 15, scope: !34)
!46 = !DILocation(line: 45, column: 5, scope: !34)
!47 = !DILocation(line: 47, column: 10, scope: !34)
!48 = !DILocation(line: 47, column: 5, scope: !34)
!49 = !DILocation(line: 48, column: 1, scope: !34)
