; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  %call = call i32* @wmemset(i32* noundef getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63_bad.dataBuffer, i64 0, i64 0), i32 noundef 65, i64 noundef 99) #5, !dbg !29
  store i32 0, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63_bad.dataBuffer, i64 0, i64 99), align 4, !dbg !31
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !32
  call void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63b_badSink(i32** noundef %data), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63b_badSink(i32** noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63_good() #0 !dbg !35 {
entry:
  call void @goodG2B(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !38 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !39, metadata !DIExpression()), !dbg !40
  store i32* null, i32** %data, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !42, metadata !DIExpression()), !dbg !44
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !45
  %0 = bitcast i8* %call to i32*, !dbg !46
  store i32* %0, i32** %dataBuffer, align 8, !dbg !44
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !47
  %cmp = icmp eq i32* %1, null, !dbg !49
  br i1 %cmp, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !51
  call void @exit(i32 noundef 1) #6, !dbg !53
  unreachable, !dbg !53

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !54
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !55
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !56
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !56
  store i32 0, i32* %arrayidx, align 4, !dbg !57
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !58
  store i32* %4, i32** %data, align 8, !dbg !59
  call void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63b_goodG2BSink(i32** noundef %data), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63b_goodG2BSink(i32** noundef) #3

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
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63_bad", scope: !3, file: !3, line: 26, type: !4, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "baa1acfee197ac097204ae81a29431e2")
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
!28 = !DILocation(line: 29, column: 10, scope: !2)
!29 = !DILocation(line: 33, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !2, file: !3, line: 30, column: 5)
!31 = !DILocation(line: 34, column: 27, scope: !30)
!32 = !DILocation(line: 35, column: 14, scope: !30)
!33 = !DILocation(line: 37, column: 5, scope: !2)
!34 = !DILocation(line: 38, column: 1, scope: !2)
!35 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_static_63_good", scope: !3, file: !3, line: 66, type: !4, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !14)
!36 = !DILocation(line: 68, column: 5, scope: !35)
!37 = !DILocation(line: 69, column: 1, scope: !35)
!38 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 47, type: !4, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !14)
!39 = !DILocalVariable(name: "data", scope: !38, file: !3, line: 49, type: !8)
!40 = !DILocation(line: 49, column: 15, scope: !38)
!41 = !DILocation(line: 50, column: 10, scope: !38)
!42 = !DILocalVariable(name: "dataBuffer", scope: !43, file: !3, line: 53, type: !8)
!43 = distinct !DILexicalBlock(scope: !38, file: !3, line: 51, column: 5)
!44 = !DILocation(line: 53, column: 19, scope: !43)
!45 = !DILocation(line: 53, column: 43, scope: !43)
!46 = !DILocation(line: 53, column: 32, scope: !43)
!47 = !DILocation(line: 54, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !43, file: !3, line: 54, column: 13)
!49 = !DILocation(line: 54, column: 24, scope: !48)
!50 = !DILocation(line: 54, column: 13, scope: !43)
!51 = !DILocation(line: 56, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !3, line: 55, column: 9)
!53 = !DILocation(line: 57, column: 13, scope: !52)
!54 = !DILocation(line: 59, column: 17, scope: !43)
!55 = !DILocation(line: 59, column: 9, scope: !43)
!56 = !DILocation(line: 60, column: 9, scope: !43)
!57 = !DILocation(line: 60, column: 27, scope: !43)
!58 = !DILocation(line: 61, column: 16, scope: !43)
!59 = !DILocation(line: 61, column: 14, scope: !43)
!60 = !DILocation(line: 63, column: 5, scope: !38)
!61 = !DILocation(line: 64, column: 1, scope: !38)
