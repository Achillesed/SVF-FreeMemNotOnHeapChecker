; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_14.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_14_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %0 = load i32, i32* @globalFive, align 4, !dbg !27
  %cmp = icmp eq i32 %0, 5, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !34
  %1 = alloca i8, i64 800, align 16, !dbg !35
  %2 = bitcast i8* %1 to %struct._twoIntsStruct*, !dbg !36
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i64, i64* %i, align 8, !dbg !46
  %cmp1 = icmp ult i64 %3, 100, !dbg !48
  br i1 %cmp1, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !50
  %5 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !50
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !53
  store i32 1, i32* %intOne, align 4, !dbg !54
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !55
  %7 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !55
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !57
  store i32 1, i32* %intTwo, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %8, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !65
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !66
  br label %if.end, !dbg !67

if.end:                                           ; preds = %for.end, %entry
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !68
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !68
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !69
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !70
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !70
  call void @free(i8* noundef %12) #5, !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_14_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !80
  %0 = load i32, i32* @globalFive, align 4, !dbg !81
  %cmp = icmp ne i32 %0, 5, !dbg !83
  br i1 %cmp, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !85
  br label %if.end5, !dbg !87

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !88, metadata !DIExpression()), !dbg !91
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !92
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !93
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !91
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !94
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !96
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !97

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @exit(i32 noundef 1) #6, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !101, metadata !DIExpression()), !dbg !103
  store i64 0, i64* %i, align 8, !dbg !104
  br label %for.cond, !dbg !106

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !107
  %cmp3 = icmp ult i64 %3, 100, !dbg !109
  br i1 %cmp3, label %for.body, label %for.end, !dbg !110

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !111
  %5 = load i64, i64* %i, align 8, !dbg !113
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !111
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !114
  store i32 1, i32* %intOne, align 4, !dbg !115
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !116
  %7 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !116
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !118
  store i32 1, i32* %intTwo, align 4, !dbg !119
  br label %for.inc, !dbg !120

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !121
  %inc = add i64 %8, 1, !dbg !121
  store i64 %inc, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !122, !llvm.loop !123

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !125
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !126
  br label %if.end5

if.end5:                                          ; preds = %for.end, %if.then
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !127
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !127
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx6), !dbg !128
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !129
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !129
  call void @free(i8* noundef %12) #5, !dbg !130
  ret void, !dbg !131
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !132 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !133, metadata !DIExpression()), !dbg !134
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !135
  %0 = load i32, i32* @globalFive, align 4, !dbg !136
  %cmp = icmp eq i32 %0, 5, !dbg !138
  br i1 %cmp, label %if.then, label %if.end5, !dbg !139

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !140, metadata !DIExpression()), !dbg !143
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !144
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !145
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !143
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !146
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !148
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !149

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !150
  call void @exit(i32 noundef 1) #6, !dbg !152
  unreachable, !dbg !152

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !153, metadata !DIExpression()), !dbg !155
  store i64 0, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !158

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !159
  %cmp3 = icmp ult i64 %3, 100, !dbg !161
  br i1 %cmp3, label %for.body, label %for.end, !dbg !162

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !163
  %5 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !163
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !166
  store i32 1, i32* %intOne, align 4, !dbg !167
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !168
  %7 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !168
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !170
  store i32 1, i32* %intTwo, align 4, !dbg !171
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !173
  %inc = add i64 %8, 1, !dbg !173
  store i64 %inc, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !177
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !178
  br label %if.end5, !dbg !179

