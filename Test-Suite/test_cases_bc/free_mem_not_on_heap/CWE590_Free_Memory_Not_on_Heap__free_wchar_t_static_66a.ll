; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !28, metadata !DIExpression()), !dbg !32
  store i32* null, i32** %data, align 8, !dbg !33
  %call = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !34
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !36
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !39
  store i32* %0, i32** %arrayidx, align 16, !dbg !40
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !41
  call void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66b_badSink(i32** noundef %arraydecay), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66b_badSink(i32** noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !47 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !50, metadata !DIExpression()), !dbg !51
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
  %5 = load i32*, i32** %data, align 8, !dbg !71
  %arrayidx2 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !72
  store i32* %5, i32** %arrayidx2, align 16, !dbg !73
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !74
  call void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66b_goodG2BSink(i32** noundef %arraydecay), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66b_goodG2BSink(i32** noundef) #3

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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 33, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66_bad", scope: !3, file: !3, line: 26, type: !4, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "6eb514062dd3ad4b6bc68e56cf8c27ab")
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
!26 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 28, type: !8)
!27 = !DILocation(line: 28, column: 15, scope: !2)
!28 = !DILocalVariable(name: "dataArray", scope: !2, file: !3, line: 29, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 320, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 5)
!32 = !DILocation(line: 29, column: 15, scope: !2)
!33 = !DILocation(line: 30, column: 10, scope: !2)
!34 = !DILocation(line: 34, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !2, file: !3, line: 31, column: 5)
!36 = !DILocation(line: 35, column: 27, scope: !35)
!37 = !DILocation(line: 36, column: 14, scope: !35)
!38 = !DILocation(line: 39, column: 20, scope: !2)
!39 = !DILocation(line: 39, column: 5, scope: !2)
!40 = !DILocation(line: 39, column: 18, scope: !2)
!41 = !DILocation(line: 40, column: 69, scope: !2)
!42 = !DILocation(line: 40, column: 5, scope: !2)
!43 = !DILocation(line: 41, column: 1, scope: !2)
!44 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_66_good", scope: !3, file: !3, line: 71, type: !4, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!45 = !DILocation(line: 73, column: 5, scope: !44)
!46 = !DILocation(line: 74, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 50, type: !4, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!48 = !DILocalVariable(name: "data", scope: !47, file: !3, line: 52, type: !8)
!49 = !DILocation(line: 52, column: 15, scope: !47)
!50 = !DILocalVariable(name: "dataArray", scope: !47, file: !3, line: 53, type: !29)
!51 = !DILocation(line: 53, column: 15, scope: !47)
!52 = !DILocation(line: 54, column: 10, scope: !47)
!53 = !DILocalVariable(name: "dataBuffer", scope: !54, file: !3, line: 57, type: !8)
!54 = distinct !DILexicalBlock(scope: !47, file: !3, line: 55, column: 5)
!55 = !DILocation(line: 57, column: 19, scope: !54)
!56 = !DILocation(line: 57, column: 43, scope: !54)
!57 = !DILocation(line: 57, column: 32, scope: !54)
!58 = !DILocation(line: 58, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !3, line: 58, column: 13)
!60 = !DILocation(line: 58, column: 24, scope: !59)
!61 = !DILocation(line: 58, column: 13, scope: !54)
!62 = !DILocation(line: 60, column: 13, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !3, line: 59, column: 9)
!64 = !DILocation(line: 61, column: 13, scope: !63)
!65 = !DILocation(line: 63, column: 17, scope: !54)
!66 = !DILocation(line: 63, column: 9, scope: !54)
!67 = !DILocation(line: 64, column: 9, scope: !54)
!68 = !DILocation(line: 64, column: 27, scope: !54)
!69 = !DILocation(line: 65, column: 16, scope: !54)
!70 = !DILocation(line: 65, column: 14, scope: !54)
!71 = !DILocation(line: 67, column: 20, scope: !47)
!72 = !DILocation(line: 67, column: 5, scope: !47)
!73 = !DILocation(line: 67, column: 18, scope: !47)
!74 = !DILocation(line: 68, column: 73, scope: !47)
!75 = !DILocation(line: 68, column: 5, scope: !47)
!76 = !DILocation(line: 69, column: 1, scope: !47)
