; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_18.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_18_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_18_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i64* null, i64** %data, align 8, !dbg !30
  br label %source, !dbg !31

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !32), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %source
  %0 = load i64, i64* %i, align 8, !dbg !44
  %cmp = icmp ult i64 %0, 100, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_18_bad.dataBuffer, i64 0, i64 %1, !dbg !50
  store i64 5, i64* %arrayidx, align 8, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %2, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_18_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !58
  %3 = load i64*, i64** %data, align 8, !dbg !59
  %arrayidx1 = getelementptr inbounds i64, i64* %3, i64 0, !dbg !59
  %4 = load i64, i64* %arrayidx1, align 8, !dbg !59
  call void @printLongLongLine(i64 noundef %4), !dbg !60
  %5 = load i64*, i64** %data, align 8, !dbg !61
  %6 = bitcast i64* %5 to i8*, !dbg !61
  call void @free(i8* noundef %6) #5, !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_18_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !67 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i64* null, i64** %data, align 8, !dbg !70
  br label %source, !dbg !71

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !72), !dbg !73
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !76
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !77
  %0 = bitcast i8* %call to i64*, !dbg !78
  store i64* %0, i64** %dataBuffer, align 8, !dbg !76
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !79
  %cmp = icmp eq i64* %1, null, !dbg !81
  br i1 %cmp, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %source
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @exit(i32 noundef 1) #6, !dbg !85
  unreachable, !dbg !85

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata i64* %i, metadata !86, metadata !DIExpression()), !dbg !88
  store i64 0, i64* %i, align 8, !dbg !89
  br label %for.cond, !dbg !91

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !92
  %cmp1 = icmp ult i64 %2, 100, !dbg !94
  br i1 %cmp1, label %for.body, label %for.end, !dbg !95

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !96
  %4 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !96
  store i64 5, i64* %arrayidx, align 8, !dbg !99
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !101
  %inc = add i64 %5, 1, !dbg !101
  store i64 %inc, i64* %i, align 8, !dbg !101
  br label %for.cond, !dbg !102, !llvm.loop !103

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !105
  store i64* %6, i64** %data, align 8, !dbg !106
  %7 = load i64*, i64** %data, align 8, !dbg !107
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !107
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !107
  call void @printLongLongLine(i64 noundef %8), !dbg !108
  %9 = load i64*, i64** %data, align 8, !dbg !109
  %10 = bitcast i64* %9 to i8*, !dbg !109
  call void @free(i8* noundef %10) #5, !dbg !110
  ret void, !dbg !111
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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 31, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_18_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_18.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "40429579f48dd35e31411e60274ef305")
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
!28 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 25, type: !8)
!29 = !DILocation(line: 25, column: 15, scope: !2)
!30 = !DILocation(line: 26, column: 10, scope: !2)
!31 = !DILocation(line: 27, column: 5, scope: !2)
!32 = !DILabel(scope: !2, name: "source", file: !3, line: 28)
!33 = !DILocation(line: 28, column: 1, scope: !2)
!34 = !DILocalVariable(name: "i", scope: !35, file: !3, line: 33, type: !37)
!35 = distinct !DILexicalBlock(scope: !36, file: !3, line: 32, column: 9)
!36 = distinct !DILexicalBlock(scope: !2, file: !3, line: 29, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!39 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 33, column: 20, scope: !35)
!41 = !DILocation(line: 34, column: 20, scope: !42)
!42 = distinct !DILexicalBlock(scope: !35, file: !3, line: 34, column: 13)
!43 = !DILocation(line: 34, column: 18, scope: !42)
!44 = !DILocation(line: 34, column: 25, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !3, line: 34, column: 13)
!46 = !DILocation(line: 34, column: 27, scope: !45)
!47 = !DILocation(line: 34, column: 13, scope: !42)
!48 = !DILocation(line: 36, column: 28, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !3, line: 35, column: 13)
!50 = !DILocation(line: 36, column: 17, scope: !49)
!51 = !DILocation(line: 36, column: 31, scope: !49)
!52 = !DILocation(line: 37, column: 13, scope: !49)
!53 = !DILocation(line: 34, column: 35, scope: !45)
!54 = !DILocation(line: 34, column: 13, scope: !45)
!55 = distinct !{!55, !47, !56, !57}
!56 = !DILocation(line: 37, column: 13, scope: !42)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 39, column: 14, scope: !36)
!59 = !DILocation(line: 41, column: 23, scope: !2)
!60 = !DILocation(line: 41, column: 5, scope: !2)
!61 = !DILocation(line: 43, column: 10, scope: !2)
!62 = !DILocation(line: 43, column: 5, scope: !2)
!63 = !DILocation(line: 44, column: 1, scope: !2)
!64 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_18_good", scope: !3, file: !3, line: 79, type: !4, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!65 = !DILocation(line: 81, column: 5, scope: !64)
!66 = !DILocation(line: 82, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 51, type: !4, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!68 = !DILocalVariable(name: "data", scope: !67, file: !3, line: 53, type: !8)
!69 = !DILocation(line: 53, column: 15, scope: !67)
!70 = !DILocation(line: 54, column: 10, scope: !67)
!71 = !DILocation(line: 55, column: 5, scope: !67)
!72 = !DILabel(scope: !67, name: "source", file: !3, line: 56)
!73 = !DILocation(line: 56, column: 1, scope: !67)
!74 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !3, line: 59, type: !8)
!75 = distinct !DILexicalBlock(scope: !67, file: !3, line: 57, column: 5)
!76 = !DILocation(line: 59, column: 19, scope: !75)
!77 = !DILocation(line: 59, column: 43, scope: !75)
!78 = !DILocation(line: 59, column: 32, scope: !75)
!79 = !DILocation(line: 60, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !3, line: 60, column: 13)
!81 = !DILocation(line: 60, column: 24, scope: !80)
!82 = !DILocation(line: 60, column: 13, scope: !75)
!83 = !DILocation(line: 62, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !3, line: 61, column: 9)
!85 = !DILocation(line: 63, column: 13, scope: !84)
!86 = !DILocalVariable(name: "i", scope: !87, file: !3, line: 66, type: !37)
!87 = distinct !DILexicalBlock(scope: !75, file: !3, line: 65, column: 9)
!88 = !DILocation(line: 66, column: 20, scope: !87)
!89 = !DILocation(line: 67, column: 20, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !3, line: 67, column: 13)
!91 = !DILocation(line: 67, column: 18, scope: !90)
!92 = !DILocation(line: 67, column: 25, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !3, line: 67, column: 13)
!94 = !DILocation(line: 67, column: 27, scope: !93)
!95 = !DILocation(line: 67, column: 13, scope: !90)
!96 = !DILocation(line: 69, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !3, line: 68, column: 13)
!98 = !DILocation(line: 69, column: 28, scope: !97)
!99 = !DILocation(line: 69, column: 31, scope: !97)
!100 = !DILocation(line: 70, column: 13, scope: !97)
!101 = !DILocation(line: 67, column: 35, scope: !93)
!102 = !DILocation(line: 67, column: 13, scope: !93)
!103 = distinct !{!103, !95, !104, !57}
!104 = !DILocation(line: 70, column: 13, scope: !90)
!105 = !DILocation(line: 72, column: 16, scope: !75)
!106 = !DILocation(line: 72, column: 14, scope: !75)
!107 = !DILocation(line: 74, column: 23, scope: !67)
!108 = !DILocation(line: 74, column: 5, scope: !67)
!109 = !DILocation(line: 76, column: 10, scope: !67)
!110 = !DILocation(line: 76, column: 5, scope: !67)
!111 = !DILocation(line: 77, column: 1, scope: !67)
