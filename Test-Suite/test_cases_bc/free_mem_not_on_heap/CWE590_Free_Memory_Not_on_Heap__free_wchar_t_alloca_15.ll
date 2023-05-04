; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_15.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_15_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 400, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBuffer, align 8, !dbg !25
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  %call = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !29
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  call void @printWLine(i32* noundef %5), !dbg !35
  %6 = load i32*, i32** %data, align 8, !dbg !36
  %7 = bitcast i32* %6 to i8*, !dbg !36
  call void @free(i8* noundef %7) #5, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_15_good() #0 !dbg !39 {
entry:
  call void @goodG2B1(), !dbg !40
  call void @goodG2B2(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !43 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !44, metadata !DIExpression()), !dbg !45
  store i32* null, i32** %data, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !47, metadata !DIExpression()), !dbg !49
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !50
  %0 = bitcast i8* %call to i32*, !dbg !51
  store i32* %0, i32** %dataBuffer, align 8, !dbg !49
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !52
  %cmp = icmp eq i32* %1, null, !dbg !54
  br i1 %cmp, label %if.then, label %if.end, !dbg !55

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @exit(i32 noundef 1) #6, !dbg !58
  unreachable, !dbg !58

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !59
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !60
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !61
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !61
  store i32 0, i32* %arrayidx, align 4, !dbg !62
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !63
  store i32* %4, i32** %data, align 8, !dbg !64
  %5 = load i32*, i32** %data, align 8, !dbg !65
  call void @printWLine(i32* noundef %5), !dbg !66
  %6 = load i32*, i32** %data, align 8, !dbg !67
  %7 = bitcast i32* %6 to i8*, !dbg !67
  call void @free(i8* noundef %7) #5, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i32* null, i32** %data, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !76
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !77
  %0 = bitcast i8* %call to i32*, !dbg !78
  store i32* %0, i32** %dataBuffer, align 8, !dbg !76
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !79
  %cmp = icmp eq i32* %1, null, !dbg !81
  br i1 %cmp, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @exit(i32 noundef 1) #6, !dbg !85
  unreachable, !dbg !85

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !87
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !90
  store i32* %4, i32** %data, align 8, !dbg !91
  %5 = load i32*, i32** %data, align 8, !dbg !92
  call void @printWLine(i32* noundef %5), !dbg !93
  %6 = load i32*, i32** %data, align 8, !dbg !94
  %7 = bitcast i32* %6 to i8*, !dbg !94
  call void @free(i8* noundef %7) #5, !dbg !95
  ret void, !dbg !96
}

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_15.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "195aa2ec8bb6abe0834b3e02cd4757ea")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_15_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 25, type: !3)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !1, line: 32, type: !3)
!24 = distinct !DILexicalBlock(scope: !16, file: !1, line: 30, column: 5)
!25 = !DILocation(line: 32, column: 19, scope: !24)
!26 = !DILocation(line: 32, column: 43, scope: !24)
!27 = !DILocation(line: 32, column: 32, scope: !24)
!28 = !DILocation(line: 33, column: 17, scope: !24)
!29 = !DILocation(line: 33, column: 9, scope: !24)
!30 = !DILocation(line: 34, column: 9, scope: !24)
!31 = !DILocation(line: 34, column: 27, scope: !24)
!32 = !DILocation(line: 35, column: 16, scope: !24)
!33 = !DILocation(line: 35, column: 14, scope: !24)
!34 = !DILocation(line: 43, column: 16, scope: !16)
!35 = !DILocation(line: 43, column: 5, scope: !16)
!36 = !DILocation(line: 45, column: 10, scope: !16)
!37 = !DILocation(line: 45, column: 5, scope: !16)
!38 = !DILocation(line: 46, column: 1, scope: !16)
!39 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_15_good", scope: !1, file: !1, line: 114, type: !17, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!40 = !DILocation(line: 116, column: 5, scope: !39)
!41 = !DILocation(line: 117, column: 5, scope: !39)
!42 = !DILocation(line: 118, column: 1, scope: !39)
!43 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!44 = !DILocalVariable(name: "data", scope: !43, file: !1, line: 55, type: !3)
!45 = !DILocation(line: 55, column: 15, scope: !43)
!46 = !DILocation(line: 56, column: 10, scope: !43)
!47 = !DILocalVariable(name: "dataBuffer", scope: !48, file: !1, line: 66, type: !3)
!48 = distinct !DILexicalBlock(scope: !43, file: !1, line: 64, column: 5)
!49 = !DILocation(line: 66, column: 19, scope: !48)
!50 = !DILocation(line: 66, column: 43, scope: !48)
!51 = !DILocation(line: 66, column: 32, scope: !48)
!52 = !DILocation(line: 67, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !48, file: !1, line: 67, column: 13)
!54 = !DILocation(line: 67, column: 24, scope: !53)
!55 = !DILocation(line: 67, column: 13, scope: !48)
!56 = !DILocation(line: 69, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !1, line: 68, column: 9)
!58 = !DILocation(line: 70, column: 13, scope: !57)
!59 = !DILocation(line: 72, column: 17, scope: !48)
!60 = !DILocation(line: 72, column: 9, scope: !48)
!61 = !DILocation(line: 73, column: 9, scope: !48)
!62 = !DILocation(line: 73, column: 27, scope: !48)
!63 = !DILocation(line: 74, column: 16, scope: !48)
!64 = !DILocation(line: 74, column: 14, scope: !48)
!65 = !DILocation(line: 78, column: 16, scope: !43)
!66 = !DILocation(line: 78, column: 5, scope: !43)
!67 = !DILocation(line: 80, column: 10, scope: !43)
!68 = !DILocation(line: 80, column: 5, scope: !43)
!69 = !DILocation(line: 81, column: 1, scope: !43)
!70 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 84, type: !17, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!71 = !DILocalVariable(name: "data", scope: !70, file: !1, line: 86, type: !3)
!72 = !DILocation(line: 86, column: 15, scope: !70)
!73 = !DILocation(line: 87, column: 10, scope: !70)
!74 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !1, line: 93, type: !3)
!75 = distinct !DILexicalBlock(scope: !70, file: !1, line: 91, column: 5)
!76 = !DILocation(line: 93, column: 19, scope: !75)
!77 = !DILocation(line: 93, column: 43, scope: !75)
!78 = !DILocation(line: 93, column: 32, scope: !75)
!79 = !DILocation(line: 94, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !1, line: 94, column: 13)
!81 = !DILocation(line: 94, column: 24, scope: !80)
!82 = !DILocation(line: 94, column: 13, scope: !75)
!83 = !DILocation(line: 96, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !1, line: 95, column: 9)
!85 = !DILocation(line: 97, column: 13, scope: !84)
!86 = !DILocation(line: 99, column: 17, scope: !75)
!87 = !DILocation(line: 99, column: 9, scope: !75)
!88 = !DILocation(line: 100, column: 9, scope: !75)
!89 = !DILocation(line: 100, column: 27, scope: !75)
!90 = !DILocation(line: 101, column: 16, scope: !75)
!91 = !DILocation(line: 101, column: 14, scope: !75)
!92 = !DILocation(line: 109, column: 16, scope: !70)
!93 = !DILocation(line: 109, column: 5, scope: !70)
!94 = !DILocation(line: 111, column: 10, scope: !70)
!95 = !DILocation(line: 111, column: 5, scope: !70)
!96 = !DILocation(line: 112, column: 1, scope: !70)
