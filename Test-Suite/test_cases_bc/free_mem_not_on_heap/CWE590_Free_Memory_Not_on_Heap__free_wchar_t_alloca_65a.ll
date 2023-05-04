; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_65a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_65_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !22, metadata !DIExpression()), !dbg !26
  store void (i32*)* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_65b_badSink, void (i32*)** %funcPtr, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 400, align 16, !dbg !31
  %1 = bitcast i8* %0 to i32*, !dbg !32
  store i32* %1, i32** %dataBuffer, align 8, !dbg !30
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  %call = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !34
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !37
  store i32* %4, i32** %data, align 8, !dbg !38
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  call void %5(i32* noundef %6), !dbg !39
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_65b_badSink(i32* noundef) #2

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_65_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !45 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !48, metadata !DIExpression()), !dbg !49
  store void (i32*)* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_65b_goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !49
  store i32* null, i32** %data, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !51, metadata !DIExpression()), !dbg !53
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !54
  %0 = bitcast i8* %call to i32*, !dbg !55
  store i32* %0, i32** %dataBuffer, align 8, !dbg !53
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !56
  %cmp = icmp eq i32* %1, null, !dbg !58
  br i1 %cmp, label %if.then, label %if.end, !dbg !59

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @exit(i32 noundef 1) #6, !dbg !62
  unreachable, !dbg !62

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !63
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !64
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !65
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !65
  store i32 0, i32* %arrayidx, align 4, !dbg !66
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !67
  store i32* %4, i32** %data, align 8, !dbg !68
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !69
  %6 = load i32*, i32** %data, align 8, !dbg !70
  call void %5(i32* noundef %6), !dbg !69
  ret void, !dbg !71
}

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_65b_goodG2BSink(i32* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_65a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "6b1aa6a2584bd2357e9f4ca8cff6223a")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_65_bad", scope: !1, file: !1, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 28, type: !3)
!21 = !DILocation(line: 28, column: 15, scope: !16)
!22 = !DILocalVariable(name: "funcPtr", scope: !16, file: !1, line: 30, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !3}
!26 = !DILocation(line: 30, column: 12, scope: !16)
!27 = !DILocation(line: 31, column: 10, scope: !16)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !1, line: 34, type: !3)
!29 = distinct !DILexicalBlock(scope: !16, file: !1, line: 32, column: 5)
!30 = !DILocation(line: 34, column: 19, scope: !29)
!31 = !DILocation(line: 34, column: 43, scope: !29)
!32 = !DILocation(line: 34, column: 32, scope: !29)
!33 = !DILocation(line: 35, column: 17, scope: !29)
!34 = !DILocation(line: 35, column: 9, scope: !29)
!35 = !DILocation(line: 36, column: 9, scope: !29)
!36 = !DILocation(line: 36, column: 27, scope: !29)
!37 = !DILocation(line: 37, column: 16, scope: !29)
!38 = !DILocation(line: 37, column: 14, scope: !29)
!39 = !DILocation(line: 40, column: 5, scope: !16)
!40 = !DILocation(line: 40, column: 13, scope: !16)
!41 = !DILocation(line: 41, column: 1, scope: !16)
!42 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_65_good", scope: !1, file: !1, line: 70, type: !17, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!43 = !DILocation(line: 72, column: 5, scope: !42)
!44 = !DILocation(line: 73, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 50, type: !17, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!46 = !DILocalVariable(name: "data", scope: !45, file: !1, line: 52, type: !3)
!47 = !DILocation(line: 52, column: 15, scope: !45)
!48 = !DILocalVariable(name: "funcPtr", scope: !45, file: !1, line: 53, type: !23)
!49 = !DILocation(line: 53, column: 12, scope: !45)
!50 = !DILocation(line: 54, column: 10, scope: !45)
!51 = !DILocalVariable(name: "dataBuffer", scope: !52, file: !1, line: 57, type: !3)
!52 = distinct !DILexicalBlock(scope: !45, file: !1, line: 55, column: 5)
!53 = !DILocation(line: 57, column: 19, scope: !52)
!54 = !DILocation(line: 57, column: 43, scope: !52)
!55 = !DILocation(line: 57, column: 32, scope: !52)
!56 = !DILocation(line: 58, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !52, file: !1, line: 58, column: 13)
!58 = !DILocation(line: 58, column: 24, scope: !57)
!59 = !DILocation(line: 58, column: 13, scope: !52)
!60 = !DILocation(line: 60, column: 13, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !1, line: 59, column: 9)
!62 = !DILocation(line: 61, column: 13, scope: !61)
!63 = !DILocation(line: 63, column: 17, scope: !52)
!64 = !DILocation(line: 63, column: 9, scope: !52)
!65 = !DILocation(line: 64, column: 9, scope: !52)
!66 = !DILocation(line: 64, column: 27, scope: !52)
!67 = !DILocation(line: 65, column: 16, scope: !52)
!68 = !DILocation(line: 65, column: 14, scope: !52)
!69 = !DILocation(line: 67, column: 5, scope: !45)
!70 = !DILocation(line: 67, column: 13, scope: !45)
!71 = !DILocation(line: 68, column: 1, scope: !45)
