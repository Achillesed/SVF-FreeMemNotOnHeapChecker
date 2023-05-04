; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_64b.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_64b_badSink(i8* noundef %dataVoidPtr) #0 !dbg !18 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i64**, align 8
  %data = alloca i64*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i64*** %dataPtr, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !27
  %1 = bitcast i8* %0 to i64**, !dbg !28
  store i64** %1, i64*** %dataPtr, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i64** %data, metadata !29, metadata !DIExpression()), !dbg !30
  %2 = load i64**, i64*** %dataPtr, align 8, !dbg !31
  %3 = load i64*, i64** %2, align 8, !dbg !32
  store i64* %3, i64** %data, align 8, !dbg !30
  %4 = load i64*, i64** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !33
  %5 = load i64, i64* %arrayidx, align 8, !dbg !33
  call void @printLongLongLine(i64 noundef %5), !dbg !34
  %6 = load i64*, i64** %data, align 8, !dbg !35
  %7 = bitcast i64* %6 to i8*, !dbg !35
  call void @free(i8* noundef %7) #4, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_64b_goodG2BSink(i8* noundef %dataVoidPtr) #0 !dbg !38 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i64**, align 8
  %data = alloca i64*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64*** %dataPtr, metadata !41, metadata !DIExpression()), !dbg !42
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !43
  %1 = bitcast i8* %0 to i64**, !dbg !44
  store i64** %1, i64*** %dataPtr, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i64** %data, metadata !45, metadata !DIExpression()), !dbg !46
  %2 = load i64**, i64*** %dataPtr, align 8, !dbg !47
  %3 = load i64*, i64** %2, align 8, !dbg !48
  store i64* %3, i64** %data, align 8, !dbg !46
  %4 = load i64*, i64** %data, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !49
  %5 = load i64, i64* %arrayidx, align 8, !dbg !49
  call void @printLongLongLine(i64 noundef %5), !dbg !50
  %6 = load i64*, i64** %data, align 8, !dbg !51
  %7 = bitcast i64* %6 to i8*, !dbg !51
  call void @free(i8* noundef %7) #4, !dbg !52
  ret void, !dbg !53
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_64b.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "d997255972396bdf0e9ffe62063d1f47")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!9 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 5}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"PIE Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_64b_badSink", scope: !1, file: !1, line: 23, type: !19, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!22 = !{}
!23 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !18, file: !1, line: 23, type: !21)
!24 = !DILocation(line: 23, column: 78, scope: !18)
!25 = !DILocalVariable(name: "dataPtr", scope: !18, file: !1, line: 26, type: !3)
!26 = !DILocation(line: 26, column: 17, scope: !18)
!27 = !DILocation(line: 26, column: 40, scope: !18)
!28 = !DILocation(line: 26, column: 27, scope: !18)
!29 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 28, type: !4)
!30 = !DILocation(line: 28, column: 15, scope: !18)
!31 = !DILocation(line: 28, column: 24, scope: !18)
!32 = !DILocation(line: 28, column: 23, scope: !18)
!33 = !DILocation(line: 29, column: 23, scope: !18)
!34 = !DILocation(line: 29, column: 5, scope: !18)
!35 = !DILocation(line: 31, column: 10, scope: !18)
!36 = !DILocation(line: 31, column: 5, scope: !18)
!37 = !DILocation(line: 32, column: 1, scope: !18)
!38 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_64b_goodG2BSink", scope: !1, file: !1, line: 39, type: !19, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!39 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !38, file: !1, line: 39, type: !21)
!40 = !DILocation(line: 39, column: 82, scope: !38)
!41 = !DILocalVariable(name: "dataPtr", scope: !38, file: !1, line: 42, type: !3)
!42 = !DILocation(line: 42, column: 17, scope: !38)
!43 = !DILocation(line: 42, column: 40, scope: !38)
!44 = !DILocation(line: 42, column: 27, scope: !38)
!45 = !DILocalVariable(name: "data", scope: !38, file: !1, line: 44, type: !4)
!46 = !DILocation(line: 44, column: 15, scope: !38)
!47 = !DILocation(line: 44, column: 24, scope: !38)
!48 = !DILocation(line: 44, column: 23, scope: !38)
!49 = !DILocation(line: 45, column: 23, scope: !38)
!50 = !DILocation(line: 45, column: 5, scope: !38)
!51 = !DILocation(line: 47, column: 10, scope: !38)
!52 = !DILocation(line: 47, column: 5, scope: !38)
!53 = !DILocation(line: 48, column: 1, scope: !38)
