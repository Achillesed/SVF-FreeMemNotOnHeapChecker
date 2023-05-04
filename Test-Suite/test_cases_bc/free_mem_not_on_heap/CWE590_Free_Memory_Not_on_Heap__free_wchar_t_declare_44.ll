; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_44.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_44_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !22, metadata !DIExpression()), !dbg !26
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !34
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 99) #5, !dbg !35
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay1, i32** %data, align 8, !dbg !39
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !40
  %1 = load i32*, i32** %data, align 8, !dbg !41
  call void %0(i32* noundef %1), !dbg !40
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink(i32* noundef %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load i32*, i32** %data.addr, align 8, !dbg !46
  call void @printWLine(i32* noundef %0), !dbg !47
  %1 = load i32*, i32** %data.addr, align 8, !dbg !48
  %2 = bitcast i32* %1 to i8*, !dbg !48
  call void @free(i8* noundef %2) #5, !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_44_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  ret void, !dbg !53
}

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !54 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !57, metadata !DIExpression()), !dbg !58
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !58
  store i32* null, i32** %data, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !60, metadata !DIExpression()), !dbg !62
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !63
  %0 = bitcast i8* %call to i32*, !dbg !64
  store i32* %0, i32** %dataBuffer, align 8, !dbg !62
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !65
  %cmp = icmp eq i32* %1, null, !dbg !67
  br i1 %cmp, label %if.then, label %if.end, !dbg !68

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @exit(i32 noundef 1) #6, !dbg !71
  unreachable, !dbg !71

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !72
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !73
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !74
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !76
  store i32* %4, i32** %data, align 8, !dbg !77
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !78
  %6 = load i32*, i32** %data, align 8, !dbg !79
  call void %5(i32* noundef %6), !dbg !78
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink(i32* noundef %data) #0 !dbg !81 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = load i32*, i32** %data.addr, align 8, !dbg !84
  call void @printWLine(i32* noundef %0), !dbg !85
  %1 = load i32*, i32** %data.addr, align 8, !dbg !86
  %2 = bitcast i32* %1 to i8*, !dbg !86
  call void @free(i8* noundef %2) #5, !dbg !87
  ret void, !dbg !88
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_44.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "1ca90b1887f8e362744caf1ca3999e18")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_44_bad", scope: !1, file: !1, line: 30, type: !17, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
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
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !1, line: 38, type: !30)
!29 = distinct !DILexicalBlock(scope: !16, file: !1, line: 36, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 38, column: 17, scope: !29)
!34 = !DILocation(line: 39, column: 17, scope: !29)
!35 = !DILocation(line: 39, column: 9, scope: !29)
!36 = !DILocation(line: 40, column: 9, scope: !29)
!37 = !DILocation(line: 40, column: 27, scope: !29)
!38 = !DILocation(line: 41, column: 16, scope: !29)
!39 = !DILocation(line: 41, column: 14, scope: !29)
!40 = !DILocation(line: 44, column: 5, scope: !16)
!41 = !DILocation(line: 44, column: 13, scope: !16)
!42 = !DILocation(line: 45, column: 1, scope: !16)
!43 = distinct !DISubprogram(name: "badSink", scope: !1, file: !1, line: 23, type: !24, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !1, line: 23, type: !3)
!45 = !DILocation(line: 23, column: 31, scope: !43)
!46 = !DILocation(line: 25, column: 16, scope: !43)
!47 = !DILocation(line: 25, column: 5, scope: !43)
!48 = !DILocation(line: 27, column: 10, scope: !43)
!49 = !DILocation(line: 27, column: 5, scope: !43)
!50 = !DILocation(line: 28, column: 1, scope: !43)
!51 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_44_good", scope: !1, file: !1, line: 79, type: !17, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!52 = !DILocation(line: 81, column: 5, scope: !51)
!53 = !DILocation(line: 82, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!55 = !DILocalVariable(name: "data", scope: !54, file: !1, line: 61, type: !3)
!56 = !DILocation(line: 61, column: 15, scope: !54)
!57 = !DILocalVariable(name: "funcPtr", scope: !54, file: !1, line: 62, type: !23)
!58 = !DILocation(line: 62, column: 12, scope: !54)
!59 = !DILocation(line: 63, column: 10, scope: !54)
!60 = !DILocalVariable(name: "dataBuffer", scope: !61, file: !1, line: 66, type: !3)
!61 = distinct !DILexicalBlock(scope: !54, file: !1, line: 64, column: 5)
!62 = !DILocation(line: 66, column: 19, scope: !61)
!63 = !DILocation(line: 66, column: 43, scope: !61)
!64 = !DILocation(line: 66, column: 32, scope: !61)
!65 = !DILocation(line: 67, column: 13, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !1, line: 67, column: 13)
!67 = !DILocation(line: 67, column: 24, scope: !66)
!68 = !DILocation(line: 67, column: 13, scope: !61)
!69 = !DILocation(line: 69, column: 13, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !1, line: 68, column: 9)
!71 = !DILocation(line: 70, column: 13, scope: !70)
!72 = !DILocation(line: 72, column: 17, scope: !61)
!73 = !DILocation(line: 72, column: 9, scope: !61)
!74 = !DILocation(line: 73, column: 9, scope: !61)
!75 = !DILocation(line: 73, column: 27, scope: !61)
!76 = !DILocation(line: 74, column: 16, scope: !61)
!77 = !DILocation(line: 74, column: 14, scope: !61)
!78 = !DILocation(line: 76, column: 5, scope: !54)
!79 = !DILocation(line: 76, column: 13, scope: !54)
!80 = !DILocation(line: 77, column: 1, scope: !54)
!81 = distinct !DISubprogram(name: "goodG2BSink", scope: !1, file: !1, line: 52, type: !24, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!82 = !DILocalVariable(name: "data", arg: 1, scope: !81, file: !1, line: 52, type: !3)
!83 = !DILocation(line: 52, column: 35, scope: !81)
!84 = !DILocation(line: 54, column: 16, scope: !81)
!85 = !DILocation(line: 54, column: 5, scope: !81)
!86 = !DILocation(line: 56, column: 10, scope: !81)
!87 = !DILocation(line: 56, column: 5, scope: !81)
!88 = !DILocation(line: 57, column: 1, scope: !81)
