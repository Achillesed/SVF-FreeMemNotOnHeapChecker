; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_12.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_12_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %dataBuffer2 = alloca %struct._twoIntsStruct*, align 8
  %i6 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %0, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %1, !dbg !52
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !53
  store i32 1, i32* %intOne, align 8, !dbg !54
  %2 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %2, !dbg !56
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !57
  store i32 1, i32* %intTwo, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %3, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 0, !dbg !65
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !66
  br label %if.end17, !dbg !67

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer2, metadata !68, metadata !DIExpression()), !dbg !71
  %call3 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !72
  %4 = bitcast i8* %call3 to %struct._twoIntsStruct*, !dbg !73
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %dataBuffer2, align 8, !dbg !71
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer2, align 8, !dbg !74
  %cmp4 = icmp eq %struct._twoIntsStruct* %5, null, !dbg !76
  br i1 %cmp4, label %if.then5, label %if.end, !dbg !77

if.then5:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @exit(i32 noundef 1) #6, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i6, metadata !81, metadata !DIExpression()), !dbg !83
  store i64 0, i64* %i6, align 8, !dbg !84
  br label %for.cond7, !dbg !86

for.cond7:                                        ; preds = %for.inc14, %if.end
  %6 = load i64, i64* %i6, align 8, !dbg !87
  %cmp8 = icmp ult i64 %6, 100, !dbg !89
  br i1 %cmp8, label %for.body9, label %for.end16, !dbg !90

for.body9:                                        ; preds = %for.cond7
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer2, align 8, !dbg !91
  %8 = load i64, i64* %i6, align 8, !dbg !93
  %arrayidx10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !91
  %intOne11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx10, i32 0, i32 0, !dbg !94
  store i32 1, i32* %intOne11, align 4, !dbg !95
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer2, align 8, !dbg !96
  %10 = load i64, i64* %i6, align 8, !dbg !97
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 %10, !dbg !96
  %intTwo13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx12, i32 0, i32 1, !dbg !98
  store i32 1, i32* %intTwo13, align 4, !dbg !99
  br label %for.inc14, !dbg !100

for.inc14:                                        ; preds = %for.body9
  %11 = load i64, i64* %i6, align 8, !dbg !101
  %inc15 = add i64 %11, 1, !dbg !101
  store i64 %inc15, i64* %i6, align 8, !dbg !101
  br label %for.cond7, !dbg !102, !llvm.loop !103

for.end16:                                        ; preds = %for.cond7
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer2, align 8, !dbg !105
  store %struct._twoIntsStruct* %12, %struct._twoIntsStruct** %data, align 8, !dbg !106
  br label %if.end17

if.end17:                                         ; preds = %for.end16, %for.end
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !107
  %arrayidx18 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !107
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx18), !dbg !108
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !109
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !109
  call void @free(i8* noundef %15) #5, !dbg !110
  ret void, !dbg !111
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_12_good() #0 !dbg !112 {
entry:
  call void @goodG2B(), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  %dataBuffer5 = alloca %struct._twoIntsStruct*, align 8
  %i10 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !116, metadata !DIExpression()), !dbg !117
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !118
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !119
  %tobool = icmp ne i32 %call, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.else, !dbg !121

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !122, metadata !DIExpression()), !dbg !125
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !126
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !127
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !125
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !128
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !130
  br i1 %cmp, label %if.then2, label %if.end, !dbg !131

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !132
  call void @exit(i32 noundef 1) #6, !dbg !134
  unreachable, !dbg !134

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !135, metadata !DIExpression()), !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !141
  %cmp3 = icmp ult i64 %2, 100, !dbg !143
  br i1 %cmp3, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !145
  %4 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !145
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !148
  store i32 1, i32* %intOne, align 4, !dbg !149
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !150
  %6 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !150
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !152
  store i32 1, i32* %intTwo, align 4, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %7, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !159
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !160
  br label %if.end21, !dbg !161

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer5, metadata !162, metadata !DIExpression()), !dbg !165
  %call6 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !166
  %9 = bitcast i8* %call6 to %struct._twoIntsStruct*, !dbg !167
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %dataBuffer5, align 8, !dbg !165
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer5, align 8, !dbg !168
  %cmp7 = icmp eq %struct._twoIntsStruct* %10, null, !dbg !170
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !171

if.then8:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !172
  call void @exit(i32 noundef 1) #6, !dbg !174
  unreachable, !dbg !174

