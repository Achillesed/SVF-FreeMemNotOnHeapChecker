; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_66a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_66_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !22, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 400, align 16, !dbg !31
  %1 = bitcast i8* %0 to i32*, !dbg !32
  store i32* %1, i32** %dataBuffer, align 8, !dbg !30
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  %call = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !34
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !37
  store i32* %4, i32** %data, align 8, !dbg !38
  %5 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx1 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !40
  store i32* %5, i32** %arrayidx1, align 16, !dbg !41
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !42
  call void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_66b_badSink(i32** noundef %arraydecay), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_66b_badSink(i32** noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_66_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !48 {
entry:
  %data = alloca i32*, align 8
  %dataArray = alloca [5 x i32*], align 16
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [5 x i32*]* %dataArray, metadata !51, metadata !DIExpression()), !dbg !52
  store i32* null, i32** %data, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !54, metadata !DIExpression()), !dbg !56
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !57
  %0 = bitcast i8* %call to i32*, !dbg !58
  store i32* %0, i32** %dataBuffer, align 8, !dbg !56
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !59
  %cmp = icmp eq i32* %1, null, !dbg !61
  br i1 %cmp, label %if.then, label %if.end, !dbg !62

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @exit(i32 noundef 1) #6, !dbg !65
  unreachable, !dbg !65

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !66
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !67
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !68
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !68
  store i32 0, i32* %arrayidx, align 4, !dbg !69
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !70
  store i32* %4, i32** %data, align 8, !dbg !71
  %5 = load i32*, i32** %data, align 8, !dbg !72
  %arrayidx2 = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 2, !dbg !73
  store i32* %5, i32** %arrayidx2, align 16, !dbg !74
  %arraydecay = getelementptr inbounds [5 x i32*], [5 x i32*]* %dataArray, i64 0, i64 0, !dbg !75
  call void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_66b_goodG2BSink(i32** noundef %arraydecay), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_66b_goodG2BSink(i32** noundef) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_66a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "058509fcb3b709b5e35e069d01ad7b8d")
!2 = !{!3, !7}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 74, baseType: !6)
!5 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 5}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{i32 7, !"PIE Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_66_bad", scope: !1, file: !1, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 28, type: !3)
!21 = !DILocation(line: 28, column: 15, scope: !16)
!22 = !DILocalVariable(name: "dataArray", scope: !16, file: !1, line: 29, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !3, size: 320, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 5)
!26 = !DILocation(line: 29, column: 15, scope: !16)
!27 = !DILocation(line: 30, column: 10, scope: !16)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !1, line: 33, type: !3)
!29 = distinct !DILexicalBlock(scope: !16, file: !1, line: 31, column: 5)
!30 = !DILocation(line: 33, column: 19, scope: !29)
!31 = !DILocation(line: 33, column: 43, scope: !29)
!32 = !DILocation(line: 33, column: 32, scope: !29)
!33 = !DILocation(line: 34, column: 17, scope: !29)
!34 = !DILocation(line: 34, column: 9, scope: !29)
!35 = !DILocation(line: 35, column: 9, scope: !29)
!36 = !DILocation(line: 35, column: 27, scope: !29)
!37 = !DILocation(line: 36, column: 16, scope: !29)
!38 = !DILocation(line: 36, column: 14, scope: !29)
!39 = !DILocation(line: 39, column: 20, scope: !16)
!40 = !DILocation(line: 39, column: 5, scope: !16)
!41 = !DILocation(line: 39, column: 18, scope: !16)
!42 = !DILocation(line: 40, column: 69, scope: !16)
!43 = !DILocation(line: 40, column: 5, scope: !16)
!44 = !DILocation(line: 41, column: 1, scope: !16)
!45 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_66_good", scope: !1, file: !1, line: 71, type: !17, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!46 = !DILocation(line: 73, column: 5, scope: !45)
!47 = !DILocation(line: 74, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 50, type: !17, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!49 = !DILocalVariable(name: "data", scope: !48, file: !1, line: 52, type: !3)
!50 = !DILocation(line: 52, column: 15, scope: !48)
!51 = !DILocalVariable(name: "dataArray", scope: !48, file: !1, line: 53, type: !23)
!52 = !DILocation(line: 53, column: 15, scope: !48)
!53 = !DILocation(line: 54, column: 10, scope: !48)
!54 = !DILocalVariable(name: "dataBuffer", scope: !55, file: !1, line: 57, type: !3)
!55 = distinct !DILexicalBlock(scope: !48, file: !1, line: 55, column: 5)
!56 = !DILocation(line: 57, column: 19, scope: !55)
!57 = !DILocation(line: 57, column: 43, scope: !55)
!58 = !DILocation(line: 57, column: 32, scope: !55)
!59 = !DILocation(line: 58, column: 13, scope: !60)
!60 = distinct !DILexicalBlock(scope: !55, file: !1, line: 58, column: 13)
!61 = !DILocation(line: 58, column: 24, scope: !60)
!62 = !DILocation(line: 58, column: 13, scope: !55)
!63 = !DILocation(line: 60, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !1, line: 59, column: 9)
!65 = !DILocation(line: 61, column: 13, scope: !64)
!66 = !DILocation(line: 63, column: 17, scope: !55)
!67 = !DILocation(line: 63, column: 9, scope: !55)
!68 = !DILocation(line: 64, column: 9, scope: !55)
!69 = !DILocation(line: 64, column: 27, scope: !55)
!70 = !DILocation(line: 65, column: 16, scope: !55)
!71 = !DILocation(line: 65, column: 14, scope: !55)
!72 = !DILocation(line: 67, column: 20, scope: !48)
!73 = !DILocation(line: 67, column: 5, scope: !48)
!74 = !DILocation(line: 67, column: 18, scope: !48)
!75 = !DILocation(line: 68, column: 73, scope: !48)
!76 = !DILocation(line: 68, column: 5, scope: !48)
!77 = !DILocation(line: 69, column: 1, scope: !48)
