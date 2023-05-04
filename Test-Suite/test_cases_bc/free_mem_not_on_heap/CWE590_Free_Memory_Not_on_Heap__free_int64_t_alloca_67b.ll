; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType = type { i64* }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67b_badSink(i64* %myStruct.coerce) #0 !dbg !10 {
entry:
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType, align 8
  %data = alloca i64*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType* %myStruct, i32 0, i32 0
  store i64* %myStruct.coerce, i64** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType* %myStruct, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i64** %data, metadata !26, metadata !DIExpression()), !dbg !27
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !28
  %0 = load i64*, i64** %structFirst, align 8, !dbg !28
  store i64* %0, i64** %data, align 8, !dbg !27
  %1 = load i64*, i64** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 0, !dbg !29
  %2 = load i64, i64* %arrayidx, align 8, !dbg !29
  call void @printLongLongLine(i64 noundef %2), !dbg !30
  %3 = load i64*, i64** %data, align 8, !dbg !31
  %4 = bitcast i64* %3 to i8*, !dbg !31
  call void @free(i8* noundef %4) #4, !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67b_goodG2BSink(i64* %myStruct.coerce) #0 !dbg !34 {
entry:
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType, align 8
  %data = alloca i64*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType* %myStruct, i32 0, i32 0
  store i64* %myStruct.coerce, i64** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType* %myStruct, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i64** %data, metadata !37, metadata !DIExpression()), !dbg !38
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !39
  %0 = load i64*, i64** %structFirst, align 8, !dbg !39
  store i64* %0, i64** %data, align 8, !dbg !38
  %1 = load i64*, i64** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 0, !dbg !40
  %2 = load i64, i64* %arrayidx, align 8, !dbg !40
  call void @printLongLongLine(i64 noundef %2), !dbg !41
  %3 = load i64*, i64** %data, align 8, !dbg !42
  %4 = bitcast i64* %3 to i8*, !dbg !42
  call void @free(i8* noundef %4) #4, !dbg !43
  ret void, !dbg !44
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "60cf4789bd2001e3bbbf79f2d4a11d68")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67b_badSink", scope: !1, file: !1, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType", file: !1, line: 24, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67_structType", file: !1, line: 21, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !1, line: 23, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !19, line: 27, baseType: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !21, line: 44, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!22 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!23 = !{}
!24 = !DILocalVariable(name: "myStruct", arg: 1, scope: !10, file: !1, line: 28, type: !13)
!25 = !DILocation(line: 28, column: 136, scope: !10)
!26 = !DILocalVariable(name: "data", scope: !10, file: !1, line: 30, type: !17)
!27 = !DILocation(line: 30, column: 15, scope: !10)
!28 = !DILocation(line: 30, column: 31, scope: !10)
!29 = !DILocation(line: 31, column: 23, scope: !10)
!30 = !DILocation(line: 31, column: 5, scope: !10)
!31 = !DILocation(line: 33, column: 10, scope: !10)
!32 = !DILocation(line: 33, column: 5, scope: !10)
!33 = !DILocation(line: 34, column: 1, scope: !10)
!34 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_67b_goodG2BSink", scope: !1, file: !1, line: 41, type: !11, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!35 = !DILocalVariable(name: "myStruct", arg: 1, scope: !34, file: !1, line: 41, type: !13)
!36 = !DILocation(line: 41, column: 140, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !1, line: 43, type: !17)
!38 = !DILocation(line: 43, column: 15, scope: !34)
!39 = !DILocation(line: 43, column: 31, scope: !34)
!40 = !DILocation(line: 44, column: 23, scope: !34)
!41 = !DILocation(line: 44, column: 5, scope: !34)
!42 = !DILocation(line: 46, column: 10, scope: !34)
!43 = !DILocation(line: 46, column: 5, scope: !34)
!44 = !DILocation(line: 47, column: 1, scope: !34)
