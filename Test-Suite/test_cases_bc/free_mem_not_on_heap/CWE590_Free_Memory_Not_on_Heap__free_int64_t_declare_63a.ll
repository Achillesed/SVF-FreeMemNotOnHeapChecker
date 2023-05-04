; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_63a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_63_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !40
  %cmp = icmp ult i64 %0, 100, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %1, !dbg !46
  store i64 5, i64* %arrayidx, align 8, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !49
  %inc = add i64 %2, 1, !dbg !49
  store i64 %inc, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !54
  store i64* %arraydecay, i64** %data, align 8, !dbg !55
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_63b_badSink(i64** noundef %data), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_63b_badSink(i64** noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_63_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !61 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !62, metadata !DIExpression()), !dbg !63
  store i64* null, i64** %data, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !65, metadata !DIExpression()), !dbg !67
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !68
  %0 = bitcast i8* %call to i64*, !dbg !69
  store i64* %0, i64** %dataBuffer, align 8, !dbg !67
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !70
  %cmp = icmp eq i64* %1, null, !dbg !72
  br i1 %cmp, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @exit(i32 noundef 1) #6, !dbg !76
  unreachable, !dbg !76

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !77, metadata !DIExpression()), !dbg !79
  store i64 0, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !83
  %cmp1 = icmp ult i64 %2, 100, !dbg !85
  br i1 %cmp1, label %for.body, label %for.end, !dbg !86

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !87
  %4 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !87
  store i64 5, i64* %arrayidx, align 8, !dbg !90
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !92
  %inc = add i64 %5, 1, !dbg !92
  store i64 %inc, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !93, !llvm.loop !94

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !96
  store i64* %6, i64** %data, align 8, !dbg !97
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_63b_goodG2BSink(i64** noundef %data), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_63b_goodG2BSink(i64** noundef) #2

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_63a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "396f4af4abb58356ac59c9e2c0807ada")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_63_bad", scope: !1, file: !1, line: 26, type: !19, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 28, type: !3)
!23 = !DILocation(line: 28, column: 15, scope: !18)
!24 = !DILocation(line: 29, column: 10, scope: !18)
!25 = !DILocalVariable(name: "dataBuffer", scope: !26, file: !1, line: 32, type: !27)
!26 = distinct !DILexicalBlock(scope: !18, file: !1, line: 30, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 32, column: 17, scope: !26)
!31 = !DILocalVariable(name: "i", scope: !32, file: !1, line: 34, type: !33)
!32 = distinct !DILexicalBlock(scope: !26, file: !1, line: 33, column: 9)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!35 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 34, column: 20, scope: !32)
!37 = !DILocation(line: 35, column: 20, scope: !38)
!38 = distinct !DILexicalBlock(scope: !32, file: !1, line: 35, column: 13)
!39 = !DILocation(line: 35, column: 18, scope: !38)
!40 = !DILocation(line: 35, column: 25, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !1, line: 35, column: 13)
!42 = !DILocation(line: 35, column: 27, scope: !41)
!43 = !DILocation(line: 35, column: 13, scope: !38)
!44 = !DILocation(line: 37, column: 28, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !1, line: 36, column: 13)
!46 = !DILocation(line: 37, column: 17, scope: !45)
!47 = !DILocation(line: 37, column: 31, scope: !45)
!48 = !DILocation(line: 38, column: 13, scope: !45)
!49 = !DILocation(line: 35, column: 35, scope: !41)
!50 = !DILocation(line: 35, column: 13, scope: !41)
!51 = distinct !{!51, !43, !52, !53}
!52 = !DILocation(line: 38, column: 13, scope: !38)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 40, column: 16, scope: !26)
!55 = !DILocation(line: 40, column: 14, scope: !26)
!56 = !DILocation(line: 42, column: 5, scope: !18)
!57 = !DILocation(line: 43, column: 1, scope: !18)
!58 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_63_good", scope: !1, file: !1, line: 76, type: !19, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!59 = !DILocation(line: 78, column: 5, scope: !58)
!60 = !DILocation(line: 79, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 52, type: !19, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!62 = !DILocalVariable(name: "data", scope: !61, file: !1, line: 54, type: !3)
!63 = !DILocation(line: 54, column: 15, scope: !61)
!64 = !DILocation(line: 55, column: 10, scope: !61)
!65 = !DILocalVariable(name: "dataBuffer", scope: !66, file: !1, line: 58, type: !3)
!66 = distinct !DILexicalBlock(scope: !61, file: !1, line: 56, column: 5)
!67 = !DILocation(line: 58, column: 19, scope: !66)
!68 = !DILocation(line: 58, column: 43, scope: !66)
!69 = !DILocation(line: 58, column: 32, scope: !66)
!70 = !DILocation(line: 59, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !1, line: 59, column: 13)
!72 = !DILocation(line: 59, column: 24, scope: !71)
!73 = !DILocation(line: 59, column: 13, scope: !66)
!74 = !DILocation(line: 61, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !1, line: 60, column: 9)
!76 = !DILocation(line: 62, column: 13, scope: !75)
!77 = !DILocalVariable(name: "i", scope: !78, file: !1, line: 65, type: !33)
!78 = distinct !DILexicalBlock(scope: !66, file: !1, line: 64, column: 9)
!79 = !DILocation(line: 65, column: 20, scope: !78)
!80 = !DILocation(line: 66, column: 20, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !1, line: 66, column: 13)
!82 = !DILocation(line: 66, column: 18, scope: !81)
!83 = !DILocation(line: 66, column: 25, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !1, line: 66, column: 13)
!85 = !DILocation(line: 66, column: 27, scope: !84)
!86 = !DILocation(line: 66, column: 13, scope: !81)
!87 = !DILocation(line: 68, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !1, line: 67, column: 13)
!89 = !DILocation(line: 68, column: 28, scope: !88)
!90 = !DILocation(line: 68, column: 31, scope: !88)
!91 = !DILocation(line: 69, column: 13, scope: !88)
!92 = !DILocation(line: 66, column: 35, scope: !84)
!93 = !DILocation(line: 66, column: 13, scope: !84)
!94 = distinct !{!94, !86, !95, !53}
!95 = !DILocation(line: 69, column: 13, scope: !81)
!96 = !DILocation(line: 71, column: 16, scope: !66)
!97 = !DILocation(line: 71, column: 14, scope: !66)
!98 = !DILocation(line: 73, column: 5, scope: !61)
!99 = !DILocation(line: 74, column: 1, scope: !61)
