; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_long_declare_05.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_long_declare_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@staticFalse = internal global i32 0, align 4, !dbg !9
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_declare_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i64* null, i64** %data, align 8, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %1, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 %2, !dbg !52
  store i64 5, i64* %arrayidx, align 8, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %3, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataBuffer, i64 0, i64 0, !dbg !60
  store i64* %arraydecay, i64** %data, align 8, !dbg !61
  br label %if.end, !dbg !62

if.end:                                           ; preds = %for.end, %entry
  %4 = load i64*, i64** %data, align 8, !dbg !63
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 0, !dbg !63
  %5 = load i64, i64* %arrayidx1, align 8, !dbg !63
  call void @printLongLine(i64 noundef %5), !dbg !64
  %6 = load i64*, i64** %data, align 8, !dbg !65
  %7 = bitcast i64* %6 to i8*, !dbg !65
  call void @free(i8* noundef %7) #5, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_long_declare_05_good() #0 !dbg !68 {
entry:
  call void @goodG2B1(), !dbg !69
  call void @goodG2B2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i64* null, i64** %data, align 8, !dbg !75
  %0 = load i32, i32* @staticFalse, align 4, !dbg !76
  %tobool = icmp ne i32 %0, 0, !dbg !76
  br i1 %tobool, label %if.then, label %if.else, !dbg !78

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !79
  br label %if.end3, !dbg !81

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !85
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !86
  %1 = bitcast i8* %call to i64*, !dbg !87
  store i64* %1, i64** %dataBuffer, align 8, !dbg !85
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !88
  %cmp = icmp eq i64* %2, null, !dbg !90
  br i1 %cmp, label %if.then1, label %if.end, !dbg !91

if.then1:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @exit(i32 noundef 1) #6, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !95, metadata !DIExpression()), !dbg !97
  store i64 0, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !101
  %cmp2 = icmp ult i64 %3, 100, !dbg !103
  br i1 %cmp2, label %for.body, label %for.end, !dbg !104

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
  br label %if.end3

if.end3:                                          ; preds = %for.end, %if.then
  %8 = load i64*, i64** %data, align 8, !dbg !116
  %arrayidx4 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !116
  %9 = load i64, i64* %arrayidx4, align 8, !dbg !116
  call void @printLongLine(i64 noundef %9), !dbg !117
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !125
  %tobool = icmp ne i32 %0, 0, !dbg !125
  br i1 %tobool, label %if.then, label %if.end3, !dbg !127

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !128, metadata !DIExpression()), !dbg !131
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !132
  %1 = bitcast i8* %call to i64*, !dbg !133
  store i64* %1, i64** %dataBuffer, align 8, !dbg !131
  %2 = load i64*, i64** %dataBuffer, align 8, !dbg !134
  %cmp = icmp eq i64* %2, null, !dbg !136
  br i1 %cmp, label %if.then1, label %if.end, !dbg !137

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !138
  call void @exit(i32 noundef 1) #6, !dbg !140
  unreachable, !dbg !140

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !147
  %cmp2 = icmp ult i64 %3, 100, !dbg !149
  br i1 %cmp2, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %4 = load i64*, i64** %dataBuffer, align 8, !dbg !151
  %5 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !151
  store i64 5, i64* %arrayidx, align 8, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %6, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %dataBuffer, align 8, !dbg !160
  store i64* %7, i64** %data, align 8, !dbg !161
  br label %if.end3, !dbg !162

