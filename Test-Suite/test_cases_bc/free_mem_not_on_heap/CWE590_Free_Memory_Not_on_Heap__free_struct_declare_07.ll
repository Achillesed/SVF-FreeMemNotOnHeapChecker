; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_07.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_07_bad() #0 !dbg !23 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !27, metadata !DIExpression()), !dbg !28
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !29
  %0 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp = icmp eq i32 %0, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataBuffer, metadata !34, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i64, i64* %i, align 8, !dbg !50
  %cmp1 = icmp ult i64 %1, 100, !dbg !52
  br i1 %cmp1, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %2, !dbg !56
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !57
  store i32 1, i32* %intOne, align 8, !dbg !58
  %3 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %3, !dbg !60
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !61
  store i32 1, i32* %intTwo, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %4, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 0, !dbg !69
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !70
  br label %if.end, !dbg !71

if.end:                                           ; preds = %for.end, %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !72
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 0, !dbg !72
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !73
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !74
  call void @free(i8* noundef %7) #5, !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_07_good() #0 !dbg !77 {
entry:
  call void @goodG2B1(), !dbg !78
  call void @goodG2B2(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !84
  %0 = load i32, i32* @staticFive, align 4, !dbg !85
  %cmp = icmp ne i32 %0, 5, !dbg !87
  br i1 %cmp, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !89
  br label %if.end5, !dbg !91

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !95
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !96
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !97
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !95
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !98
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !100
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !101

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @exit(i32 noundef 1) #6, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !105, metadata !DIExpression()), !dbg !107
  store i64 0, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !110

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !111
  %cmp3 = icmp ult i64 %3, 100, !dbg !113
  br i1 %cmp3, label %for.body, label %for.end, !dbg !114

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !115
  %5 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !115
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !118
  store i32 1, i32* %intOne, align 4, !dbg !119
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !120
  %7 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !120
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !122
  store i32 1, i32* %intTwo, align 4, !dbg !123
  br label %for.inc, !dbg !124

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !125
  %inc = add i64 %8, 1, !dbg !125
  store i64 %inc, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !126, !llvm.loop !127

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !129
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !130
  br label %if.end5

if.end5:                                          ; preds = %for.end, %if.then
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !131
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !131
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx6), !dbg !132
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !133
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !133
  call void @free(i8* noundef %12) #5, !dbg !134
  ret void, !dbg !135
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !136 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !137, metadata !DIExpression()), !dbg !138
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !139
  %0 = load i32, i32* @staticFive, align 4, !dbg !140
  %cmp = icmp eq i32 %0, 5, !dbg !142
  br i1 %cmp, label %if.then, label %if.end5, !dbg !143

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !144, metadata !DIExpression()), !dbg !147
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !148
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !149
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !147
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !150
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !152
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !153

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !154
  call void @exit(i32 noundef 1) #6, !dbg !156
  unreachable, !dbg !156

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !157, metadata !DIExpression()), !dbg !159
  store i64 0, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !163
  %cmp3 = icmp ult i64 %3, 100, !dbg !165
  br i1 %cmp3, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !167
  %5 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !167
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !170
  store i32 1, i32* %intOne, align 4, !dbg !171
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !172
  %7 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !172
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !174
  store i32 1, i32* %intTwo, align 4, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !177
  %inc = add i64 %8, 1, !dbg !177
  store i64 %inc, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !181
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !182
  br label %if.end5, !dbg !183

