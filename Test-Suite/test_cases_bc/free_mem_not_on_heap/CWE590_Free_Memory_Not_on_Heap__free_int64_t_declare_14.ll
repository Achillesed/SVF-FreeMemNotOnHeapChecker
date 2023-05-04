; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_14.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_14_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %0 = load i32, i32* @globalFive, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !29, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i64, i64* %i, align 8, !dbg !45
  %cmp1 = icmp ult i64 %1, 100, !dbg !47
  br i1 %cmp1, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %2, !dbg !51
  store i64 5, i64* %arrayidx, align 8, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %3, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !59
  store i64* %arraydecay, i64** %data, align 8, !dbg !60
  br label %if.end, !dbg !61

if.end:                                           ; preds = %for.end, %entry
  %4 = load i64*, i64** %data, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds i64, i64* %4, i64 0, !dbg !62
  %5 = load i64, i64* %arrayidx2, align 8, !dbg !62
  call void @printLongLongLine(i64 noundef %5), !dbg !63
  %6 = load i64*, i64** %data, align 8, !dbg !64
  %7 = bitcast i64* %6 to i8*, !dbg !64
  call void @free(i8* noundef %7) #5, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_14_good() #0 !dbg !67 {
entry:
  call void @goodG2B1(), !dbg !68
  call void @goodG2B2(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !72, metadata !DIExpression()), !dbg !73
  store i64* null, i64** %data, align 8, !dbg !74
  %0 = load i32, i32* @globalFive, align 4, !dbg !75
  %cmp = icmp ne i32 %0, 5, !dbg !77
  br i1 %cmp, label %if.then, label %if.else, !dbg !78

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !79
  br label %if.end4, !dbg !81

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !85
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !86
  %1 = bitcast i8* %call to i64*, !dbg !87
  store i64* %1, i64** %dataBuffer, align 8, !dbg !85
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !88
  %cmp1 = icmp eq i64* %2, null, !dbg !90
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !91

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @exit(i32 noundef 1) #6, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !95, metadata !DIExpression()), !dbg !97
  store i64 0, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !101
  %cmp3 = icmp ult i64 %3, 100, !dbg !103
  br i1 %cmp3, label %for.body, label %for.end, !dbg !104

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !105
  %5 = load i64, i64* %i, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !105
  store i64 5, i64* %arrayidx, align 8, !dbg !108
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !110
  %inc = add i64 %6, 1, !dbg !110
  store i64 %inc, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !111, !llvm.loop !112

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !114
  store i64* %7, i64** %data, align 8, !dbg !115
  br label %if.end4

if.end4:                                          ; preds = %for.end, %if.then
  %8 = load i64*, i64** %data, align 8, !dbg !116
  %arrayidx5 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !116
  %9 = load i64, i64* %arrayidx5, align 8, !dbg !116
  call void @printLongLongLine(i64 noundef %9), !dbg !117
  %10 = load i64*, i64** %data, align 8, !dbg !118
  %11 = bitcast i64* %10 to i8*, !dbg !118
  call void @free(i8* noundef %11) #5, !dbg !119
  ret void, !dbg !120
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !121 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !122, metadata !DIExpression()), !dbg !123
  store i64* null, i64** %data, align 8, !dbg !124
  %0 = load i32, i32* @globalFive, align 4, !dbg !125
  %cmp = icmp eq i32 %0, 5, !dbg !127
  br i1 %cmp, label %if.then, label %if.end4, !dbg !128

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !129, metadata !DIExpression()), !dbg !132
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !133
  %1 = bitcast i8* %call to i64*, !dbg !134
  store i64* %1, i64** %dataBuffer, align 8, !dbg !132
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !135
  %cmp1 = icmp eq i64* %2, null, !dbg !137
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !138

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !139
  call void @exit(i32 noundef 1) #6, !dbg !141
  unreachable, !dbg !141

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !142, metadata !DIExpression()), !dbg !144
  store i64 0, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !148
  %cmp3 = icmp ult i64 %3, 100, !dbg !150
  br i1 %cmp3, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !152
  %5 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !152
  store i64 5, i64* %arrayidx, align 8, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !157
  %inc = add i64 %6, 1, !dbg !157
  store i64 %inc, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !161
  store i64* %7, i64** %data, align 8, !dbg !162
  br label %if.end4, !dbg !163

