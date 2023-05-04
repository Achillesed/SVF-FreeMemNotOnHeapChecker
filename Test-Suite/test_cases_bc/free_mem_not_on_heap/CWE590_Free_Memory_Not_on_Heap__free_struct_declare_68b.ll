; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68_badData = external global %struct._twoIntsStruct*, align 8
@CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68_goodG2BData = external global %struct._twoIntsStruct*, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68b_badSink() #0 !dbg !10 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !14, metadata !DIExpression()), !dbg !23
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68_badData, align 8, !dbg !24
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !23
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !25
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %1, i64 0, !dbg !25
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx), !dbg !26
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !27
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !27
  call void @free(i8* noundef %3) #4, !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68b_goodG2BSink() #0 !dbg !30 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68_goodG2BData, align 8, !dbg !33
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %1, i64 0, !dbg !34
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx), !dbg !35
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !36
  %3 = bitcast %struct._twoIntsStruct* %2 to i8*, !dbg !36
  call void @free(i8* noundef %3) #4, !dbg !37
  ret void, !dbg !38
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "de020a65dfa58aaf896d297663548cb1")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!10 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68b_badSink", scope: !1, file: !1, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocalVariable(name: "data", scope: !10, file: !1, line: 30, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !17, line: 100, baseType: !18)
!17 = !DIFile(filename: "./std_testcase.h", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1dccefb0310558c17683ded20b0d6982")
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !17, line: 96, size: 64, elements: !19)
!19 = !{!20, !22}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !18, file: !17, line: 98, baseType: !21, size: 32)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !18, file: !17, line: 99, baseType: !21, size: 32, offset: 32)
!23 = !DILocation(line: 30, column: 21, scope: !10)
!24 = !DILocation(line: 30, column: 28, scope: !10)
!25 = !DILocation(line: 31, column: 22, scope: !10)
!26 = !DILocation(line: 31, column: 5, scope: !10)
!27 = !DILocation(line: 33, column: 10, scope: !10)
!28 = !DILocation(line: 33, column: 5, scope: !10)
!29 = !DILocation(line: 34, column: 1, scope: !10)
!30 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_68b_goodG2BSink", scope: !1, file: !1, line: 41, type: !11, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!31 = !DILocalVariable(name: "data", scope: !30, file: !1, line: 43, type: !15)
!32 = !DILocation(line: 43, column: 21, scope: !30)
!33 = !DILocation(line: 43, column: 28, scope: !30)
!34 = !DILocation(line: 44, column: 22, scope: !30)
!35 = !DILocation(line: 44, column: 5, scope: !30)
!36 = !DILocation(line: 46, column: 10, scope: !30)
!37 = !DILocation(line: 46, column: 5, scope: !30)
!38 = !DILocation(line: 47, column: 1, scope: !30)
