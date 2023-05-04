; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_12.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_12_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  %dataBuffer2 = alloca %struct._twoIntsStruct*, align 8
  %i6 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !33
  %0 = alloca i8, i64 800, align 16, !dbg !34
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !35
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %2, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !49
  %4 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !49
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !52
  store i32 1, i32* %intOne, align 4, !dbg !53
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !54
  %6 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !54
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !56
  store i32 1, i32* %intTwo, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %7, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !64
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !65
  br label %if.end17, !dbg !66

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer2, metadata !67, metadata !DIExpression()), !dbg !70
  %call3 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !71
  %9 = bitcast i8* %call3 to %struct._twoIntsStruct*, !dbg !72
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %dataBuffer2, align 8, !dbg !70
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer2, align 8, !dbg !73
  %cmp4 = icmp eq %struct._twoIntsStruct* %10, null, !dbg !75
  br i1 %cmp4, label %if.then5, label %if.end, !dbg !76

if.then5:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @exit(i32 noundef 1) #6, !dbg !79
  unreachable, !dbg !79

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i6, metadata !80, metadata !DIExpression()), !dbg !82
  store i64 0, i64* %i6, align 8, !dbg !83
  br label %for.cond7, !dbg !85

for.cond7:                                        ; preds = %for.inc14, %if.end
  %11 = load i64, i64* %i6, align 8, !dbg !86
  %cmp8 = icmp ult i64 %11, 100, !dbg !88
  br i1 %cmp8, label %for.body9, label %for.end16, !dbg !89

for.body9:                                        ; preds = %for.cond7
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer2, align 8, !dbg !90
  %13 = load i64, i64* %i6, align 8, !dbg !92
  %arrayidx10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 %13, !dbg !90
  %intOne11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx10, i32 0, i32 0, !dbg !93
  store i32 1, i32* %intOne11, align 4, !dbg !94
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer2, align 8, !dbg !95
  %15 = load i64, i64* %i6, align 8, !dbg !96
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 %15, !dbg !95
  %intTwo13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx12, i32 0, i32 1, !dbg !97
  store i32 1, i32* %intTwo13, align 4, !dbg !98
  br label %for.inc14, !dbg !99

for.inc14:                                        ; preds = %for.body9
  %16 = load i64, i64* %i6, align 8, !dbg !100
  %inc15 = add i64 %16, 1, !dbg !100
  store i64 %inc15, i64* %i6, align 8, !dbg !100
  br label %for.cond7, !dbg !101, !llvm.loop !102

for.end16:                                        ; preds = %for.cond7
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer2, align 8, !dbg !104
  store %struct._twoIntsStruct* %17, %struct._twoIntsStruct** %data, align 8, !dbg !105
  br label %if.end17

if.end17:                                         ; preds = %for.end16, %for.end
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !106
  %arrayidx18 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %18, i64 0, !dbg !106
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx18), !dbg !107
  %19 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !108
  %20 = bitcast %struct._twoIntsStruct* %19 to i8*, !dbg !108
  call void @free(i8* noundef %20) #5, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_12_good() #0 !dbg !111 {
entry:
  call void @goodG2B(), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !114 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  %dataBuffer5 = alloca %struct._twoIntsStruct*, align 8
  %i10 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !115, metadata !DIExpression()), !dbg !116
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !117
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !118
  %tobool = icmp ne i32 %call, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.else, !dbg !120

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !121, metadata !DIExpression()), !dbg !124
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !125
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !126
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !124
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !127
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !129
  br i1 %cmp, label %if.then2, label %if.end, !dbg !130

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !131
  call void @exit(i32 noundef 1) #6, !dbg !133
  unreachable, !dbg !133

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !140
  %cmp3 = icmp ult i64 %2, 100, !dbg !142
  br i1 %cmp3, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !144
  %4 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !144
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !147
  store i32 1, i32* %intOne, align 4, !dbg !148
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !149
  %6 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !149
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !151
  store i32 1, i32* %intTwo, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %7, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !158
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !159
  br label %if.end21, !dbg !160

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer5, metadata !161, metadata !DIExpression()), !dbg !164
  %call6 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !165
  %9 = bitcast i8* %call6 to %struct._twoIntsStruct*, !dbg !166
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %dataBuffer5, align 8, !dbg !164
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer5, align 8, !dbg !167
  %cmp7 = icmp eq %struct._twoIntsStruct* %10, null, !dbg !169
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !170

if.then8:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !171
  call void @exit(i32 noundef 1) #6, !dbg !173
  unreachable, !dbg !173

