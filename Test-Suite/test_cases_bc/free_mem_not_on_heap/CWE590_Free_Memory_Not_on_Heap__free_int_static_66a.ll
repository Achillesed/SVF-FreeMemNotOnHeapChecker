; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_static_66a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_static_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int_static_66_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_66_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !26, metadata !DIExpression()), !dbg !30
  store i32* null, i32** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !42
  %cmp = icmp ult i64 %0, 100, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_66_bad.dataBuffer, i64 0, i64 %1, !dbg !48
  store i32 5, i32* %arrayidx, align 4, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %2, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_66_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !56
  %3 = load i32*, i32** %data, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !58
  store i32* %3, i32** %arrayidx1, align 16, !dbg !59
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !60
  call void @CWE590_Free_Memory_Not_on_Heap__free_int_static_66b_badSink(i32** noundef %arraydecay), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int_static_66b_badSink(i32** noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_66_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !69, metadata !DIExpression()), !dbg !70
  store i32* null, i32** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !72, metadata !DIExpression()), !dbg !74
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !75
  %0 = bitcast i8* %call to i32*, !dbg !76
  store i32* %0, i32** %dataBuffer, align 8, !dbg !74
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !77
  %cmp = icmp eq i32* %1, null, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @exit(i32 noundef 1) #6, !dbg !83
  unreachable, !dbg !83

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !84, metadata !DIExpression()), !dbg !86
  store i64 0, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !89

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !90
  %cmp1 = icmp ult i64 %2, 100, !dbg !92
  br i1 %cmp1, label %for.body, label %for.end, !dbg !93

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !94
  %4 = load i64, i64* %i, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !94
  store i32 5, i32* %arrayidx, align 4, !dbg !97
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !99
  %inc = add i64 %5, 1, !dbg !99
  store i64 %inc, i64* %i, align 8, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !103
  store i32* %6, i32** %data, align 8, !dbg !104
  %7 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx2 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !106
  store i32* %7, i32** %arrayidx2, align 16, !dbg !107
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !108
  call void @CWE590_Free_Memory_Not_on_Heap__free_int_static_66b_goodG2BSink(i32** noundef %arraydecay), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_int_static_66b_goodG2BSink(i32** noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 33, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_66_bad", scope: !3, file: !3, line: 26, type: !4, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_static_66a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "7a1d628d16882d0e8723cd8edb0e2a4b")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0}
!12 = !{}
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200, elements: !14)
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
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 28, type: !8)
!25 = !DILocation(line: 28, column: 11, scope: !2)
!26 = !DILocalVariable(name: "dataArray", scope: !2, file: !3, line: 29, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 5)
!30 = !DILocation(line: 29, column: 11, scope: !2)
!31 = !DILocation(line: 30, column: 10, scope: !2)
!32 = !DILocalVariable(name: "i", scope: !33, file: !3, line: 35, type: !35)
!33 = distinct !DILexicalBlock(scope: !34, file: !3, line: 34, column: 9)
!34 = distinct !DILexicalBlock(scope: !2, file: !3, line: 31, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!37 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 35, column: 20, scope: !33)
!39 = !DILocation(line: 36, column: 20, scope: !40)
!40 = distinct !DILexicalBlock(scope: !33, file: !3, line: 36, column: 13)
!41 = !DILocation(line: 36, column: 18, scope: !40)
!42 = !DILocation(line: 36, column: 25, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !3, line: 36, column: 13)
!44 = !DILocation(line: 36, column: 27, scope: !43)
!45 = !DILocation(line: 36, column: 13, scope: !40)
!46 = !DILocation(line: 38, column: 28, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !3, line: 37, column: 13)
!48 = !DILocation(line: 38, column: 17, scope: !47)
!49 = !DILocation(line: 38, column: 31, scope: !47)
!50 = !DILocation(line: 39, column: 13, scope: !47)
!51 = !DILocation(line: 36, column: 35, scope: !43)
!52 = !DILocation(line: 36, column: 13, scope: !43)
!53 = distinct !{!53, !45, !54, !55}
!54 = !DILocation(line: 39, column: 13, scope: !40)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 41, column: 14, scope: !34)
!57 = !DILocation(line: 44, column: 20, scope: !2)
!58 = !DILocation(line: 44, column: 5, scope: !2)
!59 = !DILocation(line: 44, column: 18, scope: !2)
!60 = !DILocation(line: 45, column: 65, scope: !2)
!61 = !DILocation(line: 45, column: 5, scope: !2)
!62 = !DILocation(line: 46, column: 1, scope: !2)
!63 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_66_good", scope: !3, file: !3, line: 81, type: !4, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!64 = !DILocation(line: 83, column: 5, scope: !63)
!65 = !DILocation(line: 84, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 55, type: !4, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!67 = !DILocalVariable(name: "data", scope: !66, file: !3, line: 57, type: !8)
!68 = !DILocation(line: 57, column: 11, scope: !66)
!69 = !DILocalVariable(name: "dataArray", scope: !66, file: !3, line: 58, type: !27)
!70 = !DILocation(line: 58, column: 11, scope: !66)
!71 = !DILocation(line: 59, column: 10, scope: !66)
!72 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !3, line: 62, type: !8)
!73 = distinct !DILexicalBlock(scope: !66, file: !3, line: 60, column: 5)
!74 = !DILocation(line: 62, column: 15, scope: !73)
!75 = !DILocation(line: 62, column: 35, scope: !73)
!76 = !DILocation(line: 62, column: 28, scope: !73)
!77 = !DILocation(line: 63, column: 13, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !3, line: 63, column: 13)
!79 = !DILocation(line: 63, column: 24, scope: !78)
!80 = !DILocation(line: 63, column: 13, scope: !73)
!81 = !DILocation(line: 65, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !3, line: 64, column: 9)
!83 = !DILocation(line: 66, column: 13, scope: !82)
!84 = !DILocalVariable(name: "i", scope: !85, file: !3, line: 69, type: !35)
!85 = distinct !DILexicalBlock(scope: !73, file: !3, line: 68, column: 9)
!86 = !DILocation(line: 69, column: 20, scope: !85)
!87 = !DILocation(line: 70, column: 20, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !3, line: 70, column: 13)
!89 = !DILocation(line: 70, column: 18, scope: !88)
!90 = !DILocation(line: 70, column: 25, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !3, line: 70, column: 13)
!92 = !DILocation(line: 70, column: 27, scope: !91)
!93 = !DILocation(line: 70, column: 13, scope: !88)
!94 = !DILocation(line: 72, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !3, line: 71, column: 13)
!96 = !DILocation(line: 72, column: 28, scope: !95)
!97 = !DILocation(line: 72, column: 31, scope: !95)
!98 = !DILocation(line: 73, column: 13, scope: !95)
!99 = !DILocation(line: 70, column: 35, scope: !91)
!100 = !DILocation(line: 70, column: 13, scope: !91)
!101 = distinct !{!101, !93, !102, !55}
!102 = !DILocation(line: 73, column: 13, scope: !88)
!103 = !DILocation(line: 75, column: 16, scope: !73)
!104 = !DILocation(line: 75, column: 14, scope: !73)
!105 = !DILocation(line: 77, column: 20, scope: !66)
!106 = !DILocation(line: 77, column: 5, scope: !66)
!107 = !DILocation(line: 77, column: 18, scope: !66)
!108 = !DILocation(line: 78, column: 69, scope: !66)
!109 = !DILocation(line: 78, column: 5, scope: !66)
!110 = !DILocation(line: 79, column: 1, scope: !66)
