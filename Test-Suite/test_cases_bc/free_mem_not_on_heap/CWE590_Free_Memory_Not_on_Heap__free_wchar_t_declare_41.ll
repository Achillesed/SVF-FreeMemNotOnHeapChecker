; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_41.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_41_badSink(i32* noundef %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32*, i32** %data.addr, align 8, !dbg !22
  call void @printWLine(i32* noundef %0), !dbg !23
  %1 = load i32*, i32** %data.addr, align 8, !dbg !24
  %2 = bitcast i32* %1 to i8*, !dbg !24
  call void @free(i8* noundef %2) #5, !dbg !25
  ret void, !dbg !26
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_41_bad() #0 !dbg !27 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !30, metadata !DIExpression()), !dbg !31
  store i32* null, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !33, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !39
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 99) #5, !dbg !40
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !43
  store i32* %arraydecay1, i32** %data, align 8, !dbg !44
  %0 = load i32*, i32** %data, align 8, !dbg !45
  call void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_41_badSink(i32* noundef %0), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_41_goodG2BSink(i32* noundef %data) #0 !dbg !48 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %0 = load i32*, i32** %data.addr, align 8, !dbg !51
  call void @printWLine(i32* noundef %0), !dbg !52
  %1 = load i32*, i32** %data.addr, align 8, !dbg !53
  %2 = bitcast i32* %1 to i8*, !dbg !53
  call void @free(i8* noundef %2) #5, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_41_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !59 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !60, metadata !DIExpression()), !dbg !61
  store i32* null, i32** %data, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !63, metadata !DIExpression()), !dbg !65
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !66
  %0 = bitcast i8* %call to i32*, !dbg !67
  store i32* %0, i32** %dataBuffer, align 8, !dbg !65
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !68
  %cmp = icmp eq i32* %1, null, !dbg !70
  br i1 %cmp, label %if.then, label %if.end, !dbg !71

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @exit(i32 noundef 1) #6, !dbg !74
  unreachable, !dbg !74

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !75
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !76
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !77
  store i32 0, i32* %arrayidx, align 4, !dbg !78
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !79
  store i32* %4, i32** %data, align 8, !dbg !80
  %5 = load i32*, i32** %data, align 8, !dbg !81
  call void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_41_goodG2BSink(i32* noundef %5), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_41.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "fe0dc5eeb0fb8e0da41d4d9ec5ea3e58")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_41_badSink", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null, !3}
!19 = !{}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !1, line: 23, type: !3)
!21 = !DILocation(line: 23, column: 80, scope: !16)
!22 = !DILocation(line: 25, column: 16, scope: !16)
!23 = !DILocation(line: 25, column: 5, scope: !16)
!24 = !DILocation(line: 27, column: 10, scope: !16)
!25 = !DILocation(line: 27, column: 5, scope: !16)
!26 = !DILocation(line: 28, column: 1, scope: !16)
!27 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_41_bad", scope: !1, file: !1, line: 30, type: !28, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!28 = !DISubroutineType(types: !29)
!29 = !{null}
!30 = !DILocalVariable(name: "data", scope: !27, file: !1, line: 32, type: !3)
!31 = !DILocation(line: 32, column: 15, scope: !27)
!32 = !DILocation(line: 33, column: 10, scope: !27)
!33 = !DILocalVariable(name: "dataBuffer", scope: !34, file: !1, line: 36, type: !35)
!34 = distinct !DILexicalBlock(scope: !27, file: !1, line: 34, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 36, column: 17, scope: !34)
!39 = !DILocation(line: 37, column: 17, scope: !34)
!40 = !DILocation(line: 37, column: 9, scope: !34)
!41 = !DILocation(line: 38, column: 9, scope: !34)
!42 = !DILocation(line: 38, column: 27, scope: !34)
!43 = !DILocation(line: 39, column: 16, scope: !34)
!44 = !DILocation(line: 39, column: 14, scope: !34)
!45 = !DILocation(line: 41, column: 69, scope: !27)
!46 = !DILocation(line: 41, column: 5, scope: !27)
!47 = !DILocation(line: 42, column: 1, scope: !27)
!48 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_41_goodG2BSink", scope: !1, file: !1, line: 48, type: !17, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!49 = !DILocalVariable(name: "data", arg: 1, scope: !48, file: !1, line: 48, type: !3)
!50 = !DILocation(line: 48, column: 84, scope: !48)
!51 = !DILocation(line: 50, column: 16, scope: !48)
!52 = !DILocation(line: 50, column: 5, scope: !48)
!53 = !DILocation(line: 52, column: 10, scope: !48)
!54 = !DILocation(line: 52, column: 5, scope: !48)
!55 = !DILocation(line: 53, column: 1, scope: !48)
!56 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_41_good", scope: !1, file: !1, line: 75, type: !28, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!57 = !DILocation(line: 77, column: 5, scope: !56)
!58 = !DILocation(line: 78, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 56, type: !28, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!60 = !DILocalVariable(name: "data", scope: !59, file: !1, line: 58, type: !3)
!61 = !DILocation(line: 58, column: 15, scope: !59)
!62 = !DILocation(line: 59, column: 10, scope: !59)
!63 = !DILocalVariable(name: "dataBuffer", scope: !64, file: !1, line: 62, type: !3)
!64 = distinct !DILexicalBlock(scope: !59, file: !1, line: 60, column: 5)
!65 = !DILocation(line: 62, column: 19, scope: !64)
!66 = !DILocation(line: 62, column: 43, scope: !64)
!67 = !DILocation(line: 62, column: 32, scope: !64)
!68 = !DILocation(line: 63, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !1, line: 63, column: 13)
!70 = !DILocation(line: 63, column: 24, scope: !69)
!71 = !DILocation(line: 63, column: 13, scope: !64)
!72 = !DILocation(line: 65, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !1, line: 64, column: 9)
!74 = !DILocation(line: 66, column: 13, scope: !73)
!75 = !DILocation(line: 68, column: 17, scope: !64)
!76 = !DILocation(line: 68, column: 9, scope: !64)
!77 = !DILocation(line: 69, column: 9, scope: !64)
!78 = !DILocation(line: 69, column: 27, scope: !64)
!79 = !DILocation(line: 70, column: 16, scope: !64)
!80 = !DILocation(line: 70, column: 14, scope: !64)
!81 = !DILocation(line: 72, column: 73, scope: !59)
!82 = !DILocation(line: 72, column: 5, scope: !59)
!83 = !DILocation(line: 73, column: 1, scope: !59)
