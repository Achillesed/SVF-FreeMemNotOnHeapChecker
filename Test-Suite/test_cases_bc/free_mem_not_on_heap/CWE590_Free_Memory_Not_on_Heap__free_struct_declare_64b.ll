; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64b_badSink(i8* noundef %dataVoidPtr) #0 !dbg !20 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !29
  %1 = bitcast i8* %0 to %struct._twoIntsStruct**, !dbg !30
  store %struct._twoIntsStruct** %1, %struct._twoIntsStruct*** %dataPtr, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !31, metadata !DIExpression()), !dbg !32
  %2 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr, align 8, !dbg !33
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %2, align 8, !dbg !34
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 0, !dbg !35
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx), !dbg !36
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !37
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !37
  call void @free(i8* noundef %6) #4, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64b_goodG2BSink(i8* noundef %dataVoidPtr) #0 !dbg !40 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca %struct._twoIntsStruct**, align 8
  %data = alloca %struct._twoIntsStruct*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr, metadata !43, metadata !DIExpression()), !dbg !44
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !45
  %1 = bitcast i8* %0 to %struct._twoIntsStruct**, !dbg !46
  store %struct._twoIntsStruct** %1, %struct._twoIntsStruct*** %dataPtr, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !47, metadata !DIExpression()), !dbg !48
  %2 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr, align 8, !dbg !49
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %2, align 8, !dbg !50
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data, align 8, !dbg !48
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !51
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 0, !dbg !51
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx), !dbg !52
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !53
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !53
  call void @free(i8* noundef %6) #4, !dbg !54
  ret void, !dbg !55
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "3dae7e90bb8a24c61509ec04b8cbbcfa")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./std_testcase.h", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1dccefb0310558c17683ded20b0d6982")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !{i32 7, !"Dwarf Version", i32 5}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"PIE Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64b_badSink", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !23}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!24 = !{}
!25 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !20, file: !1, line: 23, type: !23)
!26 = !DILocation(line: 23, column: 77, scope: !20)
!27 = !DILocalVariable(name: "dataPtr", scope: !20, file: !1, line: 26, type: !3)
!28 = !DILocation(line: 26, column: 23, scope: !20)
!29 = !DILocation(line: 26, column: 52, scope: !20)
!30 = !DILocation(line: 26, column: 33, scope: !20)
!31 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 28, type: !4)
!32 = !DILocation(line: 28, column: 21, scope: !20)
!33 = !DILocation(line: 28, column: 30, scope: !20)
!34 = !DILocation(line: 28, column: 29, scope: !20)
!35 = !DILocation(line: 29, column: 22, scope: !20)
!36 = !DILocation(line: 29, column: 5, scope: !20)
!37 = !DILocation(line: 31, column: 10, scope: !20)
!38 = !DILocation(line: 31, column: 5, scope: !20)
!39 = !DILocation(line: 32, column: 1, scope: !20)
!40 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_64b_goodG2BSink", scope: !1, file: !1, line: 39, type: !21, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!41 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !40, file: !1, line: 39, type: !23)
!42 = !DILocation(line: 39, column: 81, scope: !40)
!43 = !DILocalVariable(name: "dataPtr", scope: !40, file: !1, line: 42, type: !3)
!44 = !DILocation(line: 42, column: 23, scope: !40)
!45 = !DILocation(line: 42, column: 52, scope: !40)
!46 = !DILocation(line: 42, column: 33, scope: !40)
!47 = !DILocalVariable(name: "data", scope: !40, file: !1, line: 44, type: !4)
!48 = !DILocation(line: 44, column: 21, scope: !40)
!49 = !DILocation(line: 44, column: 30, scope: !40)
!50 = !DILocation(line: 44, column: 29, scope: !40)
!51 = !DILocation(line: 45, column: 22, scope: !40)
!52 = !DILocation(line: 45, column: 5, scope: !40)
!53 = !DILocation(line: 47, column: 10, scope: !40)
!54 = !DILocation(line: 47, column: 5, scope: !40)
!55 = !DILocation(line: 48, column: 1, scope: !40)
