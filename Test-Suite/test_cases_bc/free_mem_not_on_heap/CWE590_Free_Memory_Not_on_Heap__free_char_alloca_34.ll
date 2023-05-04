; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34_unionType = type { i8* }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 100, align 16, !dbg !31
  store i8* %0, i8** %dataBuffer, align 8, !dbg !30
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !33
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !36
  store i8* %3, i8** %data, align 8, !dbg !37
  %4 = load i8*, i8** %data, align 8, !dbg !38
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34_unionType* %myUnion to i8**, !dbg !39
  store i8* %4, i8** %unionFirst, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !41, metadata !DIExpression()), !dbg !43
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34_unionType* %myUnion to i8**, !dbg !44
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !44
  store i8* %5, i8** %data1, align 8, !dbg !43
  %6 = load i8*, i8** %data1, align 8, !dbg !45
  call void @printLine(i8* noundef %6), !dbg !46
  %7 = load i8*, i8** %data1, align 8, !dbg !47
  call void @free(i8* noundef %7) #6, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !53 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34_unionType* %myUnion, metadata !56, metadata !DIExpression()), !dbg !57
  store i8* null, i8** %data, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !59, metadata !DIExpression()), !dbg !61
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !62
  store i8* %call, i8** %dataBuffer, align 8, !dbg !61
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !63
  %cmp = icmp eq i8* %0, null, !dbg !65
  br i1 %cmp, label %if.then, label %if.end, !dbg !66

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @exit(i32 noundef 1) #7, !dbg !69
  unreachable, !dbg !69

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !71
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !72
  store i8 0, i8* %arrayidx, align 1, !dbg !73
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !74
  store i8* %3, i8** %data, align 8, !dbg !75
  %4 = load i8*, i8** %data, align 8, !dbg !76
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34_unionType* %myUnion to i8**, !dbg !77
  store i8* %4, i8** %unionFirst, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !79, metadata !DIExpression()), !dbg !81
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34_unionType* %myUnion to i8**, !dbg !82
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !82
  store i8* %5, i8** %data1, align 8, !dbg !81
  %6 = load i8*, i8** %data1, align 8, !dbg !83
  call void @printLine(i8* noundef %6), !dbg !84
  %7 = load i8*, i8** %data1, align 8, !dbg !85
  call void @free(i8* noundef %7) #6, !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "01a64d7e873cadca0cabb812c17e8c9b")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34_bad", scope: !1, file: !1, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 31, type: !3)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !1, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34_unionType", file: !1, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !1, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !1, line: 23, baseType: !3, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !1, line: 24, baseType: !3, size: 64)
!26 = !DILocation(line: 32, column: 67, scope: !14)
!27 = !DILocation(line: 33, column: 10, scope: !14)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !1, line: 36, type: !3)
!29 = distinct !DILexicalBlock(scope: !14, file: !1, line: 34, column: 5)
!30 = !DILocation(line: 36, column: 16, scope: !29)
!31 = !DILocation(line: 36, column: 37, scope: !29)
!32 = !DILocation(line: 37, column: 16, scope: !29)
!33 = !DILocation(line: 37, column: 9, scope: !29)
!34 = !DILocation(line: 38, column: 9, scope: !29)
!35 = !DILocation(line: 38, column: 27, scope: !29)
!36 = !DILocation(line: 39, column: 16, scope: !29)
!37 = !DILocation(line: 39, column: 14, scope: !29)
!38 = !DILocation(line: 41, column: 26, scope: !14)
!39 = !DILocation(line: 41, column: 13, scope: !14)
!40 = !DILocation(line: 41, column: 24, scope: !14)
!41 = !DILocalVariable(name: "data", scope: !42, file: !1, line: 43, type: !3)
!42 = distinct !DILexicalBlock(scope: !14, file: !1, line: 42, column: 5)
!43 = !DILocation(line: 43, column: 16, scope: !42)
!44 = !DILocation(line: 43, column: 31, scope: !42)
!45 = !DILocation(line: 44, column: 19, scope: !42)
!46 = !DILocation(line: 44, column: 9, scope: !42)
!47 = !DILocation(line: 46, column: 14, scope: !42)
!48 = !DILocation(line: 46, column: 9, scope: !42)
!49 = !DILocation(line: 48, column: 1, scope: !14)
!50 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_34_good", scope: !1, file: !1, line: 81, type: !15, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!51 = !DILocation(line: 83, column: 5, scope: !50)
!52 = !DILocation(line: 84, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!54 = !DILocalVariable(name: "data", scope: !53, file: !1, line: 57, type: !3)
!55 = !DILocation(line: 57, column: 12, scope: !53)
!56 = !DILocalVariable(name: "myUnion", scope: !53, file: !1, line: 58, type: !21)
!57 = !DILocation(line: 58, column: 67, scope: !53)
!58 = !DILocation(line: 59, column: 10, scope: !53)
!59 = !DILocalVariable(name: "dataBuffer", scope: !60, file: !1, line: 62, type: !3)
!60 = distinct !DILexicalBlock(scope: !53, file: !1, line: 60, column: 5)
!61 = !DILocation(line: 62, column: 16, scope: !60)
!62 = !DILocation(line: 62, column: 37, scope: !60)
!63 = !DILocation(line: 63, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !1, line: 63, column: 13)
!65 = !DILocation(line: 63, column: 24, scope: !64)
!66 = !DILocation(line: 63, column: 13, scope: !60)
!67 = !DILocation(line: 65, column: 13, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !1, line: 64, column: 9)
!69 = !DILocation(line: 66, column: 13, scope: !68)
!70 = !DILocation(line: 68, column: 16, scope: !60)
!71 = !DILocation(line: 68, column: 9, scope: !60)
!72 = !DILocation(line: 69, column: 9, scope: !60)
!73 = !DILocation(line: 69, column: 27, scope: !60)
!74 = !DILocation(line: 70, column: 16, scope: !60)
!75 = !DILocation(line: 70, column: 14, scope: !60)
!76 = !DILocation(line: 72, column: 26, scope: !53)
!77 = !DILocation(line: 72, column: 13, scope: !53)
!78 = !DILocation(line: 72, column: 24, scope: !53)
!79 = !DILocalVariable(name: "data", scope: !80, file: !1, line: 74, type: !3)
!80 = distinct !DILexicalBlock(scope: !53, file: !1, line: 73, column: 5)
!81 = !DILocation(line: 74, column: 16, scope: !80)
!82 = !DILocation(line: 74, column: 31, scope: !80)
!83 = !DILocation(line: 75, column: 19, scope: !80)
!84 = !DILocation(line: 75, column: 9, scope: !80)
!85 = !DILocation(line: 77, column: 14, scope: !80)
!86 = !DILocation(line: 77, column: 9, scope: !80)
!87 = !DILocation(line: 79, column: 1, scope: !53)
