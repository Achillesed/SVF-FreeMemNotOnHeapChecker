; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !24, metadata !DIExpression()), !dbg !28
  store void (i64*)* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65b_badSink, void (i64*)** %funcPtr, align 8, !dbg !28
  store i64* null, i64** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %0, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %1, !dbg !51
  store i64 5, i64* %arrayidx, align 8, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %2, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !59
  store i64* %arraydecay, i64** %data, align 8, !dbg !60
  %3 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !61
  %4 = load i64*, i64** %data, align 8, !dbg !62
  call void %3(i64* noundef %4), !dbg !61
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65b_badSink(i64* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !67 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !70, metadata !DIExpression()), !dbg !71
  store void (i64*)* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65b_goodG2BSink, void (i64*)** %funcPtr, align 8, !dbg !71
  store i64* null, i64** %data, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !73, metadata !DIExpression()), !dbg !75
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !76
  %0 = bitcast i8* %call to i64*, !dbg !77
  store i64* %0, i64** %dataBuffer, align 8, !dbg !75
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !78
  %cmp = icmp eq i64* %1, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @exit(i32 noundef 1) #6, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
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
  %7 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !106
  %8 = load i64*, i64** %data, align 8, !dbg !107
  call void %7(i64* noundef %8), !dbg !106
  ret void, !dbg !108
}

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65b_goodG2BSink(i64* noundef) #2

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "208b0e770d31031c42defcd64d3665ac")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65_bad", scope: !1, file: !1, line: 26, type: !19, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 28, type: !3)
!23 = !DILocation(line: 28, column: 15, scope: !18)
!24 = !DILocalVariable(name: "funcPtr", scope: !18, file: !1, line: 30, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !3}
!28 = !DILocation(line: 30, column: 12, scope: !18)
!29 = !DILocation(line: 31, column: 10, scope: !18)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !1, line: 34, type: !32)
!31 = distinct !DILexicalBlock(scope: !18, file: !1, line: 32, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 34, column: 17, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !37, file: !1, line: 36, type: !38)
!37 = distinct !DILexicalBlock(scope: !31, file: !1, line: 35, column: 9)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 36, column: 20, scope: !37)
!42 = !DILocation(line: 37, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !1, line: 37, column: 13)
!44 = !DILocation(line: 37, column: 18, scope: !43)
!45 = !DILocation(line: 37, column: 25, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !1, line: 37, column: 13)
!47 = !DILocation(line: 37, column: 27, scope: !46)
!48 = !DILocation(line: 37, column: 13, scope: !43)
!49 = !DILocation(line: 39, column: 28, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 38, column: 13)
!51 = !DILocation(line: 39, column: 17, scope: !50)
!52 = !DILocation(line: 39, column: 31, scope: !50)
!53 = !DILocation(line: 40, column: 13, scope: !50)
!54 = !DILocation(line: 37, column: 35, scope: !46)
!55 = !DILocation(line: 37, column: 13, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 40, column: 13, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 42, column: 16, scope: !31)
!60 = !DILocation(line: 42, column: 14, scope: !31)
!61 = !DILocation(line: 45, column: 5, scope: !18)
!62 = !DILocation(line: 45, column: 13, scope: !18)
!63 = !DILocation(line: 46, column: 1, scope: !18)
!64 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_65_good", scope: !1, file: !1, line: 80, type: !19, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!65 = !DILocation(line: 82, column: 5, scope: !64)
!66 = !DILocation(line: 83, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 55, type: !19, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!68 = !DILocalVariable(name: "data", scope: !67, file: !1, line: 57, type: !3)
!69 = !DILocation(line: 57, column: 15, scope: !67)
!70 = !DILocalVariable(name: "funcPtr", scope: !67, file: !1, line: 58, type: !25)
!71 = !DILocation(line: 58, column: 12, scope: !67)
!72 = !DILocation(line: 59, column: 10, scope: !67)
!73 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !1, line: 62, type: !3)
!74 = distinct !DILexicalBlock(scope: !67, file: !1, line: 60, column: 5)
!75 = !DILocation(line: 62, column: 19, scope: !74)
!76 = !DILocation(line: 62, column: 43, scope: !74)
!77 = !DILocation(line: 62, column: 32, scope: !74)
!78 = !DILocation(line: 63, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !1, line: 63, column: 13)
!80 = !DILocation(line: 63, column: 24, scope: !79)
!81 = !DILocation(line: 63, column: 13, scope: !74)
!82 = !DILocation(line: 65, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !1, line: 64, column: 9)
!84 = !DILocation(line: 66, column: 13, scope: !83)
!85 = !DILocalVariable(name: "i", scope: !86, file: !1, line: 69, type: !38)
!86 = distinct !DILexicalBlock(scope: !74, file: !1, line: 68, column: 9)
!87 = !DILocation(line: 69, column: 20, scope: !86)
!88 = !DILocation(line: 70, column: 20, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !1, line: 70, column: 13)
!90 = !DILocation(line: 70, column: 18, scope: !89)
!91 = !DILocation(line: 70, column: 25, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !1, line: 70, column: 13)
!93 = !DILocation(line: 70, column: 27, scope: !92)
!94 = !DILocation(line: 70, column: 13, scope: !89)
!95 = !DILocation(line: 72, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !1, line: 71, column: 13)
!97 = !DILocation(line: 72, column: 28, scope: !96)
!98 = !DILocation(line: 72, column: 31, scope: !96)
!99 = !DILocation(line: 73, column: 13, scope: !96)
!100 = !DILocation(line: 70, column: 35, scope: !92)
!101 = !DILocation(line: 70, column: 13, scope: !92)
!102 = distinct !{!102, !94, !103, !58}
!103 = !DILocation(line: 73, column: 13, scope: !89)
!104 = !DILocation(line: 75, column: 16, scope: !74)
!105 = !DILocation(line: 75, column: 14, scope: !74)
!106 = !DILocation(line: 77, column: 5, scope: !67)
!107 = !DILocation(line: 77, column: 13, scope: !67)
!108 = !DILocation(line: 78, column: 1, scope: !67)
