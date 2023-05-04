; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_08.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_08_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %call = call i32 @staticReturnsTrue(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !31
  %0 = alloca i8, i64 800, align 16, !dbg !32
  %1 = bitcast i8* %0 to i64*, !dbg !33
  store i64* %1, i64** %dataBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i64, i64* %i, align 8, !dbg !43
  %cmp = icmp ult i64 %2, 100, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !47
  %4 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !47
  store i64 5, i64* %arrayidx, align 8, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %5, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !57
  store i64* %6, i64** %data, align 8, !dbg !58
  br label %if.end, !dbg !59

if.end:                                           ; preds = %for.end, %entry
  %7 = load i64*, i64** %data, align 8, !dbg !60
  %arrayidx1 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !60
  %8 = load i64, i64* %arrayidx1, align 8, !dbg !60
  call void @printLongLongLine(i64 noundef %8), !dbg !61
  %9 = load i64*, i64** %data, align 8, !dbg !62
  %10 = bitcast i64* %9 to i8*, !dbg !62
  call void @free(i8* noundef %10) #5, !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_08_good() #0 !dbg !65 {
entry:
  call void @goodG2B1(), !dbg !66
  call void @goodG2B2(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !69 {
entry:
  ret i32 1, !dbg !73
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !75, metadata !DIExpression()), !dbg !76
  store i64* null, i64** %data, align 8, !dbg !77
  %call = call i32 @staticReturnsFalse(), !dbg !78
  %tobool = icmp ne i32 %call, 0, !dbg !78
  br i1 %tobool, label %if.then, label %if.else, !dbg !80

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !81
  br label %if.end4, !dbg !83

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !84, metadata !DIExpression()), !dbg !87
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !88
  %0 = bitcast i8* %call1 to i64*, !dbg !89
  store i64* %0, i64** %dataBuffer, align 8, !dbg !87
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !90
  %cmp = icmp eq i64* %1, null, !dbg !92
  br i1 %cmp, label %if.then2, label %if.end, !dbg !93

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @exit(i32 noundef 1) #6, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !97, metadata !DIExpression()), !dbg !99
  store i64 0, i64* %i, align 8, !dbg !100
  br label %for.cond, !dbg !102

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !103
  %cmp3 = icmp ult i64 %2, 100, !dbg !105
  br i1 %cmp3, label %for.body, label %for.end, !dbg !106

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !107
  %4 = load i64, i64* %i, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !107
  store i64 5, i64* %arrayidx, align 8, !dbg !110
  br label %for.inc, !dbg !111

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !112
  %inc = add i64 %5, 1, !dbg !112
  store i64 %inc, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !113, !llvm.loop !114

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !116
  store i64* %6, i64** %data, align 8, !dbg !117
  br label %if.end4

if.end4:                                          ; preds = %for.end, %if.then
  %7 = load i64*, i64** %data, align 8, !dbg !118
  %arrayidx5 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !118
  %8 = load i64, i64* %arrayidx5, align 8, !dbg !118
  call void @printLongLongLine(i64 noundef %8), !dbg !119
  %9 = load i64*, i64** %data, align 8, !dbg !120
  %10 = bitcast i64* %9 to i8*, !dbg !120
  call void @free(i8* noundef %10) #5, !dbg !121
  ret void, !dbg !122
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !123 {
entry:
  ret i32 0, !dbg !124
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !125 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !126, metadata !DIExpression()), !dbg !127
  store i64* null, i64** %data, align 8, !dbg !128
  %call = call i32 @staticReturnsTrue(), !dbg !129
  %tobool = icmp ne i32 %call, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.end4, !dbg !131

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !132, metadata !DIExpression()), !dbg !135
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !136
  %0 = bitcast i8* %call1 to i64*, !dbg !137
  store i64* %0, i64** %dataBuffer, align 8, !dbg !135
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !138
  %cmp = icmp eq i64* %1, null, !dbg !140
  br i1 %cmp, label %if.then2, label %if.end, !dbg !141

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !142
  call void @exit(i32 noundef 1) #6, !dbg !144
  unreachable, !dbg !144

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !151
  %cmp3 = icmp ult i64 %2, 100, !dbg !153
  br i1 %cmp3, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !155
  %4 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !155
  store i64 5, i64* %arrayidx, align 8, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !160
  %inc = add i64 %5, 1, !dbg !160
  store i64 %inc, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !164
  store i64* %6, i64** %data, align 8, !dbg !165
  br label %if.end4, !dbg !166

