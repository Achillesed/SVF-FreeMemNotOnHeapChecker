; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_09.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@GLOBAL_CONST_TRUE = external constant i32, align 4
@GLOBAL_CONST_FALSE = external constant i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_09_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !33
  %1 = alloca i8, i64 800, align 16, !dbg !34
  %2 = bitcast i8* %1 to %struct._twoIntsStruct*, !dbg !35
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %3, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !49
  %5 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !49
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !52
  store i32 1, i32* %intOne, align 4, !dbg !53
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !54
  %7 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !54
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !56
  store i32 1, i32* %intTwo, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %8, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !64
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !65
  br label %if.end, !dbg !66

if.end:                                           ; preds = %for.end, %entry
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !67
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !67
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !68
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !69
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !69
  call void @free(i8* noundef %12) #5, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_09_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !79
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !80
  %tobool = icmp ne i32 %0, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !83
  br label %if.end4, !dbg !85

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !89
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !90
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !91
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !89
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !92
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !94
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
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !109
  %5 = load i64, i64* %i, align 8, !dbg !111
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !109
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !112
  store i32 1, i32* %intOne, align 4, !dbg !113
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !114
  %7 = load i64, i64* %i, align 8, !dbg !115
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !114
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !116
  store i32 1, i32* %intTwo, align 4, !dbg !117
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !119
  %inc = add i64 %8, 1, !dbg !119
  store i64 %inc, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !120, !llvm.loop !121

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !123
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !124
  br label %if.end4

if.end4:                                          ; preds = %for.end, %if.then
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !125
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !125
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx5), !dbg !126
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !127
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !127
  call void @free(i8* noundef %12) #5, !dbg !128
  ret void, !dbg !129
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !130 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !131, metadata !DIExpression()), !dbg !132
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !133
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !134
  %tobool = icmp ne i32 %0, 0, !dbg !134
  br i1 %tobool, label %if.then, label %if.end4, !dbg !136

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !137, metadata !DIExpression()), !dbg !140
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !141
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !142
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !140
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !143
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !145
  br i1 %cmp, label %if.then1, label %if.end, !dbg !146

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !147
  call void @exit(i32 noundef 1) #6, !dbg !149
  unreachable, !dbg !149

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !150, metadata !DIExpression()), !dbg !152
  store i64 0, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !156
  %cmp2 = icmp ult i64 %3, 100, !dbg !158
  br i1 %cmp2, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !160
  %5 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !160
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !163
  store i32 1, i32* %intOne, align 4, !dbg !164
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !165
  %7 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !165
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !167
  store i32 1, i32* %intTwo, align 4, !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !170
  %inc = add i64 %8, 1, !dbg !170
  store i64 %inc, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !174
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !175
  br label %if.end4, !dbg !176

