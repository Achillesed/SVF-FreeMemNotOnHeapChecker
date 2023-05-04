; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_63a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_63_bad() #0 !dbg !16 {
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
  call void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_63b_badSink(i32** noundef %data), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_63b_badSink(i32** noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_63_good() #0 !dbg !36 {
entry:
  call void @goodG2B(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !39 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !40, metadata !DIExpression()), !dbg !41
  store i32* null, i32** %data, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !43, metadata !DIExpression()), !dbg !45
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !46
  %0 = bitcast i8* %call to i32*, !dbg !47
  store i32* %0, i32** %dataBuffer, align 8, !dbg !45
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !48
  %cmp = icmp eq i32* %1, null, !dbg !50
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @exit(i32 noundef 1) #6, !dbg !54
  unreachable, !dbg !54

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !55
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !56
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !57
  store i32 0, i32* %arrayidx, align 4, !dbg !58
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !59
  store i32* %4, i32** %data, align 8, !dbg !60
  call void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_63b_goodG2BSink(i32** noundef %data), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_63b_goodG2BSink(i32** noundef) #3

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_63a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "9555fa5940f73e3a60b3d92d3595561d")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_63_bad", scope: !1, file: !1, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 28, type: !3)
!21 = !DILocation(line: 28, column: 15, scope: !16)
!22 = !DILocation(line: 29, column: 10, scope: !16)
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
!34 = !DILocation(line: 37, column: 5, scope: !16)
!35 = !DILocation(line: 38, column: 1, scope: !16)
!36 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_63_good", scope: !1, file: !1, line: 66, type: !17, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!37 = !DILocation(line: 68, column: 5, scope: !36)
!38 = !DILocation(line: 69, column: 1, scope: !36)
!39 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 47, type: !17, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!40 = !DILocalVariable(name: "data", scope: !39, file: !1, line: 49, type: !3)
!41 = !DILocation(line: 49, column: 15, scope: !39)
!42 = !DILocation(line: 50, column: 10, scope: !39)
!43 = !DILocalVariable(name: "dataBuffer", scope: !44, file: !1, line: 53, type: !3)
!44 = distinct !DILexicalBlock(scope: !39, file: !1, line: 51, column: 5)
!45 = !DILocation(line: 53, column: 19, scope: !44)
!46 = !DILocation(line: 53, column: 43, scope: !44)
!47 = !DILocation(line: 53, column: 32, scope: !44)
!48 = !DILocation(line: 54, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !44, file: !1, line: 54, column: 13)
!50 = !DILocation(line: 54, column: 24, scope: !49)
!51 = !DILocation(line: 54, column: 13, scope: !44)
!52 = !DILocation(line: 56, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !1, line: 55, column: 9)
!54 = !DILocation(line: 57, column: 13, scope: !53)
!55 = !DILocation(line: 59, column: 17, scope: !44)
!56 = !DILocation(line: 59, column: 9, scope: !44)
!57 = !DILocation(line: 60, column: 9, scope: !44)
!58 = !DILocation(line: 60, column: 27, scope: !44)
!59 = !DILocation(line: 61, column: 16, scope: !44)
!60 = !DILocation(line: 61, column: 14, scope: !44)
!61 = !DILocation(line: 63, column: 5, scope: !39)
!62 = !DILocation(line: 64, column: 1, scope: !39)
