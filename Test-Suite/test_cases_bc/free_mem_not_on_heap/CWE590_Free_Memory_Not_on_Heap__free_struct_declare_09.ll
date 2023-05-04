; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_09.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@GLOBAL_CONST_TRUE = external constant i32, align 4
@GLOBAL_CONST_FALSE = external constant i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_09_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %1, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %2, !dbg !52
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !53
  store i32 1, i32* %intOne, align 8, !dbg !54
  %3 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %3, !dbg !56
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !57
  store i32 1, i32* %intTwo, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %4, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 0, !dbg !65
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !66
  br label %if.end, !dbg !67

if.end:                                           ; preds = %for.end, %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 0, !dbg !68
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !69
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !70
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !70
  call void @free(i8* noundef %7) #5, !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_09_good() #0 !dbg !73 {
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
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !81
  %tobool = icmp ne i32 %0, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !84
  br label %if.end4, !dbg !86

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !90
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !91
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !92
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !90
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !93
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !95
  br i1 %cmp, label %if.then1, label %if.end, !dbg !96

if.then1:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @exit(i32 noundef 1) #6, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !100, metadata !DIExpression()), !dbg !102
  store i64 0, i64* %i, align 8, !dbg !103
  br label %for.cond, !dbg !105

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !106
  %cmp2 = icmp ult i64 %3, 100, !dbg !108
  br i1 %cmp2, label %for.body, label %for.end, !dbg !109

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !110
  %5 = load i64, i64* %i, align 8, !dbg !112
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !110
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !113
  store i32 1, i32* %intOne, align 4, !dbg !114
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !115
  %7 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !115
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !117
  store i32 1, i32* %intTwo, align 4, !dbg !118
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !120
  %inc = add i64 %8, 1, !dbg !120
  store i64 %inc, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !121, !llvm.loop !122

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !124
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !125
  br label %if.end4

if.end4:                                          ; preds = %for.end, %if.then
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !126
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !126
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx5), !dbg !127
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !128
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !128
  call void @free(i8* noundef %12) #5, !dbg !129
  ret void, !dbg !130
}

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
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !135
  %tobool = icmp ne i32 %0, 0, !dbg !135
  br i1 %tobool, label %if.then, label %if.end4, !dbg !137

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !138, metadata !DIExpression()), !dbg !141
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !142
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !143
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !141
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !144
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !146
  br i1 %cmp, label %if.then1, label %if.end, !dbg !147

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !148
  call void @exit(i32 noundef 1) #6, !dbg !150
  unreachable, !dbg !150

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !151, metadata !DIExpression()), !dbg !153
  store i64 0, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !157
  %cmp2 = icmp ult i64 %3, 100, !dbg !159
  br i1 %cmp2, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !161
  %5 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !161
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !164
  store i32 1, i32* %intOne, align 4, !dbg !165
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !166
  %7 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !166
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !168
  store i32 1, i32* %intTwo, align 4, !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !171
  %inc = add i64 %8, 1, !dbg !171
  store i64 %inc, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !175
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !176
  br label %if.end4, !dbg !177

