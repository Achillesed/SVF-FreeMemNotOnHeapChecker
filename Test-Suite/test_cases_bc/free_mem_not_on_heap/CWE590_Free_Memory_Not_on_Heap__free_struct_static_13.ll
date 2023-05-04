; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_static_13.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_static_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@GLOBAL_CONST_FIVE = external constant i32, align 4
@CWE590_Free_Memory_Not_on_Heap__free_struct_static_13_bad.dataBuffer = internal global [100 x %struct._twoIntsStruct] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_13_bad() #0 !dbg !2 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !30, metadata !DIExpression()), !dbg !31
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !33
  %cmp = icmp eq i32 %0, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i64, i64* %i, align 8, !dbg !48
  %cmp1 = icmp ult i64 %1, 100, !dbg !50
  br i1 %cmp1, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_13_bad.dataBuffer, i64 0, i64 %2, !dbg !54
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !55
  store i32 1, i32* %intOne, align 8, !dbg !56
  %3 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_13_bad.dataBuffer, i64 0, i64 %3, !dbg !58
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !59
  store i32 1, i32* %intTwo, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %4, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  store %struct._twoIntsStruct* getelementptr inbounds ([100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_13_bad.dataBuffer, i64 0, i64 0), %struct._twoIntsStruct** %data, align 8, !dbg !67
  br label %if.end, !dbg !68

if.end:                                           ; preds = %for.end, %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !69
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 0, !dbg !69
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !70
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !71
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !71
  call void @free(i8* noundef %7) #5, !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_13_good() #0 !dbg !74 {
entry:
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !81
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !82
  %cmp = icmp ne i32 %0, 5, !dbg !84
  br i1 %cmp, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !86
  br label %if.end5, !dbg !88

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !89, metadata !DIExpression()), !dbg !92
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !93
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !94
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !92
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !95
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !97
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !98

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @exit(i32 noundef 1) #6, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !102, metadata !DIExpression()), !dbg !104
  store i64 0, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !107

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !108
  %cmp3 = icmp ult i64 %3, 100, !dbg !110
  br i1 %cmp3, label %for.body, label %for.end, !dbg !111

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !112
  %5 = load i64, i64* %i, align 8, !dbg !114
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !112
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !115
  store i32 1, i32* %intOne, align 4, !dbg !116
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !117
  %7 = load i64, i64* %i, align 8, !dbg !118
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !117
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !119
  store i32 1, i32* %intTwo, align 4, !dbg !120
  br label %for.inc, !dbg !121

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !122
  %inc = add i64 %8, 1, !dbg !122
  store i64 %inc, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !123, !llvm.loop !124

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !126
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !127
  br label %if.end5

if.end5:                                          ; preds = %for.end, %if.then
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !128
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !128
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx6), !dbg !129
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !130
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !130
  call void @free(i8* noundef %12) #5, !dbg !131
  ret void, !dbg !132
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !133 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !134, metadata !DIExpression()), !dbg !135
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !136
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !137
  %cmp = icmp eq i32 %0, 5, !dbg !139
  br i1 %cmp, label %if.then, label %if.end5, !dbg !140

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !141, metadata !DIExpression()), !dbg !144
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !145
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !146
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !144
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !147
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !149
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !150

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !151
  call void @exit(i32 noundef 1) #6, !dbg !153
  unreachable, !dbg !153

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !154, metadata !DIExpression()), !dbg !156
  store i64 0, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !160
  %cmp3 = icmp ult i64 %3, 100, !dbg !162
  br i1 %cmp3, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !164
  %5 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !164
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !167
  store i32 1, i32* %intOne, align 4, !dbg !168
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !169
  %7 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !169
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !171
  store i32 1, i32* %intTwo, align 4, !dbg !172
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !174
  %inc = add i64 %8, 1, !dbg !174
  store i64 %inc, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !175, !llvm.loop !176

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !178
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !179
  br label %if.end5, !dbg !180

