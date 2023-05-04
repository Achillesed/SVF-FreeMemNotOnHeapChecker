; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_static_53c.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_static_53c.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_static_53c_badSink(i64* noundef %data) #0 !dbg !10 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = load i64*, i64** %data.addr, align 8, !dbg !18
  call void @CWE590_Free_Memory_Not_on_Heap__free_long_static_53d_badSink(i64* noundef %0), !dbg !19
  ret void, !dbg !20
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_long_static_53d_badSink(i64* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_static_53c_goodG2BSink(i64* noundef %data) #0 !dbg !21 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i64*, i64** %data.addr, align 8, !dbg !24
  call void @CWE590_Free_Memory_Not_on_Heap__free_long_static_53d_goodG2BSink(i64* noundef %0), !dbg !25
  ret void, !dbg !26
}

declare void @CWE590_Free_Memory_Not_on_Heap__free_long_static_53d_goodG2BSink(i64* noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_static_53c.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "6f043f141962a5a91bf4e3689d27fcb7")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_53c_badSink", scope: !1, file: !1, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!15 = !{}
!16 = !DILocalVariable(name: "data", arg: 1, scope: !10, file: !1, line: 28, type: !13)
!17 = !DILocation(line: 28, column: 74, scope: !10)
!18 = !DILocation(line: 30, column: 66, scope: !10)
!19 = !DILocation(line: 30, column: 5, scope: !10)
!20 = !DILocation(line: 31, column: 1, scope: !10)
!21 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_static_53c_goodG2BSink", scope: !1, file: !1, line: 41, type: !11, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!22 = !DILocalVariable(name: "data", arg: 1, scope: !21, file: !1, line: 41, type: !13)
!23 = !DILocation(line: 41, column: 78, scope: !21)
!24 = !DILocation(line: 43, column: 70, scope: !21)
!25 = !DILocation(line: 43, column: 5, scope: !21)
!26 = !DILocation(line: 44, column: 1, scope: !21)
