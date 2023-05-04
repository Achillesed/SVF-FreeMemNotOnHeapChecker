; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_16.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_16_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  br label %while.body, !dbg !25

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %while.body
  %0 = load i64, i64* %i, align 8, !dbg !42
  %cmp = icmp ult i64 %0, 100, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %1, !dbg !48
  store i64 5, i64* %arrayidx, align 8, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %2, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !56
  store i64* %arraydecay, i64** %data, align 8, !dbg !57
  br label %while.end, !dbg !58

while.end:                                        ; preds = %for.end
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

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_16_good() #0 !dbg !64 {
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
  br label %while.body, !dbg !71

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !72, metadata !DIExpression()), !dbg !75
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !76
  %0 = bitcast i8* %call to i64*, !dbg !77
  store i64* %0, i64** %dataBuffer, align 8, !dbg !75
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !78
  %cmp = icmp eq i64* %1, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %while.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @exit(i32 noundef 1) #6, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %while.body
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
  br label %while.end, !dbg !106

while.end:                                        ; preds = %for.end
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_16.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "4b0e71537753da91c2c5a387e85d2185")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_16_bad", scope: !1, file: !1, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !18)
!24 = !DILocation(line: 26, column: 10, scope: !18)
!25 = !DILocation(line: 27, column: 5, scope: !18)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !1, line: 31, type: !29)
!27 = distinct !DILexicalBlock(scope: !28, file: !1, line: 29, column: 9)
!28 = distinct !DILexicalBlock(scope: !18, file: !1, line: 28, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 31, column: 21, scope: !27)
!33 = !DILocalVariable(name: "i", scope: !34, file: !1, line: 33, type: !35)
!34 = distinct !DILexicalBlock(scope: !27, file: !1, line: 32, column: 13)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!37 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 33, column: 24, scope: !34)
!39 = !DILocation(line: 34, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !1, line: 34, column: 17)
!41 = !DILocation(line: 34, column: 22, scope: !40)
!42 = !DILocation(line: 34, column: 29, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !1, line: 34, column: 17)
!44 = !DILocation(line: 34, column: 31, scope: !43)
!45 = !DILocation(line: 34, column: 17, scope: !40)
!46 = !DILocation(line: 36, column: 32, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !1, line: 35, column: 17)
!48 = !DILocation(line: 36, column: 21, scope: !47)
!49 = !DILocation(line: 36, column: 35, scope: !47)
!50 = !DILocation(line: 37, column: 17, scope: !47)
!51 = !DILocation(line: 34, column: 39, scope: !43)
!52 = !DILocation(line: 34, column: 17, scope: !43)
!53 = distinct !{!53, !45, !54, !55}
!54 = !DILocation(line: 37, column: 17, scope: !40)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 39, column: 20, scope: !27)
!57 = !DILocation(line: 39, column: 18, scope: !27)
!58 = !DILocation(line: 41, column: 9, scope: !28)
!59 = !DILocation(line: 43, column: 23, scope: !18)
!60 = !DILocation(line: 43, column: 5, scope: !18)
!61 = !DILocation(line: 45, column: 10, scope: !18)
!62 = !DILocation(line: 45, column: 5, scope: !18)
!63 = !DILocation(line: 46, column: 1, scope: !18)
!64 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_16_good", scope: !1, file: !1, line: 83, type: !19, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!65 = !DILocation(line: 85, column: 5, scope: !64)
!66 = !DILocation(line: 86, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!68 = !DILocalVariable(name: "data", scope: !67, file: !1, line: 55, type: !3)
!69 = !DILocation(line: 55, column: 15, scope: !67)
!70 = !DILocation(line: 56, column: 10, scope: !67)
!71 = !DILocation(line: 57, column: 5, scope: !67)
!72 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !1, line: 61, type: !3)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 59, column: 9)
!74 = distinct !DILexicalBlock(scope: !67, file: !1, line: 58, column: 5)
!75 = !DILocation(line: 61, column: 23, scope: !73)
!76 = !DILocation(line: 61, column: 47, scope: !73)
!77 = !DILocation(line: 61, column: 36, scope: !73)
!78 = !DILocation(line: 62, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !73, file: !1, line: 62, column: 17)
!80 = !DILocation(line: 62, column: 28, scope: !79)
!81 = !DILocation(line: 62, column: 17, scope: !73)
!82 = !DILocation(line: 64, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !1, line: 63, column: 13)
!84 = !DILocation(line: 65, column: 17, scope: !83)
!85 = !DILocalVariable(name: "i", scope: !86, file: !1, line: 68, type: !35)
!86 = distinct !DILexicalBlock(scope: !73, file: !1, line: 67, column: 13)
!87 = !DILocation(line: 68, column: 24, scope: !86)
!88 = !DILocation(line: 69, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !1, line: 69, column: 17)
!90 = !DILocation(line: 69, column: 22, scope: !89)
!91 = !DILocation(line: 69, column: 29, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !1, line: 69, column: 17)
!93 = !DILocation(line: 69, column: 31, scope: !92)
!94 = !DILocation(line: 69, column: 17, scope: !89)
!95 = !DILocation(line: 71, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !1, line: 70, column: 17)
!97 = !DILocation(line: 71, column: 32, scope: !96)
!98 = !DILocation(line: 71, column: 35, scope: !96)
!99 = !DILocation(line: 72, column: 17, scope: !96)
!100 = !DILocation(line: 69, column: 39, scope: !92)
!101 = !DILocation(line: 69, column: 17, scope: !92)
!102 = distinct !{!102, !94, !103, !55}
!103 = !DILocation(line: 72, column: 17, scope: !89)
!104 = !DILocation(line: 74, column: 20, scope: !73)
!105 = !DILocation(line: 74, column: 18, scope: !73)
!106 = !DILocation(line: 76, column: 9, scope: !74)
!107 = !DILocation(line: 78, column: 23, scope: !67)
!108 = !DILocation(line: 78, column: 5, scope: !67)
!109 = !DILocation(line: 80, column: 10, scope: !67)
!110 = !DILocation(line: 80, column: 5, scope: !67)
!111 = !DILocation(line: 81, column: 1, scope: !67)
