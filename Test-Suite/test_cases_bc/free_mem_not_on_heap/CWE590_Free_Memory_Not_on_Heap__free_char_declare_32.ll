; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_32.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data3 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !29
  %1 = load i8*, i8** %0, align 8, !dbg !30
  store i8* %1, i8** %data1, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !37
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !40
  store i8* %arraydecay2, i8** %data1, align 8, !dbg !41
  %2 = load i8*, i8** %data1, align 8, !dbg !42
  %3 = load i8**, i8*** %dataPtr1, align 8, !dbg !43
  store i8* %2, i8** %3, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !45, metadata !DIExpression()), !dbg !47
  %4 = load i8**, i8*** %dataPtr2, align 8, !dbg !48
  %5 = load i8*, i8** %4, align 8, !dbg !49
  store i8* %5, i8** %data3, align 8, !dbg !47
  %6 = load i8*, i8** %data3, align 8, !dbg !50
  call void @printLine(i8* noundef %6), !dbg !51
  %7 = load i8*, i8** %data3, align 8, !dbg !52
  call void @free(i8* noundef %7) #6, !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_32_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !58 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !64
  store i8* null, i8** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !66, metadata !DIExpression()), !dbg !68
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !69
  %1 = load i8*, i8** %0, align 8, !dbg !70
  store i8* %1, i8** %data1, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !73
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !74
  store i8* %call, i8** %dataBuffer, align 8, !dbg !73
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !75
  %cmp = icmp eq i8* %2, null, !dbg !77
  br i1 %cmp, label %if.then, label %if.end, !dbg !78

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @exit(i32 noundef 1) #7, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !83
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  %5 = load i8*, i8** %dataBuffer, align 8, !dbg !86
  store i8* %5, i8** %data1, align 8, !dbg !87
  %6 = load i8*, i8** %data1, align 8, !dbg !88
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !89
  store i8* %6, i8** %7, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !91, metadata !DIExpression()), !dbg !93
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !94
  %9 = load i8*, i8** %8, align 8, !dbg !95
  store i8* %9, i8** %data2, align 8, !dbg !93
  %10 = load i8*, i8** %data2, align 8, !dbg !96
  call void @printLine(i8* noundef %10), !dbg !97
  %11 = load i8*, i8** %data2, align 8, !dbg !98
  call void @free(i8* noundef %11) #6, !dbg !99
  ret void, !dbg !100
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_32.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "c79b2d3e8d81e995d1c263a5e9d3f2fe")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_32_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !1, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !1, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !14)
!25 = !DILocation(line: 28, column: 10, scope: !14)
!26 = !DILocalVariable(name: "data", scope: !27, file: !1, line: 30, type: !3)
!27 = distinct !DILexicalBlock(scope: !14, file: !1, line: 29, column: 5)
!28 = !DILocation(line: 30, column: 16, scope: !27)
!29 = !DILocation(line: 30, column: 24, scope: !27)
!30 = !DILocation(line: 30, column: 23, scope: !27)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !1, line: 33, type: !33)
!32 = distinct !DILexicalBlock(scope: !27, file: !1, line: 31, column: 9)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 33, column: 18, scope: !32)
!37 = !DILocation(line: 34, column: 13, scope: !32)
!38 = !DILocation(line: 35, column: 13, scope: !32)
!39 = !DILocation(line: 35, column: 31, scope: !32)
!40 = !DILocation(line: 36, column: 20, scope: !32)
!41 = !DILocation(line: 36, column: 18, scope: !32)
!42 = !DILocation(line: 38, column: 21, scope: !27)
!43 = !DILocation(line: 38, column: 10, scope: !27)
!44 = !DILocation(line: 38, column: 19, scope: !27)
!45 = !DILocalVariable(name: "data", scope: !46, file: !1, line: 41, type: !3)
!46 = distinct !DILexicalBlock(scope: !14, file: !1, line: 40, column: 5)
!47 = !DILocation(line: 41, column: 16, scope: !46)
!48 = !DILocation(line: 41, column: 24, scope: !46)
!49 = !DILocation(line: 41, column: 23, scope: !46)
!50 = !DILocation(line: 42, column: 19, scope: !46)
!51 = !DILocation(line: 42, column: 9, scope: !46)
!52 = !DILocation(line: 44, column: 14, scope: !46)
!53 = !DILocation(line: 44, column: 9, scope: !46)
!54 = !DILocation(line: 46, column: 1, scope: !14)
!55 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_32_good", scope: !1, file: !1, line: 83, type: !15, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!56 = !DILocation(line: 85, column: 5, scope: !55)
!57 = !DILocation(line: 86, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!59 = !DILocalVariable(name: "data", scope: !58, file: !1, line: 55, type: !3)
!60 = !DILocation(line: 55, column: 12, scope: !58)
!61 = !DILocalVariable(name: "dataPtr1", scope: !58, file: !1, line: 56, type: !21)
!62 = !DILocation(line: 56, column: 13, scope: !58)
!63 = !DILocalVariable(name: "dataPtr2", scope: !58, file: !1, line: 57, type: !21)
!64 = !DILocation(line: 57, column: 13, scope: !58)
!65 = !DILocation(line: 58, column: 10, scope: !58)
!66 = !DILocalVariable(name: "data", scope: !67, file: !1, line: 60, type: !3)
!67 = distinct !DILexicalBlock(scope: !58, file: !1, line: 59, column: 5)
!68 = !DILocation(line: 60, column: 16, scope: !67)
!69 = !DILocation(line: 60, column: 24, scope: !67)
!70 = !DILocation(line: 60, column: 23, scope: !67)
!71 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !1, line: 63, type: !3)
!72 = distinct !DILexicalBlock(scope: !67, file: !1, line: 61, column: 9)
!73 = !DILocation(line: 63, column: 20, scope: !72)
!74 = !DILocation(line: 63, column: 41, scope: !72)
!75 = !DILocation(line: 64, column: 17, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !1, line: 64, column: 17)
!77 = !DILocation(line: 64, column: 28, scope: !76)
!78 = !DILocation(line: 64, column: 17, scope: !72)
!79 = !DILocation(line: 66, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !1, line: 65, column: 13)
!81 = !DILocation(line: 67, column: 17, scope: !80)
!82 = !DILocation(line: 69, column: 20, scope: !72)
!83 = !DILocation(line: 69, column: 13, scope: !72)
!84 = !DILocation(line: 70, column: 13, scope: !72)
!85 = !DILocation(line: 70, column: 31, scope: !72)
!86 = !DILocation(line: 71, column: 20, scope: !72)
!87 = !DILocation(line: 71, column: 18, scope: !72)
!88 = !DILocation(line: 73, column: 21, scope: !67)
!89 = !DILocation(line: 73, column: 10, scope: !67)
!90 = !DILocation(line: 73, column: 19, scope: !67)
!91 = !DILocalVariable(name: "data", scope: !92, file: !1, line: 76, type: !3)
!92 = distinct !DILexicalBlock(scope: !58, file: !1, line: 75, column: 5)
!93 = !DILocation(line: 76, column: 16, scope: !92)
!94 = !DILocation(line: 76, column: 24, scope: !92)
!95 = !DILocation(line: 76, column: 23, scope: !92)
!96 = !DILocation(line: 77, column: 19, scope: !92)
!97 = !DILocation(line: 77, column: 9, scope: !92)
!98 = !DILocation(line: 79, column: 14, scope: !92)
!99 = !DILocation(line: 79, column: 9, scope: !92)
!100 = !DILocation(line: 81, column: 1, scope: !58)