if.end9:                                          ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i10, metadata !175, metadata !DIExpression()), !dbg !177
  store i64 0, i64* %i10, align 8, !dbg !178
  br label %for.cond11, !dbg !180

for.cond11:                                       ; preds = %for.inc18, %if.end9
  %11 = load i64, i64* %i10, align 8, !dbg !181
  %cmp12 = icmp ult i64 %11, 100, !dbg !183
  br i1 %cmp12, label %for.body13, label %for.end20, !dbg !184

for.body13:                                       ; preds = %for.cond11
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer5, align 8, !dbg !185
  %13 = load i64, i64* %i10, align 8, !dbg !187
  %arrayidx14 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 %13, !dbg !185
  %intOne15 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx14, i32 0, i32 0, !dbg !188
  store i32 1, i32* %intOne15, align 4, !dbg !189
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer5, align 8, !dbg !190
  %15 = load i64, i64* %i10, align 8, !dbg !191
  %arrayidx16 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 %15, !dbg !190
  %intTwo17 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx16, i32 0, i32 1, !dbg !192
  store i32 1, i32* %intTwo17, align 4, !dbg !193
  br label %for.inc18, !dbg !194

for.inc18:                                        ; preds = %for.body13
  %16 = load i64, i64* %i10, align 8, !dbg !195
  %inc19 = add i64 %16, 1, !dbg !195
  store i64 %inc19, i64* %i10, align 8, !dbg !195
  br label %for.cond11, !dbg !196, !llvm.loop !197

for.end20:                                        ; preds = %for.cond11
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer5, align 8, !dbg !199
  store %struct._twoIntsStruct* %17, %struct._twoIntsStruct** %data, align 8, !dbg !200
  br label %if.end21

