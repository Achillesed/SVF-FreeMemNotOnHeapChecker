; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_declare_15.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_15_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !42
  %cmp = icmp ult i64 %0, 100, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %1, !dbg !48
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !49
  store i32 1, i32* %intOne, align 8, !dbg !50
  %2 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 %2, !dbg !52
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !53
  store i32 1, i32* %intTwo, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %3, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataBuffer, i64 0, i64 0, !dbg !61
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !62
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 0, !dbg !63
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !64
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !65
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !65
  call void @free(i8* noundef %6) #5, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_declare_15_good() #0 !dbg !68 {
entry:
  call void @goodG2B1(), !dbg !69
  call void @goodG2B2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !78
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !79
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !80
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !78
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !81
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @exit(i32 noundef 1) #6, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !88, metadata !DIExpression()), !dbg !90
  store i64 0, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !94
  %cmp1 = icmp ult i64 %2, 100, !dbg !96
  br i1 %cmp1, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !98
  %4 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !98
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !101
  store i32 1, i32* %intOne, align 4, !dbg !102
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !103
  %6 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !103
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !105
  store i32 1, i32* %intTwo, align 4, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !108
  %inc = add i64 %7, 1, !dbg !108
  store i64 %inc, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !112
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !113
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !114
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !114
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !115
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !116
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !116
  call void @free(i8* noundef %11) #5, !dbg !117
  ret void, !dbg !118
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !119 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !120, metadata !DIExpression()), !dbg !121
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !123, metadata !DIExpression()), !dbg !125
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !126
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !127
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !125
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !128
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !130
  br i1 %cmp, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !132
  call void @exit(i32 noundef 1) #6, !dbg !134
  unreachable, !dbg !134

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !135, metadata !DIExpression()), !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !141
  %cmp1 = icmp ult i64 %2, 100, !dbg !143
  br i1 %cmp1, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !145
  %4 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 %4, !dbg !145
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !148
  store i32 1, i32* %intOne, align 4, !dbg !149
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !150
  %6 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !150
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !152
  store i32 1, i32* %intTwo, align 4, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %7, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !159
  store %struct._twoIntsStruct* %8, %struct._twoIntsStruct** %data, align 8, !dbg !160
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !161
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !161
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !162
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !163
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !163
  call void @free(i8* noundef %11) #5, !dbg !164
  ret void, !dbg !165
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_15.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "45c268cdfb6b565b4bec2362497327f3")
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
!20 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_15_bad", scope: !1, file: !1, line: 23, type: !21, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !1, line: 25, type: !3)
!25 = !DILocation(line: 25, column: 21, scope: !20)
!26 = !DILocation(line: 26, column: 10, scope: !20)
!27 = !DILocalVariable(name: "dataBuffer", scope: !28, file: !1, line: 32, type: !29)
!28 = distinct !DILexicalBlock(scope: !20, file: !1, line: 30, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 32, column: 23, scope: !28)
!33 = !DILocalVariable(name: "i", scope: !34, file: !1, line: 34, type: !35)
!34 = distinct !DILexicalBlock(scope: !28, file: !1, line: 33, column: 9)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!37 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 34, column: 20, scope: !34)
!39 = !DILocation(line: 35, column: 20, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !1, line: 35, column: 13)
!41 = !DILocation(line: 35, column: 18, scope: !40)
!42 = !DILocation(line: 35, column: 25, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !1, line: 35, column: 13)
!44 = !DILocation(line: 35, column: 27, scope: !43)
!45 = !DILocation(line: 35, column: 13, scope: !40)
!46 = !DILocation(line: 37, column: 28, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !1, line: 36, column: 13)
!48 = !DILocation(line: 37, column: 17, scope: !47)
!49 = !DILocation(line: 37, column: 31, scope: !47)
!50 = !DILocation(line: 37, column: 38, scope: !47)
!51 = !DILocation(line: 38, column: 28, scope: !47)
!52 = !DILocation(line: 38, column: 17, scope: !47)
!53 = !DILocation(line: 38, column: 31, scope: !47)
!54 = !DILocation(line: 38, column: 38, scope: !47)
!55 = !DILocation(line: 39, column: 13, scope: !47)
!56 = !DILocation(line: 35, column: 35, scope: !43)
!57 = !DILocation(line: 35, column: 13, scope: !43)
!58 = distinct !{!58, !45, !59, !60}
!59 = !DILocation(line: 39, column: 13, scope: !40)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 41, column: 16, scope: !28)
!62 = !DILocation(line: 41, column: 14, scope: !28)
!63 = !DILocation(line: 49, column: 22, scope: !20)
!64 = !DILocation(line: 49, column: 5, scope: !20)
!65 = !DILocation(line: 51, column: 10, scope: !20)
!66 = !DILocation(line: 51, column: 5, scope: !20)
!67 = !DILocation(line: 52, column: 1, scope: !20)
!68 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_declare_15_good", scope: !1, file: !1, line: 132, type: !21, scopeLine: 133, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!69 = !DILocation(line: 134, column: 5, scope: !68)
!70 = !DILocation(line: 135, column: 5, scope: !68)
!71 = !DILocation(line: 136, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 59, type: !21, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!73 = !DILocalVariable(name: "data", scope: !72, file: !1, line: 61, type: !3)
!74 = !DILocation(line: 61, column: 21, scope: !72)
!75 = !DILocation(line: 62, column: 10, scope: !72)
!76 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !1, line: 72, type: !3)
!77 = distinct !DILexicalBlock(scope: !72, file: !1, line: 70, column: 5)
!78 = !DILocation(line: 72, column: 25, scope: !77)
!79 = !DILocation(line: 72, column: 55, scope: !77)
!80 = !DILocation(line: 72, column: 38, scope: !77)
!81 = !DILocation(line: 73, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !1, line: 73, column: 13)
!83 = !DILocation(line: 73, column: 24, scope: !82)
!84 = !DILocation(line: 73, column: 13, scope: !77)
!85 = !DILocation(line: 75, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !1, line: 74, column: 9)
!87 = !DILocation(line: 76, column: 13, scope: !86)
!88 = !DILocalVariable(name: "i", scope: !89, file: !1, line: 79, type: !35)
!89 = distinct !DILexicalBlock(scope: !77, file: !1, line: 78, column: 9)
!90 = !DILocation(line: 79, column: 20, scope: !89)
!91 = !DILocation(line: 80, column: 20, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !1, line: 80, column: 13)
!93 = !DILocation(line: 80, column: 18, scope: !92)
!94 = !DILocation(line: 80, column: 25, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !1, line: 80, column: 13)
!96 = !DILocation(line: 80, column: 27, scope: !95)
!97 = !DILocation(line: 80, column: 13, scope: !92)
!98 = !DILocation(line: 82, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !1, line: 81, column: 13)
!100 = !DILocation(line: 82, column: 28, scope: !99)
!101 = !DILocation(line: 82, column: 31, scope: !99)
!102 = !DILocation(line: 82, column: 38, scope: !99)
!103 = !DILocation(line: 83, column: 17, scope: !99)
!104 = !DILocation(line: 83, column: 28, scope: !99)
!105 = !DILocation(line: 83, column: 31, scope: !99)
!106 = !DILocation(line: 83, column: 38, scope: !99)
!107 = !DILocation(line: 84, column: 13, scope: !99)
!108 = !DILocation(line: 80, column: 35, scope: !95)
!109 = !DILocation(line: 80, column: 13, scope: !95)
!110 = distinct !{!110, !97, !111, !60}
!111 = !DILocation(line: 84, column: 13, scope: !92)
!112 = !DILocation(line: 86, column: 16, scope: !77)
!113 = !DILocation(line: 86, column: 14, scope: !77)
!114 = !DILocation(line: 90, column: 22, scope: !72)
!115 = !DILocation(line: 90, column: 5, scope: !72)
!116 = !DILocation(line: 92, column: 10, scope: !72)
!117 = !DILocation(line: 92, column: 5, scope: !72)
!118 = !DILocation(line: 93, column: 1, scope: !72)
!119 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 96, type: !21, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!120 = !DILocalVariable(name: "data", scope: !119, file: !1, line: 98, type: !3)
!121 = !DILocation(line: 98, column: 21, scope: !119)
!122 = !DILocation(line: 99, column: 10, scope: !119)
!123 = !DILocalVariable(name: "dataBuffer", scope: !124, file: !1, line: 105, type: !3)
!124 = distinct !DILexicalBlock(scope: !119, file: !1, line: 103, column: 5)
!125 = !DILocation(line: 105, column: 25, scope: !124)
!126 = !DILocation(line: 105, column: 55, scope: !124)
!127 = !DILocation(line: 105, column: 38, scope: !124)
!128 = !DILocation(line: 106, column: 13, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !1, line: 106, column: 13)
!130 = !DILocation(line: 106, column: 24, scope: !129)
!131 = !DILocation(line: 106, column: 13, scope: !124)
!132 = !DILocation(line: 108, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !1, line: 107, column: 9)
!134 = !DILocation(line: 109, column: 13, scope: !133)
!135 = !DILocalVariable(name: "i", scope: !136, file: !1, line: 112, type: !35)
!136 = distinct !DILexicalBlock(scope: !124, file: !1, line: 111, column: 9)
!137 = !DILocation(line: 112, column: 20, scope: !136)
!138 = !DILocation(line: 113, column: 20, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !1, line: 113, column: 13)
!140 = !DILocation(line: 113, column: 18, scope: !139)
!141 = !DILocation(line: 113, column: 25, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !1, line: 113, column: 13)
!143 = !DILocation(line: 113, column: 27, scope: !142)
!144 = !DILocation(line: 113, column: 13, scope: !139)
!145 = !DILocation(line: 115, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !1, line: 114, column: 13)
!147 = !DILocation(line: 115, column: 28, scope: !146)
!148 = !DILocation(line: 115, column: 31, scope: !146)
!149 = !DILocation(line: 115, column: 38, scope: !146)
!150 = !DILocation(line: 116, column: 17, scope: !146)
!151 = !DILocation(line: 116, column: 28, scope: !146)
!152 = !DILocation(line: 116, column: 31, scope: !146)
!153 = !DILocation(line: 116, column: 38, scope: !146)
!154 = !DILocation(line: 117, column: 13, scope: !146)
!155 = !DILocation(line: 113, column: 35, scope: !142)
!156 = !DILocation(line: 113, column: 13, scope: !142)
!157 = distinct !{!157, !144, !158, !60}
!158 = !DILocation(line: 117, column: 13, scope: !139)
!159 = !DILocation(line: 119, column: 16, scope: !124)
!160 = !DILocation(line: 119, column: 14, scope: !124)
!161 = !DILocation(line: 127, column: 22, scope: !119)
!162 = !DILocation(line: 127, column: 5, scope: !119)
!163 = !DILocation(line: 129, column: 10, scope: !119)
!164 = !DILocation(line: 129, column: 5, scope: !119)
!165 = !DILocation(line: 130, column: 1, scope: !119)
