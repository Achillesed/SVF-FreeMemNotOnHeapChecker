; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_declare_67b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_declare_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._CWE590_Free_Memory_Not_on_Heap__free_long_declare_67_structType = type { i64* }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_declare_67b_badSink(i64* %myStruct.coerce) #0 !dbg !10 {
entry:
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_long_declare_67_structType, align 8
  %data = alloca i64*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_long_declare_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_long_declare_67_structType* %myStruct, i32 0, i32 0
  store i64* %myStruct.coerce, i64** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_long_declare_67_structType* %myStruct, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_long_declare_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_long_declare_67_structType* %myStruct, i32 0, i32 0, !dbg !24
  %0 = load i64*, i64** %structFirst, align 8, !dbg !24
  store i64* %0, i64** %data, align 8, !dbg !23
  %1 = load i64*, i64** %data, align 8, !dbg !25
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 0, !dbg !25
  %2 = load i64, i64* %arrayidx, align 8, !dbg !25
  call void @printLongLine(i64 noundef %2), !dbg !26
  %3 = load i64*, i64** %data, align 8, !dbg !27
  %4 = bitcast i64* %3 to i8*, !dbg !27
  call void @free(i8* noundef %4) #4, !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_declare_67b_goodG2BSink(i64* %myStruct.coerce) #0 !dbg !30 {
entry:
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_long_declare_67_structType, align 8
  %data = alloca i64*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_long_declare_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_long_declare_67_structType* %myStruct, i32 0, i32 0
  store i64* %myStruct.coerce, i64** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_long_declare_67_structType* %myStruct, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64** %data, metadata !33, metadata !DIExpression()), !dbg !34
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_long_declare_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_long_declare_67_structType* %myStruct, i32 0, i32 0, !dbg !35
  %0 = load i64*, i64** %structFirst, align 8, !dbg !35
  store i64* %0, i64** %data, align 8, !dbg !34
  %1 = load i64*, i64** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 0, !dbg !36
  %2 = load i64, i64* %arrayidx, align 8, !dbg !36
  call void @printLongLine(i64 noundef %2), !dbg !37
  %3 = load i64*, i64** %data, align 8, !dbg !38
  %4 = bitcast i64* %3 to i8*, !dbg !38
  call void @free(i8* noundef %4) #4, !dbg !39
  ret void, !dbg !40
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_67b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "2536fbfb1bcd7673e9a6a479036868a2")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_67b_badSink", scope: !1, file: !1, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_67_structType", file: !1, line: 24, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE590_Free_Memory_Not_on_Heap__free_long_declare_67_structType", file: !1, line: 21, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !1, line: 23, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!19 = !{}
!20 = !DILocalVariable(name: "myStruct", arg: 1, scope: !10, file: !1, line: 28, type: !13)
!21 = !DILocation(line: 28, column: 132, scope: !10)
!22 = !DILocalVariable(name: "data", scope: !10, file: !1, line: 30, type: !17)
!23 = !DILocation(line: 30, column: 12, scope: !10)
!24 = !DILocation(line: 30, column: 28, scope: !10)
!25 = !DILocation(line: 31, column: 19, scope: !10)
!26 = !DILocation(line: 31, column: 5, scope: !10)
!27 = !DILocation(line: 33, column: 10, scope: !10)
!28 = !DILocation(line: 33, column: 5, scope: !10)
!29 = !DILocation(line: 34, column: 1, scope: !10)
!30 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_67b_goodG2BSink", scope: !1, file: !1, line: 41, type: !11, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!31 = !DILocalVariable(name: "myStruct", arg: 1, scope: !30, file: !1, line: 41, type: !13)
!32 = !DILocation(line: 41, column: 136, scope: !30)
!33 = !DILocalVariable(name: "data", scope: !30, file: !1, line: 43, type: !17)
!34 = !DILocation(line: 43, column: 12, scope: !30)
!35 = !DILocation(line: 43, column: 28, scope: !30)
!36 = !DILocation(line: 44, column: 19, scope: !30)
!37 = !DILocation(line: 44, column: 5, scope: !30)
!38 = !DILocation(line: 46, column: 10, scope: !30)
!39 = !DILocation(line: 46, column: 5, scope: !30)
!40 = !DILocation(line: 47, column: 1, scope: !30)
