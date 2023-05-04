; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_static_67a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_static_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._CWE590_Free_Memory_Not_on_Heap__free_char_static_67_structType = type { i8* }

@CWE590_Free_Memory_Not_on_Heap__free_char_static_67_bad.dataBuffer = internal global [100 x i8] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_67_bad() #0 !dbg !2 {
entry:
  %data = alloca i8*, align 8
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_char_static_67_structType, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_char_static_67_structType* %myStruct, metadata !26, metadata !DIExpression()), !dbg !31
  store i8* null, i8** %data, align 8, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_67_bad.dataBuffer, i64 0, i64 0), i8 65, i64 99, i1 false), !dbg !33
  store i8 0, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_67_bad.dataBuffer, i64 0, i64 99), align 1, !dbg !35
  store i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_67_bad.dataBuffer, i64 0, i64 0), i8** %data, align 8, !dbg !36
  %0 = load i8*, i8** %data, align 8, !dbg !37
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_char_static_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_char_static_67_structType* %myStruct, i32 0, i32 0, !dbg !38
  store i8* %0, i8** %structFirst, align 8, !dbg !39
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_char_static_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_char_static_67_structType* %myStruct, i32 0, i32 0, !dbg !40
  %1 = load i8*, i8** %coerce.dive, align 8, !dbg !40
  call void @CWE590_Free_Memory_Not_on_Heap__free_char_static_67b_badSink(i8* %1), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_static_67b_badSink(i8*) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_67_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !45 {
entry:
  %data = alloca i8*, align 8
  %myStruct = alloca %struct._CWE590_Free_Memory_Not_on_Heap__free_char_static_67_structType, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata %struct._CWE590_Free_Memory_Not_on_Heap__free_char_static_67_structType* %myStruct, metadata !48, metadata !DIExpression()), !dbg !49
  store i8* null, i8** %data, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !51, metadata !DIExpression()), !dbg !53
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !54
  store i8* %call, i8** %dataBuffer, align 8, !dbg !53
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !55
  %cmp = icmp eq i8* %0, null, !dbg !57
  br i1 %cmp, label %if.then, label %if.end, !dbg !58

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @exit(i32 noundef 1) #7, !dbg !61
  unreachable, !dbg !61

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !62
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !63
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !64
  store i8 0, i8* %arrayidx, align 1, !dbg !65
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !66
  store i8* %3, i8** %data, align 8, !dbg !67
  %4 = load i8*, i8** %data, align 8, !dbg !68
  %structFirst = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_char_static_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_char_static_67_structType* %myStruct, i32 0, i32 0, !dbg !69
  store i8* %4, i8** %structFirst, align 8, !dbg !70
  %coerce.dive = getelementptr inbounds %struct._CWE590_Free_Memory_Not_on_Heap__free_char_static_67_structType, %struct._CWE590_Free_Memory_Not_on_Heap__free_char_static_67_structType* %myStruct, i32 0, i32 0, !dbg !71
  %5 = load i8*, i8** %coerce.dive, align 8, !dbg !71
  call void @CWE590_Free_Memory_Not_on_Heap__free_char_static_67b_goodG2BSink(i8* %5), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_static_67b_goodG2BSink(i8*) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!6}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 38, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_67_bad", scope: !3, file: !3, line: 31, type: !4, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_static_67a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "5dac3d53f0f8f3f8a1b8317801c39ee0")
!4 = !DISubroutineType(types: !5)
!5 = !{null}
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !7, globals: !11, splitDebugInlining: false, nameTableKind: None)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !{!0}
!12 = !{}
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 800, elements: !14)
!14 = !{!15}
!15 = !DISubrange(count: 100)
!16 = !{i32 7, !"Dwarf Version", i32 5}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"PIE Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 33, type: !8)
!25 = !DILocation(line: 33, column: 12, scope: !2)
!26 = !DILocalVariable(name: "myStruct", scope: !2, file: !3, line: 34, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_67_structType", file: !3, line: 24, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE590_Free_Memory_Not_on_Heap__free_char_static_67_structType", file: !3, line: 21, size: 64, elements: !29)
!29 = !{!30}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !28, file: !3, line: 23, baseType: !8, size: 64)
!31 = !DILocation(line: 34, column: 68, scope: !2)
!32 = !DILocation(line: 35, column: 10, scope: !2)
!33 = !DILocation(line: 39, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !2, file: !3, line: 36, column: 5)
!35 = !DILocation(line: 40, column: 27, scope: !34)
!36 = !DILocation(line: 41, column: 14, scope: !34)
!37 = !DILocation(line: 43, column: 28, scope: !2)
!38 = !DILocation(line: 43, column: 14, scope: !2)
!39 = !DILocation(line: 43, column: 26, scope: !2)
!40 = !DILocation(line: 44, column: 5, scope: !2)
!41 = !DILocation(line: 45, column: 1, scope: !2)
!42 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_67_good", scope: !3, file: !3, line: 75, type: !4, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!43 = !DILocation(line: 77, column: 5, scope: !42)
!44 = !DILocation(line: 78, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 54, type: !4, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!46 = !DILocalVariable(name: "data", scope: !45, file: !3, line: 56, type: !8)
!47 = !DILocation(line: 56, column: 12, scope: !45)
!48 = !DILocalVariable(name: "myStruct", scope: !45, file: !3, line: 57, type: !27)
!49 = !DILocation(line: 57, column: 68, scope: !45)
!50 = !DILocation(line: 58, column: 10, scope: !45)
!51 = !DILocalVariable(name: "dataBuffer", scope: !52, file: !3, line: 61, type: !8)
!52 = distinct !DILexicalBlock(scope: !45, file: !3, line: 59, column: 5)
!53 = !DILocation(line: 61, column: 16, scope: !52)
!54 = !DILocation(line: 61, column: 37, scope: !52)
!55 = !DILocation(line: 62, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !3, line: 62, column: 13)
!57 = !DILocation(line: 62, column: 24, scope: !56)
!58 = !DILocation(line: 62, column: 13, scope: !52)
!59 = !DILocation(line: 64, column: 13, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !3, line: 63, column: 9)
!61 = !DILocation(line: 65, column: 13, scope: !60)
!62 = !DILocation(line: 67, column: 16, scope: !52)
!63 = !DILocation(line: 67, column: 9, scope: !52)
!64 = !DILocation(line: 68, column: 9, scope: !52)
!65 = !DILocation(line: 68, column: 27, scope: !52)
!66 = !DILocation(line: 69, column: 16, scope: !52)
!67 = !DILocation(line: 69, column: 14, scope: !52)
!68 = !DILocation(line: 71, column: 28, scope: !45)
!69 = !DILocation(line: 71, column: 14, scope: !45)
!70 = !DILocation(line: 71, column: 26, scope: !45)
!71 = !DILocation(line: 72, column: 5, scope: !45)
!72 = !DILocation(line: 73, column: 1, scope: !45)
