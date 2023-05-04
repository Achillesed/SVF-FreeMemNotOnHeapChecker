; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_34.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.CWE590_Free_Memory_Not_on_Heap__free_char_declare_34_unionType = type { i8* }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_char_declare_34_unionType, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data2 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_char_declare_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !34
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !37
  store i8* %arraydecay1, i8** %data, align 8, !dbg !38
  %0 = load i8*, i8** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_char_declare_34_unionType* %myUnion to i8**, !dbg !40
  store i8* %0, i8** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_char_declare_34_unionType* %myUnion to i8**, !dbg !45
  %1 = load i8*, i8** %unionSecond, align 8, !dbg !45
  store i8* %1, i8** %data2, align 8, !dbg !44
  %2 = load i8*, i8** %data2, align 8, !dbg !46
  call void @printLine(i8* noundef %2), !dbg !47
  %3 = load i8*, i8** %data2, align 8, !dbg !48
  call void @free(i8* noundef %3) #6, !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_34_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !54 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_char_declare_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_char_declare_34_unionType* %myUnion, metadata !57, metadata !DIExpression()), !dbg !58
  store i8* null, i8** %data, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !60, metadata !DIExpression()), !dbg !62
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !63
  store i8* %call, i8** %dataBuffer, align 8, !dbg !62
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !64
  %cmp = icmp eq i8* %0, null, !dbg !66
  br i1 %cmp, label %if.then, label %if.end, !dbg !67

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @exit(i32 noundef 1) #7, !dbg !70
  unreachable, !dbg !70

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !72
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !73
  store i8 0, i8* %arrayidx, align 1, !dbg !74
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !75
  store i8* %3, i8** %data, align 8, !dbg !76
  %4 = load i8*, i8** %data, align 8, !dbg !77
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_char_declare_34_unionType* %myUnion to i8**, !dbg !78
  store i8* %4, i8** %unionFirst, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !80, metadata !DIExpression()), !dbg !82
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_char_declare_34_unionType* %myUnion to i8**, !dbg !83
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !83
  store i8* %5, i8** %data1, align 8, !dbg !82
  %6 = load i8*, i8** %data1, align 8, !dbg !84
  call void @printLine(i8* noundef %6), !dbg !85
  %7 = load i8*, i8** %data1, align 8, !dbg !86
  call void @free(i8* noundef %7) #6, !dbg !87
  ret void, !dbg !88
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_34.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "18255a1964522d1bda25bb41facc531c")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_34_bad", scope: !1, file: !1, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 31, type: !3)
!19 = !DILocation(line: 31, column: 12, scope: !14)
!20 = !DILocalVariable(name: "myUnion", scope: !14, file: !1, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_34_unionType", file: !1, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !1, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !1, line: 23, baseType: !3, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !1, line: 24, baseType: !3, size: 64)
!26 = !DILocation(line: 32, column: 68, scope: !14)
!27 = !DILocation(line: 33, column: 10, scope: !14)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !1, line: 36, type: !30)
!29 = distinct !DILexicalBlock(scope: !14, file: !1, line: 34, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 36, column: 14, scope: !29)
!34 = !DILocation(line: 37, column: 9, scope: !29)
!35 = !DILocation(line: 38, column: 9, scope: !29)
!36 = !DILocation(line: 38, column: 27, scope: !29)
!37 = !DILocation(line: 39, column: 16, scope: !29)
!38 = !DILocation(line: 39, column: 14, scope: !29)
!39 = !DILocation(line: 41, column: 26, scope: !14)
!40 = !DILocation(line: 41, column: 13, scope: !14)
!41 = !DILocation(line: 41, column: 24, scope: !14)
!42 = !DILocalVariable(name: "data", scope: !43, file: !1, line: 43, type: !3)
!43 = distinct !DILexicalBlock(scope: !14, file: !1, line: 42, column: 5)
!44 = !DILocation(line: 43, column: 16, scope: !43)
!45 = !DILocation(line: 43, column: 31, scope: !43)
!46 = !DILocation(line: 44, column: 19, scope: !43)
!47 = !DILocation(line: 44, column: 9, scope: !43)
!48 = !DILocation(line: 46, column: 14, scope: !43)
!49 = !DILocation(line: 46, column: 9, scope: !43)
!50 = !DILocation(line: 48, column: 1, scope: !14)
!51 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_34_good", scope: !1, file: !1, line: 81, type: !15, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!52 = !DILocation(line: 83, column: 5, scope: !51)
!53 = !DILocation(line: 84, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!55 = !DILocalVariable(name: "data", scope: !54, file: !1, line: 57, type: !3)
!56 = !DILocation(line: 57, column: 12, scope: !54)
!57 = !DILocalVariable(name: "myUnion", scope: !54, file: !1, line: 58, type: !21)
!58 = !DILocation(line: 58, column: 68, scope: !54)
!59 = !DILocation(line: 59, column: 10, scope: !54)
!60 = !DILocalVariable(name: "dataBuffer", scope: !61, file: !1, line: 62, type: !3)
!61 = distinct !DILexicalBlock(scope: !54, file: !1, line: 60, column: 5)
!62 = !DILocation(line: 62, column: 16, scope: !61)
!63 = !DILocation(line: 62, column: 37, scope: !61)
!64 = !DILocation(line: 63, column: 13, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !1, line: 63, column: 13)
!66 = !DILocation(line: 63, column: 24, scope: !65)
!67 = !DILocation(line: 63, column: 13, scope: !61)
!68 = !DILocation(line: 65, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !1, line: 64, column: 9)
!70 = !DILocation(line: 66, column: 13, scope: !69)
!71 = !DILocation(line: 68, column: 16, scope: !61)
!72 = !DILocation(line: 68, column: 9, scope: !61)
!73 = !DILocation(line: 69, column: 9, scope: !61)
!74 = !DILocation(line: 69, column: 27, scope: !61)
!75 = !DILocation(line: 70, column: 16, scope: !61)
!76 = !DILocation(line: 70, column: 14, scope: !61)
!77 = !DILocation(line: 72, column: 26, scope: !54)
!78 = !DILocation(line: 72, column: 13, scope: !54)
!79 = !DILocation(line: 72, column: 24, scope: !54)
!80 = !DILocalVariable(name: "data", scope: !81, file: !1, line: 74, type: !3)
!81 = distinct !DILexicalBlock(scope: !54, file: !1, line: 73, column: 5)
!82 = !DILocation(line: 74, column: 16, scope: !81)
!83 = !DILocation(line: 74, column: 31, scope: !81)
!84 = !DILocation(line: 75, column: 19, scope: !81)
!85 = !DILocation(line: 75, column: 9, scope: !81)
!86 = !DILocation(line: 77, column: 14, scope: !81)
!87 = !DILocation(line: 77, column: 9, scope: !81)
!88 = !DILocation(line: 79, column: 1, scope: !54)
