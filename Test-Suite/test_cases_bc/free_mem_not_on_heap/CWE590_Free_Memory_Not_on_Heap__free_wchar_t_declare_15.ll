; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_15.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_15_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 99) #5, !dbg !30
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  store i32* %arraydecay1, i32** %data, align 8, !dbg !34
  %0 = load i32*, i32** %data, align 8, !dbg !35
  call void @printWLine(i32* noundef %0), !dbg !36
  %1 = load i32*, i32** %data, align 8, !dbg !37
  %2 = bitcast i32* %1 to i8*, !dbg !37
  call void @free(i8* noundef %2) #5, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_15_good() #0 !dbg !40 {
entry:
  call void @goodG2B1(), !dbg !41
  call void @goodG2B2(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !44 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !45, metadata !DIExpression()), !dbg !46
  store i32* null, i32** %data, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !48, metadata !DIExpression()), !dbg !50
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !51
  %0 = bitcast i8* %call to i32*, !dbg !52
  store i32* %0, i32** %dataBuffer, align 8, !dbg !50
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !53
  %cmp = icmp eq i32* %1, null, !dbg !55
  br i1 %cmp, label %if.then, label %if.end, !dbg !56

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @exit(i32 noundef 1) #6, !dbg !59
  unreachable, !dbg !59

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !60
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !61
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !62
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !62
  store i32 0, i32* %arrayidx, align 4, !dbg !63
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !64
  store i32* %4, i32** %data, align 8, !dbg !65
  %5 = load i32*, i32** %data, align 8, !dbg !66
  call void @printWLine(i32* noundef %5), !dbg !67
  %6 = load i32*, i32** %data, align 8, !dbg !68
  %7 = bitcast i32* %6 to i8*, !dbg !68
  call void @free(i8* noundef %7) #5, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  store i32* null, i32** %data, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !77
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !78
  %0 = bitcast i8* %call to i32*, !dbg !79
  store i32* %0, i32** %dataBuffer, align 8, !dbg !77
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !80
  %cmp = icmp eq i32* %1, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @exit(i32 noundef 1) #6, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !87
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !88
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !91
  store i32* %4, i32** %data, align 8, !dbg !92
  %5 = load i32*, i32** %data, align 8, !dbg !93
  call void @printWLine(i32* noundef %5), !dbg !94
  %6 = load i32*, i32** %data, align 8, !dbg !95
  %7 = bitcast i32* %6 to i8*, !dbg !95
  call void @free(i8* noundef %7) #5, !dbg !96
  ret void, !dbg !97
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_15.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "b5a48abb934e1c6cc4c72bc056e90295")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_15_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 25, type: !3)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !1, line: 32, type: !25)
!24 = distinct !DILexicalBlock(scope: !16, file: !1, line: 30, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 32, column: 17, scope: !24)
!29 = !DILocation(line: 33, column: 17, scope: !24)
!30 = !DILocation(line: 33, column: 9, scope: !24)
!31 = !DILocation(line: 34, column: 9, scope: !24)
!32 = !DILocation(line: 34, column: 27, scope: !24)
!33 = !DILocation(line: 35, column: 16, scope: !24)
!34 = !DILocation(line: 35, column: 14, scope: !24)
!35 = !DILocation(line: 43, column: 16, scope: !16)
!36 = !DILocation(line: 43, column: 5, scope: !16)
!37 = !DILocation(line: 45, column: 10, scope: !16)
!38 = !DILocation(line: 45, column: 5, scope: !16)
!39 = !DILocation(line: 46, column: 1, scope: !16)
!40 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_15_good", scope: !1, file: !1, line: 114, type: !17, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!41 = !DILocation(line: 116, column: 5, scope: !40)
!42 = !DILocation(line: 117, column: 5, scope: !40)
!43 = !DILocation(line: 118, column: 1, scope: !40)
!44 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!45 = !DILocalVariable(name: "data", scope: !44, file: !1, line: 55, type: !3)
!46 = !DILocation(line: 55, column: 15, scope: !44)
!47 = !DILocation(line: 56, column: 10, scope: !44)
!48 = !DILocalVariable(name: "dataBuffer", scope: !49, file: !1, line: 66, type: !3)
!49 = distinct !DILexicalBlock(scope: !44, file: !1, line: 64, column: 5)
!50 = !DILocation(line: 66, column: 19, scope: !49)
!51 = !DILocation(line: 66, column: 43, scope: !49)
!52 = !DILocation(line: 66, column: 32, scope: !49)
!53 = !DILocation(line: 67, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !1, line: 67, column: 13)
!55 = !DILocation(line: 67, column: 24, scope: !54)
!56 = !DILocation(line: 67, column: 13, scope: !49)
!57 = !DILocation(line: 69, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !1, line: 68, column: 9)
!59 = !DILocation(line: 70, column: 13, scope: !58)
!60 = !DILocation(line: 72, column: 17, scope: !49)
!61 = !DILocation(line: 72, column: 9, scope: !49)
!62 = !DILocation(line: 73, column: 9, scope: !49)
!63 = !DILocation(line: 73, column: 27, scope: !49)
!64 = !DILocation(line: 74, column: 16, scope: !49)
!65 = !DILocation(line: 74, column: 14, scope: !49)
!66 = !DILocation(line: 78, column: 16, scope: !44)
!67 = !DILocation(line: 78, column: 5, scope: !44)
!68 = !DILocation(line: 80, column: 10, scope: !44)
!69 = !DILocation(line: 80, column: 5, scope: !44)
!70 = !DILocation(line: 81, column: 1, scope: !44)
!71 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 84, type: !17, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!72 = !DILocalVariable(name: "data", scope: !71, file: !1, line: 86, type: !3)
!73 = !DILocation(line: 86, column: 15, scope: !71)
!74 = !DILocation(line: 87, column: 10, scope: !71)
!75 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !1, line: 93, type: !3)
!76 = distinct !DILexicalBlock(scope: !71, file: !1, line: 91, column: 5)
!77 = !DILocation(line: 93, column: 19, scope: !76)
!78 = !DILocation(line: 93, column: 43, scope: !76)
!79 = !DILocation(line: 93, column: 32, scope: !76)
!80 = !DILocation(line: 94, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !1, line: 94, column: 13)
!82 = !DILocation(line: 94, column: 24, scope: !81)
!83 = !DILocation(line: 94, column: 13, scope: !76)
!84 = !DILocation(line: 96, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !1, line: 95, column: 9)
!86 = !DILocation(line: 97, column: 13, scope: !85)
!87 = !DILocation(line: 99, column: 17, scope: !76)
!88 = !DILocation(line: 99, column: 9, scope: !76)
!89 = !DILocation(line: 100, column: 9, scope: !76)
!90 = !DILocation(line: 100, column: 27, scope: !76)
!91 = !DILocation(line: 101, column: 16, scope: !76)
!92 = !DILocation(line: 101, column: 14, scope: !76)
!93 = !DILocation(line: 109, column: 16, scope: !71)
!94 = !DILocation(line: 109, column: 5, scope: !71)
!95 = !DILocation(line: 111, column: 10, scope: !71)
!96 = !DILocation(line: 111, column: 5, scope: !71)
!97 = !DILocation(line: 112, column: 1, scope: !71)
