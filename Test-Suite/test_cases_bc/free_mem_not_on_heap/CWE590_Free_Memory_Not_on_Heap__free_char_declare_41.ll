; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_41.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_41_badSink(i8* noundef %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8*, i8** %data.addr, align 8, !dbg !20
  call void @printLine(i8* noundef %0), !dbg !21
  %1 = load i8*, i8** %data.addr, align 8, !dbg !22
  call void @free(i8* noundef %1) #6, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printLine(i8* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_41_bad() #0 !dbg !25 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i8* null, i8** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !37
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !40
  store i8* %arraydecay1, i8** %data, align 8, !dbg !41
  %0 = load i8*, i8** %data, align 8, !dbg !42
  call void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_41_badSink(i8* noundef %0), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_41_goodG2BSink(i8* noundef %data) #0 !dbg !45 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !46, metadata !DIExpression()), !dbg !47
  %0 = load i8*, i8** %data.addr, align 8, !dbg !48
  call void @printLine(i8* noundef %0), !dbg !49
  %1 = load i8*, i8** %data.addr, align 8, !dbg !50
  call void @free(i8* noundef %1) #6, !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_41_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !56 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !57, metadata !DIExpression()), !dbg !58
  store i8* null, i8** %data, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !60, metadata !DIExpression()), !dbg !62
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !63
  store i8* %call, i8** %dataBuffer, align 8, !dbg !62
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !64
  %cmp = icmp eq i8* %0, null, !dbg !66
  br i1 %cmp, label %if.then, label %if.end, !dbg !67

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @exit(i32 noundef 1) #7, !dbg !70
  unreachable, !dbg !70

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !72
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !73
  store i8 0, i8* %arrayidx, align 1, !dbg !74
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !75
  store i8* %3, i8** %data, align 8, !dbg !76
  %4 = load i8*, i8** %data, align 8, !dbg !77
  call void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_41_goodG2BSink(i8* noundef %4), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_41.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "7581caf3fdfcdf65e5c522266f3b6bfb")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_41_badSink", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !3}
!17 = !{}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !1, line: 23, type: !3)
!19 = !DILocation(line: 23, column: 74, scope: !14)
!20 = !DILocation(line: 25, column: 15, scope: !14)
!21 = !DILocation(line: 25, column: 5, scope: !14)
!22 = !DILocation(line: 27, column: 10, scope: !14)
!23 = !DILocation(line: 27, column: 5, scope: !14)
!24 = !DILocation(line: 28, column: 1, scope: !14)
!25 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_41_bad", scope: !1, file: !1, line: 30, type: !26, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "data", scope: !25, file: !1, line: 32, type: !3)
!29 = !DILocation(line: 32, column: 12, scope: !25)
!30 = !DILocation(line: 33, column: 10, scope: !25)
!31 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !1, line: 36, type: !33)
!32 = distinct !DILexicalBlock(scope: !25, file: !1, line: 34, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 36, column: 14, scope: !32)
!37 = !DILocation(line: 37, column: 9, scope: !32)
!38 = !DILocation(line: 38, column: 9, scope: !32)
!39 = !DILocation(line: 38, column: 27, scope: !32)
!40 = !DILocation(line: 39, column: 16, scope: !32)
!41 = !DILocation(line: 39, column: 14, scope: !32)
!42 = !DILocation(line: 41, column: 66, scope: !25)
!43 = !DILocation(line: 41, column: 5, scope: !25)
!44 = !DILocation(line: 42, column: 1, scope: !25)
!45 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_41_goodG2BSink", scope: !1, file: !1, line: 48, type: !15, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!46 = !DILocalVariable(name: "data", arg: 1, scope: !45, file: !1, line: 48, type: !3)
!47 = !DILocation(line: 48, column: 78, scope: !45)
!48 = !DILocation(line: 50, column: 15, scope: !45)
!49 = !DILocation(line: 50, column: 5, scope: !45)
!50 = !DILocation(line: 52, column: 10, scope: !45)
!51 = !DILocation(line: 52, column: 5, scope: !45)
!52 = !DILocation(line: 53, column: 1, scope: !45)
!53 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_41_good", scope: !1, file: !1, line: 75, type: !26, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!54 = !DILocation(line: 77, column: 5, scope: !53)
!55 = !DILocation(line: 78, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 56, type: !26, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!57 = !DILocalVariable(name: "data", scope: !56, file: !1, line: 58, type: !3)
!58 = !DILocation(line: 58, column: 12, scope: !56)
!59 = !DILocation(line: 59, column: 10, scope: !56)
!60 = !DILocalVariable(name: "dataBuffer", scope: !61, file: !1, line: 62, type: !3)
!61 = distinct !DILexicalBlock(scope: !56, file: !1, line: 60, column: 5)
!62 = !DILocation(line: 62, column: 16, scope: !61)
!63 = !DILocation(line: 62, column: 37, scope: !61)
!64 = !DILocation(line: 63, column: 13, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !1, line: 63, column: 13)
!66 = !DILocation(line: 63, column: 24, scope: !65)
!67 = !DILocation(line: 63, column: 13, scope: !61)
!68 = !DILocation(line: 65, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !1, line: 64, column: 9)
!70 = !DILocation(line: 66, column: 13, scope: !69)
!71 = !DILocation(line: 68, column: 16, scope: !61)
!72 = !DILocation(line: 68, column: 9, scope: !61)
!73 = !DILocation(line: 69, column: 9, scope: !61)
!74 = !DILocation(line: 69, column: 27, scope: !61)
!75 = !DILocation(line: 70, column: 16, scope: !61)
!76 = !DILocation(line: 70, column: 14, scope: !61)
!77 = !DILocation(line: 72, column: 70, scope: !56)
!78 = !DILocation(line: 72, column: 5, scope: !56)
!79 = !DILocation(line: 73, column: 1, scope: !56)
