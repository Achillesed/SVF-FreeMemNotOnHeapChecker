; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_68a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_char_declare_68_badData = dso_local global i8* null, align 8, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_char_declare_68_goodG2BData = dso_local global i8* null, align 8, !dbg !9
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_68_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !32
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !35
  store i8* %arraydecay1, i8** %data, align 8, !dbg !36
  %0 = load i8*, i8** %data, align 8, !dbg !37
  store i8* %0, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_declare_68_badData, align 8, !dbg !38
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_char_declare_68b_badSink(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_68b_badSink(...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_68_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !44 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !45, metadata !DIExpression()), !dbg !46
  store i8* null, i8** %data, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !48, metadata !DIExpression()), !dbg !50
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !51
  store i8* %call, i8** %dataBuffer, align 8, !dbg !50
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !52
  %cmp = icmp eq i8* %0, null, !dbg !54
  br i1 %cmp, label %if.then, label %if.end, !dbg !55

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @exit(i32 noundef 1) #7, !dbg !58
  unreachable, !dbg !58

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !60
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !61
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !61
  store i8 0, i8* %arrayidx, align 1, !dbg !62
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !63
  store i8* %3, i8** %data, align 8, !dbg !64
  %4 = load i8*, i8** %data, align 8, !dbg !65
  store i8* %4, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_declare_68_goodG2BData, align 8, !dbg !66
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_char_declare_68b_goodG2BSink(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_68_badData", scope: !2, file: !3, line: 21, type: !5, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_68a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "14cc206eb589b1454cfdfd83eb1790b0")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_68_goodG2BData", scope: !2, file: !3, line: 22, type: !5, isLocal: false, isDefinition: true)
!11 = !{i32 7, !"Dwarf Version", i32 5}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"PIE Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!19 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_68_bad", scope: !3, file: !3, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !3, line: 31, type: !5)
!24 = !DILocation(line: 31, column: 12, scope: !19)
!25 = !DILocation(line: 32, column: 10, scope: !19)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !3, line: 35, type: !28)
!27 = distinct !DILexicalBlock(scope: !19, file: !3, line: 33, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 35, column: 14, scope: !27)
!32 = !DILocation(line: 36, column: 9, scope: !27)
!33 = !DILocation(line: 37, column: 9, scope: !27)
!34 = !DILocation(line: 37, column: 27, scope: !27)
!35 = !DILocation(line: 38, column: 16, scope: !27)
!36 = !DILocation(line: 38, column: 14, scope: !27)
!37 = !DILocation(line: 40, column: 68, scope: !19)
!38 = !DILocation(line: 40, column: 66, scope: !19)
!39 = !DILocation(line: 41, column: 5, scope: !19)
!40 = !DILocation(line: 42, column: 1, scope: !19)
!41 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_68_good", scope: !3, file: !3, line: 72, type: !20, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!42 = !DILocation(line: 74, column: 5, scope: !41)
!43 = !DILocation(line: 75, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!45 = !DILocalVariable(name: "data", scope: !44, file: !3, line: 54, type: !5)
!46 = !DILocation(line: 54, column: 12, scope: !44)
!47 = !DILocation(line: 55, column: 10, scope: !44)
!48 = !DILocalVariable(name: "dataBuffer", scope: !49, file: !3, line: 58, type: !5)
!49 = distinct !DILexicalBlock(scope: !44, file: !3, line: 56, column: 5)
!50 = !DILocation(line: 58, column: 16, scope: !49)
!51 = !DILocation(line: 58, column: 37, scope: !49)
!52 = !DILocation(line: 59, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !3, line: 59, column: 13)
!54 = !DILocation(line: 59, column: 24, scope: !53)
!55 = !DILocation(line: 59, column: 13, scope: !49)
!56 = !DILocation(line: 61, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !3, line: 60, column: 9)
!58 = !DILocation(line: 62, column: 13, scope: !57)
!59 = !DILocation(line: 64, column: 16, scope: !49)
!60 = !DILocation(line: 64, column: 9, scope: !49)
!61 = !DILocation(line: 65, column: 9, scope: !49)
!62 = !DILocation(line: 65, column: 27, scope: !49)
!63 = !DILocation(line: 66, column: 16, scope: !49)
!64 = !DILocation(line: 66, column: 14, scope: !49)
!65 = !DILocation(line: 68, column: 72, scope: !44)
!66 = !DILocation(line: 68, column: 70, scope: !44)
!67 = !DILocation(line: 69, column: 5, scope: !44)
!68 = !DILocation(line: 70, column: 1, scope: !44)
