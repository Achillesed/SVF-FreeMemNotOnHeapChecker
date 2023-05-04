; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_struct_static_32.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_struct_static_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE590_Free_Memory_Not_on_Heap__free_struct_static_32_bad.dataBuffer = internal global [100 x %struct._twoIntsStruct] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_32_bad() #0 !dbg !2 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  %data3 = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !32, metadata !DIExpression()), !dbg !34
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !35, metadata !DIExpression()), !dbg !36
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !36
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !38, metadata !DIExpression()), !dbg !40
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !41
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !42
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !53
  %cmp = icmp ult i64 %2, 100, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_32_bad.dataBuffer, i64 0, i64 %3, !dbg !59
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !60
  store i32 1, i32* %intOne, align 8, !dbg !61
  %4 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_32_bad.dataBuffer, i64 0, i64 %4, !dbg !63
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !64
  store i32 1, i32* %intTwo, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %5, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  store %struct._twoIntsStruct* getelementptr inbounds ([100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* @CWE590_Free_Memory_Not_on_Heap__free_struct_static_32_bad.dataBuffer, i64 0, i64 0), %struct._twoIntsStruct** %data1, align 8, !dbg !72
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !73
  %7 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !74
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %7, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data3, metadata !76, metadata !DIExpression()), !dbg !78
  %8 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !79
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %8, align 8, !dbg !80
  store %struct._twoIntsStruct* %9, %struct._twoIntsStruct** %data3, align 8, !dbg !78
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data3, align 8, !dbg !81
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !81
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !82
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data3, align 8, !dbg !83
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !83
  call void @free(i8* noundef %12) #5, !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_struct_static_32_good() #0 !dbg !86 {
