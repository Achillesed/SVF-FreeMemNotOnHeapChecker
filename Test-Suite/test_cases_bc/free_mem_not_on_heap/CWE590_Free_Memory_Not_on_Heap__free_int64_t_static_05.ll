; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_05.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_05_bad.dataBuffer = internal global [100 x i64] zeroinitializer, align 16, !dbg !13
@staticFalse = internal global i32 0, align 4, !dbg !22
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_05_bad() #0 !dbg !15 {
entry:
  %data = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !33, metadata !DIExpression()), !dbg !34
  store i64* null, i64** %data, align 8, !dbg !35
  %0 = load i32, i32* @staticTrue, align 4, !dbg !36
  %tobool = icmp ne i32 %0, 0, !dbg !36
  br i1 %tobool, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %1, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_05_bad.dataBuffer, i64 0, i64 %2, !dbg !56
  store i64 5, i64* %arrayidx, align 8, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %3, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  store i64* getelementptr inbounds ([100 x i64], [100 x i64]* @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_05_bad.dataBuffer, i64 0, i64 0), i64** %data, align 8, !dbg !64
  br label %if.end, !dbg !65

if.end:                                           ; preds = %for.end, %entry
  %4 = load i64*, i64** %data, align 8, !dbg !66
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 0, !dbg !66
  %5 = load i64, i64* %arrayidx1, align 8, !dbg !66
  call void @printLongLongLine(i64 noundef %5), !dbg !67
  %6 = load i64*, i64** %data, align 8, !dbg !68
  %7 = bitcast i64* %6 to i8*, !dbg !68
  call void @free(i8* noundef %7) #5, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_05_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i64* null, i64** %data, align 8, !dbg !78
  %0 = load i32, i32* @staticFalse, align 4, !dbg !79
  %tobool = icmp ne i32 %0, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !82
  br label %if.end3, !dbg !84

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !88
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !89
  %1 = bitcast i8* %call to i64*, !dbg !90
  store i64* %1, i64** %dataBuffer, align 8, !dbg !88
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !91
  %cmp = icmp eq i64* %2, null, !dbg !93
  br i1 %cmp, label %if.then1, label %if.end, !dbg !94

if.then1:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @exit(i32 noundef 1) #6, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !98, metadata !DIExpression()), !dbg !100
  store i64 0, i64* %i, align 8, !dbg !101
  br label %for.cond, !dbg !103

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !104
  %cmp2 = icmp ult i64 %3, 100, !dbg !106
  br i1 %cmp2, label %for.body, label %for.end, !dbg !107

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !108
  %5 = load i64, i64* %i, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !108
  store i64 5, i64* %arrayidx, align 8, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !113
  %inc = add i64 %6, 1, !dbg !113
  store i64 %inc, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !117
  store i64* %7, i64** %data, align 8, !dbg !118
  br label %if.end3

if.end3:                                          ; preds = %for.end, %if.then
  %8 = load i64*, i64** %data, align 8, !dbg !119
  %arrayidx4 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !119
  %9 = load i64, i64* %arrayidx4, align 8, !dbg !119
  call void @printLongLongLine(i64 noundef %9), !dbg !120
  %10 = load i64*, i64** %data, align 8, !dbg !121
  %11 = bitcast i64* %10 to i8*, !dbg !121
  call void @free(i8* noundef %11) #5, !dbg !122
  ret void, !dbg !123
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !124 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !125, metadata !DIExpression()), !dbg !126
  store i64* null, i64** %data, align 8, !dbg !127
  %0 = load i32, i32* @staticTrue, align 4, !dbg !128
  %tobool = icmp ne i32 %0, 0, !dbg !128
  br i1 %tobool, label %if.then, label %if.end3, !dbg !130

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !131, metadata !DIExpression()), !dbg !134
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !135
  %1 = bitcast i8* %call to i64*, !dbg !136
  store i64* %1, i64** %dataBuffer, align 8, !dbg !134
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !137
  %cmp = icmp eq i64* %2, null, !dbg !139
  br i1 %cmp, label %if.then1, label %if.end, !dbg !140

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !141
  call void @exit(i32 noundef 1) #6, !dbg !143
  unreachable, !dbg !143

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !144, metadata !DIExpression()), !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !150
  %cmp2 = icmp ult i64 %3, 100, !dbg !152
  br i1 %cmp2, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !154
  %5 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !154
  store i64 5, i64* %arrayidx, align 8, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %6, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !163
  store i64* %7, i64** %data, align 8, !dbg !164
  br label %if.end3, !dbg !165

