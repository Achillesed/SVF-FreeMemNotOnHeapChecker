; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_05.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_05_bad() #0 !dbg !24 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i64* null, i64** %data, align 8, !dbg !30
  %0 = load i32, i32* @staticTrue, align 4, !dbg !31
  %tobool = icmp ne i32 %0, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !34, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %1, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %2, !dbg !56
  store i64 5, i64* %arrayidx, align 8, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %3, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !64
  store i64* %arraydecay, i64** %data, align 8, !dbg !65
  br label %if.end, !dbg !66

if.end:                                           ; preds = %for.end, %entry
  %4 = load i64*, i64** %data, align 8, !dbg !67
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 0, !dbg !67
  %5 = load i64, i64* %arrayidx1, align 8, !dbg !67
  call void @printLongLongLine(i64 noundef %5), !dbg !68
  %6 = load i64*, i64** %data, align 8, !dbg !69
  %7 = bitcast i64* %6 to i8*, !dbg !69
  call void @free(i8* noundef %7) #5, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_05_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i64* null, i64** %data, align 8, !dbg !79
  %0 = load i32, i32* @staticFalse, align 4, !dbg !80
  %tobool = icmp ne i32 %0, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !83
  br label %if.end3, !dbg !85

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !89
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !90
  %1 = bitcast i8* %call to i64*, !dbg !91
  store i64* %1, i64** %dataBuffer, align 8, !dbg !89
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !92
  %cmp = icmp eq i64* %2, null, !dbg !94
  br i1 %cmp, label %if.then1, label %if.end, !dbg !95

if.then1:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @exit(i32 noundef 1) #6, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !99, metadata !DIExpression()), !dbg !101
  store i64 0, i64* %i, align 8, !dbg !102
  br label %for.cond, !dbg !104

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !105
  %cmp2 = icmp ult i64 %3, 100, !dbg !107
  br i1 %cmp2, label %for.body, label %for.end, !dbg !108

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !109
  %5 = load i64, i64* %i, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !109
  store i64 5, i64* %arrayidx, align 8, !dbg !112
  br label %for.inc, !dbg !113

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !114
  %inc = add i64 %6, 1, !dbg !114
  store i64 %inc, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !115, !llvm.loop !116

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !118
  store i64* %7, i64** %data, align 8, !dbg !119
  br label %if.end3

if.end3:                                          ; preds = %for.end, %if.then
  %8 = load i64*, i64** %data, align 8, !dbg !120
  %arrayidx4 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !120
  %9 = load i64, i64* %arrayidx4, align 8, !dbg !120
  call void @printLongLongLine(i64 noundef %9), !dbg !121
  %10 = load i64*, i64** %data, align 8, !dbg !122
  %11 = bitcast i64* %10 to i8*, !dbg !122
  call void @free(i8* noundef %11) #5, !dbg !123
  ret void, !dbg !124
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !125 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !126, metadata !DIExpression()), !dbg !127
  store i64* null, i64** %data, align 8, !dbg !128
  %0 = load i32, i32* @staticTrue, align 4, !dbg !129
  %tobool = icmp ne i32 %0, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.end3, !dbg !131

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !132, metadata !DIExpression()), !dbg !135
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !136
  %1 = bitcast i8* %call to i64*, !dbg !137
  store i64* %1, i64** %dataBuffer, align 8, !dbg !135
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !138
  %cmp = icmp eq i64* %2, null, !dbg !140
  br i1 %cmp, label %if.then1, label %if.end, !dbg !141

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !142
  call void @exit(i32 noundef 1) #6, !dbg !144
  unreachable, !dbg !144

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !151
  %cmp2 = icmp ult i64 %3, 100, !dbg !153
  br i1 %cmp2, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !155
  %5 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !155
  store i64 5, i64* %arrayidx, align 8, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !160
  %inc = add i64 %6, 1, !dbg !160
  store i64 %inc, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !164
  store i64* %7, i64** %data, align 8, !dbg !165
  br label %if.end3, !dbg !166

