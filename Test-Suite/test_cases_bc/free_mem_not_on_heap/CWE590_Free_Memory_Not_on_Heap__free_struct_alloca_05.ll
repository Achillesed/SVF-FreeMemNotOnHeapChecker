; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_05.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@staticTrue = internal global i32 1, align 4, !dbg !0
@staticFalse = internal global i32 0, align 4, !dbg !15
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_05_bad() #0 !dbg !25 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !29, metadata !DIExpression()), !dbg !30
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %0 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool = icmp ne i32 %0, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !35, metadata !DIExpression()), !dbg !38
  %1 = alloca i8, i64 800, align 16, !dbg !39
  %2 = bitcast i8* %1 to %struct._twoIntsStruct*, !dbg !40
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i64, i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %3, 100, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !54
  %5 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !54
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !57
  store i32 1, i32* %intOne, align 4, !dbg !58
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !59
  %7 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !59
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !61
  store i32 1, i32* %intTwo, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %8, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !69
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !70
  br label %if.end, !dbg !71

if.end:                                           ; preds = %for.end, %entry
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !72
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !72
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !73
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !74
  call void @free(i8* noundef %12) #5, !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_05_good() #0 !dbg !77 {
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
  %0 = load i32, i32* @staticFalse, align 4, !dbg !85
  %tobool = icmp ne i32 %0, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !88
  br label %if.end4, !dbg !90

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !94
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !95
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !96
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !94
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !97
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !99
  br i1 %cmp, label %if.then1, label %if.end, !dbg !100

if.then1:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @exit(i32 noundef 1) #6, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !104, metadata !DIExpression()), !dbg !106
  store i64 0, i64* %i, align 8, !dbg !107
  br label %for.cond, !dbg !109

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !110
  %cmp2 = icmp ult i64 %3, 100, !dbg !112
  br i1 %cmp2, label %for.body, label %for.end, !dbg !113

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !114
  %5 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !114
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !117
  store i32 1, i32* %intOne, align 4, !dbg !118
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !119
  %7 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !119
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !121
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
  br label %if.end4

if.end4:                                          ; preds = %for.end, %if.then
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !130
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !130
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx5), !dbg !131
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !139
  %tobool = icmp ne i32 %0, 0, !dbg !139
  br i1 %tobool, label %if.then, label %if.end4, !dbg !141

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !142, metadata !DIExpression()), !dbg !145
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !146
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !147
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !145
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !148
  %cmp = icmp eq %struct._twoIntsStruct* %2, null, !dbg !150
  br i1 %cmp, label %if.then1, label %if.end, !dbg !151

if.then1:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !152
  call void @exit(i32 noundef 1) #6, !dbg !154
  unreachable, !dbg !154

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !155, metadata !DIExpression()), !dbg !157
  store i64 0, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !160

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !161
  %cmp2 = icmp ult i64 %3, 100, !dbg !163
  br i1 %cmp2, label %for.body, label %for.end, !dbg !164

for.body:                                         ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !165
  %5 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 %5, !dbg !165
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !168
  store i32 1, i32* %intOne, align 4, !dbg !169
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !170
  %7 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !170
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !172
  store i32 1, i32* %intTwo, align 4, !dbg !173
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !175
  %inc = add i64 %8, 1, !dbg !175
  store i64 %inc, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !176, !llvm.loop !177

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !179
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data, align 8, !dbg !180
  br label %if.end4, !dbg !181

