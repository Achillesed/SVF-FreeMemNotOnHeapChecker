; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_static_31.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_static_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_char_static_31_bad.dataBuffer = internal global [100 x i8] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_31_bad() #0 !dbg !2 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_31_bad.dataBuffer, i64 0, i64 0), i8 65, i64 99, i1 false), !dbg !27
  store i8 0, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_31_bad.dataBuffer, i64 0, i64 99), align 1, !dbg !29
  store i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_31_bad.dataBuffer, i64 0, i64 0), i8** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !31, metadata !DIExpression()), !dbg !33
  %0 = load i8*, i8** %data, align 8, !dbg !34
  store i8* %0, i8** %dataCopy, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !35, metadata !DIExpression()), !dbg !36
  %1 = load i8*, i8** %dataCopy, align 8, !dbg !37
  store i8* %1, i8** %data1, align 8, !dbg !36
  %2 = load i8*, i8** %data1, align 8, !dbg !38
  call void @printLine(i8* noundef %2), !dbg !39
  %3 = load i8*, i8** %data1, align 8, !dbg !40
  call void @free(i8* noundef %3) #6, !dbg !41
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_31_good() #0 !dbg !43 {
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

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 29, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_31_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_static_31.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "92dc17f0f13d9869d01de508c2c10e47")
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
!27 = !DILocation(line: 30, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !2, file: !3, line: 27, column: 5)
!29 = !DILocation(line: 31, column: 27, scope: !28)
!30 = !DILocation(line: 32, column: 14, scope: !28)
!31 = !DILocalVariable(name: "dataCopy", scope: !32, file: !3, line: 35, type: !8)
!32 = distinct !DILexicalBlock(scope: !2, file: !3, line: 34, column: 5)
!33 = !DILocation(line: 35, column: 16, scope: !32)
!34 = !DILocation(line: 35, column: 27, scope: !32)
!35 = !DILocalVariable(name: "data", scope: !32, file: !3, line: 36, type: !8)
!36 = !DILocation(line: 36, column: 16, scope: !32)
!37 = !DILocation(line: 36, column: 23, scope: !32)
!38 = !DILocation(line: 37, column: 19, scope: !32)
!39 = !DILocation(line: 37, column: 9, scope: !32)
!40 = !DILocation(line: 39, column: 14, scope: !32)
!41 = !DILocation(line: 39, column: 9, scope: !32)
!42 = !DILocation(line: 41, column: 1, scope: !2)
!43 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_31_good", scope: !3, file: !3, line: 73, type: !4, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!44 = !DILocation(line: 75, column: 5, scope: !43)
!45 = !DILocation(line: 76, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 48, type: !4, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!47 = !DILocalVariable(name: "data", scope: !46, file: !3, line: 50, type: !8)
!48 = !DILocation(line: 50, column: 12, scope: !46)
!49 = !DILocation(line: 51, column: 10, scope: !46)
!50 = !DILocalVariable(name: "dataBuffer", scope: !51, file: !3, line: 54, type: !8)
!51 = distinct !DILexicalBlock(scope: !46, file: !3, line: 52, column: 5)
!52 = !DILocation(line: 54, column: 16, scope: !51)
!53 = !DILocation(line: 54, column: 37, scope: !51)
!54 = !DILocation(line: 55, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !3, line: 55, column: 13)
!56 = !DILocation(line: 55, column: 24, scope: !55)
!57 = !DILocation(line: 55, column: 13, scope: !51)
!58 = !DILocation(line: 57, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !3, line: 56, column: 9)
!60 = !DILocation(line: 58, column: 13, scope: !59)
!61 = !DILocation(line: 60, column: 16, scope: !51)
!62 = !DILocation(line: 60, column: 9, scope: !51)
!63 = !DILocation(line: 61, column: 9, scope: !51)
!64 = !DILocation(line: 61, column: 27, scope: !51)
!65 = !DILocation(line: 62, column: 16, scope: !51)
!66 = !DILocation(line: 62, column: 14, scope: !51)
!67 = !DILocalVariable(name: "dataCopy", scope: !68, file: !3, line: 65, type: !8)
!68 = distinct !DILexicalBlock(scope: !46, file: !3, line: 64, column: 5)
!69 = !DILocation(line: 65, column: 16, scope: !68)
!70 = !DILocation(line: 65, column: 27, scope: !68)
!71 = !DILocalVariable(name: "data", scope: !68, file: !3, line: 66, type: !8)
!72 = !DILocation(line: 66, column: 16, scope: !68)
!73 = !DILocation(line: 66, column: 23, scope: !68)
!74 = !DILocation(line: 67, column: 19, scope: !68)
!75 = !DILocation(line: 67, column: 9, scope: !68)
!76 = !DILocation(line: 69, column: 14, scope: !68)
!77 = !DILocation(line: 69, column: 9, scope: !68)
!78 = !DILocation(line: 71, column: 1, scope: !46)
