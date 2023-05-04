; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_08.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_08_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call i32 @staticReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !33
  %0 = alloca i8, i64 800, align 16, !dbg !34
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !35
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i64, i64* %i, align 8, !dbg !45
  %cmp = icmp ult i64 %2, 100, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !49
  %4 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !49
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !52
  store i32 1, i32* %intOne, align 4, !dbg !53
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !54
  %6 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !54
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !56
  store i32 1, i32* %intTwo, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %7, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !64
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !65
  br label %if.end, !dbg !66

if.end:                                           ; preds = %for.end, %entry
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !67
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !67
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !68
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !69
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !69
  call void @free(i8* noundef %11) #5, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_08_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !76 {
entry:
  ret i32 1, !dbg !79
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !83
  %call = call i32 @staticReturnsFalse(), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !87
  br label %if.end5, !dbg !89

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !90, metadata !DIExpression()), !dbg !93
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !94
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !95
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !93
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !96
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !98
  br i1 %cmp, label %if.then2, label %if.end, !dbg !99

if.then2:                                         ; preds = %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @exit(i32 noundef 1) #6, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %if.else
  call void @llvm.dbg.declare(metadata i64* %i, metadata !103, metadata !DIExpression()), !dbg !105
  store i64 0, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !108

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !109
  %cmp3 = icmp ult i64 %2, 100, !dbg !111
  br i1 %cmp3, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !113
  %4 = load i64, i64* %i, align 8, !dbg !115
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !113
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !116
  store i32 1, i32* %intOne, align 4, !dbg !117
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !118
  %6 = load i64, i64* %i, align 8, !dbg !119
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !118
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !120
  store i32 1, i32* %intTwo, align 4, !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !123
  %inc = add i64 %7, 1, !dbg !123
  store i64 %inc, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !127
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !128
  br label %if.end5

if.end5:                                          ; preds = %for.end, %if.then
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !129
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !129
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx6), !dbg !130
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !131
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !131
  call void @free(i8* noundef %11) #5, !dbg !132
  ret void, !dbg !133
}

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !134 {
entry:
  ret i32 0, !dbg !135
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !136 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !137, metadata !DIExpression()), !dbg !138
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !139
  %call = call i32 @staticReturnsTrue(), !dbg !140
  %tobool = icmp ne i32 %call, 0, !dbg !140
  br i1 %tobool, label %if.then, label %if.end5, !dbg !142

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !143, metadata !DIExpression()), !dbg !146
  %call1 = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !147
  %0 = bitcast i8* %call1 to %struct._twoIntsStruct*, !dbg !148
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !146
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !149
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !151
  br i1 %cmp, label %if.then2, label %if.end, !dbg !152

if.then2:                                         ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !153
  call void @exit(i32 noundef 1) #6, !dbg !155
  unreachable, !dbg !155

if.end:                                           ; preds = %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !156, metadata !DIExpression()), !dbg !158
  store i64 0, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !161

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !162
  %cmp3 = icmp ult i64 %2, 100, !dbg !164
  br i1 %cmp3, label %for.body, label %for.end, !dbg !165

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !166
  %4 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !166
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !169
  store i32 1, i32* %intOne, align 4, !dbg !170
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !171
  %6 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !171
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !173
  store i32 1, i32* %intTwo, align 4, !dbg !174
  br label %for.inc, !dbg !175

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !176
  %inc = add i64 %7, 1, !dbg !176
  store i64 %inc, i64* %i, align 8, !dbg !176
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !180
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !181
  br label %if.end5, !dbg !182

