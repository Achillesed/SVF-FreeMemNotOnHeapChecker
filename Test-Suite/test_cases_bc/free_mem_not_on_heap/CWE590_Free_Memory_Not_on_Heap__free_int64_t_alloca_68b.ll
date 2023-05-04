; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68_badData = external global i64*, align 8
@CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68_goodG2BData = external global i64*, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68b_badSink() #0 !dbg !10 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !14, metadata !DIExpression()), !dbg !21
  %0 = load i64*, i64** @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68_badData, align 8, !dbg !22
  store i64* %0, i64** %data, align 8, !dbg !21
  %1 = load i64*, i64** %data, align 8, !dbg !23
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 0, !dbg !23
  %2 = load i64, i64* %arrayidx, align 8, !dbg !23
  call void @printLongLongLine(i64 noundef %2), !dbg !24
  %3 = load i64*, i64** %data, align 8, !dbg !25
  %4 = bitcast i64* %3 to i8*, !dbg !25
  call void @free(i8* noundef %4) #4, !dbg !26
  ret void, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68b_goodG2BSink() #0 !dbg !28 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = load i64*, i64** @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68_goodG2BData, align 8, !dbg !31
  store i64* %0, i64** %data, align 8, !dbg !30
  %1 = load i64*, i64** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 0, !dbg !32
  %2 = load i64, i64* %arrayidx, align 8, !dbg !32
  call void @printLongLongLine(i64 noundef %2), !dbg !33
  %3 = load i64*, i64** %data, align 8, !dbg !34
  %4 = bitcast i64* %3 to i8*, !dbg !34
  call void @free(i8* noundef %4) #4, !dbg !35
  ret void, !dbg !36
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1abecafe8941e4027e2937e8e7222666")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68b_badSink", scope: !1, file: !1, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocalVariable(name: "data", scope: !10, file: !1, line: 30, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !17, line: 27, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !19, line: 44, baseType: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!20 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!21 = !DILocation(line: 30, column: 15, scope: !10)
!22 = !DILocation(line: 30, column: 22, scope: !10)
!23 = !DILocation(line: 31, column: 23, scope: !10)
!24 = !DILocation(line: 31, column: 5, scope: !10)
!25 = !DILocation(line: 33, column: 10, scope: !10)
!26 = !DILocation(line: 33, column: 5, scope: !10)
!27 = !DILocation(line: 34, column: 1, scope: !10)
!28 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_68b_goodG2BSink", scope: !1, file: !1, line: 41, type: !11, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!29 = !DILocalVariable(name: "data", scope: !28, file: !1, line: 43, type: !15)
!30 = !DILocation(line: 43, column: 15, scope: !28)
!31 = !DILocation(line: 43, column: 22, scope: !28)
!32 = !DILocation(line: 44, column: 23, scope: !28)
!33 = !DILocation(line: 44, column: 5, scope: !28)
!34 = !DILocation(line: 46, column: 10, scope: !28)
!35 = !DILocation(line: 46, column: 5, scope: !28)
!36 = !DILocation(line: 47, column: 1, scope: !28)
