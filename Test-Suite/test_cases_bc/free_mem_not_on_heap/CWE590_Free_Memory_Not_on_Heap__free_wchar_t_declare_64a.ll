; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_64a.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_64a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_64_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 99) #5, !dbg !30
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  store i32* %arraydecay1, i32** %data, align 8, !dbg !34
  %0 = bitcast i32** %data to i8*, !dbg !35
  call void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_64b_badSink(i8* noundef %0), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_64b_badSink(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_64_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !41 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !42, metadata !DIExpression()), !dbg !43
  store i32* null, i32** %data, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !45, metadata !DIExpression()), !dbg !47
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !48
  %0 = bitcast i8* %call to i32*, !dbg !49
  store i32* %0, i32** %dataBuffer, align 8, !dbg !47
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !50
  %cmp = icmp eq i32* %1, null, !dbg !52
  br i1 %cmp, label %if.then, label %if.end, !dbg !53

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @exit(i32 noundef 1) #6, !dbg !56
  unreachable, !dbg !56

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !57
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !58
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !59
  store i32 0, i32* %arrayidx, align 4, !dbg !60
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !61
  store i32* %4, i32** %data, align 8, !dbg !62
  %5 = bitcast i32** %data to i8*, !dbg !63
  call void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_64b_goodG2BSink(i8* noundef %5), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_64b_goodG2BSink(i8* noundef) #3

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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_64a.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "c6d684ffef26137211e7072cc43f03bf")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_64_bad", scope: !1, file: !1, line: 26, type: !17, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !1, line: 28, type: !3)
!21 = !DILocation(line: 28, column: 15, scope: !16)
!22 = !DILocation(line: 29, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !1, line: 32, type: !25)
!24 = distinct !DILexicalBlock(scope: !16, file: !1, line: 30, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 32, column: 17, scope: !24)
!29 = !DILocation(line: 33, column: 17, scope: !24)
!30 = !DILocation(line: 33, column: 9, scope: !24)
!31 = !DILocation(line: 34, column: 9, scope: !24)
!32 = !DILocation(line: 34, column: 27, scope: !24)
!33 = !DILocation(line: 35, column: 16, scope: !24)
!34 = !DILocation(line: 35, column: 14, scope: !24)
!35 = !DILocation(line: 37, column: 70, scope: !16)
!36 = !DILocation(line: 37, column: 5, scope: !16)
!37 = !DILocation(line: 38, column: 1, scope: !16)
!38 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_64_good", scope: !1, file: !1, line: 66, type: !17, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!39 = !DILocation(line: 68, column: 5, scope: !38)
!40 = !DILocation(line: 69, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 47, type: !17, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!42 = !DILocalVariable(name: "data", scope: !41, file: !1, line: 49, type: !3)
!43 = !DILocation(line: 49, column: 15, scope: !41)
!44 = !DILocation(line: 50, column: 10, scope: !41)
!45 = !DILocalVariable(name: "dataBuffer", scope: !46, file: !1, line: 53, type: !3)
!46 = distinct !DILexicalBlock(scope: !41, file: !1, line: 51, column: 5)
!47 = !DILocation(line: 53, column: 19, scope: !46)
!48 = !DILocation(line: 53, column: 43, scope: !46)
!49 = !DILocation(line: 53, column: 32, scope: !46)
!50 = !DILocation(line: 54, column: 13, scope: !51)
!51 = distinct !DILexicalBlock(scope: !46, file: !1, line: 54, column: 13)
!52 = !DILocation(line: 54, column: 24, scope: !51)
!53 = !DILocation(line: 54, column: 13, scope: !46)
!54 = !DILocation(line: 56, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !1, line: 55, column: 9)
!56 = !DILocation(line: 57, column: 13, scope: !55)
!57 = !DILocation(line: 59, column: 17, scope: !46)
!58 = !DILocation(line: 59, column: 9, scope: !46)
!59 = !DILocation(line: 60, column: 9, scope: !46)
!60 = !DILocation(line: 60, column: 27, scope: !46)
!61 = !DILocation(line: 61, column: 16, scope: !46)
!62 = !DILocation(line: 61, column: 14, scope: !46)
!63 = !DILocation(line: 63, column: 74, scope: !41)
!64 = !DILocation(line: 63, column: 5, scope: !41)
!65 = !DILocation(line: 64, column: 1, scope: !41)
