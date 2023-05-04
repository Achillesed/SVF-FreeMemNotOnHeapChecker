; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_static_12.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_static_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE590_Free_Memory_Not_on_Heap__free_struct_static_12_bad.dataBuffer = internal global [100 x %struct._twoIntsStruct] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_12_bad() #0 !dbg !2 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i5 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !30, metadata !DIExpression()), !dbg !31
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !33
  %tobool = icmp ne i32 %call, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %0, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_12_bad.dataBuffer, i64 0, i64 %1, !dbg !53
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !54
  store i32 1, i32* %intOne, align 8, !dbg !55
  %2 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_12_bad.dataBuffer, i64 0, i64 %2, !dbg !57
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !58
  store i32 1, i32* %intTwo, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %3, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  store %struct._twoIntsStruct* getelementptr inbounds ([100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_12_bad.dataBuffer, i64 0, i64 0), %struct._twoIntsStruct** %data, align 8, !dbg !66
  br label %if.end16, !dbg !67

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !68, metadata !DIExpression()), !dbg !71
  %call2 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !72
  %4 = bitcast i8* %call2 to %struct._twoIntsStruct*, !dbg !73
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !71
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !74
  %cmp3 = icmp eq %struct._twoIntsStruct* %5, null, !dbg !76
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !77

if.then4:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @exit(i32 noundef 1) #6, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i5, metadata !81, metadata !DIExpression()), !dbg !83
  store i64 0, i64* %i5, align 8, !dbg !84
  br label %for.cond6, !dbg !86

for.cond6:                                        ; preds = %for.inc13, %if.end
  %6 = load i64, i64* %i5, align 8, !dbg !87
  %cmp7 = icmp ult i64 %6, 100, !dbg !89
  br i1 %cmp7, label %for.body8, label %for.end15, !dbg !90

for.body8:                                        ; preds = %for.cond6
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !91
  %8 = load i64, i64* %i5, align 8, !dbg !93
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !91
  %intOne10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx9, i32 0, i32 0, !dbg !94
  store i32 1, i32* %intOne10, align 4, !dbg !95
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !96
  %10 = load i64, i64* %i5, align 8, !dbg !97
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 %10, !dbg !96
  %intTwo12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx11, i32 0, i32 1, !dbg !98
  store i32 1, i32* %intTwo12, align 4, !dbg !99
  br label %for.inc13, !dbg !100

for.inc13:                                        ; preds = %for.body8
  %11 = load i64, i64* %i5, align 8, !dbg !101
  %inc14 = add i64 %11, 1, !dbg !101
  store i64 %inc14, i64* %i5, align 8, !dbg !101
  br label %for.cond6, !dbg !102, !llvm.loop !103

for.end15:                                        ; preds = %for.cond6
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !105
  store %struct._twoIntsStruct* %12, %struct._twoIntsStruct** %data, align 8, !dbg !106
  br label %if.end16