if.end9:                                          ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i10, metadata !174, metadata !DIExpression()), !dbg !176
  store i64 0, i64* %i10, align 8, !dbg !177
  br label %for.cond11, !dbg !179

for.cond11:                                       ; preds = %for.inc18, %if.end9
  %11 = load i64, i64* %i10, align 8, !dbg !180
  %cmp12 = icmp ult i64 %11, 100, !dbg !182
  br i1 %cmp12, label %for.body13, label %for.end20, !dbg !183

for.body13:                                       ; preds = %for.cond11
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer5, align 8, !dbg !184
  %13 = load i64, i64* %i10, align 8, !dbg !186
  %arrayidx14 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 %13, !dbg !184
  %intOne15 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx14, i32 0, i32 0, !dbg !187
  store i32 1, i32* %intOne15, align 4, !dbg !188
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer5, align 8, !dbg !189
  %15 = load i64, i64* %i10, align 8, !dbg !190
  %arrayidx16 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 %15, !dbg !189
  %intTwo17 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx16, i32 0, i32 1, !dbg !191
  store i32 1, i32* %intTwo17, align 4, !dbg !192
  br label %for.inc18, !dbg !193

for.inc18:                                        ; preds = %for.body13
  %16 = load i64, i64* %i10, align 8, !dbg !194
  %inc19 = add i64 %16, 1, !dbg !194
  store i64 %inc19, i64* %i10, align 8, !dbg !194
  br label %for.cond11, !dbg !195, !llvm.loop !196

for.end20:                                        ; preds = %for.cond11
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer5, align 8, !dbg !198
  store %struct._twoIntsStruct* %17, %struct._twoIntsStruct** %data, align 8, !dbg !199
  br label %if.end21

