; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_static_07.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_static_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@staticFive = internal global i32 5, align 4, !dbg !0
@CWE590_Free_Memory_Not_on_Heap__free_struct_static_07_bad.dataBuffer = internal global [100 x %struct._twoIntsStruct] zeroinitializer, align 16, !dbg !15
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_07_bad() #0 !dbg !17 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !32, metadata !DIExpression()), !dbg !33
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %0 = load i32, i32* @staticFive, align 4, !dbg !35
  %cmp = icmp eq i32 %0, 5, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i64, i64* %i, align 8, !dbg !50
  %cmp1 = icmp ult i64 %1, 100, !dbg !52
  br i1 %cmp1, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_07_bad.dataBuffer, i64 0, i64 %2, !dbg !56
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !57
  store i32 1, i32* %intOne, align 8, !dbg !58
  %3 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_07_bad.dataBuffer, i64 0, i64 %3, !dbg !60
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !61
  store i32 1, i32* %intTwo, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %4, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  store %struct._twoIntsStruct* getelementptr inbounds ([100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_07_bad.dataBuffer, i64 0, i64 0), %struct._twoIntsStruct** %data, align 8, !dbg !69
  br label %if.end, !dbg !70

if.end:                                           ; preds = %for.end, %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !71
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 0, !dbg !71
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !72
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !73
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !73
  call void @free(i8* noundef %7) #5, !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_07_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !83
  %0 = load i32, i32* @staticFive, align 4, !dbg !84
  %cmp = icmp ne i32 %0, 5, !dbg !86
  br i1 %cmp, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !88
  br label %if.end5, !dbg !90

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !94
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !95
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !96
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !94
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !97
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !99
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !100

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @exit(i32 noundef 1) #6, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !104, metadata !DIExpression()), !dbg !106
  store i64 0, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !109

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !110
  %cmp3 = icmp ult i64 %3, 100, !dbg !112
  br i1 %cmp3, label %for.body, label %for.end, !dbg !113

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !114
  %5 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !114
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !117
  store i32 1, i32* %intOne, align 4, !dbg !118
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !119
  %7 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !119
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !121
  store i32 1, i32* %intTwo, align 4, !dbg !122
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !124
  %inc = add i64 %8, 1, !dbg !124
  store i64 %inc, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !128
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !129
  br label %if.end5

if.end5:                                          ; preds = %for.end, %if.then
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !130
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !130
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx6), !dbg !131
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !132
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !132
  call void @free(i8* noundef %12) #5, !dbg !133
  ret void, !dbg !134
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !135 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !136, metadata !DIExpression()), !dbg !137
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !138
  %0 = load i32, i32* @staticFive, align 4, !dbg !139
  %cmp = icmp eq i32 %0, 5, !dbg !141
  br i1 %cmp, label %if.then, label %if.end5, !dbg !142

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !143, metadata !DIExpression()), !dbg !146
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !147
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !148
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !146
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !149
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !151
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !152

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !153
  call void @exit(i32 noundef 1) #6, !dbg !155
  unreachable, !dbg !155

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !156, metadata !DIExpression()), !dbg !158
  store i64 0, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !161

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !162
  %cmp3 = icmp ult i64 %3, 100, !dbg !164
  br i1 %cmp3, label %for.body, label %for.end, !dbg !165

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !166
  %5 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !166
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !169
  store i32 1, i32* %intOne, align 4, !dbg !170
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !171
  %7 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !171
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !173
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
  br label %if.end5, !dbg !182