if.end16:                                         ; preds = %for.end15, %for.end
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !107
  %arrayidx17 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !107
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx17), !dbg !108
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_12_good() #0 !dbg !112 {
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

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 31, type: !19, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_12_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_12.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "26f171ac099b74e94a065bc9206a8e4d")
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
!35 = !DILocation(line: 27, column: 8, scope: !2)
!36 = !DILocalVariable(name: "i", scope: !37, file: !3, line: 33, type: !40)
!37 = distinct !DILexicalBlock(scope: !38, file: !3, line: 32, column: 13)
!38 = distinct !DILexicalBlock(scope: !39, file: !3, line: 29, column: 9)
!39 = distinct !DILexicalBlock(scope: !34, file: !3, line: 28, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 33, column: 24, scope: !37)
!44 = !DILocation(line: 34, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !37, file: !3, line: 34, column: 17)
!46 = !DILocation(line: 34, column: 22, scope: !45)
!47 = !DILocation(line: 34, column: 29, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !3, line: 34, column: 17)
!49 = !DILocation(line: 34, column: 31, scope: !48)
!50 = !DILocation(line: 34, column: 17, scope: !45)
!51 = !DILocation(line: 36, column: 32, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !3, line: 35, column: 17)
!53 = !DILocation(line: 36, column: 21, scope: !52)
!54 = !DILocation(line: 36, column: 35, scope: !52)
!55 = !DILocation(line: 36, column: 42, scope: !52)
!56 = !DILocation(line: 37, column: 32, scope: !52)
!57 = !DILocation(line: 37, column: 21, scope: !52)
!58 = !DILocation(line: 37, column: 35, scope: !52)
!59 = !DILocation(line: 37, column: 42, scope: !52)
!60 = !DILocation(line: 38, column: 17, scope: !52)
!61 = !DILocation(line: 34, column: 39, scope: !48)
!62 = !DILocation(line: 34, column: 17, scope: !48)
!63 = distinct !{!63, !50, !64, !65}
!64 = !DILocation(line: 38, column: 17, scope: !45)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 40, column: 18, scope: !38)
!67 = !DILocation(line: 42, column: 5, scope: !39)
!68 = !DILocalVariable(name: "dataBuffer", scope: !69, file: !3, line: 47, type: !8)
!69 = distinct !DILexicalBlock(scope: !70, file: !3, line: 45, column: 9)
!70 = distinct !DILexicalBlock(scope: !34, file: !3, line: 44, column: 5)
!71 = !DILocation(line: 47, column: 29, scope: !69)
!72 = !DILocation(line: 47, column: 59, scope: !69)
!73 = !DILocation(line: 47, column: 42, scope: !69)
!74 = !DILocation(line: 48, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !3, line: 48, column: 17)
!76 = !DILocation(line: 48, column: 28, scope: !75)
!77 = !DILocation(line: 48, column: 17, scope: !69)
!78 = !DILocation(line: 50, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !3, line: 49, column: 13)
!80 = !DILocation(line: 51, column: 17, scope: !79)
!81 = !DILocalVariable(name: "i", scope: !82, file: !3, line: 54, type: !40)
!82 = distinct !DILexicalBlock(scope: !69, file: !3, line: 53, column: 13)
!83 = !DILocation(line: 54, column: 24, scope: !82)
!84 = !DILocation(line: 55, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !3, line: 55, column: 17)
!86 = !DILocation(line: 55, column: 22, scope: !85)
!87 = !DILocation(line: 55, column: 29, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !3, line: 55, column: 17)
!89 = !DILocation(line: 55, column: 31, scope: !88)
!90 = !DILocation(line: 55, column: 17, scope: !85)
!91 = !DILocation(line: 57, column: 21, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !3, line: 56, column: 17)
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
!103 = distinct !{!103, !90, !104, !65}
!104 = !DILocation(line: 59, column: 17, scope: !85)
!105 = !DILocation(line: 61, column: 20, scope: !69)
!106 = !DILocation(line: 61, column: 18, scope: !69)
!107 = !DILocation(line: 64, column: 22, scope: !2)
!108 = !DILocation(line: 64, column: 5, scope: !2)
!109 = !DILocation(line: 66, column: 10, scope: !2)
!110 = !DILocation(line: 66, column: 5, scope: !2)
!111 = !DILocation(line: 67, column: 1, scope: !2)
!112 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_12_good", scope: !3, file: !3, line: 126, type: !4, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!113 = !DILocation(line: 128, column: 5, scope: !112)
!114 = !DILocation(line: 129, column: 1, scope: !112)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 75, type: !4, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!116 = !DILocalVariable(name: "data", scope: !115, file: !3, line: 77, type: !8)
!117 = !DILocation(line: 77, column: 21, scope: !115)
!118 = !DILocation(line: 78, column: 10, scope: !115)
!119 = !DILocation(line: 79, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !3, line: 79, column: 8)
!121 = !DILocation(line: 79, column: 8, scope: !115)
!122 = !DILocalVariable(name: "dataBuffer", scope: !123, file: !3, line: 83, type: !8)
!123 = distinct !DILexicalBlock(scope: !124, file: !3, line: 81, column: 9)
!124 = distinct !DILexicalBlock(scope: !120, file: !3, line: 80, column: 5)
!125 = !DILocation(line: 83, column: 29, scope: !123)
!126 = !DILocation(line: 83, column: 59, scope: !123)
!127 = !DILocation(line: 83, column: 42, scope: !123)
!128 = !DILocation(line: 84, column: 17, scope: !129)
!129 = distinct !DILexicalBlock(scope: !123, file: !3, line: 84, column: 17)
!130 = !DILocation(line: 84, column: 28, scope: !129)
!131 = !DILocation(line: 84, column: 17, scope: !123)
!132 = !DILocation(line: 86, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !3, line: 85, column: 13)
!134 = !DILocation(line: 87, column: 17, scope: !133)
!135 = !DILocalVariable(name: "i", scope: !136, file: !3, line: 90, type: !40)
!136 = distinct !DILexicalBlock(scope: !123, file: !3, line: 89, column: 13)
!137 = !DILocation(line: 90, column: 24, scope: !136)
!138 = !DILocation(line: 91, column: 24, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !3, line: 91, column: 17)
!140 = !DILocation(line: 91, column: 22, scope: !139)
!141 = !DILocation(line: 91, column: 29, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !3, line: 91, column: 17)
!143 = !DILocation(line: 91, column: 31, scope: !142)
!144 = !DILocation(line: 91, column: 17, scope: !139)
!145 = !DILocation(line: 93, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !3, line: 92, column: 17)
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
!157 = distinct !{!157, !144, !158, !65}
!158 = !DILocation(line: 95, column: 17, scope: !139)
!159 = !DILocation(line: 97, column: 20, scope: !123)
!160 = !DILocation(line: 97, column: 18, scope: !123)
!161 = !DILocation(line: 99, column: 5, scope: !124)
!162 = !DILocalVariable(name: "dataBuffer", scope: !163, file: !3, line: 104, type: !8)
!163 = distinct !DILexicalBlock(scope: !164, file: !3, line: 102, column: 9)
!164 = distinct !DILexicalBlock(scope: !120, file: !3, line: 101, column: 5)
!165 = !DILocation(line: 104, column: 29, scope: !163)
!166 = !DILocation(line: 104, column: 59, scope: !163)
!167 = !DILocation(line: 104, column: 42, scope: !163)
!168 = !DILocation(line: 105, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !163, file: !3, line: 105, column: 17)
!170 = !DILocation(line: 105, column: 28, scope: !169)
!171 = !DILocation(line: 105, column: 17, scope: !163)
!172 = !DILocation(line: 107, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !3, line: 106, column: 13)
!174 = !DILocation(line: 108, column: 17, scope: !173)
!175 = !DILocalVariable(name: "i", scope: !176, file: !3, line: 111, type: !40)
!176 = distinct !DILexicalBlock(scope: !163, file: !3, line: 110, column: 13)
!177 = !DILocation(line: 111, column: 24, scope: !176)
!178 = !DILocation(line: 112, column: 24, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !3, line: 112, column: 17)
!180 = !DILocation(line: 112, column: 22, scope: !179)
!181 = !DILocation(line: 112, column: 29, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !3, line: 112, column: 17)
!183 = !DILocation(line: 112, column: 31, scope: !182)
!184 = !DILocation(line: 112, column: 17, scope: !179)
!185 = !DILocation(line: 114, column: 21, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !3, line: 113, column: 17)
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
!197 = distinct !{!197, !184, !198, !65}
!198 = !DILocation(line: 116, column: 17, scope: !179)
!199 = !DILocation(line: 118, column: 20, scope: !163)
!200 = !DILocation(line: 118, column: 18, scope: !163)
!201 = !DILocation(line: 121, column: 22, scope: !115)
!202 = !DILocation(line: 121, column: 5, scope: !115)
!203 = !DILocation(line: 123, column: 10, scope: !115)
!204 = !DILocation(line: 123, column: 5, scope: !115)
!205 = !DILocation(line: 124, column: 1, scope: !115)
