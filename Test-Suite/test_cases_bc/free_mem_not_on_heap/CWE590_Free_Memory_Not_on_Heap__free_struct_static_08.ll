; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_static_08.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_static_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE590_Free_Memory_Not_on_Heap__free_struct_static_08_bad.dataBuffer = internal global [100 x %struct._twoIntsStruct] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_08_bad() #0 !dbg !2 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !30, metadata !DIExpression()), !dbg !31
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %call = call i32 @staticReturnsTrue(), !dbg !33
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
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_08_bad.dataBuffer, i64 0, i64 %1, !dbg !53
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !54
  store i32 1, i32* %intOne, align 8, !dbg !55
  %2 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_08_bad.dataBuffer, i64 0, i64 %2, !dbg !57
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !58
  store i32 1, i32* %intTwo, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %3, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  store %struct._twoIntsStruct* getelementptr inbounds ([100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_08_bad.dataBuffer, i64 0, i64 0), %struct._twoIntsStruct** %data, align 8, !dbg !66
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

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_08_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !77 {
entry:
  ret i32 1, !dbg !80
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !84
  %call = call i32 @staticReturnsFalse(), !dbg !85
  %tobool = icmp ne i32 %call, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !88
  br label %if.end5, !dbg !90

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !94
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !95
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !96
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !94
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !97
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !99
  br i1 %cmp, label %if.then2, label %if.end, !dbg !100

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @exit(i32 noundef 1) #6, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !104, metadata !DIExpression()), !dbg !106
  store i64 0, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !109

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !110
  %cmp3 = icmp ult i64 %2, 100, !dbg !112
  br i1 %cmp3, label %for.body, label %for.end, !dbg !113

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !114
  %4 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !114
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !117
  store i32 1, i32* %intOne, align 4, !dbg !118
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !119
  %6 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !119
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !121
  store i32 1, i32* %intTwo, align 4, !dbg !122
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !124
  %inc = add i64 %7, 1, !dbg !124
  store i64 %inc, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !128
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !129
  br label %if.end5

if.end5:                                          ; preds = %for.end, %if.then
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !130
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !130
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx6), !dbg !131
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !132
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !132
  call void @free(i8* noundef %11) #5, !dbg !133
  ret void, !dbg !134
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !135 {
entry:
  ret i32 0, !dbg !136
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !137 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !138, metadata !DIExpression()), !dbg !139
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !140
  %call = call i32 @staticReturnsTrue(), !dbg !141
  %tobool = icmp ne i32 %call, 0, !dbg !141
  br i1 %tobool, label %if.then, label %if.end5, !dbg !143

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !144, metadata !DIExpression()), !dbg !147
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !148
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !149
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !147
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !150
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !152
  br i1 %cmp, label %if.then2, label %if.end, !dbg !153

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !154
  call void @exit(i32 noundef 1) #6, !dbg !156
  unreachable, !dbg !156

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !157, metadata !DIExpression()), !dbg !159
  store i64 0, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !163
  %cmp3 = icmp ult i64 %2, 100, !dbg !165
  br i1 %cmp3, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !167
  %4 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !167
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !170
  store i32 1, i32* %intOne, align 4, !dbg !171
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !172
  %6 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !172
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !174
  store i32 1, i32* %intTwo, align 4, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !177
  %inc = add i64 %7, 1, !dbg !177
  store i64 %inc, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !181
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !182
  br label %if.end5, !dbg !183