if.end5:                                          ; preds = %for.end, %entry
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !183
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !183
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx6), !dbg !184
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
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29, !30}
!llvm.ident = !{!31}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !3, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_07.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "9b74e2d95c62992d1e6d4453e35d832b")
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
!14 = !{!15, !0}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !17, file: !3, line: 37, type: !21, isLocal: true, isDefinition: true)
!17 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_07_bad", scope: !3, file: !3, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !20)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !{}
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !{i32 7, !"Dwarf Version", i32 5}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{i32 1, !"wchar_size", i32 4}
!27 = !{i32 7, !"PIC Level", i32 2}
!28 = !{i32 7, !"PIE Level", i32 2}
!29 = !{i32 7, !"uwtable", i32 1}
!30 = !{i32 7, !"frame-pointer", i32 2}
!31 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!32 = !DILocalVariable(name: "data", scope: !17, file: !3, line: 31, type: !5)
!33 = !DILocation(line: 31, column: 21, scope: !17)
!34 = !DILocation(line: 32, column: 10, scope: !17)
!35 = !DILocation(line: 33, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !17, file: !3, line: 33, column: 8)
!37 = !DILocation(line: 33, column: 18, scope: !36)
!38 = !DILocation(line: 33, column: 8, scope: !17)
!39 = !DILocalVariable(name: "i", scope: !40, file: !3, line: 39, type: !43)
!40 = distinct !DILexicalBlock(scope: !41, file: !3, line: 38, column: 13)
!41 = distinct !DILexicalBlock(scope: !42, file: !3, line: 35, column: 9)
!42 = distinct !DILexicalBlock(scope: !36, file: !3, line: 34, column: 5)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!45 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 39, column: 24, scope: !40)
!47 = !DILocation(line: 40, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !40, file: !3, line: 40, column: 17)
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
!69 = !DILocation(line: 46, column: 18, scope: !41)
!70 = !DILocation(line: 48, column: 5, scope: !42)
!71 = !DILocation(line: 49, column: 22, scope: !17)
!72 = !DILocation(line: 49, column: 5, scope: !17)
!73 = !DILocation(line: 51, column: 10, scope: !17)
!74 = !DILocation(line: 51, column: 5, scope: !17)
!75 = !DILocation(line: 52, column: 1, scope: !17)
!76 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_07_good", scope: !3, file: !3, line: 125, type: !18, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !20)
!77 = !DILocation(line: 127, column: 5, scope: !76)
!78 = !DILocation(line: 128, column: 5, scope: !76)
!79 = !DILocation(line: 129, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 59, type: !18, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !20)
!81 = !DILocalVariable(name: "data", scope: !80, file: !3, line: 61, type: !5)
!82 = !DILocation(line: 61, column: 21, scope: !80)
!83 = !DILocation(line: 62, column: 10, scope: !80)
!84 = !DILocation(line: 63, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !3, line: 63, column: 8)
!86 = !DILocation(line: 63, column: 18, scope: !85)
!87 = !DILocation(line: 63, column: 8, scope: !80)
!88 = !DILocation(line: 66, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !3, line: 64, column: 5)
!90 = !DILocation(line: 67, column: 5, scope: !89)
!91 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !3, line: 72, type: !5)
!92 = distinct !DILexicalBlock(scope: !93, file: !3, line: 70, column: 9)
!93 = distinct !DILexicalBlock(scope: !85, file: !3, line: 69, column: 5)
!94 = !DILocation(line: 72, column: 29, scope: !92)
!95 = !DILocation(line: 72, column: 59, scope: !92)
!96 = !DILocation(line: 72, column: 42, scope: !92)
!97 = !DILocation(line: 73, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !3, line: 73, column: 17)
!99 = !DILocation(line: 73, column: 28, scope: !98)
!100 = !DILocation(line: 73, column: 17, scope: !92)
!101 = !DILocation(line: 75, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !3, line: 74, column: 13)
!103 = !DILocation(line: 76, column: 17, scope: !102)
!104 = !DILocalVariable(name: "i", scope: !105, file: !3, line: 79, type: !43)
!105 = distinct !DILexicalBlock(scope: !92, file: !3, line: 78, column: 13)
!106 = !DILocation(line: 79, column: 24, scope: !105)
!107 = !DILocation(line: 80, column: 24, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !3, line: 80, column: 17)
!109 = !DILocation(line: 80, column: 22, scope: !108)
!110 = !DILocation(line: 80, column: 29, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !3, line: 80, column: 17)
!112 = !DILocation(line: 80, column: 31, scope: !111)
!113 = !DILocation(line: 80, column: 17, scope: !108)
!114 = !DILocation(line: 82, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !3, line: 81, column: 17)
!116 = !DILocation(line: 82, column: 32, scope: !115)
!117 = !DILocation(line: 82, column: 35, scope: !115)
!118 = !DILocation(line: 82, column: 42, scope: !115)
!119 = !DILocation(line: 83, column: 21, scope: !115)
!120 = !DILocation(line: 83, column: 32, scope: !115)
!121 = !DILocation(line: 83, column: 35, scope: !115)
!122 = !DILocation(line: 83, column: 42, scope: !115)
!123 = !DILocation(line: 84, column: 17, scope: !115)
!124 = !DILocation(line: 80, column: 39, scope: !111)
!125 = !DILocation(line: 80, column: 17, scope: !111)
!126 = distinct !{!126, !113, !127, !68}
!127 = !DILocation(line: 84, column: 17, scope: !108)
!128 = !DILocation(line: 86, column: 20, scope: !92)
!129 = !DILocation(line: 86, column: 18, scope: !92)
!130 = !DILocation(line: 89, column: 22, scope: !80)
!131 = !DILocation(line: 89, column: 5, scope: !80)
!132 = !DILocation(line: 91, column: 10, scope: !80)
!133 = !DILocation(line: 91, column: 5, scope: !80)
!134 = !DILocation(line: 92, column: 1, scope: !80)
!135 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 95, type: !18, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !20)
!136 = !DILocalVariable(name: "data", scope: !135, file: !3, line: 97, type: !5)
!137 = !DILocation(line: 97, column: 21, scope: !135)
!138 = !DILocation(line: 98, column: 10, scope: !135)
!139 = !DILocation(line: 99, column: 8, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !3, line: 99, column: 8)
!141 = !DILocation(line: 99, column: 18, scope: !140)
!142 = !DILocation(line: 99, column: 8, scope: !135)
!143 = !DILocalVariable(name: "dataBuffer", scope: !144, file: !3, line: 103, type: !5)
!144 = distinct !DILexicalBlock(scope: !145, file: !3, line: 101, column: 9)
!145 = distinct !DILexicalBlock(scope: !140, file: !3, line: 100, column: 5)
!146 = !DILocation(line: 103, column: 29, scope: !144)
!147 = !DILocation(line: 103, column: 59, scope: !144)
!148 = !DILocation(line: 103, column: 42, scope: !144)
!149 = !DILocation(line: 104, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !144, file: !3, line: 104, column: 17)
!151 = !DILocation(line: 104, column: 28, scope: !150)
!152 = !DILocation(line: 104, column: 17, scope: !144)
!153 = !DILocation(line: 106, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !3, line: 105, column: 13)
!155 = !DILocation(line: 107, column: 17, scope: !154)
!156 = !DILocalVariable(name: "i", scope: !157, file: !3, line: 110, type: !43)
!157 = distinct !DILexicalBlock(scope: !144, file: !3, line: 109, column: 13)
!158 = !DILocation(line: 110, column: 24, scope: !157)
!159 = !DILocation(line: 111, column: 24, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !3, line: 111, column: 17)
!161 = !DILocation(line: 111, column: 22, scope: !160)
!162 = !DILocation(line: 111, column: 29, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !3, line: 111, column: 17)
!164 = !DILocation(line: 111, column: 31, scope: !163)
!165 = !DILocation(line: 111, column: 17, scope: !160)
!166 = !DILocation(line: 113, column: 21, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !3, line: 112, column: 17)
!168 = !DILocation(line: 113, column: 32, scope: !167)
!169 = !DILocation(line: 113, column: 35, scope: !167)
!170 = !DILocation(line: 113, column: 42, scope: !167)
!171 = !DILocation(line: 114, column: 21, scope: !167)
!172 = !DILocation(line: 114, column: 32, scope: !167)
!173 = !DILocation(line: 114, column: 35, scope: !167)
!174 = !DILocation(line: 114, column: 42, scope: !167)
!175 = !DILocation(line: 115, column: 17, scope: !167)
!176 = !DILocation(line: 111, column: 39, scope: !163)
!177 = !DILocation(line: 111, column: 17, scope: !163)
!178 = distinct !{!178, !165, !179, !68}
!179 = !DILocation(line: 115, column: 17, scope: !160)
!180 = !DILocation(line: 117, column: 20, scope: !144)
!181 = !DILocation(line: 117, column: 18, scope: !144)
!182 = !DILocation(line: 119, column: 5, scope: !145)
!183 = !DILocation(line: 120, column: 22, scope: !135)
!184 = !DILocation(line: 120, column: 5, scope: !135)
!185 = !DILocation(line: 122, column: 10, scope: !135)
!186 = !DILocation(line: 122, column: 5, scope: !135)
!187 = !DILocation(line: 123, column: 1, scope: !135)
