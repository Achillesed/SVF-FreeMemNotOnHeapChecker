; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_18.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_18_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  br label %source, !dbg !25

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !26), !dbg !27
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 800, align 16, !dbg !31
  %1 = bitcast i8* %0 to i64*, !dbg !32
  store i64* %1, i64** %dataBuffer, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %source
  %2 = load i64, i64* %i, align 8, !dbg !42
  %cmp = icmp ult i64 %2, 100, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !46
  %4 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !46
  store i64 5, i64* %arrayidx, align 8, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %5, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !56
  store i64* %6, i64** %data, align 8, !dbg !57
  %7 = load i64*, i64** %data, align 8, !dbg !58
  %arrayidx1 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !58
  %8 = load i64, i64* %arrayidx1, align 8, !dbg !58
  call void @printLongLongLine(i64 noundef %8), !dbg !59
  %9 = load i64*, i64** %data, align 8, !dbg !60
  %10 = bitcast i64* %9 to i8*, !dbg !60
  call void @free(i8* noundef %10) #5, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_18_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !67, metadata !DIExpression()), !dbg !68
  store i64* null, i64** %data, align 8, !dbg !69
  br label %source, !dbg !70

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !71), !dbg !72
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !73, metadata !DIExpression()), !dbg !75
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !76
  %0 = bitcast i8* %call to i64*, !dbg !77
  store i64* %0, i64** %dataBuffer, align 8, !dbg !75
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !78
  %cmp = icmp eq i64* %1, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %source
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @exit(i32 noundef 1) #6, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata i64* %i, metadata !85, metadata !DIExpression()), !dbg !87
  store i64 0, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !91
  %cmp1 = icmp ult i64 %2, 100, !dbg !93
  br i1 %cmp1, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !95
  %4 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !95
  store i64 5, i64* %arrayidx, align 8, !dbg !98
  br label %for.inc, !dbg !99

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !100
  %inc = add i64 %5, 1, !dbg !100
  store i64 %inc, i64* %i, align 8, !dbg !100
  br label %for.cond, !dbg !101, !llvm.loop !102

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !104
  store i64* %6, i64** %data, align 8, !dbg !105
  %7 = load i64*, i64** %data, align 8, !dbg !106
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !106
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !106
  call void @printLongLongLine(i64 noundef %8), !dbg !107
  %9 = load i64*, i64** %data, align 8, !dbg !108
  %10 = bitcast i64* %9 to i8*, !dbg !108
  call void @free(i8* noundef %10) #5, !dbg !109
  ret void, !dbg !110
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_18.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "fc82334458f6b8d81deafcec958012df")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_18_bad", scope: !1, file: !1, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !18)
!24 = !DILocation(line: 26, column: 10, scope: !18)
!25 = !DILocation(line: 27, column: 5, scope: !18)
!26 = !DILabel(scope: !18, name: "source", file: !1, line: 28)
!27 = !DILocation(line: 28, column: 1, scope: !18)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !1, line: 31, type: !3)
!29 = distinct !DILexicalBlock(scope: !18, file: !1, line: 29, column: 5)
!30 = !DILocation(line: 31, column: 19, scope: !29)
!31 = !DILocation(line: 31, column: 43, scope: !29)
!32 = !DILocation(line: 31, column: 32, scope: !29)
!33 = !DILocalVariable(name: "i", scope: !34, file: !1, line: 33, type: !35)
!34 = distinct !DILexicalBlock(scope: !29, file: !1, line: 32, column: 9)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!37 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 33, column: 20, scope: !34)
!39 = !DILocation(line: 34, column: 20, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !1, line: 34, column: 13)
!41 = !DILocation(line: 34, column: 18, scope: !40)
!42 = !DILocation(line: 34, column: 25, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !1, line: 34, column: 13)
!44 = !DILocation(line: 34, column: 27, scope: !43)
!45 = !DILocation(line: 34, column: 13, scope: !40)
!46 = !DILocation(line: 36, column: 17, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !1, line: 35, column: 13)
!48 = !DILocation(line: 36, column: 28, scope: !47)
!49 = !DILocation(line: 36, column: 31, scope: !47)
!50 = !DILocation(line: 37, column: 13, scope: !47)
!51 = !DILocation(line: 34, column: 35, scope: !43)
!52 = !DILocation(line: 34, column: 13, scope: !43)
!53 = distinct !{!53, !45, !54, !55}
!54 = !DILocation(line: 37, column: 13, scope: !40)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 39, column: 16, scope: !29)
!57 = !DILocation(line: 39, column: 14, scope: !29)
!58 = !DILocation(line: 41, column: 23, scope: !18)
!59 = !DILocation(line: 41, column: 5, scope: !18)
!60 = !DILocation(line: 43, column: 10, scope: !18)
!61 = !DILocation(line: 43, column: 5, scope: !18)
!62 = !DILocation(line: 44, column: 1, scope: !18)
!63 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_18_good", scope: !1, file: !1, line: 79, type: !19, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!64 = !DILocation(line: 81, column: 5, scope: !63)
!65 = !DILocation(line: 82, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 51, type: !19, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!67 = !DILocalVariable(name: "data", scope: !66, file: !1, line: 53, type: !3)
!68 = !DILocation(line: 53, column: 15, scope: !66)
!69 = !DILocation(line: 54, column: 10, scope: !66)
!70 = !DILocation(line: 55, column: 5, scope: !66)
!71 = !DILabel(scope: !66, name: "source", file: !1, line: 56)
!72 = !DILocation(line: 56, column: 1, scope: !66)
!73 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !1, line: 59, type: !3)
!74 = distinct !DILexicalBlock(scope: !66, file: !1, line: 57, column: 5)
!75 = !DILocation(line: 59, column: 19, scope: !74)
!76 = !DILocation(line: 59, column: 43, scope: !74)
!77 = !DILocation(line: 59, column: 32, scope: !74)
!78 = !DILocation(line: 60, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !1, line: 60, column: 13)
!80 = !DILocation(line: 60, column: 24, scope: !79)
!81 = !DILocation(line: 60, column: 13, scope: !74)
!82 = !DILocation(line: 62, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !1, line: 61, column: 9)
!84 = !DILocation(line: 63, column: 13, scope: !83)
!85 = !DILocalVariable(name: "i", scope: !86, file: !1, line: 66, type: !35)
!86 = distinct !DILexicalBlock(scope: !74, file: !1, line: 65, column: 9)
!87 = !DILocation(line: 66, column: 20, scope: !86)
!88 = !DILocation(line: 67, column: 20, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !1, line: 67, column: 13)
!90 = !DILocation(line: 67, column: 18, scope: !89)
!91 = !DILocation(line: 67, column: 25, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !1, line: 67, column: 13)
!93 = !DILocation(line: 67, column: 27, scope: !92)
!94 = !DILocation(line: 67, column: 13, scope: !89)
!95 = !DILocation(line: 69, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !1, line: 68, column: 13)
!97 = !DILocation(line: 69, column: 28, scope: !96)
!98 = !DILocation(line: 69, column: 31, scope: !96)
!99 = !DILocation(line: 70, column: 13, scope: !96)
!100 = !DILocation(line: 67, column: 35, scope: !92)
!101 = !DILocation(line: 67, column: 13, scope: !92)
!102 = distinct !{!102, !94, !103, !55}
!103 = !DILocation(line: 70, column: 13, scope: !89)
!104 = !DILocation(line: 72, column: 16, scope: !74)
!105 = !DILocation(line: 72, column: 14, scope: !74)
!106 = !DILocation(line: 74, column: 23, scope: !66)
!107 = !DILocation(line: 74, column: 5, scope: !66)
!108 = !DILocation(line: 76, column: 10, scope: !66)
!109 = !DILocation(line: 76, column: 5, scope: !66)
!110 = !DILocation(line: 77, column: 1, scope: !66)