if.end5:                                          ; preds = %for.end, %entry
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !184
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !184
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx6), !dbg !185
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !186
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !186
  call void @free(i8* noundef %11) #5, !dbg !187
  ret void, !dbg !188
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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 45, type: !19, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_08_bad", scope: !3, file: !3, line: 37, type: !4, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_08.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "ba999be9beba27f38042985bd90825a4")
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
!30 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 39, type: !8)
!31 = !DILocation(line: 39, column: 21, scope: !2)
!32 = !DILocation(line: 40, column: 10, scope: !2)
!33 = !DILocation(line: 41, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !2, file: !3, line: 41, column: 8)
!35 = !DILocation(line: 41, column: 8, scope: !2)
!36 = !DILocalVariable(name: "i", scope: !37, file: !3, line: 47, type: !40)
!37 = distinct !DILexicalBlock(scope: !38, file: !3, line: 46, column: 13)
!38 = distinct !DILexicalBlock(scope: !39, file: !3, line: 43, column: 9)
!39 = distinct !DILexicalBlock(scope: !34, file: !3, line: 42, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 47, column: 24, scope: !37)
!44 = !DILocation(line: 48, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !37, file: !3, line: 48, column: 17)
!46 = !DILocation(line: 48, column: 22, scope: !45)
!47 = !DILocation(line: 48, column: 29, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !3, line: 48, column: 17)
!49 = !DILocation(line: 48, column: 31, scope: !48)
!50 = !DILocation(line: 48, column: 17, scope: !45)
!51 = !DILocation(line: 50, column: 32, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !3, line: 49, column: 17)
!53 = !DILocation(line: 50, column: 21, scope: !52)
!54 = !DILocation(line: 50, column: 35, scope: !52)
!55 = !DILocation(line: 50, column: 42, scope: !52)
!56 = !DILocation(line: 51, column: 32, scope: !52)
!57 = !DILocation(line: 51, column: 21, scope: !52)
!58 = !DILocation(line: 51, column: 35, scope: !52)
!59 = !DILocation(line: 51, column: 42, scope: !52)
!60 = !DILocation(line: 52, column: 17, scope: !52)
!61 = !DILocation(line: 48, column: 39, scope: !48)
!62 = !DILocation(line: 48, column: 17, scope: !48)
!63 = distinct !{!63, !50, !64, !65}
!64 = !DILocation(line: 52, column: 17, scope: !45)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 54, column: 18, scope: !38)
!67 = !DILocation(line: 56, column: 5, scope: !39)
!68 = !DILocation(line: 57, column: 22, scope: !2)
!69 = !DILocation(line: 57, column: 5, scope: !2)
!70 = !DILocation(line: 59, column: 10, scope: !2)
!71 = !DILocation(line: 59, column: 5, scope: !2)
!72 = !DILocation(line: 60, column: 1, scope: !2)
!73 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_08_good", scope: !3, file: !3, line: 133, type: !4, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!74 = !DILocation(line: 135, column: 5, scope: !73)
!75 = !DILocation(line: 136, column: 5, scope: !73)
!76 = !DILocation(line: 137, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !3, file: !3, line: 25, type: !78, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!78 = !DISubroutineType(types: !79)
!79 = !{!14}
!80 = !DILocation(line: 27, column: 5, scope: !77)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 67, type: !4, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!82 = !DILocalVariable(name: "data", scope: !81, file: !3, line: 69, type: !8)
!83 = !DILocation(line: 69, column: 21, scope: !81)
!84 = !DILocation(line: 70, column: 10, scope: !81)
!85 = !DILocation(line: 71, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !3, line: 71, column: 8)
!87 = !DILocation(line: 71, column: 8, scope: !81)
!88 = !DILocation(line: 74, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !3, line: 72, column: 5)
!90 = !DILocation(line: 75, column: 5, scope: !89)
!91 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !3, line: 80, type: !8)
!92 = distinct !DILexicalBlock(scope: !93, file: !3, line: 78, column: 9)
!93 = distinct !DILexicalBlock(scope: !86, file: !3, line: 77, column: 5)
!94 = !DILocation(line: 80, column: 29, scope: !92)
!95 = !DILocation(line: 80, column: 59, scope: !92)
!96 = !DILocation(line: 80, column: 42, scope: !92)
!97 = !DILocation(line: 81, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !3, line: 81, column: 17)
!99 = !DILocation(line: 81, column: 28, scope: !98)
!100 = !DILocation(line: 81, column: 17, scope: !92)
!101 = !DILocation(line: 83, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !3, line: 82, column: 13)
!103 = !DILocation(line: 84, column: 17, scope: !102)
!104 = !DILocalVariable(name: "i", scope: !105, file: !3, line: 87, type: !40)
!105 = distinct !DILexicalBlock(scope: !92, file: !3, line: 86, column: 13)
!106 = !DILocation(line: 87, column: 24, scope: !105)
!107 = !DILocation(line: 88, column: 24, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !3, line: 88, column: 17)
!109 = !DILocation(line: 88, column: 22, scope: !108)
!110 = !DILocation(line: 88, column: 29, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !3, line: 88, column: 17)
!112 = !DILocation(line: 88, column: 31, scope: !111)
!113 = !DILocation(line: 88, column: 17, scope: !108)
!114 = !DILocation(line: 90, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !3, line: 89, column: 17)
!116 = !DILocation(line: 90, column: 32, scope: !115)
!117 = !DILocation(line: 90, column: 35, scope: !115)
!118 = !DILocation(line: 90, column: 42, scope: !115)
!119 = !DILocation(line: 91, column: 21, scope: !115)
!120 = !DILocation(line: 91, column: 32, scope: !115)
!121 = !DILocation(line: 91, column: 35, scope: !115)
!122 = !DILocation(line: 91, column: 42, scope: !115)
!123 = !DILocation(line: 92, column: 17, scope: !115)
!124 = !DILocation(line: 88, column: 39, scope: !111)
!125 = !DILocation(line: 88, column: 17, scope: !111)
!126 = distinct !{!126, !113, !127, !65}
!127 = !DILocation(line: 92, column: 17, scope: !108)
!128 = !DILocation(line: 94, column: 20, scope: !92)
!129 = !DILocation(line: 94, column: 18, scope: !92)
!130 = !DILocation(line: 97, column: 22, scope: !81)
!131 = !DILocation(line: 97, column: 5, scope: !81)
!132 = !DILocation(line: 99, column: 10, scope: !81)
!133 = !DILocation(line: 99, column: 5, scope: !81)
!134 = !DILocation(line: 100, column: 1, scope: !81)
!135 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !3, file: !3, line: 30, type: !78, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!136 = !DILocation(line: 32, column: 5, scope: !135)
!137 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 103, type: !4, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!138 = !DILocalVariable(name: "data", scope: !137, file: !3, line: 105, type: !8)
!139 = !DILocation(line: 105, column: 21, scope: !137)
!140 = !DILocation(line: 106, column: 10, scope: !137)
!141 = !DILocation(line: 107, column: 8, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !3, line: 107, column: 8)
!143 = !DILocation(line: 107, column: 8, scope: !137)
!144 = !DILocalVariable(name: "dataBuffer", scope: !145, file: !3, line: 111, type: !8)
!145 = distinct !DILexicalBlock(scope: !146, file: !3, line: 109, column: 9)
!146 = distinct !DILexicalBlock(scope: !142, file: !3, line: 108, column: 5)
!147 = !DILocation(line: 111, column: 29, scope: !145)
!148 = !DILocation(line: 111, column: 59, scope: !145)
!149 = !DILocation(line: 111, column: 42, scope: !145)
!150 = !DILocation(line: 112, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !145, file: !3, line: 112, column: 17)
!152 = !DILocation(line: 112, column: 28, scope: !151)
!153 = !DILocation(line: 112, column: 17, scope: !145)
!154 = !DILocation(line: 114, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !3, line: 113, column: 13)
!156 = !DILocation(line: 115, column: 17, scope: !155)
!157 = !DILocalVariable(name: "i", scope: !158, file: !3, line: 118, type: !40)
!158 = distinct !DILexicalBlock(scope: !145, file: !3, line: 117, column: 13)
!159 = !DILocation(line: 118, column: 24, scope: !158)
!160 = !DILocation(line: 119, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !3, line: 119, column: 17)
!162 = !DILocation(line: 119, column: 22, scope: !161)
!163 = !DILocation(line: 119, column: 29, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !3, line: 119, column: 17)
!165 = !DILocation(line: 119, column: 31, scope: !164)
!166 = !DILocation(line: 119, column: 17, scope: !161)
!167 = !DILocation(line: 121, column: 21, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !3, line: 120, column: 17)
!169 = !DILocation(line: 121, column: 32, scope: !168)
!170 = !DILocation(line: 121, column: 35, scope: !168)
!171 = !DILocation(line: 121, column: 42, scope: !168)
!172 = !DILocation(line: 122, column: 21, scope: !168)
!173 = !DILocation(line: 122, column: 32, scope: !168)
!174 = !DILocation(line: 122, column: 35, scope: !168)
!175 = !DILocation(line: 122, column: 42, scope: !168)
!176 = !DILocation(line: 123, column: 17, scope: !168)
!177 = !DILocation(line: 119, column: 39, scope: !164)
!178 = !DILocation(line: 119, column: 17, scope: !164)
!179 = distinct !{!179, !166, !180, !65}
!180 = !DILocation(line: 123, column: 17, scope: !161)
!181 = !DILocation(line: 125, column: 20, scope: !145)
!182 = !DILocation(line: 125, column: 18, scope: !145)
!183 = !DILocation(line: 127, column: 5, scope: !146)
!184 = !DILocation(line: 128, column: 22, scope: !137)
!185 = !DILocation(line: 128, column: 5, scope: !137)
!186 = !DILocation(line: 130, column: 10, scope: !137)
!187 = !DILocation(line: 130, column: 5, scope: !137)
!188 = !DILocation(line: 131, column: 1, scope: !137)
