; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_31.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 99) #5, !dbg !30
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  store i32* %arraydecay1, i32** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !35, metadata !DIExpression()), !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  store i32* %0, i32** %dataCopy, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !39, metadata !DIExpression()), !dbg !40
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !41
  store i32* %1, i32** %data2, align 8, !dbg !40
  %2 = load i32*, i32** %data2, align 8, !dbg !42
  call void @printWLine(i32* noundef %2), !dbg !43
  %3 = load i32*, i32** %data2, align 8, !dbg !44
  %4 = bitcast i32* %3 to i8*, !dbg !44
  call void @free(i8* noundef %4) #5, !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_31_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !50 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !51, metadata !DIExpression()), !dbg !52
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
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !72, metadata !DIExpression()), !dbg !74
  %5 = load i32*, i32** %data, align 8, !dbg !75
  store i32* %5, i32** %dataCopy, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !76, metadata !DIExpression()), !dbg !77
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !78
  store i32* %6, i32** %data2, align 8, !dbg !77
  %7 = load i32*, i32** %data2, align 8, !dbg !79
  call void @printWLine(i32* noundef %7), !dbg !80
  %8 = load i32*, i32** %data2, align 8, !dbg !81
  %9 = bitcast i32* %8 to i8*, !dbg !81
  call void @free(i8* noundef %9) #5, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_31.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "fe448c3b1376253d6dc1b0009e4efeeb")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_31_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 25, type: !3)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !1, line: 29, type: !25)
!24 = distinct !DILexicalBlock(scope: !16, file: !1, line: 27, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 29, column: 17, scope: !24)
!29 = !DILocation(line: 30, column: 17, scope: !24)
!30 = !DILocation(line: 30, column: 9, scope: !24)
!31 = !DILocation(line: 31, column: 9, scope: !24)
!32 = !DILocation(line: 31, column: 27, scope: !24)
!33 = !DILocation(line: 32, column: 16, scope: !24)
!34 = !DILocation(line: 32, column: 14, scope: !24)
!35 = !DILocalVariable(name: "dataCopy", scope: !36, file: !1, line: 35, type: !3)
!36 = distinct !DILexicalBlock(scope: !16, file: !1, line: 34, column: 5)
!37 = !DILocation(line: 35, column: 19, scope: !36)
!38 = !DILocation(line: 35, column: 30, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !1, line: 36, type: !3)
!40 = !DILocation(line: 36, column: 19, scope: !36)
!41 = !DILocation(line: 36, column: 26, scope: !36)
!42 = !DILocation(line: 37, column: 20, scope: !36)
!43 = !DILocation(line: 37, column: 9, scope: !36)
!44 = !DILocation(line: 39, column: 14, scope: !36)
!45 = !DILocation(line: 39, column: 9, scope: !36)
!46 = !DILocation(line: 41, column: 1, scope: !16)
!47 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_31_good", scope: !1, file: !1, line: 73, type: !17, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!48 = !DILocation(line: 75, column: 5, scope: !47)
!49 = !DILocation(line: 76, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!51 = !DILocalVariable(name: "data", scope: !50, file: !1, line: 50, type: !3)
!52 = !DILocation(line: 50, column: 15, scope: !50)
!53 = !DILocation(line: 51, column: 10, scope: !50)
!54 = !DILocalVariable(name: "dataBuffer", scope: !55, file: !1, line: 54, type: !3)
!55 = distinct !DILexicalBlock(scope: !50, file: !1, line: 52, column: 5)
!56 = !DILocation(line: 54, column: 19, scope: !55)
!57 = !DILocation(line: 54, column: 43, scope: !55)
!58 = !DILocation(line: 54, column: 32, scope: !55)
!59 = !DILocation(line: 55, column: 13, scope: !60)
!60 = distinct !DILexicalBlock(scope: !55, file: !1, line: 55, column: 13)
!61 = !DILocation(line: 55, column: 24, scope: !60)
!62 = !DILocation(line: 55, column: 13, scope: !55)
!63 = !DILocation(line: 57, column: 13, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !1, line: 56, column: 9)
!65 = !DILocation(line: 58, column: 13, scope: !64)
!66 = !DILocation(line: 60, column: 17, scope: !55)
!67 = !DILocation(line: 60, column: 9, scope: !55)
!68 = !DILocation(line: 61, column: 9, scope: !55)
!69 = !DILocation(line: 61, column: 27, scope: !55)
!70 = !DILocation(line: 62, column: 16, scope: !55)
!71 = !DILocation(line: 62, column: 14, scope: !55)
!72 = !DILocalVariable(name: "dataCopy", scope: !73, file: !1, line: 65, type: !3)
!73 = distinct !DILexicalBlock(scope: !50, file: !1, line: 64, column: 5)
!74 = !DILocation(line: 65, column: 19, scope: !73)
!75 = !DILocation(line: 65, column: 30, scope: !73)
!76 = !DILocalVariable(name: "data", scope: !73, file: !1, line: 66, type: !3)
!77 = !DILocation(line: 66, column: 19, scope: !73)
!78 = !DILocation(line: 66, column: 26, scope: !73)
!79 = !DILocation(line: 67, column: 20, scope: !73)
!80 = !DILocation(line: 67, column: 9, scope: !73)
!81 = !DILocation(line: 69, column: 14, scope: !73)
!82 = !DILocation(line: 69, column: 9, scope: !73)
!83 = !DILocation(line: 71, column: 1, scope: !50)
