; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_53a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_53a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_53_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %0, i8** %dataBuffer, align 8, !dbg !23
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !26
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  store i8* %3, i8** %data, align 8, !dbg !30
  %4 = load i8*, i8** %data, align 8, !dbg !31
  call void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_53b_badSink(i8* noundef %4), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_53b_badSink(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_53_good() #0 !dbg !34 {
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
  call void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_53b_goodG2BSink(i8* noundef %4), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_53b_goodG2BSink(i8* noundef) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_53a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "64582762bd53ee1483c9727a7a722300")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_53_bad", scope: !1, file: !1, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 28, type: !3)
!19 = !DILocation(line: 28, column: 12, scope: !14)
!20 = !DILocation(line: 29, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !1, line: 32, type: !3)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 30, column: 5)
!23 = !DILocation(line: 32, column: 16, scope: !22)
!24 = !DILocation(line: 32, column: 37, scope: !22)
!25 = !DILocation(line: 33, column: 16, scope: !22)
!26 = !DILocation(line: 33, column: 9, scope: !22)
!27 = !DILocation(line: 34, column: 9, scope: !22)
!28 = !DILocation(line: 34, column: 27, scope: !22)
!29 = !DILocation(line: 35, column: 16, scope: !22)
!30 = !DILocation(line: 35, column: 14, scope: !22)
!31 = !DILocation(line: 37, column: 66, scope: !14)
!32 = !DILocation(line: 37, column: 5, scope: !14)
!33 = !DILocation(line: 38, column: 1, scope: !14)
!34 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_53_good", scope: !1, file: !1, line: 67, type: !15, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!35 = !DILocation(line: 69, column: 5, scope: !34)
!36 = !DILocation(line: 70, column: 1, scope: !34)
!37 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!38 = !DILocalVariable(name: "data", scope: !37, file: !1, line: 50, type: !3)
!39 = !DILocation(line: 50, column: 12, scope: !37)
!40 = !DILocation(line: 51, column: 10, scope: !37)
!41 = !DILocalVariable(name: "dataBuffer", scope: !42, file: !1, line: 54, type: !3)
!42 = distinct !DILexicalBlock(scope: !37, file: !1, line: 52, column: 5)
!43 = !DILocation(line: 54, column: 16, scope: !42)
!44 = !DILocation(line: 54, column: 37, scope: !42)
!45 = !DILocation(line: 55, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !1, line: 55, column: 13)
!47 = !DILocation(line: 55, column: 24, scope: !46)
!48 = !DILocation(line: 55, column: 13, scope: !42)
!49 = !DILocation(line: 57, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 56, column: 9)
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
