; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_static_45.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_static_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_char_static_45_bad.dataBuffer = internal global [100 x i8] zeroinitializer, align 16, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_char_static_45_badData = internal global i8* null, align 8, !dbg !12
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1
@CWE590_Free_Memory_Not_on_Heap__free_char_static_45_goodG2BData = internal global i8* null, align 8, !dbg !14

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_45_bad() #0 !dbg !2 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i8* null, i8** %data, align 8, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_45_bad.dataBuffer, i64 0, i64 0), i8 65, i64 99, i1 false), !dbg !31
  store i8 0, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_45_bad.dataBuffer, i64 0, i64 99), align 1, !dbg !33
  store i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_45_bad.dataBuffer, i64 0, i64 0), i8** %data, align 8, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  store i8* %0, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_static_45_badData, align 8, !dbg !36
  call void @badSink(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_45_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink() #0 !dbg !42 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !43, metadata !DIExpression()), !dbg !44
  %0 = load i8*, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_static_45_badData, align 8, !dbg !45
  store i8* %0, i8** %data, align 8, !dbg !44
  %1 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* noundef %1), !dbg !47
  %2 = load i8*, i8** %data, align 8, !dbg !48
  call void @free(i8* noundef %2) #6, !dbg !49
  ret void, !dbg !50
}

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !51 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !52, metadata !DIExpression()), !dbg !53
  store i8* null, i8** %data, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !55, metadata !DIExpression()), !dbg !57
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !58
  store i8* %call, i8** %dataBuffer, align 8, !dbg !57
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !59
  %cmp = icmp eq i8* %0, null, !dbg !61
  br i1 %cmp, label %if.then, label %if.end, !dbg !62

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @exit(i32 noundef 1) #7, !dbg !65
  unreachable, !dbg !65

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !66
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !67
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !68
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !68
  store i8 0, i8* %arrayidx, align 1, !dbg !69
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !70
  store i8* %3, i8** %data, align 8, !dbg !71
  %4 = load i8*, i8** %data, align 8, !dbg !72
  store i8* %4, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_static_45_goodG2BData, align 8, !dbg !73
  call void @goodG2BSink(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = load i8*, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_static_45_goodG2BData, align 8, !dbg !79
  store i8* %0, i8** %data, align 8, !dbg !78
  %1 = load i8*, i8** %data, align 8, !dbg !80
  call void @printLine(i8* noundef %1), !dbg !81
  %2 = load i8*, i8** %data, align 8, !dbg !82
  call void @free(i8* noundef %2) #6, !dbg !83
  ret void, !dbg !84
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
!llvm.module.flags = !{!20, !21, !22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 40, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_45_bad", scope: !3, file: !3, line: 34, type: !4, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_static_45.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "953ca0f6831a11637e5c609338a39774")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0, !12, !14}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_45_badData", scope: !6, file: !3, line: 21, type: !8, isLocal: true, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_45_goodG2BData", scope: !6, file: !3, line: 22, type: !8, isLocal: true, isDefinition: true)
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
!28 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 36, type: !8)
!29 = !DILocation(line: 36, column: 12, scope: !2)
!30 = !DILocation(line: 37, column: 10, scope: !2)
!31 = !DILocation(line: 41, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !2, file: !3, line: 38, column: 5)
!33 = !DILocation(line: 42, column: 27, scope: !32)
!34 = !DILocation(line: 43, column: 14, scope: !32)
!35 = !DILocation(line: 45, column: 67, scope: !2)
!36 = !DILocation(line: 45, column: 65, scope: !2)
!37 = !DILocation(line: 46, column: 5, scope: !2)
!38 = !DILocation(line: 47, column: 1, scope: !2)
!39 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_45_good", scope: !3, file: !3, line: 82, type: !4, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!40 = !DILocation(line: 84, column: 5, scope: !39)
!41 = !DILocation(line: 85, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "badSink", scope: !3, file: !3, line: 26, type: !4, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!43 = !DILocalVariable(name: "data", scope: !42, file: !3, line: 28, type: !8)
!44 = !DILocation(line: 28, column: 12, scope: !42)
!45 = !DILocation(line: 28, column: 19, scope: !42)
!46 = !DILocation(line: 29, column: 15, scope: !42)
!47 = !DILocation(line: 29, column: 5, scope: !42)
!48 = !DILocation(line: 31, column: 10, scope: !42)
!49 = !DILocation(line: 31, column: 5, scope: !42)
!50 = !DILocation(line: 32, column: 1, scope: !42)
!51 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 62, type: !4, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!52 = !DILocalVariable(name: "data", scope: !51, file: !3, line: 64, type: !8)
!53 = !DILocation(line: 64, column: 12, scope: !51)
!54 = !DILocation(line: 65, column: 10, scope: !51)
!55 = !DILocalVariable(name: "dataBuffer", scope: !56, file: !3, line: 68, type: !8)
!56 = distinct !DILexicalBlock(scope: !51, file: !3, line: 66, column: 5)
!57 = !DILocation(line: 68, column: 16, scope: !56)
!58 = !DILocation(line: 68, column: 37, scope: !56)
!59 = !DILocation(line: 69, column: 13, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !3, line: 69, column: 13)
!61 = !DILocation(line: 69, column: 24, scope: !60)
!62 = !DILocation(line: 69, column: 13, scope: !56)
!63 = !DILocation(line: 71, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !3, line: 70, column: 9)
!65 = !DILocation(line: 72, column: 13, scope: !64)
!66 = !DILocation(line: 74, column: 16, scope: !56)
!67 = !DILocation(line: 74, column: 9, scope: !56)
!68 = !DILocation(line: 75, column: 9, scope: !56)
!69 = !DILocation(line: 75, column: 27, scope: !56)
!70 = !DILocation(line: 76, column: 16, scope: !56)
!71 = !DILocation(line: 76, column: 14, scope: !56)
!72 = !DILocation(line: 78, column: 71, scope: !51)
!73 = !DILocation(line: 78, column: 69, scope: !51)
!74 = !DILocation(line: 79, column: 5, scope: !51)
!75 = !DILocation(line: 80, column: 1, scope: !51)
!76 = distinct !DISubprogram(name: "goodG2BSink", scope: !3, file: !3, line: 54, type: !4, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!77 = !DILocalVariable(name: "data", scope: !76, file: !3, line: 56, type: !8)
!78 = !DILocation(line: 56, column: 12, scope: !76)
!79 = !DILocation(line: 56, column: 19, scope: !76)
!80 = !DILocation(line: 57, column: 15, scope: !76)
!81 = !DILocation(line: 57, column: 5, scope: !76)
!82 = !DILocation(line: 59, column: 10, scope: !76)
!83 = !DILocation(line: 59, column: 5, scope: !76)
!84 = !DILocation(line: 60, column: 1, scope: !76)