if.end5:                                          ; preds = %for.end, %entry
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !180
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !180
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx6), !dbg !181
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !182
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !182
  call void @free(i8* noundef %12) #5, !dbg !183
  ret void, !dbg !184
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_14.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "3cdb7bb323d22342eb91263babff8166")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_14_bad", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 25, type: !3)
!25 = !DILocation(line: 25, column: 21, scope: !20)
!26 = !DILocation(line: 26, column: 10, scope: !20)
!27 = !DILocation(line: 27, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !1, line: 27, column: 8)
!29 = !DILocation(line: 27, column: 18, scope: !28)
!30 = !DILocation(line: 27, column: 8, scope: !20)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !1, line: 31, type: !3)
!32 = distinct !DILexicalBlock(scope: !33, file: !1, line: 29, column: 9)
!33 = distinct !DILexicalBlock(scope: !28, file: !1, line: 28, column: 5)
!34 = !DILocation(line: 31, column: 29, scope: !32)
!35 = !DILocation(line: 31, column: 59, scope: !32)
!36 = !DILocation(line: 31, column: 42, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !38, file: !1, line: 33, type: !39)
!38 = distinct !DILexicalBlock(scope: !32, file: !1, line: 32, column: 13)
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
!50 = !DILocation(line: 36, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 35, column: 17)
!52 = !DILocation(line: 36, column: 32, scope: !51)
!53 = !DILocation(line: 36, column: 35, scope: !51)
!54 = !DILocation(line: 36, column: 42, scope: !51)
!55 = !DILocation(line: 37, column: 21, scope: !51)
!56 = !DILocation(line: 37, column: 32, scope: !51)
!57 = !DILocation(line: 37, column: 35, scope: !51)
!58 = !DILocation(line: 37, column: 42, scope: !51)
!59 = !DILocation(line: 38, column: 17, scope: !51)
!60 = !DILocation(line: 34, column: 39, scope: !47)
!61 = !DILocation(line: 34, column: 17, scope: !47)
!62 = distinct !{!62, !49, !63, !64}
!63 = !DILocation(line: 38, column: 17, scope: !44)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 40, column: 20, scope: !32)
!66 = !DILocation(line: 40, column: 18, scope: !32)
!67 = !DILocation(line: 42, column: 5, scope: !33)
!68 = !DILocation(line: 43, column: 22, scope: !20)
!69 = !DILocation(line: 43, column: 5, scope: !20)
!70 = !DILocation(line: 45, column: 10, scope: !20)
!71 = !DILocation(line: 45, column: 5, scope: !20)
!72 = !DILocation(line: 46, column: 1, scope: !20)
!73 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_14_good", scope: !1, file: !1, line: 119, type: !21, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!74 = !DILocation(line: 121, column: 5, scope: !73)
!75 = !DILocation(line: 122, column: 5, scope: !73)
!76 = !DILocation(line: 123, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 53, type: !21, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!78 = !DILocalVariable(name: "data", scope: !77, file: !1, line: 55, type: !3)
!79 = !DILocation(line: 55, column: 21, scope: !77)
!80 = !DILocation(line: 56, column: 10, scope: !77)
!81 = !DILocation(line: 57, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !1, line: 57, column: 8)
!83 = !DILocation(line: 57, column: 18, scope: !82)
!84 = !DILocation(line: 57, column: 8, scope: !77)
!85 = !DILocation(line: 60, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !1, line: 58, column: 5)
!87 = !DILocation(line: 61, column: 5, scope: !86)
!88 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !1, line: 66, type: !3)
!89 = distinct !DILexicalBlock(scope: !90, file: !1, line: 64, column: 9)
!90 = distinct !DILexicalBlock(scope: !82, file: !1, line: 63, column: 5)
!91 = !DILocation(line: 66, column: 29, scope: !89)
!92 = !DILocation(line: 66, column: 59, scope: !89)
!93 = !DILocation(line: 66, column: 42, scope: !89)
!94 = !DILocation(line: 67, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !1, line: 67, column: 17)
!96 = !DILocation(line: 67, column: 28, scope: !95)
!97 = !DILocation(line: 67, column: 17, scope: !89)
!98 = !DILocation(line: 69, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !1, line: 68, column: 13)
!100 = !DILocation(line: 70, column: 17, scope: !99)
!101 = !DILocalVariable(name: "i", scope: !102, file: !1, line: 73, type: !39)
!102 = distinct !DILexicalBlock(scope: !89, file: !1, line: 72, column: 13)
!103 = !DILocation(line: 73, column: 24, scope: !102)
!104 = !DILocation(line: 74, column: 24, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !1, line: 74, column: 17)
!106 = !DILocation(line: 74, column: 22, scope: !105)
!107 = !DILocation(line: 74, column: 29, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !1, line: 74, column: 17)
!109 = !DILocation(line: 74, column: 31, scope: !108)
!110 = !DILocation(line: 74, column: 17, scope: !105)
!111 = !DILocation(line: 76, column: 21, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !1, line: 75, column: 17)
!113 = !DILocation(line: 76, column: 32, scope: !112)
!114 = !DILocation(line: 76, column: 35, scope: !112)
!115 = !DILocation(line: 76, column: 42, scope: !112)
!116 = !DILocation(line: 77, column: 21, scope: !112)
!117 = !DILocation(line: 77, column: 32, scope: !112)
!118 = !DILocation(line: 77, column: 35, scope: !112)
!119 = !DILocation(line: 77, column: 42, scope: !112)
!120 = !DILocation(line: 78, column: 17, scope: !112)
!121 = !DILocation(line: 74, column: 39, scope: !108)
!122 = !DILocation(line: 74, column: 17, scope: !108)
!123 = distinct !{!123, !110, !124, !64}
!124 = !DILocation(line: 78, column: 17, scope: !105)
!125 = !DILocation(line: 80, column: 20, scope: !89)
!126 = !DILocation(line: 80, column: 18, scope: !89)
!127 = !DILocation(line: 83, column: 22, scope: !77)
!128 = !DILocation(line: 83, column: 5, scope: !77)
!129 = !DILocation(line: 85, column: 10, scope: !77)
!130 = !DILocation(line: 85, column: 5, scope: !77)
!131 = !DILocation(line: 86, column: 1, scope: !77)
!132 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 89, type: !21, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!133 = !DILocalVariable(name: "data", scope: !132, file: !1, line: 91, type: !3)
!134 = !DILocation(line: 91, column: 21, scope: !132)
!135 = !DILocation(line: 92, column: 10, scope: !132)
!136 = !DILocation(line: 93, column: 8, scope: !137)
!137 = distinct !DILexicalBlock(scope: !132, file: !1, line: 93, column: 8)
!138 = !DILocation(line: 93, column: 18, scope: !137)
!139 = !DILocation(line: 93, column: 8, scope: !132)
!140 = !DILocalVariable(name: "dataBuffer", scope: !141, file: !1, line: 97, type: !3)
!141 = distinct !DILexicalBlock(scope: !142, file: !1, line: 95, column: 9)
!142 = distinct !DILexicalBlock(scope: !137, file: !1, line: 94, column: 5)
!143 = !DILocation(line: 97, column: 29, scope: !141)
!144 = !DILocation(line: 97, column: 59, scope: !141)
!145 = !DILocation(line: 97, column: 42, scope: !141)
!146 = !DILocation(line: 98, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !141, file: !1, line: 98, column: 17)
!148 = !DILocation(line: 98, column: 28, scope: !147)
!149 = !DILocation(line: 98, column: 17, scope: !141)
!150 = !DILocation(line: 100, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !1, line: 99, column: 13)
!152 = !DILocation(line: 101, column: 17, scope: !151)
!153 = !DILocalVariable(name: "i", scope: !154, file: !1, line: 104, type: !39)
!154 = distinct !DILexicalBlock(scope: !141, file: !1, line: 103, column: 13)
!155 = !DILocation(line: 104, column: 24, scope: !154)
!156 = !DILocation(line: 105, column: 24, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !1, line: 105, column: 17)
!158 = !DILocation(line: 105, column: 22, scope: !157)
!159 = !DILocation(line: 105, column: 29, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !1, line: 105, column: 17)
!161 = !DILocation(line: 105, column: 31, scope: !160)
!162 = !DILocation(line: 105, column: 17, scope: !157)
!163 = !DILocation(line: 107, column: 21, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !1, line: 106, column: 17)
!165 = !DILocation(line: 107, column: 32, scope: !164)
!166 = !DILocation(line: 107, column: 35, scope: !164)
!167 = !DILocation(line: 107, column: 42, scope: !164)
!168 = !DILocation(line: 108, column: 21, scope: !164)
!169 = !DILocation(line: 108, column: 32, scope: !164)
!170 = !DILocation(line: 108, column: 35, scope: !164)
!171 = !DILocation(line: 108, column: 42, scope: !164)
!172 = !DILocation(line: 109, column: 17, scope: !164)
!173 = !DILocation(line: 105, column: 39, scope: !160)
!174 = !DILocation(line: 105, column: 17, scope: !160)
!175 = distinct !{!175, !162, !176, !64}
!176 = !DILocation(line: 109, column: 17, scope: !157)
!177 = !DILocation(line: 111, column: 20, scope: !141)
!178 = !DILocation(line: 111, column: 18, scope: !141)
!179 = !DILocation(line: 113, column: 5, scope: !142)
!180 = !DILocation(line: 114, column: 22, scope: !132)
!181 = !DILocation(line: 114, column: 5, scope: !132)
!182 = !DILocation(line: 116, column: 10, scope: !132)
!183 = !DILocation(line: 116, column: 5, scope: !132)
!184 = !DILocation(line: 117, column: 1, scope: !132)
