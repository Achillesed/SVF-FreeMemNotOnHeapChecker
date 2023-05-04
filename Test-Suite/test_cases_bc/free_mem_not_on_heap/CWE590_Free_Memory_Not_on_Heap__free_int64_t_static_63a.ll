; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_63a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_63_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_63_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i64* null, i64** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %0, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_63_bad.dataBuffer, i64 0, i64 %1, !dbg !47
  store i64 5, i64* %arrayidx, align 8, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %2, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_63_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !55
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_63b_badSink(i64** noundef %data), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_63b_badSink(i64** noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_63_good() #0 !dbg !58 {
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
  call void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_63b_goodG2BSink(i64** noundef %data), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_63b_goodG2BSink(i64** noundef) #2

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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 32, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_63_bad", scope: !3, file: !3, line: 26, type: !4, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_63a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "135676de752374efd31408cf02ef315b")
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
!28 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 28, type: !8)
!29 = !DILocation(line: 28, column: 15, scope: !2)
!30 = !DILocation(line: 29, column: 10, scope: !2)
!31 = !DILocalVariable(name: "i", scope: !32, file: !3, line: 34, type: !34)
!32 = distinct !DILexicalBlock(scope: !33, file: !3, line: 33, column: 9)
!33 = distinct !DILexicalBlock(scope: !2, file: !3, line: 30, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 34, column: 20, scope: !32)
!38 = !DILocation(line: 35, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !3, line: 35, column: 13)
!40 = !DILocation(line: 35, column: 18, scope: !39)
!41 = !DILocation(line: 35, column: 25, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !3, line: 35, column: 13)
!43 = !DILocation(line: 35, column: 27, scope: !42)
!44 = !DILocation(line: 35, column: 13, scope: !39)
!45 = !DILocation(line: 37, column: 28, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !3, line: 36, column: 13)
!47 = !DILocation(line: 37, column: 17, scope: !46)
!48 = !DILocation(line: 37, column: 31, scope: !46)
!49 = !DILocation(line: 38, column: 13, scope: !46)
!50 = !DILocation(line: 35, column: 35, scope: !42)
!51 = !DILocation(line: 35, column: 13, scope: !42)
!52 = distinct !{!52, !44, !53, !54}
!53 = !DILocation(line: 38, column: 13, scope: !39)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 40, column: 14, scope: !33)
!56 = !DILocation(line: 42, column: 5, scope: !2)
!57 = !DILocation(line: 43, column: 1, scope: !2)
!58 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_63_good", scope: !3, file: !3, line: 76, type: !4, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !16)
!59 = !DILocation(line: 78, column: 5, scope: !58)
!60 = !DILocation(line: 79, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 52, type: !4, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !16)
!62 = !DILocalVariable(name: "data", scope: !61, file: !3, line: 54, type: !8)
!63 = !DILocation(line: 54, column: 15, scope: !61)
!64 = !DILocation(line: 55, column: 10, scope: !61)
!65 = !DILocalVariable(name: "dataBuffer", scope: !66, file: !3, line: 58, type: !8)
!66 = distinct !DILexicalBlock(scope: !61, file: !3, line: 56, column: 5)
!67 = !DILocation(line: 58, column: 19, scope: !66)
!68 = !DILocation(line: 58, column: 43, scope: !66)
!69 = !DILocation(line: 58, column: 32, scope: !66)
!70 = !DILocation(line: 59, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !3, line: 59, column: 13)
!72 = !DILocation(line: 59, column: 24, scope: !71)
!73 = !DILocation(line: 59, column: 13, scope: !66)
!74 = !DILocation(line: 61, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !3, line: 60, column: 9)
!76 = !DILocation(line: 62, column: 13, scope: !75)
!77 = !DILocalVariable(name: "i", scope: !78, file: !3, line: 65, type: !34)
!78 = distinct !DILexicalBlock(scope: !66, file: !3, line: 64, column: 9)
!79 = !DILocation(line: 65, column: 20, scope: !78)
!80 = !DILocation(line: 66, column: 20, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !3, line: 66, column: 13)
!82 = !DILocation(line: 66, column: 18, scope: !81)
!83 = !DILocation(line: 66, column: 25, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !3, line: 66, column: 13)
!85 = !DILocation(line: 66, column: 27, scope: !84)
!86 = !DILocation(line: 66, column: 13, scope: !81)
!87 = !DILocation(line: 68, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !3, line: 67, column: 13)
!89 = !DILocation(line: 68, column: 28, scope: !88)
!90 = !DILocation(line: 68, column: 31, scope: !88)
!91 = !DILocation(line: 69, column: 13, scope: !88)
!92 = !DILocation(line: 66, column: 35, scope: !84)
!93 = !DILocation(line: 66, column: 13, scope: !84)
!94 = distinct !{!94, !86, !95, !54}
!95 = !DILocation(line: 69, column: 13, scope: !81)
!96 = !DILocation(line: 71, column: 16, scope: !66)
!97 = !DILocation(line: 71, column: 14, scope: !66)
!98 = !DILocation(line: 73, column: 5, scope: !61)
!99 = !DILocation(line: 74, column: 1, scope: !61)