if.end4:                                          ; preds = %for.end, %entry
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !177
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !177
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx5), !dbg !178
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !179
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !179
  call void @free(i8* noundef %12) #5, !dbg !180
  ret void, !dbg !181
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_09.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "f09d8ef3ec5562f2a8b9ac59bb192fd0")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_09_bad", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
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
!67 = !DILocation(line: 43, column: 22, scope: !20)
!68 = !DILocation(line: 43, column: 5, scope: !20)
!69 = !DILocation(line: 45, column: 10, scope: !20)
!70 = !DILocation(line: 45, column: 5, scope: !20)
!71 = !DILocation(line: 46, column: 1, scope: !20)
!72 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_09_good", scope: !1, file: !1, line: 119, type: !21, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!73 = !DILocation(line: 121, column: 5, scope: !72)
!74 = !DILocation(line: 122, column: 5, scope: !72)
!75 = !DILocation(line: 123, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 53, type: !21, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!77 = !DILocalVariable(name: "data", scope: !76, file: !1, line: 55, type: !3)
!78 = !DILocation(line: 55, column: 21, scope: !76)
!79 = !DILocation(line: 56, column: 10, scope: !76)
!80 = !DILocation(line: 57, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !1, line: 57, column: 8)
!82 = !DILocation(line: 57, column: 8, scope: !76)
!83 = !DILocation(line: 60, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !1, line: 58, column: 5)
!85 = !DILocation(line: 61, column: 5, scope: !84)
!86 = !DILocalVariable(name: "dataBuffer", scope: !87, file: !1, line: 66, type: !3)
!87 = distinct !DILexicalBlock(scope: !88, file: !1, line: 64, column: 9)
!88 = distinct !DILexicalBlock(scope: !81, file: !1, line: 63, column: 5)
!89 = !DILocation(line: 66, column: 29, scope: !87)
!90 = !DILocation(line: 66, column: 59, scope: !87)
!91 = !DILocation(line: 66, column: 42, scope: !87)
!92 = !DILocation(line: 67, column: 17, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !1, line: 67, column: 17)
!94 = !DILocation(line: 67, column: 28, scope: !93)
!95 = !DILocation(line: 67, column: 17, scope: !87)
!96 = !DILocation(line: 69, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !1, line: 68, column: 13)
!98 = !DILocation(line: 70, column: 17, scope: !97)
!99 = !DILocalVariable(name: "i", scope: !100, file: !1, line: 73, type: !38)
!100 = distinct !DILexicalBlock(scope: !87, file: !1, line: 72, column: 13)
!101 = !DILocation(line: 73, column: 24, scope: !100)
!102 = !DILocation(line: 74, column: 24, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !1, line: 74, column: 17)
!104 = !DILocation(line: 74, column: 22, scope: !103)
!105 = !DILocation(line: 74, column: 29, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !1, line: 74, column: 17)
!107 = !DILocation(line: 74, column: 31, scope: !106)
!108 = !DILocation(line: 74, column: 17, scope: !103)
!109 = !DILocation(line: 76, column: 21, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !1, line: 75, column: 17)
!111 = !DILocation(line: 76, column: 32, scope: !110)
!112 = !DILocation(line: 76, column: 35, scope: !110)
!113 = !DILocation(line: 76, column: 42, scope: !110)
!114 = !DILocation(line: 77, column: 21, scope: !110)
!115 = !DILocation(line: 77, column: 32, scope: !110)
!116 = !DILocation(line: 77, column: 35, scope: !110)
!117 = !DILocation(line: 77, column: 42, scope: !110)
!118 = !DILocation(line: 78, column: 17, scope: !110)
!119 = !DILocation(line: 74, column: 39, scope: !106)
!120 = !DILocation(line: 74, column: 17, scope: !106)
!121 = distinct !{!121, !108, !122, !63}
!122 = !DILocation(line: 78, column: 17, scope: !103)
!123 = !DILocation(line: 80, column: 20, scope: !87)
!124 = !DILocation(line: 80, column: 18, scope: !87)
!125 = !DILocation(line: 83, column: 22, scope: !76)
!126 = !DILocation(line: 83, column: 5, scope: !76)
!127 = !DILocation(line: 85, column: 10, scope: !76)
!128 = !DILocation(line: 85, column: 5, scope: !76)
!129 = !DILocation(line: 86, column: 1, scope: !76)
!130 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 89, type: !21, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!131 = !DILocalVariable(name: "data", scope: !130, file: !1, line: 91, type: !3)
!132 = !DILocation(line: 91, column: 21, scope: !130)
!133 = !DILocation(line: 92, column: 10, scope: !130)
!134 = !DILocation(line: 93, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !130, file: !1, line: 93, column: 8)
!136 = !DILocation(line: 93, column: 8, scope: !130)
!137 = !DILocalVariable(name: "dataBuffer", scope: !138, file: !1, line: 97, type: !3)
!138 = distinct !DILexicalBlock(scope: !139, file: !1, line: 95, column: 9)
!139 = distinct !DILexicalBlock(scope: !135, file: !1, line: 94, column: 5)
!140 = !DILocation(line: 97, column: 29, scope: !138)
!141 = !DILocation(line: 97, column: 59, scope: !138)
!142 = !DILocation(line: 97, column: 42, scope: !138)
!143 = !DILocation(line: 98, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !138, file: !1, line: 98, column: 17)
!145 = !DILocation(line: 98, column: 28, scope: !144)
!146 = !DILocation(line: 98, column: 17, scope: !138)
!147 = !DILocation(line: 100, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !1, line: 99, column: 13)
!149 = !DILocation(line: 101, column: 17, scope: !148)
!150 = !DILocalVariable(name: "i", scope: !151, file: !1, line: 104, type: !38)
!151 = distinct !DILexicalBlock(scope: !138, file: !1, line: 103, column: 13)
!152 = !DILocation(line: 104, column: 24, scope: !151)
!153 = !DILocation(line: 105, column: 24, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !1, line: 105, column: 17)
!155 = !DILocation(line: 105, column: 22, scope: !154)
!156 = !DILocation(line: 105, column: 29, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !1, line: 105, column: 17)
!158 = !DILocation(line: 105, column: 31, scope: !157)
!159 = !DILocation(line: 105, column: 17, scope: !154)
!160 = !DILocation(line: 107, column: 21, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !1, line: 106, column: 17)
!162 = !DILocation(line: 107, column: 32, scope: !161)
!163 = !DILocation(line: 107, column: 35, scope: !161)
!164 = !DILocation(line: 107, column: 42, scope: !161)
!165 = !DILocation(line: 108, column: 21, scope: !161)
!166 = !DILocation(line: 108, column: 32, scope: !161)
!167 = !DILocation(line: 108, column: 35, scope: !161)
!168 = !DILocation(line: 108, column: 42, scope: !161)
!169 = !DILocation(line: 109, column: 17, scope: !161)
!170 = !DILocation(line: 105, column: 39, scope: !157)
!171 = !DILocation(line: 105, column: 17, scope: !157)
!172 = distinct !{!172, !159, !173, !63}
!173 = !DILocation(line: 109, column: 17, scope: !154)
!174 = !DILocation(line: 111, column: 20, scope: !138)
!175 = !DILocation(line: 111, column: 18, scope: !138)
!176 = !DILocation(line: 113, column: 5, scope: !139)
!177 = !DILocation(line: 114, column: 22, scope: !130)
!178 = !DILocation(line: 114, column: 5, scope: !130)
!179 = !DILocation(line: 116, column: 10, scope: !130)
!180 = !DILocation(line: 116, column: 5, scope: !130)
!181 = !DILocation(line: 117, column: 1, scope: !130)
