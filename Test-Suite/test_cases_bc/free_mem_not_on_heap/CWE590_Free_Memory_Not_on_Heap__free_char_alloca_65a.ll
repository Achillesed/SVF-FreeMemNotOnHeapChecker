; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_65a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_65_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_65b_badSink, void (i8*)** %funcPtr, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %0, i8** %dataBuffer, align 8, !dbg !28
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !31
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !34
  store i8* %3, i8** %data, align 8, !dbg !35
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !36
  %5 = load i8*, i8** %data, align 8, !dbg !37
  call void %4(i8* noundef %5), !dbg !36
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_65b_badSink(i8* noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_65_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !42 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !45, metadata !DIExpression()), !dbg !46
  store void (i8*)* @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_65b_goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !46
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
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !65
  %5 = load i8*, i8** %data, align 8, !dbg !66
  call void %4(i8* noundef %5), !dbg !65
  ret void, !dbg !67
}

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_65b_goodG2BSink(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_65a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "3d8f7c9d998bed85354a090dd7923b71")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_65_bad", scope: !1, file: !1, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 28, type: !3)
!19 = !DILocation(line: 28, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !1, line: 30, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !3}
!24 = !DILocation(line: 30, column: 12, scope: !14)
!25 = !DILocation(line: 31, column: 10, scope: !14)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !1, line: 34, type: !3)
!27 = distinct !DILexicalBlock(scope: !14, file: !1, line: 32, column: 5)
!28 = !DILocation(line: 34, column: 16, scope: !27)
!29 = !DILocation(line: 34, column: 37, scope: !27)
!30 = !DILocation(line: 35, column: 16, scope: !27)
!31 = !DILocation(line: 35, column: 9, scope: !27)
!32 = !DILocation(line: 36, column: 9, scope: !27)
!33 = !DILocation(line: 36, column: 27, scope: !27)
!34 = !DILocation(line: 37, column: 16, scope: !27)
!35 = !DILocation(line: 37, column: 14, scope: !27)
!36 = !DILocation(line: 40, column: 5, scope: !14)
!37 = !DILocation(line: 40, column: 13, scope: !14)
!38 = !DILocation(line: 41, column: 1, scope: !14)
!39 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_65_good", scope: !1, file: !1, line: 70, type: !15, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!40 = !DILocation(line: 72, column: 5, scope: !39)
!41 = !DILocation(line: 73, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 50, type: !15, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!43 = !DILocalVariable(name: "data", scope: !42, file: !1, line: 52, type: !3)
!44 = !DILocation(line: 52, column: 12, scope: !42)
!45 = !DILocalVariable(name: "funcPtr", scope: !42, file: !1, line: 53, type: !21)
!46 = !DILocation(line: 53, column: 12, scope: !42)
!47 = !DILocation(line: 54, column: 10, scope: !42)
!48 = !DILocalVariable(name: "dataBuffer", scope: !49, file: !1, line: 57, type: !3)
!49 = distinct !DILexicalBlock(scope: !42, file: !1, line: 55, column: 5)
!50 = !DILocation(line: 57, column: 16, scope: !49)
!51 = !DILocation(line: 57, column: 37, scope: !49)
!52 = !DILocation(line: 58, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !1, line: 58, column: 13)
!54 = !DILocation(line: 58, column: 24, scope: !53)
!55 = !DILocation(line: 58, column: 13, scope: !49)
!56 = !DILocation(line: 60, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !1, line: 59, column: 9)
!58 = !DILocation(line: 61, column: 13, scope: !57)
!59 = !DILocation(line: 63, column: 16, scope: !49)
!60 = !DILocation(line: 63, column: 9, scope: !49)
!61 = !DILocation(line: 64, column: 9, scope: !49)
!62 = !DILocation(line: 64, column: 27, scope: !49)
!63 = !DILocation(line: 65, column: 16, scope: !49)
!64 = !DILocation(line: 65, column: 14, scope: !49)
!65 = !DILocation(line: 67, column: 5, scope: !42)
!66 = !DILocation(line: 67, column: 13, scope: !42)
!67 = !DILocation(line: 68, column: 1, scope: !42)
