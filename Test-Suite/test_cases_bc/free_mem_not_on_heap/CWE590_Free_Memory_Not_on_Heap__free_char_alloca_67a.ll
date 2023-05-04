; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_structType = type { i8* }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_structType, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_structType* %myStruct, metadata !20, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 100, align 16, !dbg !30
  store i8* %0, i8** %dataBuffer, align 8, !dbg !29
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !32
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  store i8* %3, i8** %data, align 8, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !38
  store i8* %4, i8** %structFirst, align 8, !dbg !39
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !40
  %5 = load i8*, i8** %coerce.dive, align 8, !dbg !40
  call void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67b_badSink(i8* %5), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67b_badSink(i8*) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !45 {
entry:
  %data = alloca i8*, align 8
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_structType, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_structType* %myStruct, metadata !48, metadata !DIExpression()), !dbg !49
  store i8* null, i8** %data, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !51, metadata !DIExpression()), !dbg !53
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !54
  store i8* %call, i8** %dataBuffer, align 8, !dbg !53
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !55
  %cmp = icmp eq i8* %0, null, !dbg !57
  br i1 %cmp, label %if.then, label %if.end, !dbg !58

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @exit(i32 noundef 1) #7, !dbg !61
  unreachable, !dbg !61

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !62
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !63
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !64
  store i8 0, i8* %arrayidx, align 1, !dbg !65
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !66
  store i8* %3, i8** %data, align 8, !dbg !67
  %4 = load i8*, i8** %data, align 8, !dbg !68
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !69
  store i8* %4, i8** %structFirst, align 8, !dbg !70
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_structType* %myStruct, i32 0, i32 0, !dbg !71
  %5 = load i8*, i8** %coerce.dive, align 8, !dbg !71
  call void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67b_goodG2BSink(i8* %5), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67b_goodG2BSink(i8*) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "a1186ef5a03eb5441d99fe14788902c8")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_bad", scope: !1, file: !1, line: 31, type: !15, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 33, type: !3)
!19 = !DILocation(line: 33, column: 12, scope: !14)
!20 = !DILocalVariable(name: "myStruct", scope: !14, file: !1, line: 34, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_structType", file: !1, line: 24, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_structType", file: !1, line: 21, size: 64, elements: !23)
!23 = !{!24}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !22, file: !1, line: 23, baseType: !3, size: 64)
!25 = !DILocation(line: 34, column: 68, scope: !14)
!26 = !DILocation(line: 35, column: 10, scope: !14)
!27 = !DILocalVariable(name: "dataBuffer", scope: !28, file: !1, line: 38, type: !3)
!28 = distinct !DILexicalBlock(scope: !14, file: !1, line: 36, column: 5)
!29 = !DILocation(line: 38, column: 16, scope: !28)
!30 = !DILocation(line: 38, column: 37, scope: !28)
!31 = !DILocation(line: 39, column: 16, scope: !28)
!32 = !DILocation(line: 39, column: 9, scope: !28)
!33 = !DILocation(line: 40, column: 9, scope: !28)
!34 = !DILocation(line: 40, column: 27, scope: !28)
!35 = !DILocation(line: 41, column: 16, scope: !28)
!36 = !DILocation(line: 41, column: 14, scope: !28)
!37 = !DILocation(line: 43, column: 28, scope: !14)
!38 = !DILocation(line: 43, column: 14, scope: !14)
!39 = !DILocation(line: 43, column: 26, scope: !14)
!40 = !DILocation(line: 44, column: 5, scope: !14)
!41 = !DILocation(line: 45, column: 1, scope: !14)
!42 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_67_good", scope: !1, file: !1, line: 75, type: !15, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!43 = !DILocation(line: 77, column: 5, scope: !42)
!44 = !DILocation(line: 78, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!46 = !DILocalVariable(name: "data", scope: !45, file: !1, line: 56, type: !3)
!47 = !DILocation(line: 56, column: 12, scope: !45)
!48 = !DILocalVariable(name: "myStruct", scope: !45, file: !1, line: 57, type: !21)
!49 = !DILocation(line: 57, column: 68, scope: !45)
!50 = !DILocation(line: 58, column: 10, scope: !45)
!51 = !DILocalVariable(name: "dataBuffer", scope: !52, file: !1, line: 61, type: !3)
!52 = distinct !DILexicalBlock(scope: !45, file: !1, line: 59, column: 5)
!53 = !DILocation(line: 61, column: 16, scope: !52)
!54 = !DILocation(line: 61, column: 37, scope: !52)
!55 = !DILocation(line: 62, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !1, line: 62, column: 13)
!57 = !DILocation(line: 62, column: 24, scope: !56)
!58 = !DILocation(line: 62, column: 13, scope: !52)
!59 = !DILocation(line: 64, column: 13, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !1, line: 63, column: 9)
!61 = !DILocation(line: 65, column: 13, scope: !60)
!62 = !DILocation(line: 67, column: 16, scope: !52)
!63 = !DILocation(line: 67, column: 9, scope: !52)
!64 = !DILocation(line: 68, column: 9, scope: !52)
!65 = !DILocation(line: 68, column: 27, scope: !52)
!66 = !DILocation(line: 69, column: 16, scope: !52)
!67 = !DILocation(line: 69, column: 14, scope: !52)
!68 = !DILocation(line: 71, column: 28, scope: !45)
!69 = !DILocation(line: 71, column: 14, scope: !45)
!70 = !DILocation(line: 71, column: 26, scope: !45)
!71 = !DILocation(line: 72, column: 5, scope: !45)
!72 = !DILocation(line: 73, column: 1, scope: !45)
