; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_09.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@GLOBAL_CONST_TRUE = external constant i32, align 4
@GLOBAL_CONST_FALSE = external constant i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_09_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !25
  %tobool = icmp ne i32 %0, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !31
  %1 = alloca i8, i64 800, align 16, !dbg !32
  %2 = bitcast i8* %1 to i64*, !dbg !33
  store i64* %2, i64** %dataBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i64, i64* %i, align 8, !dbg !43
  %cmp = icmp ult i64 %3, 100, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !47
  %5 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !47
  store i64 5, i64* %arrayidx, align 8, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %6, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !57
  store i64* %7, i64** %data, align 8, !dbg !58
  br label %if.end, !dbg !59

if.end:                                           ; preds = %for.end, %entry
  %8 = load i64*, i64** %data, align 8, !dbg !60
  %arrayidx1 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !60
  %9 = load i64, i64* %arrayidx1, align 8, !dbg !60
  call void @printLongLongLine(i64 noundef %9), !dbg !61
  %10 = load i64*, i64** %data, align 8, !dbg !62
  %11 = bitcast i64* %10 to i8*, !dbg !62
  call void @free(i8* noundef %11) #5, !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_09_good() #0 !dbg !65 {
entry:
  call void @goodG2B1(), !dbg !66
  call void @goodG2B2(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i64* null, i64** %data, align 8, !dbg !72
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !73
  %tobool = icmp ne i32 %0, 0, !dbg !73
  br i1 %tobool, label %if.then, label %if.else, !dbg !75

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !76
  br label %if.end3, !dbg !78

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !82
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !83
  %1 = bitcast i8* %call to i64*, !dbg !84
  store i64* %1, i64** %dataBuffer, align 8, !dbg !82
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !85
  %cmp = icmp eq i64* %2, null, !dbg !87
  br i1 %cmp, label %if.then1, label %if.end, !dbg !88

if.then1:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @exit(i32 noundef 1) #6, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !92, metadata !DIExpression()), !dbg !94
  store i64 0, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !97

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !98
  %cmp2 = icmp ult i64 %3, 100, !dbg !100
  br i1 %cmp2, label %for.body, label %for.end, !dbg !101

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !102
  %5 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !102
  store i64 5, i64* %arrayidx, align 8, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !107
  %inc = add i64 %6, 1, !dbg !107
  store i64 %inc, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !111
  store i64* %7, i64** %data, align 8, !dbg !112
  br label %if.end3

if.end3:                                          ; preds = %for.end, %if.then
  %8 = load i64*, i64** %data, align 8, !dbg !113
  %arrayidx4 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !113
  %9 = load i64, i64* %arrayidx4, align 8, !dbg !113
  call void @printLongLongLine(i64 noundef %9), !dbg !114
  %10 = load i64*, i64** %data, align 8, !dbg !115
  %11 = bitcast i64* %10 to i8*, !dbg !115
  call void @free(i8* noundef %11) #5, !dbg !116
  ret void, !dbg !117
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !118 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !119, metadata !DIExpression()), !dbg !120
  store i64* null, i64** %data, align 8, !dbg !121
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !122
  %tobool = icmp ne i32 %0, 0, !dbg !122
  br i1 %tobool, label %if.then, label %if.end3, !dbg !124

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !125, metadata !DIExpression()), !dbg !128
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !129
  %1 = bitcast i8* %call to i64*, !dbg !130
  store i64* %1, i64** %dataBuffer, align 8, !dbg !128
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !131
  %cmp = icmp eq i64* %2, null, !dbg !133
  br i1 %cmp, label %if.then1, label %if.end, !dbg !134

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !135
  call void @exit(i32 noundef 1) #6, !dbg !137
  unreachable, !dbg !137

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !138, metadata !DIExpression()), !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !144
  %cmp2 = icmp ult i64 %3, 100, !dbg !146
  br i1 %cmp2, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !148
  %5 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !148
  store i64 5, i64* %arrayidx, align 8, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %6, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !157
  store i64* %7, i64** %data, align 8, !dbg !158
  br label %if.end3, !dbg !159