if.end4:                                          ; preds = %for.end, %entry
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !182
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !182
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx5), !dbg !183
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !184
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !184
  call void @free(i8* noundef %12) #5, !dbg !185
  ret void, !dbg !186
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
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_05.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "79b7ec56425126b88aa76aa5a6162fb0")
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
!25 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_05_bad", scope: !3, file: !3, line: 30, type: !26, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !{}
!29 = !DILocalVariable(name: "data", scope: !25, file: !3, line: 32, type: !5)
!30 = !DILocation(line: 32, column: 21, scope: !25)
!31 = !DILocation(line: 33, column: 10, scope: !25)
!32 = !DILocation(line: 34, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !25, file: !3, line: 34, column: 8)
!34 = !DILocation(line: 34, column: 8, scope: !25)
!35 = !DILocalVariable(name: "dataBuffer", scope: !36, file: !3, line: 38, type: !5)
!36 = distinct !DILexicalBlock(scope: !37, file: !3, line: 36, column: 9)
!37 = distinct !DILexicalBlock(scope: !33, file: !3, line: 35, column: 5)
!38 = !DILocation(line: 38, column: 29, scope: !36)
!39 = !DILocation(line: 38, column: 59, scope: !36)
!40 = !DILocation(line: 38, column: 42, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !42, file: !3, line: 40, type: !43)
!42 = distinct !DILexicalBlock(scope: !36, file: !3, line: 39, column: 13)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!45 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 40, column: 24, scope: !42)
!47 = !DILocation(line: 41, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !3, line: 41, column: 17)
!49 = !DILocation(line: 41, column: 22, scope: !48)
!50 = !DILocation(line: 41, column: 29, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !3, line: 41, column: 17)
!52 = !DILocation(line: 41, column: 31, scope: !51)
!53 = !DILocation(line: 41, column: 17, scope: !48)
!54 = !DILocation(line: 43, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !3, line: 42, column: 17)
!56 = !DILocation(line: 43, column: 32, scope: !55)
!57 = !DILocation(line: 43, column: 35, scope: !55)
!58 = !DILocation(line: 43, column: 42, scope: !55)
!59 = !DILocation(line: 44, column: 21, scope: !55)
!60 = !DILocation(line: 44, column: 32, scope: !55)
!61 = !DILocation(line: 44, column: 35, scope: !55)
!62 = !DILocation(line: 44, column: 42, scope: !55)
!63 = !DILocation(line: 45, column: 17, scope: !55)
!64 = !DILocation(line: 41, column: 39, scope: !51)
!65 = !DILocation(line: 41, column: 17, scope: !51)
!66 = distinct !{!66, !53, !67, !68}
!67 = !DILocation(line: 45, column: 17, scope: !48)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 47, column: 20, scope: !36)
!70 = !DILocation(line: 47, column: 18, scope: !36)
!71 = !DILocation(line: 49, column: 5, scope: !37)
!72 = !DILocation(line: 50, column: 22, scope: !25)
!73 = !DILocation(line: 50, column: 5, scope: !25)
!74 = !DILocation(line: 52, column: 10, scope: !25)
!75 = !DILocation(line: 52, column: 5, scope: !25)
!76 = !DILocation(line: 53, column: 1, scope: !25)
!77 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_05_good", scope: !3, file: !3, line: 126, type: !26, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!78 = !DILocation(line: 128, column: 5, scope: !77)
!79 = !DILocation(line: 129, column: 5, scope: !77)
!80 = !DILocation(line: 130, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !3, file: !3, line: 60, type: !26, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!82 = !DILocalVariable(name: "data", scope: !81, file: !3, line: 62, type: !5)
!83 = !DILocation(line: 62, column: 21, scope: !81)
!84 = !DILocation(line: 63, column: 10, scope: !81)
!85 = !DILocation(line: 64, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !3, line: 64, column: 8)
!87 = !DILocation(line: 64, column: 8, scope: !81)
!88 = !DILocation(line: 67, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !3, line: 65, column: 5)
!90 = !DILocation(line: 68, column: 5, scope: !89)
!91 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !3, line: 73, type: !5)
!92 = distinct !DILexicalBlock(scope: !93, file: !3, line: 71, column: 9)
!93 = distinct !DILexicalBlock(scope: !86, file: !3, line: 70, column: 5)
!94 = !DILocation(line: 73, column: 29, scope: !92)
!95 = !DILocation(line: 73, column: 59, scope: !92)
!96 = !DILocation(line: 73, column: 42, scope: !92)
!97 = !DILocation(line: 74, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !3, line: 74, column: 17)
!99 = !DILocation(line: 74, column: 28, scope: !98)
!100 = !DILocation(line: 74, column: 17, scope: !92)
!101 = !DILocation(line: 76, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !3, line: 75, column: 13)
!103 = !DILocation(line: 77, column: 17, scope: !102)
!104 = !DILocalVariable(name: "i", scope: !105, file: !3, line: 80, type: !43)
!105 = distinct !DILexicalBlock(scope: !92, file: !3, line: 79, column: 13)
!106 = !DILocation(line: 80, column: 24, scope: !105)
!107 = !DILocation(line: 81, column: 24, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !3, line: 81, column: 17)
!109 = !DILocation(line: 81, column: 22, scope: !108)
!110 = !DILocation(line: 81, column: 29, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !3, line: 81, column: 17)
!112 = !DILocation(line: 81, column: 31, scope: !111)
!113 = !DILocation(line: 81, column: 17, scope: !108)
!114 = !DILocation(line: 83, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !3, line: 82, column: 17)
!116 = !DILocation(line: 83, column: 32, scope: !115)
!117 = !DILocation(line: 83, column: 35, scope: !115)
!118 = !DILocation(line: 83, column: 42, scope: !115)
!119 = !DILocation(line: 84, column: 21, scope: !115)
!120 = !DILocation(line: 84, column: 32, scope: !115)
!121 = !DILocation(line: 84, column: 35, scope: !115)
!122 = !DILocation(line: 84, column: 42, scope: !115)
!123 = !DILocation(line: 85, column: 17, scope: !115)
!124 = !DILocation(line: 81, column: 39, scope: !111)
!125 = !DILocation(line: 81, column: 17, scope: !111)
!126 = distinct !{!126, !113, !127, !68}
!127 = !DILocation(line: 85, column: 17, scope: !108)
!128 = !DILocation(line: 87, column: 20, scope: !92)
!129 = !DILocation(line: 87, column: 18, scope: !92)
!130 = !DILocation(line: 90, column: 22, scope: !81)
!131 = !DILocation(line: 90, column: 5, scope: !81)
!132 = !DILocation(line: 92, column: 10, scope: !81)
!133 = !DILocation(line: 92, column: 5, scope: !81)
!134 = !DILocation(line: 93, column: 1, scope: !81)
!135 = distinct !DISubprogram(name: "goodG2B2", scope: !3, file: !3, line: 96, type: !26, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!136 = !DILocalVariable(name: "data", scope: !135, file: !3, line: 98, type: !5)
!137 = !DILocation(line: 98, column: 21, scope: !135)
!138 = !DILocation(line: 99, column: 10, scope: !135)
!139 = !DILocation(line: 100, column: 8, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !3, line: 100, column: 8)
!141 = !DILocation(line: 100, column: 8, scope: !135)
!142 = !DILocalVariable(name: "dataBuffer", scope: !143, file: !3, line: 104, type: !5)
!143 = distinct !DILexicalBlock(scope: !144, file: !3, line: 102, column: 9)
!144 = distinct !DILexicalBlock(scope: !140, file: !3, line: 101, column: 5)
!145 = !DILocation(line: 104, column: 29, scope: !143)
!146 = !DILocation(line: 104, column: 59, scope: !143)
!147 = !DILocation(line: 104, column: 42, scope: !143)
!148 = !DILocation(line: 105, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !143, file: !3, line: 105, column: 17)
!150 = !DILocation(line: 105, column: 28, scope: !149)
!151 = !DILocation(line: 105, column: 17, scope: !143)
!152 = !DILocation(line: 107, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !3, line: 106, column: 13)
!154 = !DILocation(line: 108, column: 17, scope: !153)
!155 = !DILocalVariable(name: "i", scope: !156, file: !3, line: 111, type: !43)
!156 = distinct !DILexicalBlock(scope: !143, file: !3, line: 110, column: 13)
!157 = !DILocation(line: 111, column: 24, scope: !156)
!158 = !DILocation(line: 112, column: 24, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !3, line: 112, column: 17)
!160 = !DILocation(line: 112, column: 22, scope: !159)
!161 = !DILocation(line: 112, column: 29, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !3, line: 112, column: 17)
!163 = !DILocation(line: 112, column: 31, scope: !162)
!164 = !DILocation(line: 112, column: 17, scope: !159)
!165 = !DILocation(line: 114, column: 21, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !3, line: 113, column: 17)
!167 = !DILocation(line: 114, column: 32, scope: !166)
!168 = !DILocation(line: 114, column: 35, scope: !166)
!169 = !DILocation(line: 114, column: 42, scope: !166)
!170 = !DILocation(line: 115, column: 21, scope: !166)
!171 = !DILocation(line: 115, column: 32, scope: !166)
!172 = !DILocation(line: 115, column: 35, scope: !166)
!173 = !DILocation(line: 115, column: 42, scope: !166)
!174 = !DILocation(line: 116, column: 17, scope: !166)
!175 = !DILocation(line: 112, column: 39, scope: !162)
!176 = !DILocation(line: 112, column: 17, scope: !162)
!177 = distinct !{!177, !164, !178, !68}
!178 = !DILocation(line: 116, column: 17, scope: !159)
!179 = !DILocation(line: 118, column: 20, scope: !143)
!180 = !DILocation(line: 118, column: 18, scope: !143)
!181 = !DILocation(line: 120, column: 5, scope: !144)
!182 = !DILocation(line: 121, column: 22, scope: !135)
!183 = !DILocation(line: 121, column: 5, scope: !135)
!184 = !DILocation(line: 123, column: 10, scope: !135)
!185 = !DILocation(line: 123, column: 5, scope: !135)
!186 = !DILocation(line: 124, column: 1, scope: !135)
