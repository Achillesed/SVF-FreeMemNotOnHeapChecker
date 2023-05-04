; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_static_06.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_static_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE590_Free_Memory_Not_on_Heap__free_struct_static_06_bad.dataBuffer = internal global [100 x %struct._twoIntsStruct] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_06_bad() #0 !dbg !2 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !30, metadata !DIExpression()), !dbg !31
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %0, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_06_bad.dataBuffer, i64 0, i64 %1, !dbg !51
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !52
  store i32 1, i32* %intOne, align 8, !dbg !53
  %2 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_06_bad.dataBuffer, i64 0, i64 %2, !dbg !55
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !56
  store i32 1, i32* %intTwo, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %3, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  store %struct._twoIntsStruct* getelementptr inbounds ([100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_06_bad.dataBuffer, i64 0, i64 0), %struct._twoIntsStruct** %data, align 8, !dbg !64
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 0, !dbg !65
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !66
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !67
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !67
  call void @free(i8* noundef %6) #5, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_06_good() #0 !dbg !70 {
entry:
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !75, metadata !DIExpression()), !dbg !76
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !82
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !83
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !84
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !82
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !85
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @exit(i32 noundef 1) #6, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !92, metadata !DIExpression()), !dbg !94
  store i64 0, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !97

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !98
  %cmp1 = icmp ult i64 %2, 100, !dbg !100
  br i1 %cmp1, label %for.body, label %for.end, !dbg !101

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !102
  %4 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !102
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !105
  store i32 1, i32* %intOne, align 4, !dbg !106
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !107
  %6 = load i64, i64* %i, align 8, !dbg !108
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !107
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !109
  store i32 1, i32* %intTwo, align 4, !dbg !110
  br label %for.inc, !dbg !111

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !112
  %inc = add i64 %7, 1, !dbg !112
  store i64 %inc, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !113, !llvm.loop !114

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !116
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !117
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !118
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !118
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !119
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !120
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !120
  call void @free(i8* noundef %11) #5, !dbg !121
  ret void, !dbg !122
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !123 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !124, metadata !DIExpression()), !dbg !125
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !127, metadata !DIExpression()), !dbg !131
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !132
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !133
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !131
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !134
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !136
  br i1 %cmp, label %if.then, label %if.end, !dbg !137

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !138
  call void @exit(i32 noundef 1) #6, !dbg !140
  unreachable, !dbg !140

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !147
  %cmp1 = icmp ult i64 %2, 100, !dbg !149
  br i1 %cmp1, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !151
  %4 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !151
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !154
  store i32 1, i32* %intOne, align 4, !dbg !155
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !156
  %6 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !156
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !158
  store i32 1, i32* %intTwo, align 4, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %7, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !165
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !166
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !167
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !167
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !168
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !169
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !169
  call void @free(i8* noundef %11) #5, !dbg !170
  ret void, !dbg !171
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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 35, type: !19, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_06_bad", scope: !3, file: !3, line: 27, type: !4, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_06.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "bdb7ff287eaf275a5909e40baf173888")
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
!30 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 29, type: !8)
!31 = !DILocation(line: 29, column: 21, scope: !2)
!32 = !DILocation(line: 30, column: 10, scope: !2)
!33 = !DILocalVariable(name: "i", scope: !34, file: !3, line: 37, type: !38)
!34 = distinct !DILexicalBlock(scope: !35, file: !3, line: 36, column: 13)
!35 = distinct !DILexicalBlock(scope: !36, file: !3, line: 33, column: 9)
!36 = distinct !DILexicalBlock(scope: !37, file: !3, line: 32, column: 5)
!37 = distinct !DILexicalBlock(scope: !2, file: !3, line: 31, column: 8)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 37, column: 24, scope: !34)
!42 = !DILocation(line: 38, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !34, file: !3, line: 38, column: 17)
!44 = !DILocation(line: 38, column: 22, scope: !43)
!45 = !DILocation(line: 38, column: 29, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !3, line: 38, column: 17)
!47 = !DILocation(line: 38, column: 31, scope: !46)
!48 = !DILocation(line: 38, column: 17, scope: !43)
!49 = !DILocation(line: 40, column: 32, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !3, line: 39, column: 17)
!51 = !DILocation(line: 40, column: 21, scope: !50)
!52 = !DILocation(line: 40, column: 35, scope: !50)
!53 = !DILocation(line: 40, column: 42, scope: !50)
!54 = !DILocation(line: 41, column: 32, scope: !50)
!55 = !DILocation(line: 41, column: 21, scope: !50)
!56 = !DILocation(line: 41, column: 35, scope: !50)
!57 = !DILocation(line: 41, column: 42, scope: !50)
!58 = !DILocation(line: 42, column: 17, scope: !50)
!59 = !DILocation(line: 38, column: 39, scope: !46)
!60 = !DILocation(line: 38, column: 17, scope: !46)
!61 = distinct !{!61, !48, !62, !63}
!62 = !DILocation(line: 42, column: 17, scope: !43)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 44, column: 18, scope: !35)
!65 = !DILocation(line: 47, column: 22, scope: !2)
!66 = !DILocation(line: 47, column: 5, scope: !2)
!67 = !DILocation(line: 49, column: 10, scope: !2)
!68 = !DILocation(line: 49, column: 5, scope: !2)
!69 = !DILocation(line: 50, column: 1, scope: !2)
!70 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_06_good", scope: !3, file: !3, line: 123, type: !4, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!71 = !DILocation(line: 125, column: 5, scope: !70)
!72 = !DILocation(line: 126, column: 5, scope: !70)
!73 = !DILocation(line: 127, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 57, type: !4, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!75 = !DILocalVariable(name: "data", scope: !74, file: !3, line: 59, type: !8)
!76 = !DILocation(line: 59, column: 21, scope: !74)
!77 = !DILocation(line: 60, column: 10, scope: !74)
!78 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !3, line: 70, type: !8)
!79 = distinct !DILexicalBlock(scope: !80, file: !3, line: 68, column: 9)
!80 = distinct !DILexicalBlock(scope: !81, file: !3, line: 67, column: 5)
!81 = distinct !DILexicalBlock(scope: !74, file: !3, line: 61, column: 8)
!82 = !DILocation(line: 70, column: 29, scope: !79)
!83 = !DILocation(line: 70, column: 59, scope: !79)
!84 = !DILocation(line: 70, column: 42, scope: !79)
!85 = !DILocation(line: 71, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !79, file: !3, line: 71, column: 17)
!87 = !DILocation(line: 71, column: 28, scope: !86)
!88 = !DILocation(line: 71, column: 17, scope: !79)
!89 = !DILocation(line: 73, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !3, line: 72, column: 13)
!91 = !DILocation(line: 74, column: 17, scope: !90)
!92 = !DILocalVariable(name: "i", scope: !93, file: !3, line: 77, type: !38)
!93 = distinct !DILexicalBlock(scope: !79, file: !3, line: 76, column: 13)
!94 = !DILocation(line: 77, column: 24, scope: !93)
!95 = !DILocation(line: 78, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !3, line: 78, column: 17)
!97 = !DILocation(line: 78, column: 22, scope: !96)
!98 = !DILocation(line: 78, column: 29, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !3, line: 78, column: 17)
!100 = !DILocation(line: 78, column: 31, scope: !99)
!101 = !DILocation(line: 78, column: 17, scope: !96)
!102 = !DILocation(line: 80, column: 21, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !3, line: 79, column: 17)
!104 = !DILocation(line: 80, column: 32, scope: !103)
!105 = !DILocation(line: 80, column: 35, scope: !103)
!106 = !DILocation(line: 80, column: 42, scope: !103)
!107 = !DILocation(line: 81, column: 21, scope: !103)
!108 = !DILocation(line: 81, column: 32, scope: !103)
!109 = !DILocation(line: 81, column: 35, scope: !103)
!110 = !DILocation(line: 81, column: 42, scope: !103)
!111 = !DILocation(line: 82, column: 17, scope: !103)
!112 = !DILocation(line: 78, column: 39, scope: !99)
!113 = !DILocation(line: 78, column: 17, scope: !99)
!114 = distinct !{!114, !101, !115, !63}
!115 = !DILocation(line: 82, column: 17, scope: !96)
!116 = !DILocation(line: 84, column: 20, scope: !79)
!117 = !DILocation(line: 84, column: 18, scope: !79)
!118 = !DILocation(line: 87, column: 22, scope: !74)
!119 = !DILocation(line: 87, column: 5, scope: !74)
!120 = !DILocation(line: 89, column: 10, scope: !74)
!121 = !DILocation(line: 89, column: 5, scope: !74)
!122 = !DILocation(line: 90, column: 1, scope: !74)
!123 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 93, type: !4, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!124 = !DILocalVariable(name: "data", scope: !123, file: !3, line: 95, type: !8)
!125 = !DILocation(line: 95, column: 21, scope: !123)
!126 = !DILocation(line: 96, column: 10, scope: !123)
!127 = !DILocalVariable(name: "dataBuffer", scope: !128, file: !3, line: 101, type: !8)
!128 = distinct !DILexicalBlock(scope: !129, file: !3, line: 99, column: 9)
!129 = distinct !DILexicalBlock(scope: !130, file: !3, line: 98, column: 5)
!130 = distinct !DILexicalBlock(scope: !123, file: !3, line: 97, column: 8)
!131 = !DILocation(line: 101, column: 29, scope: !128)
!132 = !DILocation(line: 101, column: 59, scope: !128)
!133 = !DILocation(line: 101, column: 42, scope: !128)
!134 = !DILocation(line: 102, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !128, file: !3, line: 102, column: 17)
!136 = !DILocation(line: 102, column: 28, scope: !135)
!137 = !DILocation(line: 102, column: 17, scope: !128)
!138 = !DILocation(line: 104, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !3, line: 103, column: 13)
!140 = !DILocation(line: 105, column: 17, scope: !139)
!141 = !DILocalVariable(name: "i", scope: !142, file: !3, line: 108, type: !38)
!142 = distinct !DILexicalBlock(scope: !128, file: !3, line: 107, column: 13)
!143 = !DILocation(line: 108, column: 24, scope: !142)
!144 = !DILocation(line: 109, column: 24, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !3, line: 109, column: 17)
!146 = !DILocation(line: 109, column: 22, scope: !145)
!147 = !DILocation(line: 109, column: 29, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !3, line: 109, column: 17)
!149 = !DILocation(line: 109, column: 31, scope: !148)
!150 = !DILocation(line: 109, column: 17, scope: !145)
!151 = !DILocation(line: 111, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !3, line: 110, column: 17)
!153 = !DILocation(line: 111, column: 32, scope: !152)
!154 = !DILocation(line: 111, column: 35, scope: !152)
!155 = !DILocation(line: 111, column: 42, scope: !152)
!156 = !DILocation(line: 112, column: 21, scope: !152)
!157 = !DILocation(line: 112, column: 32, scope: !152)
!158 = !DILocation(line: 112, column: 35, scope: !152)
!159 = !DILocation(line: 112, column: 42, scope: !152)
!160 = !DILocation(line: 113, column: 17, scope: !152)
!161 = !DILocation(line: 109, column: 39, scope: !148)
!162 = !DILocation(line: 109, column: 17, scope: !148)
!163 = distinct !{!163, !150, !164, !63}
!164 = !DILocation(line: 113, column: 17, scope: !145)
!165 = !DILocation(line: 115, column: 20, scope: !128)
!166 = !DILocation(line: 115, column: 18, scope: !128)
!167 = !DILocation(line: 118, column: 22, scope: !123)
!168 = !DILocation(line: 118, column: 5, scope: !123)
!169 = !DILocation(line: 120, column: 10, scope: !123)
!170 = !DILocation(line: 120, column: 5, scope: !123)
!171 = !DILocation(line: 121, column: 1, scope: !123)
