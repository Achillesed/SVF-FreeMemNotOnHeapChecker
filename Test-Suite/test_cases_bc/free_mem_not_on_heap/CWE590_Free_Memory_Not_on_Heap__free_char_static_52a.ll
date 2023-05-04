; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_static_52a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_static_52a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@CWE590_Free_Memory_Not_on_Heap__free_char_static_52_bad.dataBuffer = internal global [100 x i8] zeroinitializer, align 16, !dbg !0
@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_52_bad() #0 !dbg !2 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_52_bad.dataBuffer, i64 0, i64 0), i8 65, i64 99, i1 false), !dbg !27
  store i8 0, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_52_bad.dataBuffer, i64 0, i64 99), align 1, !dbg !29
  store i8* getelementptr inbounds ([100 x i8], [100 x i8]* @CWE590_Free_Memory_Not_on_Heap__free_char_static_52_bad.dataBuffer, i64 0, i64 0), i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  call void @CWE590_Free_Memory_Not_on_Heap__free_char_static_52b_badSink(i8* noundef %0), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_static_52b_badSink(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_static_52_good() #0 !dbg !34 {
entry:
  call void @goodG2B(), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !37 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !38, metadata !DIExpression()), !dbg !39
  store i8* null, i8** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !41, metadata !DIExpression()), !dbg !43
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !44
  store i8* %call, i8** %dataBuffer, align 8, !dbg !43
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !45
  %cmp = icmp eq i8* %0, null, !dbg !47
  br i1 %cmp, label %if.then, label %if.end, !dbg !48

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !49
  call void @exit(i32 noundef 1) #7, !dbg !51
  unreachable, !dbg !51

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !53
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !54
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !54
  store i8 0, i8* %arrayidx, align 1, !dbg !55
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !56
  store i8* %3, i8** %data, align 8, !dbg !57
  %4 = load i8*, i8** %data, align 8, !dbg !58
  call void @CWE590_Free_Memory_Not_on_Heap__free_char_static_52b_goodG2BSink(i8* noundef %4), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_static_52b_goodG2BSink(i8* noundef) #3

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
!1 = distinct !DIGlobalVariable(name: "dataBuffer", scope: !2, file: !3, line: 32, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_52_bad", scope: !3, file: !3, line: 26, type: !4, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_static_52a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "769f885883e6c258eb98344e6e6fd232")
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
!24 = !DILocalVariable(name: "data", scope: !2, file: !3, line: 28, type: !8)
!25 = !DILocation(line: 28, column: 12, scope: !2)
!26 = !DILocation(line: 29, column: 10, scope: !2)
!27 = !DILocation(line: 33, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !2, file: !3, line: 30, column: 5)
!29 = !DILocation(line: 34, column: 27, scope: !28)
!30 = !DILocation(line: 35, column: 14, scope: !28)
!31 = !DILocation(line: 37, column: 66, scope: !2)
!32 = !DILocation(line: 37, column: 5, scope: !2)
!33 = !DILocation(line: 38, column: 1, scope: !2)
!34 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_static_52_good", scope: !3, file: !3, line: 67, type: !4, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !12)
!35 = !DILocation(line: 69, column: 5, scope: !34)
!36 = !DILocation(line: 70, column: 1, scope: !34)
!37 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 48, type: !4, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !12)
!38 = !DILocalVariable(name: "data", scope: !37, file: !3, line: 50, type: !8)
!39 = !DILocation(line: 50, column: 12, scope: !37)
!40 = !DILocation(line: 51, column: 10, scope: !37)
!41 = !DILocalVariable(name: "dataBuffer", scope: !42, file: !3, line: 54, type: !8)
!42 = distinct !DILexicalBlock(scope: !37, file: !3, line: 52, column: 5)
!43 = !DILocation(line: 54, column: 16, scope: !42)
!44 = !DILocation(line: 54, column: 37, scope: !42)
!45 = !DILocation(line: 55, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !3, line: 55, column: 13)
!47 = !DILocation(line: 55, column: 24, scope: !46)
!48 = !DILocation(line: 55, column: 13, scope: !42)
!49 = !DILocation(line: 57, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !3, line: 56, column: 9)
!51 = !DILocation(line: 58, column: 13, scope: !50)
!52 = !DILocation(line: 60, column: 16, scope: !42)
!53 = !DILocation(line: 60, column: 9, scope: !42)
!54 = !DILocation(line: 61, column: 9, scope: !42)
!55 = !DILocation(line: 61, column: 27, scope: !42)
!56 = !DILocation(line: 62, column: 16, scope: !42)
!57 = !DILocation(line: 62, column: 14, scope: !42)
!58 = !DILocation(line: 64, column: 70, scope: !37)
!59 = !DILocation(line: 64, column: 5, scope: !37)
!60 = !DILocation(line: 65, column: 1, scope: !37)