if.end4:                                          ; preds = %for.end, %entry
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !178
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !178
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx5), !dbg !179
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !180
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !180
  call void @free(i8* noundef %12) #5, !dbg !181
  ret void, !dbg !182
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_09.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "c89af326b050cdd637b1aa9195eacfa4")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_09_bad", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
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
!68 = !DILocation(line: 43, column: 22, scope: !20)
!69 = !DILocation(line: 43, column: 5, scope: !20)
!70 = !DILocation(line: 45, column: 10, scope: !20)
!71 = !DILocation(line: 45, column: 5, scope: !20)
!72 = !DILocation(line: 46, column: 1, scope: !20)
!73 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_09_good", scope: !1, file: !1, line: 119, type: !21, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!74 = !DILocation(line: 121, column: 5, scope: !73)
!75 = !DILocation(line: 122, column: 5, scope: !73)
!76 = !DILocation(line: 123, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 53, type: !21, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!78 = !DILocalVariable(name: "data", scope: !77, file: !1, line: 55, type: !3)
!79 = !DILocation(line: 55, column: 21, scope: !77)
!80 = !DILocation(line: 56, column: 10, scope: !77)
!81 = !DILocation(line: 57, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !1, line: 57, column: 8)
!83 = !DILocation(line: 57, column: 8, scope: !77)
!84 = !DILocation(line: 60, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !1, line: 58, column: 5)
!86 = !DILocation(line: 61, column: 5, scope: !85)
!87 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !1, line: 66, type: !3)
!88 = distinct !DILexicalBlock(scope: !89, file: !1, line: 64, column: 9)
!89 = distinct !DILexicalBlock(scope: !82, file: !1, line: 63, column: 5)
!90 = !DILocation(line: 66, column: 29, scope: !88)
!91 = !DILocation(line: 66, column: 59, scope: !88)
!92 = !DILocation(line: 66, column: 42, scope: !88)
!93 = !DILocation(line: 67, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !1, line: 67, column: 17)
!95 = !DILocation(line: 67, column: 28, scope: !94)
!96 = !DILocation(line: 67, column: 17, scope: !88)
!97 = !DILocation(line: 69, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !1, line: 68, column: 13)
!99 = !DILocation(line: 70, column: 17, scope: !98)
!100 = !DILocalVariable(name: "i", scope: !101, file: !1, line: 73, type: !39)
!101 = distinct !DILexicalBlock(scope: !88, file: !1, line: 72, column: 13)
!102 = !DILocation(line: 73, column: 24, scope: !101)
!103 = !DILocation(line: 74, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !1, line: 74, column: 17)
!105 = !DILocation(line: 74, column: 22, scope: !104)
!106 = !DILocation(line: 74, column: 29, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !1, line: 74, column: 17)
!108 = !DILocation(line: 74, column: 31, scope: !107)
!109 = !DILocation(line: 74, column: 17, scope: !104)
!110 = !DILocation(line: 76, column: 21, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !1, line: 75, column: 17)
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
!122 = distinct !{!122, !109, !123, !64}
!123 = !DILocation(line: 78, column: 17, scope: !104)
!124 = !DILocation(line: 80, column: 20, scope: !88)
!125 = !DILocation(line: 80, column: 18, scope: !88)
!126 = !DILocation(line: 83, column: 22, scope: !77)
!127 = !DILocation(line: 83, column: 5, scope: !77)
!128 = !DILocation(line: 85, column: 10, scope: !77)
!129 = !DILocation(line: 85, column: 5, scope: !77)
!130 = !DILocation(line: 86, column: 1, scope: !77)
!131 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 89, type: !21, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!132 = !DILocalVariable(name: "data", scope: !131, file: !1, line: 91, type: !3)
!133 = !DILocation(line: 91, column: 21, scope: !131)
!134 = !DILocation(line: 92, column: 10, scope: !131)
!135 = !DILocation(line: 93, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !1, line: 93, column: 8)
!137 = !DILocation(line: 93, column: 8, scope: !131)
!138 = !DILocalVariable(name: "dataBuffer", scope: !139, file: !1, line: 97, type: !3)
!139 = distinct !DILexicalBlock(scope: !140, file: !1, line: 95, column: 9)
!140 = distinct !DILexicalBlock(scope: !136, file: !1, line: 94, column: 5)
!141 = !DILocation(line: 97, column: 29, scope: !139)
!142 = !DILocation(line: 97, column: 59, scope: !139)
!143 = !DILocation(line: 97, column: 42, scope: !139)
!144 = !DILocation(line: 98, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !139, file: !1, line: 98, column: 17)
!146 = !DILocation(line: 98, column: 28, scope: !145)
!147 = !DILocation(line: 98, column: 17, scope: !139)
!148 = !DILocation(line: 100, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !1, line: 99, column: 13)
!150 = !DILocation(line: 101, column: 17, scope: !149)
!151 = !DILocalVariable(name: "i", scope: !152, file: !1, line: 104, type: !39)
!152 = distinct !DILexicalBlock(scope: !139, file: !1, line: 103, column: 13)
!153 = !DILocation(line: 104, column: 24, scope: !152)
!154 = !DILocation(line: 105, column: 24, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !1, line: 105, column: 17)
!156 = !DILocation(line: 105, column: 22, scope: !155)
!157 = !DILocation(line: 105, column: 29, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !1, line: 105, column: 17)
!159 = !DILocation(line: 105, column: 31, scope: !158)
!160 = !DILocation(line: 105, column: 17, scope: !155)
!161 = !DILocation(line: 107, column: 21, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !1, line: 106, column: 17)
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
!173 = distinct !{!173, !160, !174, !64}
!174 = !DILocation(line: 109, column: 17, scope: !155)
!175 = !DILocation(line: 111, column: 20, scope: !139)
!176 = !DILocation(line: 111, column: 18, scope: !139)
!177 = !DILocation(line: 113, column: 5, scope: !140)
!178 = !DILocation(line: 114, column: 22, scope: !131)
!179 = !DILocation(line: 114, column: 5, scope: !131)
!180 = !DILocation(line: 116, column: 10, scope: !131)
!181 = !DILocation(line: 116, column: 5, scope: !131)
!182 = !DILocation(line: 117, column: 1, scope: !131)
