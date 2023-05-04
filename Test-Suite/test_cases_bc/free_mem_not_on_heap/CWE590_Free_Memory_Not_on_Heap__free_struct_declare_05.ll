; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_05.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@staticTrue = internal global i32 1, align 4, !dbg !0
@staticFalse = internal global i32 0, align 4, !dbg !15
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_05_bad() #0 !dbg !25 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !29, metadata !DIExpression()), !dbg !30
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %0 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool = icmp ne i32 %0, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataBuffer, metadata !35, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %1, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %2, !dbg !57
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !58
  store i32 1, i32* %intOne, align 8, !dbg !59
  %3 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %3, !dbg !61
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !62
  store i32 1, i32* %intTwo, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %4, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 0, !dbg !70
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !71
  br label %if.end, !dbg !72

if.end:                                           ; preds = %for.end, %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !73
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 0, !dbg !73
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !74
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !75
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !75
  call void @free(i8* noundef %7) #5, !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_05_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !85
  %0 = load i32, i32* @staticFalse, align 4, !dbg !86
  %tobool = icmp ne i32 %0, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !89
  br label %if.end4, !dbg !91

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !95
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !96
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !97
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !95
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !98
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !100
  br i1 %cmp, label %if.then1, label %if.end, !dbg !101

if.then1:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @exit(i32 noundef 1) #6, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !105, metadata !DIExpression()), !dbg !107
  store i64 0, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !110

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !111
  %cmp2 = icmp ult i64 %3, 100, !dbg !113
  br i1 %cmp2, label %for.body, label %for.end, !dbg !114

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !115
  %5 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !115
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !118
  store i32 1, i32* %intOne, align 4, !dbg !119
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !120
  %7 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !120
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !122
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
  br label %if.end4

if.end4:                                          ; preds = %for.end, %if.then
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !131
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !131
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx5), !dbg !132
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !140
  %tobool = icmp ne i32 %0, 0, !dbg !140
  br i1 %tobool, label %if.then, label %if.end4, !dbg !142

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !143, metadata !DIExpression()), !dbg !146
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !147
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !148
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !146
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !149
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !151
  br i1 %cmp, label %if.then1, label %if.end, !dbg !152

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !153
  call void @exit(i32 noundef 1) #6, !dbg !155
  unreachable, !dbg !155

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !156, metadata !DIExpression()), !dbg !158
  store i64 0, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !161

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !162
  %cmp2 = icmp ult i64 %3, 100, !dbg !164
  br i1 %cmp2, label %for.body, label %for.end, !dbg !165

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !166
  %5 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !166
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !169
  store i32 1, i32* %intOne, align 4, !dbg !170
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !171
  %7 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !171
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !173
  store i32 1, i32* %intTwo, align 4, !dbg !174
  br label %for.inc, !dbg !175

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !176
  %inc = add i64 %8, 1, !dbg !176
  store i64 %inc, i64* %i, align 8, !dbg !176
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !180
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !181
  br label %if.end4, !dbg !182

