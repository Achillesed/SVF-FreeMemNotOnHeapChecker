; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_44.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_44_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !22, metadata !DIExpression()), !dbg !26
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !26
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
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  call void %5(i32* noundef %6), !dbg !39
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink(i32* noundef %data) #0 !dbg !42 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !43, metadata !DIExpression()), !dbg !44
  %0 = load i32*, i32** %data.addr, align 8, !dbg !45
  call void @printWLine(i32* noundef %0), !dbg !46
  %1 = load i32*, i32** %data.addr, align 8, !dbg !47
  %2 = bitcast i32* %1 to i8*, !dbg !47
  call void @free(i8* noundef %2) #5, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_44_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !53 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !56, metadata !DIExpression()), !dbg !57
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !57
  store i32* null, i32** %data, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !59, metadata !DIExpression()), !dbg !61
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !62
  %0 = bitcast i8* %call to i32*, !dbg !63
  store i32* %0, i32** %dataBuffer, align 8, !dbg !61
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !64
  %cmp = icmp eq i32* %1, null, !dbg !66
  br i1 %cmp, label %if.then, label %if.end, !dbg !67

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @exit(i32 noundef 1) #6, !dbg !70
  unreachable, !dbg !70

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !71
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !72
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !73
  store i32 0, i32* %arrayidx, align 4, !dbg !74
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !75
  store i32* %4, i32** %data, align 8, !dbg !76
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !77
  %6 = load i32*, i32** %data, align 8, !dbg !78
  call void %5(i32* noundef %6), !dbg !77
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink(i32* noundef %data) #0 !dbg !80 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = load i32*, i32** %data.addr, align 8, !dbg !83
  call void @printWLine(i32* noundef %0), !dbg !84
  %1 = load i32*, i32** %data.addr, align 8, !dbg !85
  %2 = bitcast i32* %1 to i8*, !dbg !85
  call void @free(i8* noundef %2) #5, !dbg !86
  ret void, !dbg !87
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_44.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "5578194f866dabc21c820c753ca9d7ea")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_44_bad", scope: !1, file: !1, line: 30, type: !17, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 32, type: !3)
!21 = !DILocation(line: 32, column: 15, scope: !16)
!22 = !DILocalVariable(name: "funcPtr", scope: !16, file: !1, line: 34, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !3}
!26 = !DILocation(line: 34, column: 12, scope: !16)
!27 = !DILocation(line: 35, column: 10, scope: !16)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !1, line: 38, type: !3)
!29 = distinct !DILexicalBlock(scope: !16, file: !1, line: 36, column: 5)
!30 = !DILocation(line: 38, column: 19, scope: !29)
!31 = !DILocation(line: 38, column: 43, scope: !29)
!32 = !DILocation(line: 38, column: 32, scope: !29)
!33 = !DILocation(line: 39, column: 17, scope: !29)
!34 = !DILocation(line: 39, column: 9, scope: !29)
!35 = !DILocation(line: 40, column: 9, scope: !29)
!36 = !DILocation(line: 40, column: 27, scope: !29)
!37 = !DILocation(line: 41, column: 16, scope: !29)
!38 = !DILocation(line: 41, column: 14, scope: !29)
!39 = !DILocation(line: 44, column: 5, scope: !16)
!40 = !DILocation(line: 44, column: 13, scope: !16)
!41 = !DILocation(line: 45, column: 1, scope: !16)
!42 = distinct !DISubprogram(name: "badSink", scope: !1, file: !1, line: 23, type: !24, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!43 = !DILocalVariable(name: "data", arg: 1, scope: !42, file: !1, line: 23, type: !3)
!44 = !DILocation(line: 23, column: 31, scope: !42)
!45 = !DILocation(line: 25, column: 16, scope: !42)
!46 = !DILocation(line: 25, column: 5, scope: !42)
!47 = !DILocation(line: 27, column: 10, scope: !42)
!48 = !DILocation(line: 27, column: 5, scope: !42)
!49 = !DILocation(line: 28, column: 1, scope: !42)
!50 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_44_good", scope: !1, file: !1, line: 79, type: !17, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!51 = !DILocation(line: 81, column: 5, scope: !50)
!52 = !DILocation(line: 82, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!54 = !DILocalVariable(name: "data", scope: !53, file: !1, line: 61, type: !3)
!55 = !DILocation(line: 61, column: 15, scope: !53)
!56 = !DILocalVariable(name: "funcPtr", scope: !53, file: !1, line: 62, type: !23)
!57 = !DILocation(line: 62, column: 12, scope: !53)
!58 = !DILocation(line: 63, column: 10, scope: !53)
!59 = !DILocalVariable(name: "dataBuffer", scope: !60, file: !1, line: 66, type: !3)
!60 = distinct !DILexicalBlock(scope: !53, file: !1, line: 64, column: 5)
!61 = !DILocation(line: 66, column: 19, scope: !60)
!62 = !DILocation(line: 66, column: 43, scope: !60)
!63 = !DILocation(line: 66, column: 32, scope: !60)
!64 = !DILocation(line: 67, column: 13, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !1, line: 67, column: 13)
!66 = !DILocation(line: 67, column: 24, scope: !65)
!67 = !DILocation(line: 67, column: 13, scope: !60)
!68 = !DILocation(line: 69, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !1, line: 68, column: 9)
!70 = !DILocation(line: 70, column: 13, scope: !69)
!71 = !DILocation(line: 72, column: 17, scope: !60)
!72 = !DILocation(line: 72, column: 9, scope: !60)
!73 = !DILocation(line: 73, column: 9, scope: !60)
!74 = !DILocation(line: 73, column: 27, scope: !60)
!75 = !DILocation(line: 74, column: 16, scope: !60)
!76 = !DILocation(line: 74, column: 14, scope: !60)
!77 = !DILocation(line: 76, column: 5, scope: !53)
!78 = !DILocation(line: 76, column: 13, scope: !53)
!79 = !DILocation(line: 77, column: 1, scope: !53)
!80 = distinct !DISubprogram(name: "goodG2BSink", scope: !1, file: !1, line: 52, type: !24, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!81 = !DILocalVariable(name: "data", arg: 1, scope: !80, file: !1, line: 52, type: !3)
!82 = !DILocation(line: 52, column: 35, scope: !80)
!83 = !DILocation(line: 54, column: 16, scope: !80)
!84 = !DILocation(line: 54, column: 5, scope: !80)
!85 = !DILocation(line: 56, column: 10, scope: !80)
!86 = !DILocation(line: 56, column: 5, scope: !80)
!87 = !DILocation(line: 57, column: 1, scope: !80)
