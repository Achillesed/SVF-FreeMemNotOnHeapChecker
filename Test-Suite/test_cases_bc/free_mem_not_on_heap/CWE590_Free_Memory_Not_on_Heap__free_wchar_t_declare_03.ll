; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_03.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_03_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 99) #5, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !35
  store i32* %arraydecay1, i32** %data, align 8, !dbg !36
  %0 = load i32*, i32** %data, align 8, !dbg !37
  call void @printWLine(i32* noundef %0), !dbg !38
  %1 = load i32*, i32** %data, align 8, !dbg !39
  %2 = bitcast i32* %1 to i8*, !dbg !39
  call void @free(i8* noundef %2) #5, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_03_good() #0 !dbg !42 {
entry:
  call void @goodG2B1(), !dbg !43
  call void @goodG2B2(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !46 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !47, metadata !DIExpression()), !dbg !48
  store i32* null, i32** %data, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !50, metadata !DIExpression()), !dbg !54
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !55
  %0 = bitcast i8* %call to i32*, !dbg !56
  store i32* %0, i32** %dataBuffer, align 8, !dbg !54
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !57
  %cmp = icmp eq i32* %1, null, !dbg !59
  br i1 %cmp, label %if.then, label %if.end, !dbg !60

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @exit(i32 noundef 1) #6, !dbg !63
  unreachable, !dbg !63

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !64
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !65
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !66
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !66
  store i32 0, i32* %arrayidx, align 4, !dbg !67
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !68
  store i32* %4, i32** %data, align 8, !dbg !69
  %5 = load i32*, i32** %data, align 8, !dbg !70
  call void @printWLine(i32* noundef %5), !dbg !71
  %6 = load i32*, i32** %data, align 8, !dbg !72
  %7 = bitcast i32* %6 to i8*, !dbg !72
  call void @free(i8* noundef %7) #5, !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i32* null, i32** %data, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !83
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !84
  %0 = bitcast i8* %call to i32*, !dbg !85
  store i32* %0, i32** %dataBuffer, align 8, !dbg !83
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  %cmp = icmp eq i32* %1, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @exit(i32 noundef 1) #6, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !93
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !94
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !97
  store i32* %4, i32** %data, align 8, !dbg !98
  %5 = load i32*, i32** %data, align 8, !dbg !99
  call void @printWLine(i32* noundef %5), !dbg !100
  %6 = load i32*, i32** %data, align 8, !dbg !101
  %7 = bitcast i32* %6 to i8*, !dbg !101
  call void @free(i8* noundef %7) #5, !dbg !102
  ret void, !dbg !103
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_03.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "cc8ae1b73b9e3acabe6dfcc3ea3903c3")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_03_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 25, type: !3)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !1, line: 31, type: !27)
!24 = distinct !DILexicalBlock(scope: !25, file: !1, line: 29, column: 9)
!25 = distinct !DILexicalBlock(scope: !26, file: !1, line: 28, column: 5)
!26 = distinct !DILexicalBlock(scope: !16, file: !1, line: 27, column: 8)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 31, column: 21, scope: !24)
!31 = !DILocation(line: 32, column: 21, scope: !24)
!32 = !DILocation(line: 32, column: 13, scope: !24)
!33 = !DILocation(line: 33, column: 13, scope: !24)
!34 = !DILocation(line: 33, column: 31, scope: !24)
!35 = !DILocation(line: 34, column: 20, scope: !24)
!36 = !DILocation(line: 34, column: 18, scope: !24)
!37 = !DILocation(line: 37, column: 16, scope: !16)
!38 = !DILocation(line: 37, column: 5, scope: !16)
!39 = !DILocation(line: 39, column: 10, scope: !16)
!40 = !DILocation(line: 39, column: 5, scope: !16)
!41 = !DILocation(line: 40, column: 1, scope: !16)
!42 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_03_good", scope: !1, file: !1, line: 101, type: !17, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!43 = !DILocation(line: 103, column: 5, scope: !42)
!44 = !DILocation(line: 104, column: 5, scope: !42)
!45 = !DILocation(line: 105, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 47, type: !17, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!47 = !DILocalVariable(name: "data", scope: !46, file: !1, line: 49, type: !3)
!48 = !DILocation(line: 49, column: 15, scope: !46)
!49 = !DILocation(line: 50, column: 10, scope: !46)
!50 = !DILocalVariable(name: "dataBuffer", scope: !51, file: !1, line: 60, type: !3)
!51 = distinct !DILexicalBlock(scope: !52, file: !1, line: 58, column: 9)
!52 = distinct !DILexicalBlock(scope: !53, file: !1, line: 57, column: 5)
!53 = distinct !DILexicalBlock(scope: !46, file: !1, line: 51, column: 8)
!54 = !DILocation(line: 60, column: 23, scope: !51)
!55 = !DILocation(line: 60, column: 47, scope: !51)
!56 = !DILocation(line: 60, column: 36, scope: !51)
!57 = !DILocation(line: 61, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !51, file: !1, line: 61, column: 17)
!59 = !DILocation(line: 61, column: 28, scope: !58)
!60 = !DILocation(line: 61, column: 17, scope: !51)
!61 = !DILocation(line: 63, column: 17, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !1, line: 62, column: 13)
!63 = !DILocation(line: 64, column: 17, scope: !62)
!64 = !DILocation(line: 66, column: 21, scope: !51)
!65 = !DILocation(line: 66, column: 13, scope: !51)
!66 = !DILocation(line: 67, column: 13, scope: !51)
!67 = !DILocation(line: 67, column: 31, scope: !51)
!68 = !DILocation(line: 68, column: 20, scope: !51)
!69 = !DILocation(line: 68, column: 18, scope: !51)
!70 = !DILocation(line: 71, column: 16, scope: !46)
!71 = !DILocation(line: 71, column: 5, scope: !46)
!72 = !DILocation(line: 73, column: 10, scope: !46)
!73 = !DILocation(line: 73, column: 5, scope: !46)
!74 = !DILocation(line: 74, column: 1, scope: !46)
!75 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 77, type: !17, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!76 = !DILocalVariable(name: "data", scope: !75, file: !1, line: 79, type: !3)
!77 = !DILocation(line: 79, column: 15, scope: !75)
!78 = !DILocation(line: 80, column: 10, scope: !75)
!79 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !1, line: 85, type: !3)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 83, column: 9)
!81 = distinct !DILexicalBlock(scope: !82, file: !1, line: 82, column: 5)
!82 = distinct !DILexicalBlock(scope: !75, file: !1, line: 81, column: 8)
!83 = !DILocation(line: 85, column: 23, scope: !80)
!84 = !DILocation(line: 85, column: 47, scope: !80)
!85 = !DILocation(line: 85, column: 36, scope: !80)
!86 = !DILocation(line: 86, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !80, file: !1, line: 86, column: 17)
!88 = !DILocation(line: 86, column: 28, scope: !87)
!89 = !DILocation(line: 86, column: 17, scope: !80)
!90 = !DILocation(line: 88, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !1, line: 87, column: 13)
!92 = !DILocation(line: 89, column: 17, scope: !91)
!93 = !DILocation(line: 91, column: 21, scope: !80)
!94 = !DILocation(line: 91, column: 13, scope: !80)
!95 = !DILocation(line: 92, column: 13, scope: !80)
!96 = !DILocation(line: 92, column: 31, scope: !80)
!97 = !DILocation(line: 93, column: 20, scope: !80)
!98 = !DILocation(line: 93, column: 18, scope: !80)
!99 = !DILocation(line: 96, column: 16, scope: !75)
!100 = !DILocation(line: 96, column: 5, scope: !75)
!101 = !DILocation(line: 98, column: 10, scope: !75)
!102 = !DILocation(line: 98, column: 5, scope: !75)
!103 = !DILocation(line: 99, column: 1, scope: !75)
