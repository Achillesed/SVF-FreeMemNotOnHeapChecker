; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int_static_08.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int_static_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_int_static_08_bad.dataBuffer = internal global [100 x i32] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_08_bad() #0 !dbg !2 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  %call = call i32 @staticReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %0, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_08_bad.dataBuffer, i64 0, i64 %1, !dbg !47
  store i32 5, i32* %arrayidx, align 4, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %2 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %2, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  store i32* getelementptr inbounds ([100 x i32], [100 x i32]* @CWE590_Free_Memory_Not_on_Heap__free_int_static_08_bad.dataBuffer, i64 0, i64 0), i32** %data, align 8, !dbg !55
  br label %if.end, !dbg !56

if.end:                                           ; preds = %for.end, %entry
  %3 = load i32*, i32** %data, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds i32, i32* %3, i64 0, !dbg !57
  %4 = load i32, i32* %arrayidx1, align 4, !dbg !57
  call void @printIntLine(i32 noundef %4), !dbg !58
  %5 = load i32*, i32** %data, align 8, !dbg !59
  %6 = bitcast i32* %5 to i8*, !dbg !59
  call void @free(i8* noundef %6) #5, !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int_static_08_good() #0 !dbg !62 {
entry:
  call void @goodG2B1(), !dbg !63
  call void @goodG2B2(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !66 {
entry:
  ret i32 1, !dbg !69
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i32* null, i32** %data, align 8, !dbg !73
  %call = call i32 @staticReturnsFalse(), !dbg !74
  %tobool = icmp ne i32 %call, 0, !dbg !74
  br i1 %tobool, label %if.then, label %if.else, !dbg !76

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !77
  br label %if.end4, !dbg !79

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !83
  %call1 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !84
  %0 = bitcast i8* %call1 to i32*, !dbg !85
  store i32* %0, i32** %dataBuffer, align 8, !dbg !83
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  %cmp = icmp eq i32* %1, null, !dbg !88
  br i1 %cmp, label %if.then2, label %if.end, !dbg !89

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @exit(i32 noundef 1) #6, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !93, metadata !DIExpression()), !dbg !95
  store i64 0, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !99
  %cmp3 = icmp ult i64 %2, 100, !dbg !101
  br i1 %cmp3, label %for.body, label %for.end, !dbg !102

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !103
  %4 = load i64, i64* %i, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !103
  store i32 5, i32* %arrayidx, align 4, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !108
  %inc = add i64 %5, 1, !dbg !108
  store i64 %inc, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !112
  store i32* %6, i32** %data, align 8, !dbg !113
  br label %if.end4

if.end4:                                          ; preds = %for.end, %if.then
  %7 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !114
  %8 = load i32, i32* %arrayidx5, align 4, !dbg !114
  call void @printIntLine(i32 noundef %8), !dbg !115
  %9 = load i32*, i32** %data, align 8, !dbg !116
  %10 = bitcast i32* %9 to i8*, !dbg !116
  call void @free(i8* noundef %10) #5, !dbg !117
  ret void, !dbg !118
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !119 {
entry:
  ret i32 0, !dbg !120
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !121 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !122, metadata !DIExpression()), !dbg !123
  store i32* null, i32** %data, align 8, !dbg !124
  %call = call i32 @staticReturnsTrue(), !dbg !125
  %tobool = icmp ne i32 %call, 0, !dbg !125
  br i1 %tobool, label %if.then, label %if.end4, !dbg !127

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !128, metadata !DIExpression()), !dbg !131
  %call1 = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !132
  %0 = bitcast i8* %call1 to i32*, !dbg !133
  store i32* %0, i32** %dataBuffer, align 8, !dbg !131
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !134
  %cmp = icmp eq i32* %1, null, !dbg !136
  br i1 %cmp, label %if.then2, label %if.end, !dbg !137

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !138
  call void @exit(i32 noundef 1) #6, !dbg !140
  unreachable, !dbg !140

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !147
  %cmp3 = icmp ult i64 %2, 100, !dbg !149
  br i1 %cmp3, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !151
  %4 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !151
  store i32 5, i32* %arrayidx, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %5, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !160
  store i32* %6, i32** %data, align 8, !dbg !161
  br label %if.end4, !dbg !162

if.end4:                                          ; preds = %for.end, %entry
  %7 = load i32*, i32** %data, align 8, !dbg !163
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !163
  %8 = load i32, i32* %arrayidx5, align 4, !dbg !163
  call void @printIntLine(i32 noundef %8), !dbg !164
  %9 = load i32*, i32** %data, align 8, !dbg !165
  %10 = bitcast i32* %9 to i8*, !dbg !165
  call void @free(i8* noundef %10) #5, !dbg !166
  ret void, !dbg !167
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 45, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_08_bad", scope: !3, file: !3, line: 37, type: !4, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int_static_08.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "92b355d9e027fe704114639500d5dc84")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0}
!12 = !{}
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 3200, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 100)
!16 = !{i32 7, !"Dwarf Version", i32 5}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"PIE Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 39, type: !8)
!25 = !DILocation(line: 39, column: 11, scope: !2)
!26 = !DILocation(line: 40, column: 10, scope: !2)
!27 = !DILocation(line: 41, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !2, file: !3, line: 41, column: 8)
!29 = !DILocation(line: 41, column: 8, scope: !2)
!30 = !DILocalVariable(name: "i", scope: !31, file: !3, line: 47, type: !34)
!31 = distinct !DILexicalBlock(scope: !32, file: !3, line: 46, column: 13)
!32 = distinct !DILexicalBlock(scope: !33, file: !3, line: 43, column: 9)
!33 = distinct !DILexicalBlock(scope: !28, file: !3, line: 42, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 47, column: 24, scope: !31)
!38 = !DILocation(line: 48, column: 24, scope: !39)
!39 = distinct !DILexicalBlock(scope: !31, file: !3, line: 48, column: 17)
!40 = !DILocation(line: 48, column: 22, scope: !39)
!41 = !DILocation(line: 48, column: 29, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !3, line: 48, column: 17)
!43 = !DILocation(line: 48, column: 31, scope: !42)
!44 = !DILocation(line: 48, column: 17, scope: !39)
!45 = !DILocation(line: 50, column: 32, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !3, line: 49, column: 17)
!47 = !DILocation(line: 50, column: 21, scope: !46)
!48 = !DILocation(line: 50, column: 35, scope: !46)
!49 = !DILocation(line: 51, column: 17, scope: !46)
!50 = !DILocation(line: 48, column: 39, scope: !42)
!51 = !DILocation(line: 48, column: 17, scope: !42)
!52 = distinct !{!52, !44, !53, !54}
!53 = !DILocation(line: 51, column: 17, scope: !39)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 53, column: 18, scope: !32)
!56 = !DILocation(line: 55, column: 5, scope: !33)
!57 = !DILocation(line: 56, column: 18, scope: !2)
!58 = !DILocation(line: 56, column: 5, scope: !2)
!59 = !DILocation(line: 58, column: 10, scope: !2)
!60 = !DILocation(line: 58, column: 5, scope: !2)
!61 = !DILocation(line: 59, column: 1, scope: !2)
!62 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int_static_08_good", scope: !3, file: !3, line: 130, type: !4, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!63 = !DILocation(line: 132, column: 5, scope: !62)
!64 = !DILocation(line: 133, column: 5, scope: !62)
!65 = !DILocation(line: 134, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !3, file: !3, line: 25, type: !67, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!67 = !DISubroutineType(types: !68)
!68 = !{!9}
!69 = !DILocation(line: 27, column: 5, scope: !66)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 66, type: !4, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!71 = !DILocalVariable(name: "data", scope: !70, file: !3, line: 68, type: !8)
!72 = !DILocation(line: 68, column: 11, scope: !70)
!73 = !DILocation(line: 69, column: 10, scope: !70)
!74 = !DILocation(line: 70, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !3, line: 70, column: 8)
!76 = !DILocation(line: 70, column: 8, scope: !70)
!77 = !DILocation(line: 73, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !3, line: 71, column: 5)
!79 = !DILocation(line: 74, column: 5, scope: !78)
!80 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !3, line: 79, type: !8)
!81 = distinct !DILexicalBlock(scope: !82, file: !3, line: 77, column: 9)
!82 = distinct !DILexicalBlock(scope: !75, file: !3, line: 76, column: 5)
!83 = !DILocation(line: 79, column: 19, scope: !81)
!84 = !DILocation(line: 79, column: 39, scope: !81)
!85 = !DILocation(line: 79, column: 32, scope: !81)
!86 = !DILocation(line: 80, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !3, line: 80, column: 17)
!88 = !DILocation(line: 80, column: 28, scope: !87)
!89 = !DILocation(line: 80, column: 17, scope: !81)
!90 = !DILocation(line: 82, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !3, line: 81, column: 13)
!92 = !DILocation(line: 83, column: 17, scope: !91)
!93 = !DILocalVariable(name: "i", scope: !94, file: !3, line: 86, type: !34)
!94 = distinct !DILexicalBlock(scope: !81, file: !3, line: 85, column: 13)
!95 = !DILocation(line: 86, column: 24, scope: !94)
!96 = !DILocation(line: 87, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !3, line: 87, column: 17)
!98 = !DILocation(line: 87, column: 22, scope: !97)
!99 = !DILocation(line: 87, column: 29, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !3, line: 87, column: 17)
!101 = !DILocation(line: 87, column: 31, scope: !100)
!102 = !DILocation(line: 87, column: 17, scope: !97)
!103 = !DILocation(line: 89, column: 21, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !3, line: 88, column: 17)
!105 = !DILocation(line: 89, column: 32, scope: !104)
!106 = !DILocation(line: 89, column: 35, scope: !104)
!107 = !DILocation(line: 90, column: 17, scope: !104)
!108 = !DILocation(line: 87, column: 39, scope: !100)
!109 = !DILocation(line: 87, column: 17, scope: !100)
!110 = distinct !{!110, !102, !111, !54}
!111 = !DILocation(line: 90, column: 17, scope: !97)
!112 = !DILocation(line: 92, column: 20, scope: !81)
!113 = !DILocation(line: 92, column: 18, scope: !81)
!114 = !DILocation(line: 95, column: 18, scope: !70)
!115 = !DILocation(line: 95, column: 5, scope: !70)
!116 = !DILocation(line: 97, column: 10, scope: !70)
!117 = !DILocation(line: 97, column: 5, scope: !70)
!118 = !DILocation(line: 98, column: 1, scope: !70)
!119 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !3, file: !3, line: 30, type: !67, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!120 = !DILocation(line: 32, column: 5, scope: !119)
!121 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 101, type: !4, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!122 = !DILocalVariable(name: "data", scope: !121, file: !3, line: 103, type: !8)
!123 = !DILocation(line: 103, column: 11, scope: !121)
!124 = !DILocation(line: 104, column: 10, scope: !121)
!125 = !DILocation(line: 105, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !121, file: !3, line: 105, column: 8)
!127 = !DILocation(line: 105, column: 8, scope: !121)
!128 = !DILocalVariable(name: "dataBuffer", scope: !129, file: !3, line: 109, type: !8)
!129 = distinct !DILexicalBlock(scope: !130, file: !3, line: 107, column: 9)
!130 = distinct !DILexicalBlock(scope: !126, file: !3, line: 106, column: 5)
!131 = !DILocation(line: 109, column: 19, scope: !129)
!132 = !DILocation(line: 109, column: 39, scope: !129)
!133 = !DILocation(line: 109, column: 32, scope: !129)
!134 = !DILocation(line: 110, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !3, line: 110, column: 17)
!136 = !DILocation(line: 110, column: 28, scope: !135)
!137 = !DILocation(line: 110, column: 17, scope: !129)
!138 = !DILocation(line: 112, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !3, line: 111, column: 13)
!140 = !DILocation(line: 113, column: 17, scope: !139)
!141 = !DILocalVariable(name: "i", scope: !142, file: !3, line: 116, type: !34)
!142 = distinct !DILexicalBlock(scope: !129, file: !3, line: 115, column: 13)
!143 = !DILocation(line: 116, column: 24, scope: !142)
!144 = !DILocation(line: 117, column: 24, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !3, line: 117, column: 17)
!146 = !DILocation(line: 117, column: 22, scope: !145)
!147 = !DILocation(line: 117, column: 29, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !3, line: 117, column: 17)
!149 = !DILocation(line: 117, column: 31, scope: !148)
!150 = !DILocation(line: 117, column: 17, scope: !145)
!151 = !DILocation(line: 119, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !3, line: 118, column: 17)
!153 = !DILocation(line: 119, column: 32, scope: !152)
!154 = !DILocation(line: 119, column: 35, scope: !152)
!155 = !DILocation(line: 120, column: 17, scope: !152)
!156 = !DILocation(line: 117, column: 39, scope: !148)
!157 = !DILocation(line: 117, column: 17, scope: !148)
!158 = distinct !{!158, !150, !159, !54}
!159 = !DILocation(line: 120, column: 17, scope: !145)
!160 = !DILocation(line: 122, column: 20, scope: !129)
!161 = !DILocation(line: 122, column: 18, scope: !129)
!162 = !DILocation(line: 124, column: 5, scope: !130)
!163 = !DILocation(line: 125, column: 18, scope: !121)
!164 = !DILocation(line: 125, column: 5, scope: !121)
!165 = !DILocation(line: 127, column: 10, scope: !121)
!166 = !DILocation(line: 127, column: 5, scope: !121)
!167 = !DILocation(line: 128, column: 1, scope: !121)
