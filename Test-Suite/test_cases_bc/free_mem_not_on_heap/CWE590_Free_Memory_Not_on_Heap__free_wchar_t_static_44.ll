; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_44.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_44_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_44_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !28, metadata !DIExpression()), !dbg !32
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !32
  store i32* null, i32** %data, align 8, !dbg !33
  %call = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_44_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !34
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_44_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !36
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_44_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !37
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !38
  %1 = load i32*, i32** %data, align 8, !dbg !39
  call void %0(i32* noundef %1), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink(i32* noundef %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i32*, i32** %data.addr, align 8, !dbg !44
  call void @printWLine(i32* noundef %0), !dbg !45
  %1 = load i32*, i32** %data.addr, align 8, !dbg !46
  %2 = bitcast i32* %1 to i8*, !dbg !46
  call void @free(i8* noundef %2) #5, !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_44_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !52 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !55, metadata !DIExpression()), !dbg !56
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !56
  store i32* null, i32** %data, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !58, metadata !DIExpression()), !dbg !60
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !61
  %0 = bitcast i8* %call to i32*, !dbg !62
  store i32* %0, i32** %dataBuffer, align 8, !dbg !60
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !63
  %cmp = icmp eq i32* %1, null, !dbg !65
  br i1 %cmp, label %if.then, label %if.end, !dbg !66

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @exit(i32 noundef 1) #6, !dbg !69
  unreachable, !dbg !69

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !70
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !71
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !72
  store i32 0, i32* %arrayidx, align 4, !dbg !73
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  store i32* %4, i32** %data, align 8, !dbg !75
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !76
  %6 = load i32*, i32** %data, align 8, !dbg !77
  call void %5(i32* noundef %6), !dbg !76
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink(i32* noundef %data) #0 !dbg !79 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = load i32*, i32** %data.addr, align 8, !dbg !82
  call void @printWLine(i32* noundef %0), !dbg !83
  %1 = load i32*, i32** %data.addr, align 8, !dbg !84
  %2 = bitcast i32* %1 to i8*, !dbg !84
  call void @free(i8* noundef %2) #5, !dbg !85
  ret void, !dbg !86
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

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!18, !19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 38, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_44_bad", scope: !3, file: !3, line: 30, type: !4, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_44.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1d3f7c0a8f80fb8a7614263a9654251d")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !13, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !12}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !{!0}
!14 = !{}
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 100)
!18 = !{i32 7, !"Dwarf Version", i32 5}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"PIC Level", i32 2}
!22 = !{i32 7, !"PIE Level", i32 2}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!26 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 32, type: !8)
!27 = !DILocation(line: 32, column: 15, scope: !2)
!28 = !DILocalVariable(name: "funcPtr", scope: !2, file: !3, line: 34, type: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DISubroutineType(types: !31)
!31 = !{null, !8}
!32 = !DILocation(line: 34, column: 12, scope: !2)
!33 = !DILocation(line: 35, column: 10, scope: !2)
!34 = !DILocation(line: 39, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !2, file: !3, line: 36, column: 5)
!36 = !DILocation(line: 40, column: 27, scope: !35)
!37 = !DILocation(line: 41, column: 14, scope: !35)
!38 = !DILocation(line: 44, column: 5, scope: !2)
!39 = !DILocation(line: 44, column: 13, scope: !2)
!40 = !DILocation(line: 45, column: 1, scope: !2)
!41 = distinct !DISubprogram(name: "badSink", scope: !3, file: !3, line: 23, type: !30, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !3, line: 23, type: !8)
!43 = !DILocation(line: 23, column: 31, scope: !41)
!44 = !DILocation(line: 25, column: 16, scope: !41)
!45 = !DILocation(line: 25, column: 5, scope: !41)
!46 = !DILocation(line: 27, column: 10, scope: !41)
!47 = !DILocation(line: 27, column: 5, scope: !41)
!48 = !DILocation(line: 28, column: 1, scope: !41)
!49 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_44_good", scope: !3, file: !3, line: 79, type: !4, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!50 = !DILocation(line: 81, column: 5, scope: !49)
!51 = !DILocation(line: 82, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 59, type: !4, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!53 = !DILocalVariable(name: "data", scope: !52, file: !3, line: 61, type: !8)
!54 = !DILocation(line: 61, column: 15, scope: !52)
!55 = !DILocalVariable(name: "funcPtr", scope: !52, file: !3, line: 62, type: !29)
!56 = !DILocation(line: 62, column: 12, scope: !52)
!57 = !DILocation(line: 63, column: 10, scope: !52)
!58 = !DILocalVariable(name: "dataBuffer", scope: !59, file: !3, line: 66, type: !8)
!59 = distinct !DILexicalBlock(scope: !52, file: !3, line: 64, column: 5)
!60 = !DILocation(line: 66, column: 19, scope: !59)
!61 = !DILocation(line: 66, column: 43, scope: !59)
!62 = !DILocation(line: 66, column: 32, scope: !59)
!63 = !DILocation(line: 67, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !3, line: 67, column: 13)
!65 = !DILocation(line: 67, column: 24, scope: !64)
!66 = !DILocation(line: 67, column: 13, scope: !59)
!67 = !DILocation(line: 69, column: 13, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !3, line: 68, column: 9)
!69 = !DILocation(line: 70, column: 13, scope: !68)
!70 = !DILocation(line: 72, column: 17, scope: !59)
!71 = !DILocation(line: 72, column: 9, scope: !59)
!72 = !DILocation(line: 73, column: 9, scope: !59)
!73 = !DILocation(line: 73, column: 27, scope: !59)
!74 = !DILocation(line: 74, column: 16, scope: !59)
!75 = !DILocation(line: 74, column: 14, scope: !59)
!76 = !DILocation(line: 76, column: 5, scope: !52)
!77 = !DILocation(line: 76, column: 13, scope: !52)
!78 = !DILocation(line: 77, column: 1, scope: !52)
!79 = distinct !DISubprogram(name: "goodG2BSink", scope: !3, file: !3, line: 52, type: !30, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!80 = !DILocalVariable(name: "data", arg: 1, scope: !79, file: !3, line: 52, type: !8)
!81 = !DILocation(line: 52, column: 35, scope: !79)
!82 = !DILocation(line: 54, column: 16, scope: !79)
!83 = !DILocation(line: 54, column: 5, scope: !79)
!84 = !DILocation(line: 56, column: 10, scope: !79)
!85 = !DILocation(line: 56, column: 5, scope: !79)
!86 = !DILocation(line: 57, column: 1, scope: !79)
