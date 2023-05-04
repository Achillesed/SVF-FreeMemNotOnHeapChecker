; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_static_68a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_static_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_char_static_68_bad.dataBuffer = internal global [100 x i8] zeroinitializer, align 16, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_char_static_68_badData = dso_local global i8* null, align 8, !dbg !12
@CWE590_Free_Memory_Not_on_Heap__free_char_static_68_goodG2BData = dso_local global i8* null, align 8, !dbg !14
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_68_bad() #0 !dbg !2 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i8* null, i8** %data, align 8, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_68_bad.dataBuffer, i64 0, i64 0), i8 65, i64 99, i1 false), !dbg !31
  store i8 0, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_68_bad.dataBuffer, i64 0, i64 99), align 1, !dbg !33
  store i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_68_bad.dataBuffer, i64 0, i64 0), i8** %data, align 8, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  store i8* %0, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_static_68_badData, align 8, !dbg !36
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_char_static_68b_badSink(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_static_68b_badSink(...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_68_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !42 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !43, metadata !DIExpression()), !dbg !44
  store i8* null, i8** %data, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !46, metadata !DIExpression()), !dbg !48
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !49
  store i8* %call, i8** %dataBuffer, align 8, !dbg !48
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !50
  %cmp = icmp eq i8* %0, null, !dbg !52
  br i1 %cmp, label %if.then, label %if.end, !dbg !53

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @exit(i32 noundef 1) #7, !dbg !56
  unreachable, !dbg !56

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !58
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !59
  store i8 0, i8* %arrayidx, align 1, !dbg !60
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !61
  store i8* %3, i8** %data, align 8, !dbg !62
  %4 = load i8*, i8** %data, align 8, !dbg !63
  store i8* %4, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_static_68_goodG2BData, align 8, !dbg !64
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_char_static_68b_goodG2BSink(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_static_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!20, !21, !22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 35, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_68_bad", scope: !3, file: !3, line: 29, type: !4, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_static_68a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "c8a2fc3a1e79ba6d771a72bbe4b558a7")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0, !12, !14}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_68_badData", scope: !6, file: !3, line: 21, type: !8, isLocal: false, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_68_goodG2BData", scope: !6, file: !3, line: 22, type: !8, isLocal: false, isDefinition: true)
!16 = !{}
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 800, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 100)
!20 = !{i32 7, !"Dwarf Version", i32 5}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"PIC Level", i32 2}
!24 = !{i32 7, !"PIE Level", i32 2}
!25 = !{i32 7, !"uwtable", i32 1}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!28 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 31, type: !8)
!29 = !DILocation(line: 31, column: 12, scope: !2)
!30 = !DILocation(line: 32, column: 10, scope: !2)
!31 = !DILocation(line: 36, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !2, file: !3, line: 33, column: 5)
!33 = !DILocation(line: 37, column: 27, scope: !32)
!34 = !DILocation(line: 38, column: 14, scope: !32)
!35 = !DILocation(line: 40, column: 67, scope: !2)
!36 = !DILocation(line: 40, column: 65, scope: !2)
!37 = !DILocation(line: 41, column: 5, scope: !2)
!38 = !DILocation(line: 42, column: 1, scope: !2)
!39 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_68_good", scope: !3, file: !3, line: 72, type: !4, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!40 = !DILocation(line: 74, column: 5, scope: !39)
!41 = !DILocation(line: 75, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 52, type: !4, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!43 = !DILocalVariable(name: "data", scope: !42, file: !3, line: 54, type: !8)
!44 = !DILocation(line: 54, column: 12, scope: !42)
!45 = !DILocation(line: 55, column: 10, scope: !42)
!46 = !DILocalVariable(name: "dataBuffer", scope: !47, file: !3, line: 58, type: !8)
!47 = distinct !DILexicalBlock(scope: !42, file: !3, line: 56, column: 5)
!48 = !DILocation(line: 58, column: 16, scope: !47)
!49 = !DILocation(line: 58, column: 37, scope: !47)
!50 = !DILocation(line: 59, column: 13, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !3, line: 59, column: 13)
!52 = !DILocation(line: 59, column: 24, scope: !51)
!53 = !DILocation(line: 59, column: 13, scope: !47)
!54 = !DILocation(line: 61, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !3, line: 60, column: 9)
!56 = !DILocation(line: 62, column: 13, scope: !55)
!57 = !DILocation(line: 64, column: 16, scope: !47)
!58 = !DILocation(line: 64, column: 9, scope: !47)
!59 = !DILocation(line: 65, column: 9, scope: !47)
!60 = !DILocation(line: 65, column: 27, scope: !47)
!61 = !DILocation(line: 66, column: 16, scope: !47)
!62 = !DILocation(line: 66, column: 14, scope: !47)
!63 = !DILocation(line: 68, column: 71, scope: !42)
!64 = !DILocation(line: 68, column: 69, scope: !42)
!65 = !DILocation(line: 69, column: 5, scope: !42)
!66 = !DILocation(line: 70, column: 1, scope: !42)
