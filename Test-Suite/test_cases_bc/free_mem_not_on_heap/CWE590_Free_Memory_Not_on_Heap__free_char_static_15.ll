; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_static_15.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_static_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_char_static_15_bad.dataBuffer = internal global [100 x i8] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_15_bad() #0 !dbg !2 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_15_bad.dataBuffer, i64 0, i64 0), i8 65, i64 99, i1 false), !dbg !27
  store i8 0, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_15_bad.dataBuffer, i64 0, i64 99), align 1, !dbg !29
  store i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_15_bad.dataBuffer, i64 0, i64 0), i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  call void @printLine(i8* noundef %0), !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  call void @free(i8* noundef %1) #6, !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_15_good() #0 !dbg !36 {
entry:
  call void @goodG2B1(), !dbg !37
  call void @goodG2B2(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !40 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !41, metadata !DIExpression()), !dbg !42
  store i8* null, i8** %data, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !44, metadata !DIExpression()), !dbg !46
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !47
  store i8* %call, i8** %dataBuffer, align 8, !dbg !46
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !48
  %cmp = icmp eq i8* %0, null, !dbg !50
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @exit(i32 noundef 1) #7, !dbg !54
  unreachable, !dbg !54

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !56
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !57
  store i8 0, i8* %arrayidx, align 1, !dbg !58
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !59
  store i8* %3, i8** %data, align 8, !dbg !60
  %4 = load i8*, i8** %data, align 8, !dbg !61
  call void @printLine(i8* noundef %4), !dbg !62
  %5 = load i8*, i8** %data, align 8, !dbg !63
  call void @free(i8* noundef %5) #6, !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !66 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !67, metadata !DIExpression()), !dbg !68
  store i8* null, i8** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !72
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !73
  store i8* %call, i8** %dataBuffer, align 8, !dbg !72
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !74
  %cmp = icmp eq i8* %0, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @exit(i32 noundef 1) #7, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !82
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !85
  store i8* %3, i8** %data, align 8, !dbg !86
  %4 = load i8*, i8** %data, align 8, !dbg !87
  call void @printLine(i8* noundef %4), !dbg !88
  %5 = load i8*, i8** %data, align 8, !dbg !89
  call void @free(i8* noundef %5) #6, !dbg !90
  ret void, !dbg !91
}

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
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_15_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_static_15.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "a7f16cf1df343a6680c28b64c880db12")
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
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 25, type: !8)
!25 = !DILocation(line: 25, column: 12, scope: !2)
!26 = !DILocation(line: 26, column: 10, scope: !2)
!27 = !DILocation(line: 33, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !2, file: !3, line: 30, column: 5)
!29 = !DILocation(line: 34, column: 27, scope: !28)
!30 = !DILocation(line: 35, column: 14, scope: !28)
!31 = !DILocation(line: 43, column: 15, scope: !2)
!32 = !DILocation(line: 43, column: 5, scope: !2)
!33 = !DILocation(line: 45, column: 10, scope: !2)
!34 = !DILocation(line: 45, column: 5, scope: !2)
!35 = !DILocation(line: 46, column: 1, scope: !2)
!36 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_15_good", scope: !3, file: !3, line: 114, type: !4, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!37 = !DILocation(line: 116, column: 5, scope: !36)
!38 = !DILocation(line: 117, column: 5, scope: !36)
!39 = !DILocation(line: 118, column: 1, scope: !36)
!40 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 53, type: !4, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!41 = !DILocalVariable(name: "data", scope: !40, file: !3, line: 55, type: !8)
!42 = !DILocation(line: 55, column: 12, scope: !40)
!43 = !DILocation(line: 56, column: 10, scope: !40)
!44 = !DILocalVariable(name: "dataBuffer", scope: !45, file: !3, line: 66, type: !8)
!45 = distinct !DILexicalBlock(scope: !40, file: !3, line: 64, column: 5)
!46 = !DILocation(line: 66, column: 16, scope: !45)
!47 = !DILocation(line: 66, column: 37, scope: !45)
!48 = !DILocation(line: 67, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !3, line: 67, column: 13)
!50 = !DILocation(line: 67, column: 24, scope: !49)
!51 = !DILocation(line: 67, column: 13, scope: !45)
!52 = !DILocation(line: 69, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !3, line: 68, column: 9)
!54 = !DILocation(line: 70, column: 13, scope: !53)
!55 = !DILocation(line: 72, column: 16, scope: !45)
!56 = !DILocation(line: 72, column: 9, scope: !45)
!57 = !DILocation(line: 73, column: 9, scope: !45)
!58 = !DILocation(line: 73, column: 27, scope: !45)
!59 = !DILocation(line: 74, column: 16, scope: !45)
!60 = !DILocation(line: 74, column: 14, scope: !45)
!61 = !DILocation(line: 78, column: 15, scope: !40)
!62 = !DILocation(line: 78, column: 5, scope: !40)
!63 = !DILocation(line: 80, column: 10, scope: !40)
!64 = !DILocation(line: 80, column: 5, scope: !40)
!65 = !DILocation(line: 81, column: 1, scope: !40)
!66 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 84, type: !4, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!67 = !DILocalVariable(name: "data", scope: !66, file: !3, line: 86, type: !8)
!68 = !DILocation(line: 86, column: 12, scope: !66)
!69 = !DILocation(line: 87, column: 10, scope: !66)
!70 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !3, line: 93, type: !8)
!71 = distinct !DILexicalBlock(scope: !66, file: !3, line: 91, column: 5)
!72 = !DILocation(line: 93, column: 16, scope: !71)
!73 = !DILocation(line: 93, column: 37, scope: !71)
!74 = !DILocation(line: 94, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !3, line: 94, column: 13)
!76 = !DILocation(line: 94, column: 24, scope: !75)
!77 = !DILocation(line: 94, column: 13, scope: !71)
!78 = !DILocation(line: 96, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !3, line: 95, column: 9)
!80 = !DILocation(line: 97, column: 13, scope: !79)
!81 = !DILocation(line: 99, column: 16, scope: !71)
!82 = !DILocation(line: 99, column: 9, scope: !71)
!83 = !DILocation(line: 100, column: 9, scope: !71)
!84 = !DILocation(line: 100, column: 27, scope: !71)
!85 = !DILocation(line: 101, column: 16, scope: !71)
!86 = !DILocation(line: 101, column: 14, scope: !71)
!87 = !DILocation(line: 109, column: 15, scope: !66)
!88 = !DILocation(line: 109, column: 5, scope: !66)
!89 = !DILocation(line: 111, column: 10, scope: !66)
!90 = !DILocation(line: 111, column: 5, scope: !66)
!91 = !DILocation(line: 112, column: 1, scope: !66)