if.end4:                                          ; preds = %for.end, %entry
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !183
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !183
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx5), !dbg !184
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !185
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !185
  call void @free(i8* noundef %12) #5, !dbg !186
  ret void, !dbg !187
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !3, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_05.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "0f51d383dcf82a8451b6295193f0c2c3")
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
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !3, line: 26, type: !11, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 5}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"PIC Level", i32 2}
!21 = !{i32 7, !"PIE Level", i32 2}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!25 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_05_bad", scope: !3, file: !3, line: 30, type: !26, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !{}
!29 = !DILocalVariable(name: "data", scope: !25, file: !3, line: 32, type: !5)
!30 = !DILocation(line: 32, column: 21, scope: !25)
!31 = !DILocation(line: 33, column: 10, scope: !25)
!32 = !DILocation(line: 34, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !25, file: !3, line: 34, column: 8)
!34 = !DILocation(line: 34, column: 8, scope: !25)
!35 = !DILocalVariable(name: "dataBuffer", scope: !36, file: !3, line: 38, type: !38)
!36 = distinct !DILexicalBlock(scope: !37, file: !3, line: 36, column: 9)
!37 = distinct !DILexicalBlock(scope: !33, file: !3, line: 35, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 38, column: 27, scope: !36)
!42 = !DILocalVariable(name: "i", scope: !43, file: !3, line: 40, type: !44)
!43 = distinct !DILexicalBlock(scope: !36, file: !3, line: 39, column: 13)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 40, column: 24, scope: !43)
!48 = !DILocation(line: 41, column: 24, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !3, line: 41, column: 17)
!50 = !DILocation(line: 41, column: 22, scope: !49)
!51 = !DILocation(line: 41, column: 29, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !3, line: 41, column: 17)
!53 = !DILocation(line: 41, column: 31, scope: !52)
!54 = !DILocation(line: 41, column: 17, scope: !49)
!55 = !DILocation(line: 43, column: 32, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !3, line: 42, column: 17)
!57 = !DILocation(line: 43, column: 21, scope: !56)
!58 = !DILocation(line: 43, column: 35, scope: !56)
!59 = !DILocation(line: 43, column: 42, scope: !56)
!60 = !DILocation(line: 44, column: 32, scope: !56)
!61 = !DILocation(line: 44, column: 21, scope: !56)
!62 = !DILocation(line: 44, column: 35, scope: !56)
!63 = !DILocation(line: 44, column: 42, scope: !56)
!64 = !DILocation(line: 45, column: 17, scope: !56)
!65 = !DILocation(line: 41, column: 39, scope: !52)
!66 = !DILocation(line: 41, column: 17, scope: !52)
!67 = distinct !{!67, !54, !68, !69}
!68 = !DILocation(line: 45, column: 17, scope: !49)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 47, column: 20, scope: !36)
!71 = !DILocation(line: 47, column: 18, scope: !36)
!72 = !DILocation(line: 49, column: 5, scope: !37)
!73 = !DILocation(line: 50, column: 22, scope: !25)
!74 = !DILocation(line: 50, column: 5, scope: !25)
!75 = !DILocation(line: 52, column: 10, scope: !25)
!76 = !DILocation(line: 52, column: 5, scope: !25)
!77 = !DILocation(line: 53, column: 1, scope: !25)
!78 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_05_good", scope: !3, file: !3, line: 126, type: !26, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!79 = !DILocation(line: 128, column: 5, scope: !78)
!80 = !DILocation(line: 129, column: 5, scope: !78)
!81 = !DILocation(line: 130, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 60, type: !26, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!83 = !DILocalVariable(name: "data", scope: !82, file: !3, line: 62, type: !5)
!84 = !DILocation(line: 62, column: 21, scope: !82)
!85 = !DILocation(line: 63, column: 10, scope: !82)
!86 = !DILocation(line: 64, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !3, line: 64, column: 8)
!88 = !DILocation(line: 64, column: 8, scope: !82)
!89 = !DILocation(line: 67, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !3, line: 65, column: 5)
!91 = !DILocation(line: 68, column: 5, scope: !90)
!92 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !3, line: 73, type: !5)
!93 = distinct !DILexicalBlock(scope: !94, file: !3, line: 71, column: 9)
!94 = distinct !DILexicalBlock(scope: !87, file: !3, line: 70, column: 5)
!95 = !DILocation(line: 73, column: 29, scope: !93)
!96 = !DILocation(line: 73, column: 59, scope: !93)
!97 = !DILocation(line: 73, column: 42, scope: !93)
!98 = !DILocation(line: 74, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !3, line: 74, column: 17)
!100 = !DILocation(line: 74, column: 28, scope: !99)
!101 = !DILocation(line: 74, column: 17, scope: !93)
!102 = !DILocation(line: 76, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !3, line: 75, column: 13)
!104 = !DILocation(line: 77, column: 17, scope: !103)
!105 = !DILocalVariable(name: "i", scope: !106, file: !3, line: 80, type: !44)
!106 = distinct !DILexicalBlock(scope: !93, file: !3, line: 79, column: 13)
!107 = !DILocation(line: 80, column: 24, scope: !106)
!108 = !DILocation(line: 81, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !3, line: 81, column: 17)
!110 = !DILocation(line: 81, column: 22, scope: !109)
!111 = !DILocation(line: 81, column: 29, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !3, line: 81, column: 17)
!113 = !DILocation(line: 81, column: 31, scope: !112)
!114 = !DILocation(line: 81, column: 17, scope: !109)
!115 = !DILocation(line: 83, column: 21, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !3, line: 82, column: 17)
!117 = !DILocation(line: 83, column: 32, scope: !116)
!118 = !DILocation(line: 83, column: 35, scope: !116)
!119 = !DILocation(line: 83, column: 42, scope: !116)
!120 = !DILocation(line: 84, column: 21, scope: !116)
!121 = !DILocation(line: 84, column: 32, scope: !116)
!122 = !DILocation(line: 84, column: 35, scope: !116)
!123 = !DILocation(line: 84, column: 42, scope: !116)
!124 = !DILocation(line: 85, column: 17, scope: !116)
!125 = !DILocation(line: 81, column: 39, scope: !112)
!126 = !DILocation(line: 81, column: 17, scope: !112)
!127 = distinct !{!127, !114, !128, !69}
!128 = !DILocation(line: 85, column: 17, scope: !109)
!129 = !DILocation(line: 87, column: 20, scope: !93)
!130 = !DILocation(line: 87, column: 18, scope: !93)
!131 = !DILocation(line: 90, column: 22, scope: !82)
!132 = !DILocation(line: 90, column: 5, scope: !82)
!133 = !DILocation(line: 92, column: 10, scope: !82)
!134 = !DILocation(line: 92, column: 5, scope: !82)
!135 = !DILocation(line: 93, column: 1, scope: !82)
!136 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 96, type: !26, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!137 = !DILocalVariable(name: "data", scope: !136, file: !3, line: 98, type: !5)
!138 = !DILocation(line: 98, column: 21, scope: !136)
!139 = !DILocation(line: 99, column: 10, scope: !136)
!140 = !DILocation(line: 100, column: 8, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !3, line: 100, column: 8)
!142 = !DILocation(line: 100, column: 8, scope: !136)
!143 = !DILocalVariable(name: "dataBuffer", scope: !144, file: !3, line: 104, type: !5)
!144 = distinct !DILexicalBlock(scope: !145, file: !3, line: 102, column: 9)
!145 = distinct !DILexicalBlock(scope: !141, file: !3, line: 101, column: 5)
!146 = !DILocation(line: 104, column: 29, scope: !144)
!147 = !DILocation(line: 104, column: 59, scope: !144)
!148 = !DILocation(line: 104, column: 42, scope: !144)
!149 = !DILocation(line: 105, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !144, file: !3, line: 105, column: 17)
!151 = !DILocation(line: 105, column: 28, scope: !150)
!152 = !DILocation(line: 105, column: 17, scope: !144)
!153 = !DILocation(line: 107, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !3, line: 106, column: 13)
!155 = !DILocation(line: 108, column: 17, scope: !154)
!156 = !DILocalVariable(name: "i", scope: !157, file: !3, line: 111, type: !44)
!157 = distinct !DILexicalBlock(scope: !144, file: !3, line: 110, column: 13)
!158 = !DILocation(line: 111, column: 24, scope: !157)
!159 = !DILocation(line: 112, column: 24, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !3, line: 112, column: 17)
!161 = !DILocation(line: 112, column: 22, scope: !160)
!162 = !DILocation(line: 112, column: 29, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !3, line: 112, column: 17)
!164 = !DILocation(line: 112, column: 31, scope: !163)
!165 = !DILocation(line: 112, column: 17, scope: !160)
!166 = !DILocation(line: 114, column: 21, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !3, line: 113, column: 17)
!168 = !DILocation(line: 114, column: 32, scope: !167)
!169 = !DILocation(line: 114, column: 35, scope: !167)
!170 = !DILocation(line: 114, column: 42, scope: !167)
!171 = !DILocation(line: 115, column: 21, scope: !167)
!172 = !DILocation(line: 115, column: 32, scope: !167)
!173 = !DILocation(line: 115, column: 35, scope: !167)
!174 = !DILocation(line: 115, column: 42, scope: !167)
!175 = !DILocation(line: 116, column: 17, scope: !167)
!176 = !DILocation(line: 112, column: 39, scope: !163)
!177 = !DILocation(line: 112, column: 17, scope: !163)
!178 = distinct !{!178, !165, !179, !69}
!179 = !DILocation(line: 116, column: 17, scope: !160)
!180 = !DILocation(line: 118, column: 20, scope: !144)
!181 = !DILocation(line: 118, column: 18, scope: !144)
!182 = !DILocation(line: 120, column: 5, scope: !145)
!183 = !DILocation(line: 121, column: 22, scope: !136)
!184 = !DILocation(line: 121, column: 5, scope: !136)
!185 = !DILocation(line: 123, column: 10, scope: !136)
!186 = !DILocation(line: 123, column: 5, scope: !136)
!187 = !DILocation(line: 124, column: 1, scope: !136)