if.end5:                                          ; preds = %for.end, %entry
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !181
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !181
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx6), !dbg !182
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !183
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !183
  call void @free(i8* noundef %12) #5, !dbg !184
  ret void, !dbg !185
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 31, type: !19, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_13_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_13.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "5a218017d532db365dce86a1679e2b7d")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !17, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !16}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !10, line: 100, baseType: !11)
!10 = !DIFile(filename: "./std_testcase.h", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1dccefb0310558c17683ded20b0d6982")
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !10, line: 96, size: 64, elements: !12)
!12 = !{!13, !15}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !11, file: !10, line: 98, baseType: !14, size: 32)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !11, file: !10, line: 99, baseType: !14, size: 32, offset: 32)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!17 = !{!0}
!18 = !{}
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 6400, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 100)
!22 = !{i32 7, !"Dwarf Version", i32 5}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"PIC Level", i32 2}
!26 = !{i32 7, !"PIE Level", i32 2}
!27 = !{i32 7, !"uwtable", i32 1}
!28 = !{i32 7, !"frame-pointer", i32 2}
!29 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!30 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 25, type: !8)
!31 = !DILocation(line: 25, column: 21, scope: !2)
!32 = !DILocation(line: 26, column: 10, scope: !2)
!33 = !DILocation(line: 27, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !2, file: !3, line: 27, column: 8)
!35 = !DILocation(line: 27, column: 25, scope: !34)
!36 = !DILocation(line: 27, column: 8, scope: !2)
!37 = !DILocalVariable(name: "i", scope: !38, file: !3, line: 33, type: !41)
!38 = distinct !DILexicalBlock(scope: !39, file: !3, line: 32, column: 13)
!39 = distinct !DILexicalBlock(scope: !40, file: !3, line: 29, column: 9)
!40 = distinct !DILexicalBlock(scope: !34, file: !3, line: 28, column: 5)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!43 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 33, column: 24, scope: !38)
!45 = !DILocation(line: 34, column: 24, scope: !46)
!46 = distinct !DILexicalBlock(scope: !38, file: !3, line: 34, column: 17)
!47 = !DILocation(line: 34, column: 22, scope: !46)
!48 = !DILocation(line: 34, column: 29, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !3, line: 34, column: 17)
!50 = !DILocation(line: 34, column: 31, scope: !49)
!51 = !DILocation(line: 34, column: 17, scope: !46)
!52 = !DILocation(line: 36, column: 32, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !3, line: 35, column: 17)
!54 = !DILocation(line: 36, column: 21, scope: !53)
!55 = !DILocation(line: 36, column: 35, scope: !53)
!56 = !DILocation(line: 36, column: 42, scope: !53)
!57 = !DILocation(line: 37, column: 32, scope: !53)
!58 = !DILocation(line: 37, column: 21, scope: !53)
!59 = !DILocation(line: 37, column: 35, scope: !53)
!60 = !DILocation(line: 37, column: 42, scope: !53)
!61 = !DILocation(line: 38, column: 17, scope: !53)
!62 = !DILocation(line: 34, column: 39, scope: !49)
!63 = !DILocation(line: 34, column: 17, scope: !49)
!64 = distinct !{!64, !51, !65, !66}
!65 = !DILocation(line: 38, column: 17, scope: !46)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 40, column: 18, scope: !39)
!68 = !DILocation(line: 42, column: 5, scope: !40)
!69 = !DILocation(line: 43, column: 22, scope: !2)
!70 = !DILocation(line: 43, column: 5, scope: !2)
!71 = !DILocation(line: 45, column: 10, scope: !2)
!72 = !DILocation(line: 45, column: 5, scope: !2)
!73 = !DILocation(line: 46, column: 1, scope: !2)
!74 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_13_good", scope: !3, file: !3, line: 119, type: !4, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!75 = !DILocation(line: 121, column: 5, scope: !74)
!76 = !DILocation(line: 122, column: 5, scope: !74)
!77 = !DILocation(line: 123, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 53, type: !4, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!79 = !DILocalVariable(name: "data", scope: !78, file: !3, line: 55, type: !8)
!80 = !DILocation(line: 55, column: 21, scope: !78)
!81 = !DILocation(line: 56, column: 10, scope: !78)
!82 = !DILocation(line: 57, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !3, line: 57, column: 8)
!84 = !DILocation(line: 57, column: 25, scope: !83)
!85 = !DILocation(line: 57, column: 8, scope: !78)
!86 = !DILocation(line: 60, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !3, line: 58, column: 5)
!88 = !DILocation(line: 61, column: 5, scope: !87)
!89 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !3, line: 66, type: !8)
!90 = distinct !DILexicalBlock(scope: !91, file: !3, line: 64, column: 9)
!91 = distinct !DILexicalBlock(scope: !83, file: !3, line: 63, column: 5)
!92 = !DILocation(line: 66, column: 29, scope: !90)
!93 = !DILocation(line: 66, column: 59, scope: !90)
!94 = !DILocation(line: 66, column: 42, scope: !90)
!95 = !DILocation(line: 67, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !3, line: 67, column: 17)
!97 = !DILocation(line: 67, column: 28, scope: !96)
!98 = !DILocation(line: 67, column: 17, scope: !90)
!99 = !DILocation(line: 69, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !3, line: 68, column: 13)
!101 = !DILocation(line: 70, column: 17, scope: !100)
!102 = !DILocalVariable(name: "i", scope: !103, file: !3, line: 73, type: !41)
!103 = distinct !DILexicalBlock(scope: !90, file: !3, line: 72, column: 13)
!104 = !DILocation(line: 73, column: 24, scope: !103)
!105 = !DILocation(line: 74, column: 24, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !3, line: 74, column: 17)
!107 = !DILocation(line: 74, column: 22, scope: !106)
!108 = !DILocation(line: 74, column: 29, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !3, line: 74, column: 17)
!110 = !DILocation(line: 74, column: 31, scope: !109)
!111 = !DILocation(line: 74, column: 17, scope: !106)
!112 = !DILocation(line: 76, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !3, line: 75, column: 17)
!114 = !DILocation(line: 76, column: 32, scope: !113)
!115 = !DILocation(line: 76, column: 35, scope: !113)
!116 = !DILocation(line: 76, column: 42, scope: !113)
!117 = !DILocation(line: 77, column: 21, scope: !113)
!118 = !DILocation(line: 77, column: 32, scope: !113)
!119 = !DILocation(line: 77, column: 35, scope: !113)
!120 = !DILocation(line: 77, column: 42, scope: !113)
!121 = !DILocation(line: 78, column: 17, scope: !113)
!122 = !DILocation(line: 74, column: 39, scope: !109)
!123 = !DILocation(line: 74, column: 17, scope: !109)
!124 = distinct !{!124, !111, !125, !66}
!125 = !DILocation(line: 78, column: 17, scope: !106)
!126 = !DILocation(line: 80, column: 20, scope: !90)
!127 = !DILocation(line: 80, column: 18, scope: !90)
!128 = !DILocation(line: 83, column: 22, scope: !78)
!129 = !DILocation(line: 83, column: 5, scope: !78)
!130 = !DILocation(line: 85, column: 10, scope: !78)
!131 = !DILocation(line: 85, column: 5, scope: !78)
!132 = !DILocation(line: 86, column: 1, scope: !78)
!133 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 89, type: !4, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!134 = !DILocalVariable(name: "data", scope: !133, file: !3, line: 91, type: !8)
!135 = !DILocation(line: 91, column: 21, scope: !133)
!136 = !DILocation(line: 92, column: 10, scope: !133)
!137 = !DILocation(line: 93, column: 8, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !3, line: 93, column: 8)
!139 = !DILocation(line: 93, column: 25, scope: !138)
!140 = !DILocation(line: 93, column: 8, scope: !133)
!141 = !DILocalVariable(name: "dataBuffer", scope: !142, file: !3, line: 97, type: !8)
!142 = distinct !DILexicalBlock(scope: !143, file: !3, line: 95, column: 9)
!143 = distinct !DILexicalBlock(scope: !138, file: !3, line: 94, column: 5)
!144 = !DILocation(line: 97, column: 29, scope: !142)
!145 = !DILocation(line: 97, column: 59, scope: !142)
!146 = !DILocation(line: 97, column: 42, scope: !142)
!147 = !DILocation(line: 98, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !3, line: 98, column: 17)
!149 = !DILocation(line: 98, column: 28, scope: !148)
!150 = !DILocation(line: 98, column: 17, scope: !142)
!151 = !DILocation(line: 100, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !3, line: 99, column: 13)
!153 = !DILocation(line: 101, column: 17, scope: !152)
!154 = !DILocalVariable(name: "i", scope: !155, file: !3, line: 104, type: !41)
!155 = distinct !DILexicalBlock(scope: !142, file: !3, line: 103, column: 13)
!156 = !DILocation(line: 104, column: 24, scope: !155)
!157 = !DILocation(line: 105, column: 24, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !3, line: 105, column: 17)
!159 = !DILocation(line: 105, column: 22, scope: !158)
!160 = !DILocation(line: 105, column: 29, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !3, line: 105, column: 17)
!162 = !DILocation(line: 105, column: 31, scope: !161)
!163 = !DILocation(line: 105, column: 17, scope: !158)
!164 = !DILocation(line: 107, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !3, line: 106, column: 17)
!166 = !DILocation(line: 107, column: 32, scope: !165)
!167 = !DILocation(line: 107, column: 35, scope: !165)
!168 = !DILocation(line: 107, column: 42, scope: !165)
!169 = !DILocation(line: 108, column: 21, scope: !165)
!170 = !DILocation(line: 108, column: 32, scope: !165)
!171 = !DILocation(line: 108, column: 35, scope: !165)
!172 = !DILocation(line: 108, column: 42, scope: !165)
!173 = !DILocation(line: 109, column: 17, scope: !165)
!174 = !DILocation(line: 105, column: 39, scope: !161)
!175 = !DILocation(line: 105, column: 17, scope: !161)
!176 = distinct !{!176, !163, !177, !66}
!177 = !DILocation(line: 109, column: 17, scope: !158)
!178 = !DILocation(line: 111, column: 20, scope: !142)
!179 = !DILocation(line: 111, column: 18, scope: !142)
!180 = !DILocation(line: 113, column: 5, scope: !143)
!181 = !DILocation(line: 114, column: 22, scope: !133)
!182 = !DILocation(line: 114, column: 5, scope: !133)
!183 = !DILocation(line: 116, column: 10, scope: !133)
!184 = !DILocation(line: 116, column: 5, scope: !133)
!185 = !DILocation(line: 117, column: 1, scope: !133)
