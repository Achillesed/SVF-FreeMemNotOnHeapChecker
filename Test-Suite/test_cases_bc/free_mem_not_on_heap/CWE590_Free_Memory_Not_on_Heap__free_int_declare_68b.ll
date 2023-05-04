; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_declare_68b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_declare_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int_declare_68_badData = external global i32*, align 8
@CWE590_Free_Memory_Not_on_Heap__free_int_declare_68_goodG2BData = external global i32*, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_68b_badSink() #0 !dbg !10 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !14, metadata !DIExpression()), !dbg !17
  %0 = load i32*, i32** @CWE590_Free_Memory_Not_on_Heap__free_int_declare_68_badData, align 8, !dbg !18
  store i32* %0, i32** %data, align 8, !dbg !17
  %1 = load i32*, i32** %data, align 8, !dbg !19
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !19
  %2 = load i32, i32* %arrayidx, align 4, !dbg !19
  call void @printIntLine(i32 noundef %2), !dbg !20
  %3 = load i32*, i32** %data, align 8, !dbg !21
  %4 = bitcast i32* %3 to i8*, !dbg !21
  call void @free(i8* noundef %4) #4, !dbg !22
  ret void, !dbg !23
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_declare_68b_goodG2BSink() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = load i32*, i32** @CWE590_Free_Memory_Not_on_Heap__free_int_declare_68_goodG2BData, align 8, !dbg !27
  store i32* %0, i32** %data, align 8, !dbg !26
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !28
  %2 = load i32, i32* %arrayidx, align 4, !dbg !28
  call void @printIntLine(i32 noundef %2), !dbg !29
  %3 = load i32*, i32** %data, align 8, !dbg !30
  %4 = bitcast i32* %3 to i8*, !dbg !30
  call void @free(i8* noundef %4) #4, !dbg !31
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_68b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "098cad64550a415278838dc5cd86da3c")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_68b_badSink", scope: !1, file: !1, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocalVariable(name: "data", scope: !10, file: !1, line: 30, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 30, column: 11, scope: !10)
!18 = !DILocation(line: 30, column: 18, scope: !10)
!19 = !DILocation(line: 31, column: 18, scope: !10)
!20 = !DILocation(line: 31, column: 5, scope: !10)
!21 = !DILocation(line: 33, column: 10, scope: !10)
!22 = !DILocation(line: 33, column: 5, scope: !10)
!23 = !DILocation(line: 34, column: 1, scope: !10)
!24 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_declare_68b_goodG2BSink", scope: !1, file: !1, line: 41, type: !11, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!25 = !DILocalVariable(name: "data", scope: !24, file: !1, line: 43, type: !15)
!26 = !DILocation(line: 43, column: 11, scope: !24)
!27 = !DILocation(line: 43, column: 18, scope: !24)
!28 = !DILocation(line: 44, column: 18, scope: !24)
!29 = !DILocation(line: 44, column: 5, scope: !24)
!30 = !DILocation(line: 46, column: 10, scope: !24)
!31 = !DILocation(line: 46, column: 5, scope: !24)
!32 = !DILocation(line: 47, column: 1, scope: !24)
