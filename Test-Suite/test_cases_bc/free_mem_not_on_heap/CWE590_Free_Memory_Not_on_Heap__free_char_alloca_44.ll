; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_44.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
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

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink(i8* noundef %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  %0 = load i8*, i8** %data.addr, align 8, !dbg !42
  call void @printLine(i8* noundef %0), !dbg !43
  %1 = load i8*, i8** %data.addr, align 8, !dbg !44
  call void @free(i8* noundef %1) #6, !dbg !45
  ret void, !dbg !46
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_44_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !50 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !53, metadata !DIExpression()), !dbg !54
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !54
  store i8* null, i8** %data, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !56, metadata !DIExpression()), !dbg !58
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !59
  store i8* %call, i8** %dataBuffer, align 8, !dbg !58
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !60
  %cmp = icmp eq i8* %0, null, !dbg !62
  br i1 %cmp, label %if.then, label %if.end, !dbg !63

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @exit(i32 noundef 1) #7, !dbg !66
  unreachable, !dbg !66

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !67
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !68
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !69
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !69
  store i8 0, i8* %arrayidx, align 1, !dbg !70
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !71
  store i8* %3, i8** %data, align 8, !dbg !72
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !73
  %5 = load i8*, i8** %data, align 8, !dbg !74
  call void %4(i8* noundef %5), !dbg !73
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink(i8* noundef %data) #0 !dbg !76 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = load i8*, i8** %data.addr, align 8, !dbg !79
  call void @printLine(i8* noundef %0), !dbg !80
  %1 = load i8*, i8** %data.addr, align 8, !dbg !81
  call void @free(i8* noundef %1) #6, !dbg !82
  ret void, !dbg !83
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_44.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "e09299bd659d1f5e4ea8d8f4f5423d8b")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_44_bad", scope: !1, file: !1, line: 30, type: !15, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 32, type: !3)
!19 = !DILocation(line: 32, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !1, line: 34, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !3}
!24 = !DILocation(line: 34, column: 12, scope: !14)
!25 = !DILocation(line: 35, column: 10, scope: !14)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !1, line: 38, type: !3)
!27 = distinct !DILexicalBlock(scope: !14, file: !1, line: 36, column: 5)
!28 = !DILocation(line: 38, column: 16, scope: !27)
!29 = !DILocation(line: 38, column: 37, scope: !27)
!30 = !DILocation(line: 39, column: 16, scope: !27)
!31 = !DILocation(line: 39, column: 9, scope: !27)
!32 = !DILocation(line: 40, column: 9, scope: !27)
!33 = !DILocation(line: 40, column: 27, scope: !27)
!34 = !DILocation(line: 41, column: 16, scope: !27)
!35 = !DILocation(line: 41, column: 14, scope: !27)
!36 = !DILocation(line: 44, column: 5, scope: !14)
!37 = !DILocation(line: 44, column: 13, scope: !14)
!38 = !DILocation(line: 45, column: 1, scope: !14)
!39 = distinct !DISubprogram(name: "badSink", scope: !1, file: !1, line: 23, type: !22, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!40 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !1, line: 23, type: !3)
!41 = !DILocation(line: 23, column: 28, scope: !39)
!42 = !DILocation(line: 25, column: 15, scope: !39)
!43 = !DILocation(line: 25, column: 5, scope: !39)
!44 = !DILocation(line: 27, column: 10, scope: !39)
!45 = !DILocation(line: 27, column: 5, scope: !39)
!46 = !DILocation(line: 28, column: 1, scope: !39)
!47 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_44_good", scope: !1, file: !1, line: 79, type: !15, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!48 = !DILocation(line: 81, column: 5, scope: !47)
!49 = !DILocation(line: 82, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!51 = !DILocalVariable(name: "data", scope: !50, file: !1, line: 61, type: !3)
!52 = !DILocation(line: 61, column: 12, scope: !50)
!53 = !DILocalVariable(name: "funcPtr", scope: !50, file: !1, line: 62, type: !21)
!54 = !DILocation(line: 62, column: 12, scope: !50)
!55 = !DILocation(line: 63, column: 10, scope: !50)
!56 = !DILocalVariable(name: "dataBuffer", scope: !57, file: !1, line: 66, type: !3)
!57 = distinct !DILexicalBlock(scope: !50, file: !1, line: 64, column: 5)
!58 = !DILocation(line: 66, column: 16, scope: !57)
!59 = !DILocation(line: 66, column: 37, scope: !57)
!60 = !DILocation(line: 67, column: 13, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !1, line: 67, column: 13)
!62 = !DILocation(line: 67, column: 24, scope: !61)
!63 = !DILocation(line: 67, column: 13, scope: !57)
!64 = !DILocation(line: 69, column: 13, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !1, line: 68, column: 9)
!66 = !DILocation(line: 70, column: 13, scope: !65)
!67 = !DILocation(line: 72, column: 16, scope: !57)
!68 = !DILocation(line: 72, column: 9, scope: !57)
!69 = !DILocation(line: 73, column: 9, scope: !57)
!70 = !DILocation(line: 73, column: 27, scope: !57)
!71 = !DILocation(line: 74, column: 16, scope: !57)
!72 = !DILocation(line: 74, column: 14, scope: !57)
!73 = !DILocation(line: 76, column: 5, scope: !50)
!74 = !DILocation(line: 76, column: 13, scope: !50)
!75 = !DILocation(line: 77, column: 1, scope: !50)
!76 = distinct !DISubprogram(name: "goodG2BSink", scope: !1, file: !1, line: 52, type: !22, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!77 = !DILocalVariable(name: "data", arg: 1, scope: !76, file: !1, line: 52, type: !3)
!78 = !DILocation(line: 52, column: 32, scope: !76)
!79 = !DILocation(line: 54, column: 15, scope: !76)
!80 = !DILocation(line: 54, column: 5, scope: !76)
!81 = !DILocation(line: 56, column: 10, scope: !76)
!82 = !DILocation(line: 56, column: 5, scope: !76)
!83 = !DILocation(line: 57, column: 1, scope: !76)