if.end3:                                          ; preds = %for.end, %entry
  %8 = load i64*, i64** %data, align 8, !dbg !167
  %arrayidx4 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !167
  %9 = load i64, i64* %arrayidx4, align 8, !dbg !167
  call void @printLongLongLine(i64 noundef %9), !dbg !168
  %10 = load i64*, i64** %data, align 8, !dbg !169
  %11 = bitcast i64* %10 to i8*, !dbg !169
  call void @free(i8* noundef %11) #5, !dbg !170
  ret void, !dbg !171
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !3, line: 25, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_05.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "6f5d86ae558a9ebe3ac81c8cfe645694")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!10 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !3, line: 26, type: !15, isLocal: true, isDefinition: true)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{i32 7, !"Dwarf Version", i32 5}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"PIE Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!24 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_05_bad", scope: !3, file: !3, line: 30, type: !25, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !{}
!28 = !DILocalVariable(name: "data", scope: !24, file: !3, line: 32, type: !5)
!29 = !DILocation(line: 32, column: 15, scope: !24)
!30 = !DILocation(line: 33, column: 10, scope: !24)
!31 = !DILocation(line: 34, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !3, line: 34, column: 8)
!33 = !DILocation(line: 34, column: 8, scope: !24)
!34 = !DILocalVariable(name: "dataBuffer", scope: !35, file: !3, line: 38, type: !37)
!35 = distinct !DILexicalBlock(scope: !36, file: !3, line: 36, column: 9)
!36 = distinct !DILexicalBlock(scope: !32, file: !3, line: 35, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 38, column: 21, scope: !35)
!41 = !DILocalVariable(name: "i", scope: !42, file: !3, line: 40, type: !43)
!42 = distinct !DILexicalBlock(scope: !35, file: !3, line: 39, column: 13)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!45 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 40, column: 24, scope: !42)
!47 = !DILocation(line: 41, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !3, line: 41, column: 17)
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
!64 = !DILocation(line: 46, column: 20, scope: !35)
!65 = !DILocation(line: 46, column: 18, scope: !35)
!66 = !DILocation(line: 48, column: 5, scope: !36)
!67 = !DILocation(line: 49, column: 23, scope: !24)
!68 = !DILocation(line: 49, column: 5, scope: !24)
!69 = !DILocation(line: 51, column: 10, scope: !24)
!70 = !DILocation(line: 51, column: 5, scope: !24)
!71 = !DILocation(line: 52, column: 1, scope: !24)
!72 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_declare_05_good", scope: !3, file: !3, line: 123, type: !25, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!73 = !DILocation(line: 125, column: 5, scope: !72)
!74 = !DILocation(line: 126, column: 5, scope: !72)
!75 = !DILocation(line: 127, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 59, type: !25, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!77 = !DILocalVariable(name: "data", scope: !76, file: !3, line: 61, type: !5)
!78 = !DILocation(line: 61, column: 15, scope: !76)
!79 = !DILocation(line: 62, column: 10, scope: !76)
!80 = !DILocation(line: 63, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !3, line: 63, column: 8)
!82 = !DILocation(line: 63, column: 8, scope: !76)
!83 = !DILocation(line: 66, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !3, line: 64, column: 5)
!85 = !DILocation(line: 67, column: 5, scope: !84)
!86 = !DILocalVariable(name: "dataBuffer", scope: !87, file: !3, line: 72, type: !5)
!87 = distinct !DILexicalBlock(scope: !88, file: !3, line: 70, column: 9)
!88 = distinct !DILexicalBlock(scope: !81, file: !3, line: 69, column: 5)
!89 = !DILocation(line: 72, column: 23, scope: !87)
!90 = !DILocation(line: 72, column: 47, scope: !87)
!91 = !DILocation(line: 72, column: 36, scope: !87)
!92 = !DILocation(line: 73, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !3, line: 73, column: 17)
!94 = !DILocation(line: 73, column: 28, scope: !93)
!95 = !DILocation(line: 73, column: 17, scope: !87)
!96 = !DILocation(line: 75, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !3, line: 74, column: 13)
!98 = !DILocation(line: 76, column: 17, scope: !97)
!99 = !DILocalVariable(name: "i", scope: !100, file: !3, line: 79, type: !43)
!100 = distinct !DILexicalBlock(scope: !87, file: !3, line: 78, column: 13)
!101 = !DILocation(line: 79, column: 24, scope: !100)
!102 = !DILocation(line: 80, column: 24, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !3, line: 80, column: 17)
!104 = !DILocation(line: 80, column: 22, scope: !103)
!105 = !DILocation(line: 80, column: 29, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !3, line: 80, column: 17)
!107 = !DILocation(line: 80, column: 31, scope: !106)
!108 = !DILocation(line: 80, column: 17, scope: !103)
!109 = !DILocation(line: 82, column: 21, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !3, line: 81, column: 17)
!111 = !DILocation(line: 82, column: 32, scope: !110)
!112 = !DILocation(line: 82, column: 35, scope: !110)
!113 = !DILocation(line: 83, column: 17, scope: !110)
!114 = !DILocation(line: 80, column: 39, scope: !106)
!115 = !DILocation(line: 80, column: 17, scope: !106)
!116 = distinct !{!116, !108, !117, !63}
!117 = !DILocation(line: 83, column: 17, scope: !103)
!118 = !DILocation(line: 85, column: 20, scope: !87)
!119 = !DILocation(line: 85, column: 18, scope: !87)
!120 = !DILocation(line: 88, column: 23, scope: !76)
!121 = !DILocation(line: 88, column: 5, scope: !76)
!122 = !DILocation(line: 90, column: 10, scope: !76)
!123 = !DILocation(line: 90, column: 5, scope: !76)
!124 = !DILocation(line: 91, column: 1, scope: !76)
!125 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 94, type: !25, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!126 = !DILocalVariable(name: "data", scope: !125, file: !3, line: 96, type: !5)
!127 = !DILocation(line: 96, column: 15, scope: !125)
!128 = !DILocation(line: 97, column: 10, scope: !125)
!129 = !DILocation(line: 98, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !3, line: 98, column: 8)
!131 = !DILocation(line: 98, column: 8, scope: !125)
!132 = !DILocalVariable(name: "dataBuffer", scope: !133, file: !3, line: 102, type: !5)
!133 = distinct !DILexicalBlock(scope: !134, file: !3, line: 100, column: 9)
!134 = distinct !DILexicalBlock(scope: !130, file: !3, line: 99, column: 5)
!135 = !DILocation(line: 102, column: 23, scope: !133)
!136 = !DILocation(line: 102, column: 47, scope: !133)
!137 = !DILocation(line: 102, column: 36, scope: !133)
!138 = !DILocation(line: 103, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !3, line: 103, column: 17)
!140 = !DILocation(line: 103, column: 28, scope: !139)
!141 = !DILocation(line: 103, column: 17, scope: !133)
!142 = !DILocation(line: 105, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !3, line: 104, column: 13)
!144 = !DILocation(line: 106, column: 17, scope: !143)
!145 = !DILocalVariable(name: "i", scope: !146, file: !3, line: 109, type: !43)
!146 = distinct !DILexicalBlock(scope: !133, file: !3, line: 108, column: 13)
!147 = !DILocation(line: 109, column: 24, scope: !146)
!148 = !DILocation(line: 110, column: 24, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !3, line: 110, column: 17)
!150 = !DILocation(line: 110, column: 22, scope: !149)
!151 = !DILocation(line: 110, column: 29, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !3, line: 110, column: 17)
!153 = !DILocation(line: 110, column: 31, scope: !152)
!154 = !DILocation(line: 110, column: 17, scope: !149)
!155 = !DILocation(line: 112, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !3, line: 111, column: 17)
!157 = !DILocation(line: 112, column: 32, scope: !156)
!158 = !DILocation(line: 112, column: 35, scope: !156)
!159 = !DILocation(line: 113, column: 17, scope: !156)
!160 = !DILocation(line: 110, column: 39, scope: !152)
!161 = !DILocation(line: 110, column: 17, scope: !152)
!162 = distinct !{!162, !154, !163, !63}
!163 = !DILocation(line: 113, column: 17, scope: !149)
!164 = !DILocation(line: 115, column: 20, scope: !133)
!165 = !DILocation(line: 115, column: 18, scope: !133)
!166 = !DILocation(line: 117, column: 5, scope: !134)
!167 = !DILocation(line: 118, column: 23, scope: !125)
!168 = !DILocation(line: 118, column: 5, scope: !125)
!169 = !DILocation(line: 120, column: 10, scope: !125)
!170 = !DILocation(line: 120, column: 5, scope: !125)
!171 = !DILocation(line: 121, column: 1, scope: !125)
