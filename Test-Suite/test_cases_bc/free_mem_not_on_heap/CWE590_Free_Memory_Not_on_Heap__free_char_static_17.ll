; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_static_17.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_static_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_char_static_17_bad.dataBuffer = internal global [100 x i8] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_17_bad() #0 !dbg !2 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i8** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store i8* null, i8** %data, align 8, !dbg !29
  store i32 0, i32* %i, align 4, !dbg !30
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !33
  %cmp = icmp slt i32 %0, 1, !dbg !35
  br i1 %cmp, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  call void @llvm.memset.p0i8.i64(i8* align 16 getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_17_bad.dataBuffer, i64 0, i64 0), i8 65, i64 99, i1 false), !dbg !37
  store i8 0, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_17_bad.dataBuffer, i64 0, i64 99), align 1, !dbg !40
  store i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_17_bad.dataBuffer, i64 0, i64 0), i8** %data, align 8, !dbg !41
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !43
  %inc = add nsw i32 %1, 1, !dbg !43
  store i32 %inc, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* noundef %2), !dbg !49
  %3 = load i8*, i8** %data, align 8, !dbg !50
  call void @free(i8* noundef %3) #6, !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_17_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !56 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i8** %data, metadata !59, metadata !DIExpression()), !dbg !60
  store i8* null, i8** %data, align 8, !dbg !61
  store i32 0, i32* %h, align 4, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !65
  %cmp = icmp slt i32 %0, 1, !dbg !67
  br i1 %cmp, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !69, metadata !DIExpression()), !dbg !72
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !73
  store i8* %call, i8** %dataBuffer, align 8, !dbg !72
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !74
  %cmp1 = icmp eq i8* %1, null, !dbg !76
  br i1 %cmp1, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %for.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @exit(i32 noundef 1) #7, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %for.body
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !82
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !85
  store i8* %4, i8** %data, align 8, !dbg !86
  br label %for.inc, !dbg !87

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %h, align 4, !dbg !88
  %inc = add nsw i32 %5, 1, !dbg !88
  store i32 %inc, i32* %h, align 4, !dbg !88
  br label %for.cond, !dbg !89, !llvm.loop !90

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !92
  call void @printLine(i8* noundef %6), !dbg !93
  %7 = load i8*, i8** %data, align 8, !dbg !94
  call void @free(i8* noundef %7) #6, !dbg !95
  ret void, !dbg !96
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

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 32, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_17_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_static_17.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "150b1066132c9895e0ebb2006975f2cb")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0}
!12 = !{}
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 800, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 100)
!16 = !{i32 7, !"Dwarf Version", i32 5}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"PIE Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!24 = !DILocalVariable(name: "i", scope: !2, file: !3, line: 25, type: !25)
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !DILocation(line: 25, column: 9, scope: !2)
!27 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 26, type: !8)
!28 = !DILocation(line: 26, column: 12, scope: !2)
!29 = !DILocation(line: 27, column: 10, scope: !2)
!30 = !DILocation(line: 28, column: 11, scope: !31)
!31 = distinct !DILexicalBlock(scope: !2, file: !3, line: 28, column: 5)
!32 = !DILocation(line: 28, column: 9, scope: !31)
!33 = !DILocation(line: 28, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !3, line: 28, column: 5)
!35 = !DILocation(line: 28, column: 18, scope: !34)
!36 = !DILocation(line: 28, column: 5, scope: !31)
!37 = !DILocation(line: 33, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !39, file: !3, line: 30, column: 9)
!39 = distinct !DILexicalBlock(scope: !34, file: !3, line: 29, column: 5)
!40 = !DILocation(line: 34, column: 31, scope: !38)
!41 = !DILocation(line: 35, column: 18, scope: !38)
!42 = !DILocation(line: 37, column: 5, scope: !39)
!43 = !DILocation(line: 28, column: 24, scope: !34)
!44 = !DILocation(line: 28, column: 5, scope: !34)
!45 = distinct !{!45, !36, !46, !47}
!46 = !DILocation(line: 37, column: 5, scope: !31)
!47 = !{!"llvm.loop.mustprogress"}
!48 = !DILocation(line: 38, column: 15, scope: !2)
!49 = !DILocation(line: 38, column: 5, scope: !2)
!50 = !DILocation(line: 40, column: 10, scope: !2)
!51 = !DILocation(line: 40, column: 5, scope: !2)
!52 = !DILocation(line: 41, column: 1, scope: !2)
!53 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_17_good", scope: !3, file: !3, line: 73, type: !4, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!54 = !DILocation(line: 75, column: 5, scope: !53)
!55 = !DILocation(line: 76, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 48, type: !4, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!57 = !DILocalVariable(name: "h", scope: !56, file: !3, line: 50, type: !25)
!58 = !DILocation(line: 50, column: 9, scope: !56)
!59 = !DILocalVariable(name: "data", scope: !56, file: !3, line: 51, type: !8)
!60 = !DILocation(line: 51, column: 12, scope: !56)
!61 = !DILocation(line: 52, column: 10, scope: !56)
!62 = !DILocation(line: 53, column: 11, scope: !63)
!63 = distinct !DILexicalBlock(scope: !56, file: !3, line: 53, column: 5)
!64 = !DILocation(line: 53, column: 9, scope: !63)
!65 = !DILocation(line: 53, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !3, line: 53, column: 5)
!67 = !DILocation(line: 53, column: 18, scope: !66)
!68 = !DILocation(line: 53, column: 5, scope: !63)
!69 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !3, line: 57, type: !8)
!70 = distinct !DILexicalBlock(scope: !71, file: !3, line: 55, column: 9)
!71 = distinct !DILexicalBlock(scope: !66, file: !3, line: 54, column: 5)
!72 = !DILocation(line: 57, column: 20, scope: !70)
!73 = !DILocation(line: 57, column: 41, scope: !70)
!74 = !DILocation(line: 58, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !3, line: 58, column: 17)
!76 = !DILocation(line: 58, column: 28, scope: !75)
!77 = !DILocation(line: 58, column: 17, scope: !70)
!78 = !DILocation(line: 60, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !3, line: 59, column: 13)
!80 = !DILocation(line: 61, column: 17, scope: !79)
!81 = !DILocation(line: 63, column: 20, scope: !70)
!82 = !DILocation(line: 63, column: 13, scope: !70)
!83 = !DILocation(line: 64, column: 13, scope: !70)
!84 = !DILocation(line: 64, column: 31, scope: !70)
!85 = !DILocation(line: 65, column: 20, scope: !70)
!86 = !DILocation(line: 65, column: 18, scope: !70)
!87 = !DILocation(line: 67, column: 5, scope: !71)
!88 = !DILocation(line: 53, column: 24, scope: !66)
!89 = !DILocation(line: 53, column: 5, scope: !66)
!90 = distinct !{!90, !68, !91, !47}
!91 = !DILocation(line: 67, column: 5, scope: !63)
!92 = !DILocation(line: 68, column: 15, scope: !56)
!93 = !DILocation(line: 68, column: 5, scope: !56)
!94 = !DILocation(line: 70, column: 10, scope: !56)
!95 = !DILocation(line: 70, column: 5, scope: !56)
!96 = !DILocation(line: 71, column: 1, scope: !56)
