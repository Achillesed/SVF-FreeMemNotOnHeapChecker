; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_44.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_44_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !24, metadata !DIExpression()), !dbg !28
  store void (i64*)* @badSink, void (i64*)** %funcPtr, align 8, !dbg !28
  store i64* null, i64** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !32
  %0 = alloca i8, i64 800, align 16, !dbg !33
  %1 = bitcast i8* %0 to i64*, !dbg !34
  store i64* %1, i64** %dataBuffer, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !44
  %cmp = icmp ult i64 %2, 100, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !48
  %4 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !48
  store i64 5, i64* %arrayidx, align 8, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %5, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !58
  store i64* %6, i64** %data, align 8, !dbg !59
  %7 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !60
  %8 = load i64*, i64** %data, align 8, !dbg !61
  call void %7(i64* noundef %8), !dbg !60
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink(i64* noundef %data) #0 !dbg !63 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i64*, i64** %data.addr, align 8, !dbg !66
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0, !dbg !66
  %1 = load i64, i64* %arrayidx, align 8, !dbg !66
  call void @printLongLongLine(i64 noundef %1), !dbg !67
  %2 = load i64*, i64** %data.addr, align 8, !dbg !68
  %3 = bitcast i64* %2 to i8*, !dbg !68
  call void @free(i8* noundef %3) #5, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_44_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !77, metadata !DIExpression()), !dbg !78
  store void (i64*)* @goodG2BSink, void (i64*)** %funcPtr, align 8, !dbg !78
  store i64* null, i64** %data, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !82
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !83
  %0 = bitcast i8* %call to i64*, !dbg !84
  store i64* %0, i64** %dataBuffer, align 8, !dbg !82
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !85
  %cmp = icmp eq i64* %1, null, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @exit(i32 noundef 1) #6, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !92, metadata !DIExpression()), !dbg !94
  store i64 0, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !97

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !98
  %cmp1 = icmp ult i64 %2, 100, !dbg !100
  br i1 %cmp1, label %for.body, label %for.end, !dbg !101

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !102
  %4 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !102
  store i64 5, i64* %arrayidx, align 8, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !107
  %inc = add i64 %5, 1, !dbg !107
  store i64 %inc, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !111
  store i64* %6, i64** %data, align 8, !dbg !112
  %7 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !113
  %8 = load i64*, i64** %data, align 8, !dbg !114
  call void %7(i64* noundef %8), !dbg !113
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink(i64* noundef %data) #0 !dbg !116 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = load i64*, i64** %data.addr, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 0, !dbg !119
  %1 = load i64, i64* %arrayidx, align 8, !dbg !119
  call void @printLongLongLine(i64 noundef %1), !dbg !120
  %2 = load i64*, i64** %data.addr, align 8, !dbg !121
  %3 = bitcast i64* %2 to i8*, !dbg !121
  call void @free(i8* noundef %3) #5, !dbg !122
  ret void, !dbg !123
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_44.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "3856efff56f77378e0f608cf7b0bc6c0")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !5, line: 27, baseType: !6)
!5 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !7, line: 44, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!8 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 5}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"PIE Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_44_bad", scope: !1, file: !1, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 32, type: !3)
!23 = !DILocation(line: 32, column: 15, scope: !18)
!24 = !DILocalVariable(name: "funcPtr", scope: !18, file: !1, line: 34, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !3}
!28 = !DILocation(line: 34, column: 12, scope: !18)
!29 = !DILocation(line: 35, column: 10, scope: !18)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !1, line: 38, type: !3)
!31 = distinct !DILexicalBlock(scope: !18, file: !1, line: 36, column: 5)
!32 = !DILocation(line: 38, column: 19, scope: !31)
!33 = !DILocation(line: 38, column: 43, scope: !31)
!34 = !DILocation(line: 38, column: 32, scope: !31)
!35 = !DILocalVariable(name: "i", scope: !36, file: !1, line: 40, type: !37)
!36 = distinct !DILexicalBlock(scope: !31, file: !1, line: 39, column: 9)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!39 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 40, column: 20, scope: !36)
!41 = !DILocation(line: 41, column: 20, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !1, line: 41, column: 13)
!43 = !DILocation(line: 41, column: 18, scope: !42)
!44 = !DILocation(line: 41, column: 25, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !1, line: 41, column: 13)
!46 = !DILocation(line: 41, column: 27, scope: !45)
!47 = !DILocation(line: 41, column: 13, scope: !42)
!48 = !DILocation(line: 43, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !1, line: 42, column: 13)
!50 = !DILocation(line: 43, column: 28, scope: !49)
!51 = !DILocation(line: 43, column: 31, scope: !49)
!52 = !DILocation(line: 44, column: 13, scope: !49)
!53 = !DILocation(line: 41, column: 35, scope: !45)
!54 = !DILocation(line: 41, column: 13, scope: !45)
!55 = distinct !{!55, !47, !56, !57}
!56 = !DILocation(line: 44, column: 13, scope: !42)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 46, column: 16, scope: !31)
!59 = !DILocation(line: 46, column: 14, scope: !31)
!60 = !DILocation(line: 49, column: 5, scope: !18)
!61 = !DILocation(line: 49, column: 13, scope: !18)
!62 = !DILocation(line: 50, column: 1, scope: !18)
!63 = distinct !DISubprogram(name: "badSink", scope: !1, file: !1, line: 23, type: !26, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!64 = !DILocalVariable(name: "data", arg: 1, scope: !63, file: !1, line: 23, type: !3)
!65 = !DILocation(line: 23, column: 31, scope: !63)
!66 = !DILocation(line: 25, column: 23, scope: !63)
!67 = !DILocation(line: 25, column: 5, scope: !63)
!68 = !DILocation(line: 27, column: 10, scope: !63)
!69 = !DILocation(line: 27, column: 5, scope: !63)
!70 = !DILocation(line: 28, column: 1, scope: !63)
!71 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_44_good", scope: !1, file: !1, line: 89, type: !19, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!72 = !DILocation(line: 91, column: 5, scope: !71)
!73 = !DILocation(line: 92, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 64, type: !19, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!75 = !DILocalVariable(name: "data", scope: !74, file: !1, line: 66, type: !3)
!76 = !DILocation(line: 66, column: 15, scope: !74)
!77 = !DILocalVariable(name: "funcPtr", scope: !74, file: !1, line: 67, type: !25)
!78 = !DILocation(line: 67, column: 12, scope: !74)
!79 = !DILocation(line: 68, column: 10, scope: !74)
!80 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !1, line: 71, type: !3)
!81 = distinct !DILexicalBlock(scope: !74, file: !1, line: 69, column: 5)
!82 = !DILocation(line: 71, column: 19, scope: !81)
!83 = !DILocation(line: 71, column: 43, scope: !81)
!84 = !DILocation(line: 71, column: 32, scope: !81)
!85 = !DILocation(line: 72, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !1, line: 72, column: 13)
!87 = !DILocation(line: 72, column: 24, scope: !86)
!88 = !DILocation(line: 72, column: 13, scope: !81)
!89 = !DILocation(line: 74, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !1, line: 73, column: 9)
!91 = !DILocation(line: 75, column: 13, scope: !90)
!92 = !DILocalVariable(name: "i", scope: !93, file: !1, line: 78, type: !37)
!93 = distinct !DILexicalBlock(scope: !81, file: !1, line: 77, column: 9)
!94 = !DILocation(line: 78, column: 20, scope: !93)
!95 = !DILocation(line: 79, column: 20, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !1, line: 79, column: 13)
!97 = !DILocation(line: 79, column: 18, scope: !96)
!98 = !DILocation(line: 79, column: 25, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !1, line: 79, column: 13)
!100 = !DILocation(line: 79, column: 27, scope: !99)
!101 = !DILocation(line: 79, column: 13, scope: !96)
!102 = !DILocation(line: 81, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !1, line: 80, column: 13)
!104 = !DILocation(line: 81, column: 28, scope: !103)
!105 = !DILocation(line: 81, column: 31, scope: !103)
!106 = !DILocation(line: 82, column: 13, scope: !103)
!107 = !DILocation(line: 79, column: 35, scope: !99)
!108 = !DILocation(line: 79, column: 13, scope: !99)
!109 = distinct !{!109, !101, !110, !57}
!110 = !DILocation(line: 82, column: 13, scope: !96)
!111 = !DILocation(line: 84, column: 16, scope: !81)
!112 = !DILocation(line: 84, column: 14, scope: !81)
!113 = !DILocation(line: 86, column: 5, scope: !74)
!114 = !DILocation(line: 86, column: 13, scope: !74)
!115 = !DILocation(line: 87, column: 1, scope: !74)
!116 = distinct !DISubprogram(name: "goodG2BSink", scope: !1, file: !1, line: 57, type: !26, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!117 = !DILocalVariable(name: "data", arg: 1, scope: !116, file: !1, line: 57, type: !3)
!118 = !DILocation(line: 57, column: 35, scope: !116)
!119 = !DILocation(line: 59, column: 23, scope: !116)
!120 = !DILocation(line: 59, column: 5, scope: !116)
!121 = !DILocation(line: 61, column: 10, scope: !116)
!122 = !DILocation(line: 61, column: 5, scope: !116)
!123 = !DILocation(line: 62, column: 1, scope: !116)