if.end21:                                         ; preds = %for.end20, %for.end
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !201
  %arrayidx22 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %18, i64 0, !dbg !201
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx22), !dbg !202
  %19 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !203
  %20 = bitcast %struct._twoIntsStruct* %19 to i8*, !dbg !203
  call void @free(i8* noundef %20) #5, !dbg !204
  ret void, !dbg !205
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_12.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "f962deacf426eec1b3638c7de74c90c8")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_12_bad", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 25, type: !3)
!25 = !DILocation(line: 25, column: 21, scope: !20)
!26 = !DILocation(line: 26, column: 10, scope: !20)
!27 = !DILocation(line: 27, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !1, line: 27, column: 8)
!29 = !DILocation(line: 27, column: 8, scope: !20)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !1, line: 31, type: !33)
!31 = distinct !DILexicalBlock(scope: !32, file: !1, line: 29, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !1, line: 28, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 31, column: 27, scope: !31)
!37 = !DILocalVariable(name: "i", scope: !38, file: !1, line: 33, type: !39)
!38 = distinct !DILexicalBlock(scope: !31, file: !1, line: 32, column: 13)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 33, column: 24, scope: !38)
!43 = !DILocation(line: 34, column: 24, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !1, line: 34, column: 17)
!45 = !DILocation(line: 34, column: 22, scope: !44)
!46 = !DILocation(line: 34, column: 29, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !1, line: 34, column: 17)
!48 = !DILocation(line: 34, column: 31, scope: !47)
!49 = !DILocation(line: 34, column: 17, scope: !44)
!50 = !DILocation(line: 36, column: 32, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 35, column: 17)
!52 = !DILocation(line: 36, column: 21, scope: !51)
!53 = !DILocation(line: 36, column: 35, scope: !51)
!54 = !DILocation(line: 36, column: 42, scope: !51)
!55 = !DILocation(line: 37, column: 32, scope: !51)
!56 = !DILocation(line: 37, column: 21, scope: !51)
!57 = !DILocation(line: 37, column: 35, scope: !51)
!58 = !DILocation(line: 37, column: 42, scope: !51)
!59 = !DILocation(line: 38, column: 17, scope: !51)
!60 = !DILocation(line: 34, column: 39, scope: !47)
!61 = !DILocation(line: 34, column: 17, scope: !47)
!62 = distinct !{!62, !49, !63, !64}
!63 = !DILocation(line: 38, column: 17, scope: !44)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 40, column: 20, scope: !31)
!66 = !DILocation(line: 40, column: 18, scope: !31)
!67 = !DILocation(line: 42, column: 5, scope: !32)
!68 = !DILocalVariable(name: "dataBuffer", scope: !69, file: !1, line: 47, type: !3)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 45, column: 9)
!70 = distinct !DILexicalBlock(scope: !28, file: !1, line: 44, column: 5)
!71 = !DILocation(line: 47, column: 29, scope: !69)
!72 = !DILocation(line: 47, column: 59, scope: !69)
!73 = !DILocation(line: 47, column: 42, scope: !69)
!74 = !DILocation(line: 48, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !1, line: 48, column: 17)
!76 = !DILocation(line: 48, column: 28, scope: !75)
!77 = !DILocation(line: 48, column: 17, scope: !69)
!78 = !DILocation(line: 50, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !1, line: 49, column: 13)
!80 = !DILocation(line: 51, column: 17, scope: !79)
!81 = !DILocalVariable(name: "i", scope: !82, file: !1, line: 54, type: !39)
!82 = distinct !DILexicalBlock(scope: !69, file: !1, line: 53, column: 13)
!83 = !DILocation(line: 54, column: 24, scope: !82)
!84 = !DILocation(line: 55, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !1, line: 55, column: 17)
!86 = !DILocation(line: 55, column: 22, scope: !85)
!87 = !DILocation(line: 55, column: 29, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !1, line: 55, column: 17)
!89 = !DILocation(line: 55, column: 31, scope: !88)
!90 = !DILocation(line: 55, column: 17, scope: !85)
!91 = !DILocation(line: 57, column: 21, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !1, line: 56, column: 17)
!93 = !DILocation(line: 57, column: 32, scope: !92)
!94 = !DILocation(line: 57, column: 35, scope: !92)
!95 = !DILocation(line: 57, column: 42, scope: !92)
!96 = !DILocation(line: 58, column: 21, scope: !92)
!97 = !DILocation(line: 58, column: 32, scope: !92)
!98 = !DILocation(line: 58, column: 35, scope: !92)
!99 = !DILocation(line: 58, column: 42, scope: !92)
!100 = !DILocation(line: 59, column: 17, scope: !92)
!101 = !DILocation(line: 55, column: 39, scope: !88)
!102 = !DILocation(line: 55, column: 17, scope: !88)
!103 = distinct !{!103, !90, !104, !64}
!104 = !DILocation(line: 59, column: 17, scope: !85)
!105 = !DILocation(line: 61, column: 20, scope: !69)
!106 = !DILocation(line: 61, column: 18, scope: !69)
!107 = !DILocation(line: 64, column: 22, scope: !20)
!108 = !DILocation(line: 64, column: 5, scope: !20)
!109 = !DILocation(line: 66, column: 10, scope: !20)
!110 = !DILocation(line: 66, column: 5, scope: !20)
!111 = !DILocation(line: 67, column: 1, scope: !20)
!112 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_12_good", scope: !1, file: !1, line: 126, type: !21, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!113 = !DILocation(line: 128, column: 5, scope: !112)
!114 = !DILocation(line: 129, column: 1, scope: !112)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 75, type: !21, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!116 = !DILocalVariable(name: "data", scope: !115, file: !1, line: 77, type: !3)
!117 = !DILocation(line: 77, column: 21, scope: !115)
!118 = !DILocation(line: 78, column: 10, scope: !115)
!119 = !DILocation(line: 79, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !1, line: 79, column: 8)
!121 = !DILocation(line: 79, column: 8, scope: !115)
!122 = !DILocalVariable(name: "dataBuffer", scope: !123, file: !1, line: 83, type: !3)
!123 = distinct !DILexicalBlock(scope: !124, file: !1, line: 81, column: 9)
!124 = distinct !DILexicalBlock(scope: !120, file: !1, line: 80, column: 5)
!125 = !DILocation(line: 83, column: 29, scope: !123)
!126 = !DILocation(line: 83, column: 59, scope: !123)
!127 = !DILocation(line: 83, column: 42, scope: !123)
!128 = !DILocation(line: 84, column: 17, scope: !129)
!129 = distinct !DILexicalBlock(scope: !123, file: !1, line: 84, column: 17)
!130 = !DILocation(line: 84, column: 28, scope: !129)
!131 = !DILocation(line: 84, column: 17, scope: !123)
!132 = !DILocation(line: 86, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !1, line: 85, column: 13)
!134 = !DILocation(line: 87, column: 17, scope: !133)
!135 = !DILocalVariable(name: "i", scope: !136, file: !1, line: 90, type: !39)
!136 = distinct !DILexicalBlock(scope: !123, file: !1, line: 89, column: 13)
!137 = !DILocation(line: 90, column: 24, scope: !136)
!138 = !DILocation(line: 91, column: 24, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !1, line: 91, column: 17)
!140 = !DILocation(line: 91, column: 22, scope: !139)
!141 = !DILocation(line: 91, column: 29, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !1, line: 91, column: 17)
!143 = !DILocation(line: 91, column: 31, scope: !142)
!144 = !DILocation(line: 91, column: 17, scope: !139)
!145 = !DILocation(line: 93, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !1, line: 92, column: 17)
!147 = !DILocation(line: 93, column: 32, scope: !146)
!148 = !DILocation(line: 93, column: 35, scope: !146)
!149 = !DILocation(line: 93, column: 42, scope: !146)
!150 = !DILocation(line: 94, column: 21, scope: !146)
!151 = !DILocation(line: 94, column: 32, scope: !146)
!152 = !DILocation(line: 94, column: 35, scope: !146)
!153 = !DILocation(line: 94, column: 42, scope: !146)
!154 = !DILocation(line: 95, column: 17, scope: !146)
!155 = !DILocation(line: 91, column: 39, scope: !142)
!156 = !DILocation(line: 91, column: 17, scope: !142)
!157 = distinct !{!157, !144, !158, !64}
!158 = !DILocation(line: 95, column: 17, scope: !139)
!159 = !DILocation(line: 97, column: 20, scope: !123)
!160 = !DILocation(line: 97, column: 18, scope: !123)
!161 = !DILocation(line: 99, column: 5, scope: !124)
!162 = !DILocalVariable(name: "dataBuffer", scope: !163, file: !1, line: 104, type: !3)
!163 = distinct !DILexicalBlock(scope: !164, file: !1, line: 102, column: 9)
!164 = distinct !DILexicalBlock(scope: !120, file: !1, line: 101, column: 5)
!165 = !DILocation(line: 104, column: 29, scope: !163)
!166 = !DILocation(line: 104, column: 59, scope: !163)
!167 = !DILocation(line: 104, column: 42, scope: !163)
!168 = !DILocation(line: 105, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !163, file: !1, line: 105, column: 17)
!170 = !DILocation(line: 105, column: 28, scope: !169)
!171 = !DILocation(line: 105, column: 17, scope: !163)
!172 = !DILocation(line: 107, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !1, line: 106, column: 13)
!174 = !DILocation(line: 108, column: 17, scope: !173)
!175 = !DILocalVariable(name: "i", scope: !176, file: !1, line: 111, type: !39)
!176 = distinct !DILexicalBlock(scope: !163, file: !1, line: 110, column: 13)
!177 = !DILocation(line: 111, column: 24, scope: !176)
!178 = !DILocation(line: 112, column: 24, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !1, line: 112, column: 17)
!180 = !DILocation(line: 112, column: 22, scope: !179)
!181 = !DILocation(line: 112, column: 29, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !1, line: 112, column: 17)
!183 = !DILocation(line: 112, column: 31, scope: !182)
!184 = !DILocation(line: 112, column: 17, scope: !179)
!185 = !DILocation(line: 114, column: 21, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !1, line: 113, column: 17)
!187 = !DILocation(line: 114, column: 32, scope: !186)
!188 = !DILocation(line: 114, column: 35, scope: !186)
!189 = !DILocation(line: 114, column: 42, scope: !186)
!190 = !DILocation(line: 115, column: 21, scope: !186)
!191 = !DILocation(line: 115, column: 32, scope: !186)
!192 = !DILocation(line: 115, column: 35, scope: !186)
!193 = !DILocation(line: 115, column: 42, scope: !186)
!194 = !DILocation(line: 116, column: 17, scope: !186)
!195 = !DILocation(line: 112, column: 39, scope: !182)
!196 = !DILocation(line: 112, column: 17, scope: !182)
!197 = distinct !{!197, !184, !198, !64}
!198 = !DILocation(line: 116, column: 17, scope: !179)
!199 = !DILocation(line: 118, column: 20, scope: !163)
!200 = !DILocation(line: 118, column: 18, scope: !163)
!201 = !DILocation(line: 121, column: 22, scope: !115)
!202 = !DILocation(line: 121, column: 5, scope: !115)
!203 = !DILocation(line: 123, column: 10, scope: !115)
!204 = !DILocation(line: 123, column: 5, scope: !115)
!205 = !DILocation(line: 124, column: 1, scope: !115)