if.end5:                                          ; preds = %for.end, %entry
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !184
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !184
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx6), !dbg !185
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !186
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !186
  call void @free(i8* noundef %12) #5, !dbg !187
  ret void, !dbg !188
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !3, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_07.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "297b5cee9ad56b3dbf53b9e6fae9ca0f")
!4 = !{!5, !13}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !7, line: 100, baseType: !8)
!7 = !DIFile(filename: "./std_testcase.h", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1dccefb0310558c17683ded20b0d6982")
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !7, line: 96, size: 64, elements: !9)
!9 = !{!10, !12}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !8, file: !7, line: 98, baseType: !11, size: 32)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !8, file: !7, line: 99, baseType: !11, size: 32, offset: 32)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!14 = !{!0}
!15 = !{i32 7, !"Dwarf Version", i32 5}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{i32 7, !"PIE Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!23 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_07_bad", scope: !3, file: !3, line: 29, type: !24, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !3, line: 31, type: !5)
!28 = !DILocation(line: 31, column: 21, scope: !23)
!29 = !DILocation(line: 32, column: 10, scope: !23)
!30 = !DILocation(line: 33, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !3, line: 33, column: 8)
!32 = !DILocation(line: 33, column: 18, scope: !31)
!33 = !DILocation(line: 33, column: 8, scope: !23)
!34 = !DILocalVariable(name: "dataBuffer", scope: !35, file: !3, line: 37, type: !37)
!35 = distinct !DILexicalBlock(scope: !36, file: !3, line: 35, column: 9)
!36 = distinct !DILexicalBlock(scope: !31, file: !3, line: 34, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 37, column: 27, scope: !35)
!41 = !DILocalVariable(name: "i", scope: !42, file: !3, line: 39, type: !43)
!42 = distinct !DILexicalBlock(scope: !35, file: !3, line: 38, column: 13)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!45 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 39, column: 24, scope: !42)
!47 = !DILocation(line: 40, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !3, line: 40, column: 17)
!49 = !DILocation(line: 40, column: 22, scope: !48)
!50 = !DILocation(line: 40, column: 29, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !3, line: 40, column: 17)
!52 = !DILocation(line: 40, column: 31, scope: !51)
!53 = !DILocation(line: 40, column: 17, scope: !48)
!54 = !DILocation(line: 42, column: 32, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !3, line: 41, column: 17)
!56 = !DILocation(line: 42, column: 21, scope: !55)
!57 = !DILocation(line: 42, column: 35, scope: !55)
!58 = !DILocation(line: 42, column: 42, scope: !55)
!59 = !DILocation(line: 43, column: 32, scope: !55)
!60 = !DILocation(line: 43, column: 21, scope: !55)
!61 = !DILocation(line: 43, column: 35, scope: !55)
!62 = !DILocation(line: 43, column: 42, scope: !55)
!63 = !DILocation(line: 44, column: 17, scope: !55)
!64 = !DILocation(line: 40, column: 39, scope: !51)
!65 = !DILocation(line: 40, column: 17, scope: !51)
!66 = distinct !{!66, !53, !67, !68}
!67 = !DILocation(line: 44, column: 17, scope: !48)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 46, column: 20, scope: !35)
!70 = !DILocation(line: 46, column: 18, scope: !35)
!71 = !DILocation(line: 48, column: 5, scope: !36)
!72 = !DILocation(line: 49, column: 22, scope: !23)
!73 = !DILocation(line: 49, column: 5, scope: !23)
!74 = !DILocation(line: 51, column: 10, scope: !23)
!75 = !DILocation(line: 51, column: 5, scope: !23)
!76 = !DILocation(line: 52, column: 1, scope: !23)
!77 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_07_good", scope: !3, file: !3, line: 125, type: !24, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!78 = !DILocation(line: 127, column: 5, scope: !77)
!79 = !DILocation(line: 128, column: 5, scope: !77)
!80 = !DILocation(line: 129, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 59, type: !24, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!82 = !DILocalVariable(name: "data", scope: !81, file: !3, line: 61, type: !5)
!83 = !DILocation(line: 61, column: 21, scope: !81)
!84 = !DILocation(line: 62, column: 10, scope: !81)
!85 = !DILocation(line: 63, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !3, line: 63, column: 8)
!87 = !DILocation(line: 63, column: 18, scope: !86)
!88 = !DILocation(line: 63, column: 8, scope: !81)
!89 = !DILocation(line: 66, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !3, line: 64, column: 5)
!91 = !DILocation(line: 67, column: 5, scope: !90)
!92 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !3, line: 72, type: !5)
!93 = distinct !DILexicalBlock(scope: !94, file: !3, line: 70, column: 9)
!94 = distinct !DILexicalBlock(scope: !86, file: !3, line: 69, column: 5)
!95 = !DILocation(line: 72, column: 29, scope: !93)
!96 = !DILocation(line: 72, column: 59, scope: !93)
!97 = !DILocation(line: 72, column: 42, scope: !93)
!98 = !DILocation(line: 73, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !3, line: 73, column: 17)
!100 = !DILocation(line: 73, column: 28, scope: !99)
!101 = !DILocation(line: 73, column: 17, scope: !93)
!102 = !DILocation(line: 75, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !3, line: 74, column: 13)
!104 = !DILocation(line: 76, column: 17, scope: !103)
!105 = !DILocalVariable(name: "i", scope: !106, file: !3, line: 79, type: !43)
!106 = distinct !DILexicalBlock(scope: !93, file: !3, line: 78, column: 13)
!107 = !DILocation(line: 79, column: 24, scope: !106)
!108 = !DILocation(line: 80, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !3, line: 80, column: 17)
!110 = !DILocation(line: 80, column: 22, scope: !109)
!111 = !DILocation(line: 80, column: 29, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !3, line: 80, column: 17)
!113 = !DILocation(line: 80, column: 31, scope: !112)
!114 = !DILocation(line: 80, column: 17, scope: !109)
!115 = !DILocation(line: 82, column: 21, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !3, line: 81, column: 17)
!117 = !DILocation(line: 82, column: 32, scope: !116)
!118 = !DILocation(line: 82, column: 35, scope: !116)
!119 = !DILocation(line: 82, column: 42, scope: !116)
!120 = !DILocation(line: 83, column: 21, scope: !116)
!121 = !DILocation(line: 83, column: 32, scope: !116)
!122 = !DILocation(line: 83, column: 35, scope: !116)
!123 = !DILocation(line: 83, column: 42, scope: !116)
!124 = !DILocation(line: 84, column: 17, scope: !116)
!125 = !DILocation(line: 80, column: 39, scope: !112)
!126 = !DILocation(line: 80, column: 17, scope: !112)
!127 = distinct !{!127, !114, !128, !68}
!128 = !DILocation(line: 84, column: 17, scope: !109)
!129 = !DILocation(line: 86, column: 20, scope: !93)
!130 = !DILocation(line: 86, column: 18, scope: !93)
!131 = !DILocation(line: 89, column: 22, scope: !81)
!132 = !DILocation(line: 89, column: 5, scope: !81)
!133 = !DILocation(line: 91, column: 10, scope: !81)
!134 = !DILocation(line: 91, column: 5, scope: !81)
!135 = !DILocation(line: 92, column: 1, scope: !81)
!136 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 95, type: !24, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!137 = !DILocalVariable(name: "data", scope: !136, file: !3, line: 97, type: !5)
!138 = !DILocation(line: 97, column: 21, scope: !136)
!139 = !DILocation(line: 98, column: 10, scope: !136)
!140 = !DILocation(line: 99, column: 8, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !3, line: 99, column: 8)
!142 = !DILocation(line: 99, column: 18, scope: !141)
!143 = !DILocation(line: 99, column: 8, scope: !136)
!144 = !DILocalVariable(name: "dataBuffer", scope: !145, file: !3, line: 103, type: !5)
!145 = distinct !DILexicalBlock(scope: !146, file: !3, line: 101, column: 9)
!146 = distinct !DILexicalBlock(scope: !141, file: !3, line: 100, column: 5)
!147 = !DILocation(line: 103, column: 29, scope: !145)
!148 = !DILocation(line: 103, column: 59, scope: !145)
!149 = !DILocation(line: 103, column: 42, scope: !145)
!150 = !DILocation(line: 104, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !145, file: !3, line: 104, column: 17)
!152 = !DILocation(line: 104, column: 28, scope: !151)
!153 = !DILocation(line: 104, column: 17, scope: !145)
!154 = !DILocation(line: 106, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !3, line: 105, column: 13)
!156 = !DILocation(line: 107, column: 17, scope: !155)
!157 = !DILocalVariable(name: "i", scope: !158, file: !3, line: 110, type: !43)
!158 = distinct !DILexicalBlock(scope: !145, file: !3, line: 109, column: 13)
!159 = !DILocation(line: 110, column: 24, scope: !158)
!160 = !DILocation(line: 111, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !3, line: 111, column: 17)
!162 = !DILocation(line: 111, column: 22, scope: !161)
!163 = !DILocation(line: 111, column: 29, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !3, line: 111, column: 17)
!165 = !DILocation(line: 111, column: 31, scope: !164)
!166 = !DILocation(line: 111, column: 17, scope: !161)
!167 = !DILocation(line: 113, column: 21, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !3, line: 112, column: 17)
!169 = !DILocation(line: 113, column: 32, scope: !168)
!170 = !DILocation(line: 113, column: 35, scope: !168)
!171 = !DILocation(line: 113, column: 42, scope: !168)
!172 = !DILocation(line: 114, column: 21, scope: !168)
!173 = !DILocation(line: 114, column: 32, scope: !168)
!174 = !DILocation(line: 114, column: 35, scope: !168)
!175 = !DILocation(line: 114, column: 42, scope: !168)
!176 = !DILocation(line: 115, column: 17, scope: !168)
!177 = !DILocation(line: 111, column: 39, scope: !164)
!178 = !DILocation(line: 111, column: 17, scope: !164)
!179 = distinct !{!179, !166, !180, !68}
!180 = !DILocation(line: 115, column: 17, scope: !161)
!181 = !DILocation(line: 117, column: 20, scope: !145)
!182 = !DILocation(line: 117, column: 18, scope: !145)
!183 = !DILocation(line: 119, column: 5, scope: !146)
!184 = !DILocation(line: 120, column: 22, scope: !136)
!185 = !DILocation(line: 120, column: 5, scope: !136)
!186 = !DILocation(line: 122, column: 10, scope: !136)
!187 = !DILocation(line: 122, column: 5, scope: !136)
!188 = !DILocation(line: 123, column: 1, scope: !136)
