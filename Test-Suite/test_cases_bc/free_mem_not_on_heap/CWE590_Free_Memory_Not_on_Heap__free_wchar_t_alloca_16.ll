; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_16.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_16_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  br label %while.body, !dbg !23

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %call = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !31
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  store i32* %4, i32** %data, align 8, !dbg !35
  br label %while.end, !dbg !36

while.end:                                        ; preds = %while.body
  %5 = load i32*, i32** %data, align 8, !dbg !37
  call void @printWLine(i32* noundef %5), !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !39
  %7 = bitcast i32* %6 to i8*, !dbg !39
  call void @free(i8* noundef %7) #5, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_16_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !45 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !46, metadata !DIExpression()), !dbg !47
  store i32* null, i32** %data, align 8, !dbg !48
  br label %while.body, !dbg !49

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !50, metadata !DIExpression()), !dbg !53
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !54
  %0 = bitcast i8* %call to i32*, !dbg !55
  store i32* %0, i32** %dataBuffer, align 8, !dbg !53
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !56
  %cmp = icmp eq i32* %1, null, !dbg !58
  br i1 %cmp, label %if.then, label %if.end, !dbg !59

if.then:                                          ; preds = %while.body
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @exit(i32 noundef 1) #6, !dbg !62
  unreachable, !dbg !62

if.end:                                           ; preds = %while.body
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !63
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !64
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !65
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !65
  store i32 0, i32* %arrayidx, align 4, !dbg !66
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !67
  store i32* %4, i32** %data, align 8, !dbg !68
  br label %while.end, !dbg !69

while.end:                                        ; preds = %if.end
  %5 = load i32*, i32** %data, align 8, !dbg !70
  call void @printWLine(i32* noundef %5), !dbg !71
  %6 = load i32*, i32** %data, align 8, !dbg !72
  %7 = bitcast i32* %6 to i8*, !dbg !72
  call void @free(i8* noundef %7) #5, !dbg !73
  ret void, !dbg !74
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_16.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "55b504e585ed50b55f64ec16bdf291eb")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_16_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 25, type: !3)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 5, scope: !16)
!24 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !1, line: 31, type: !3)
!25 = distinct !DILexicalBlock(scope: !26, file: !1, line: 29, column: 9)
!26 = distinct !DILexicalBlock(scope: !16, file: !1, line: 28, column: 5)
!27 = !DILocation(line: 31, column: 23, scope: !25)
!28 = !DILocation(line: 31, column: 47, scope: !25)
!29 = !DILocation(line: 31, column: 36, scope: !25)
!30 = !DILocation(line: 32, column: 21, scope: !25)
!31 = !DILocation(line: 32, column: 13, scope: !25)
!32 = !DILocation(line: 33, column: 13, scope: !25)
!33 = !DILocation(line: 33, column: 31, scope: !25)
!34 = !DILocation(line: 34, column: 20, scope: !25)
!35 = !DILocation(line: 34, column: 18, scope: !25)
!36 = !DILocation(line: 36, column: 9, scope: !26)
!37 = !DILocation(line: 38, column: 16, scope: !16)
!38 = !DILocation(line: 38, column: 5, scope: !16)
!39 = !DILocation(line: 40, column: 10, scope: !16)
!40 = !DILocation(line: 40, column: 5, scope: !16)
!41 = !DILocation(line: 41, column: 1, scope: !16)
!42 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_alloca_16_good", scope: !1, file: !1, line: 73, type: !17, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!43 = !DILocation(line: 75, column: 5, scope: !42)
!44 = !DILocation(line: 76, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!46 = !DILocalVariable(name: "data", scope: !45, file: !1, line: 50, type: !3)
!47 = !DILocation(line: 50, column: 15, scope: !45)
!48 = !DILocation(line: 51, column: 10, scope: !45)
!49 = !DILocation(line: 52, column: 5, scope: !45)
!50 = !DILocalVariable(name: "dataBuffer", scope: !51, file: !1, line: 56, type: !3)
!51 = distinct !DILexicalBlock(scope: !52, file: !1, line: 54, column: 9)
!52 = distinct !DILexicalBlock(scope: !45, file: !1, line: 53, column: 5)
!53 = !DILocation(line: 56, column: 23, scope: !51)
!54 = !DILocation(line: 56, column: 47, scope: !51)
!55 = !DILocation(line: 56, column: 36, scope: !51)
!56 = !DILocation(line: 57, column: 17, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !1, line: 57, column: 17)
!58 = !DILocation(line: 57, column: 28, scope: !57)
!59 = !DILocation(line: 57, column: 17, scope: !51)
!60 = !DILocation(line: 59, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !1, line: 58, column: 13)
!62 = !DILocation(line: 60, column: 17, scope: !61)
!63 = !DILocation(line: 62, column: 21, scope: !51)
!64 = !DILocation(line: 62, column: 13, scope: !51)
!65 = !DILocation(line: 63, column: 13, scope: !51)
!66 = !DILocation(line: 63, column: 31, scope: !51)
!67 = !DILocation(line: 64, column: 20, scope: !51)
!68 = !DILocation(line: 64, column: 18, scope: !51)
!69 = !DILocation(line: 66, column: 9, scope: !52)
!70 = !DILocation(line: 68, column: 16, scope: !45)
!71 = !DILocation(line: 68, column: 5, scope: !45)
!72 = !DILocation(line: 70, column: 10, scope: !45)
!73 = !DILocation(line: 70, column: 5, scope: !45)
!74 = !DILocation(line: 71, column: 1, scope: !45)
