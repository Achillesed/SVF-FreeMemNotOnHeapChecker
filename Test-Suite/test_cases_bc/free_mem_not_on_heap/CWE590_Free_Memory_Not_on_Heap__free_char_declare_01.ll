; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_01.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !27
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  store i8* %arraydecay1, i8** %data, align 8, !dbg !31
  %0 = load i8*, i8** %data, align 8, !dbg !32
  call void @printLine(i8* noundef %0), !dbg !33
  %1 = load i8*, i8** %data, align 8, !dbg !34
  call void @free(i8* noundef %1) #6, !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_01_good() #0 !dbg !37 {
entry:
  call void @goodG2B(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !40 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !41, metadata !DIExpression()), !dbg !42
  store i8* null, i8** %data, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !44, metadata !DIExpression()), !dbg !46
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !47
  store i8* %call, i8** %dataBuffer, align 8, !dbg !46
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !48
  %cmp = icmp eq i8* %0, null, !dbg !50
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @exit(i32 noundef 1) #7, !dbg !54
  unreachable, !dbg !54

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !56
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !57
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !57
  store i8 0, i8* %arrayidx, align 1, !dbg !58
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !59
  store i8* %3, i8** %data, align 8, !dbg !60
  %4 = load i8*, i8** %data, align 8, !dbg !61
  call void @printLine(i8* noundef %4), !dbg !62
  %5 = load i8*, i8** %data, align 8, !dbg !63
  call void @free(i8* noundef %5) #6, !dbg !64
  ret void, !dbg !65
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_01.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "3660c4bb26f55e8acac9df979aa72621")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_01_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !1, line: 29, type: !23)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 27, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 29, column: 14, scope: !22)
!27 = !DILocation(line: 30, column: 9, scope: !22)
!28 = !DILocation(line: 31, column: 9, scope: !22)
!29 = !DILocation(line: 31, column: 27, scope: !22)
!30 = !DILocation(line: 32, column: 16, scope: !22)
!31 = !DILocation(line: 32, column: 14, scope: !22)
!32 = !DILocation(line: 34, column: 15, scope: !14)
!33 = !DILocation(line: 34, column: 5, scope: !14)
!34 = !DILocation(line: 36, column: 10, scope: !14)
!35 = !DILocation(line: 36, column: 5, scope: !14)
!36 = !DILocation(line: 37, column: 1, scope: !14)
!37 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_01_good", scope: !1, file: !1, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!38 = !DILocation(line: 67, column: 5, scope: !37)
!39 = !DILocation(line: 68, column: 1, scope: !37)
!40 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 44, type: !15, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!41 = !DILocalVariable(name: "data", scope: !40, file: !1, line: 46, type: !3)
!42 = !DILocation(line: 46, column: 12, scope: !40)
!43 = !DILocation(line: 47, column: 10, scope: !40)
!44 = !DILocalVariable(name: "dataBuffer", scope: !45, file: !1, line: 50, type: !3)
!45 = distinct !DILexicalBlock(scope: !40, file: !1, line: 48, column: 5)
!46 = !DILocation(line: 50, column: 16, scope: !45)
!47 = !DILocation(line: 50, column: 37, scope: !45)
!48 = !DILocation(line: 51, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !1, line: 51, column: 13)
!50 = !DILocation(line: 51, column: 24, scope: !49)
!51 = !DILocation(line: 51, column: 13, scope: !45)
!52 = !DILocation(line: 53, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !1, line: 52, column: 9)
!54 = !DILocation(line: 54, column: 13, scope: !53)
!55 = !DILocation(line: 56, column: 16, scope: !45)
!56 = !DILocation(line: 56, column: 9, scope: !45)
!57 = !DILocation(line: 57, column: 9, scope: !45)
!58 = !DILocation(line: 57, column: 27, scope: !45)
!59 = !DILocation(line: 58, column: 16, scope: !45)
!60 = !DILocation(line: 58, column: 14, scope: !45)
!61 = !DILocation(line: 60, column: 15, scope: !40)
!62 = !DILocation(line: 60, column: 5, scope: !40)
!63 = !DILocation(line: 62, column: 10, scope: !40)
!64 = !DILocation(line: 62, column: 5, scope: !40)
!65 = !DILocation(line: 63, column: 1, scope: !40)
