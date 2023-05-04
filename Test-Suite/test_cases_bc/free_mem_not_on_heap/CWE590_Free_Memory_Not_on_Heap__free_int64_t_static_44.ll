; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_44.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_44_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_44_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !30, metadata !DIExpression()), !dbg !34
  store void (i64*)* @badSink, void (i64*)** %funcPtr, align 8, !dbg !34
  store i64* null, i64** %data, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %0, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_44_bad.dataBuffer, i64 0, i64 %1, !dbg !52
  store i64 5, i64* %arrayidx, align 8, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %2, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_44_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !60
  %3 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !61
  %4 = load i64*, i64** %data, align 8, !dbg !62
  call void %3(i64* noundef %4), !dbg !61
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink(i64* noundef %data) #0 !dbg !64 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i64*, i64** %data.addr, align 8, !dbg !67
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0, !dbg !67
  %1 = load i64, i64* %arrayidx, align 8, !dbg !67
  call void @printLongLongLine(i64 noundef %1), !dbg !68
  %2 = load i64*, i64** %data.addr, align 8, !dbg !69
  %3 = bitcast i64* %2 to i8*, !dbg !69
  call void @free(i8* noundef %3) #5, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_44_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !78, metadata !DIExpression()), !dbg !79
  store void (i64*)* @goodG2BSink, void (i64*)** %funcPtr, align 8, !dbg !79
  store i64* null, i64** %data, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !83
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !84
  %0 = bitcast i8* %call to i64*, !dbg !85
  store i64* %0, i64** %dataBuffer, align 8, !dbg !83
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !86
  %cmp = icmp eq i64* %1, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @exit(i32 noundef 1) #6, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !93, metadata !DIExpression()), !dbg !95
  store i64 0, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !99
  %cmp1 = icmp ult i64 %2, 100, !dbg !101
  br i1 %cmp1, label %for.body, label %for.end, !dbg !102

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !103
  %4 = load i64, i64* %i, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !103
  store i64 5, i64* %arrayidx, align 8, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !108
  %inc = add i64 %5, 1, !dbg !108
  store i64 %inc, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !112
  store i64* %6, i64** %data, align 8, !dbg !113
  %7 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !114
  %8 = load i64*, i64** %data, align 8, !dbg !115
  call void %7(i64* noundef %8), !dbg !114
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink(i64* noundef %data) #0 !dbg !117 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !118, metadata !DIExpression()), !dbg !119
  %0 = load i64*, i64** %data.addr, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0, !dbg !120
  %1 = load i64, i64* %arrayidx, align 8, !dbg !120
  call void @printLongLongLine(i64 noundef %1), !dbg !121
  %2 = load i64*, i64** %data.addr, align 8, !dbg !122
  %3 = bitcast i64* %2 to i8*, !dbg !122
  call void @free(i8* noundef %3) #5, !dbg !123
  ret void, !dbg !124
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!20, !21, !22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 38, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_44_bad", scope: !3, file: !3, line: 30, type: !4, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_44.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "e28084b5678054d49c7b249513c9494e")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !15, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !14}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !10, line: 27, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !12, line: 44, baseType: !13)
!12 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!13 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !{!0}
!16 = !{}
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 6400, elements: !18)
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
!28 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 32, type: !8)
!29 = !DILocation(line: 32, column: 15, scope: !2)
!30 = !DILocalVariable(name: "funcPtr", scope: !2, file: !3, line: 34, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DISubroutineType(types: !33)
!33 = !{null, !8}
!34 = !DILocation(line: 34, column: 12, scope: !2)
!35 = !DILocation(line: 35, column: 10, scope: !2)
!36 = !DILocalVariable(name: "i", scope: !37, file: !3, line: 40, type: !39)
!37 = distinct !DILexicalBlock(scope: !38, file: !3, line: 39, column: 9)
!38 = distinct !DILexicalBlock(scope: !2, file: !3, line: 36, column: 5)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 40, column: 20, scope: !37)
!43 = !DILocation(line: 41, column: 20, scope: !44)
!44 = distinct !DILexicalBlock(scope: !37, file: !3, line: 41, column: 13)
!45 = !DILocation(line: 41, column: 18, scope: !44)
!46 = !DILocation(line: 41, column: 25, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !3, line: 41, column: 13)
!48 = !DILocation(line: 41, column: 27, scope: !47)
!49 = !DILocation(line: 41, column: 13, scope: !44)
!50 = !DILocation(line: 43, column: 28, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !3, line: 42, column: 13)
!52 = !DILocation(line: 43, column: 17, scope: !51)
!53 = !DILocation(line: 43, column: 31, scope: !51)
!54 = !DILocation(line: 44, column: 13, scope: !51)
!55 = !DILocation(line: 41, column: 35, scope: !47)
!56 = !DILocation(line: 41, column: 13, scope: !47)
!57 = distinct !{!57, !49, !58, !59}
!58 = !DILocation(line: 44, column: 13, scope: !44)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 46, column: 14, scope: !38)
!61 = !DILocation(line: 49, column: 5, scope: !2)
!62 = !DILocation(line: 49, column: 13, scope: !2)
!63 = !DILocation(line: 50, column: 1, scope: !2)
!64 = distinct !DISubprogram(name: "badSink", scope: !3, file: !3, line: 23, type: !32, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!65 = !DILocalVariable(name: "data", arg: 1, scope: !64, file: !3, line: 23, type: !8)
!66 = !DILocation(line: 23, column: 31, scope: !64)
!67 = !DILocation(line: 25, column: 23, scope: !64)
!68 = !DILocation(line: 25, column: 5, scope: !64)
!69 = !DILocation(line: 27, column: 10, scope: !64)
!70 = !DILocation(line: 27, column: 5, scope: !64)
!71 = !DILocation(line: 28, column: 1, scope: !64)
!72 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_44_good", scope: !3, file: !3, line: 89, type: !4, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!73 = !DILocation(line: 91, column: 5, scope: !72)
!74 = !DILocation(line: 92, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 64, type: !4, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!76 = !DILocalVariable(name: "data", scope: !75, file: !3, line: 66, type: !8)
!77 = !DILocation(line: 66, column: 15, scope: !75)
!78 = !DILocalVariable(name: "funcPtr", scope: !75, file: !3, line: 67, type: !31)
!79 = !DILocation(line: 67, column: 12, scope: !75)
!80 = !DILocation(line: 68, column: 10, scope: !75)
!81 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !3, line: 71, type: !8)
!82 = distinct !DILexicalBlock(scope: !75, file: !3, line: 69, column: 5)
!83 = !DILocation(line: 71, column: 19, scope: !82)
!84 = !DILocation(line: 71, column: 43, scope: !82)
!85 = !DILocation(line: 71, column: 32, scope: !82)
!86 = !DILocation(line: 72, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !3, line: 72, column: 13)
!88 = !DILocation(line: 72, column: 24, scope: !87)
!89 = !DILocation(line: 72, column: 13, scope: !82)
!90 = !DILocation(line: 74, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !3, line: 73, column: 9)
!92 = !DILocation(line: 75, column: 13, scope: !91)
!93 = !DILocalVariable(name: "i", scope: !94, file: !3, line: 78, type: !39)
!94 = distinct !DILexicalBlock(scope: !82, file: !3, line: 77, column: 9)
!95 = !DILocation(line: 78, column: 20, scope: !94)
!96 = !DILocation(line: 79, column: 20, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !3, line: 79, column: 13)
!98 = !DILocation(line: 79, column: 18, scope: !97)
!99 = !DILocation(line: 79, column: 25, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !3, line: 79, column: 13)
!101 = !DILocation(line: 79, column: 27, scope: !100)
!102 = !DILocation(line: 79, column: 13, scope: !97)
!103 = !DILocation(line: 81, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !3, line: 80, column: 13)
!105 = !DILocation(line: 81, column: 28, scope: !104)
!106 = !DILocation(line: 81, column: 31, scope: !104)
!107 = !DILocation(line: 82, column: 13, scope: !104)
!108 = !DILocation(line: 79, column: 35, scope: !100)
!109 = !DILocation(line: 79, column: 13, scope: !100)
!110 = distinct !{!110, !102, !111, !59}
!111 = !DILocation(line: 82, column: 13, scope: !97)
!112 = !DILocation(line: 84, column: 16, scope: !82)
!113 = !DILocation(line: 84, column: 14, scope: !82)
!114 = !DILocation(line: 86, column: 5, scope: !75)
!115 = !DILocation(line: 86, column: 13, scope: !75)
!116 = !DILocation(line: 87, column: 1, scope: !75)
!117 = distinct !DISubprogram(name: "goodG2BSink", scope: !3, file: !3, line: 57, type: !32, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!118 = !DILocalVariable(name: "data", arg: 1, scope: !117, file: !3, line: 57, type: !8)
!119 = !DILocation(line: 57, column: 35, scope: !117)
!120 = !DILocation(line: 59, column: 23, scope: !117)
!121 = !DILocation(line: 59, column: 5, scope: !117)
!122 = !DILocation(line: 61, column: 10, scope: !117)
!123 = !DILocation(line: 61, column: 5, scope: !117)
!124 = !DILocation(line: 62, column: 1, scope: !117)
