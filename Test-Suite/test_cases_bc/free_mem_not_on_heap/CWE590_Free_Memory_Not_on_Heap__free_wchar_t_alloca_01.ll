; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_01.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_01_bad() #0 !dbg !16 {
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_01_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !42 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !43, metadata !DIExpression()), !dbg !44
  store i32* null, i32** %data, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !46, metadata !DIExpression()), !dbg !48
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !49
  %0 = bitcast i8* %call to i32*, !dbg !50
  store i32* %0, i32** %dataBuffer, align 8, !dbg !48
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !51
  %cmp = icmp eq i32* %1, null, !dbg !53
  br i1 %cmp, label %if.then, label %if.end, !dbg !54

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @exit(i32 noundef 1) #6, !dbg !57
  unreachable, !dbg !57

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !58
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !59
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !60
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !60
  store i32 0, i32* %arrayidx, align 4, !dbg !61
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !62
  store i32* %4, i32** %data, align 8, !dbg !63
  %5 = load i32*, i32** %data, align 8, !dbg !64
  call void @printWLine(i32* noundef %5), !dbg !65
  %6 = load i32*, i32** %data, align 8, !dbg !66
  %7 = bitcast i32* %6 to i8*, !dbg !66
  call void @free(i8* noundef %7) #5, !dbg !67
  ret void, !dbg !68
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_01.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "9551a6988a09581fd75f3ec2cb37c0ef")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_01_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
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
!34 = !DILocation(line: 34, column: 16, scope: !16)
!35 = !DILocation(line: 34, column: 5, scope: !16)
!36 = !DILocation(line: 36, column: 10, scope: !16)
!37 = !DILocation(line: 36, column: 5, scope: !16)
!38 = !DILocation(line: 37, column: 1, scope: !16)
!39 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_01_good", scope: !1, file: !1, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!40 = !DILocation(line: 67, column: 5, scope: !39)
!41 = !DILocation(line: 68, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 44, type: !17, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!43 = !DILocalVariable(name: "data", scope: !42, file: !1, line: 46, type: !3)
!44 = !DILocation(line: 46, column: 15, scope: !42)
!45 = !DILocation(line: 47, column: 10, scope: !42)
!46 = !DILocalVariable(name: "dataBuffer", scope: !47, file: !1, line: 50, type: !3)
!47 = distinct !DILexicalBlock(scope: !42, file: !1, line: 48, column: 5)
!48 = !DILocation(line: 50, column: 19, scope: !47)
!49 = !DILocation(line: 50, column: 43, scope: !47)
!50 = !DILocation(line: 50, column: 32, scope: !47)
!51 = !DILocation(line: 51, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !47, file: !1, line: 51, column: 13)
!53 = !DILocation(line: 51, column: 24, scope: !52)
!54 = !DILocation(line: 51, column: 13, scope: !47)
!55 = !DILocation(line: 53, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !1, line: 52, column: 9)
!57 = !DILocation(line: 54, column: 13, scope: !56)
!58 = !DILocation(line: 56, column: 17, scope: !47)
!59 = !DILocation(line: 56, column: 9, scope: !47)
!60 = !DILocation(line: 57, column: 9, scope: !47)
!61 = !DILocation(line: 57, column: 27, scope: !47)
!62 = !DILocation(line: 58, column: 16, scope: !47)
!63 = !DILocation(line: 58, column: 14, scope: !47)
!64 = !DILocation(line: 60, column: 16, scope: !42)
!65 = !DILocation(line: 60, column: 5, scope: !42)
!66 = !DILocation(line: 62, column: 10, scope: !42)
!67 = !DILocation(line: 62, column: 5, scope: !42)
!68 = !DILocation(line: 63, column: 1, scope: !42)
