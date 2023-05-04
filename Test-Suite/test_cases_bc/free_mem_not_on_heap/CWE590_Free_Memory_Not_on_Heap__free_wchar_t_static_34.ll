; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_unionType = type { i32* }

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_unionType, align 8
  %data1 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_unionType* %myUnion, metadata !28, metadata !DIExpression()), !dbg !34
  store i32* null, i32** %data, align 8, !dbg !35
  %call = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !36
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !38
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !39
  %0 = load i32*, i32** %data, align 8, !dbg !40
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_unionType* %myUnion to i32**, !dbg !41
  store i32* %0, i32** %unionFirst, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !43, metadata !DIExpression()), !dbg !45
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_unionType* %myUnion to i32**, !dbg !46
  %1 = load i32*, i32** %unionSecond, align 8, !dbg !46
  store i32* %1, i32** %data1, align 8, !dbg !45
  %2 = load i32*, i32** %data1, align 8, !dbg !47
  call void @printWLine(i32* noundef %2), !dbg !48
  %3 = load i32*, i32** %data1, align 8, !dbg !49
  %4 = bitcast i32* %3 to i8*, !dbg !49
  call void @free(i8* noundef %4) #5, !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !55 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_unionType* %myUnion, metadata !58, metadata !DIExpression()), !dbg !59
  store i32* null, i32** %data, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !61, metadata !DIExpression()), !dbg !63
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !64
  %0 = bitcast i8* %call to i32*, !dbg !65
  store i32* %0, i32** %dataBuffer, align 8, !dbg !63
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !66
  %cmp = icmp eq i32* %1, null, !dbg !68
  br i1 %cmp, label %if.then, label %if.end, !dbg !69

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @exit(i32 noundef 1) #6, !dbg !72
  unreachable, !dbg !72

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !73
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !74
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !75
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !75
  store i32 0, i32* %arrayidx, align 4, !dbg !76
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !77
  store i32* %4, i32** %data, align 8, !dbg !78
  %5 = load i32*, i32** %data, align 8, !dbg !79
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_unionType* %myUnion to i32**, !dbg !80
  store i32* %5, i32** %unionFirst, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !82, metadata !DIExpression()), !dbg !84
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_unionType* %myUnion to i32**, !dbg !85
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !85
  store i32* %6, i32** %data2, align 8, !dbg !84
  %7 = load i32*, i32** %data2, align 8, !dbg !86
  call void @printWLine(i32* noundef %7), !dbg !87
  %8 = load i32*, i32** %data2, align 8, !dbg !88
  %9 = bitcast i32* %8 to i8*, !dbg !88
  call void @free(i8* noundef %9) #5, !dbg !89
  ret void, !dbg !90
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

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!18, !19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 36, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_bad", scope: !3, file: !3, line: 29, type: !4, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "e2c8bc973ace323db6cf79591e42c724")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !13, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !12}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !{!0}
!14 = !{}
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 100)
!18 = !{i32 7, !"Dwarf Version", i32 5}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"PIC Level", i32 2}
!22 = !{i32 7, !"PIE Level", i32 2}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!26 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 31, type: !8)
!27 = !DILocation(line: 31, column: 15, scope: !2)
!28 = !DILocalVariable(name: "myUnion", scope: !2, file: !3, line: 32, type: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_unionType", file: !3, line: 25, baseType: !30)
!30 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !3, line: 21, size: 64, elements: !31)
!31 = !{!32, !33}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !30, file: !3, line: 23, baseType: !8, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !30, file: !3, line: 24, baseType: !8, size: 64)
!34 = !DILocation(line: 32, column: 70, scope: !2)
!35 = !DILocation(line: 33, column: 10, scope: !2)
!36 = !DILocation(line: 37, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !2, file: !3, line: 34, column: 5)
!38 = !DILocation(line: 38, column: 27, scope: !37)
!39 = !DILocation(line: 39, column: 14, scope: !37)
!40 = !DILocation(line: 41, column: 26, scope: !2)
!41 = !DILocation(line: 41, column: 13, scope: !2)
!42 = !DILocation(line: 41, column: 24, scope: !2)
!43 = !DILocalVariable(name: "data", scope: !44, file: !3, line: 43, type: !8)
!44 = distinct !DILexicalBlock(scope: !2, file: !3, line: 42, column: 5)
!45 = !DILocation(line: 43, column: 19, scope: !44)
!46 = !DILocation(line: 43, column: 34, scope: !44)
!47 = !DILocation(line: 44, column: 20, scope: !44)
!48 = !DILocation(line: 44, column: 9, scope: !44)
!49 = !DILocation(line: 46, column: 14, scope: !44)
!50 = !DILocation(line: 46, column: 9, scope: !44)
!51 = !DILocation(line: 48, column: 1, scope: !2)
!52 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_34_good", scope: !3, file: !3, line: 81, type: !4, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!53 = !DILocation(line: 83, column: 5, scope: !52)
!54 = !DILocation(line: 84, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 55, type: !4, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!56 = !DILocalVariable(name: "data", scope: !55, file: !3, line: 57, type: !8)
!57 = !DILocation(line: 57, column: 15, scope: !55)
!58 = !DILocalVariable(name: "myUnion", scope: !55, file: !3, line: 58, type: !29)
!59 = !DILocation(line: 58, column: 70, scope: !55)
!60 = !DILocation(line: 59, column: 10, scope: !55)
!61 = !DILocalVariable(name: "dataBuffer", scope: !62, file: !3, line: 62, type: !8)
!62 = distinct !DILexicalBlock(scope: !55, file: !3, line: 60, column: 5)
!63 = !DILocation(line: 62, column: 19, scope: !62)
!64 = !DILocation(line: 62, column: 43, scope: !62)
!65 = !DILocation(line: 62, column: 32, scope: !62)
!66 = !DILocation(line: 63, column: 13, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !3, line: 63, column: 13)
!68 = !DILocation(line: 63, column: 24, scope: !67)
!69 = !DILocation(line: 63, column: 13, scope: !62)
!70 = !DILocation(line: 65, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !3, line: 64, column: 9)
!72 = !DILocation(line: 66, column: 13, scope: !71)
!73 = !DILocation(line: 68, column: 17, scope: !62)
!74 = !DILocation(line: 68, column: 9, scope: !62)
!75 = !DILocation(line: 69, column: 9, scope: !62)
!76 = !DILocation(line: 69, column: 27, scope: !62)
!77 = !DILocation(line: 70, column: 16, scope: !62)
!78 = !DILocation(line: 70, column: 14, scope: !62)
!79 = !DILocation(line: 72, column: 26, scope: !55)
!80 = !DILocation(line: 72, column: 13, scope: !55)
!81 = !DILocation(line: 72, column: 24, scope: !55)
!82 = !DILocalVariable(name: "data", scope: !83, file: !3, line: 74, type: !8)
!83 = distinct !DILexicalBlock(scope: !55, file: !3, line: 73, column: 5)
!84 = !DILocation(line: 74, column: 19, scope: !83)
!85 = !DILocation(line: 74, column: 34, scope: !83)
!86 = !DILocation(line: 75, column: 20, scope: !83)
!87 = !DILocation(line: 75, column: 9, scope: !83)
!88 = !DILocation(line: 77, column: 14, scope: !83)
!89 = !DILocation(line: 77, column: 9, scope: !83)
!90 = !DILocation(line: 79, column: 1, scope: !55)
