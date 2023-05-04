; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_static_34.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_static_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.CWE590_Free_Memory_Not_on_Heap__free_char_static_34_unionType = type { i8* }

@CWE590_Free_Memory_Not_on_Heap__free_char_static_34_bad.dataBuffer = internal global [100 x i8] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_34_bad() #0 !dbg !2 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_char_static_34_unionType, align 8
  %data1 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_char_static_34_unionType* %myUnion, metadata !26, metadata !DIExpression()), !dbg !32
  store i8* null, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_34_bad.dataBuffer, i64 0, i64 0), i8 65, i64 99, i1 false), !dbg !34
  store i8 0, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_34_bad.dataBuffer, i64 0, i64 99), align 1, !dbg !36
  store i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_34_bad.dataBuffer, i64 0, i64 0), i8** %data, align 8, !dbg !37
  %0 = load i8*, i8** %data, align 8, !dbg !38
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_char_static_34_unionType* %myUnion to i8**, !dbg !39
  store i8* %0, i8** %unionFirst, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !41, metadata !DIExpression()), !dbg !43
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_char_static_34_unionType* %myUnion to i8**, !dbg !44
  %1 = load i8*, i8** %unionSecond, align 8, !dbg !44
  store i8* %1, i8** %data1, align 8, !dbg !43
  %2 = load i8*, i8** %data1, align 8, !dbg !45
  call void @printLine(i8* noundef %2), !dbg !46
  %3 = load i8*, i8** %data1, align 8, !dbg !47
  call void @free(i8* noundef %3) #6, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_34_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !53 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE590_Free_Memory_Not_on_Heap__free_char_static_34_unionType, align 8
  %dataBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata %union.CWE590_Free_Memory_Not_on_Heap__free_char_static_34_unionType* %myUnion, metadata !56, metadata !DIExpression()), !dbg !57
  store i8* null, i8** %data, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !59, metadata !DIExpression()), !dbg !61
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !62
  store i8* %call, i8** %dataBuffer, align 8, !dbg !61
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !63
  %cmp = icmp eq i8* %0, null, !dbg !65
  br i1 %cmp, label %if.then, label %if.end, !dbg !66

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @exit(i32 noundef 1) #7, !dbg !69
  unreachable, !dbg !69

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !71
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !72
  store i8 0, i8* %arrayidx, align 1, !dbg !73
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !74
  store i8* %3, i8** %data, align 8, !dbg !75
  %4 = load i8*, i8** %data, align 8, !dbg !76
  %unionFirst = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_char_static_34_unionType* %myUnion to i8**, !dbg !77
  store i8* %4, i8** %unionFirst, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !79, metadata !DIExpression()), !dbg !81
  %unionSecond = bitcast %union.CWE590_Free_Memory_Not_on_Heap__free_char_static_34_unionType* %myUnion to i8**, !dbg !82
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !82
  store i8* %5, i8** %data1, align 8, !dbg !81
  %6 = load i8*, i8** %data1, align 8, !dbg !83
  call void @printLine(i8* noundef %6), !dbg !84
  %7 = load i8*, i8** %data1, align 8, !dbg !85
  call void @free(i8* noundef %7) #6, !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 36, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_34_bad", scope: !3, file: !3, line: 29, type: !4, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_static_34.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "3933d1c299ffd65d0fbe0fc955fd9122")
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
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 31, type: !8)
!25 = !DILocation(line: 31, column: 12, scope: !2)
!26 = !DILocalVariable(name: "myUnion", scope: !2, file: !3, line: 32, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_34_unionType", file: !3, line: 25, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !3, line: 21, size: 64, elements: !29)
!29 = !{!30, !31}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !28, file: !3, line: 23, baseType: !8, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !28, file: !3, line: 24, baseType: !8, size: 64)
!32 = !DILocation(line: 32, column: 67, scope: !2)
!33 = !DILocation(line: 33, column: 10, scope: !2)
!34 = !DILocation(line: 37, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !2, file: !3, line: 34, column: 5)
!36 = !DILocation(line: 38, column: 27, scope: !35)
!37 = !DILocation(line: 39, column: 14, scope: !35)
!38 = !DILocation(line: 41, column: 26, scope: !2)
!39 = !DILocation(line: 41, column: 13, scope: !2)
!40 = !DILocation(line: 41, column: 24, scope: !2)
!41 = !DILocalVariable(name: "data", scope: !42, file: !3, line: 43, type: !8)
!42 = distinct !DILexicalBlock(scope: !2, file: !3, line: 42, column: 5)
!43 = !DILocation(line: 43, column: 16, scope: !42)
!44 = !DILocation(line: 43, column: 31, scope: !42)
!45 = !DILocation(line: 44, column: 19, scope: !42)
!46 = !DILocation(line: 44, column: 9, scope: !42)
!47 = !DILocation(line: 46, column: 14, scope: !42)
!48 = !DILocation(line: 46, column: 9, scope: !42)
!49 = !DILocation(line: 48, column: 1, scope: !2)
!50 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_34_good", scope: !3, file: !3, line: 81, type: !4, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!51 = !DILocation(line: 83, column: 5, scope: !50)
!52 = !DILocation(line: 84, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 55, type: !4, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!54 = !DILocalVariable(name: "data", scope: !53, file: !3, line: 57, type: !8)
!55 = !DILocation(line: 57, column: 12, scope: !53)
!56 = !DILocalVariable(name: "myUnion", scope: !53, file: !3, line: 58, type: !27)
!57 = !DILocation(line: 58, column: 67, scope: !53)
!58 = !DILocation(line: 59, column: 10, scope: !53)
!59 = !DILocalVariable(name: "dataBuffer", scope: !60, file: !3, line: 62, type: !8)
!60 = distinct !DILexicalBlock(scope: !53, file: !3, line: 60, column: 5)
!61 = !DILocation(line: 62, column: 16, scope: !60)
!62 = !DILocation(line: 62, column: 37, scope: !60)
!63 = !DILocation(line: 63, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !3, line: 63, column: 13)
!65 = !DILocation(line: 63, column: 24, scope: !64)
!66 = !DILocation(line: 63, column: 13, scope: !60)
!67 = !DILocation(line: 65, column: 13, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !3, line: 64, column: 9)
!69 = !DILocation(line: 66, column: 13, scope: !68)
!70 = !DILocation(line: 68, column: 16, scope: !60)
!71 = !DILocation(line: 68, column: 9, scope: !60)
!72 = !DILocation(line: 69, column: 9, scope: !60)
!73 = !DILocation(line: 69, column: 27, scope: !60)
!74 = !DILocation(line: 70, column: 16, scope: !60)
!75 = !DILocation(line: 70, column: 14, scope: !60)
!76 = !DILocation(line: 72, column: 26, scope: !53)
!77 = !DILocation(line: 72, column: 13, scope: !53)
!78 = !DILocation(line: 72, column: 24, scope: !53)
!79 = !DILocalVariable(name: "data", scope: !80, file: !3, line: 74, type: !8)
!80 = distinct !DILexicalBlock(scope: !53, file: !3, line: 73, column: 5)
!81 = !DILocation(line: 74, column: 16, scope: !80)
!82 = !DILocation(line: 74, column: 31, scope: !80)
!83 = !DILocation(line: 75, column: 19, scope: !80)
!84 = !DILocation(line: 75, column: 9, scope: !80)
!85 = !DILocation(line: 77, column: 14, scope: !80)
!86 = !DILocation(line: 77, column: 9, scope: !80)
!87 = !DILocation(line: 79, column: 1, scope: !53)
