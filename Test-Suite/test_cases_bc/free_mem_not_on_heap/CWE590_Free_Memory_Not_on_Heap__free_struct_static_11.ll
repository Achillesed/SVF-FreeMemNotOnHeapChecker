; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_static_11.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_static_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE590_Free_Memory_Not_on_Heap__free_struct_static_11_bad.dataBuffer = internal global [100 x %struct._twoIntsStruct] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_11_bad() #0 !dbg !2 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !30, metadata !DIExpression()), !dbg !31
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %call = call i32 (...) @globalReturnsTrue(), !dbg !33
  %tobool = icmp ne i32 %call, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

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
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_11_bad.dataBuffer, i64 0, i64 %1, !dbg !53
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !54
  store i32 1, i32* %intOne, align 8, !dbg !55
  %2 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_11_bad.dataBuffer, i64 0, i64 %2, !dbg !57
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !58
  store i32 1, i32* %intTwo, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %3, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  store %struct._twoIntsStruct* getelementptr inbounds ([100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_11_bad.dataBuffer, i64 0, i64 0), %struct._twoIntsStruct** %data, align 8, !dbg !66
  br label %if.end, !dbg !67

if.end:                                           ; preds = %for.end, %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 0, !dbg !68
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !69
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !70
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !70
  call void @free(i8* noundef %6) #5, !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_11_good() #0 !dbg !73 {
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
  %call = call i32 (...) @globalReturnsFalse(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !84
  br label %if.end5, !dbg !86

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !90
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !91
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !92
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !90
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !93
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !95
  br i1 %cmp, label %if.then2, label %if.end, !dbg !96

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @exit(i32 noundef 1) #6, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !100, metadata !DIExpression()), !dbg !102
  store i64 0, i64* %i, align 8, !dbg !103
  br label %for.cond, !dbg !105

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !106
  %cmp3 = icmp ult i64 %2, 100, !dbg !108
  br i1 %cmp3, label %for.body, label %for.end, !dbg !109

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !110
  %4 = load i64, i64* %i, align 8, !dbg !112
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !110
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !113
  store i32 1, i32* %intOne, align 4, !dbg !114
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !115
  %6 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !115
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !117
  store i32 1, i32* %intTwo, align 4, !dbg !118
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !120
  %inc = add i64 %7, 1, !dbg !120
  store i64 %inc, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !121, !llvm.loop !122

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !124
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !125
  br label %if.end5

if.end5:                                          ; preds = %for.end, %if.then
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !126
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !126
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx6), !dbg !127
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !128
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !128
  call void @free(i8* noundef %11) #5, !dbg !129
  ret void, !dbg !130
}

declare i32 @globalReturnsFalse(...) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !131 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !132, metadata !DIExpression()), !dbg !133
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !134
  %call = call i32 (...) @globalReturnsTrue(), !dbg !135
  %tobool = icmp ne i32 %call, 0, !dbg !135
  br i1 %tobool, label %if.then, label %if.end5, !dbg !137

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !138, metadata !DIExpression()), !dbg !141
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !142
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !143
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !141
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !144
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !146
  br i1 %cmp, label %if.then2, label %if.end, !dbg !147

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !148
  call void @exit(i32 noundef 1) #6, !dbg !150
  unreachable, !dbg !150

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !151, metadata !DIExpression()), !dbg !153
  store i64 0, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !157
  %cmp3 = icmp ult i64 %2, 100, !dbg !159
  br i1 %cmp3, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !161
  %4 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !161
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !164
  store i32 1, i32* %intOne, align 4, !dbg !165
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !166
  %6 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !166
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !168
  store i32 1, i32* %intTwo, align 4, !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !171
  %inc = add i64 %7, 1, !dbg !171
  store i64 %inc, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !175
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !176
  br label %if.end5, !dbg !177

