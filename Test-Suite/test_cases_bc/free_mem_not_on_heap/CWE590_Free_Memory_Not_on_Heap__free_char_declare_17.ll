; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_17.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i8* null, i8** %data, align 8, !dbg !23
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %0, 1, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !38
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !41
  store i8* %arraydecay1, i8** %data, align 8, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %1, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* noundef %2), !dbg !50
  %3 = load i8*, i8** %data, align 8, !dbg !51
  call void @free(i8* noundef %3) #6, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_17_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !57 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !DIExpression()), !dbg !61
  store i8* null, i8** %data, align 8, !dbg !62
  store i32 0, i32* %h, align 4, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !66
  %cmp = icmp slt i32 %0, 1, !dbg !68
  br i1 %cmp, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !73
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !74
  store i8* %call, i8** %dataBuffer, align 8, !dbg !73
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !75
  %cmp1 = icmp eq i8* %1, null, !dbg !77
  br i1 %cmp1, label %if.then, label %if.end, !dbg !78

if.then:                                          ; preds = %for.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @exit(i32 noundef 1) #7, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %for.body
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !83
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !86
  store i8* %4, i8** %data, align 8, !dbg !87
  br label %for.inc, !dbg !88

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %h, align 4, !dbg !89
  %inc = add nsw i32 %5, 1, !dbg !89
  store i32 %inc, i32* %h, align 4, !dbg !89
  br label %for.cond, !dbg !90, !llvm.loop !91

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !93
  call void @printLine(i8* noundef %6), !dbg !94
  %7 = load i8*, i8** %data, align 8, !dbg !95
  call void @free(i8* noundef %7) #6, !dbg !96
  ret void, !dbg !97
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_17.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "26134a72fcf4e40f5b29fb17e9889cd2")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_17_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "i", scope: !14, file: !1, line: 25, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 9, scope: !14)
!21 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 26, type: !3)
!22 = !DILocation(line: 26, column: 12, scope: !14)
!23 = !DILocation(line: 27, column: 10, scope: !14)
!24 = !DILocation(line: 28, column: 11, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !1, line: 28, column: 5)
!26 = !DILocation(line: 28, column: 9, scope: !25)
!27 = !DILocation(line: 28, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !1, line: 28, column: 5)
!29 = !DILocation(line: 28, column: 18, scope: !28)
!30 = !DILocation(line: 28, column: 5, scope: !25)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !1, line: 32, type: !34)
!32 = distinct !DILexicalBlock(scope: !33, file: !1, line: 30, column: 9)
!33 = distinct !DILexicalBlock(scope: !28, file: !1, line: 29, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 32, column: 18, scope: !32)
!38 = !DILocation(line: 33, column: 13, scope: !32)
!39 = !DILocation(line: 34, column: 13, scope: !32)
!40 = !DILocation(line: 34, column: 31, scope: !32)
!41 = !DILocation(line: 35, column: 20, scope: !32)
!42 = !DILocation(line: 35, column: 18, scope: !32)
!43 = !DILocation(line: 37, column: 5, scope: !33)
!44 = !DILocation(line: 28, column: 24, scope: !28)
!45 = !DILocation(line: 28, column: 5, scope: !28)
!46 = distinct !{!46, !30, !47, !48}
!47 = !DILocation(line: 37, column: 5, scope: !25)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocation(line: 38, column: 15, scope: !14)
!50 = !DILocation(line: 38, column: 5, scope: !14)
!51 = !DILocation(line: 40, column: 10, scope: !14)
!52 = !DILocation(line: 40, column: 5, scope: !14)
!53 = !DILocation(line: 41, column: 1, scope: !14)
!54 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_17_good", scope: !1, file: !1, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!55 = !DILocation(line: 75, column: 5, scope: !54)
!56 = !DILocation(line: 76, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!58 = !DILocalVariable(name: "h", scope: !57, file: !1, line: 50, type: !19)
!59 = !DILocation(line: 50, column: 9, scope: !57)
!60 = !DILocalVariable(name: "data", scope: !57, file: !1, line: 51, type: !3)
!61 = !DILocation(line: 51, column: 12, scope: !57)
!62 = !DILocation(line: 52, column: 10, scope: !57)
!63 = !DILocation(line: 53, column: 11, scope: !64)
!64 = distinct !DILexicalBlock(scope: !57, file: !1, line: 53, column: 5)
!65 = !DILocation(line: 53, column: 9, scope: !64)
!66 = !DILocation(line: 53, column: 16, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !1, line: 53, column: 5)
!68 = !DILocation(line: 53, column: 18, scope: !67)
!69 = !DILocation(line: 53, column: 5, scope: !64)
!70 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !1, line: 57, type: !3)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 55, column: 9)
!72 = distinct !DILexicalBlock(scope: !67, file: !1, line: 54, column: 5)
!73 = !DILocation(line: 57, column: 20, scope: !71)
!74 = !DILocation(line: 57, column: 41, scope: !71)
!75 = !DILocation(line: 58, column: 17, scope: !76)
!76 = distinct !DILexicalBlock(scope: !71, file: !1, line: 58, column: 17)
!77 = !DILocation(line: 58, column: 28, scope: !76)
!78 = !DILocation(line: 58, column: 17, scope: !71)
!79 = !DILocation(line: 60, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !1, line: 59, column: 13)
!81 = !DILocation(line: 61, column: 17, scope: !80)
!82 = !DILocation(line: 63, column: 20, scope: !71)
!83 = !DILocation(line: 63, column: 13, scope: !71)
!84 = !DILocation(line: 64, column: 13, scope: !71)
!85 = !DILocation(line: 64, column: 31, scope: !71)
!86 = !DILocation(line: 65, column: 20, scope: !71)
!87 = !DILocation(line: 65, column: 18, scope: !71)
!88 = !DILocation(line: 67, column: 5, scope: !72)
!89 = !DILocation(line: 53, column: 24, scope: !67)
!90 = !DILocation(line: 53, column: 5, scope: !67)
!91 = distinct !{!91, !69, !92, !48}
!92 = !DILocation(line: 67, column: 5, scope: !64)
!93 = !DILocation(line: 68, column: 15, scope: !57)
!94 = !DILocation(line: 68, column: 5, scope: !57)
!95 = !DILocation(line: 70, column: 10, scope: !57)
!96 = !DILocation(line: 70, column: 5, scope: !57)
!97 = !DILocation(line: 71, column: 1, scope: !57)
