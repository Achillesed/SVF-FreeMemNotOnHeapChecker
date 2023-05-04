; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_16.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_16_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  br label %while.body, !dbg !21

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !22, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !28
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  store i8* %3, i8** %data, align 8, !dbg !32
  br label %while.end, !dbg !33

while.end:                                        ; preds = %while.body
  %4 = load i8*, i8** %data, align 8, !dbg !34
  call void @printLine(i8* noundef %4), !dbg !35
  %5 = load i8*, i8** %data, align 8, !dbg !36
  call void @free(i8* noundef %5) #6, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_16_good() #0 !dbg !39 {
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
  br label %while.body, !dbg !46

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !47, metadata !DIExpression()), !dbg !50
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !51
  store i8* %call, i8** %dataBuffer, align 8, !dbg !50
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !52
  %cmp = icmp eq i8* %0, null, !dbg !54
  br i1 %cmp, label %if.then, label %if.end, !dbg !55

if.then:                                          ; preds = %while.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @exit(i32 noundef 1) #7, !dbg !58
  unreachable, !dbg !58

if.end:                                           ; preds = %while.body
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !60
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !61
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !61
  store i8 0, i8* %arrayidx, align 1, !dbg !62
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !63
  store i8* %3, i8** %data, align 8, !dbg !64
  br label %while.end, !dbg !65

while.end:                                        ; preds = %if.end
  %4 = load i8*, i8** %data, align 8, !dbg !66
  call void @printLine(i8* noundef %4), !dbg !67
  %5 = load i8*, i8** %data, align 8, !dbg !68
  call void @free(i8* noundef %5) #6, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_16.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "806227e217638932b8711c0c1d248b38")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_16_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !1, line: 31, type: !3)
!23 = distinct !DILexicalBlock(scope: !24, file: !1, line: 29, column: 9)
!24 = distinct !DILexicalBlock(scope: !14, file: !1, line: 28, column: 5)
!25 = !DILocation(line: 31, column: 20, scope: !23)
!26 = !DILocation(line: 31, column: 41, scope: !23)
!27 = !DILocation(line: 32, column: 20, scope: !23)
!28 = !DILocation(line: 32, column: 13, scope: !23)
!29 = !DILocation(line: 33, column: 13, scope: !23)
!30 = !DILocation(line: 33, column: 31, scope: !23)
!31 = !DILocation(line: 34, column: 20, scope: !23)
!32 = !DILocation(line: 34, column: 18, scope: !23)
!33 = !DILocation(line: 36, column: 9, scope: !24)
!34 = !DILocation(line: 38, column: 15, scope: !14)
!35 = !DILocation(line: 38, column: 5, scope: !14)
!36 = !DILocation(line: 40, column: 10, scope: !14)
!37 = !DILocation(line: 40, column: 5, scope: !14)
!38 = !DILocation(line: 41, column: 1, scope: !14)
!39 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_16_good", scope: !1, file: !1, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!40 = !DILocation(line: 75, column: 5, scope: !39)
!41 = !DILocation(line: 76, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!43 = !DILocalVariable(name: "data", scope: !42, file: !1, line: 50, type: !3)
!44 = !DILocation(line: 50, column: 12, scope: !42)
!45 = !DILocation(line: 51, column: 10, scope: !42)
!46 = !DILocation(line: 52, column: 5, scope: !42)
!47 = !DILocalVariable(name: "dataBuffer", scope: !48, file: !1, line: 56, type: !3)
!48 = distinct !DILexicalBlock(scope: !49, file: !1, line: 54, column: 9)
!49 = distinct !DILexicalBlock(scope: !42, file: !1, line: 53, column: 5)
!50 = !DILocation(line: 56, column: 20, scope: !48)
!51 = !DILocation(line: 56, column: 41, scope: !48)
!52 = !DILocation(line: 57, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !48, file: !1, line: 57, column: 17)
!54 = !DILocation(line: 57, column: 28, scope: !53)
!55 = !DILocation(line: 57, column: 17, scope: !48)
!56 = !DILocation(line: 59, column: 17, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !1, line: 58, column: 13)
!58 = !DILocation(line: 60, column: 17, scope: !57)
!59 = !DILocation(line: 62, column: 20, scope: !48)
!60 = !DILocation(line: 62, column: 13, scope: !48)
!61 = !DILocation(line: 63, column: 13, scope: !48)
!62 = !DILocation(line: 63, column: 31, scope: !48)
!63 = !DILocation(line: 64, column: 20, scope: !48)
!64 = !DILocation(line: 64, column: 18, scope: !48)
!65 = !DILocation(line: 66, column: 9, scope: !49)
!66 = !DILocation(line: 68, column: 15, scope: !42)
!67 = !DILocation(line: 68, column: 5, scope: !42)
!68 = !DILocation(line: 70, column: 10, scope: !42)
!69 = !DILocation(line: 70, column: 5, scope: !42)
!70 = !DILocation(line: 71, column: 1, scope: !42)
