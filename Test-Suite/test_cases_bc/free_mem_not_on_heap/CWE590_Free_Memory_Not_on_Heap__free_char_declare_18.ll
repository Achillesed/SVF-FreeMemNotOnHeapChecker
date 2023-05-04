; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_18.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  br label %source, !dbg !21

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !22), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !33
  store i8* %arraydecay1, i8** %data, align 8, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  call void @printLine(i8* noundef %0), !dbg !36
  %1 = load i8*, i8** %data, align 8, !dbg !37
  call void @free(i8* noundef %1) #6, !dbg !38
  ret void, !dbg !39
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
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_18_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !43 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !44, metadata !DIExpression()), !dbg !45
  store i8* null, i8** %data, align 8, !dbg !46
  br label %source, !dbg !47

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !48), !dbg !49
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !50, metadata !DIExpression()), !dbg !52
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !53
  store i8* %call, i8** %dataBuffer, align 8, !dbg !52
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !54
  %cmp = icmp eq i8* %0, null, !dbg !56
  br i1 %cmp, label %if.then, label %if.end, !dbg !57

if.then:                                          ; preds = %source
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @exit(i32 noundef 1) #7, !dbg !60
  unreachable, !dbg !60

if.end:                                           ; preds = %source
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !61
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !62
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !63
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !63
  store i8 0, i8* %arrayidx, align 1, !dbg !64
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !65
  store i8* %3, i8** %data, align 8, !dbg !66
  %4 = load i8*, i8** %data, align 8, !dbg !67
  call void @printLine(i8* noundef %4), !dbg !68
  %5 = load i8*, i8** %data, align 8, !dbg !69
  call void @free(i8* noundef %5) #6, !dbg !70
  ret void, !dbg !71
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_18.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "984e8cc3113c1a754591b212440840dc")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_18_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILabel(scope: !14, name: "source", file: !1, line: 28)
!23 = !DILocation(line: 28, column: 1, scope: !14)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !1, line: 31, type: !26)
!25 = distinct !DILexicalBlock(scope: !14, file: !1, line: 29, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 31, column: 14, scope: !25)
!30 = !DILocation(line: 32, column: 9, scope: !25)
!31 = !DILocation(line: 33, column: 9, scope: !25)
!32 = !DILocation(line: 33, column: 27, scope: !25)
!33 = !DILocation(line: 34, column: 16, scope: !25)
!34 = !DILocation(line: 34, column: 14, scope: !25)
!35 = !DILocation(line: 36, column: 15, scope: !14)
!36 = !DILocation(line: 36, column: 5, scope: !14)
!37 = !DILocation(line: 38, column: 10, scope: !14)
!38 = !DILocation(line: 38, column: 5, scope: !14)
!39 = !DILocation(line: 39, column: 1, scope: !14)
!40 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_18_good", scope: !1, file: !1, line: 69, type: !15, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!41 = !DILocation(line: 71, column: 5, scope: !40)
!42 = !DILocation(line: 72, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 46, type: !15, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!44 = !DILocalVariable(name: "data", scope: !43, file: !1, line: 48, type: !3)
!45 = !DILocation(line: 48, column: 12, scope: !43)
!46 = !DILocation(line: 49, column: 10, scope: !43)
!47 = !DILocation(line: 50, column: 5, scope: !43)
!48 = !DILabel(scope: !43, name: "source", file: !1, line: 51)
!49 = !DILocation(line: 51, column: 1, scope: !43)
!50 = !DILocalVariable(name: "dataBuffer", scope: !51, file: !1, line: 54, type: !3)
!51 = distinct !DILexicalBlock(scope: !43, file: !1, line: 52, column: 5)
!52 = !DILocation(line: 54, column: 16, scope: !51)
!53 = !DILocation(line: 54, column: 37, scope: !51)
!54 = !DILocation(line: 55, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !1, line: 55, column: 13)
!56 = !DILocation(line: 55, column: 24, scope: !55)
!57 = !DILocation(line: 55, column: 13, scope: !51)
!58 = !DILocation(line: 57, column: 13, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !1, line: 56, column: 9)
!60 = !DILocation(line: 58, column: 13, scope: !59)
!61 = !DILocation(line: 60, column: 16, scope: !51)
!62 = !DILocation(line: 60, column: 9, scope: !51)
!63 = !DILocation(line: 61, column: 9, scope: !51)
!64 = !DILocation(line: 61, column: 27, scope: !51)
!65 = !DILocation(line: 62, column: 16, scope: !51)
!66 = !DILocation(line: 62, column: 14, scope: !51)
!67 = !DILocation(line: 64, column: 15, scope: !43)
!68 = !DILocation(line: 64, column: 5, scope: !43)
!69 = !DILocation(line: 66, column: 10, scope: !43)
!70 = !DILocation(line: 66, column: 5, scope: !43)
!71 = !DILocation(line: 67, column: 1, scope: !43)