if.end5:                                          ; preds = %for.end, %entry
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !183
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !183
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx6), !dbg !184
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !185
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !185
  call void @free(i8* noundef %11) #5, !dbg !186
  ret void, !dbg !187
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_08.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "7731afd6d273780e8d9990b8cf5c8999")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_08_bad", scope: !1, file: !1, line: 37, type: !21, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 39, type: !3)
!25 = !DILocation(line: 39, column: 21, scope: !20)
!26 = !DILocation(line: 40, column: 10, scope: !20)
!27 = !DILocation(line: 41, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !1, line: 41, column: 8)
!29 = !DILocation(line: 41, column: 8, scope: !20)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !1, line: 45, type: !3)
!31 = distinct !DILexicalBlock(scope: !32, file: !1, line: 43, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !1, line: 42, column: 5)
!33 = !DILocation(line: 45, column: 29, scope: !31)
!34 = !DILocation(line: 45, column: 59, scope: !31)
!35 = !DILocation(line: 45, column: 42, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !37, file: !1, line: 47, type: !38)
!37 = distinct !DILexicalBlock(scope: !31, file: !1, line: 46, column: 13)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 47, column: 24, scope: !37)
!42 = !DILocation(line: 48, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !1, line: 48, column: 17)
!44 = !DILocation(line: 48, column: 22, scope: !43)
!45 = !DILocation(line: 48, column: 29, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !1, line: 48, column: 17)
!47 = !DILocation(line: 48, column: 31, scope: !46)
!48 = !DILocation(line: 48, column: 17, scope: !43)
!49 = !DILocation(line: 50, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 49, column: 17)
!51 = !DILocation(line: 50, column: 32, scope: !50)
!52 = !DILocation(line: 50, column: 35, scope: !50)
!53 = !DILocation(line: 50, column: 42, scope: !50)
!54 = !DILocation(line: 51, column: 21, scope: !50)
!55 = !DILocation(line: 51, column: 32, scope: !50)
!56 = !DILocation(line: 51, column: 35, scope: !50)
!57 = !DILocation(line: 51, column: 42, scope: !50)
!58 = !DILocation(line: 52, column: 17, scope: !50)
!59 = !DILocation(line: 48, column: 39, scope: !46)
!60 = !DILocation(line: 48, column: 17, scope: !46)
!61 = distinct !{!61, !48, !62, !63}
!62 = !DILocation(line: 52, column: 17, scope: !43)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 54, column: 20, scope: !31)
!65 = !DILocation(line: 54, column: 18, scope: !31)
!66 = !DILocation(line: 56, column: 5, scope: !32)
!67 = !DILocation(line: 57, column: 22, scope: !20)
!68 = !DILocation(line: 57, column: 5, scope: !20)
!69 = !DILocation(line: 59, column: 10, scope: !20)
!70 = !DILocation(line: 59, column: 5, scope: !20)
!71 = !DILocation(line: 60, column: 1, scope: !20)
!72 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_alloca_08_good", scope: !1, file: !1, line: 133, type: !21, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!73 = !DILocation(line: 135, column: 5, scope: !72)
!74 = !DILocation(line: 136, column: 5, scope: !72)
!75 = !DILocation(line: 137, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !1, file: !1, line: 25, type: !77, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!77 = !DISubroutineType(types: !78)
!78 = !{!9}
!79 = !DILocation(line: 27, column: 5, scope: !76)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 67, type: !21, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!81 = !DILocalVariable(name: "data", scope: !80, file: !1, line: 69, type: !3)
!82 = !DILocation(line: 69, column: 21, scope: !80)
!83 = !DILocation(line: 70, column: 10, scope: !80)
!84 = !DILocation(line: 71, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !1, line: 71, column: 8)
!86 = !DILocation(line: 71, column: 8, scope: !80)
!87 = !DILocation(line: 74, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !1, line: 72, column: 5)
!89 = !DILocation(line: 75, column: 5, scope: !88)
!90 = !DILocalVariable(name: "dataBuffer", scope: !91, file: !1, line: 80, type: !3)
!91 = distinct !DILexicalBlock(scope: !92, file: !1, line: 78, column: 9)
!92 = distinct !DILexicalBlock(scope: !85, file: !1, line: 77, column: 5)
!93 = !DILocation(line: 80, column: 29, scope: !91)
!94 = !DILocation(line: 80, column: 59, scope: !91)
!95 = !DILocation(line: 80, column: 42, scope: !91)
!96 = !DILocation(line: 81, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !1, line: 81, column: 17)
!98 = !DILocation(line: 81, column: 28, scope: !97)
!99 = !DILocation(line: 81, column: 17, scope: !91)
!100 = !DILocation(line: 83, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !1, line: 82, column: 13)
!102 = !DILocation(line: 84, column: 17, scope: !101)
!103 = !DILocalVariable(name: "i", scope: !104, file: !1, line: 87, type: !38)
!104 = distinct !DILexicalBlock(scope: !91, file: !1, line: 86, column: 13)
!105 = !DILocation(line: 87, column: 24, scope: !104)
!106 = !DILocation(line: 88, column: 24, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !1, line: 88, column: 17)
!108 = !DILocation(line: 88, column: 22, scope: !107)
!109 = !DILocation(line: 88, column: 29, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !1, line: 88, column: 17)
!111 = !DILocation(line: 88, column: 31, scope: !110)
!112 = !DILocation(line: 88, column: 17, scope: !107)
!113 = !DILocation(line: 90, column: 21, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !1, line: 89, column: 17)
!115 = !DILocation(line: 90, column: 32, scope: !114)
!116 = !DILocation(line: 90, column: 35, scope: !114)
!117 = !DILocation(line: 90, column: 42, scope: !114)
!118 = !DILocation(line: 91, column: 21, scope: !114)
!119 = !DILocation(line: 91, column: 32, scope: !114)
!120 = !DILocation(line: 91, column: 35, scope: !114)
!121 = !DILocation(line: 91, column: 42, scope: !114)
!122 = !DILocation(line: 92, column: 17, scope: !114)
!123 = !DILocation(line: 88, column: 39, scope: !110)
!124 = !DILocation(line: 88, column: 17, scope: !110)
!125 = distinct !{!125, !112, !126, !63}
!126 = !DILocation(line: 92, column: 17, scope: !107)
!127 = !DILocation(line: 94, column: 20, scope: !91)
!128 = !DILocation(line: 94, column: 18, scope: !91)
!129 = !DILocation(line: 97, column: 22, scope: !80)
!130 = !DILocation(line: 97, column: 5, scope: !80)
!131 = !DILocation(line: 99, column: 10, scope: !80)
!132 = !DILocation(line: 99, column: 5, scope: !80)
!133 = !DILocation(line: 100, column: 1, scope: !80)
!134 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !1, file: !1, line: 30, type: !77, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!135 = !DILocation(line: 32, column: 5, scope: !134)
!136 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 103, type: !21, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!137 = !DILocalVariable(name: "data", scope: !136, file: !1, line: 105, type: !3)
!138 = !DILocation(line: 105, column: 21, scope: !136)
!139 = !DILocation(line: 106, column: 10, scope: !136)
!140 = !DILocation(line: 107, column: 8, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !1, line: 107, column: 8)
!142 = !DILocation(line: 107, column: 8, scope: !136)
!143 = !DILocalVariable(name: "dataBuffer", scope: !144, file: !1, line: 111, type: !3)
!144 = distinct !DILexicalBlock(scope: !145, file: !1, line: 109, column: 9)
!145 = distinct !DILexicalBlock(scope: !141, file: !1, line: 108, column: 5)
!146 = !DILocation(line: 111, column: 29, scope: !144)
!147 = !DILocation(line: 111, column: 59, scope: !144)
!148 = !DILocation(line: 111, column: 42, scope: !144)
!149 = !DILocation(line: 112, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !144, file: !1, line: 112, column: 17)
!151 = !DILocation(line: 112, column: 28, scope: !150)
!152 = !DILocation(line: 112, column: 17, scope: !144)
!153 = !DILocation(line: 114, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !1, line: 113, column: 13)
!155 = !DILocation(line: 115, column: 17, scope: !154)
!156 = !DILocalVariable(name: "i", scope: !157, file: !1, line: 118, type: !38)
!157 = distinct !DILexicalBlock(scope: !144, file: !1, line: 117, column: 13)
!158 = !DILocation(line: 118, column: 24, scope: !157)
!159 = !DILocation(line: 119, column: 24, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !1, line: 119, column: 17)
!161 = !DILocation(line: 119, column: 22, scope: !160)
!162 = !DILocation(line: 119, column: 29, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !1, line: 119, column: 17)
!164 = !DILocation(line: 119, column: 31, scope: !163)
!165 = !DILocation(line: 119, column: 17, scope: !160)
!166 = !DILocation(line: 121, column: 21, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !1, line: 120, column: 17)
!168 = !DILocation(line: 121, column: 32, scope: !167)
!169 = !DILocation(line: 121, column: 35, scope: !167)
!170 = !DILocation(line: 121, column: 42, scope: !167)
!171 = !DILocation(line: 122, column: 21, scope: !167)
!172 = !DILocation(line: 122, column: 32, scope: !167)
!173 = !DILocation(line: 122, column: 35, scope: !167)
!174 = !DILocation(line: 122, column: 42, scope: !167)
!175 = !DILocation(line: 123, column: 17, scope: !167)
!176 = !DILocation(line: 119, column: 39, scope: !163)
!177 = !DILocation(line: 119, column: 17, scope: !163)
!178 = distinct !{!178, !165, !179, !63}
!179 = !DILocation(line: 123, column: 17, scope: !160)
!180 = !DILocation(line: 125, column: 20, scope: !144)
!181 = !DILocation(line: 125, column: 18, scope: !144)
!182 = !DILocation(line: 127, column: 5, scope: !145)
!183 = !DILocation(line: 128, column: 22, scope: !136)
!184 = !DILocation(line: 128, column: 5, scope: !136)
!185 = !DILocation(line: 130, column: 10, scope: !136)
!186 = !DILocation(line: 130, column: 5, scope: !136)
!187 = !DILocation(line: 131, column: 1, scope: !136)