if.end3:                                          ; preds = %for.end, %entry
  %8 = load i64*, i64** %data, align 8, !dbg !160
  %arrayidx4 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !160
  %9 = load i64, i64* %arrayidx4, align 8, !dbg !160
  call void @printLongLongLine(i64 noundef %9), !dbg !161
  %10 = load i64*, i64** %data, align 8, !dbg !162
  %11 = bitcast i64* %10 to i8*, !dbg !162
  call void @free(i8* noundef %11) #5, !dbg !163
  ret void, !dbg !164
}

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_09.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "025cb423efcd2d9a651724ce4bdaba54")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_09_bad", scope: !1, file: !1, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !18)
!24 = !DILocation(line: 26, column: 10, scope: !18)
!25 = !DILocation(line: 27, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !1, line: 27, column: 8)
!27 = !DILocation(line: 27, column: 8, scope: !18)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !1, line: 31, type: !3)
!29 = distinct !DILexicalBlock(scope: !30, file: !1, line: 29, column: 9)
!30 = distinct !DILexicalBlock(scope: !26, file: !1, line: 28, column: 5)
!31 = !DILocation(line: 31, column: 23, scope: !29)
!32 = !DILocation(line: 31, column: 47, scope: !29)
!33 = !DILocation(line: 31, column: 36, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !35, file: !1, line: 33, type: !36)
!35 = distinct !DILexicalBlock(scope: !29, file: !1, line: 32, column: 13)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!38 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 33, column: 24, scope: !35)
!40 = !DILocation(line: 34, column: 24, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !1, line: 34, column: 17)
!42 = !DILocation(line: 34, column: 22, scope: !41)
!43 = !DILocation(line: 34, column: 29, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !1, line: 34, column: 17)
!45 = !DILocation(line: 34, column: 31, scope: !44)
!46 = !DILocation(line: 34, column: 17, scope: !41)
!47 = !DILocation(line: 36, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !1, line: 35, column: 17)
!49 = !DILocation(line: 36, column: 32, scope: !48)
!50 = !DILocation(line: 36, column: 35, scope: !48)
!51 = !DILocation(line: 37, column: 17, scope: !48)
!52 = !DILocation(line: 34, column: 39, scope: !44)
!53 = !DILocation(line: 34, column: 17, scope: !44)
!54 = distinct !{!54, !46, !55, !56}
!55 = !DILocation(line: 37, column: 17, scope: !41)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 39, column: 20, scope: !29)
!58 = !DILocation(line: 39, column: 18, scope: !29)
!59 = !DILocation(line: 41, column: 5, scope: !30)
!60 = !DILocation(line: 42, column: 23, scope: !18)
!61 = !DILocation(line: 42, column: 5, scope: !18)
!62 = !DILocation(line: 44, column: 10, scope: !18)
!63 = !DILocation(line: 44, column: 5, scope: !18)
!64 = !DILocation(line: 45, column: 1, scope: !18)
!65 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_09_good", scope: !1, file: !1, line: 116, type: !19, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!66 = !DILocation(line: 118, column: 5, scope: !65)
!67 = !DILocation(line: 119, column: 5, scope: !65)
!68 = !DILocation(line: 120, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 52, type: !19, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!70 = !DILocalVariable(name: "data", scope: !69, file: !1, line: 54, type: !3)
!71 = !DILocation(line: 54, column: 15, scope: !69)
!72 = !DILocation(line: 55, column: 10, scope: !69)
!73 = !DILocation(line: 56, column: 8, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !1, line: 56, column: 8)
!75 = !DILocation(line: 56, column: 8, scope: !69)
!76 = !DILocation(line: 59, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !1, line: 57, column: 5)
!78 = !DILocation(line: 60, column: 5, scope: !77)
!79 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !1, line: 65, type: !3)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 63, column: 9)
!81 = distinct !DILexicalBlock(scope: !74, file: !1, line: 62, column: 5)
!82 = !DILocation(line: 65, column: 23, scope: !80)
!83 = !DILocation(line: 65, column: 47, scope: !80)
!84 = !DILocation(line: 65, column: 36, scope: !80)
!85 = !DILocation(line: 66, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !80, file: !1, line: 66, column: 17)
!87 = !DILocation(line: 66, column: 28, scope: !86)
!88 = !DILocation(line: 66, column: 17, scope: !80)
!89 = !DILocation(line: 68, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !1, line: 67, column: 13)
!91 = !DILocation(line: 69, column: 17, scope: !90)
!92 = !DILocalVariable(name: "i", scope: !93, file: !1, line: 72, type: !36)
!93 = distinct !DILexicalBlock(scope: !80, file: !1, line: 71, column: 13)
!94 = !DILocation(line: 72, column: 24, scope: !93)
!95 = !DILocation(line: 73, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !1, line: 73, column: 17)
!97 = !DILocation(line: 73, column: 22, scope: !96)
!98 = !DILocation(line: 73, column: 29, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !1, line: 73, column: 17)
!100 = !DILocation(line: 73, column: 31, scope: !99)
!101 = !DILocation(line: 73, column: 17, scope: !96)
!102 = !DILocation(line: 75, column: 21, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !1, line: 74, column: 17)
!104 = !DILocation(line: 75, column: 32, scope: !103)
!105 = !DILocation(line: 75, column: 35, scope: !103)
!106 = !DILocation(line: 76, column: 17, scope: !103)
!107 = !DILocation(line: 73, column: 39, scope: !99)
!108 = !DILocation(line: 73, column: 17, scope: !99)
!109 = distinct !{!109, !101, !110, !56}
!110 = !DILocation(line: 76, column: 17, scope: !96)
!111 = !DILocation(line: 78, column: 20, scope: !80)
!112 = !DILocation(line: 78, column: 18, scope: !80)
!113 = !DILocation(line: 81, column: 23, scope: !69)
!114 = !DILocation(line: 81, column: 5, scope: !69)
!115 = !DILocation(line: 83, column: 10, scope: !69)
!116 = !DILocation(line: 83, column: 5, scope: !69)
!117 = !DILocation(line: 84, column: 1, scope: !69)
!118 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 87, type: !19, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!119 = !DILocalVariable(name: "data", scope: !118, file: !1, line: 89, type: !3)
!120 = !DILocation(line: 89, column: 15, scope: !118)
!121 = !DILocation(line: 90, column: 10, scope: !118)
!122 = !DILocation(line: 91, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !1, line: 91, column: 8)
!124 = !DILocation(line: 91, column: 8, scope: !118)
!125 = !DILocalVariable(name: "dataBuffer", scope: !126, file: !1, line: 95, type: !3)
!126 = distinct !DILexicalBlock(scope: !127, file: !1, line: 93, column: 9)
!127 = distinct !DILexicalBlock(scope: !123, file: !1, line: 92, column: 5)
!128 = !DILocation(line: 95, column: 23, scope: !126)
!129 = !DILocation(line: 95, column: 47, scope: !126)
!130 = !DILocation(line: 95, column: 36, scope: !126)
!131 = !DILocation(line: 96, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !126, file: !1, line: 96, column: 17)
!133 = !DILocation(line: 96, column: 28, scope: !132)
!134 = !DILocation(line: 96, column: 17, scope: !126)
!135 = !DILocation(line: 98, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !1, line: 97, column: 13)
!137 = !DILocation(line: 99, column: 17, scope: !136)
!138 = !DILocalVariable(name: "i", scope: !139, file: !1, line: 102, type: !36)
!139 = distinct !DILexicalBlock(scope: !126, file: !1, line: 101, column: 13)
!140 = !DILocation(line: 102, column: 24, scope: !139)
!141 = !DILocation(line: 103, column: 24, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !1, line: 103, column: 17)
!143 = !DILocation(line: 103, column: 22, scope: !142)
!144 = !DILocation(line: 103, column: 29, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !1, line: 103, column: 17)
!146 = !DILocation(line: 103, column: 31, scope: !145)
!147 = !DILocation(line: 103, column: 17, scope: !142)
!148 = !DILocation(line: 105, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !1, line: 104, column: 17)
!150 = !DILocation(line: 105, column: 32, scope: !149)
!151 = !DILocation(line: 105, column: 35, scope: !149)
!152 = !DILocation(line: 106, column: 17, scope: !149)
!153 = !DILocation(line: 103, column: 39, scope: !145)
!154 = !DILocation(line: 103, column: 17, scope: !145)
!155 = distinct !{!155, !147, !156, !56}
!156 = !DILocation(line: 106, column: 17, scope: !142)
!157 = !DILocation(line: 108, column: 20, scope: !126)
!158 = !DILocation(line: 108, column: 18, scope: !126)
!159 = !DILocation(line: 110, column: 5, scope: !127)
!160 = !DILocation(line: 111, column: 23, scope: !118)
!161 = !DILocation(line: 111, column: 5, scope: !118)
!162 = !DILocation(line: 113, column: 10, scope: !118)
!163 = !DILocation(line: 113, column: 5, scope: !118)
!164 = !DILocation(line: 114, column: 1, scope: !118)
