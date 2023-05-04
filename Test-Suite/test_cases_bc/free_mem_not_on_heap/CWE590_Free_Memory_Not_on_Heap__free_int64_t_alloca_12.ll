; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_12.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_12_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %dataBuffer1 = alloca i64*, align 8
  %i5 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.else, !dbg !27

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
  br label %if.end13, !dbg !59

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer1, metadata !60, metadata !DIExpression()), !dbg !63
  %call2 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !64
  %7 = bitcast i8* %call2 to i64*, !dbg !65
  store i64* %7, i64** %dataBuffer1, align 8, !dbg !63
  %8 = load i64*, i64** %dataBuffer1, align 8, !dbg !66
  %cmp3 = icmp eq i64* %8, null, !dbg !68
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !69

if.then4:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @exit(i32 noundef 1) #6, !dbg !72
  unreachable, !dbg !72

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i5, metadata !73, metadata !DIExpression()), !dbg !75
  store i64 0, i64* %i5, align 8, !dbg !76
  br label %for.cond6, !dbg !78

for.cond6:                                        ; preds = %for.inc10, %if.end
  %9 = load i64, i64* %i5, align 8, !dbg !79
  %cmp7 = icmp ult i64 %9, 100, !dbg !81
  br i1 %cmp7, label %for.body8, label %for.end12, !dbg !82

for.body8:                                        ; preds = %for.cond6
  %10 = load i64*, i64** %dataBuffer1, align 8, !dbg !83
  %11 = load i64, i64* %i5, align 8, !dbg !85
  %arrayidx9 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !83
  store i64 5, i64* %arrayidx9, align 8, !dbg !86
  br label %for.inc10, !dbg !87

for.inc10:                                        ; preds = %for.body8
  %12 = load i64, i64* %i5, align 8, !dbg !88
  %inc11 = add i64 %12, 1, !dbg !88
  store i64 %inc11, i64* %i5, align 8, !dbg !88
  br label %for.cond6, !dbg !89, !llvm.loop !90

for.end12:                                        ; preds = %for.cond6
  %13 = load i64*, i64** %dataBuffer1, align 8, !dbg !92
  store i64* %13, i64** %data, align 8, !dbg !93
  br label %if.end13

if.end13:                                         ; preds = %for.end12, %for.end
  %14 = load i64*, i64** %data, align 8, !dbg !94
  %arrayidx14 = getelementptr inbounds i64, i64* %14, i64 0, !dbg !94
  %15 = load i64, i64* %arrayidx14, align 8, !dbg !94
  call void @printLongLongLine(i64 noundef %15), !dbg !95
  %16 = load i64*, i64** %data, align 8, !dbg !96
  %17 = bitcast i64* %16 to i8*, !dbg !96
  call void @free(i8* noundef %17) #5, !dbg !97
  ret void, !dbg !98
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_12_good() #0 !dbg !99 {
entry:
  call void @goodG2B(), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !102 {
entry:
  %data = alloca i64*, align 8
  %dataBuffer = alloca i64*, align 8
  %i = alloca i64, align 8
  %dataBuffer4 = alloca i64*, align 8
  %i9 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !103, metadata !DIExpression()), !dbg !104
  store i64* null, i64** %data, align 8, !dbg !105
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !106
  %tobool = icmp ne i32 %call, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !112
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !113
  %0 = bitcast i8* %call1 to i64*, !dbg !114
  store i64* %0, i64** %dataBuffer, align 8, !dbg !112
  %1 = load i64*, i64** %dataBuffer, align 8, !dbg !115
  %cmp = icmp eq i64* %1, null, !dbg !117
  br i1 %cmp, label %if.then2, label %if.end, !dbg !118

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !119
  call void @exit(i32 noundef 1) #6, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !128
  %cmp3 = icmp ult i64 %2, 100, !dbg !130
  br i1 %cmp3, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %3 = load i64*, i64** %dataBuffer, align 8, !dbg !132
  %4 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %4, !dbg !132
  store i64 5, i64* %arrayidx, align 8, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %5, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %6 = load i64*, i64** %dataBuffer, align 8, !dbg !141
  store i64* %6, i64** %data, align 8, !dbg !142
  br label %if.end17, !dbg !143

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64** %dataBuffer4, metadata !144, metadata !DIExpression()), !dbg !147
  %call5 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !148
  %7 = bitcast i8* %call5 to i64*, !dbg !149
  store i64* %7, i64** %dataBuffer4, align 8, !dbg !147
  %8 = load i64*, i64** %dataBuffer4, align 8, !dbg !150
  %cmp6 = icmp eq i64* %8, null, !dbg !152
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !153

if.then7:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !154
  call void @exit(i32 noundef 1) #6, !dbg !156
  unreachable, !dbg !156

if.end8:                                          ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i9, metadata !157, metadata !DIExpression()), !dbg !159
  store i64 0, i64* %i9, align 8, !dbg !160
  br label %for.cond10, !dbg !162

