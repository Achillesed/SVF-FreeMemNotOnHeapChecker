; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66b_badSink(i64** noundef %dataArray) #0 !dbg !10 {
entry:
  %dataArray.addr = alloca i64**, align 8
  %data = alloca i64*, align 8
  store i64** %dataArray, i64*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i64*** %dataArray.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i64** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = load i64**, i64*** %dataArray.addr, align 8, !dbg !25
  %arrayidx = getelementptr inbounds i64*, i64** %0, i64 2, !dbg !25
  %1 = load i64*, i64** %arrayidx, align 8, !dbg !25
  store i64* %1, i64** %data, align 8, !dbg !24
  %2 = load i64*, i64** %data, align 8, !dbg !26
  %arrayidx1 = getelementptr inbounds i64, i64* %2, i64 0, !dbg !26
  %3 = load i64, i64* %arrayidx1, align 8, !dbg !26
  call void @printLongLongLine(i64 noundef %3), !dbg !27
  %4 = load i64*, i64** %data, align 8, !dbg !28
  %5 = bitcast i64* %4 to i8*, !dbg !28
  call void @free(i8* noundef %5) #4, !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66b_goodG2BSink(i64** noundef %dataArray) #0 !dbg !31 {
entry:
  %dataArray.addr = alloca i64**, align 8
  %data = alloca i64*, align 8
  store i64** %dataArray, i64*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i64*** %dataArray.addr, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i64** %data, metadata !34, metadata !DIExpression()), !dbg !35
  %0 = load i64**, i64*** %dataArray.addr, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i64*, i64** %0, i64 2, !dbg !36
  %1 = load i64*, i64** %arrayidx, align 8, !dbg !36
  store i64* %1, i64** %data, align 8, !dbg !35
  %2 = load i64*, i64** %data, align 8, !dbg !37
  %arrayidx1 = getelementptr inbounds i64, i64* %2, i64 0, !dbg !37
  %3 = load i64, i64* %arrayidx1, align 8, !dbg !37
  call void @printLongLongLine(i64 noundef %3), !dbg !38
  %4 = load i64*, i64** %data, align 8, !dbg !39
  %5 = bitcast i64* %4 to i8*, !dbg !39
  call void @free(i8* noundef %5) #4, !dbg !40
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "5f28116fdc2dd5dacd8b192102f6d14e")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66b_badSink", scope: !1, file: !1, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !16, line: 27, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !18, line: 44, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!19 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!20 = !{}
!21 = !DILocalVariable(name: "dataArray", arg: 1, scope: !10, file: !1, line: 23, type: !13)
!22 = !DILocation(line: 23, column: 80, scope: !10)
!23 = !DILocalVariable(name: "data", scope: !10, file: !1, line: 26, type: !14)
!24 = !DILocation(line: 26, column: 15, scope: !10)
!25 = !DILocation(line: 26, column: 22, scope: !10)
!26 = !DILocation(line: 27, column: 23, scope: !10)
!27 = !DILocation(line: 27, column: 5, scope: !10)
!28 = !DILocation(line: 29, column: 10, scope: !10)
!29 = !DILocation(line: 29, column: 5, scope: !10)
!30 = !DILocation(line: 30, column: 1, scope: !10)
!31 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_66b_goodG2BSink", scope: !1, file: !1, line: 37, type: !11, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!32 = !DILocalVariable(name: "dataArray", arg: 1, scope: !31, file: !1, line: 37, type: !13)
!33 = !DILocation(line: 37, column: 84, scope: !31)
!34 = !DILocalVariable(name: "data", scope: !31, file: !1, line: 39, type: !14)
!35 = !DILocation(line: 39, column: 15, scope: !31)
!36 = !DILocation(line: 39, column: 22, scope: !31)
!37 = !DILocation(line: 40, column: 23, scope: !31)
!38 = !DILocation(line: 40, column: 5, scope: !31)
!39 = !DILocation(line: 42, column: 10, scope: !31)
!40 = !DILocation(line: 42, column: 5, scope: !31)
!41 = !DILocation(line: 43, column: 1, scope: !31)