if.end3:                                          ; preds = %for.end, %entry
  %8 = load i64*, i64** %data, align 8, !dbg !163
  %arrayidx4 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !163
  %9 = load i64, i64* %arrayidx4, align 8, !dbg !163
  call void @printLongLine(i64 noundef %9), !dbg !164
  %10 = load i64*, i64** %data, align 8, !dbg !165
  %11 = bitcast i64* %10 to i8*, !dbg !165
  call void @free(i8* noundef %11) #5, !dbg !166
  ret void, !dbg !167
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !3, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_05.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "01d27a5bf9ea62179d7fdbc8be634e8d")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !3, line: 26, type: !11, isLocal: true, isDefinition: true)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 5}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"PIE Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_05_bad", scope: !3, file: !3, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !3, line: 32, type: !5)
!25 = !DILocation(line: 32, column: 12, scope: !20)
!26 = !DILocation(line: 33, column: 10, scope: !20)
!27 = !DILocation(line: 34, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !3, line: 34, column: 8)
!29 = !DILocation(line: 34, column: 8, scope: !20)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !3, line: 38, type: !33)
!31 = distinct !DILexicalBlock(scope: !32, file: !3, line: 36, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !3, line: 35, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 38, column: 18, scope: !31)
!37 = !DILocalVariable(name: "i", scope: !38, file: !3, line: 40, type: !39)
!38 = distinct !DILexicalBlock(scope: !31, file: !3, line: 39, column: 13)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 40, column: 24, scope: !38)
!43 = !DILocation(line: 41, column: 24, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !3, line: 41, column: 17)
!45 = !DILocation(line: 41, column: 22, scope: !44)
!46 = !DILocation(line: 41, column: 29, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !3, line: 41, column: 17)
!48 = !DILocation(line: 41, column: 31, scope: !47)
!49 = !DILocation(line: 41, column: 17, scope: !44)
!50 = !DILocation(line: 43, column: 32, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !3, line: 42, column: 17)
!52 = !DILocation(line: 43, column: 21, scope: !51)
!53 = !DILocation(line: 43, column: 35, scope: !51)
!54 = !DILocation(line: 44, column: 17, scope: !51)
!55 = !DILocation(line: 41, column: 39, scope: !47)
!56 = !DILocation(line: 41, column: 17, scope: !47)
!57 = distinct !{!57, !49, !58, !59}
!58 = !DILocation(line: 44, column: 17, scope: !44)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 46, column: 20, scope: !31)
!61 = !DILocation(line: 46, column: 18, scope: !31)
!62 = !DILocation(line: 48, column: 5, scope: !32)
!63 = !DILocation(line: 49, column: 19, scope: !20)
!64 = !DILocation(line: 49, column: 5, scope: !20)
!65 = !DILocation(line: 51, column: 10, scope: !20)
!66 = !DILocation(line: 51, column: 5, scope: !20)
!67 = !DILocation(line: 52, column: 1, scope: !20)
!68 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_long_declare_05_good", scope: !3, file: !3, line: 123, type: !21, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!69 = !DILocation(line: 125, column: 5, scope: !68)
!70 = !DILocation(line: 126, column: 5, scope: !68)
!71 = !DILocation(line: 127, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 59, type: !21, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!73 = !DILocalVariable(name: "data", scope: !72, file: !3, line: 61, type: !5)
!74 = !DILocation(line: 61, column: 12, scope: !72)
!75 = !DILocation(line: 62, column: 10, scope: !72)
!76 = !DILocation(line: 63, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !3, line: 63, column: 8)
!78 = !DILocation(line: 63, column: 8, scope: !72)
!79 = !DILocation(line: 66, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !3, line: 64, column: 5)
!81 = !DILocation(line: 67, column: 5, scope: !80)
!82 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !3, line: 72, type: !5)
!83 = distinct !DILexicalBlock(scope: !84, file: !3, line: 70, column: 9)
!84 = distinct !DILexicalBlock(scope: !77, file: !3, line: 69, column: 5)
!85 = !DILocation(line: 72, column: 20, scope: !83)
!86 = !DILocation(line: 72, column: 41, scope: !83)
!87 = !DILocation(line: 72, column: 33, scope: !83)
!88 = !DILocation(line: 73, column: 17, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !3, line: 73, column: 17)
!90 = !DILocation(line: 73, column: 28, scope: !89)
!91 = !DILocation(line: 73, column: 17, scope: !83)
!92 = !DILocation(line: 75, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !3, line: 74, column: 13)
!94 = !DILocation(line: 76, column: 17, scope: !93)
!95 = !DILocalVariable(name: "i", scope: !96, file: !3, line: 79, type: !39)
!96 = distinct !DILexicalBlock(scope: !83, file: !3, line: 78, column: 13)
!97 = !DILocation(line: 79, column: 24, scope: !96)
!98 = !DILocation(line: 80, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !3, line: 80, column: 17)
!100 = !DILocation(line: 80, column: 22, scope: !99)
!101 = !DILocation(line: 80, column: 29, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !3, line: 80, column: 17)
!103 = !DILocation(line: 80, column: 31, scope: !102)
!104 = !DILocation(line: 80, column: 17, scope: !99)
!105 = !DILocation(line: 82, column: 21, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !3, line: 81, column: 17)
!107 = !DILocation(line: 82, column: 32, scope: !106)
!108 = !DILocation(line: 82, column: 35, scope: !106)
!109 = !DILocation(line: 83, column: 17, scope: !106)
!110 = !DILocation(line: 80, column: 39, scope: !102)
!111 = !DILocation(line: 80, column: 17, scope: !102)
!112 = distinct !{!112, !104, !113, !59}
!113 = !DILocation(line: 83, column: 17, scope: !99)
!114 = !DILocation(line: 85, column: 20, scope: !83)
!115 = !DILocation(line: 85, column: 18, scope: !83)
!116 = !DILocation(line: 88, column: 19, scope: !72)
!117 = !DILocation(line: 88, column: 5, scope: !72)
!118 = !DILocation(line: 90, column: 10, scope: !72)
!119 = !DILocation(line: 90, column: 5, scope: !72)
!120 = !DILocation(line: 91, column: 1, scope: !72)
!121 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 94, type: !21, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!122 = !DILocalVariable(name: "data", scope: !121, file: !3, line: 96, type: !5)
!123 = !DILocation(line: 96, column: 12, scope: !121)
!124 = !DILocation(line: 97, column: 10, scope: !121)
!125 = !DILocation(line: 98, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !121, file: !3, line: 98, column: 8)
!127 = !DILocation(line: 98, column: 8, scope: !121)
!128 = !DILocalVariable(name: "dataBuffer", scope: !129, file: !3, line: 102, type: !5)
!129 = distinct !DILexicalBlock(scope: !130, file: !3, line: 100, column: 9)
!130 = distinct !DILexicalBlock(scope: !126, file: !3, line: 99, column: 5)
!131 = !DILocation(line: 102, column: 20, scope: !129)
!132 = !DILocation(line: 102, column: 41, scope: !129)
!133 = !DILocation(line: 102, column: 33, scope: !129)
!134 = !DILocation(line: 103, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !3, line: 103, column: 17)
!136 = !DILocation(line: 103, column: 28, scope: !135)
!137 = !DILocation(line: 103, column: 17, scope: !129)
!138 = !DILocation(line: 105, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !3, line: 104, column: 13)
!140 = !DILocation(line: 106, column: 17, scope: !139)
!141 = !DILocalVariable(name: "i", scope: !142, file: !3, line: 109, type: !39)
!142 = distinct !DILexicalBlock(scope: !129, file: !3, line: 108, column: 13)
!143 = !DILocation(line: 109, column: 24, scope: !142)
!144 = !DILocation(line: 110, column: 24, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !3, line: 110, column: 17)
!146 = !DILocation(line: 110, column: 22, scope: !145)
!147 = !DILocation(line: 110, column: 29, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !3, line: 110, column: 17)
!149 = !DILocation(line: 110, column: 31, scope: !148)
!150 = !DILocation(line: 110, column: 17, scope: !145)
!151 = !DILocation(line: 112, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !3, line: 111, column: 17)
!153 = !DILocation(line: 112, column: 32, scope: !152)
!154 = !DILocation(line: 112, column: 35, scope: !152)
!155 = !DILocation(line: 113, column: 17, scope: !152)
!156 = !DILocation(line: 110, column: 39, scope: !148)
!157 = !DILocation(line: 110, column: 17, scope: !148)
!158 = distinct !{!158, !150, !159, !59}
!159 = !DILocation(line: 113, column: 17, scope: !145)
!160 = !DILocation(line: 115, column: 20, scope: !129)
!161 = !DILocation(line: 115, column: 18, scope: !129)
!162 = !DILocation(line: 117, column: 5, scope: !130)
!163 = !DILocation(line: 118, column: 19, scope: !121)
!164 = !DILocation(line: 118, column: 5, scope: !121)
!165 = !DILocation(line: 120, column: 10, scope: !121)
!166 = !DILocation(line: 120, column: 5, scope: !121)
!167 = !DILocation(line: 121, column: 1, scope: !121)