for.cond10:                                       ; preds = %for.inc14, %if.end8
  %9 = load i64, i64* %i9, align 8, !dbg !163
  %cmp11 = icmp ult i64 %9, 100, !dbg !165
  br i1 %cmp11, label %for.body12, label %for.end16, !dbg !166

for.body12:                                       ; preds = %for.cond10
  %10 = load i64*, i64** %dataBuffer4, align 8, !dbg !167
  %11 = load i64, i64* %i9, align 8, !dbg !169
  %arrayidx13 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !167
  store i64 5, i64* %arrayidx13, align 8, !dbg !170
  br label %for.inc14, !dbg !171

for.inc14:                                        ; preds = %for.body12
  %12 = load i64, i64* %i9, align 8, !dbg !172
  %inc15 = add i64 %12, 1, !dbg !172
  store i64 %inc15, i64* %i9, align 8, !dbg !172
  br label %for.cond10, !dbg !173, !llvm.loop !174

for.end16:                                        ; preds = %for.cond10
  %13 = load i64*, i64** %dataBuffer4, align 8, !dbg !176
  store i64* %13, i64** %data, align 8, !dbg !177
  br label %if.end17

if.end17:                                         ; preds = %for.end16, %for.end
  %14 = load i64*, i64** %data, align 8, !dbg !178
  %arrayidx18 = getelementptr inbounds i64, i64* %14, i64 0, !dbg !178
  %15 = load i64, i64* %arrayidx18, align 8, !dbg !178
  call void @printLongLongLine(i64 noundef %15), !dbg !179
  %16 = load i64*, i64** %data, align 8, !dbg !180
  %17 = bitcast i64* %16 to i8*, !dbg !180
  call void @free(i8* noundef %17) #5, !dbg !181
  ret void, !dbg !182
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_12.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "13ba990628a41455dd3d780f50eafe26")
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
!18 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_12_bad", scope: !1, file: !1, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
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
!60 = !DILocalVariable(name: "dataBuffer", scope: !61, file: !1, line: 46, type: !3)
!61 = distinct !DILexicalBlock(scope: !62, file: !1, line: 44, column: 9)
!62 = distinct !DILexicalBlock(scope: !26, file: !1, line: 43, column: 5)
!63 = !DILocation(line: 46, column: 23, scope: !61)
!64 = !DILocation(line: 46, column: 47, scope: !61)
!65 = !DILocation(line: 46, column: 36, scope: !61)
!66 = !DILocation(line: 47, column: 17, scope: !67)
!67 = distinct !DILexicalBlock(scope: !61, file: !1, line: 47, column: 17)
!68 = !DILocation(line: 47, column: 28, scope: !67)
!69 = !DILocation(line: 47, column: 17, scope: !61)
!70 = !DILocation(line: 49, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !1, line: 48, column: 13)
!72 = !DILocation(line: 50, column: 17, scope: !71)
!73 = !DILocalVariable(name: "i", scope: !74, file: !1, line: 53, type: !36)
!74 = distinct !DILexicalBlock(scope: !61, file: !1, line: 52, column: 13)
!75 = !DILocation(line: 53, column: 24, scope: !74)
!76 = !DILocation(line: 54, column: 24, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !1, line: 54, column: 17)
!78 = !DILocation(line: 54, column: 22, scope: !77)
!79 = !DILocation(line: 54, column: 29, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !1, line: 54, column: 17)
!81 = !DILocation(line: 54, column: 31, scope: !80)
!82 = !DILocation(line: 54, column: 17, scope: !77)
!83 = !DILocation(line: 56, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !1, line: 55, column: 17)
!85 = !DILocation(line: 56, column: 32, scope: !84)
!86 = !DILocation(line: 56, column: 35, scope: !84)
!87 = !DILocation(line: 57, column: 17, scope: !84)
!88 = !DILocation(line: 54, column: 39, scope: !80)
!89 = !DILocation(line: 54, column: 17, scope: !80)
!90 = distinct !{!90, !82, !91, !56}
!91 = !DILocation(line: 57, column: 17, scope: !77)
!92 = !DILocation(line: 59, column: 20, scope: !61)
!93 = !DILocation(line: 59, column: 18, scope: !61)
!94 = !DILocation(line: 62, column: 23, scope: !18)
!95 = !DILocation(line: 62, column: 5, scope: !18)
!96 = !DILocation(line: 64, column: 10, scope: !18)
!97 = !DILocation(line: 64, column: 5, scope: !18)
!98 = !DILocation(line: 65, column: 1, scope: !18)
!99 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_int64_t_alloca_12_good", scope: !1, file: !1, line: 122, type: !19, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!100 = !DILocation(line: 124, column: 5, scope: !99)
!101 = !DILocation(line: 125, column: 1, scope: !99)
!102 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 73, type: !19, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!103 = !DILocalVariable(name: "data", scope: !102, file: !1, line: 75, type: !3)
!104 = !DILocation(line: 75, column: 15, scope: !102)
!105 = !DILocation(line: 76, column: 10, scope: !102)
!106 = !DILocation(line: 77, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !1, line: 77, column: 8)
!108 = !DILocation(line: 77, column: 8, scope: !102)
!109 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !1, line: 81, type: !3)
!110 = distinct !DILexicalBlock(scope: !111, file: !1, line: 79, column: 9)
!111 = distinct !DILexicalBlock(scope: !107, file: !1, line: 78, column: 5)
!112 = !DILocation(line: 81, column: 23, scope: !110)
!113 = !DILocation(line: 81, column: 47, scope: !110)
!114 = !DILocation(line: 81, column: 36, scope: !110)
!115 = !DILocation(line: 82, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !1, line: 82, column: 17)
!117 = !DILocation(line: 82, column: 28, scope: !116)
!118 = !DILocation(line: 82, column: 17, scope: !110)
!119 = !DILocation(line: 84, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !1, line: 83, column: 13)
!121 = !DILocation(line: 85, column: 17, scope: !120)
!122 = !DILocalVariable(name: "i", scope: !123, file: !1, line: 88, type: !36)
!123 = distinct !DILexicalBlock(scope: !110, file: !1, line: 87, column: 13)
!124 = !DILocation(line: 88, column: 24, scope: !123)
!125 = !DILocation(line: 89, column: 24, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !1, line: 89, column: 17)
!127 = !DILocation(line: 89, column: 22, scope: !126)
!128 = !DILocation(line: 89, column: 29, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !1, line: 89, column: 17)
!130 = !DILocation(line: 89, column: 31, scope: !129)
!131 = !DILocation(line: 89, column: 17, scope: !126)
!132 = !DILocation(line: 91, column: 21, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !1, line: 90, column: 17)
!134 = !DILocation(line: 91, column: 32, scope: !133)
!135 = !DILocation(line: 91, column: 35, scope: !133)
!136 = !DILocation(line: 92, column: 17, scope: !133)
!137 = !DILocation(line: 89, column: 39, scope: !129)
!138 = !DILocation(line: 89, column: 17, scope: !129)
!139 = distinct !{!139, !131, !140, !56}
!140 = !DILocation(line: 92, column: 17, scope: !126)
!141 = !DILocation(line: 94, column: 20, scope: !110)
!142 = !DILocation(line: 94, column: 18, scope: !110)
!143 = !DILocation(line: 96, column: 5, scope: !111)
!144 = !DILocalVariable(name: "dataBuffer", scope: !145, file: !1, line: 101, type: !3)
!145 = distinct !DILexicalBlock(scope: !146, file: !1, line: 99, column: 9)
!146 = distinct !DILexicalBlock(scope: !107, file: !1, line: 98, column: 5)
!147 = !DILocation(line: 101, column: 23, scope: !145)
!148 = !DILocation(line: 101, column: 47, scope: !145)
!149 = !DILocation(line: 101, column: 36, scope: !145)
!150 = !DILocation(line: 102, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !145, file: !1, line: 102, column: 17)
!152 = !DILocation(line: 102, column: 28, scope: !151)
!153 = !DILocation(line: 102, column: 17, scope: !145)
!154 = !DILocation(line: 104, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !1, line: 103, column: 13)
!156 = !DILocation(line: 105, column: 17, scope: !155)
!157 = !DILocalVariable(name: "i", scope: !158, file: !1, line: 108, type: !36)
!158 = distinct !DILexicalBlock(scope: !145, file: !1, line: 107, column: 13)
!159 = !DILocation(line: 108, column: 24, scope: !158)
!160 = !DILocation(line: 109, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !1, line: 109, column: 17)
!162 = !DILocation(line: 109, column: 22, scope: !161)
!163 = !DILocation(line: 109, column: 29, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !1, line: 109, column: 17)
!165 = !DILocation(line: 109, column: 31, scope: !164)
!166 = !DILocation(line: 109, column: 17, scope: !161)
!167 = !DILocation(line: 111, column: 21, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !1, line: 110, column: 17)
!169 = !DILocation(line: 111, column: 32, scope: !168)
!170 = !DILocation(line: 111, column: 35, scope: !168)
!171 = !DILocation(line: 112, column: 17, scope: !168)
!172 = !DILocation(line: 109, column: 39, scope: !164)
!173 = !DILocation(line: 109, column: 17, scope: !164)
!174 = distinct !{!174, !166, !175, !56}
!175 = !DILocation(line: 112, column: 17, scope: !161)
!176 = !DILocation(line: 114, column: 20, scope: !145)
!177 = !DILocation(line: 114, column: 18, scope: !145)
!178 = !DILocation(line: 117, column: 23, scope: !102)
!179 = !DILocation(line: 117, column: 5, scope: !102)
!180 = !DILocation(line: 119, column: 10, scope: !102)
!181 = !DILocation(line: 119, column: 5, scope: !102)
!182 = !DILocation(line: 120, column: 1, scope: !102)
