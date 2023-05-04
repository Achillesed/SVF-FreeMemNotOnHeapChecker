; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65b_badSink(%struct._twoIntsStruct* noundef %data) #0 !dbg !10 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !24
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %0, i64 0, !dbg !24
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx), !dbg !25
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !26
  %2 = bitcast %struct._twoIntsStruct* %1 to i8*, !dbg !26
  call void @free(i8* noundef %2) #4, !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65b_goodG2BSink(%struct._twoIntsStruct* noundef %data) #0 !dbg !29 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !30, metadata !DIExpression()), !dbg !31
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !32
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %0, i64 0, !dbg !32
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx), !dbg !33
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !34
  %2 = bitcast %struct._twoIntsStruct* %1 to i8*, !dbg !34
  call void @free(i8* noundef %2) #4, !dbg !35
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "a5caf45d1f554213f21013041318f8d6")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65b_badSink", scope: !1, file: !1, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !15, line: 100, baseType: !16)
!15 = !DIFile(filename: "./std_testcase.h", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1dccefb0310558c17683ded20b0d6982")
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !15, line: 96, size: 64, elements: !17)
!17 = !{!18, !20}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !16, file: !15, line: 98, baseType: !19, size: 32)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !16, file: !15, line: 99, baseType: !19, size: 32, offset: 32)
!21 = !{}
!22 = !DILocalVariable(name: "data", arg: 1, scope: !10, file: !1, line: 23, type: !13)
!23 = !DILocation(line: 23, column: 85, scope: !10)
!24 = !DILocation(line: 25, column: 22, scope: !10)
!25 = !DILocation(line: 25, column: 5, scope: !10)
!26 = !DILocation(line: 27, column: 10, scope: !10)
!27 = !DILocation(line: 27, column: 5, scope: !10)
!28 = !DILocation(line: 28, column: 1, scope: !10)
!29 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_65b_goodG2BSink", scope: !1, file: !1, line: 35, type: !11, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!30 = !DILocalVariable(name: "data", arg: 1, scope: !29, file: !1, line: 35, type: !13)
!31 = !DILocation(line: 35, column: 89, scope: !29)
!32 = !DILocation(line: 37, column: 22, scope: !29)
!33 = !DILocation(line: 37, column: 5, scope: !29)
!34 = !DILocation(line: 39, column: 10, scope: !29)
!35 = !DILocation(line: 39, column: 5, scope: !29)
!36 = !DILocation(line: 40, column: 1, scope: !29)
