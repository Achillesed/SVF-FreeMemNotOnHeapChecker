; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_18.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_18_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  br label %source, !dbg !25

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !26), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %source
  %0 = load i64, i64* %i, align 8, !dbg !43
  %cmp = icmp ult i64 %0, 100, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %1, !dbg !49
  store i64 5, i64* %arrayidx, align 8, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %2, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !57
  store i64* %arraydecay, i64** %data, align 8, !dbg !58
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_18_good() #0 !dbg !64 {
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_18.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "41173b45c1212609f4633a16357577c9")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_18_bad", scope: !1, file: !1, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !18)
!24 = !DILocation(line: 26, column: 10, scope: !18)
!25 = !DILocation(line: 27, column: 5, scope: !18)
!26 = !DILabel(scope: !18, name: "source", file: !1, line: 28)
!27 = !DILocation(line: 28, column: 1, scope: !18)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !1, line: 31, type: !30)
!29 = distinct !DILexicalBlock(scope: !18, file: !1, line: 29, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 31, column: 17, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !35, file: !1, line: 33, type: !36)
!35 = distinct !DILexicalBlock(scope: !29, file: !1, line: 32, column: 9)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!38 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 33, column: 20, scope: !35)
!40 = !DILocation(line: 34, column: 20, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !1, line: 34, column: 13)
!42 = !DILocation(line: 34, column: 18, scope: !41)
!43 = !DILocation(line: 34, column: 25, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !1, line: 34, column: 13)
!45 = !DILocation(line: 34, column: 27, scope: !44)
!46 = !DILocation(line: 34, column: 13, scope: !41)
!47 = !DILocation(line: 36, column: 28, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !1, line: 35, column: 13)
!49 = !DILocation(line: 36, column: 17, scope: !48)
!50 = !DILocation(line: 36, column: 31, scope: !48)
!51 = !DILocation(line: 37, column: 13, scope: !48)
!52 = !DILocation(line: 34, column: 35, scope: !44)
!53 = !DILocation(line: 34, column: 13, scope: !44)
!54 = distinct !{!54, !46, !55, !56}
!55 = !DILocation(line: 37, column: 13, scope: !41)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 39, column: 16, scope: !29)
!58 = !DILocation(line: 39, column: 14, scope: !29)
!59 = !DILocation(line: 41, column: 23, scope: !18)
!60 = !DILocation(line: 41, column: 5, scope: !18)
!61 = !DILocation(line: 43, column: 10, scope: !18)
!62 = !DILocation(line: 43, column: 5, scope: !18)
!63 = !DILocation(line: 44, column: 1, scope: !18)
!64 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_18_good", scope: !1, file: !1, line: 79, type: !19, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!65 = !DILocation(line: 81, column: 5, scope: !64)
!66 = !DILocation(line: 82, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 51, type: !19, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!68 = !DILocalVariable(name: "data", scope: !67, file: !1, line: 53, type: !3)
!69 = !DILocation(line: 53, column: 15, scope: !67)
!70 = !DILocation(line: 54, column: 10, scope: !67)
!71 = !DILocation(line: 55, column: 5, scope: !67)
!72 = !DILabel(scope: !67, name: "source", file: !1, line: 56)
!73 = !DILocation(line: 56, column: 1, scope: !67)
!74 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !1, line: 59, type: !3)
!75 = distinct !DILexicalBlock(scope: !67, file: !1, line: 57, column: 5)
!76 = !DILocation(line: 59, column: 19, scope: !75)
!77 = !DILocation(line: 59, column: 43, scope: !75)
!78 = !DILocation(line: 59, column: 32, scope: !75)
!79 = !DILocation(line: 60, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !1, line: 60, column: 13)
!81 = !DILocation(line: 60, column: 24, scope: !80)
!82 = !DILocation(line: 60, column: 13, scope: !75)
!83 = !DILocation(line: 62, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !1, line: 61, column: 9)
!85 = !DILocation(line: 63, column: 13, scope: !84)
!86 = !DILocalVariable(name: "i", scope: !87, file: !1, line: 66, type: !36)
!87 = distinct !DILexicalBlock(scope: !75, file: !1, line: 65, column: 9)
!88 = !DILocation(line: 66, column: 20, scope: !87)
!89 = !DILocation(line: 67, column: 20, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !1, line: 67, column: 13)
!91 = !DILocation(line: 67, column: 18, scope: !90)
!92 = !DILocation(line: 67, column: 25, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !1, line: 67, column: 13)
!94 = !DILocation(line: 67, column: 27, scope: !93)
!95 = !DILocation(line: 67, column: 13, scope: !90)
!96 = !DILocation(line: 69, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !1, line: 68, column: 13)
!98 = !DILocation(line: 69, column: 28, scope: !97)
!99 = !DILocation(line: 69, column: 31, scope: !97)
!100 = !DILocation(line: 70, column: 13, scope: !97)
!101 = !DILocation(line: 67, column: 35, scope: !93)
!102 = !DILocation(line: 67, column: 13, scope: !93)
!103 = distinct !{!103, !95, !104, !56}
!104 = !DILocation(line: 70, column: 13, scope: !90)
!105 = !DILocation(line: 72, column: 16, scope: !75)
!106 = !DILocation(line: 72, column: 14, scope: !75)
!107 = !DILocation(line: 74, column: 23, scope: !67)
!108 = !DILocation(line: 74, column: 5, scope: !67)
!109 = !DILocation(line: 76, column: 10, scope: !67)
!110 = !DILocation(line: 76, column: 5, scope: !67)
!111 = !DILocation(line: 77, column: 1, scope: !67)
