; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_31.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %0, i8** %dataBuffer, align 8, !dbg !23
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !26
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  store i8* %3, i8** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !31, metadata !DIExpression()), !dbg !33
  %4 = load i8*, i8** %data, align 8, !dbg !34
  store i8* %4, i8** %dataCopy, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !35, metadata !DIExpression()), !dbg !36
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !37
  store i8* %5, i8** %data1, align 8, !dbg !36
  %6 = load i8*, i8** %data1, align 8, !dbg !38
  call void @printLine(i8* noundef %6), !dbg !39
  %7 = load i8*, i8** %data1, align 8, !dbg !40
  call void @free(i8* noundef %7) #6, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_31_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !46 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !47, metadata !DIExpression()), !dbg !48
  store i8* null, i8** %data, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !50, metadata !DIExpression()), !dbg !52
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !53
  store i8* %call, i8** %dataBuffer, align 8, !dbg !52
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !54
  %cmp = icmp eq i8* %0, null, !dbg !56
  br i1 %cmp, label %if.then, label %if.end, !dbg !57

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @exit(i32 noundef 1) #7, !dbg !60
  unreachable, !dbg !60

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !61
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !62
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !63
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !63
  store i8 0, i8* %arrayidx, align 1, !dbg !64
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !65
  store i8* %3, i8** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !67, metadata !DIExpression()), !dbg !69
  %4 = load i8*, i8** %data, align 8, !dbg !70
  store i8* %4, i8** %dataCopy, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !71, metadata !DIExpression()), !dbg !72
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !73
  store i8* %5, i8** %data1, align 8, !dbg !72
  %6 = load i8*, i8** %data1, align 8, !dbg !74
  call void @printLine(i8* noundef %6), !dbg !75
  %7 = load i8*, i8** %data1, align 8, !dbg !76
  call void @free(i8* noundef %7) #6, !dbg !77
  ret void, !dbg !78
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_31.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "ce856fa566da43ec6032af442e1ce2d9")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_31_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !1, line: 29, type: !3)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 27, column: 5)
!23 = !DILocation(line: 29, column: 16, scope: !22)
!24 = !DILocation(line: 29, column: 37, scope: !22)
!25 = !DILocation(line: 30, column: 16, scope: !22)
!26 = !DILocation(line: 30, column: 9, scope: !22)
!27 = !DILocation(line: 31, column: 9, scope: !22)
!28 = !DILocation(line: 31, column: 27, scope: !22)
!29 = !DILocation(line: 32, column: 16, scope: !22)
!30 = !DILocation(line: 32, column: 14, scope: !22)
!31 = !DILocalVariable(name: "dataCopy", scope: !32, file: !1, line: 35, type: !3)
!32 = distinct !DILexicalBlock(scope: !14, file: !1, line: 34, column: 5)
!33 = !DILocation(line: 35, column: 16, scope: !32)
!34 = !DILocation(line: 35, column: 27, scope: !32)
!35 = !DILocalVariable(name: "data", scope: !32, file: !1, line: 36, type: !3)
!36 = !DILocation(line: 36, column: 16, scope: !32)
!37 = !DILocation(line: 36, column: 23, scope: !32)
!38 = !DILocation(line: 37, column: 19, scope: !32)
!39 = !DILocation(line: 37, column: 9, scope: !32)
!40 = !DILocation(line: 39, column: 14, scope: !32)
!41 = !DILocation(line: 39, column: 9, scope: !32)
!42 = !DILocation(line: 41, column: 1, scope: !14)
!43 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_31_good", scope: !1, file: !1, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!44 = !DILocation(line: 75, column: 5, scope: !43)
!45 = !DILocation(line: 76, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!47 = !DILocalVariable(name: "data", scope: !46, file: !1, line: 50, type: !3)
!48 = !DILocation(line: 50, column: 12, scope: !46)
!49 = !DILocation(line: 51, column: 10, scope: !46)
!50 = !DILocalVariable(name: "dataBuffer", scope: !51, file: !1, line: 54, type: !3)
!51 = distinct !DILexicalBlock(scope: !46, file: !1, line: 52, column: 5)
!52 = !DILocation(line: 54, column: 16, scope: !51)
!53 = !DILocation(line: 54, column: 37, scope: !51)
!54 = !DILocation(line: 55, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !1, line: 55, column: 13)
!56 = !DILocation(line: 55, column: 24, scope: !55)
!57 = !DILocation(line: 55, column: 13, scope: !51)
!58 = !DILocation(line: 57, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !1, line: 56, column: 9)
!60 = !DILocation(line: 58, column: 13, scope: !59)
!61 = !DILocation(line: 60, column: 16, scope: !51)
!62 = !DILocation(line: 60, column: 9, scope: !51)
!63 = !DILocation(line: 61, column: 9, scope: !51)
!64 = !DILocation(line: 61, column: 27, scope: !51)
!65 = !DILocation(line: 62, column: 16, scope: !51)
!66 = !DILocation(line: 62, column: 14, scope: !51)
!67 = !DILocalVariable(name: "dataCopy", scope: !68, file: !1, line: 65, type: !3)
!68 = distinct !DILexicalBlock(scope: !46, file: !1, line: 64, column: 5)
!69 = !DILocation(line: 65, column: 16, scope: !68)
!70 = !DILocation(line: 65, column: 27, scope: !68)
!71 = !DILocalVariable(name: "data", scope: !68, file: !1, line: 66, type: !3)
!72 = !DILocation(line: 66, column: 16, scope: !68)
!73 = !DILocation(line: 66, column: 23, scope: !68)
!74 = !DILocation(line: 67, column: 19, scope: !68)
!75 = !DILocation(line: 67, column: 9, scope: !68)
!76 = !DILocation(line: 69, column: 14, scope: !68)
!77 = !DILocation(line: 69, column: 9, scope: !68)
!78 = !DILocation(line: 71, column: 1, scope: !46)
