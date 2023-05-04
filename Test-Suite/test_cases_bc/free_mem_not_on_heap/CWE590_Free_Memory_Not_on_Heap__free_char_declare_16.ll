; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_16.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_16_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  br label %while.body, !dbg !21

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !22, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay1, i8** %data, align 8, !dbg !33
  br label %while.end, !dbg !34

while.end:                                        ; preds = %while.body
  %0 = load i8*, i8** %data, align 8, !dbg !35
  call void @printLine(i8* noundef %0), !dbg !36
  %1 = load i8*, i8** %data, align 8, !dbg !37
  call void @free(i8* noundef %1) #6, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_16_good() #0 !dbg !40 {
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
  br label %while.body, !dbg !47

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !48, metadata !DIExpression()), !dbg !51
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !52
  store i8* %call, i8** %dataBuffer, align 8, !dbg !51
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !53
  %cmp = icmp eq i8* %0, null, !dbg !55
  br i1 %cmp, label %if.then, label %if.end, !dbg !56

if.then:                                          ; preds = %while.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @exit(i32 noundef 1) #7, !dbg !59
  unreachable, !dbg !59

if.end:                                           ; preds = %while.body
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !61
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !62
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !62
  store i8 0, i8* %arrayidx, align 1, !dbg !63
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !64
  store i8* %3, i8** %data, align 8, !dbg !65
  br label %while.end, !dbg !66

while.end:                                        ; preds = %if.end
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_16.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "92d6797ab8e932d39c584f5cad5aaa4d")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_16_bad", scope: !1, file: !1, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !1, line: 31, type: !25)
!23 = distinct !DILexicalBlock(scope: !24, file: !1, line: 29, column: 9)
!24 = distinct !DILexicalBlock(scope: !14, file: !1, line: 28, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 31, column: 18, scope: !23)
!29 = !DILocation(line: 32, column: 13, scope: !23)
!30 = !DILocation(line: 33, column: 13, scope: !23)
!31 = !DILocation(line: 33, column: 31, scope: !23)
!32 = !DILocation(line: 34, column: 20, scope: !23)
!33 = !DILocation(line: 34, column: 18, scope: !23)
!34 = !DILocation(line: 36, column: 9, scope: !24)
!35 = !DILocation(line: 38, column: 15, scope: !14)
!36 = !DILocation(line: 38, column: 5, scope: !14)
!37 = !DILocation(line: 40, column: 10, scope: !14)
!38 = !DILocation(line: 40, column: 5, scope: !14)
!39 = !DILocation(line: 41, column: 1, scope: !14)
!40 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_16_good", scope: !1, file: !1, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!41 = !DILocation(line: 75, column: 5, scope: !40)
!42 = !DILocation(line: 76, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!44 = !DILocalVariable(name: "data", scope: !43, file: !1, line: 50, type: !3)
!45 = !DILocation(line: 50, column: 12, scope: !43)
!46 = !DILocation(line: 51, column: 10, scope: !43)
!47 = !DILocation(line: 52, column: 5, scope: !43)
!48 = !DILocalVariable(name: "dataBuffer", scope: !49, file: !1, line: 56, type: !3)
!49 = distinct !DILexicalBlock(scope: !50, file: !1, line: 54, column: 9)
!50 = distinct !DILexicalBlock(scope: !43, file: !1, line: 53, column: 5)
!51 = !DILocation(line: 56, column: 20, scope: !49)
!52 = !DILocation(line: 56, column: 41, scope: !49)
!53 = !DILocation(line: 57, column: 17, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !1, line: 57, column: 17)
!55 = !DILocation(line: 57, column: 28, scope: !54)
!56 = !DILocation(line: 57, column: 17, scope: !49)
!57 = !DILocation(line: 59, column: 17, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !1, line: 58, column: 13)
!59 = !DILocation(line: 60, column: 17, scope: !58)
!60 = !DILocation(line: 62, column: 20, scope: !49)
!61 = !DILocation(line: 62, column: 13, scope: !49)
!62 = !DILocation(line: 63, column: 13, scope: !49)
!63 = !DILocation(line: 63, column: 31, scope: !49)
!64 = !DILocation(line: 64, column: 20, scope: !49)
!65 = !DILocation(line: 64, column: 18, scope: !49)
!66 = !DILocation(line: 66, column: 9, scope: !50)
!67 = !DILocation(line: 68, column: 15, scope: !43)
!68 = !DILocation(line: 68, column: 5, scope: !43)
!69 = !DILocation(line: 70, column: 10, scope: !43)
!70 = !DILocation(line: 70, column: 5, scope: !43)
!71 = !DILocation(line: 71, column: 1, scope: !43)
