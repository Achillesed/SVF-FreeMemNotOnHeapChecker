; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_static_18.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_static_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_char_static_18_bad.dataBuffer = internal global [100 x i8] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_18_bad() #0 !dbg !2 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  br label %source, !dbg !27

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !28), !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_18_bad.dataBuffer, i64 0, i64 0), i8 65, i64 99, i1 false), !dbg !30
  store i8 0, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_18_bad.dataBuffer, i64 0, i64 99), align 1, !dbg !32
  store i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_18_bad.dataBuffer, i64 0, i64 0), i8** %data, align 8, !dbg !33
  %0 = load i8*, i8** %data, align 8, !dbg !34
  call void @printLine(i8* noundef %0), !dbg !35
  %1 = load i8*, i8** %data, align 8, !dbg !36
  call void @free(i8* noundef %1) #6, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_18_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !42 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !43, metadata !DIExpression()), !dbg !44
  store i8* null, i8** %data, align 8, !dbg !45
  br label %source, !dbg !46

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !47), !dbg !48
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !49, metadata !DIExpression()), !dbg !51
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !52
  store i8* %call, i8** %dataBuffer, align 8, !dbg !51
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !53
  %cmp = icmp eq i8* %0, null, !dbg !55
  br i1 %cmp, label %if.then, label %if.end, !dbg !56

if.then:                                          ; preds = %source
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @exit(i32 noundef 1) #7, !dbg !59
  unreachable, !dbg !59

if.end:                                           ; preds = %source
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !61
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !62
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !62
  store i8 0, i8* %arrayidx, align 1, !dbg !63
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !64
  store i8* %3, i8** %data, align 8, !dbg !65
  %4 = load i8*, i8** %data, align 8, !dbg !66
  call void @printLine(i8* noundef %4), !dbg !67
  %5 = load i8*, i8** %data, align 8, !dbg !68
  call void @free(i8* noundef %5) #6, !dbg !69
  ret void, !dbg !70
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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 31, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_18_bad", scope: !3, file: !3, line: 23, type: !4, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_static_18.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "be87764b54024cae21f37777b63b65f7")
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
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 25, type: !8)
!25 = !DILocation(line: 25, column: 12, scope: !2)
!26 = !DILocation(line: 26, column: 10, scope: !2)
!27 = !DILocation(line: 27, column: 5, scope: !2)
!28 = !DILabel(scope: !2, name: "source", file: !3, line: 28)
!29 = !DILocation(line: 28, column: 1, scope: !2)
!30 = !DILocation(line: 32, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !2, file: !3, line: 29, column: 5)
!32 = !DILocation(line: 33, column: 27, scope: !31)
!33 = !DILocation(line: 34, column: 14, scope: !31)
!34 = !DILocation(line: 36, column: 15, scope: !2)
!35 = !DILocation(line: 36, column: 5, scope: !2)
!36 = !DILocation(line: 38, column: 10, scope: !2)
!37 = !DILocation(line: 38, column: 5, scope: !2)
!38 = !DILocation(line: 39, column: 1, scope: !2)
!39 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_18_good", scope: !3, file: !3, line: 69, type: !4, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!40 = !DILocation(line: 71, column: 5, scope: !39)
!41 = !DILocation(line: 72, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 46, type: !4, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!43 = !DILocalVariable(name: "data", scope: !42, file: !3, line: 48, type: !8)
!44 = !DILocation(line: 48, column: 12, scope: !42)
!45 = !DILocation(line: 49, column: 10, scope: !42)
!46 = !DILocation(line: 50, column: 5, scope: !42)
!47 = !DILabel(scope: !42, name: "source", file: !3, line: 51)
!48 = !DILocation(line: 51, column: 1, scope: !42)
!49 = !DILocalVariable(name: "dataBuffer", scope: !50, file: !3, line: 54, type: !8)
!50 = distinct !DILexicalBlock(scope: !42, file: !3, line: 52, column: 5)
!51 = !DILocation(line: 54, column: 16, scope: !50)
!52 = !DILocation(line: 54, column: 37, scope: !50)
!53 = !DILocation(line: 55, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !3, line: 55, column: 13)
!55 = !DILocation(line: 55, column: 24, scope: !54)
!56 = !DILocation(line: 55, column: 13, scope: !50)
!57 = !DILocation(line: 57, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !3, line: 56, column: 9)
!59 = !DILocation(line: 58, column: 13, scope: !58)
!60 = !DILocation(line: 60, column: 16, scope: !50)
!61 = !DILocation(line: 60, column: 9, scope: !50)
!62 = !DILocation(line: 61, column: 9, scope: !50)
!63 = !DILocation(line: 61, column: 27, scope: !50)
!64 = !DILocation(line: 62, column: 16, scope: !50)
!65 = !DILocation(line: 62, column: 14, scope: !50)
!66 = !DILocation(line: 64, column: 15, scope: !42)
!67 = !DILocation(line: 64, column: 5, scope: !42)
!68 = !DILocation(line: 66, column: 10, scope: !42)
!69 = !DILocation(line: 66, column: 5, scope: !42)
!70 = !DILocation(line: 67, column: 1, scope: !42)
