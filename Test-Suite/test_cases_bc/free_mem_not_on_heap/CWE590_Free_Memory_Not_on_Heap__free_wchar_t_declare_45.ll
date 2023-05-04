; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_45.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1
@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_45_goodG2BData = internal global i32* null, align 8, !dbg !11

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !34
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 99) #5, !dbg !35
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay1, i32** %data, align 8, !dbg !39
  %0 = load i32*, i32** %data, align 8, !dbg !40
  store i32* %0, i32** @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_45_badData, align 8, !dbg !41
  call void @badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_45_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink() #0 !dbg !47 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !48, metadata !DIExpression()), !dbg !49
  %0 = load i32*, i32** @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_45_badData, align 8, !dbg !50
  store i32* %0, i32** %data, align 8, !dbg !49
  %1 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* noundef %1), !dbg !52
  %2 = load i32*, i32** %data, align 8, !dbg !53
  %3 = bitcast i32* %2 to i8*, !dbg !53
  call void @free(i8* noundef %3) #5, !dbg !54
  ret void, !dbg !55
}

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !56 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !57, metadata !DIExpression()), !dbg !58
  store i32* null, i32** %data, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !60, metadata !DIExpression()), !dbg !62
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !63
  %0 = bitcast i8* %call to i32*, !dbg !64
  store i32* %0, i32** %dataBuffer, align 8, !dbg !62
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !65
  %cmp = icmp eq i32* %1, null, !dbg !67
  br i1 %cmp, label %if.then, label %if.end, !dbg !68

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @exit(i32 noundef 1) #6, !dbg !71
  unreachable, !dbg !71

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !72
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !73
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !74
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !76
  store i32* %4, i32** %data, align 8, !dbg !77
  %5 = load i32*, i32** %data, align 8, !dbg !78
  store i32* %5, i32** @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_45_goodG2BData, align 8, !dbg !79
  call void @goodG2BSink(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = load i32*, i32** @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_45_goodG2BData, align 8, !dbg !85
  store i32* %0, i32** %data, align 8, !dbg !84
  %1 = load i32*, i32** %data, align 8, !dbg !86
  call void @printWLine(i32* noundef %1), !dbg !87
  %2 = load i32*, i32** %data, align 8, !dbg !88
  %3 = bitcast i32* %2 to i8*, !dbg !88
  call void @free(i8* noundef %3) #5, !dbg !89
  ret void, !dbg !90
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_45_badData", scope: !2, file: !3, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_45.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "c7817861a12bd2c651e198498746d801")
!4 = !{!5, !9}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_45_goodG2BData", scope: !2, file: !3, line: 22, type: !5, isLocal: true, isDefinition: true)
!13 = !{i32 7, !"Dwarf Version", i32 5}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"PIE Level", i32 2}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!21 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_45_bad", scope: !3, file: !3, line: 34, type: !22, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !{}
!25 = !DILocalVariable(name: "data", scope: !21, file: !3, line: 36, type: !5)
!26 = !DILocation(line: 36, column: 15, scope: !21)
!27 = !DILocation(line: 37, column: 10, scope: !21)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !3, line: 40, type: !30)
!29 = distinct !DILexicalBlock(scope: !21, file: !3, line: 38, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 40, column: 17, scope: !29)
!34 = !DILocation(line: 41, column: 17, scope: !29)
!35 = !DILocation(line: 41, column: 9, scope: !29)
!36 = !DILocation(line: 42, column: 9, scope: !29)
!37 = !DILocation(line: 42, column: 27, scope: !29)
!38 = !DILocation(line: 43, column: 16, scope: !29)
!39 = !DILocation(line: 43, column: 14, scope: !29)
!40 = !DILocation(line: 45, column: 71, scope: !21)
!41 = !DILocation(line: 45, column: 69, scope: !21)
!42 = !DILocation(line: 46, column: 5, scope: !21)
!43 = !DILocation(line: 47, column: 1, scope: !21)
!44 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_45_good", scope: !3, file: !3, line: 82, type: !22, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!45 = !DILocation(line: 84, column: 5, scope: !44)
!46 = !DILocation(line: 85, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "badSink", scope: !3, file: !3, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!48 = !DILocalVariable(name: "data", scope: !47, file: !3, line: 28, type: !5)
!49 = !DILocation(line: 28, column: 15, scope: !47)
!50 = !DILocation(line: 28, column: 22, scope: !47)
!51 = !DILocation(line: 29, column: 16, scope: !47)
!52 = !DILocation(line: 29, column: 5, scope: !47)
!53 = !DILocation(line: 31, column: 10, scope: !47)
!54 = !DILocation(line: 31, column: 5, scope: !47)
!55 = !DILocation(line: 32, column: 1, scope: !47)
!56 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 62, type: !22, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!57 = !DILocalVariable(name: "data", scope: !56, file: !3, line: 64, type: !5)
!58 = !DILocation(line: 64, column: 15, scope: !56)
!59 = !DILocation(line: 65, column: 10, scope: !56)
!60 = !DILocalVariable(name: "dataBuffer", scope: !61, file: !3, line: 68, type: !5)
!61 = distinct !DILexicalBlock(scope: !56, file: !3, line: 66, column: 5)
!62 = !DILocation(line: 68, column: 19, scope: !61)
!63 = !DILocation(line: 68, column: 43, scope: !61)
!64 = !DILocation(line: 68, column: 32, scope: !61)
!65 = !DILocation(line: 69, column: 13, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !3, line: 69, column: 13)
!67 = !DILocation(line: 69, column: 24, scope: !66)
!68 = !DILocation(line: 69, column: 13, scope: !61)
!69 = !DILocation(line: 71, column: 13, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !3, line: 70, column: 9)
!71 = !DILocation(line: 72, column: 13, scope: !70)
!72 = !DILocation(line: 74, column: 17, scope: !61)
!73 = !DILocation(line: 74, column: 9, scope: !61)
!74 = !DILocation(line: 75, column: 9, scope: !61)
!75 = !DILocation(line: 75, column: 27, scope: !61)
!76 = !DILocation(line: 76, column: 16, scope: !61)
!77 = !DILocation(line: 76, column: 14, scope: !61)
!78 = !DILocation(line: 78, column: 75, scope: !56)
!79 = !DILocation(line: 78, column: 73, scope: !56)
!80 = !DILocation(line: 79, column: 5, scope: !56)
!81 = !DILocation(line: 80, column: 1, scope: !56)
!82 = distinct !DISubprogram(name: "goodG2BSink", scope: !3, file: !3, line: 54, type: !22, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!83 = !DILocalVariable(name: "data", scope: !82, file: !3, line: 56, type: !5)
!84 = !DILocation(line: 56, column: 15, scope: !82)
!85 = !DILocation(line: 56, column: 22, scope: !82)
!86 = !DILocation(line: 57, column: 16, scope: !82)
!87 = !DILocation(line: 57, column: 5, scope: !82)
!88 = !DILocation(line: 59, column: 10, scope: !82)
!89 = !DILocation(line: 59, column: 5, scope: !82)
!90 = !DILocation(line: 60, column: 1, scope: !82)
