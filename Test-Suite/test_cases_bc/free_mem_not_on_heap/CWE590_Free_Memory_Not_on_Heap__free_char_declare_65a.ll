; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_declare_65a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_declare_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_65_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @CWE590_Free_Memory_Not_on_Heap__free_char_declare_65b_badSink, void (i8*)** %funcPtr, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !32
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !35
  store i8* %arraydecay1, i8** %data, align 8, !dbg !36
  %0 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !37
  %1 = load i8*, i8** %data, align 8, !dbg !38
  call void %0(i8* noundef %1), !dbg !37
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_65b_badSink(i8* noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_65_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !43 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !46, metadata !DIExpression()), !dbg !47
  store void (i8*)* @CWE590_Free_Memory_Not_on_Heap__free_char_declare_65b_goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !47
  store i8* null, i8** %data, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !49, metadata !DIExpression()), !dbg !51
  %call = call noalias i8* @malloc(i64 noundef 100) #6, !dbg !52
  store i8* %call, i8** %dataBuffer, align 8, !dbg !51
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !53
  %cmp = icmp eq i8* %0, null, !dbg !55
  br i1 %cmp, label %if.then, label %if.end, !dbg !56

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @exit(i32 noundef 1) #7, !dbg !59
  unreachable, !dbg !59

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !61
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !62
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !62
  store i8 0, i8* %arrayidx, align 1, !dbg !63
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !64
  store i8* %3, i8** %data, align 8, !dbg !65
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !66
  %5 = load i8*, i8** %data, align 8, !dbg !67
  call void %4(i8* noundef %5), !dbg !66
  ret void, !dbg !68
}

declare void @CWE590_Free_Memory_Not_on_Heap__free_char_declare_65b_goodG2BSink(i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_65a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "2c43e862e6fcb70086d8e3fed35fb597")
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
!14 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_65_bad", scope: !1, file: !1, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !14, file: !1, line: 28, type: !3)
!19 = !DILocation(line: 28, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !1, line: 30, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !3}
!24 = !DILocation(line: 30, column: 12, scope: !14)
!25 = !DILocation(line: 31, column: 10, scope: !14)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !1, line: 34, type: !28)
!27 = distinct !DILexicalBlock(scope: !14, file: !1, line: 32, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 34, column: 14, scope: !27)
!32 = !DILocation(line: 35, column: 9, scope: !27)
!33 = !DILocation(line: 36, column: 9, scope: !27)
!34 = !DILocation(line: 36, column: 27, scope: !27)
!35 = !DILocation(line: 37, column: 16, scope: !27)
!36 = !DILocation(line: 37, column: 14, scope: !27)
!37 = !DILocation(line: 40, column: 5, scope: !14)
!38 = !DILocation(line: 40, column: 13, scope: !14)
!39 = !DILocation(line: 41, column: 1, scope: !14)
!40 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_declare_65_good", scope: !1, file: !1, line: 70, type: !15, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!41 = !DILocation(line: 72, column: 5, scope: !40)
!42 = !DILocation(line: 73, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 50, type: !15, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!44 = !DILocalVariable(name: "data", scope: !43, file: !1, line: 52, type: !3)
!45 = !DILocation(line: 52, column: 12, scope: !43)
!46 = !DILocalVariable(name: "funcPtr", scope: !43, file: !1, line: 53, type: !21)
!47 = !DILocation(line: 53, column: 12, scope: !43)
!48 = !DILocation(line: 54, column: 10, scope: !43)
!49 = !DILocalVariable(name: "dataBuffer", scope: !50, file: !1, line: 57, type: !3)
!50 = distinct !DILexicalBlock(scope: !43, file: !1, line: 55, column: 5)
!51 = !DILocation(line: 57, column: 16, scope: !50)
!52 = !DILocation(line: 57, column: 37, scope: !50)
!53 = !DILocation(line: 58, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !1, line: 58, column: 13)
!55 = !DILocation(line: 58, column: 24, scope: !54)
!56 = !DILocation(line: 58, column: 13, scope: !50)
!57 = !DILocation(line: 60, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !1, line: 59, column: 9)
!59 = !DILocation(line: 61, column: 13, scope: !58)
!60 = !DILocation(line: 63, column: 16, scope: !50)
!61 = !DILocation(line: 63, column: 9, scope: !50)
!62 = !DILocation(line: 64, column: 9, scope: !50)
!63 = !DILocation(line: 64, column: 27, scope: !50)
!64 = !DILocation(line: 65, column: 16, scope: !50)
!65 = !DILocation(line: 65, column: 14, scope: !50)
!66 = !DILocation(line: 67, column: 5, scope: !43)
!67 = !DILocation(line: 67, column: 13, scope: !43)
!68 = !DILocation(line: 68, column: 1, scope: !43)
