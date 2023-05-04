; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1
@CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_goodG2BData = internal global i8* null, align 8, !dbg !9

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
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
  %4 = load i8*, i8** %data, align 8, !dbg !36
  store i8* %4, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_badData, align 8, !dbg !37
  call void @badSink(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink() #0 !dbg !43 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load i8*, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_badData, align 8, !dbg !46
  store i8* %0, i8** %data, align 8, !dbg !45
  %1 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* noundef %1), !dbg !48
  %2 = load i8*, i8** %data, align 8, !dbg !49
  call void @free(i8* noundef %2) #6, !dbg !50
  ret void, !dbg !51
}

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !52 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !53, metadata !DIExpression()), !dbg !54
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
  %4 = load i8*, i8** %data, align 8, !dbg !73
  store i8* %4, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_goodG2BData, align 8, !dbg !74
  call void @goodG2BSink(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = load i8*, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_goodG2BData, align 8, !dbg !80
  store i8* %0, i8** %data, align 8, !dbg !79
  %1 = load i8*, i8** %data, align 8, !dbg !81
  call void @printLine(i8* noundef %1), !dbg !82
  %2 = load i8*, i8** %data, align 8, !dbg !83
  call void @free(i8* noundef %2) #6, !dbg !84
  ret void, !dbg !85
}

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
!1 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_badData", scope: !2, file: !3, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "d733c5bdfc4b01b44ee85c243672c529")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_goodG2BData", scope: !2, file: !3, line: 22, type: !5, isLocal: true, isDefinition: true)
!11 = !{i32 7, !"Dwarf Version", i32 5}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"PIE Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!19 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_bad", scope: !3, file: !3, line: 34, type: !20, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !3, line: 36, type: !5)
!24 = !DILocation(line: 36, column: 12, scope: !19)
!25 = !DILocation(line: 37, column: 10, scope: !19)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !3, line: 40, type: !5)
!27 = distinct !DILexicalBlock(scope: !19, file: !3, line: 38, column: 5)
!28 = !DILocation(line: 40, column: 16, scope: !27)
!29 = !DILocation(line: 40, column: 37, scope: !27)
!30 = !DILocation(line: 41, column: 16, scope: !27)
!31 = !DILocation(line: 41, column: 9, scope: !27)
!32 = !DILocation(line: 42, column: 9, scope: !27)
!33 = !DILocation(line: 42, column: 27, scope: !27)
!34 = !DILocation(line: 43, column: 16, scope: !27)
!35 = !DILocation(line: 43, column: 14, scope: !27)
!36 = !DILocation(line: 45, column: 67, scope: !19)
!37 = !DILocation(line: 45, column: 65, scope: !19)
!38 = !DILocation(line: 46, column: 5, scope: !19)
!39 = !DILocation(line: 47, column: 1, scope: !19)
!40 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_good", scope: !3, file: !3, line: 82, type: !20, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!41 = !DILocation(line: 84, column: 5, scope: !40)
!42 = !DILocation(line: 85, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "badSink", scope: !3, file: !3, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!44 = !DILocalVariable(name: "data", scope: !43, file: !3, line: 28, type: !5)
!45 = !DILocation(line: 28, column: 12, scope: !43)
!46 = !DILocation(line: 28, column: 19, scope: !43)
!47 = !DILocation(line: 29, column: 15, scope: !43)
!48 = !DILocation(line: 29, column: 5, scope: !43)
!49 = !DILocation(line: 31, column: 10, scope: !43)
!50 = !DILocation(line: 31, column: 5, scope: !43)
!51 = !DILocation(line: 32, column: 1, scope: !43)
!52 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 62, type: !20, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!53 = !DILocalVariable(name: "data", scope: !52, file: !3, line: 64, type: !5)
!54 = !DILocation(line: 64, column: 12, scope: !52)
!55 = !DILocation(line: 65, column: 10, scope: !52)
!56 = !DILocalVariable(name: "dataBuffer", scope: !57, file: !3, line: 68, type: !5)
!57 = distinct !DILexicalBlock(scope: !52, file: !3, line: 66, column: 5)
!58 = !DILocation(line: 68, column: 16, scope: !57)
!59 = !DILocation(line: 68, column: 37, scope: !57)
!60 = !DILocation(line: 69, column: 13, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !3, line: 69, column: 13)
!62 = !DILocation(line: 69, column: 24, scope: !61)
!63 = !DILocation(line: 69, column: 13, scope: !57)
!64 = !DILocation(line: 71, column: 13, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !3, line: 70, column: 9)
!66 = !DILocation(line: 72, column: 13, scope: !65)
!67 = !DILocation(line: 74, column: 16, scope: !57)
!68 = !DILocation(line: 74, column: 9, scope: !57)
!69 = !DILocation(line: 75, column: 9, scope: !57)
!70 = !DILocation(line: 75, column: 27, scope: !57)
!71 = !DILocation(line: 76, column: 16, scope: !57)
!72 = !DILocation(line: 76, column: 14, scope: !57)
!73 = !DILocation(line: 78, column: 71, scope: !52)
!74 = !DILocation(line: 78, column: 69, scope: !52)
!75 = !DILocation(line: 79, column: 5, scope: !52)
!76 = !DILocation(line: 80, column: 1, scope: !52)
!77 = distinct !DISubprogram(name: "goodG2BSink", scope: !3, file: !3, line: 54, type: !20, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!78 = !DILocalVariable(name: "data", scope: !77, file: !3, line: 56, type: !5)
!79 = !DILocation(line: 56, column: 12, scope: !77)
!80 = !DILocation(line: 56, column: 19, scope: !77)
!81 = !DILocation(line: 57, column: 15, scope: !77)
!82 = !DILocation(line: 57, column: 5, scope: !77)
!83 = !DILocation(line: 59, column: 10, scope: !77)
!84 = !DILocation(line: 59, column: 5, scope: !77)
!85 = !DILocation(line: 60, column: 1, scope: !77)