entry:
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %dataBuffer = alloca %struct._twoIntsStruct*, align 8
  %i = alloca i64, align 8
  %data4 = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !92, metadata !DIExpression()), !dbg !93
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !94, metadata !DIExpression()), !dbg !95
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !95
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !97, metadata !DIExpression()), !dbg !99
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !100
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !101
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBuffer, metadata !102, metadata !DIExpression()), !dbg !104
  %call = call noalias i8* @malloc(i64 noundef 800) #5, !dbg !105
  %2 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !106
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !104
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !107
  %cmp = icmp eq %struct._twoIntsStruct* %3, null, !dbg !109
  br i1 %cmp, label %if.then, label %if.end, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !111
  call void @exit(i32 noundef 1) #6, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !116
  store i64 0, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !120
  %cmp2 = icmp ult i64 %4, 100, !dbg !122
  br i1 %cmp2, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !124
  %6 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !124
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !127
  store i32 1, i32* %intOne, align 4, !dbg !128
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !129
  %8 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !129
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !131
  store i32 1, i32* %intTwo, align 4, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %9, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBuffer, align 8, !dbg !138
  store %struct._twoIntsStruct* %10, %struct._twoIntsStruct** %data1, align 8, !dbg !139
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !140
  %12 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !141
  store %struct._twoIntsStruct* %11, %struct._twoIntsStruct** %12, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data4, metadata !143, metadata !DIExpression()), !dbg !145
  %13 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !146
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %13, align 8, !dbg !147
  store %struct._twoIntsStruct* %14, %struct._twoIntsStruct** %data4, align 8, !dbg !145
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data4, align 8, !dbg !148
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !148
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx5), !dbg !149
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data4, align 8, !dbg !150
  %17 = bitcast %struct._twoIntsStruct* %16 to i8*, !dbg !150
  call void @free(i8* noundef %17) #5, !dbg !151
  ret void, !dbg !152
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 33, type: !19, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_32_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_32.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "c485bf1952cd70e953cf939a03306c9e")
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
!32 = !DILocalVariable(name: "dataPtr1", scope: !2, file: !3, line: 26, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!34 = !DILocation(line: 26, column: 22, scope: !2)
!35 = !DILocalVariable(name: "dataPtr2", scope: !2, file: !3, line: 27, type: !33)
!36 = !DILocation(line: 27, column: 22, scope: !2)
!37 = !DILocation(line: 28, column: 10, scope: !2)
!38 = !DILocalVariable(name: "data", scope: !39, file: !3, line: 30, type: !8)
!39 = distinct !DILexicalBlock(scope: !2, file: !3, line: 29, column: 5)
!40 = !DILocation(line: 30, column: 25, scope: !39)
!41 = !DILocation(line: 30, column: 33, scope: !39)
!42 = !DILocation(line: 30, column: 32, scope: !39)
!43 = !DILocalVariable(name: "i", scope: !44, file: !3, line: 35, type: !46)
!44 = distinct !DILexicalBlock(scope: !45, file: !3, line: 34, column: 13)
!45 = distinct !DILexicalBlock(scope: !39, file: !3, line: 31, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!48 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 35, column: 24, scope: !44)
!50 = !DILocation(line: 36, column: 24, scope: !51)
!51 = distinct !DILexicalBlock(scope: !44, file: !3, line: 36, column: 17)
!52 = !DILocation(line: 36, column: 22, scope: !51)
!53 = !DILocation(line: 36, column: 29, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !3, line: 36, column: 17)
!55 = !DILocation(line: 36, column: 31, scope: !54)
!56 = !DILocation(line: 36, column: 17, scope: !51)
!57 = !DILocation(line: 38, column: 32, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !3, line: 37, column: 17)
!59 = !DILocation(line: 38, column: 21, scope: !58)
!60 = !DILocation(line: 38, column: 35, scope: !58)
!61 = !DILocation(line: 38, column: 42, scope: !58)
!62 = !DILocation(line: 39, column: 32, scope: !58)
!63 = !DILocation(line: 39, column: 21, scope: !58)
!64 = !DILocation(line: 39, column: 35, scope: !58)
!65 = !DILocation(line: 39, column: 42, scope: !58)
!66 = !DILocation(line: 40, column: 17, scope: !58)
!67 = !DILocation(line: 36, column: 39, scope: !54)
!68 = !DILocation(line: 36, column: 17, scope: !54)
!69 = distinct !{!69, !56, !70, !71}
!70 = !DILocation(line: 40, column: 17, scope: !51)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 42, column: 18, scope: !45)
!73 = !DILocation(line: 44, column: 21, scope: !39)
!74 = !DILocation(line: 44, column: 10, scope: !39)
!75 = !DILocation(line: 44, column: 19, scope: !39)
!76 = !DILocalVariable(name: "data", scope: !77, file: !3, line: 47, type: !8)
!77 = distinct !DILexicalBlock(scope: !2, file: !3, line: 46, column: 5)
!78 = !DILocation(line: 47, column: 25, scope: !77)
!79 = !DILocation(line: 47, column: 33, scope: !77)
!80 = !DILocation(line: 47, column: 32, scope: !77)
!81 = !DILocation(line: 48, column: 26, scope: !77)
!82 = !DILocation(line: 48, column: 9, scope: !77)
!83 = !DILocation(line: 50, column: 14, scope: !77)
!84 = !DILocation(line: 50, column: 9, scope: !77)
!85 = !DILocation(line: 52, column: 1, scope: !2)
!86 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_struct_static_32_good", scope: !3, file: !3, line: 95, type: !4, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !18)
!87 = !DILocation(line: 97, column: 5, scope: !86)
!88 = !DILocation(line: 98, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 59, type: !4, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !18)
!90 = !DILocalVariable(name: "data", scope: !89, file: !3, line: 61, type: !8)
!91 = !DILocation(line: 61, column: 21, scope: !89)
!92 = !DILocalVariable(name: "dataPtr1", scope: !89, file: !3, line: 62, type: !33)
!93 = !DILocation(line: 62, column: 22, scope: !89)
!94 = !DILocalVariable(name: "dataPtr2", scope: !89, file: !3, line: 63, type: !33)
!95 = !DILocation(line: 63, column: 22, scope: !89)
!96 = !DILocation(line: 64, column: 10, scope: !89)
!97 = !DILocalVariable(name: "data", scope: !98, file: !3, line: 66, type: !8)
!98 = distinct !DILexicalBlock(scope: !89, file: !3, line: 65, column: 5)
!99 = !DILocation(line: 66, column: 25, scope: !98)
!100 = !DILocation(line: 66, column: 33, scope: !98)
!101 = !DILocation(line: 66, column: 32, scope: !98)
!102 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !3, line: 69, type: !8)
!103 = distinct !DILexicalBlock(scope: !98, file: !3, line: 67, column: 9)
!104 = !DILocation(line: 69, column: 29, scope: !103)
!105 = !DILocation(line: 69, column: 59, scope: !103)
!106 = !DILocation(line: 69, column: 42, scope: !103)
!107 = !DILocation(line: 70, column: 17, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !3, line: 70, column: 17)
!109 = !DILocation(line: 70, column: 28, scope: !108)
!110 = !DILocation(line: 70, column: 17, scope: !103)
!111 = !DILocation(line: 72, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !3, line: 71, column: 13)
!113 = !DILocation(line: 73, column: 17, scope: !112)
!114 = !DILocalVariable(name: "i", scope: !115, file: !3, line: 76, type: !46)
!115 = distinct !DILexicalBlock(scope: !103, file: !3, line: 75, column: 13)
!116 = !DILocation(line: 76, column: 24, scope: !115)
!117 = !DILocation(line: 77, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !3, line: 77, column: 17)
!119 = !DILocation(line: 77, column: 22, scope: !118)
!120 = !DILocation(line: 77, column: 29, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !3, line: 77, column: 17)
!122 = !DILocation(line: 77, column: 31, scope: !121)
!123 = !DILocation(line: 77, column: 17, scope: !118)
!124 = !DILocation(line: 79, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !3, line: 78, column: 17)
!126 = !DILocation(line: 79, column: 32, scope: !125)
!127 = !DILocation(line: 79, column: 35, scope: !125)
!128 = !DILocation(line: 79, column: 42, scope: !125)
!129 = !DILocation(line: 80, column: 21, scope: !125)
!130 = !DILocation(line: 80, column: 32, scope: !125)
!131 = !DILocation(line: 80, column: 35, scope: !125)
!132 = !DILocation(line: 80, column: 42, scope: !125)
!133 = !DILocation(line: 81, column: 17, scope: !125)
!134 = !DILocation(line: 77, column: 39, scope: !121)
!135 = !DILocation(line: 77, column: 17, scope: !121)
!136 = distinct !{!136, !123, !137, !71}
!137 = !DILocation(line: 81, column: 17, scope: !118)
!138 = !DILocation(line: 83, column: 20, scope: !103)
!139 = !DILocation(line: 83, column: 18, scope: !103)
!140 = !DILocation(line: 85, column: 21, scope: !98)
!141 = !DILocation(line: 85, column: 10, scope: !98)
!142 = !DILocation(line: 85, column: 19, scope: !98)
!143 = !DILocalVariable(name: "data", scope: !144, file: !3, line: 88, type: !8)
!144 = distinct !DILexicalBlock(scope: !89, file: !3, line: 87, column: 5)
!145 = !DILocation(line: 88, column: 25, scope: !144)
!146 = !DILocation(line: 88, column: 33, scope: !144)
!147 = !DILocation(line: 88, column: 32, scope: !144)
!148 = !DILocation(line: 89, column: 26, scope: !144)
!149 = !DILocation(line: 89, column: 9, scope: !144)
!150 = !DILocation(line: 91, column: 14, scope: !144)
!151 = !DILocation(line: 91, column: 9, scope: !144)
!152 = !DILocation(line: 93, column: 1, scope: !89)