if.end4:                                          ; preds = %for.end, %entry
  %7 = load i64*, i64** %data, align 8, !dbg !167
  %arrayidx5 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !167
  %8 = load i64, i64* %arrayidx5, align 8, !dbg !167
  call void @printLongLongLine(i64 noundef %8), !dbg !168
  %9 = load i64*, i64** %data, align 8, !dbg !169
  %10 = bitcast i64* %9 to i8*, !dbg !169
  call void @free(i8* noundef %10) #5, !dbg !170
  ret void, !dbg !171
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_08.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "8751344f6eb2d9cc75e15634c2496de9")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_08_bad", scope: !1, file: !1, line: 37, type: !19, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 39, type: !3)
!23 = !DILocation(line: 39, column: 15, scope: !18)
!24 = !DILocation(line: 40, column: 10, scope: !18)
!25 = !DILocation(line: 41, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !1, line: 41, column: 8)
!27 = !DILocation(line: 41, column: 8, scope: !18)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !1, line: 45, type: !3)
!29 = distinct !DILexicalBlock(scope: !30, file: !1, line: 43, column: 9)
!30 = distinct !DILexicalBlock(scope: !26, file: !1, line: 42, column: 5)
!31 = !DILocation(line: 45, column: 23, scope: !29)
!32 = !DILocation(line: 45, column: 47, scope: !29)
!33 = !DILocation(line: 45, column: 36, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !35, file: !1, line: 47, type: !36)
!35 = distinct !DILexicalBlock(scope: !29, file: !1, line: 46, column: 13)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!38 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 47, column: 24, scope: !35)
!40 = !DILocation(line: 48, column: 24, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !1, line: 48, column: 17)
!42 = !DILocation(line: 48, column: 22, scope: !41)
!43 = !DILocation(line: 48, column: 29, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !1, line: 48, column: 17)
!45 = !DILocation(line: 48, column: 31, scope: !44)
!46 = !DILocation(line: 48, column: 17, scope: !41)
!47 = !DILocation(line: 50, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !1, line: 49, column: 17)
!49 = !DILocation(line: 50, column: 32, scope: !48)
!50 = !DILocation(line: 50, column: 35, scope: !48)
!51 = !DILocation(line: 51, column: 17, scope: !48)
!52 = !DILocation(line: 48, column: 39, scope: !44)
!53 = !DILocation(line: 48, column: 17, scope: !44)
!54 = distinct !{!54, !46, !55, !56}
!55 = !DILocation(line: 51, column: 17, scope: !41)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 53, column: 20, scope: !29)
!58 = !DILocation(line: 53, column: 18, scope: !29)
!59 = !DILocation(line: 55, column: 5, scope: !30)
!60 = !DILocation(line: 56, column: 23, scope: !18)
!61 = !DILocation(line: 56, column: 5, scope: !18)
!62 = !DILocation(line: 58, column: 10, scope: !18)
!63 = !DILocation(line: 58, column: 5, scope: !18)
!64 = !DILocation(line: 59, column: 1, scope: !18)
!65 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_08_good", scope: !1, file: !1, line: 130, type: !19, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!66 = !DILocation(line: 132, column: 5, scope: !65)
!67 = !DILocation(line: 133, column: 5, scope: !65)
!68 = !DILocation(line: 134, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !1, file: !1, line: 25, type: !70, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!70 = !DISubroutineType(types: !71)
!71 = !{!72}
!72 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!73 = !DILocation(line: 27, column: 5, scope: !69)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 66, type: !19, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!75 = !DILocalVariable(name: "data", scope: !74, file: !1, line: 68, type: !3)
!76 = !DILocation(line: 68, column: 15, scope: !74)
!77 = !DILocation(line: 69, column: 10, scope: !74)
!78 = !DILocation(line: 70, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !1, line: 70, column: 8)
!80 = !DILocation(line: 70, column: 8, scope: !74)
!81 = !DILocation(line: 73, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !1, line: 71, column: 5)
!83 = !DILocation(line: 74, column: 5, scope: !82)
!84 = !DILocalVariable(name: "dataBuffer", scope: !85, file: !1, line: 79, type: !3)
!85 = distinct !DILexicalBlock(scope: !86, file: !1, line: 77, column: 9)
!86 = distinct !DILexicalBlock(scope: !79, file: !1, line: 76, column: 5)
!87 = !DILocation(line: 79, column: 23, scope: !85)
!88 = !DILocation(line: 79, column: 47, scope: !85)
!89 = !DILocation(line: 79, column: 36, scope: !85)
!90 = !DILocation(line: 80, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !1, line: 80, column: 17)
!92 = !DILocation(line: 80, column: 28, scope: !91)
!93 = !DILocation(line: 80, column: 17, scope: !85)
!94 = !DILocation(line: 82, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !1, line: 81, column: 13)
!96 = !DILocation(line: 83, column: 17, scope: !95)
!97 = !DILocalVariable(name: "i", scope: !98, file: !1, line: 86, type: !36)
!98 = distinct !DILexicalBlock(scope: !85, file: !1, line: 85, column: 13)
!99 = !DILocation(line: 86, column: 24, scope: !98)
!100 = !DILocation(line: 87, column: 24, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !1, line: 87, column: 17)
!102 = !DILocation(line: 87, column: 22, scope: !101)
!103 = !DILocation(line: 87, column: 29, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !1, line: 87, column: 17)
!105 = !DILocation(line: 87, column: 31, scope: !104)
!106 = !DILocation(line: 87, column: 17, scope: !101)
!107 = !DILocation(line: 89, column: 21, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !1, line: 88, column: 17)
!109 = !DILocation(line: 89, column: 32, scope: !108)
!110 = !DILocation(line: 89, column: 35, scope: !108)
!111 = !DILocation(line: 90, column: 17, scope: !108)
!112 = !DILocation(line: 87, column: 39, scope: !104)
!113 = !DILocation(line: 87, column: 17, scope: !104)
!114 = distinct !{!114, !106, !115, !56}
!115 = !DILocation(line: 90, column: 17, scope: !101)
!116 = !DILocation(line: 92, column: 20, scope: !85)
!117 = !DILocation(line: 92, column: 18, scope: !85)
!118 = !DILocation(line: 95, column: 23, scope: !74)
!119 = !DILocation(line: 95, column: 5, scope: !74)
!120 = !DILocation(line: 97, column: 10, scope: !74)
!121 = !DILocation(line: 97, column: 5, scope: !74)
!122 = !DILocation(line: 98, column: 1, scope: !74)
!123 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !1, file: !1, line: 30, type: !70, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!124 = !DILocation(line: 32, column: 5, scope: !123)
!125 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 101, type: !19, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!126 = !DILocalVariable(name: "data", scope: !125, file: !1, line: 103, type: !3)
!127 = !DILocation(line: 103, column: 15, scope: !125)
!128 = !DILocation(line: 104, column: 10, scope: !125)
!129 = !DILocation(line: 105, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !1, line: 105, column: 8)
!131 = !DILocation(line: 105, column: 8, scope: !125)
!132 = !DILocalVariable(name: "dataBuffer", scope: !133, file: !1, line: 109, type: !3)
!133 = distinct !DILexicalBlock(scope: !134, file: !1, line: 107, column: 9)
!134 = distinct !DILexicalBlock(scope: !130, file: !1, line: 106, column: 5)
!135 = !DILocation(line: 109, column: 23, scope: !133)
!136 = !DILocation(line: 109, column: 47, scope: !133)
!137 = !DILocation(line: 109, column: 36, scope: !133)
!138 = !DILocation(line: 110, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !1, line: 110, column: 17)
!140 = !DILocation(line: 110, column: 28, scope: !139)
!141 = !DILocation(line: 110, column: 17, scope: !133)
!142 = !DILocation(line: 112, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !1, line: 111, column: 13)
!144 = !DILocation(line: 113, column: 17, scope: !143)
!145 = !DILocalVariable(name: "i", scope: !146, file: !1, line: 116, type: !36)
!146 = distinct !DILexicalBlock(scope: !133, file: !1, line: 115, column: 13)
!147 = !DILocation(line: 116, column: 24, scope: !146)
!148 = !DILocation(line: 117, column: 24, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !1, line: 117, column: 17)
!150 = !DILocation(line: 117, column: 22, scope: !149)
!151 = !DILocation(line: 117, column: 29, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !1, line: 117, column: 17)
!153 = !DILocation(line: 117, column: 31, scope: !152)
!154 = !DILocation(line: 117, column: 17, scope: !149)
!155 = !DILocation(line: 119, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !1, line: 118, column: 17)
!157 = !DILocation(line: 119, column: 32, scope: !156)
!158 = !DILocation(line: 119, column: 35, scope: !156)
!159 = !DILocation(line: 120, column: 17, scope: !156)
!160 = !DILocation(line: 117, column: 39, scope: !152)
!161 = !DILocation(line: 117, column: 17, scope: !152)
!162 = distinct !{!162, !154, !163, !56}
!163 = !DILocation(line: 120, column: 17, scope: !149)
!164 = !DILocation(line: 122, column: 20, scope: !133)
!165 = !DILocation(line: 122, column: 18, scope: !133)
!166 = !DILocation(line: 124, column: 5, scope: !134)
!167 = !DILocation(line: 125, column: 23, scope: !125)
!168 = !DILocation(line: 125, column: 5, scope: !125)
!169 = !DILocation(line: 127, column: 10, scope: !125)
!170 = !DILocation(line: 127, column: 5, scope: !125)
!171 = !DILocation(line: 128, column: 1, scope: !125)
