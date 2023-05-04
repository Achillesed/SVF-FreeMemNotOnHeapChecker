; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_66b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_66b_badSink(%struct._twoIntsStruct** noundef %dataArray) #0 !dbg !10 {
entry:
  %dataArray.addr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct** %dataArray, %struct._twoIntsStruct*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataArray.addr, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataArray.addr, align 8, !dbg !27
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, i64 2, !dbg !27
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %arrayidx, align 8, !dbg !27
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !28
  %arrayidx1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i64 0, !dbg !28
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx1), !dbg !29
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !30
  %4 = bitcast %struct._twoIntsStruct* %3 to i8*, !dbg !30
  call void @free(i8* noundef %4) #4, !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_66b_goodG2BSink(%struct._twoIntsStruct** noundef %dataArray) #0 !dbg !33 {
entry:
  %dataArray.addr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct** %dataArray, %struct._twoIntsStruct*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataArray.addr, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataArray.addr, align 8, !dbg !38
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, i64 2, !dbg !38
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %arrayidx, align 8, !dbg !38
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !37
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !39
  %arrayidx1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i64 0, !dbg !39
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx1), !dbg !40
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !41
  %4 = bitcast %struct._twoIntsStruct* %3 to i8*, !dbg !41
  call void @free(i8* noundef %4) #4, !dbg !42
  ret void, !dbg !43
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_66b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "c82bc1aec33f038e577c5052359345eb")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_66b_badSink", scope: !1, file: !1, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !16, line: 100, baseType: !17)
!16 = !DIFile(filename: "./std_testcase.h", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1dccefb0310558c17683ded20b0d6982")
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !16, line: 96, size: 64, elements: !18)
!18 = !{!19, !21}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !17, file: !16, line: 98, baseType: !20, size: 32)
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !17, file: !16, line: 99, baseType: !20, size: 32, offset: 32)
!22 = !{}
!23 = !DILocalVariable(name: "dataArray", arg: 1, scope: !10, file: !1, line: 23, type: !13)
!24 = !DILocation(line: 23, column: 85, scope: !10)
!25 = !DILocalVariable(name: "data", scope: !10, file: !1, line: 26, type: !14)
!26 = !DILocation(line: 26, column: 21, scope: !10)
!27 = !DILocation(line: 26, column: 28, scope: !10)
!28 = !DILocation(line: 27, column: 22, scope: !10)
!29 = !DILocation(line: 27, column: 5, scope: !10)
!30 = !DILocation(line: 29, column: 10, scope: !10)
!31 = !DILocation(line: 29, column: 5, scope: !10)
!32 = !DILocation(line: 30, column: 1, scope: !10)
!33 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_66b_goodG2BSink", scope: !1, file: !1, line: 37, type: !11, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!34 = !DILocalVariable(name: "dataArray", arg: 1, scope: !33, file: !1, line: 37, type: !13)
!35 = !DILocation(line: 37, column: 89, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !1, line: 39, type: !14)
!37 = !DILocation(line: 39, column: 21, scope: !33)
!38 = !DILocation(line: 39, column: 28, scope: !33)
!39 = !DILocation(line: 40, column: 22, scope: !33)
!40 = !DILocation(line: 40, column: 5, scope: !33)
!41 = !DILocation(line: 42, column: 10, scope: !33)
!42 = !DILocation(line: 42, column: 5, scope: !33)
!43 = !DILocation(line: 43, column: 1, scope: !33)
