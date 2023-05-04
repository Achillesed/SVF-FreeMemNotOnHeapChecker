; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_15.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_15_bad() #0 !dbg !14 {
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_15_good() #0 !dbg !37 {
entry:
  call void @goodG2B1(), !dbg !38
  call void @goodG2B2(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !41 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !42, metadata !DIExpression()), !dbg !43
  store i8* null, i8** %data, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !45, metadata !DIExpression()), !dbg !47
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !48
  store i8* %call, i8** %dataBuffer, align 8, !dbg !47
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !49
  %cmp = icmp eq i8* %0, null, !dbg !51
  br i1 %cmp, label %if.then, label %if.end, !dbg !52

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @exit(i32 noundef 1) #7, !dbg !55
  unreachable, !dbg !55

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !57
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !58
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !58
  store i8 0, i8* %arrayidx, align 1, !dbg !59
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !60
  store i8* %3, i8** %data, align 8, !dbg !61
  %4 = load i8*, i8** %data, align 8, !dbg !62
  call void @printLine(i8* noundef %4), !dbg !63
  %5 = load i8*, i8** %data, align 8, !dbg !64
  call void @free(i8* noundef %5) #6, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !67 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i8* null, i8** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !73
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !74
  store i8* %call, i8** %dataBuffer, align 8, !dbg !73
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !75
  %cmp = icmp eq i8* %0, null, !dbg !77
  br i1 %cmp, label %if.then, label %if.end, !dbg !78

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @exit(i32 noundef 1) #7, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !83
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !86
  store i8* %3, i8** %data, align 8, !dbg !87
  %4 = load i8*, i8** %data, align 8, !dbg !88
  call void @printLine(i8* noundef %4), !dbg !89
  %5 = load i8*, i8** %data, align 8, !dbg !90
  call void @free(i8* noundef %5) #6, !dbg !91
  ret void, !dbg !92
}

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_15.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "a74cb7d1ea5728b8bb862a889a19b8d3")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_15_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocalVariable(name: "dataBuffer", scope: !22, file: !1, line: 32, type: !23)
!22 = distinct !DILexicalBlock(scope: !14, file: !1, line: 30, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 32, column: 14, scope: !22)
!27 = !DILocation(line: 33, column: 9, scope: !22)
!28 = !DILocation(line: 34, column: 9, scope: !22)
!29 = !DILocation(line: 34, column: 27, scope: !22)
!30 = !DILocation(line: 35, column: 16, scope: !22)
!31 = !DILocation(line: 35, column: 14, scope: !22)
!32 = !DILocation(line: 43, column: 15, scope: !14)
!33 = !DILocation(line: 43, column: 5, scope: !14)
!34 = !DILocation(line: 45, column: 10, scope: !14)
!35 = !DILocation(line: 45, column: 5, scope: !14)
!36 = !DILocation(line: 46, column: 1, scope: !14)
!37 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_15_good", scope: !1, file: !1, line: 114, type: !15, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!38 = !DILocation(line: 116, column: 5, scope: !37)
!39 = !DILocation(line: 117, column: 5, scope: !37)
!40 = !DILocation(line: 118, column: 1, scope: !37)
!41 = distinct !DISubprogram(name: "goodG2B1", scope: !1, file: !1, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!42 = !DILocalVariable(name: "data", scope: !41, file: !1, line: 55, type: !3)
!43 = !DILocation(line: 55, column: 12, scope: !41)
!44 = !DILocation(line: 56, column: 10, scope: !41)
!45 = !DILocalVariable(name: "dataBuffer", scope: !46, file: !1, line: 66, type: !3)
!46 = distinct !DILexicalBlock(scope: !41, file: !1, line: 64, column: 5)
!47 = !DILocation(line: 66, column: 16, scope: !46)
!48 = !DILocation(line: 66, column: 37, scope: !46)
!49 = !DILocation(line: 67, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 67, column: 13)
!51 = !DILocation(line: 67, column: 24, scope: !50)
!52 = !DILocation(line: 67, column: 13, scope: !46)
!53 = !DILocation(line: 69, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !1, line: 68, column: 9)
!55 = !DILocation(line: 70, column: 13, scope: !54)
!56 = !DILocation(line: 72, column: 16, scope: !46)
!57 = !DILocation(line: 72, column: 9, scope: !46)
!58 = !DILocation(line: 73, column: 9, scope: !46)
!59 = !DILocation(line: 73, column: 27, scope: !46)
!60 = !DILocation(line: 74, column: 16, scope: !46)
!61 = !DILocation(line: 74, column: 14, scope: !46)
!62 = !DILocation(line: 78, column: 15, scope: !41)
!63 = !DILocation(line: 78, column: 5, scope: !41)
!64 = !DILocation(line: 80, column: 10, scope: !41)
!65 = !DILocation(line: 80, column: 5, scope: !41)
!66 = !DILocation(line: 81, column: 1, scope: !41)
!67 = distinct !DISubprogram(name: "goodG2B2", scope: !1, file: !1, line: 84, type: !15, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!68 = !DILocalVariable(name: "data", scope: !67, file: !1, line: 86, type: !3)
!69 = !DILocation(line: 86, column: 12, scope: !67)
!70 = !DILocation(line: 87, column: 10, scope: !67)
!71 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !1, line: 93, type: !3)
!72 = distinct !DILexicalBlock(scope: !67, file: !1, line: 91, column: 5)
!73 = !DILocation(line: 93, column: 16, scope: !72)
!74 = !DILocation(line: 93, column: 37, scope: !72)
!75 = !DILocation(line: 94, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !1, line: 94, column: 13)
!77 = !DILocation(line: 94, column: 24, scope: !76)
!78 = !DILocation(line: 94, column: 13, scope: !72)
!79 = !DILocation(line: 96, column: 13, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !1, line: 95, column: 9)
!81 = !DILocation(line: 97, column: 13, scope: !80)
!82 = !DILocation(line: 99, column: 16, scope: !72)
!83 = !DILocation(line: 99, column: 9, scope: !72)
!84 = !DILocation(line: 100, column: 9, scope: !72)
!85 = !DILocation(line: 100, column: 27, scope: !72)
!86 = !DILocation(line: 101, column: 16, scope: !72)
!87 = !DILocation(line: 101, column: 14, scope: !72)
!88 = !DILocation(line: 109, column: 15, scope: !67)
!89 = !DILocation(line: 109, column: 5, scope: !67)
!90 = !DILocation(line: 111, column: 10, scope: !67)
!91 = !DILocation(line: 111, column: 5, scope: !67)
!92 = !DILocation(line: 112, column: 1, scope: !67)
