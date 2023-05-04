; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_17.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_17_bad() #0 !dbg !16 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* null, i32** %data, align 8, !dbg !24
  store i32 0, i32* %i, align 4, !dbg !25
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !28
  %cmp = icmp slt i32 %0, 1, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !32, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !39
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 99) #5, !dbg !40
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !43
  store i32* %arraydecay1, i32** %data, align 8, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !46
  %inc = add nsw i32 %1, 1, !dbg !46
  store i32 %inc, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* noundef %2), !dbg !52
  %3 = load i32*, i32** %data, align 8, !dbg !53
  %4 = bitcast i32* %3 to i8*, !dbg !53
  call void @free(i8* noundef %4) #5, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_17_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !59 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i32** %data, metadata !62, metadata !DIExpression()), !dbg !63
  store i32* null, i32** %data, align 8, !dbg !64
  store i32 0, i32* %h, align 4, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !68
  %cmp = icmp slt i32 %0, 1, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !72, metadata !DIExpression()), !dbg !75
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !76
  %1 = bitcast i8* %call to i32*, !dbg !77
  store i32* %1, i32** %dataBuffer, align 8, !dbg !75
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !78
  %cmp1 = icmp eq i32* %2, null, !dbg !80
  br i1 %cmp1, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %for.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @exit(i32 noundef 1) #6, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %for.body
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99) #5, !dbg !86
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !89
  store i32* %5, i32** %data, align 8, !dbg !90
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %if.end
  %6 = load i32, i32* %h, align 4, !dbg !92
  %inc = add nsw i32 %6, 1, !dbg !92
  store i32 %inc, i32* %h, align 4, !dbg !92
  br label %for.cond, !dbg !93, !llvm.loop !94

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !96
  call void @printWLine(i32* noundef %7), !dbg !97
  %8 = load i32*, i32** %data, align 8, !dbg !98
  %9 = bitcast i32* %8 to i8*, !dbg !98
  call void @free(i8* noundef %9) #5, !dbg !99
  ret void, !dbg !100
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_17.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "7df947c9a28bf93a3307d5ed2943f096")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_17_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "i", scope: !16, file: !1, line: 25, type: !6)
!21 = !DILocation(line: 25, column: 9, scope: !16)
!22 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 26, type: !3)
!23 = !DILocation(line: 26, column: 15, scope: !16)
!24 = !DILocation(line: 27, column: 10, scope: !16)
!25 = !DILocation(line: 28, column: 11, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !1, line: 28, column: 5)
!27 = !DILocation(line: 28, column: 9, scope: !26)
!28 = !DILocation(line: 28, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !1, line: 28, column: 5)
!30 = !DILocation(line: 28, column: 18, scope: !29)
!31 = !DILocation(line: 28, column: 5, scope: !26)
!32 = !DILocalVariable(name: "dataBuffer", scope: !33, file: !1, line: 32, type: !35)
!33 = distinct !DILexicalBlock(scope: !34, file: !1, line: 30, column: 9)
!34 = distinct !DILexicalBlock(scope: !29, file: !1, line: 29, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 32, column: 21, scope: !33)
!39 = !DILocation(line: 33, column: 21, scope: !33)
!40 = !DILocation(line: 33, column: 13, scope: !33)
!41 = !DILocation(line: 34, column: 13, scope: !33)
!42 = !DILocation(line: 34, column: 31, scope: !33)
!43 = !DILocation(line: 35, column: 20, scope: !33)
!44 = !DILocation(line: 35, column: 18, scope: !33)
!45 = !DILocation(line: 37, column: 5, scope: !34)
!46 = !DILocation(line: 28, column: 24, scope: !29)
!47 = !DILocation(line: 28, column: 5, scope: !29)
!48 = distinct !{!48, !31, !49, !50}
!49 = !DILocation(line: 37, column: 5, scope: !26)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocation(line: 38, column: 16, scope: !16)
!52 = !DILocation(line: 38, column: 5, scope: !16)
!53 = !DILocation(line: 40, column: 10, scope: !16)
!54 = !DILocation(line: 40, column: 5, scope: !16)
!55 = !DILocation(line: 41, column: 1, scope: !16)
!56 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_17_good", scope: !1, file: !1, line: 73, type: !17, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!57 = !DILocation(line: 75, column: 5, scope: !56)
!58 = !DILocation(line: 76, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!60 = !DILocalVariable(name: "h", scope: !59, file: !1, line: 50, type: !6)
!61 = !DILocation(line: 50, column: 9, scope: !59)
!62 = !DILocalVariable(name: "data", scope: !59, file: !1, line: 51, type: !3)
!63 = !DILocation(line: 51, column: 15, scope: !59)
!64 = !DILocation(line: 52, column: 10, scope: !59)
!65 = !DILocation(line: 53, column: 11, scope: !66)
!66 = distinct !DILexicalBlock(scope: !59, file: !1, line: 53, column: 5)
!67 = !DILocation(line: 53, column: 9, scope: !66)
!68 = !DILocation(line: 53, column: 16, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !1, line: 53, column: 5)
!70 = !DILocation(line: 53, column: 18, scope: !69)
!71 = !DILocation(line: 53, column: 5, scope: !66)
!72 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !1, line: 57, type: !3)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 55, column: 9)
!74 = distinct !DILexicalBlock(scope: !69, file: !1, line: 54, column: 5)
!75 = !DILocation(line: 57, column: 23, scope: !73)
!76 = !DILocation(line: 57, column: 47, scope: !73)
!77 = !DILocation(line: 57, column: 36, scope: !73)
!78 = !DILocation(line: 58, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !73, file: !1, line: 58, column: 17)
!80 = !DILocation(line: 58, column: 28, scope: !79)
!81 = !DILocation(line: 58, column: 17, scope: !73)
!82 = !DILocation(line: 60, column: 17, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !1, line: 59, column: 13)
!84 = !DILocation(line: 61, column: 17, scope: !83)
!85 = !DILocation(line: 63, column: 21, scope: !73)
!86 = !DILocation(line: 63, column: 13, scope: !73)
!87 = !DILocation(line: 64, column: 13, scope: !73)
!88 = !DILocation(line: 64, column: 31, scope: !73)
!89 = !DILocation(line: 65, column: 20, scope: !73)
!90 = !DILocation(line: 65, column: 18, scope: !73)
!91 = !DILocation(line: 67, column: 5, scope: !74)
!92 = !DILocation(line: 53, column: 24, scope: !69)
!93 = !DILocation(line: 53, column: 5, scope: !69)
!94 = distinct !{!94, !71, !95, !50}
!95 = !DILocation(line: 67, column: 5, scope: !66)
!96 = !DILocation(line: 68, column: 16, scope: !59)
!97 = !DILocation(line: 68, column: 5, scope: !59)
!98 = !DILocation(line: 70, column: 10, scope: !59)
!99 = !DILocation(line: 70, column: 5, scope: !59)
!100 = !DILocation(line: 71, column: 1, scope: !59)
