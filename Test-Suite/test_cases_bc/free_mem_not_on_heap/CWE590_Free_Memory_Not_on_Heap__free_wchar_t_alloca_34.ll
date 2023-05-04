; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34_unionType = type { i32* }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !32
  %0 = alloca i8, i64 400, align 16, !dbg !33
  %1 = bitcast i8* %0 to i32*, !dbg !34
  store i32* %1, i32** %dataBuffer, align 8, !dbg !32
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !35
  %call = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !36
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  store i32* %4, i32** %data, align 8, !dbg !40
  %5 = load i32*, i32** %data, align 8, !dbg !41
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34_unionType* %myUnion to i32**, !dbg !42
  store i32* %5, i32** %unionFirst, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !44, metadata !DIExpression()), !dbg !46
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34_unionType* %myUnion to i32**, !dbg !47
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !47
  store i32* %6, i32** %data1, align 8, !dbg !46
  %7 = load i32*, i32** %data1, align 8, !dbg !48
  call void @printWLine(i32* noundef %7), !dbg !49
  %8 = load i32*, i32** %data1, align 8, !dbg !50
  %9 = bitcast i32* %8 to i8*, !dbg !50
  call void @free(i8* noundef %9) #5, !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !56 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34_unionType* %myUnion, metadata !59, metadata !DIExpression()), !dbg !60
  store i32* null, i32** %data, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !62, metadata !DIExpression()), !dbg !64
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !65
  %0 = bitcast i8* %call to i32*, !dbg !66
  store i32* %0, i32** %dataBuffer, align 8, !dbg !64
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !67
  %cmp = icmp eq i32* %1, null, !dbg !69
  br i1 %cmp, label %if.then, label %if.end, !dbg !70

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @exit(i32 noundef 1) #6, !dbg !73
  unreachable, !dbg !73

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !75
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !76
  store i32 0, i32* %arrayidx, align 4, !dbg !77
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !78
  store i32* %4, i32** %data, align 8, !dbg !79
  %5 = load i32*, i32** %data, align 8, !dbg !80
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34_unionType* %myUnion to i32**, !dbg !81
  store i32* %5, i32** %unionFirst, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !83, metadata !DIExpression()), !dbg !85
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34_unionType* %myUnion to i32**, !dbg !86
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !86
  store i32* %6, i32** %data2, align 8, !dbg !85
  %7 = load i32*, i32** %data2, align 8, !dbg !87
  call void @printWLine(i32* noundef %7), !dbg !88
  %8 = load i32*, i32** %data2, align 8, !dbg !89
  %9 = bitcast i32* %8 to i8*, !dbg !89
  call void @free(i8* noundef %9) #5, !dbg !90
  ret void, !dbg !91
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "761a6bfce8d166bcd6eeecfdd9ba0d7d")
!2 = !{!3, !7}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 74, baseType: !6)
!5 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 5}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{i32 7, !"PIE Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34_bad", scope: !1, file: !1, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 31, type: !3)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocalVariable(name: "myUnion", scope: !16, file: !1, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34_unionType", file: !1, line: 25, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !1, line: 21, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !1, line: 23, baseType: !3, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !1, line: 24, baseType: !3, size: 64)
!28 = !DILocation(line: 32, column: 70, scope: !16)
!29 = !DILocation(line: 33, column: 10, scope: !16)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !1, line: 36, type: !3)
!31 = distinct !DILexicalBlock(scope: !16, file: !1, line: 34, column: 5)
!32 = !DILocation(line: 36, column: 19, scope: !31)
!33 = !DILocation(line: 36, column: 43, scope: !31)
!34 = !DILocation(line: 36, column: 32, scope: !31)
!35 = !DILocation(line: 37, column: 17, scope: !31)
!36 = !DILocation(line: 37, column: 9, scope: !31)
!37 = !DILocation(line: 38, column: 9, scope: !31)
!38 = !DILocation(line: 38, column: 27, scope: !31)
!39 = !DILocation(line: 39, column: 16, scope: !31)
!40 = !DILocation(line: 39, column: 14, scope: !31)
!41 = !DILocation(line: 41, column: 26, scope: !16)
!42 = !DILocation(line: 41, column: 13, scope: !16)
!43 = !DILocation(line: 41, column: 24, scope: !16)
!44 = !DILocalVariable(name: "data", scope: !45, file: !1, line: 43, type: !3)
!45 = distinct !DILexicalBlock(scope: !16, file: !1, line: 42, column: 5)
!46 = !DILocation(line: 43, column: 19, scope: !45)
!47 = !DILocation(line: 43, column: 34, scope: !45)
!48 = !DILocation(line: 44, column: 20, scope: !45)
!49 = !DILocation(line: 44, column: 9, scope: !45)
!50 = !DILocation(line: 46, column: 14, scope: !45)
!51 = !DILocation(line: 46, column: 9, scope: !45)
!52 = !DILocation(line: 48, column: 1, scope: !16)
!53 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_34_good", scope: !1, file: !1, line: 81, type: !17, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!54 = !DILocation(line: 83, column: 5, scope: !53)
!55 = !DILocation(line: 84, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!57 = !DILocalVariable(name: "data", scope: !56, file: !1, line: 57, type: !3)
!58 = !DILocation(line: 57, column: 15, scope: !56)
!59 = !DILocalVariable(name: "myUnion", scope: !56, file: !1, line: 58, type: !23)
!60 = !DILocation(line: 58, column: 70, scope: !56)
!61 = !DILocation(line: 59, column: 10, scope: !56)
!62 = !DILocalVariable(name: "dataBuffer", scope: !63, file: !1, line: 62, type: !3)
!63 = distinct !DILexicalBlock(scope: !56, file: !1, line: 60, column: 5)
!64 = !DILocation(line: 62, column: 19, scope: !63)
!65 = !DILocation(line: 62, column: 43, scope: !63)
!66 = !DILocation(line: 62, column: 32, scope: !63)
!67 = !DILocation(line: 63, column: 13, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !1, line: 63, column: 13)
!69 = !DILocation(line: 63, column: 24, scope: !68)
!70 = !DILocation(line: 63, column: 13, scope: !63)
!71 = !DILocation(line: 65, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !1, line: 64, column: 9)
!73 = !DILocation(line: 66, column: 13, scope: !72)
!74 = !DILocation(line: 68, column: 17, scope: !63)
!75 = !DILocation(line: 68, column: 9, scope: !63)
!76 = !DILocation(line: 69, column: 9, scope: !63)
!77 = !DILocation(line: 69, column: 27, scope: !63)
!78 = !DILocation(line: 70, column: 16, scope: !63)
!79 = !DILocation(line: 70, column: 14, scope: !63)
!80 = !DILocation(line: 72, column: 26, scope: !56)
!81 = !DILocation(line: 72, column: 13, scope: !56)
!82 = !DILocation(line: 72, column: 24, scope: !56)
!83 = !DILocalVariable(name: "data", scope: !84, file: !1, line: 74, type: !3)
!84 = distinct !DILexicalBlock(scope: !56, file: !1, line: 73, column: 5)
!85 = !DILocation(line: 74, column: 19, scope: !84)
!86 = !DILocation(line: 74, column: 34, scope: !84)
!87 = !DILocation(line: 75, column: 20, scope: !84)
!88 = !DILocation(line: 75, column: 9, scope: !84)
!89 = !DILocation(line: 77, column: 14, scope: !84)
!90 = !DILocation(line: 77, column: 9, scope: !84)
!91 = !DILocation(line: 79, column: 1, scope: !56)