if.end21:                                         ; preds = %for.end20, %for.end
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !200
  %arrayidx22 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %18, i64 0, !dbg !200
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx22), !dbg !201
  %19 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !202
  %20 = bitcast %struct._twoIntsStruct* %19 to i8*, !dbg !202
  call void @free(i8* noundef %20) #5, !dbg !203
  ret void, !dbg !204
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_12.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "b7ffdcbc34145dfcf43724b0b67497fb")
!2 = !{!3, !11}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !5, line: 100, baseType: !6)
!5 = !DIFile(filename: "./std_testcase.h", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1dccefb0310558c17683ded20b0d6982")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !5, line: 96, size: 64, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !6, file: !5, line: 98, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !6, file: !5, line: 99, baseType: !9, size: 32, offset: 32)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{i32 7, !"Dwarf Version", i32 5}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"PIE Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_12_bad", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 25, type: !3)
!25 = !DILocation(line: 25, column: 21, scope: !20)
!26 = !DILocation(line: 26, column: 10, scope: !20)
!27 = !DILocation(line: 27, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !1, line: 27, column: 8)
!29 = !DILocation(line: 27, column: 8, scope: !20)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !1, line: 31, type: !3)
!31 = distinct !DILexicalBlock(scope: !32, file: !1, line: 29, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !1, line: 28, column: 5)
!33 = !DILocation(line: 31, column: 29, scope: !31)
!34 = !DILocation(line: 31, column: 59, scope: !31)
!35 = !DILocation(line: 31, column: 42, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !37, file: !1, line: 33, type: !38)
!37 = distinct !DILexicalBlock(scope: !31, file: !1, line: 32, column: 13)
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
!49 = !DILocation(line: 36, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 35, column: 17)
!51 = !DILocation(line: 36, column: 32, scope: !50)
!52 = !DILocation(line: 36, column: 35, scope: !50)
!53 = !DILocation(line: 36, column: 42, scope: !50)
!54 = !DILocation(line: 37, column: 21, scope: !50)
!55 = !DILocation(line: 37, column: 32, scope: !50)
!56 = !DILocation(line: 37, column: 35, scope: !50)
!57 = !DILocation(line: 37, column: 42, scope: !50)
!58 = !DILocation(line: 38, column: 17, scope: !50)
!59 = !DILocation(line: 34, column: 39, scope: !46)
!60 = !DILocation(line: 34, column: 17, scope: !46)
!61 = distinct !{!61, !48, !62, !63}
!62 = !DILocation(line: 38, column: 17, scope: !43)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 40, column: 20, scope: !31)
!65 = !DILocation(line: 40, column: 18, scope: !31)
!66 = !DILocation(line: 42, column: 5, scope: !32)
!67 = !DILocalVariable(name: "dataBuffer", scope: !68, file: !1, line: 47, type: !3)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 45, column: 9)
!69 = distinct !DILexicalBlock(scope: !28, file: !1, line: 44, column: 5)
!70 = !DILocation(line: 47, column: 29, scope: !68)
!71 = !DILocation(line: 47, column: 59, scope: !68)
!72 = !DILocation(line: 47, column: 42, scope: !68)
!73 = !DILocation(line: 48, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !68, file: !1, line: 48, column: 17)
!75 = !DILocation(line: 48, column: 28, scope: !74)
!76 = !DILocation(line: 48, column: 17, scope: !68)
!77 = !DILocation(line: 50, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !1, line: 49, column: 13)
!79 = !DILocation(line: 51, column: 17, scope: !78)
!80 = !DILocalVariable(name: "i", scope: !81, file: !1, line: 54, type: !38)
!81 = distinct !DILexicalBlock(scope: !68, file: !1, line: 53, column: 13)
!82 = !DILocation(line: 54, column: 24, scope: !81)
!83 = !DILocation(line: 55, column: 24, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !1, line: 55, column: 17)
!85 = !DILocation(line: 55, column: 22, scope: !84)
!86 = !DILocation(line: 55, column: 29, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !1, line: 55, column: 17)
!88 = !DILocation(line: 55, column: 31, scope: !87)
!89 = !DILocation(line: 55, column: 17, scope: !84)
!90 = !DILocation(line: 57, column: 21, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !1, line: 56, column: 17)
!92 = !DILocation(line: 57, column: 32, scope: !91)
!93 = !DILocation(line: 57, column: 35, scope: !91)
!94 = !DILocation(line: 57, column: 42, scope: !91)
!95 = !DILocation(line: 58, column: 21, scope: !91)
!96 = !DILocation(line: 58, column: 32, scope: !91)
!97 = !DILocation(line: 58, column: 35, scope: !91)
!98 = !DILocation(line: 58, column: 42, scope: !91)
!99 = !DILocation(line: 59, column: 17, scope: !91)
!100 = !DILocation(line: 55, column: 39, scope: !87)
!101 = !DILocation(line: 55, column: 17, scope: !87)
!102 = distinct !{!102, !89, !103, !63}
!103 = !DILocation(line: 59, column: 17, scope: !84)
!104 = !DILocation(line: 61, column: 20, scope: !68)
!105 = !DILocation(line: 61, column: 18, scope: !68)
!106 = !DILocation(line: 64, column: 22, scope: !20)
!107 = !DILocation(line: 64, column: 5, scope: !20)
!108 = !DILocation(line: 66, column: 10, scope: !20)
!109 = !DILocation(line: 66, column: 5, scope: !20)
!110 = !DILocation(line: 67, column: 1, scope: !20)
!111 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_12_good", scope: !1, file: !1, line: 126, type: !21, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!112 = !DILocation(line: 128, column: 5, scope: !111)
!113 = !DILocation(line: 129, column: 1, scope: !111)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 75, type: !21, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!115 = !DILocalVariable(name: "data", scope: !114, file: !1, line: 77, type: !3)
!116 = !DILocation(line: 77, column: 21, scope: !114)
!117 = !DILocation(line: 78, column: 10, scope: !114)
!118 = !DILocation(line: 79, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !114, file: !1, line: 79, column: 8)
!120 = !DILocation(line: 79, column: 8, scope: !114)
!121 = !DILocalVariable(name: "dataBuffer", scope: !122, file: !1, line: 83, type: !3)
!122 = distinct !DILexicalBlock(scope: !123, file: !1, line: 81, column: 9)
!123 = distinct !DILexicalBlock(scope: !119, file: !1, line: 80, column: 5)
!124 = !DILocation(line: 83, column: 29, scope: !122)
!125 = !DILocation(line: 83, column: 59, scope: !122)
!126 = !DILocation(line: 83, column: 42, scope: !122)
!127 = !DILocation(line: 84, column: 17, scope: !128)
!128 = distinct !DILexicalBlock(scope: !122, file: !1, line: 84, column: 17)
!129 = !DILocation(line: 84, column: 28, scope: !128)
!130 = !DILocation(line: 84, column: 17, scope: !122)
!131 = !DILocation(line: 86, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !1, line: 85, column: 13)
!133 = !DILocation(line: 87, column: 17, scope: !132)
!134 = !DILocalVariable(name: "i", scope: !135, file: !1, line: 90, type: !38)
!135 = distinct !DILexicalBlock(scope: !122, file: !1, line: 89, column: 13)
!136 = !DILocation(line: 90, column: 24, scope: !135)
!137 = !DILocation(line: 91, column: 24, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !1, line: 91, column: 17)
!139 = !DILocation(line: 91, column: 22, scope: !138)
!140 = !DILocation(line: 91, column: 29, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !1, line: 91, column: 17)
!142 = !DILocation(line: 91, column: 31, scope: !141)
!143 = !DILocation(line: 91, column: 17, scope: !138)
!144 = !DILocation(line: 93, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !1, line: 92, column: 17)
!146 = !DILocation(line: 93, column: 32, scope: !145)
!147 = !DILocation(line: 93, column: 35, scope: !145)
!148 = !DILocation(line: 93, column: 42, scope: !145)
!149 = !DILocation(line: 94, column: 21, scope: !145)
!150 = !DILocation(line: 94, column: 32, scope: !145)
!151 = !DILocation(line: 94, column: 35, scope: !145)
!152 = !DILocation(line: 94, column: 42, scope: !145)
!153 = !DILocation(line: 95, column: 17, scope: !145)
!154 = !DILocation(line: 91, column: 39, scope: !141)
!155 = !DILocation(line: 91, column: 17, scope: !141)
!156 = distinct !{!156, !143, !157, !63}
!157 = !DILocation(line: 95, column: 17, scope: !138)
!158 = !DILocation(line: 97, column: 20, scope: !122)
!159 = !DILocation(line: 97, column: 18, scope: !122)
!160 = !DILocation(line: 99, column: 5, scope: !123)
!161 = !DILocalVariable(name: "dataBuffer", scope: !162, file: !1, line: 104, type: !3)
!162 = distinct !DILexicalBlock(scope: !163, file: !1, line: 102, column: 9)
!163 = distinct !DILexicalBlock(scope: !119, file: !1, line: 101, column: 5)
!164 = !DILocation(line: 104, column: 29, scope: !162)
!165 = !DILocation(line: 104, column: 59, scope: !162)
!166 = !DILocation(line: 104, column: 42, scope: !162)
!167 = !DILocation(line: 105, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !162, file: !1, line: 105, column: 17)
!169 = !DILocation(line: 105, column: 28, scope: !168)
!170 = !DILocation(line: 105, column: 17, scope: !162)
!171 = !DILocation(line: 107, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !1, line: 106, column: 13)
!173 = !DILocation(line: 108, column: 17, scope: !172)
!174 = !DILocalVariable(name: "i", scope: !175, file: !1, line: 111, type: !38)
!175 = distinct !DILexicalBlock(scope: !162, file: !1, line: 110, column: 13)
!176 = !DILocation(line: 111, column: 24, scope: !175)
!177 = !DILocation(line: 112, column: 24, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !1, line: 112, column: 17)
!179 = !DILocation(line: 112, column: 22, scope: !178)
!180 = !DILocation(line: 112, column: 29, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !1, line: 112, column: 17)
!182 = !DILocation(line: 112, column: 31, scope: !181)
!183 = !DILocation(line: 112, column: 17, scope: !178)
!184 = !DILocation(line: 114, column: 21, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !1, line: 113, column: 17)
!186 = !DILocation(line: 114, column: 32, scope: !185)
!187 = !DILocation(line: 114, column: 35, scope: !185)
!188 = !DILocation(line: 114, column: 42, scope: !185)
!189 = !DILocation(line: 115, column: 21, scope: !185)
!190 = !DILocation(line: 115, column: 32, scope: !185)
!191 = !DILocation(line: 115, column: 35, scope: !185)
!192 = !DILocation(line: 115, column: 42, scope: !185)
!193 = !DILocation(line: 116, column: 17, scope: !185)
!194 = !DILocation(line: 112, column: 39, scope: !181)
!195 = !DILocation(line: 112, column: 17, scope: !181)
!196 = distinct !{!196, !183, !197, !63}
!197 = !DILocation(line: 116, column: 17, scope: !178)
!198 = !DILocation(line: 118, column: 20, scope: !162)
!199 = !DILocation(line: 118, column: 18, scope: !162)
!200 = !DILocation(line: 121, column: 22, scope: !114)
!201 = !DILocation(line: 121, column: 5, scope: !114)
!202 = !DILocation(line: 123, column: 10, scope: !114)
!203 = !DILocation(line: 123, column: 5, scope: !114)
!204 = !DILocation(line: 124, column: 1, scope: !114)
