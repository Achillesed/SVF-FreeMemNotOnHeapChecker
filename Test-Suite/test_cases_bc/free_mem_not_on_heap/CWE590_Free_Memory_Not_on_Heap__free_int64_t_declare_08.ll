; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_08.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_08_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %call = call i32 @staticReturnsTrue(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i64, i64* %i, align 8, !dbg !44
  %cmp = icmp ult i64 %0, 100, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %1, !dbg !50
  store i64 5, i64* %arrayidx, align 8, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %2, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !58
  store i64* %arraydecay, i64** %data, align 8, !dbg !59
  br label %if.end, !dbg !60

if.end:                                           ; preds = %for.end, %entry
  %3 = load i64*, i64** %data, align 8, !dbg !61
  %arrayidx1 = getelementptr inbounds i64, i64* %3, i64 0, !dbg !61
  %4 = load i64, i64* %arrayidx1, align 8, !dbg !61
  call void @printLongLongLine(i64 noundef %4), !dbg !62
  %5 = load i64*, i64** %data, align 8, !dbg !63
  %6 = bitcast i64* %5 to i8*, !dbg !63
  call void @free(i8* noundef %6) #5, !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_08_good() #0 !dbg !66 {
entry:
  call void @goodG2B1(), !dbg !67
  call void @goodG2B2(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !70 {
entry:
  ret i32 1, !dbg !74
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i64* null, i64** %data, align 8, !dbg !78
  %call = call i32 @staticReturnsFalse(), !dbg !79
  %tobool = icmp ne i32 %call, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !82
  br label %if.end4, !dbg !84

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !88
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !89
  %0 = bitcast i8* %call1 to i64*, !dbg !90
  store i64* %0, i64** %dataBuffer, align 8, !dbg !88
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !91
  %cmp = icmp eq i64* %1, null, !dbg !93
  br i1 %cmp, label %if.then2, label %if.end, !dbg !94

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @exit(i32 noundef 1) #6, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !98, metadata !DIExpression()), !dbg !100
  store i64 0, i64* %i, align 8, !dbg !101
  br label %for.cond, !dbg !103

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !104
  %cmp3 = icmp ult i64 %2, 100, !dbg !106
  br i1 %cmp3, label %for.body, label %for.end, !dbg !107

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !108
  %4 = load i64, i64* %i, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !108
  store i64 5, i64* %arrayidx, align 8, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !113
  %inc = add i64 %5, 1, !dbg !113
  store i64 %inc, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !117
  store i64* %6, i64** %data, align 8, !dbg !118
  br label %if.end4

if.end4:                                          ; preds = %for.end, %if.then
  %7 = load i64*, i64** %data, align 8, !dbg !119
  %arrayidx5 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !119
  %8 = load i64, i64* %arrayidx5, align 8, !dbg !119
  call void @printLongLongLine(i64 noundef %8), !dbg !120
  %9 = load i64*, i64** %data, align 8, !dbg !121
  %10 = bitcast i64* %9 to i8*, !dbg !121
  call void @free(i8* noundef %10) #5, !dbg !122
  ret void, !dbg !123
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !124 {
entry:
  ret i32 0, !dbg !125
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !126 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !127, metadata !DIExpression()), !dbg !128
  store i64* null, i64** %data, align 8, !dbg !129
  %call = call i32 @staticReturnsTrue(), !dbg !130
  %tobool = icmp ne i32 %call, 0, !dbg !130
  br i1 %tobool, label %if.then, label %if.end4, !dbg !132

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !133, metadata !DIExpression()), !dbg !136
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !137
  %0 = bitcast i8* %call1 to i64*, !dbg !138
  store i64* %0, i64** %dataBuffer, align 8, !dbg !136
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !139
  %cmp = icmp eq i64* %1, null, !dbg !141
  br i1 %cmp, label %if.then2, label %if.end, !dbg !142

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !143
  call void @exit(i32 noundef 1) #6, !dbg !145
  unreachable, !dbg !145

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !146, metadata !DIExpression()), !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !152
  %cmp3 = icmp ult i64 %2, 100, !dbg !154
  br i1 %cmp3, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !156
  %4 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !156
  store i64 5, i64* %arrayidx, align 8, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %5, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !165
  store i64* %6, i64** %data, align 8, !dbg !166
  br label %if.end4, !dbg !167

if.end4:                                          ; preds = %for.end, %entry
  %7 = load i64*, i64** %data, align 8, !dbg !168
  %arrayidx5 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !168
  %8 = load i64, i64* %arrayidx5, align 8, !dbg !168
  call void @printLongLongLine(i64 noundef %8), !dbg !169
  %9 = load i64*, i64** %data, align 8, !dbg !170
  %10 = bitcast i64* %9 to i8*, !dbg !170
  call void @free(i8* noundef %10) #5, !dbg !171
  ret void, !dbg !172
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_08.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "778390b96bac0086c1566527de0d2700")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_08_bad", scope: !1, file: !1, line: 37, type: !19, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 39, type: !3)
!23 = !DILocation(line: 39, column: 15, scope: !18)
!24 = !DILocation(line: 40, column: 10, scope: !18)
!25 = !DILocation(line: 41, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !18, file: !1, line: 41, column: 8)
!27 = !DILocation(line: 41, column: 8, scope: !18)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !1, line: 45, type: !31)
!29 = distinct !DILexicalBlock(scope: !30, file: !1, line: 43, column: 9)
!30 = distinct !DILexicalBlock(scope: !26, file: !1, line: 42, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 45, column: 21, scope: !29)
!35 = !DILocalVariable(name: "i", scope: !36, file: !1, line: 47, type: !37)
!36 = distinct !DILexicalBlock(scope: !29, file: !1, line: 46, column: 13)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!39 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 47, column: 24, scope: !36)
!41 = !DILocation(line: 48, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !1, line: 48, column: 17)
!43 = !DILocation(line: 48, column: 22, scope: !42)
!44 = !DILocation(line: 48, column: 29, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !1, line: 48, column: 17)
!46 = !DILocation(line: 48, column: 31, scope: !45)
!47 = !DILocation(line: 48, column: 17, scope: !42)
!48 = !DILocation(line: 50, column: 32, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !1, line: 49, column: 17)
!50 = !DILocation(line: 50, column: 21, scope: !49)
!51 = !DILocation(line: 50, column: 35, scope: !49)
!52 = !DILocation(line: 51, column: 17, scope: !49)
!53 = !DILocation(line: 48, column: 39, scope: !45)
!54 = !DILocation(line: 48, column: 17, scope: !45)
!55 = distinct !{!55, !47, !56, !57}
!56 = !DILocation(line: 51, column: 17, scope: !42)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 53, column: 20, scope: !29)
!59 = !DILocation(line: 53, column: 18, scope: !29)
!60 = !DILocation(line: 55, column: 5, scope: !30)
!61 = !DILocation(line: 56, column: 23, scope: !18)
!62 = !DILocation(line: 56, column: 5, scope: !18)
!63 = !DILocation(line: 58, column: 10, scope: !18)
!64 = !DILocation(line: 58, column: 5, scope: !18)
!65 = !DILocation(line: 59, column: 1, scope: !18)
!66 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_08_good", scope: !1, file: !1, line: 130, type: !19, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!67 = !DILocation(line: 132, column: 5, scope: !66)
!68 = !DILocation(line: 133, column: 5, scope: !66)
!69 = !DILocation(line: 134, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !1, file: !1, line: 25, type: !71, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!71 = !DISubroutineType(types: !72)
!72 = !{!73}
!73 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!74 = !DILocation(line: 27, column: 5, scope: !70)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 66, type: !19, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!76 = !DILocalVariable(name: "data", scope: !75, file: !1, line: 68, type: !3)
!77 = !DILocation(line: 68, column: 15, scope: !75)
!78 = !DILocation(line: 69, column: 10, scope: !75)
!79 = !DILocation(line: 70, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !1, line: 70, column: 8)
!81 = !DILocation(line: 70, column: 8, scope: !75)
!82 = !DILocation(line: 73, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !1, line: 71, column: 5)
!84 = !DILocation(line: 74, column: 5, scope: !83)
!85 = !DILocalVariable(name: "dataBuffer", scope: !86, file: !1, line: 79, type: !3)
!86 = distinct !DILexicalBlock(scope: !87, file: !1, line: 77, column: 9)
!87 = distinct !DILexicalBlock(scope: !80, file: !1, line: 76, column: 5)
!88 = !DILocation(line: 79, column: 23, scope: !86)
!89 = !DILocation(line: 79, column: 47, scope: !86)
!90 = !DILocation(line: 79, column: 36, scope: !86)
!91 = !DILocation(line: 80, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !1, line: 80, column: 17)
!93 = !DILocation(line: 80, column: 28, scope: !92)
!94 = !DILocation(line: 80, column: 17, scope: !86)
!95 = !DILocation(line: 82, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !1, line: 81, column: 13)
!97 = !DILocation(line: 83, column: 17, scope: !96)
!98 = !DILocalVariable(name: "i", scope: !99, file: !1, line: 86, type: !37)
!99 = distinct !DILexicalBlock(scope: !86, file: !1, line: 85, column: 13)
!100 = !DILocation(line: 86, column: 24, scope: !99)
!101 = !DILocation(line: 87, column: 24, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !1, line: 87, column: 17)
!103 = !DILocation(line: 87, column: 22, scope: !102)
!104 = !DILocation(line: 87, column: 29, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !1, line: 87, column: 17)
!106 = !DILocation(line: 87, column: 31, scope: !105)
!107 = !DILocation(line: 87, column: 17, scope: !102)
!108 = !DILocation(line: 89, column: 21, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !1, line: 88, column: 17)
!110 = !DILocation(line: 89, column: 32, scope: !109)
!111 = !DILocation(line: 89, column: 35, scope: !109)
!112 = !DILocation(line: 90, column: 17, scope: !109)
!113 = !DILocation(line: 87, column: 39, scope: !105)
!114 = !DILocation(line: 87, column: 17, scope: !105)
!115 = distinct !{!115, !107, !116, !57}
!116 = !DILocation(line: 90, column: 17, scope: !102)
!117 = !DILocation(line: 92, column: 20, scope: !86)
!118 = !DILocation(line: 92, column: 18, scope: !86)
!119 = !DILocation(line: 95, column: 23, scope: !75)
!120 = !DILocation(line: 95, column: 5, scope: !75)
!121 = !DILocation(line: 97, column: 10, scope: !75)
!122 = !DILocation(line: 97, column: 5, scope: !75)
!123 = !DILocation(line: 98, column: 1, scope: !75)
!124 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !1, file: !1, line: 30, type: !71, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!125 = !DILocation(line: 32, column: 5, scope: !124)
!126 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 101, type: !19, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!127 = !DILocalVariable(name: "data", scope: !126, file: !1, line: 103, type: !3)
!128 = !DILocation(line: 103, column: 15, scope: !126)
!129 = !DILocation(line: 104, column: 10, scope: !126)
!130 = !DILocation(line: 105, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !126, file: !1, line: 105, column: 8)
!132 = !DILocation(line: 105, column: 8, scope: !126)
!133 = !DILocalVariable(name: "dataBuffer", scope: !134, file: !1, line: 109, type: !3)
!134 = distinct !DILexicalBlock(scope: !135, file: !1, line: 107, column: 9)
!135 = distinct !DILexicalBlock(scope: !131, file: !1, line: 106, column: 5)
!136 = !DILocation(line: 109, column: 23, scope: !134)
!137 = !DILocation(line: 109, column: 47, scope: !134)
!138 = !DILocation(line: 109, column: 36, scope: !134)
!139 = !DILocation(line: 110, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !1, line: 110, column: 17)
!141 = !DILocation(line: 110, column: 28, scope: !140)
!142 = !DILocation(line: 110, column: 17, scope: !134)
!143 = !DILocation(line: 112, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !1, line: 111, column: 13)
!145 = !DILocation(line: 113, column: 17, scope: !144)
!146 = !DILocalVariable(name: "i", scope: !147, file: !1, line: 116, type: !37)
!147 = distinct !DILexicalBlock(scope: !134, file: !1, line: 115, column: 13)
!148 = !DILocation(line: 116, column: 24, scope: !147)
!149 = !DILocation(line: 117, column: 24, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !1, line: 117, column: 17)
!151 = !DILocation(line: 117, column: 22, scope: !150)
!152 = !DILocation(line: 117, column: 29, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !1, line: 117, column: 17)
!154 = !DILocation(line: 117, column: 31, scope: !153)
!155 = !DILocation(line: 117, column: 17, scope: !150)
!156 = !DILocation(line: 119, column: 21, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !1, line: 118, column: 17)
!158 = !DILocation(line: 119, column: 32, scope: !157)
!159 = !DILocation(line: 119, column: 35, scope: !157)
!160 = !DILocation(line: 120, column: 17, scope: !157)
!161 = !DILocation(line: 117, column: 39, scope: !153)
!162 = !DILocation(line: 117, column: 17, scope: !153)
!163 = distinct !{!163, !155, !164, !57}
!164 = !DILocation(line: 120, column: 17, scope: !150)
!165 = !DILocation(line: 122, column: 20, scope: !134)
!166 = !DILocation(line: 122, column: 18, scope: !134)
!167 = !DILocation(line: 124, column: 5, scope: !135)
!168 = !DILocation(line: 125, column: 23, scope: !126)
!169 = !DILocation(line: 125, column: 5, scope: !126)
!170 = !DILocation(line: 127, column: 10, scope: !126)
!171 = !DILocation(line: 127, column: 5, scope: !126)
!172 = !DILocation(line: 128, column: 1, scope: !126)