if.end4:                                          ; preds = %for.end, %entry
  %8 = load i64*, i64** %data, align 8, !dbg !164
  %arrayidx5 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !164
  %9 = load i64, i64* %arrayidx5, align 8, !dbg !164
  call void @printLongLongLine(i64 noundef %9), !dbg !165
  %10 = load i64*, i64** %data, align 8, !dbg !166
  %11 = bitcast i64* %10 to i8*, !dbg !166
  call void @free(i8* noundef %11) #5, !dbg !167
  ret void, !dbg !168
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_14.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "db7e1c7fc38799cf754bffb5e6affe4b")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_14_bad", scope: !1, file: !1, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !18)
!24 = !DILocation(line: 26, column: 10, scope: !18)
!25 = !DILocation(line: 27, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !1, line: 27, column: 8)
!27 = !DILocation(line: 27, column: 18, scope: !26)
!28 = !DILocation(line: 27, column: 8, scope: !18)
!29 = !DILocalVariable(name: "dataBuffer", scope: !30, file: !1, line: 31, type: !32)
!30 = distinct !DILexicalBlock(scope: !31, file: !1, line: 29, column: 9)
!31 = distinct !DILexicalBlock(scope: !26, file: !1, line: 28, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 31, column: 21, scope: !30)
!36 = !DILocalVariable(name: "i", scope: !37, file: !1, line: 33, type: !38)
!37 = distinct !DILexicalBlock(scope: !30, file: !1, line: 32, column: 13)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 33, column: 24, scope: !37)
!42 = !DILocation(line: 34, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !1, line: 34, column: 17)
!44 = !DILocation(line: 34, column: 22, scope: !43)
!45 = !DILocation(line: 34, column: 29, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !1, line: 34, column: 17)
!47 = !DILocation(line: 34, column: 31, scope: !46)
!48 = !DILocation(line: 34, column: 17, scope: !43)
!49 = !DILocation(line: 36, column: 32, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 35, column: 17)
!51 = !DILocation(line: 36, column: 21, scope: !50)
!52 = !DILocation(line: 36, column: 35, scope: !50)
!53 = !DILocation(line: 37, column: 17, scope: !50)
!54 = !DILocation(line: 34, column: 39, scope: !46)
!55 = !DILocation(line: 34, column: 17, scope: !46)
!56 = distinct !{!56, !48, !57, !58}
!57 = !DILocation(line: 37, column: 17, scope: !43)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 39, column: 20, scope: !30)
!60 = !DILocation(line: 39, column: 18, scope: !30)
!61 = !DILocation(line: 41, column: 5, scope: !31)
!62 = !DILocation(line: 42, column: 23, scope: !18)
!63 = !DILocation(line: 42, column: 5, scope: !18)
!64 = !DILocation(line: 44, column: 10, scope: !18)
!65 = !DILocation(line: 44, column: 5, scope: !18)
!66 = !DILocation(line: 45, column: 1, scope: !18)
!67 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_14_good", scope: !1, file: !1, line: 116, type: !19, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!68 = !DILocation(line: 118, column: 5, scope: !67)
!69 = !DILocation(line: 119, column: 5, scope: !67)
!70 = !DILocation(line: 120, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 52, type: !19, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!72 = !DILocalVariable(name: "data", scope: !71, file: !1, line: 54, type: !3)
!73 = !DILocation(line: 54, column: 15, scope: !71)
!74 = !DILocation(line: 55, column: 10, scope: !71)
!75 = !DILocation(line: 56, column: 8, scope: !76)
!76 = distinct !DILexicalBlock(scope: !71, file: !1, line: 56, column: 8)
!77 = !DILocation(line: 56, column: 18, scope: !76)
!78 = !DILocation(line: 56, column: 8, scope: !71)
!79 = !DILocation(line: 59, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !1, line: 57, column: 5)
!81 = !DILocation(line: 60, column: 5, scope: !80)
!82 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !1, line: 65, type: !3)
!83 = distinct !DILexicalBlock(scope: !84, file: !1, line: 63, column: 9)
!84 = distinct !DILexicalBlock(scope: !76, file: !1, line: 62, column: 5)
!85 = !DILocation(line: 65, column: 23, scope: !83)
!86 = !DILocation(line: 65, column: 47, scope: !83)
!87 = !DILocation(line: 65, column: 36, scope: !83)
!88 = !DILocation(line: 66, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !1, line: 66, column: 17)
!90 = !DILocation(line: 66, column: 28, scope: !89)
!91 = !DILocation(line: 66, column: 17, scope: !83)
!92 = !DILocation(line: 68, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !1, line: 67, column: 13)
!94 = !DILocation(line: 69, column: 17, scope: !93)
!95 = !DILocalVariable(name: "i", scope: !96, file: !1, line: 72, type: !38)
!96 = distinct !DILexicalBlock(scope: !83, file: !1, line: 71, column: 13)
!97 = !DILocation(line: 72, column: 24, scope: !96)
!98 = !DILocation(line: 73, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !1, line: 73, column: 17)
!100 = !DILocation(line: 73, column: 22, scope: !99)
!101 = !DILocation(line: 73, column: 29, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !1, line: 73, column: 17)
!103 = !DILocation(line: 73, column: 31, scope: !102)
!104 = !DILocation(line: 73, column: 17, scope: !99)
!105 = !DILocation(line: 75, column: 21, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !1, line: 74, column: 17)
!107 = !DILocation(line: 75, column: 32, scope: !106)
!108 = !DILocation(line: 75, column: 35, scope: !106)
!109 = !DILocation(line: 76, column: 17, scope: !106)
!110 = !DILocation(line: 73, column: 39, scope: !102)
!111 = !DILocation(line: 73, column: 17, scope: !102)
!112 = distinct !{!112, !104, !113, !58}
!113 = !DILocation(line: 76, column: 17, scope: !99)
!114 = !DILocation(line: 78, column: 20, scope: !83)
!115 = !DILocation(line: 78, column: 18, scope: !83)
!116 = !DILocation(line: 81, column: 23, scope: !71)
!117 = !DILocation(line: 81, column: 5, scope: !71)
!118 = !DILocation(line: 83, column: 10, scope: !71)
!119 = !DILocation(line: 83, column: 5, scope: !71)
!120 = !DILocation(line: 84, column: 1, scope: !71)
!121 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 87, type: !19, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!122 = !DILocalVariable(name: "data", scope: !121, file: !1, line: 89, type: !3)
!123 = !DILocation(line: 89, column: 15, scope: !121)
!124 = !DILocation(line: 90, column: 10, scope: !121)
!125 = !DILocation(line: 91, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !121, file: !1, line: 91, column: 8)
!127 = !DILocation(line: 91, column: 18, scope: !126)
!128 = !DILocation(line: 91, column: 8, scope: !121)
!129 = !DILocalVariable(name: "dataBuffer", scope: !130, file: !1, line: 95, type: !3)
!130 = distinct !DILexicalBlock(scope: !131, file: !1, line: 93, column: 9)
!131 = distinct !DILexicalBlock(scope: !126, file: !1, line: 92, column: 5)
!132 = !DILocation(line: 95, column: 23, scope: !130)
!133 = !DILocation(line: 95, column: 47, scope: !130)
!134 = !DILocation(line: 95, column: 36, scope: !130)
!135 = !DILocation(line: 96, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !1, line: 96, column: 17)
!137 = !DILocation(line: 96, column: 28, scope: !136)
!138 = !DILocation(line: 96, column: 17, scope: !130)
!139 = !DILocation(line: 98, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !1, line: 97, column: 13)
!141 = !DILocation(line: 99, column: 17, scope: !140)
!142 = !DILocalVariable(name: "i", scope: !143, file: !1, line: 102, type: !38)
!143 = distinct !DILexicalBlock(scope: !130, file: !1, line: 101, column: 13)
!144 = !DILocation(line: 102, column: 24, scope: !143)
!145 = !DILocation(line: 103, column: 24, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !1, line: 103, column: 17)
!147 = !DILocation(line: 103, column: 22, scope: !146)
!148 = !DILocation(line: 103, column: 29, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !1, line: 103, column: 17)
!150 = !DILocation(line: 103, column: 31, scope: !149)
!151 = !DILocation(line: 103, column: 17, scope: !146)
!152 = !DILocation(line: 105, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !1, line: 104, column: 17)
!154 = !DILocation(line: 105, column: 32, scope: !153)
!155 = !DILocation(line: 105, column: 35, scope: !153)
!156 = !DILocation(line: 106, column: 17, scope: !153)
!157 = !DILocation(line: 103, column: 39, scope: !149)
!158 = !DILocation(line: 103, column: 17, scope: !149)
!159 = distinct !{!159, !151, !160, !58}
!160 = !DILocation(line: 106, column: 17, scope: !146)
!161 = !DILocation(line: 108, column: 20, scope: !130)
!162 = !DILocation(line: 108, column: 18, scope: !130)
!163 = !DILocation(line: 110, column: 5, scope: !131)
!164 = !DILocation(line: 111, column: 23, scope: !121)
!165 = !DILocation(line: 111, column: 5, scope: !121)
!166 = !DILocation(line: 113, column: 10, scope: !121)
!167 = !DILocation(line: 113, column: 5, scope: !121)
!168 = !DILocation(line: 114, column: 1, scope: !121)
