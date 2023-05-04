; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_01.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_01_bad() #0 !dbg !16 {
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
  %0 = load i32*, i32** %data, align 8, !dbg !35
  call void @printWLine(i32* noundef %0), !dbg !36
  %1 = load i32*, i32** %data, align 8, !dbg !37
  %2 = bitcast i32* %1 to i8*, !dbg !37
  call void @free(i8* noundef %2) #5, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_01_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !43 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !44, metadata !DIExpression()), !dbg !45
  store i32* null, i32** %data, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !47, metadata !DIExpression()), !dbg !49
  %call = call noalias i8* @malloc(i64 noundef 400) #5, !dbg !50
  %0 = bitcast i8* %call to i32*, !dbg !51
  store i32* %0, i32** %dataBuffer, align 8, !dbg !49
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !52
  %cmp = icmp eq i32* %1, null, !dbg !54
  br i1 %cmp, label %if.then, label %if.end, !dbg !55

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @exit(i32 noundef 1) #6, !dbg !58
  unreachable, !dbg !58

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !59
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99) #5, !dbg !60
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !61
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !61
  store i32 0, i32* %arrayidx, align 4, !dbg !62
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !63
  store i32* %4, i32** %data, align 8, !dbg !64
  %5 = load i32*, i32** %data, align 8, !dbg !65
  call void @printWLine(i32* noundef %5), !dbg !66
  %6 = load i32*, i32** %data, align 8, !dbg !67
  %7 = bitcast i32* %6 to i8*, !dbg !67
  call void @free(i8* noundef %7) #5, !dbg !68
  ret void, !dbg !69
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
!1 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_01.c", directory: "/home/ymy/20230326/CWE590_Free_Memory_Not_on_Heap/Juliet/c", checksumkind: CSK_MD5, checksum: "dc9850eb0ef46896227463587c156d69")
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
!16 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_01_bad", scope: !1, file: !1, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
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
!35 = !DILocation(line: 34, column: 16, scope: !16)
!36 = !DILocation(line: 34, column: 5, scope: !16)
!37 = !DILocation(line: 36, column: 10, scope: !16)
!38 = !DILocation(line: 36, column: 5, scope: !16)
!39 = !DILocation(line: 37, column: 1, scope: !16)
!40 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_wchar_t_declare_01_good", scope: !1, file: !1, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!41 = !DILocation(line: 67, column: 5, scope: !40)
!42 = !DILocation(line: 68, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "goodG2B", scope: !1, file: !1, line: 44, type: !17, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!44 = !DILocalVariable(name: "data", scope: !43, file: !1, line: 46, type: !3)
!45 = !DILocation(line: 46, column: 15, scope: !43)
!46 = !DILocation(line: 47, column: 10, scope: !43)
!47 = !DILocalVariable(name: "dataBuffer", scope: !48, file: !1, line: 50, type: !3)
!48 = distinct !DILexicalBlock(scope: !43, file: !1, line: 48, column: 5)
!49 = !DILocation(line: 50, column: 19, scope: !48)
!50 = !DILocation(line: 50, column: 43, scope: !48)
!51 = !DILocation(line: 50, column: 32, scope: !48)
!52 = !DILocation(line: 51, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !48, file: !1, line: 51, column: 13)
!54 = !DILocation(line: 51, column: 24, scope: !53)
!55 = !DILocation(line: 51, column: 13, scope: !48)
!56 = !DILocation(line: 53, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !1, line: 52, column: 9)
!58 = !DILocation(line: 54, column: 13, scope: !57)
!59 = !DILocation(line: 56, column: 17, scope: !48)
!60 = !DILocation(line: 56, column: 9, scope: !48)
!61 = !DILocation(line: 57, column: 9, scope: !48)
!62 = !DILocation(line: 57, column: 27, scope: !48)
!63 = !DILocation(line: 58, column: 16, scope: !48)
!64 = !DILocation(line: 58, column: 14, scope: !48)
!65 = !DILocation(line: 60, column: 16, scope: !43)
!66 = !DILocation(line: 60, column: 5, scope: !43)
!67 = !DILocation(line: 62, column: 10, scope: !43)
!68 = !DILocation(line: 62, column: 5, scope: !43)
!69 = !DILocation(line: 63, column: 1, scope: !43)
