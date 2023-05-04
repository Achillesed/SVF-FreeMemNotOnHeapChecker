; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_08.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_08_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call i32 @staticReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %0, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %1, !dbg !52
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !53
  store i32 1, i32* %intOne, align 8, !dbg !54
  %2 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %2, !dbg !56
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !57
  store i32 1, i32* %intTwo, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %3, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 0, !dbg !65
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !66
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_08_good() #0 !dbg !73 {
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_08.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "9bd1d29761ebbc7b430f5918f82f5a7b")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_08_bad", scope: !1, file: !1, line: 37, type: !21, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 39, type: !3)
!25 = !DILocation(line: 39, column: 21, scope: !20)
!26 = !DILocation(line: 40, column: 10, scope: !20)
!27 = !DILocation(line: 41, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !1, line: 41, column: 8)
!29 = !DILocation(line: 41, column: 8, scope: !20)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !1, line: 45, type: !33)
!31 = distinct !DILexicalBlock(scope: !32, file: !1, line: 43, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !1, line: 42, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 45, column: 27, scope: !31)
!37 = !DILocalVariable(name: "i", scope: !38, file: !1, line: 47, type: !39)
!38 = distinct !DILexicalBlock(scope: !31, file: !1, line: 46, column: 13)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 47, column: 24, scope: !38)
!43 = !DILocation(line: 48, column: 24, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !1, line: 48, column: 17)
!45 = !DILocation(line: 48, column: 22, scope: !44)
!46 = !DILocation(line: 48, column: 29, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !1, line: 48, column: 17)
!48 = !DILocation(line: 48, column: 31, scope: !47)
!49 = !DILocation(line: 48, column: 17, scope: !44)
!50 = !DILocation(line: 50, column: 32, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 49, column: 17)
!52 = !DILocation(line: 50, column: 21, scope: !51)
!53 = !DILocation(line: 50, column: 35, scope: !51)
!54 = !DILocation(line: 50, column: 42, scope: !51)
!55 = !DILocation(line: 51, column: 32, scope: !51)
!56 = !DILocation(line: 51, column: 21, scope: !51)
!57 = !DILocation(line: 51, column: 35, scope: !51)
!58 = !DILocation(line: 51, column: 42, scope: !51)
!59 = !DILocation(line: 52, column: 17, scope: !51)
!60 = !DILocation(line: 48, column: 39, scope: !47)
!61 = !DILocation(line: 48, column: 17, scope: !47)
!62 = distinct !{!62, !49, !63, !64}
!63 = !DILocation(line: 52, column: 17, scope: !44)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 54, column: 20, scope: !31)
!66 = !DILocation(line: 54, column: 18, scope: !31)
!67 = !DILocation(line: 56, column: 5, scope: !32)
!68 = !DILocation(line: 57, column: 22, scope: !20)
!69 = !DILocation(line: 57, column: 5, scope: !20)
!70 = !DILocation(line: 59, column: 10, scope: !20)
!71 = !DILocation(line: 59, column: 5, scope: !20)
!72 = !DILocation(line: 60, column: 1, scope: !20)
!73 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_08_good", scope: !1, file: !1, line: 133, type: !21, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!74 = !DILocation(line: 135, column: 5, scope: !73)
!75 = !DILocation(line: 136, column: 5, scope: !73)
!76 = !DILocation(line: 137, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !1, file: !1, line: 25, type: !78, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!78 = !DISubroutineType(types: !79)
!79 = !{!9}
!80 = !DILocation(line: 27, column: 5, scope: !77)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 67, type: !21, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!82 = !DILocalVariable(name: "data", scope: !81, file: !1, line: 69, type: !3)
!83 = !DILocation(line: 69, column: 21, scope: !81)
!84 = !DILocation(line: 70, column: 10, scope: !81)
!85 = !DILocation(line: 71, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !1, line: 71, column: 8)
!87 = !DILocation(line: 71, column: 8, scope: !81)
!88 = !DILocation(line: 74, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !1, line: 72, column: 5)
!90 = !DILocation(line: 75, column: 5, scope: !89)
!91 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !1, line: 80, type: !3)
!92 = distinct !DILexicalBlock(scope: !93, file: !1, line: 78, column: 9)
!93 = distinct !DILexicalBlock(scope: !86, file: !1, line: 77, column: 5)
!94 = !DILocation(line: 80, column: 29, scope: !92)
!95 = !DILocation(line: 80, column: 59, scope: !92)
!96 = !DILocation(line: 80, column: 42, scope: !92)
!97 = !DILocation(line: 81, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !1, line: 81, column: 17)
!99 = !DILocation(line: 81, column: 28, scope: !98)
!100 = !DILocation(line: 81, column: 17, scope: !92)
!101 = !DILocation(line: 83, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !1, line: 82, column: 13)
!103 = !DILocation(line: 84, column: 17, scope: !102)
!104 = !DILocalVariable(name: "i", scope: !105, file: !1, line: 87, type: !39)
!105 = distinct !DILexicalBlock(scope: !92, file: !1, line: 86, column: 13)
!106 = !DILocation(line: 87, column: 24, scope: !105)
!107 = !DILocation(line: 88, column: 24, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !1, line: 88, column: 17)
!109 = !DILocation(line: 88, column: 22, scope: !108)
!110 = !DILocation(line: 88, column: 29, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !1, line: 88, column: 17)
!112 = !DILocation(line: 88, column: 31, scope: !111)
!113 = !DILocation(line: 88, column: 17, scope: !108)
!114 = !DILocation(line: 90, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !1, line: 89, column: 17)
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
!126 = distinct !{!126, !113, !127, !64}
!127 = !DILocation(line: 92, column: 17, scope: !108)
!128 = !DILocation(line: 94, column: 20, scope: !92)
!129 = !DILocation(line: 94, column: 18, scope: !92)
!130 = !DILocation(line: 97, column: 22, scope: !81)
!131 = !DILocation(line: 97, column: 5, scope: !81)
!132 = !DILocation(line: 99, column: 10, scope: !81)
!133 = !DILocation(line: 99, column: 5, scope: !81)
!134 = !DILocation(line: 100, column: 1, scope: !81)
!135 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !1, file: !1, line: 30, type: !78, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!136 = !DILocation(line: 32, column: 5, scope: !135)
!137 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 103, type: !21, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!138 = !DILocalVariable(name: "data", scope: !137, file: !1, line: 105, type: !3)
!139 = !DILocation(line: 105, column: 21, scope: !137)
!140 = !DILocation(line: 106, column: 10, scope: !137)
!141 = !DILocation(line: 107, column: 8, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !1, line: 107, column: 8)
!143 = !DILocation(line: 107, column: 8, scope: !137)
!144 = !DILocalVariable(name: "dataBuffer", scope: !145, file: !1, line: 111, type: !3)
!145 = distinct !DILexicalBlock(scope: !146, file: !1, line: 109, column: 9)
!146 = distinct !DILexicalBlock(scope: !142, file: !1, line: 108, column: 5)
!147 = !DILocation(line: 111, column: 29, scope: !145)
!148 = !DILocation(line: 111, column: 59, scope: !145)
!149 = !DILocation(line: 111, column: 42, scope: !145)
!150 = !DILocation(line: 112, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !145, file: !1, line: 112, column: 17)
!152 = !DILocation(line: 112, column: 28, scope: !151)
!153 = !DILocation(line: 112, column: 17, scope: !145)
!154 = !DILocation(line: 114, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !1, line: 113, column: 13)
!156 = !DILocation(line: 115, column: 17, scope: !155)
!157 = !DILocalVariable(name: "i", scope: !158, file: !1, line: 118, type: !39)
!158 = distinct !DILexicalBlock(scope: !145, file: !1, line: 117, column: 13)
!159 = !DILocation(line: 118, column: 24, scope: !158)
!160 = !DILocation(line: 119, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !1, line: 119, column: 17)
!162 = !DILocation(line: 119, column: 22, scope: !161)
!163 = !DILocation(line: 119, column: 29, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !1, line: 119, column: 17)
!165 = !DILocation(line: 119, column: 31, scope: !164)
!166 = !DILocation(line: 119, column: 17, scope: !161)
!167 = !DILocation(line: 121, column: 21, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !1, line: 120, column: 17)
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
!179 = distinct !{!179, !166, !180, !64}
!180 = !DILocation(line: 123, column: 17, scope: !161)
!181 = !DILocation(line: 125, column: 20, scope: !145)
!182 = !DILocation(line: 125, column: 18, scope: !145)
!183 = !DILocation(line: 127, column: 5, scope: !146)
!184 = !DILocation(line: 128, column: 22, scope: !137)
!185 = !DILocation(line: 128, column: 5, scope: !137)
!186 = !DILocation(line: 130, column: 10, scope: !137)
!187 = !DILocation(line: 130, column: 5, scope: !137)
!188 = !DILocation(line: 131, column: 1, scope: !137)