if.end5:                                          ; preds = %for.end, %entry
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !178
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !178
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx6), !dbg !179
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !180
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !180
  call void @free(i8* noundef %11) #5, !dbg !181
  ret void, !dbg !182
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
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_11_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_11.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "2ee30a1eb79afea6b6f1cad4ce5350de")
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
!68 = !DILocation(line: 43, column: 22, scope: !2)
!69 = !DILocation(line: 43, column: 5, scope: !2)
!70 = !DILocation(line: 45, column: 10, scope: !2)
!71 = !DILocation(line: 45, column: 5, scope: !2)
!72 = !DILocation(line: 46, column: 1, scope: !2)
!73 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_11_good", scope: !3, file: !3, line: 119, type: !4, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!74 = !DILocation(line: 121, column: 5, scope: !73)
!75 = !DILocation(line: 122, column: 5, scope: !73)
!76 = !DILocation(line: 123, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 53, type: !4, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!78 = !DILocalVariable(name: "data", scope: !77, file: !3, line: 55, type: !8)
!79 = !DILocation(line: 55, column: 21, scope: !77)
!80 = !DILocation(line: 56, column: 10, scope: !77)
!81 = !DILocation(line: 57, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !3, line: 57, column: 8)
!83 = !DILocation(line: 57, column: 8, scope: !77)
!84 = !DILocation(line: 60, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !3, line: 58, column: 5)
!86 = !DILocation(line: 61, column: 5, scope: !85)
!87 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !3, line: 66, type: !8)
!88 = distinct !DILexicalBlock(scope: !89, file: !3, line: 64, column: 9)
!89 = distinct !DILexicalBlock(scope: !82, file: !3, line: 63, column: 5)
!90 = !DILocation(line: 66, column: 29, scope: !88)
!91 = !DILocation(line: 66, column: 59, scope: !88)
!92 = !DILocation(line: 66, column: 42, scope: !88)
!93 = !DILocation(line: 67, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !3, line: 67, column: 17)
!95 = !DILocation(line: 67, column: 28, scope: !94)
!96 = !DILocation(line: 67, column: 17, scope: !88)
!97 = !DILocation(line: 69, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !3, line: 68, column: 13)
!99 = !DILocation(line: 70, column: 17, scope: !98)
!100 = !DILocalVariable(name: "i", scope: !101, file: !3, line: 73, type: !40)
!101 = distinct !DILexicalBlock(scope: !88, file: !3, line: 72, column: 13)
!102 = !DILocation(line: 73, column: 24, scope: !101)
!103 = !DILocation(line: 74, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !3, line: 74, column: 17)
!105 = !DILocation(line: 74, column: 22, scope: !104)
!106 = !DILocation(line: 74, column: 29, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !3, line: 74, column: 17)
!108 = !DILocation(line: 74, column: 31, scope: !107)
!109 = !DILocation(line: 74, column: 17, scope: !104)
!110 = !DILocation(line: 76, column: 21, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !3, line: 75, column: 17)
!112 = !DILocation(line: 76, column: 32, scope: !111)
!113 = !DILocation(line: 76, column: 35, scope: !111)
!114 = !DILocation(line: 76, column: 42, scope: !111)
!115 = !DILocation(line: 77, column: 21, scope: !111)
!116 = !DILocation(line: 77, column: 32, scope: !111)
!117 = !DILocation(line: 77, column: 35, scope: !111)
!118 = !DILocation(line: 77, column: 42, scope: !111)
!119 = !DILocation(line: 78, column: 17, scope: !111)
!120 = !DILocation(line: 74, column: 39, scope: !107)
!121 = !DILocation(line: 74, column: 17, scope: !107)
!122 = distinct !{!122, !109, !123, !65}
!123 = !DILocation(line: 78, column: 17, scope: !104)
!124 = !DILocation(line: 80, column: 20, scope: !88)
!125 = !DILocation(line: 80, column: 18, scope: !88)
!126 = !DILocation(line: 83, column: 22, scope: !77)
!127 = !DILocation(line: 83, column: 5, scope: !77)
!128 = !DILocation(line: 85, column: 10, scope: !77)
!129 = !DILocation(line: 85, column: 5, scope: !77)
!130 = !DILocation(line: 86, column: 1, scope: !77)
!131 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 89, type: !4, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!132 = !DILocalVariable(name: "data", scope: !131, file: !3, line: 91, type: !8)
!133 = !DILocation(line: 91, column: 21, scope: !131)
!134 = !DILocation(line: 92, column: 10, scope: !131)
!135 = !DILocation(line: 93, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !3, line: 93, column: 8)
!137 = !DILocation(line: 93, column: 8, scope: !131)
!138 = !DILocalVariable(name: "dataBuffer", scope: !139, file: !3, line: 97, type: !8)
!139 = distinct !DILexicalBlock(scope: !140, file: !3, line: 95, column: 9)
!140 = distinct !DILexicalBlock(scope: !136, file: !3, line: 94, column: 5)
!141 = !DILocation(line: 97, column: 29, scope: !139)
!142 = !DILocation(line: 97, column: 59, scope: !139)
!143 = !DILocation(line: 97, column: 42, scope: !139)
!144 = !DILocation(line: 98, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !139, file: !3, line: 98, column: 17)
!146 = !DILocation(line: 98, column: 28, scope: !145)
!147 = !DILocation(line: 98, column: 17, scope: !139)
!148 = !DILocation(line: 100, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !3, line: 99, column: 13)
!150 = !DILocation(line: 101, column: 17, scope: !149)
!151 = !DILocalVariable(name: "i", scope: !152, file: !3, line: 104, type: !40)
!152 = distinct !DILexicalBlock(scope: !139, file: !3, line: 103, column: 13)
!153 = !DILocation(line: 104, column: 24, scope: !152)
!154 = !DILocation(line: 105, column: 24, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !3, line: 105, column: 17)
!156 = !DILocation(line: 105, column: 22, scope: !155)
!157 = !DILocation(line: 105, column: 29, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !3, line: 105, column: 17)
!159 = !DILocation(line: 105, column: 31, scope: !158)
!160 = !DILocation(line: 105, column: 17, scope: !155)
!161 = !DILocation(line: 107, column: 21, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !3, line: 106, column: 17)
!163 = !DILocation(line: 107, column: 32, scope: !162)
!164 = !DILocation(line: 107, column: 35, scope: !162)
!165 = !DILocation(line: 107, column: 42, scope: !162)
!166 = !DILocation(line: 108, column: 21, scope: !162)
!167 = !DILocation(line: 108, column: 32, scope: !162)
!168 = !DILocation(line: 108, column: 35, scope: !162)
!169 = !DILocation(line: 108, column: 42, scope: !162)
!170 = !DILocation(line: 109, column: 17, scope: !162)
!171 = !DILocation(line: 105, column: 39, scope: !158)
!172 = !DILocation(line: 105, column: 17, scope: !158)
!173 = distinct !{!173, !160, !174, !65}
!174 = !DILocation(line: 109, column: 17, scope: !155)
!175 = !DILocation(line: 111, column: 20, scope: !139)
!176 = !DILocation(line: 111, column: 18, scope: !139)
!177 = !DILocation(line: 113, column: 5, scope: !140)
!178 = !DILocation(line: 114, column: 22, scope: !131)
!179 = !DILocation(line: 114, column: 5, scope: !131)
!180 = !DILocation(line: 116, column: 10, scope: !131)
!181 = !DILocation(line: 116, column: 5, scope: !131)
!182 = !DILocation(line: 117, column: 1, scope: !131)
