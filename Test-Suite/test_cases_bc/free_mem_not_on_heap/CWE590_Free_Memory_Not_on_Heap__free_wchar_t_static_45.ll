; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45_badData = internal global i32* null, align 8, !dbg !14
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1
@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45_goodG2BData = internal global i32* null, align 8, !dbg !16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !30, metadata !DIExpression()), !dbg !31
  store i32* null, i32** %data, align 8, !dbg !32
  %call = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !33
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !35
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !36
  %0 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %0, i32** @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45_badData, align 8, !dbg !38
  call void @badSink(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink() #0 !dbg !44 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i32*, i32** @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45_badData, align 8, !dbg !47
  store i32* %0, i32** %data, align 8, !dbg !46
  %1 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* noundef %1), !dbg !49
  %2 = load i32*, i32** %data, align 8, !dbg !50
  %3 = bitcast i32* %2 to i8*, !dbg !50
  call void @free(i8* noundef %3) #5, !dbg !51
  ret void, !dbg !52
}

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !53 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !54, metadata !DIExpression()), !dbg !55
  store i32* null, i32** %data, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !57, metadata !DIExpression()), !dbg !59
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !60
  %0 = bitcast i8* %call to i32*, !dbg !61
  store i32* %0, i32** %dataBuffer, align 8, !dbg !59
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !62
  %cmp = icmp eq i32* %1, null, !dbg !64
  br i1 %cmp, label %if.then, label %if.end, !dbg !65

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @exit(i32 noundef 1) #6, !dbg !68
  unreachable, !dbg !68

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !69
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !70
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !71
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !71
  store i32 0, i32* %arrayidx, align 4, !dbg !72
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !73
  store i32* %4, i32** %data, align 8, !dbg !74
  %5 = load i32*, i32** %data, align 8, !dbg !75
  store i32* %5, i32** @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45_goodG2BData, align 8, !dbg !76
  call void @goodG2BSink(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = load i32*, i32** @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45_goodG2BData, align 8, !dbg !82
  store i32* %0, i32** %data, align 8, !dbg !81
  %1 = load i32*, i32** %data, align 8, !dbg !83
  call void @printWLine(i32* noundef %1), !dbg !84
  %2 = load i32*, i32** %data, align 8, !dbg !85
  %3 = bitcast i32* %2 to i8*, !dbg !85
  call void @free(i8* noundef %3) #5, !dbg !86
  ret void, !dbg !87
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 40, type: !19, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45_bad", scope: !3, file: !3, line: 34, type: !4, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "6f1db1e30a90e79e26bc7263e8f1c485")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !13, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !12}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !10, line: 74, baseType: !11)
!10 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !{!0, !14, !16}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45_badData", scope: !6, file: !3, line: 21, type: !8, isLocal: true, isDefinition: true)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45_goodG2BData", scope: !6, file: !3, line: 22, type: !8, isLocal: true, isDefinition: true)
!18 = !{}
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 100)
!22 = !{i32 7, !"Dwarf Version", i32 5}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"PIC Level", i32 2}
!26 = !{i32 7, !"PIE Level", i32 2}
!27 = !{i32 7, !"uwtable", i32 1}
!28 = !{i32 7, !"frame-pointer", i32 2}
!29 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!30 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 36, type: !8)
!31 = !DILocation(line: 36, column: 15, scope: !2)
!32 = !DILocation(line: 37, column: 10, scope: !2)
!33 = !DILocation(line: 41, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !2, file: !3, line: 38, column: 5)
!35 = !DILocation(line: 42, column: 27, scope: !34)
!36 = !DILocation(line: 43, column: 14, scope: !34)
!37 = !DILocation(line: 45, column: 70, scope: !2)
!38 = !DILocation(line: 45, column: 68, scope: !2)
!39 = !DILocation(line: 46, column: 5, scope: !2)
!40 = !DILocation(line: 47, column: 1, scope: !2)
!41 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_45_good", scope: !3, file: !3, line: 82, type: !4, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!42 = !DILocation(line: 84, column: 5, scope: !41)
!43 = !DILocation(line: 85, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "badSink", scope: !3, file: !3, line: 26, type: !4, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!45 = !DILocalVariable(name: "data", scope: !44, file: !3, line: 28, type: !8)
!46 = !DILocation(line: 28, column: 15, scope: !44)
!47 = !DILocation(line: 28, column: 22, scope: !44)
!48 = !DILocation(line: 29, column: 16, scope: !44)
!49 = !DILocation(line: 29, column: 5, scope: !44)
!50 = !DILocation(line: 31, column: 10, scope: !44)
!51 = !DILocation(line: 31, column: 5, scope: !44)
!52 = !DILocation(line: 32, column: 1, scope: !44)
!53 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 62, type: !4, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!54 = !DILocalVariable(name: "data", scope: !53, file: !3, line: 64, type: !8)
!55 = !DILocation(line: 64, column: 15, scope: !53)
!56 = !DILocation(line: 65, column: 10, scope: !53)
!57 = !DILocalVariable(name: "dataBuffer", scope: !58, file: !3, line: 68, type: !8)
!58 = distinct !DILexicalBlock(scope: !53, file: !3, line: 66, column: 5)
!59 = !DILocation(line: 68, column: 19, scope: !58)
!60 = !DILocation(line: 68, column: 43, scope: !58)
!61 = !DILocation(line: 68, column: 32, scope: !58)
!62 = !DILocation(line: 69, column: 13, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !3, line: 69, column: 13)
!64 = !DILocation(line: 69, column: 24, scope: !63)
!65 = !DILocation(line: 69, column: 13, scope: !58)
!66 = !DILocation(line: 71, column: 13, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !3, line: 70, column: 9)
!68 = !DILocation(line: 72, column: 13, scope: !67)
!69 = !DILocation(line: 74, column: 17, scope: !58)
!70 = !DILocation(line: 74, column: 9, scope: !58)
!71 = !DILocation(line: 75, column: 9, scope: !58)
!72 = !DILocation(line: 75, column: 27, scope: !58)
!73 = !DILocation(line: 76, column: 16, scope: !58)
!74 = !DILocation(line: 76, column: 14, scope: !58)
!75 = !DILocation(line: 78, column: 74, scope: !53)
!76 = !DILocation(line: 78, column: 72, scope: !53)
!77 = !DILocation(line: 79, column: 5, scope: !53)
!78 = !DILocation(line: 80, column: 1, scope: !53)
!79 = distinct !DISubprogram(name: "goodG2BSink", scope: !3, file: !3, line: 54, type: !4, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!80 = !DILocalVariable(name: "data", scope: !79, file: !3, line: 56, type: !8)
!81 = !DILocation(line: 56, column: 15, scope: !79)
!82 = !DILocation(line: 56, column: 22, scope: !79)
!83 = !DILocation(line: 57, column: 16, scope: !79)
!84 = !DILocation(line: 57, column: 5, scope: !79)
!85 = !DILocation(line: 59, column: 10, scope: !79)
!86 = !DILocation(line: 59, column: 5, scope: !79)
!87 = !DILocation(line: 60, column: 1, scope: !79)
