; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68_badData = dso_local global i64* null, align 8, !dbg !16
@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68_goodG2BData = dso_local global i64* null, align 8, !dbg !18
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68_bad() #0 !dbg !2 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !32, metadata !DIExpression()), !dbg !33
  store i64* null, i64** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %0, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68_bad.dataBuffer, i64 0, i64 %1, !dbg !51
  store i64 5, i64* %arrayidx, align 8, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %2, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !59
  %3 = load i64*, i64** %data, align 8, !dbg !60
  store i64* %3, i64** @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68_badData, align 8, !dbg !61
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68b_badSink(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68b_badSink(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68_good() #0 !dbg !64 {
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
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !73
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !74
  %0 = bitcast i8* %call to i64*, !dbg !75
  store i64* %0, i64** %dataBuffer, align 8, !dbg !73
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !76
  %cmp = icmp eq i64* %1, null, !dbg !78
  br i1 %cmp, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @exit(i32 noundef 1) #6, !dbg !82
  unreachable, !dbg !82

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !83, metadata !DIExpression()), !dbg !85
  store i64 0, i64* %i, align 8, !dbg !86
  br label %for.cond, !dbg !88

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !89
  %cmp1 = icmp ult i64 %2, 100, !dbg !91
  br i1 %cmp1, label %for.body, label %for.end, !dbg !92

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !93
  %4 = load i64, i64* %i, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !93
  store i64 5, i64* %arrayidx, align 8, !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !98
  %inc = add i64 %5, 1, !dbg !98
  store i64 %inc, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !102
  store i64* %6, i64** %data, align 8, !dbg !103
  %7 = load i64*, i64** %data, align 8, !dbg !104
  store i64* %7, i64** @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68_goodG2BData, align 8, !dbg !105
  call void (...) @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68b_goodG2BSink(), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68b_goodG2BSink(...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29, !30}
!llvm.ident = !{!31}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 35, type: !21, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68_bad", scope: !3, file: !3, line: 29, type: !4, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !20)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "930128c5cb0404f58bd04bd84b94ade9")
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
!15 = !{!0, !16, !18}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68_badData", scope: !6, file: !3, line: 21, type: !8, isLocal: false, isDefinition: true)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68_goodG2BData", scope: !6, file: !3, line: 22, type: !8, isLocal: false, isDefinition: true)
!20 = !{}
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 6400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !{i32 7, !"Dwarf Version", i32 5}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{i32 1, !"wchar_size", i32 4}
!27 = !{i32 7, !"PIC Level", i32 2}
!28 = !{i32 7, !"PIE Level", i32 2}
!29 = !{i32 7, !"uwtable", i32 1}
!30 = !{i32 7, !"frame-pointer", i32 2}
!31 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!32 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 31, type: !8)
!33 = !DILocation(line: 31, column: 15, scope: !2)
!34 = !DILocation(line: 32, column: 10, scope: !2)
!35 = !DILocalVariable(name: "i", scope: !36, file: !3, line: 37, type: !38)
!36 = distinct !DILexicalBlock(scope: !37, file: !3, line: 36, column: 9)
!37 = distinct !DILexicalBlock(scope: !2, file: !3, line: 33, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 37, column: 20, scope: !36)
!42 = !DILocation(line: 38, column: 20, scope: !43)
!43 = distinct !DILexicalBlock(scope: !36, file: !3, line: 38, column: 13)
!44 = !DILocation(line: 38, column: 18, scope: !43)
!45 = !DILocation(line: 38, column: 25, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !3, line: 38, column: 13)
!47 = !DILocation(line: 38, column: 27, scope: !46)
!48 = !DILocation(line: 38, column: 13, scope: !43)
!49 = !DILocation(line: 40, column: 28, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !3, line: 39, column: 13)
!51 = !DILocation(line: 40, column: 17, scope: !50)
!52 = !DILocation(line: 40, column: 31, scope: !50)
!53 = !DILocation(line: 41, column: 13, scope: !50)
!54 = !DILocation(line: 38, column: 35, scope: !46)
!55 = !DILocation(line: 38, column: 13, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 41, column: 13, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 43, column: 14, scope: !37)
!60 = !DILocation(line: 45, column: 70, scope: !2)
!61 = !DILocation(line: 45, column: 68, scope: !2)
!62 = !DILocation(line: 46, column: 5, scope: !2)
!63 = !DILocation(line: 47, column: 1, scope: !2)
!64 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_68_good", scope: !3, file: !3, line: 82, type: !4, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !20)
!65 = !DILocation(line: 84, column: 5, scope: !64)
!66 = !DILocation(line: 85, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 57, type: !4, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !20)
!68 = !DILocalVariable(name: "data", scope: !67, file: !3, line: 59, type: !8)
!69 = !DILocation(line: 59, column: 15, scope: !67)
!70 = !DILocation(line: 60, column: 10, scope: !67)
!71 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !3, line: 63, type: !8)
!72 = distinct !DILexicalBlock(scope: !67, file: !3, line: 61, column: 5)
!73 = !DILocation(line: 63, column: 19, scope: !72)
!74 = !DILocation(line: 63, column: 43, scope: !72)
!75 = !DILocation(line: 63, column: 32, scope: !72)
!76 = !DILocation(line: 64, column: 13, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !3, line: 64, column: 13)
!78 = !DILocation(line: 64, column: 24, scope: !77)
!79 = !DILocation(line: 64, column: 13, scope: !72)
!80 = !DILocation(line: 66, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !3, line: 65, column: 9)
!82 = !DILocation(line: 67, column: 13, scope: !81)
!83 = !DILocalVariable(name: "i", scope: !84, file: !3, line: 70, type: !38)
!84 = distinct !DILexicalBlock(scope: !72, file: !3, line: 69, column: 9)
!85 = !DILocation(line: 70, column: 20, scope: !84)
!86 = !DILocation(line: 71, column: 20, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !3, line: 71, column: 13)
!88 = !DILocation(line: 71, column: 18, scope: !87)
!89 = !DILocation(line: 71, column: 25, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !3, line: 71, column: 13)
!91 = !DILocation(line: 71, column: 27, scope: !90)
!92 = !DILocation(line: 71, column: 13, scope: !87)
!93 = !DILocation(line: 73, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !3, line: 72, column: 13)
!95 = !DILocation(line: 73, column: 28, scope: !94)
!96 = !DILocation(line: 73, column: 31, scope: !94)
!97 = !DILocation(line: 74, column: 13, scope: !94)
!98 = !DILocation(line: 71, column: 35, scope: !90)
!99 = !DILocation(line: 71, column: 13, scope: !90)
!100 = distinct !{!100, !92, !101, !58}
!101 = !DILocation(line: 74, column: 13, scope: !87)
!102 = !DILocation(line: 76, column: 16, scope: !72)
!103 = !DILocation(line: 76, column: 14, scope: !72)
!104 = !DILocation(line: 78, column: 74, scope: !67)
!105 = !DILocation(line: 78, column: 72, scope: !67)
!106 = !DILocation(line: 79, column: 5, scope: !67)
!107 = !DILocation(line: 80, column: 1, scope: !67)
