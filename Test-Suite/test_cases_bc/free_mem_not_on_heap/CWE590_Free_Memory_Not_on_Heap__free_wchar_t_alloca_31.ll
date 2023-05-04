; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_31.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
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
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !34, metadata !DIExpression()), !dbg !36
  %5 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %5, i32** %dataCopy, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !38, metadata !DIExpression()), !dbg !39
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !40
  store i32* %6, i32** %data1, align 8, !dbg !39
  %7 = load i32*, i32** %data1, align 8, !dbg !41
  call void @printWLine(i32* noundef %7), !dbg !42
  %8 = load i32*, i32** %data1, align 8, !dbg !43
  %9 = bitcast i32* %8 to i8*, !dbg !43
  call void @free(i8* noundef %9) #5, !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_31_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !49 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !50, metadata !DIExpression()), !dbg !51
  store i32* null, i32** %data, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !53, metadata !DIExpression()), !dbg !55
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !56
  %0 = bitcast i8* %call to i32*, !dbg !57
  store i32* %0, i32** %dataBuffer, align 8, !dbg !55
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !58
  %cmp = icmp eq i32* %1, null, !dbg !60
  br i1 %cmp, label %if.then, label %if.end, !dbg !61

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @exit(i32 noundef 1) #6, !dbg !64
  unreachable, !dbg !64

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !65
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !66
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !67
  store i32 0, i32* %arrayidx, align 4, !dbg !68
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !69
  store i32* %4, i32** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !71, metadata !DIExpression()), !dbg !73
  %5 = load i32*, i32** %data, align 8, !dbg !74
  store i32* %5, i32** %dataCopy, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !75, metadata !DIExpression()), !dbg !76
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !77
  store i32* %6, i32** %data2, align 8, !dbg !76
  %7 = load i32*, i32** %data2, align 8, !dbg !78
  call void @printWLine(i32* noundef %7), !dbg !79
  %8 = load i32*, i32** %data2, align 8, !dbg !80
  %9 = bitcast i32* %8 to i8*, !dbg !80
  call void @free(i8* noundef %9) #5, !dbg !81
  ret void, !dbg !82
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_31.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "e7860807b6dd8f592682636fc7940261")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_31_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 25, type: !3)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !1, line: 29, type: !3)
!24 = distinct !DILexicalBlock(scope: !16, file: !1, line: 27, column: 5)
!25 = !DILocation(line: 29, column: 19, scope: !24)
!26 = !DILocation(line: 29, column: 43, scope: !24)
!27 = !DILocation(line: 29, column: 32, scope: !24)
!28 = !DILocation(line: 30, column: 17, scope: !24)
!29 = !DILocation(line: 30, column: 9, scope: !24)
!30 = !DILocation(line: 31, column: 9, scope: !24)
!31 = !DILocation(line: 31, column: 27, scope: !24)
!32 = !DILocation(line: 32, column: 16, scope: !24)
!33 = !DILocation(line: 32, column: 14, scope: !24)
!34 = !DILocalVariable(name: "dataCopy", scope: !35, file: !1, line: 35, type: !3)
!35 = distinct !DILexicalBlock(scope: !16, file: !1, line: 34, column: 5)
!36 = !DILocation(line: 35, column: 19, scope: !35)
!37 = !DILocation(line: 35, column: 30, scope: !35)
!38 = !DILocalVariable(name: "data", scope: !35, file: !1, line: 36, type: !3)
!39 = !DILocation(line: 36, column: 19, scope: !35)
!40 = !DILocation(line: 36, column: 26, scope: !35)
!41 = !DILocation(line: 37, column: 20, scope: !35)
!42 = !DILocation(line: 37, column: 9, scope: !35)
!43 = !DILocation(line: 39, column: 14, scope: !35)
!44 = !DILocation(line: 39, column: 9, scope: !35)
!45 = !DILocation(line: 41, column: 1, scope: !16)
!46 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_31_good", scope: !1, file: !1, line: 73, type: !17, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!47 = !DILocation(line: 75, column: 5, scope: !46)
!48 = !DILocation(line: 76, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!50 = !DILocalVariable(name: "data", scope: !49, file: !1, line: 50, type: !3)
!51 = !DILocation(line: 50, column: 15, scope: !49)
!52 = !DILocation(line: 51, column: 10, scope: !49)
!53 = !DILocalVariable(name: "dataBuffer", scope: !54, file: !1, line: 54, type: !3)
!54 = distinct !DILexicalBlock(scope: !49, file: !1, line: 52, column: 5)
!55 = !DILocation(line: 54, column: 19, scope: !54)
!56 = !DILocation(line: 54, column: 43, scope: !54)
!57 = !DILocation(line: 54, column: 32, scope: !54)
!58 = !DILocation(line: 55, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !1, line: 55, column: 13)
!60 = !DILocation(line: 55, column: 24, scope: !59)
!61 = !DILocation(line: 55, column: 13, scope: !54)
!62 = !DILocation(line: 57, column: 13, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !1, line: 56, column: 9)
!64 = !DILocation(line: 58, column: 13, scope: !63)
!65 = !DILocation(line: 60, column: 17, scope: !54)
!66 = !DILocation(line: 60, column: 9, scope: !54)
!67 = !DILocation(line: 61, column: 9, scope: !54)
!68 = !DILocation(line: 61, column: 27, scope: !54)
!69 = !DILocation(line: 62, column: 16, scope: !54)
!70 = !DILocation(line: 62, column: 14, scope: !54)
!71 = !DILocalVariable(name: "dataCopy", scope: !72, file: !1, line: 65, type: !3)
!72 = distinct !DILexicalBlock(scope: !49, file: !1, line: 64, column: 5)
!73 = !DILocation(line: 65, column: 19, scope: !72)
!74 = !DILocation(line: 65, column: 30, scope: !72)
!75 = !DILocalVariable(name: "data", scope: !72, file: !1, line: 66, type: !3)
!76 = !DILocation(line: 66, column: 19, scope: !72)
!77 = !DILocation(line: 66, column: 26, scope: !72)
!78 = !DILocation(line: 67, column: 20, scope: !72)
!79 = !DILocation(line: 67, column: 9, scope: !72)
!80 = !DILocation(line: 69, column: 14, scope: !72)
!81 = !DILocation(line: 69, column: 9, scope: !72)
!82 = !DILocation(line: 71, column: 1, scope: !49)
