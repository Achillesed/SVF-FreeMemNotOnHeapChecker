; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_15.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_15_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_15_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  %call = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_15_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !29
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_15_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !31
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_15_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  call void @printWLine(i32* noundef %0), !dbg !34
  %1 = load i32*, i32** %data, align 8, !dbg !35
  %2 = bitcast i32* %1 to i8*, !dbg !35
  call void @free(i8* noundef %2) #5, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_15_good() #0 !dbg !38 {
entry:
  call void @goodG2B1(), !dbg !39
  call void @goodG2B2(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !42 {
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

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i32* null, i32** %data, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !73, metadata !DIExpression()), !dbg !75
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !76
  %0 = bitcast i8* %call to i32*, !dbg !77
  store i32* %0, i32** %dataBuffer, align 8, !dbg !75
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !78
  %cmp = icmp eq i32* %1, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @exit(i32 noundef 1) #6, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !86
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !89
  store i32* %4, i32** %data, align 8, !dbg !90
  %5 = load i32*, i32** %data, align 8, !dbg !91
  call void @printWLine(i32* noundef %5), !dbg !92
  %6 = load i32*, i32** %data, align 8, !dbg !93
  %7 = bitcast i32* %6 to i8*, !dbg !93
  call void @free(i8* noundef %7) #5, !dbg !94
  ret void, !dbg !95
}

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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 32, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_15_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_15.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "55cb5efccc91887787aa231f47478ec5")
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
!26 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 25, type: !8)
!27 = !DILocation(line: 25, column: 15, scope: !2)
!28 = !DILocation(line: 26, column: 10, scope: !2)
!29 = !DILocation(line: 33, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !2, file: !3, line: 30, column: 5)
!31 = !DILocation(line: 34, column: 27, scope: !30)
!32 = !DILocation(line: 35, column: 14, scope: !30)
!33 = !DILocation(line: 43, column: 16, scope: !2)
!34 = !DILocation(line: 43, column: 5, scope: !2)
!35 = !DILocation(line: 45, column: 10, scope: !2)
!36 = !DILocation(line: 45, column: 5, scope: !2)
!37 = !DILocation(line: 46, column: 1, scope: !2)
!38 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_15_good", scope: !3, file: !3, line: 114, type: !4, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!39 = !DILocation(line: 116, column: 5, scope: !38)
!40 = !DILocation(line: 117, column: 5, scope: !38)
!41 = !DILocation(line: 118, column: 1, scope: !38)
!42 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 53, type: !4, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!43 = !DILocalVariable(name: "data", scope: !42, file: !3, line: 55, type: !8)
!44 = !DILocation(line: 55, column: 15, scope: !42)
!45 = !DILocation(line: 56, column: 10, scope: !42)
!46 = !DILocalVariable(name: "dataBuffer", scope: !47, file: !3, line: 66, type: !8)
!47 = distinct !DILexicalBlock(scope: !42, file: !3, line: 64, column: 5)
!48 = !DILocation(line: 66, column: 19, scope: !47)
!49 = !DILocation(line: 66, column: 43, scope: !47)
!50 = !DILocation(line: 66, column: 32, scope: !47)
!51 = !DILocation(line: 67, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !47, file: !3, line: 67, column: 13)
!53 = !DILocation(line: 67, column: 24, scope: !52)
!54 = !DILocation(line: 67, column: 13, scope: !47)
!55 = !DILocation(line: 69, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !3, line: 68, column: 9)
!57 = !DILocation(line: 70, column: 13, scope: !56)
!58 = !DILocation(line: 72, column: 17, scope: !47)
!59 = !DILocation(line: 72, column: 9, scope: !47)
!60 = !DILocation(line: 73, column: 9, scope: !47)
!61 = !DILocation(line: 73, column: 27, scope: !47)
!62 = !DILocation(line: 74, column: 16, scope: !47)
!63 = !DILocation(line: 74, column: 14, scope: !47)
!64 = !DILocation(line: 78, column: 16, scope: !42)
!65 = !DILocation(line: 78, column: 5, scope: !42)
!66 = !DILocation(line: 80, column: 10, scope: !42)
!67 = !DILocation(line: 80, column: 5, scope: !42)
!68 = !DILocation(line: 81, column: 1, scope: !42)
!69 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 84, type: !4, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!70 = !DILocalVariable(name: "data", scope: !69, file: !3, line: 86, type: !8)
!71 = !DILocation(line: 86, column: 15, scope: !69)
!72 = !DILocation(line: 87, column: 10, scope: !69)
!73 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !3, line: 93, type: !8)
!74 = distinct !DILexicalBlock(scope: !69, file: !3, line: 91, column: 5)
!75 = !DILocation(line: 93, column: 19, scope: !74)
!76 = !DILocation(line: 93, column: 43, scope: !74)
!77 = !DILocation(line: 93, column: 32, scope: !74)
!78 = !DILocation(line: 94, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !3, line: 94, column: 13)
!80 = !DILocation(line: 94, column: 24, scope: !79)
!81 = !DILocation(line: 94, column: 13, scope: !74)
!82 = !DILocation(line: 96, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !3, line: 95, column: 9)
!84 = !DILocation(line: 97, column: 13, scope: !83)
!85 = !DILocation(line: 99, column: 17, scope: !74)
!86 = !DILocation(line: 99, column: 9, scope: !74)
!87 = !DILocation(line: 100, column: 9, scope: !74)
!88 = !DILocation(line: 100, column: 27, scope: !74)
!89 = !DILocation(line: 101, column: 16, scope: !74)
!90 = !DILocation(line: 101, column: 14, scope: !74)
!91 = !DILocation(line: 109, column: 16, scope: !69)
!92 = !DILocation(line: 109, column: 5, scope: !69)
!93 = !DILocation(line: 111, column: 10, scope: !69)
!94 = !DILocation(line: 111, column: 5, scope: !69)
!95 = !DILocation(line: 112, column: 1, scope: !69)
