; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65b_badSink(i64* noundef %data) #0 !dbg !10 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i64*, i64** %data.addr, align 8, !dbg !22
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0, !dbg !22
  %1 = load i64, i64* %arrayidx, align 8, !dbg !22
  call void @printLongLongLine(i64 noundef %1), !dbg !23
  %2 = load i64*, i64** %data.addr, align 8, !dbg !24
  %3 = bitcast i64* %2 to i8*, !dbg !24
  call void @free(i8* noundef %3) #4, !dbg !25
  ret void, !dbg !26
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65b_goodG2BSink(i64* noundef %data) #0 !dbg !27 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = load i64*, i64** %data.addr, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0, !dbg !30
  %1 = load i64, i64* %arrayidx, align 8, !dbg !30
  call void @printLongLongLine(i64 noundef %1), !dbg !31
  %2 = load i64*, i64** %data.addr, align 8, !dbg !32
  %3 = bitcast i64* %2 to i8*, !dbg !32
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "0b2db9e3d6f57d801222a46c79a63919")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65b_badSink", scope: !1, file: !1, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !15, line: 27, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !17, line: 44, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!18 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!19 = !{}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !10, file: !1, line: 23, type: !13)
!21 = !DILocation(line: 23, column: 81, scope: !10)
!22 = !DILocation(line: 25, column: 23, scope: !10)
!23 = !DILocation(line: 25, column: 5, scope: !10)
!24 = !DILocation(line: 27, column: 10, scope: !10)
!25 = !DILocation(line: 27, column: 5, scope: !10)
!26 = !DILocation(line: 28, column: 1, scope: !10)
!27 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65b_goodG2BSink", scope: !1, file: !1, line: 35, type: !11, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!28 = !DILocalVariable(name: "data", arg: 1, scope: !27, file: !1, line: 35, type: !13)
!29 = !DILocation(line: 35, column: 85, scope: !27)
!30 = !DILocation(line: 37, column: 23, scope: !27)
!31 = !DILocation(line: 37, column: 5, scope: !27)
!32 = !DILocation(line: 39, column: 10, scope: !27)
!33 = !DILocation(line: 39, column: 5, scope: !27)
!34 = !DILocation(line: 40, column: 1, scope: !27)