if.end3:                                          ; preds = %for.end, %entry
  %8 = load i64*, i64** %data, align 8, !dbg !166
  %arrayidx4 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !166
  %9 = load i64, i64* %arrayidx4, align 8, !dbg !166
  call void @printLongLongLine(i64 noundef %9), !dbg !167
  %10 = load i64*, i64** %data, align 8, !dbg !168
  %11 = bitcast i64* %10 to i8*, !dbg !168
  call void @free(i8* noundef %11) #5, !dbg !169
  ret void, !dbg !170
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!25, !26, !27, !28, !29, !30, !31}
!llvm.ident = !{!32}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !3, line: 25, type: !24, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_05.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "e975130394ad455c233af0376eb40306")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!10 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{!13, !0, !22}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !15, file: !3, line: 38, type: !19, isLocal: true, isDefinition: true)
!15 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_05_bad", scope: !3, file: !3, line: 30, type: !16, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !18)
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 100)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !3, line: 26, type: !24, isLocal: true, isDefinition: true)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !{i32 7, !"Dwarf Version", i32 5}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{i32 1, !"wchar_size", i32 4}
!28 = !{i32 7, !"PIC Level", i32 2}
!29 = !{i32 7, !"PIE Level", i32 2}
!30 = !{i32 7, !"uwtable", i32 1}
!31 = !{i32 7, !"frame-pointer", i32 2}
!32 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!33 = !DILocalVariable(name: "data", scope: !15, file: !3, line: 32, type: !5)
!34 = !DILocation(line: 32, column: 15, scope: !15)
!35 = !DILocation(line: 33, column: 10, scope: !15)
!36 = !DILocation(line: 34, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !15, file: !3, line: 34, column: 8)
!38 = !DILocation(line: 34, column: 8, scope: !15)
!39 = !DILocalVariable(name: "i", scope: !40, file: !3, line: 40, type: !43)
!40 = distinct !DILexicalBlock(scope: !41, file: !3, line: 39, column: 13)
!41 = distinct !DILexicalBlock(scope: !42, file: !3, line: 36, column: 9)
!42 = distinct !DILexicalBlock(scope: !37, file: !3, line: 35, column: 5)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!45 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 40, column: 24, scope: !40)
!47 = !DILocation(line: 41, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !40, file: !3, line: 41, column: 17)
!49 = !DILocation(line: 41, column: 22, scope: !48)
!50 = !DILocation(line: 41, column: 29, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !3, line: 41, column: 17)
!52 = !DILocation(line: 41, column: 31, scope: !51)
!53 = !DILocation(line: 41, column: 17, scope: !48)
!54 = !DILocation(line: 43, column: 32, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !3, line: 42, column: 17)
!56 = !DILocation(line: 43, column: 21, scope: !55)
!57 = !DILocation(line: 43, column: 35, scope: !55)
!58 = !DILocation(line: 44, column: 17, scope: !55)
!59 = !DILocation(line: 41, column: 39, scope: !51)
!60 = !DILocation(line: 41, column: 17, scope: !51)
!61 = distinct !{!61, !53, !62, !63}
!62 = !DILocation(line: 44, column: 17, scope: !48)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 46, column: 18, scope: !41)
!65 = !DILocation(line: 48, column: 5, scope: !42)
!66 = !DILocation(line: 49, column: 23, scope: !15)
!67 = !DILocation(line: 49, column: 5, scope: !15)
!68 = !DILocation(line: 51, column: 10, scope: !15)
!69 = !DILocation(line: 51, column: 5, scope: !15)
!70 = !DILocation(line: 52, column: 1, scope: !15)
!71 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_static_05_good", scope: !3, file: !3, line: 123, type: !16, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !18)
!72 = !DILocation(line: 125, column: 5, scope: !71)
!73 = !DILocation(line: 126, column: 5, scope: !71)
!74 = !DILocation(line: 127, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !18)
!76 = !DILocalVariable(name: "data", scope: !75, file: !3, line: 61, type: !5)
!77 = !DILocation(line: 61, column: 15, scope: !75)
!78 = !DILocation(line: 62, column: 10, scope: !75)
!79 = !DILocation(line: 63, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !3, line: 63, column: 8)
!81 = !DILocation(line: 63, column: 8, scope: !75)
!82 = !DILocation(line: 66, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !3, line: 64, column: 5)
!84 = !DILocation(line: 67, column: 5, scope: !83)
!85 = !DILocalVariable(name: "dataBuffer", scope: !86, file: !3, line: 72, type: !5)
!86 = distinct !DILexicalBlock(scope: !87, file: !3, line: 70, column: 9)
!87 = distinct !DILexicalBlock(scope: !80, file: !3, line: 69, column: 5)
!88 = !DILocation(line: 72, column: 23, scope: !86)
!89 = !DILocation(line: 72, column: 47, scope: !86)
!90 = !DILocation(line: 72, column: 36, scope: !86)
!91 = !DILocation(line: 73, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !3, line: 73, column: 17)
!93 = !DILocation(line: 73, column: 28, scope: !92)
!94 = !DILocation(line: 73, column: 17, scope: !86)
!95 = !DILocation(line: 75, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !3, line: 74, column: 13)
!97 = !DILocation(line: 76, column: 17, scope: !96)
!98 = !DILocalVariable(name: "i", scope: !99, file: !3, line: 79, type: !43)
!99 = distinct !DILexicalBlock(scope: !86, file: !3, line: 78, column: 13)
!100 = !DILocation(line: 79, column: 24, scope: !99)
!101 = !DILocation(line: 80, column: 24, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !3, line: 80, column: 17)
!103 = !DILocation(line: 80, column: 22, scope: !102)
!104 = !DILocation(line: 80, column: 29, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !3, line: 80, column: 17)
!106 = !DILocation(line: 80, column: 31, scope: !105)
!107 = !DILocation(line: 80, column: 17, scope: !102)
!108 = !DILocation(line: 82, column: 21, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !3, line: 81, column: 17)
!110 = !DILocation(line: 82, column: 32, scope: !109)
!111 = !DILocation(line: 82, column: 35, scope: !109)
!112 = !DILocation(line: 83, column: 17, scope: !109)
!113 = !DILocation(line: 80, column: 39, scope: !105)
!114 = !DILocation(line: 80, column: 17, scope: !105)
!115 = distinct !{!115, !107, !116, !63}
!116 = !DILocation(line: 83, column: 17, scope: !102)
!117 = !DILocation(line: 85, column: 20, scope: !86)
!118 = !DILocation(line: 85, column: 18, scope: !86)
!119 = !DILocation(line: 88, column: 23, scope: !75)
!120 = !DILocation(line: 88, column: 5, scope: !75)
!121 = !DILocation(line: 90, column: 10, scope: !75)
!122 = !DILocation(line: 90, column: 5, scope: !75)
!123 = !DILocation(line: 91, column: 1, scope: !75)
!124 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !18)
!125 = !DILocalVariable(name: "data", scope: !124, file: !3, line: 96, type: !5)
!126 = !DILocation(line: 96, column: 15, scope: !124)
!127 = !DILocation(line: 97, column: 10, scope: !124)
!128 = !DILocation(line: 98, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !3, line: 98, column: 8)
!130 = !DILocation(line: 98, column: 8, scope: !124)
!131 = !DILocalVariable(name: "dataBuffer", scope: !132, file: !3, line: 102, type: !5)
!132 = distinct !DILexicalBlock(scope: !133, file: !3, line: 100, column: 9)
!133 = distinct !DILexicalBlock(scope: !129, file: !3, line: 99, column: 5)
!134 = !DILocation(line: 102, column: 23, scope: !132)
!135 = !DILocation(line: 102, column: 47, scope: !132)
!136 = !DILocation(line: 102, column: 36, scope: !132)
!137 = !DILocation(line: 103, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !3, line: 103, column: 17)
!139 = !DILocation(line: 103, column: 28, scope: !138)
!140 = !DILocation(line: 103, column: 17, scope: !132)
!141 = !DILocation(line: 105, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !3, line: 104, column: 13)
!143 = !DILocation(line: 106, column: 17, scope: !142)
!144 = !DILocalVariable(name: "i", scope: !145, file: !3, line: 109, type: !43)
!145 = distinct !DILexicalBlock(scope: !132, file: !3, line: 108, column: 13)
!146 = !DILocation(line: 109, column: 24, scope: !145)
!147 = !DILocation(line: 110, column: 24, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !3, line: 110, column: 17)
!149 = !DILocation(line: 110, column: 22, scope: !148)
!150 = !DILocation(line: 110, column: 29, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !3, line: 110, column: 17)
!152 = !DILocation(line: 110, column: 31, scope: !151)
!153 = !DILocation(line: 110, column: 17, scope: !148)
!154 = !DILocation(line: 112, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !3, line: 111, column: 17)
!156 = !DILocation(line: 112, column: 32, scope: !155)
!157 = !DILocation(line: 112, column: 35, scope: !155)
!158 = !DILocation(line: 113, column: 17, scope: !155)
!159 = !DILocation(line: 110, column: 39, scope: !151)
!160 = !DILocation(line: 110, column: 17, scope: !151)
!161 = distinct !{!161, !153, !162, !63}
!162 = !DILocation(line: 113, column: 17, scope: !148)
!163 = !DILocation(line: 115, column: 20, scope: !132)
!164 = !DILocation(line: 115, column: 18, scope: !132)
!165 = !DILocation(line: 117, column: 5, scope: !133)
!166 = !DILocation(line: 118, column: 23, scope: !124)
!167 = !DILocation(line: 118, column: 5, scope: !124)
!168 = !DILocation(line: 120, column: 10, scope: !124)
!169 = !DILocation(line: 120, column: 5, scope: !124)
!170 = !DILocation(line: 121, column: 1, scope: !124)
