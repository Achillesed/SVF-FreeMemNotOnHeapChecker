; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_static_67b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_static_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }
%struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType = type { %struct._twoIntsStruct* }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_67b_badSink(%struct._twoIntsStruct* %myStruct.coerce) #0 !dbg !10 {
entry:
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType* %myStruct, i32 0, i32 0
  store %struct._twoIntsStruct* %myStruct.coerce, %struct._twoIntsStruct** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType* %myStruct, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !28, metadata !DIExpression()), !dbg !29
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType* %myStruct, i32 0, i32 0, !dbg !30
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %structFirst, align 8, !dbg !30
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !29
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %1, i64 0, !dbg !31
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx), !dbg !32
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !33
  call void @free(i8* noundef %3) #4, !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_67b_goodG2BSink(%struct._twoIntsStruct* %myStruct.coerce) #0 !dbg !36 {
entry:
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType* %myStruct, i32 0, i32 0
  store %struct._twoIntsStruct* %myStruct.coerce, %struct._twoIntsStruct** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType* %myStruct, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !39, metadata !DIExpression()), !dbg !40
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType* %myStruct, i32 0, i32 0, !dbg !41
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %structFirst, align 8, !dbg !41
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !40
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %1, i64 0, !dbg !42
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx), !dbg !43
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !44
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !44
  call void @free(i8* noundef %3) #4, !dbg !45
  ret void, !dbg !46
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_67b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "f30d594096faa59c3bebb55d2cb6eb92")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_67b_badSink", scope: !1, file: !1, line: 28, type: !11, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !25)
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType", file: !1, line: 24, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE590_Free_Memory_Not_on_Heap__free_struct_static_67_structType", file: !1, line: 21, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !1, line: 23, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !19, line: 100, baseType: !20)
!19 = !DIFile(filename: "./std_testcase.h", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1dccefb0310558c17683ded20b0d6982")
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !19, line: 96, size: 64, elements: !21)
!21 = !{!22, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !20, file: !19, line: 98, baseType: !23, size: 32)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !20, file: !19, line: 99, baseType: !23, size: 32, offset: 32)
!25 = !{}
!26 = !DILocalVariable(name: "myStruct", arg: 1, scope: !10, file: !1, line: 28, type: !13)
!27 = !DILocation(line: 28, column: 134, scope: !10)
!28 = !DILocalVariable(name: "data", scope: !10, file: !1, line: 30, type: !17)
!29 = !DILocation(line: 30, column: 21, scope: !10)
!30 = !DILocation(line: 30, column: 37, scope: !10)
!31 = !DILocation(line: 31, column: 22, scope: !10)
!32 = !DILocation(line: 31, column: 5, scope: !10)
!33 = !DILocation(line: 33, column: 10, scope: !10)
!34 = !DILocation(line: 33, column: 5, scope: !10)
!35 = !DILocation(line: 34, column: 1, scope: !10)
!36 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_67b_goodG2BSink", scope: !1, file: !1, line: 41, type: !11, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !25)
!37 = !DILocalVariable(name: "myStruct", arg: 1, scope: !36, file: !1, line: 41, type: !13)
!38 = !DILocation(line: 41, column: 138, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !1, line: 43, type: !17)
!40 = !DILocation(line: 43, column: 21, scope: !36)
!41 = !DILocation(line: 43, column: 37, scope: !36)
!42 = !DILocation(line: 44, column: 22, scope: !36)
!43 = !DILocation(line: 44, column: 5, scope: !36)
!44 = !DILocation(line: 46, column: 10, scope: !36)
!45 = !DILocation(line: 46, column: 5, scope: !36)
!46 = !DILocation(line: 47, column: 1, scope: !36)
