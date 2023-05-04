; ModuleID = 'CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45.c'
source_filename = "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i32] [i32 37, i32 108, i32 115, i32 10, i32 0], align 4
@.str.2 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"%hd\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"%zu\0A\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"%02x\0A\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"%ls\0A\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1
@.str.11 = private unnamed_addr constant [10 x i8] c"%d -- %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"%02x\00", align 1
@.str.13 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.14 = private unnamed_addr constant [5 x i32] [i32 37, i32 48, i32 50, i32 120, i32 0], align 4
@GLOBAL_CONST_TRUE = dso_local constant i32 1, align 4, !dbg !0
@GLOBAL_CONST_FALSE = dso_local constant i32 0, align 4, !dbg !29
@GLOBAL_CONST_FIVE = dso_local constant i32 5, align 4, !dbg !33
@globalTrue = dso_local global i32 1, align 4, !dbg !35
@globalFalse = dso_local global i32 0, align 4, !dbg !37
@globalFive = dso_local global i32 5, align 4, !dbg !39
@globalArgc = dso_local global i32 0, align 4, !dbg !41
@globalArgv = dso_local global i8** null, align 8, !dbg !43
@CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_badData = internal global i8* null, align 8, !dbg !46
@.str.15 = private unnamed_addr constant [16 x i8] c"malloc() failed\00", align 1
@CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_goodG2BData = internal global i8* null, align 8, !dbg !48

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printLine(i8* noundef %line) #0 !dbg !58 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i8*, i8** %line.addr, align 8, !dbg !66
  %cmp = icmp ne i8* %0, null, !dbg !68
  br i1 %cmp, label %if.then, label %if.end, !dbg !69

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !70
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* noundef %1), !dbg !72
  br label %if.end, !dbg !73

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8* noundef, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printWLine(i32* noundef %line) #0 !dbg !75 {
entry:
  %line.addr = alloca i32*, align 8
  store i32* %line, i32** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %line.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = load i32*, i32** %line.addr, align 8, !dbg !84
  %cmp = icmp ne i32* %0, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %line.addr, align 8, !dbg !88
  %call = call i32 (i32*, ...) @wprintf(i32* noundef getelementptr inbounds ([5 x i32], [5 x i32]* @.str.1, i64 0, i64 0), i32* noundef %1), !dbg !90
  br label %if.end, !dbg !91

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !92
}

declare i32 @wprintf(i32* noundef, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printIntLine(i32 noundef %intNumber) #0 !dbg !93 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !98
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 noundef %0), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printShortLine(i16 noundef signext %shortNumber) #0 !dbg !101 {
entry:
  %shortNumber.addr = alloca i16, align 2
  store i16 %shortNumber, i16* %shortNumber.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %shortNumber.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = load i16, i16* %shortNumber.addr, align 2, !dbg !107
  %conv = sext i16 %0 to i32, !dbg !107
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i32 noundef %conv), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printFloatLine(float noundef %floatNumber) #0 !dbg !110 {
entry:
  %floatNumber.addr = alloca float, align 4
  store float %floatNumber, float* %floatNumber.addr, align 4
  call void @llvm.dbg.declare(metadata float* %floatNumber.addr, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = load float, float* %floatNumber.addr, align 4, !dbg !116
  %conv = fpext float %0 to double, !dbg !116
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), double noundef %conv), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printLongLine(i64 noundef %longNumber) #0 !dbg !119 {
entry:
  %longNumber.addr = alloca i64, align 8
  store i64 %longNumber, i64* %longNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longNumber.addr, metadata !123, metadata !DIExpression()), !dbg !124
  %0 = load i64, i64* %longNumber.addr, align 8, !dbg !125
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i64 noundef %0), !dbg !126
  ret void, !dbg !127
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printLongLongLine(i64 noundef %longLongIntNumber) #0 !dbg !128 {
entry:
  %longLongIntNumber.addr = alloca i64, align 8
  store i64 %longLongIntNumber, i64* %longLongIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longLongIntNumber.addr, metadata !135, metadata !DIExpression()), !dbg !136
  %0 = load i64, i64* %longLongIntNumber.addr, align 8, !dbg !137
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i64 noundef %0), !dbg !138
  ret void, !dbg !139
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printSizeTLine(i64 noundef %sizeTNumber) #0 !dbg !140 {
entry:
  %sizeTNumber.addr = alloca i64, align 8
  store i64 %sizeTNumber, i64* %sizeTNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %sizeTNumber.addr, metadata !145, metadata !DIExpression()), !dbg !146
  %0 = load i64, i64* %sizeTNumber.addr, align 8, !dbg !147
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i64 noundef %0), !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printHexCharLine(i8 noundef signext %charHex) #0 !dbg !150 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !153, metadata !DIExpression()), !dbg !154
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !155
  %conv = sext i8 %0 to i32, !dbg !155
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i64 0, i64 0), i32 noundef %conv), !dbg !156
  ret void, !dbg !157
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printWcharLine(i32 noundef %wideChar) #0 !dbg !158 {
entry:
  %wideChar.addr = alloca i32, align 4
  %s = alloca [2 x i32], align 4
  store i32 %wideChar, i32* %wideChar.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %wideChar.addr, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata [2 x i32]* %s, metadata !163, metadata !DIExpression()), !dbg !167
  %0 = load i32, i32* %wideChar.addr, align 4, !dbg !168
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %s, i64 0, i64 0, !dbg !169
  store i32 %0, i32* %arrayidx, align 4, !dbg !170
  %arrayidx1 = getelementptr inbounds [2 x i32], [2 x i32]* %s, i64 0, i64 1, !dbg !171
  store i32 0, i32* %arrayidx1, align 4, !dbg !172
  %arraydecay = getelementptr inbounds [2 x i32], [2 x i32]* %s, i64 0, i64 0, !dbg !173
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i64 0, i64 0), i32* noundef %arraydecay), !dbg !174
  ret void, !dbg !175
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printUnsignedLine(i32 noundef %unsignedNumber) #0 !dbg !176 {
entry:
  %unsignedNumber.addr = alloca i32, align 4
  store i32 %unsignedNumber, i32* %unsignedNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %unsignedNumber.addr, metadata !179, metadata !DIExpression()), !dbg !180
  %0 = load i32, i32* %unsignedNumber.addr, align 4, !dbg !181
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 noundef %0), !dbg !182
  ret void, !dbg !183
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printHexUnsignedCharLine(i8 noundef zeroext %unsignedCharacter) #0 !dbg !184 {
entry:
  %unsignedCharacter.addr = alloca i8, align 1
  store i8 %unsignedCharacter, i8* %unsignedCharacter.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %unsignedCharacter.addr, metadata !187, metadata !DIExpression()), !dbg !188
  %0 = load i8, i8* %unsignedCharacter.addr, align 1, !dbg !189
  %conv = zext i8 %0 to i32, !dbg !189
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i64 0, i64 0), i32 noundef %conv), !dbg !190
  ret void, !dbg !191
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printDoubleLine(double noundef %doubleNumber) #0 !dbg !192 {
entry:
  %doubleNumber.addr = alloca double, align 8
  store double %doubleNumber, double* %doubleNumber.addr, align 8
  call void @llvm.dbg.declare(metadata double* %doubleNumber.addr, metadata !196, metadata !DIExpression()), !dbg !197
  %0 = load double, double* %doubleNumber.addr, align 8, !dbg !198
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i64 0, i64 0), double noundef %0), !dbg !199
  ret void, !dbg !200
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printStructLine(%struct._twoIntsStruct* noundef %structTwoIntsStruct) #0 !dbg !201 {
entry:
  %structTwoIntsStruct.addr = alloca %struct._twoIntsStruct*, align 8
  store %struct._twoIntsStruct* %structTwoIntsStruct, %struct._twoIntsStruct** %structTwoIntsStruct.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %structTwoIntsStruct.addr, metadata !211, metadata !DIExpression()), !dbg !212
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %structTwoIntsStruct.addr, align 8, !dbg !213
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %0, i32 0, i32 0, !dbg !214
  %1 = load i32, i32* %intOne, align 4, !dbg !214
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %structTwoIntsStruct.addr, align 8, !dbg !215
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %2, i32 0, i32 1, !dbg !216
  %3 = load i32, i32* %intTwo, align 4, !dbg !216
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.11, i64 0, i64 0), i32 noundef %1, i32 noundef %3), !dbg !217
  ret void, !dbg !218
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printBytesLine(i8* noundef %bytes, i64 noundef %numBytes) #0 !dbg !219 {
entry:
  %bytes.addr = alloca i8*, align 8
  %numBytes.addr = alloca i64, align 8
  %i = alloca i64, align 8
  store i8* %bytes, i8** %bytes.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %bytes.addr, metadata !224, metadata !DIExpression()), !dbg !225
  store i64 %numBytes, i64* %numBytes.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %numBytes.addr, metadata !226, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.declare(metadata i64* %i, metadata !228, metadata !DIExpression()), !dbg !229
  store i64 0, i64* %i, align 8, !dbg !230
  br label %for.cond, !dbg !232

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !233
  %1 = load i64, i64* %numBytes.addr, align 8, !dbg !235
  %cmp = icmp ult i64 %0, %1, !dbg !236
  br i1 %cmp, label %for.body, label %for.end, !dbg !237

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %bytes.addr, align 8, !dbg !238
  %3 = load i64, i64* %i, align 8, !dbg !240
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !238
  %4 = load i8, i8* %arrayidx, align 1, !dbg !238
  %conv = zext i8 %4 to i32, !dbg !238
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i64 0, i64 0), i32 noundef %conv), !dbg !241
  br label %for.inc, !dbg !242

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !243
  %inc = add i64 %5, 1, !dbg !243
  store i64 %inc, i64* %i, align 8, !dbg !243
  br label %for.cond, !dbg !244, !llvm.loop !245

for.end:                                          ; preds = %for.cond
  %call1 = call i32 @puts(i8* noundef getelementptr inbounds ([1 x i8], [1 x i8]* @.str.13, i64 0, i64 0)), !dbg !248
  ret void, !dbg !249
}

declare i32 @puts(i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @decodeHexChars(i8* noundef %bytes, i64 noundef %numBytes, i8* noundef %hex) #0 !dbg !250 {
entry:
  %bytes.addr = alloca i8*, align 8
  %numBytes.addr = alloca i64, align 8
  %hex.addr = alloca i8*, align 8
  %numWritten = alloca i64, align 8
  %byte = alloca i32, align 4
  store i8* %bytes, i8** %bytes.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %bytes.addr, metadata !254, metadata !DIExpression()), !dbg !255
  store i64 %numBytes, i64* %numBytes.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %numBytes.addr, metadata !256, metadata !DIExpression()), !dbg !257
  store i8* %hex, i8** %hex.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %hex.addr, metadata !258, metadata !DIExpression()), !dbg !259
  call void @llvm.dbg.declare(metadata i64* %numWritten, metadata !260, metadata !DIExpression()), !dbg !261
  store i64 0, i64* %numWritten, align 8, !dbg !261
  br label %while.cond, !dbg !262

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i64, i64* %numWritten, align 8, !dbg !263
  %1 = load i64, i64* %numBytes.addr, align 8, !dbg !264
  %cmp = icmp ult i64 %0, %1, !dbg !265
  br i1 %cmp, label %land.lhs.true, label %land.end, !dbg !266

land.lhs.true:                                    ; preds = %while.cond
  %call = call i16** @__ctype_b_loc() #7, !dbg !267
  %2 = load i16*, i16** %call, align 8, !dbg !267
  %3 = load i8*, i8** %hex.addr, align 8, !dbg !267
  %4 = load i64, i64* %numWritten, align 8, !dbg !267
  %mul = mul i64 2, %4, !dbg !267
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 %mul, !dbg !267
  %5 = load i8, i8* %arrayidx, align 1, !dbg !267
  %conv = sext i8 %5 to i32, !dbg !267
  %idxprom = sext i32 %conv to i64, !dbg !267
  %arrayidx1 = getelementptr inbounds i16, i16* %2, i64 %idxprom, !dbg !267
  %6 = load i16, i16* %arrayidx1, align 2, !dbg !267
  %conv2 = zext i16 %6 to i32, !dbg !267
  %and = and i32 %conv2, 4096, !dbg !267
  %tobool = icmp ne i32 %and, 0, !dbg !267
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !268

land.rhs:                                         ; preds = %land.lhs.true
  %call3 = call i16** @__ctype_b_loc() #7, !dbg !269
  %7 = load i16*, i16** %call3, align 8, !dbg !269
  %8 = load i8*, i8** %hex.addr, align 8, !dbg !269
  %9 = load i64, i64* %numWritten, align 8, !dbg !269
  %mul4 = mul i64 2, %9, !dbg !269
  %add = add i64 %mul4, 1, !dbg !269
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 %add, !dbg !269
  %10 = load i8, i8* %arrayidx5, align 1, !dbg !269
  %conv6 = sext i8 %10 to i32, !dbg !269
  %idxprom7 = sext i32 %conv6 to i64, !dbg !269
  %arrayidx8 = getelementptr inbounds i16, i16* %7, i64 %idxprom7, !dbg !269
  %11 = load i16, i16* %arrayidx8, align 2, !dbg !269
  %conv9 = zext i16 %11 to i32, !dbg !269
  %and10 = and i32 %conv9, 4096, !dbg !269
  %tobool11 = icmp ne i32 %and10, 0, !dbg !268
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %while.cond
  %12 = phi i1 [ false, %land.lhs.true ], [ false, %while.cond ], [ %tobool11, %land.rhs ], !dbg !270
  br i1 %12, label %while.body, label %while.end, !dbg !262

while.body:                                       ; preds = %land.end
  call void @llvm.dbg.declare(metadata i32* %byte, metadata !271, metadata !DIExpression()), !dbg !273
  %13 = load i8*, i8** %hex.addr, align 8, !dbg !274
  %14 = load i64, i64* %numWritten, align 8, !dbg !275
  %mul12 = mul i64 2, %14, !dbg !276
  %arrayidx13 = getelementptr inbounds i8, i8* %13, i64 %mul12, !dbg !274
  %call14 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* noundef %arrayidx13, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i64 0, i64 0), i32* noundef %byte) #8, !dbg !277
  %15 = load i32, i32* %byte, align 4, !dbg !278
  %conv15 = trunc i32 %15 to i8, !dbg !279
  %16 = load i8*, i8** %bytes.addr, align 8, !dbg !280
  %17 = load i64, i64* %numWritten, align 8, !dbg !281
  %arrayidx16 = getelementptr inbounds i8, i8* %16, i64 %17, !dbg !280
  store i8 %conv15, i8* %arrayidx16, align 1, !dbg !282
  %18 = load i64, i64* %numWritten, align 8, !dbg !283
  %inc = add i64 %18, 1, !dbg !283
  store i64 %inc, i64* %numWritten, align 8, !dbg !283
  br label %while.cond, !dbg !262, !llvm.loop !284

while.end:                                        ; preds = %land.end
  %19 = load i64, i64* %numWritten, align 8, !dbg !286
  ret i64 %19, !dbg !287
}

; Function Attrs: nounwind readnone willreturn
declare i16** @__ctype_b_loc() #3

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8* noundef, i8* noundef, ...) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @decodeHexWChars(i8* noundef %bytes, i64 noundef %numBytes, i32* noundef %hex) #0 !dbg !288 {
entry:
  %bytes.addr = alloca i8*, align 8
  %numBytes.addr = alloca i64, align 8
  %hex.addr = alloca i32*, align 8
  %numWritten = alloca i64, align 8
  %byte = alloca i32, align 4
  store i8* %bytes, i8** %bytes.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %bytes.addr, metadata !291, metadata !DIExpression()), !dbg !292
  store i64 %numBytes, i64* %numBytes.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %numBytes.addr, metadata !293, metadata !DIExpression()), !dbg !294
  store i32* %hex, i32** %hex.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %hex.addr, metadata !295, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.declare(metadata i64* %numWritten, metadata !297, metadata !DIExpression()), !dbg !298
  store i64 0, i64* %numWritten, align 8, !dbg !298
  br label %while.cond, !dbg !299

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i64, i64* %numWritten, align 8, !dbg !300
  %1 = load i64, i64* %numBytes.addr, align 8, !dbg !301
  %cmp = icmp ult i64 %0, %1, !dbg !302
  br i1 %cmp, label %land.lhs.true, label %land.end, !dbg !303

land.lhs.true:                                    ; preds = %while.cond
  %2 = load i32*, i32** %hex.addr, align 8, !dbg !304
  %3 = load i64, i64* %numWritten, align 8, !dbg !305
  %mul = mul i64 2, %3, !dbg !306
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %mul, !dbg !304
  %4 = load i32, i32* %arrayidx, align 4, !dbg !304
  %call = call i32 @iswxdigit(i32 noundef %4) #8, !dbg !307
  %tobool = icmp ne i32 %call, 0, !dbg !307
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !308

land.rhs:                                         ; preds = %land.lhs.true
  %5 = load i32*, i32** %hex.addr, align 8, !dbg !309
  %6 = load i64, i64* %numWritten, align 8, !dbg !310
  %mul1 = mul i64 2, %6, !dbg !311
  %add = add i64 %mul1, 1, !dbg !312
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i64 %add, !dbg !309
  %7 = load i32, i32* %arrayidx2, align 4, !dbg !309
  %call3 = call i32 @iswxdigit(i32 noundef %7) #8, !dbg !313
  %tobool4 = icmp ne i32 %call3, 0, !dbg !308
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %while.cond
  %8 = phi i1 [ false, %land.lhs.true ], [ false, %while.cond ], [ %tobool4, %land.rhs ], !dbg !314
  br i1 %8, label %while.body, label %while.end, !dbg !299

while.body:                                       ; preds = %land.end
  call void @llvm.dbg.declare(metadata i32* %byte, metadata !315, metadata !DIExpression()), !dbg !317
  %9 = load i32*, i32** %hex.addr, align 8, !dbg !318
  %10 = load i64, i64* %numWritten, align 8, !dbg !319
  %mul5 = mul i64 2, %10, !dbg !320
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %mul5, !dbg !318
  %call7 = call i32 (i32*, i32*, ...) @__isoc99_swscanf(i32* noundef %arrayidx6, i32* noundef getelementptr inbounds ([5 x i32], [5 x i32]* @.str.14, i64 0, i64 0), i32* noundef %byte) #8, !dbg !321
  %11 = load i32, i32* %byte, align 4, !dbg !322
  %conv = trunc i32 %11 to i8, !dbg !323
  %12 = load i8*, i8** %bytes.addr, align 8, !dbg !324
  %13 = load i64, i64* %numWritten, align 8, !dbg !325
  %arrayidx8 = getelementptr inbounds i8, i8* %12, i64 %13, !dbg !324
  store i8 %conv, i8* %arrayidx8, align 1, !dbg !326
  %14 = load i64, i64* %numWritten, align 8, !dbg !327
  %inc = add i64 %14, 1, !dbg !327
  store i64 %inc, i64* %numWritten, align 8, !dbg !327
  br label %while.cond, !dbg !299, !llvm.loop !328

while.end:                                        ; preds = %land.end
  %15 = load i64, i64* %numWritten, align 8, !dbg !330
  ret i64 %15, !dbg !331
}

; Function Attrs: nounwind
declare i32 @iswxdigit(i32 noundef) #4

; Function Attrs: nounwind
declare i32 @__isoc99_swscanf(i32* noundef, i32* noundef, ...) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @globalReturnsTrue() #0 !dbg !332 {
entry:
  ret i32 1, !dbg !335
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @globalReturnsFalse() #0 !dbg !336 {
entry:
  ret i32 0, !dbg !337
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @globalReturnsTrueOrFalse() #0 !dbg !338 {
entry:
  %call = call i32 @rand() #8, !dbg !339
  %rem = srem i32 %call, 2, !dbg !340
  ret i32 %rem, !dbg !341
}

; Function Attrs: nounwind
declare i32 @rand() #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @good1() #0 !dbg !342 {
entry:
  ret void, !dbg !345
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @good2() #0 !dbg !346 {
entry:
  ret void, !dbg !347
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @good3() #0 !dbg !348 {
entry:
  ret void, !dbg !349
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @good4() #0 !dbg !350 {
entry:
  ret void, !dbg !351
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @good5() #0 !dbg !352 {
entry:
  ret void, !dbg !353
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @good6() #0 !dbg !354 {
entry:
  ret void, !dbg !355
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @good7() #0 !dbg !356 {
entry:
  ret void, !dbg !357
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @good8() #0 !dbg !358 {
entry:
  ret void, !dbg !359
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @good9() #0 !dbg !360 {
entry:
  ret void, !dbg !361
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @bad1() #0 !dbg !362 {
entry:
  ret void, !dbg !363
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @bad2() #0 !dbg !364 {
entry:
  ret void, !dbg !365
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @bad3() #0 !dbg !366 {
entry:
  ret void, !dbg !367
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @bad4() #0 !dbg !368 {
entry:
  ret void, !dbg !369
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @bad5() #0 !dbg !370 {
entry:
  ret void, !dbg !371
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @bad6() #0 !dbg !372 {
entry:
  ret void, !dbg !373
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @bad7() #0 !dbg !374 {
entry:
  ret void, !dbg !375
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @bad8() #0 !dbg !376 {
entry:
  ret void, !dbg !377
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @bad9() #0 !dbg !378 {
entry:
  ret void, !dbg !379
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_bad() #0 !dbg !380 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !381, metadata !DIExpression()), !dbg !382
  store i8* null, i8** %data, align 8, !dbg !383
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !384, metadata !DIExpression()), !dbg !386
  %0 = alloca i8, i64 100, align 16, !dbg !387
  store i8* %0, i8** %dataBuffer, align 8, !dbg !386
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !388
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !389
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !390
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !390
  store i8 0, i8* %arrayidx, align 1, !dbg !391
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !392
  store i8* %3, i8** %data, align 8, !dbg !393
  %4 = load i8*, i8** %data, align 8, !dbg !394
  store i8* %4, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_badData, align 8, !dbg !395
  call void @badSink(), !dbg !396
  ret void, !dbg !397
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_good() #0 !dbg !398 {
entry:
  call void @goodG2B(), !dbg !399
  ret void, !dbg !400
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @badSink() #0 !dbg !401 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !402, metadata !DIExpression()), !dbg !403
  %0 = load i8*, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_badData, align 8, !dbg !404
  store i8* %0, i8** %data, align 8, !dbg !403
  %1 = load i8*, i8** %data, align 8, !dbg !405
  call void @printLine(i8* noundef %1), !dbg !406
  %2 = load i8*, i8** %data, align 8, !dbg !407
  call void @free(i8* noundef %2) #8, !dbg !408
  ret void, !dbg !409
}

; Function Attrs: nounwind
declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !410 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !411, metadata !DIExpression()), !dbg !412
  store i8* null, i8** %data, align 8, !dbg !413
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !414, metadata !DIExpression()), !dbg !416
  %call = call noalias i8* @malloc(i64 noundef 100) #8, !dbg !417
  store i8* %call, i8** %dataBuffer, align 8, !dbg !416
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !418
  %cmp = icmp eq i8* %0, null, !dbg !420
  br i1 %cmp, label %if.then, label %if.end, !dbg !421

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.15, i64 0, i64 0)), !dbg !422
  call void @exit(i32 noundef 1) #9, !dbg !424
  unreachable, !dbg !424

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !425
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !426
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !427
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !427
  store i8 0, i8* %arrayidx, align 1, !dbg !428
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !429
  store i8* %3, i8** %data, align 8, !dbg !430
  %4 = load i8*, i8** %data, align 8, !dbg !431
  store i8* %4, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_goodG2BData, align 8, !dbg !432
  call void @goodG2BSink(), !dbg !433
  ret void, !dbg !434
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #6

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2BSink() #0 !dbg !435 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !436, metadata !DIExpression()), !dbg !437
  %0 = load i8*, i8** @CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_goodG2BData, align 8, !dbg !438
  store i8* %0, i8** %data, align 8, !dbg !437
  %1 = load i8*, i8** %data, align 8, !dbg !439
  call void @printLine(i8* noundef %1), !dbg !440
  %2 = load i8*, i8** %data, align 8, !dbg !441
  call void @free(i8* noundef %2) #8, !dbg !442
  ret void, !dbg !443
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readnone willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!50, !51, !52, !53, !54, !55, !56}
!llvm.ident = !{!57}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !2, file: !31, line: 296, type: !32, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !21, globals: !28, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45.c", directory: "/home/ymy/SVF-master", checksumkind: CSK_MD5, checksum: "d733c5bdfc4b01b44ee85c243672c529")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 46, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "3ab3dd7fdf2578005732722ee2393e59")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20}
!9 = !DIEnumerator(name: "_ISupper", value: 256)
!10 = !DIEnumerator(name: "_ISlower", value: 512)
!11 = !DIEnumerator(name: "_ISalpha", value: 1024)
!12 = !DIEnumerator(name: "_ISdigit", value: 2048)
!13 = !DIEnumerator(name: "_ISxdigit", value: 4096)
!14 = !DIEnumerator(name: "_ISspace", value: 8192)
!15 = !DIEnumerator(name: "_ISprint", value: 16384)
!16 = !DIEnumerator(name: "_ISgraph", value: 32768)
!17 = !DIEnumerator(name: "_ISblank", value: 1)
!18 = !DIEnumerator(name: "_IScntrl", value: 2)
!19 = !DIEnumerator(name: "_ISpunct", value: 4)
!20 = !DIEnumerator(name: "_ISalnum", value: 8)
!21 = !{!22, !23, !24, !25, !26}
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!25 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!28 = !{!0, !29, !33, !35, !37, !39, !41, !43, !46, !48}
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !2, file: !31, line: 297, type: !32, isLocal: false, isDefinition: true)
!31 = !DIFile(filename: "./std_testcase.h", directory: "/home/ymy/SVF-master", checksumkind: CSK_MD5, checksum: "5e9d51ec5068ae1516c40358c41b4c41")
!32 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !2, file: !31, line: 298, type: !32, isLocal: false, isDefinition: true)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(name: "globalTrue", scope: !2, file: !31, line: 303, type: !23, isLocal: false, isDefinition: true)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(name: "globalFalse", scope: !2, file: !31, line: 304, type: !23, isLocal: false, isDefinition: true)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression())
!40 = distinct !DIGlobalVariable(name: "globalFive", scope: !2, file: !31, line: 305, type: !23, isLocal: false, isDefinition: true)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "globalArgc", scope: !2, file: !31, line: 336, type: !23, isLocal: false, isDefinition: true)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression())
!44 = distinct !DIGlobalVariable(name: "globalArgv", scope: !2, file: !31, line: 337, type: !45, isLocal: false, isDefinition: true)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_badData", scope: !2, file: !3, line: 21, type: !26, isLocal: true, isDefinition: true)
!48 = !DIGlobalVariableExpression(var: !49, expr: !DIExpression())
!49 = distinct !DIGlobalVariable(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_goodG2BData", scope: !2, file: !3, line: 22, type: !26, isLocal: true, isDefinition: true)
!50 = !{i32 7, !"Dwarf Version", i32 5}
!51 = !{i32 2, !"Debug Info Version", i32 3}
!52 = !{i32 1, !"wchar_size", i32 4}
!53 = !{i32 7, !"PIC Level", i32 2}
!54 = !{i32 7, !"PIE Level", i32 2}
!55 = !{i32 7, !"uwtable", i32 1}
!56 = !{i32 7, !"frame-pointer", i32 2}
!57 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!58 = distinct !DISubprogram(name: "printLine", scope: !31, file: !31, line: 141, type: !59, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!59 = !DISubroutineType(types: !60)
!60 = !{null, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !27)
!63 = !{}
!64 = !DILocalVariable(name: "line", arg: 1, scope: !58, file: !31, line: 141, type: !61)
!65 = !DILocation(line: 141, column: 30, scope: !58)
!66 = !DILocation(line: 143, column: 8, scope: !67)
!67 = distinct !DILexicalBlock(scope: !58, file: !31, line: 143, column: 8)
!68 = !DILocation(line: 143, column: 13, scope: !67)
!69 = !DILocation(line: 143, column: 8, scope: !58)
!70 = !DILocation(line: 145, column: 24, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !31, line: 144, column: 5)
!72 = !DILocation(line: 145, column: 9, scope: !71)
!73 = !DILocation(line: 146, column: 5, scope: !71)
!74 = !DILocation(line: 147, column: 1, scope: !58)
!75 = distinct !DISubprogram(name: "printWLine", scope: !31, file: !31, line: 149, type: !76, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!76 = !DISubroutineType(types: !77)
!77 = !{null, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !80)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !81, line: 74, baseType: !23)
!81 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!82 = !DILocalVariable(name: "line", arg: 1, scope: !75, file: !31, line: 149, type: !78)
!83 = !DILocation(line: 149, column: 34, scope: !75)
!84 = !DILocation(line: 151, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !75, file: !31, line: 151, column: 8)
!86 = !DILocation(line: 151, column: 13, scope: !85)
!87 = !DILocation(line: 151, column: 8, scope: !75)
!88 = !DILocation(line: 153, column: 27, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !31, line: 152, column: 5)
!90 = !DILocation(line: 153, column: 9, scope: !89)
!91 = !DILocation(line: 154, column: 5, scope: !89)
!92 = !DILocation(line: 155, column: 1, scope: !75)
!93 = distinct !DISubprogram(name: "printIntLine", scope: !31, file: !31, line: 157, type: !94, scopeLine: 158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!94 = !DISubroutineType(types: !95)
!95 = !{null, !23}
!96 = !DILocalVariable(name: "intNumber", arg: 1, scope: !93, file: !31, line: 157, type: !23)
!97 = !DILocation(line: 157, column: 24, scope: !93)
!98 = !DILocation(line: 159, column: 20, scope: !93)
!99 = !DILocation(line: 159, column: 5, scope: !93)
!100 = !DILocation(line: 160, column: 1, scope: !93)
!101 = distinct !DISubprogram(name: "printShortLine", scope: !31, file: !31, line: 162, type: !102, scopeLine: 163, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!102 = !DISubroutineType(types: !103)
!103 = !{null, !104}
!104 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!105 = !DILocalVariable(name: "shortNumber", arg: 1, scope: !101, file: !31, line: 162, type: !104)
!106 = !DILocation(line: 162, column: 28, scope: !101)
!107 = !DILocation(line: 164, column: 21, scope: !101)
!108 = !DILocation(line: 164, column: 5, scope: !101)
!109 = !DILocation(line: 165, column: 1, scope: !101)
!110 = distinct !DISubprogram(name: "printFloatLine", scope: !31, file: !31, line: 167, type: !111, scopeLine: 168, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!111 = !DISubroutineType(types: !112)
!112 = !{null, !113}
!113 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!114 = !DILocalVariable(name: "floatNumber", arg: 1, scope: !110, file: !31, line: 167, type: !113)
!115 = !DILocation(line: 167, column: 28, scope: !110)
!116 = !DILocation(line: 169, column: 20, scope: !110)
!117 = !DILocation(line: 169, column: 5, scope: !110)
!118 = !DILocation(line: 170, column: 1, scope: !110)
!119 = distinct !DISubprogram(name: "printLongLine", scope: !31, file: !31, line: 172, type: !120, scopeLine: 173, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!120 = !DISubroutineType(types: !121)
!121 = !{null, !122}
!122 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!123 = !DILocalVariable(name: "longNumber", arg: 1, scope: !119, file: !31, line: 172, type: !122)
!124 = !DILocation(line: 172, column: 26, scope: !119)
!125 = !DILocation(line: 174, column: 21, scope: !119)
!126 = !DILocation(line: 174, column: 5, scope: !119)
!127 = !DILocation(line: 175, column: 1, scope: !119)
!128 = distinct !DISubprogram(name: "printLongLongLine", scope: !31, file: !31, line: 177, type: !129, scopeLine: 178, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!129 = !DISubroutineType(types: !130)
!130 = !{null, !131}
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !132, line: 27, baseType: !133)
!132 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!133 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !134, line: 44, baseType: !122)
!134 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!135 = !DILocalVariable(name: "longLongIntNumber", arg: 1, scope: !128, file: !31, line: 177, type: !131)
!136 = !DILocation(line: 177, column: 33, scope: !128)
!137 = !DILocation(line: 179, column: 29, scope: !128)
!138 = !DILocation(line: 179, column: 5, scope: !128)
!139 = !DILocation(line: 180, column: 1, scope: !128)
!140 = distinct !DISubprogram(name: "printSizeTLine", scope: !31, file: !31, line: 182, type: !141, scopeLine: 183, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!141 = !DISubroutineType(types: !142)
!142 = !{null, !143}
!143 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !81, line: 46, baseType: !144)
!144 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!145 = !DILocalVariable(name: "sizeTNumber", arg: 1, scope: !140, file: !31, line: 182, type: !143)
!146 = !DILocation(line: 182, column: 29, scope: !140)
!147 = !DILocation(line: 184, column: 21, scope: !140)
!148 = !DILocation(line: 184, column: 5, scope: !140)
!149 = !DILocation(line: 185, column: 1, scope: !140)
!150 = distinct !DISubprogram(name: "printHexCharLine", scope: !31, file: !31, line: 187, type: !151, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!151 = !DISubroutineType(types: !152)
!152 = !{null, !27}
!153 = !DILocalVariable(name: "charHex", arg: 1, scope: !150, file: !31, line: 187, type: !27)
!154 = !DILocation(line: 187, column: 29, scope: !150)
!155 = !DILocation(line: 189, column: 22, scope: !150)
!156 = !DILocation(line: 189, column: 5, scope: !150)
!157 = !DILocation(line: 190, column: 1, scope: !150)
!158 = distinct !DISubprogram(name: "printWcharLine", scope: !31, file: !31, line: 192, type: !159, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!159 = !DISubroutineType(types: !160)
!160 = !{null, !80}
!161 = !DILocalVariable(name: "wideChar", arg: 1, scope: !158, file: !31, line: 192, type: !80)
!162 = !DILocation(line: 192, column: 29, scope: !158)
!163 = !DILocalVariable(name: "s", scope: !158, file: !31, line: 196, type: !164)
!164 = !DICompositeType(tag: DW_TAG_array_type, baseType: !80, size: 64, elements: !165)
!165 = !{!166}
!166 = !DISubrange(count: 2)
!167 = !DILocation(line: 196, column: 13, scope: !158)
!168 = !DILocation(line: 197, column: 16, scope: !158)
!169 = !DILocation(line: 197, column: 9, scope: !158)
!170 = !DILocation(line: 197, column: 14, scope: !158)
!171 = !DILocation(line: 198, column: 9, scope: !158)
!172 = !DILocation(line: 198, column: 14, scope: !158)
!173 = !DILocation(line: 199, column: 21, scope: !158)
!174 = !DILocation(line: 199, column: 5, scope: !158)
!175 = !DILocation(line: 200, column: 1, scope: !158)
!176 = distinct !DISubprogram(name: "printUnsignedLine", scope: !31, file: !31, line: 202, type: !177, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!177 = !DISubroutineType(types: !178)
!178 = !{null, !7}
!179 = !DILocalVariable(name: "unsignedNumber", arg: 1, scope: !176, file: !31, line: 202, type: !7)
!180 = !DILocation(line: 202, column: 33, scope: !176)
!181 = !DILocation(line: 204, column: 20, scope: !176)
!182 = !DILocation(line: 204, column: 5, scope: !176)
!183 = !DILocation(line: 205, column: 1, scope: !176)
!184 = distinct !DISubprogram(name: "printHexUnsignedCharLine", scope: !31, file: !31, line: 207, type: !185, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!185 = !DISubroutineType(types: !186)
!186 = !{null, !25}
!187 = !DILocalVariable(name: "unsignedCharacter", arg: 1, scope: !184, file: !31, line: 207, type: !25)
!188 = !DILocation(line: 207, column: 45, scope: !184)
!189 = !DILocation(line: 209, column: 22, scope: !184)
!190 = !DILocation(line: 209, column: 5, scope: !184)
!191 = !DILocation(line: 210, column: 1, scope: !184)
!192 = distinct !DISubprogram(name: "printDoubleLine", scope: !31, file: !31, line: 212, type: !193, scopeLine: 213, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!193 = !DISubroutineType(types: !194)
!194 = !{null, !195}
!195 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!196 = !DILocalVariable(name: "doubleNumber", arg: 1, scope: !192, file: !31, line: 212, type: !195)
!197 = !DILocation(line: 212, column: 29, scope: !192)
!198 = !DILocation(line: 214, column: 20, scope: !192)
!199 = !DILocation(line: 214, column: 5, scope: !192)
!200 = !DILocation(line: 215, column: 1, scope: !192)
!201 = distinct !DISubprogram(name: "printStructLine", scope: !31, file: !31, line: 217, type: !202, scopeLine: 218, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!202 = !DISubroutineType(types: !203)
!203 = !{null, !204}
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !205, size: 64)
!205 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !206)
!206 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !31, line: 108, baseType: !207)
!207 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !31, line: 104, size: 64, elements: !208)
!208 = !{!209, !210}
!209 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !207, file: !31, line: 106, baseType: !23, size: 32)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !207, file: !31, line: 107, baseType: !23, size: 32, offset: 32)
!211 = !DILocalVariable(name: "structTwoIntsStruct", arg: 1, scope: !201, file: !31, line: 217, type: !204)
!212 = !DILocation(line: 217, column: 45, scope: !201)
!213 = !DILocation(line: 219, column: 26, scope: !201)
!214 = !DILocation(line: 219, column: 47, scope: !201)
!215 = !DILocation(line: 219, column: 55, scope: !201)
!216 = !DILocation(line: 219, column: 76, scope: !201)
!217 = !DILocation(line: 219, column: 5, scope: !201)
!218 = !DILocation(line: 220, column: 1, scope: !201)
!219 = distinct !DISubprogram(name: "printBytesLine", scope: !31, file: !31, line: 222, type: !220, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!220 = !DISubroutineType(types: !221)
!221 = !{null, !222, !143}
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !223, size: 64)
!223 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !25)
!224 = !DILocalVariable(name: "bytes", arg: 1, scope: !219, file: !31, line: 222, type: !222)
!225 = !DILocation(line: 222, column: 43, scope: !219)
!226 = !DILocalVariable(name: "numBytes", arg: 2, scope: !219, file: !31, line: 222, type: !143)
!227 = !DILocation(line: 222, column: 57, scope: !219)
!228 = !DILocalVariable(name: "i", scope: !219, file: !31, line: 224, type: !143)
!229 = !DILocation(line: 224, column: 12, scope: !219)
!230 = !DILocation(line: 225, column: 12, scope: !231)
!231 = distinct !DILexicalBlock(scope: !219, file: !31, line: 225, column: 5)
!232 = !DILocation(line: 225, column: 10, scope: !231)
!233 = !DILocation(line: 225, column: 17, scope: !234)
!234 = distinct !DILexicalBlock(scope: !231, file: !31, line: 225, column: 5)
!235 = !DILocation(line: 225, column: 21, scope: !234)
!236 = !DILocation(line: 225, column: 19, scope: !234)
!237 = !DILocation(line: 225, column: 5, scope: !231)
!238 = !DILocation(line: 227, column: 24, scope: !239)
!239 = distinct !DILexicalBlock(scope: !234, file: !31, line: 226, column: 5)
!240 = !DILocation(line: 227, column: 30, scope: !239)
!241 = !DILocation(line: 227, column: 9, scope: !239)
!242 = !DILocation(line: 228, column: 5, scope: !239)
!243 = !DILocation(line: 225, column: 31, scope: !234)
!244 = !DILocation(line: 225, column: 5, scope: !234)
!245 = distinct !{!245, !237, !246, !247}
!246 = !DILocation(line: 228, column: 5, scope: !231)
!247 = !{!"llvm.loop.mustprogress"}
!248 = !DILocation(line: 229, column: 5, scope: !219)
!249 = !DILocation(line: 230, column: 1, scope: !219)
!250 = distinct !DISubprogram(name: "decodeHexChars", scope: !31, file: !31, line: 235, type: !251, scopeLine: 236, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!251 = !DISubroutineType(types: !252)
!252 = !{!143, !253, !143, !61}
!253 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!254 = !DILocalVariable(name: "bytes", arg: 1, scope: !250, file: !31, line: 235, type: !253)
!255 = !DILocation(line: 235, column: 39, scope: !250)
!256 = !DILocalVariable(name: "numBytes", arg: 2, scope: !250, file: !31, line: 235, type: !143)
!257 = !DILocation(line: 235, column: 53, scope: !250)
!258 = !DILocalVariable(name: "hex", arg: 3, scope: !250, file: !31, line: 235, type: !61)
!259 = !DILocation(line: 235, column: 76, scope: !250)
!260 = !DILocalVariable(name: "numWritten", scope: !250, file: !31, line: 237, type: !143)
!261 = !DILocation(line: 237, column: 12, scope: !250)
!262 = !DILocation(line: 243, column: 5, scope: !250)
!263 = !DILocation(line: 243, column: 12, scope: !250)
!264 = !DILocation(line: 243, column: 25, scope: !250)
!265 = !DILocation(line: 243, column: 23, scope: !250)
!266 = !DILocation(line: 243, column: 34, scope: !250)
!267 = !DILocation(line: 243, column: 37, scope: !250)
!268 = !DILocation(line: 243, column: 67, scope: !250)
!269 = !DILocation(line: 243, column: 70, scope: !250)
!270 = !DILocation(line: 0, scope: !250)
!271 = !DILocalVariable(name: "byte", scope: !272, file: !31, line: 245, type: !23)
!272 = distinct !DILexicalBlock(scope: !250, file: !31, line: 244, column: 5)
!273 = !DILocation(line: 245, column: 13, scope: !272)
!274 = !DILocation(line: 246, column: 17, scope: !272)
!275 = !DILocation(line: 246, column: 25, scope: !272)
!276 = !DILocation(line: 246, column: 23, scope: !272)
!277 = !DILocation(line: 246, column: 9, scope: !272)
!278 = !DILocation(line: 247, column: 45, scope: !272)
!279 = !DILocation(line: 247, column: 29, scope: !272)
!280 = !DILocation(line: 247, column: 9, scope: !272)
!281 = !DILocation(line: 247, column: 15, scope: !272)
!282 = !DILocation(line: 247, column: 27, scope: !272)
!283 = !DILocation(line: 248, column: 9, scope: !272)
!284 = distinct !{!284, !262, !285, !247}
!285 = !DILocation(line: 249, column: 5, scope: !250)
!286 = !DILocation(line: 251, column: 12, scope: !250)
!287 = !DILocation(line: 251, column: 5, scope: !250)
!288 = distinct !DISubprogram(name: "decodeHexWChars", scope: !31, file: !31, line: 257, type: !289, scopeLine: 258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!289 = !DISubroutineType(types: !290)
!290 = !{!143, !253, !143, !78}
!291 = !DILocalVariable(name: "bytes", arg: 1, scope: !288, file: !31, line: 257, type: !253)
!292 = !DILocation(line: 257, column: 41, scope: !288)
!293 = !DILocalVariable(name: "numBytes", arg: 2, scope: !288, file: !31, line: 257, type: !143)
!294 = !DILocation(line: 257, column: 55, scope: !288)
!295 = !DILocalVariable(name: "hex", arg: 3, scope: !288, file: !31, line: 257, type: !78)
!296 = !DILocation(line: 257, column: 81, scope: !288)
!297 = !DILocalVariable(name: "numWritten", scope: !288, file: !31, line: 259, type: !143)
!298 = !DILocation(line: 259, column: 12, scope: !288)
!299 = !DILocation(line: 265, column: 5, scope: !288)
!300 = !DILocation(line: 265, column: 12, scope: !288)
!301 = !DILocation(line: 265, column: 25, scope: !288)
!302 = !DILocation(line: 265, column: 23, scope: !288)
!303 = !DILocation(line: 265, column: 34, scope: !288)
!304 = !DILocation(line: 265, column: 47, scope: !288)
!305 = !DILocation(line: 265, column: 55, scope: !288)
!306 = !DILocation(line: 265, column: 53, scope: !288)
!307 = !DILocation(line: 265, column: 37, scope: !288)
!308 = !DILocation(line: 265, column: 68, scope: !288)
!309 = !DILocation(line: 265, column: 81, scope: !288)
!310 = !DILocation(line: 265, column: 89, scope: !288)
!311 = !DILocation(line: 265, column: 87, scope: !288)
!312 = !DILocation(line: 265, column: 100, scope: !288)
!313 = !DILocation(line: 265, column: 71, scope: !288)
!314 = !DILocation(line: 0, scope: !288)
!315 = !DILocalVariable(name: "byte", scope: !316, file: !31, line: 267, type: !23)
!316 = distinct !DILexicalBlock(scope: !288, file: !31, line: 266, column: 5)
!317 = !DILocation(line: 267, column: 13, scope: !316)
!318 = !DILocation(line: 268, column: 18, scope: !316)
!319 = !DILocation(line: 268, column: 26, scope: !316)
!320 = !DILocation(line: 268, column: 24, scope: !316)
!321 = !DILocation(line: 268, column: 9, scope: !316)
!322 = !DILocation(line: 269, column: 45, scope: !316)
!323 = !DILocation(line: 269, column: 29, scope: !316)
!324 = !DILocation(line: 269, column: 9, scope: !316)
!325 = !DILocation(line: 269, column: 15, scope: !316)
!326 = !DILocation(line: 269, column: 27, scope: !316)
!327 = !DILocation(line: 270, column: 9, scope: !316)
!328 = distinct !{!328, !299, !329, !247}
!329 = !DILocation(line: 271, column: 5, scope: !288)
!330 = !DILocation(line: 273, column: 12, scope: !288)
!331 = !DILocation(line: 273, column: 5, scope: !288)
!332 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !31, file: !31, line: 278, type: !333, scopeLine: 279, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!333 = !DISubroutineType(types: !334)
!334 = !{!23}
!335 = !DILocation(line: 280, column: 5, scope: !332)
!336 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !31, file: !31, line: 283, type: !333, scopeLine: 284, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!337 = !DILocation(line: 285, column: 5, scope: !336)
!338 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !31, file: !31, line: 288, type: !333, scopeLine: 289, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!339 = !DILocation(line: 290, column: 13, scope: !338)
!340 = !DILocation(line: 290, column: 20, scope: !338)
!341 = !DILocation(line: 290, column: 5, scope: !338)
!342 = distinct !DISubprogram(name: "good1", scope: !31, file: !31, line: 309, type: !343, scopeLine: 309, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!343 = !DISubroutineType(types: !344)
!344 = !{null}
!345 = !DILocation(line: 309, column: 16, scope: !342)
!346 = distinct !DISubprogram(name: "good2", scope: !31, file: !31, line: 310, type: !343, scopeLine: 310, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!347 = !DILocation(line: 310, column: 16, scope: !346)
!348 = distinct !DISubprogram(name: "good3", scope: !31, file: !31, line: 311, type: !343, scopeLine: 311, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!349 = !DILocation(line: 311, column: 16, scope: !348)
!350 = distinct !DISubprogram(name: "good4", scope: !31, file: !31, line: 312, type: !343, scopeLine: 312, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!351 = !DILocation(line: 312, column: 16, scope: !350)
!352 = distinct !DISubprogram(name: "good5", scope: !31, file: !31, line: 313, type: !343, scopeLine: 313, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!353 = !DILocation(line: 313, column: 16, scope: !352)
!354 = distinct !DISubprogram(name: "good6", scope: !31, file: !31, line: 314, type: !343, scopeLine: 314, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!355 = !DILocation(line: 314, column: 16, scope: !354)
!356 = distinct !DISubprogram(name: "good7", scope: !31, file: !31, line: 315, type: !343, scopeLine: 315, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!357 = !DILocation(line: 315, column: 16, scope: !356)
!358 = distinct !DISubprogram(name: "good8", scope: !31, file: !31, line: 316, type: !343, scopeLine: 316, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!359 = !DILocation(line: 316, column: 16, scope: !358)
!360 = distinct !DISubprogram(name: "good9", scope: !31, file: !31, line: 317, type: !343, scopeLine: 317, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!361 = !DILocation(line: 317, column: 16, scope: !360)
!362 = distinct !DISubprogram(name: "bad1", scope: !31, file: !31, line: 320, type: !343, scopeLine: 320, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!363 = !DILocation(line: 320, column: 15, scope: !362)
!364 = distinct !DISubprogram(name: "bad2", scope: !31, file: !31, line: 321, type: !343, scopeLine: 321, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!365 = !DILocation(line: 321, column: 15, scope: !364)
!366 = distinct !DISubprogram(name: "bad3", scope: !31, file: !31, line: 322, type: !343, scopeLine: 322, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!367 = !DILocation(line: 322, column: 15, scope: !366)
!368 = distinct !DISubprogram(name: "bad4", scope: !31, file: !31, line: 323, type: !343, scopeLine: 323, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!369 = !DILocation(line: 323, column: 15, scope: !368)
!370 = distinct !DISubprogram(name: "bad5", scope: !31, file: !31, line: 324, type: !343, scopeLine: 324, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!371 = !DILocation(line: 324, column: 15, scope: !370)
!372 = distinct !DISubprogram(name: "bad6", scope: !31, file: !31, line: 325, type: !343, scopeLine: 325, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!373 = !DILocation(line: 325, column: 15, scope: !372)
!374 = distinct !DISubprogram(name: "bad7", scope: !31, file: !31, line: 326, type: !343, scopeLine: 326, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!375 = !DILocation(line: 326, column: 15, scope: !374)
!376 = distinct !DISubprogram(name: "bad8", scope: !31, file: !31, line: 327, type: !343, scopeLine: 327, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!377 = !DILocation(line: 327, column: 15, scope: !376)
!378 = distinct !DISubprogram(name: "bad9", scope: !31, file: !31, line: 328, type: !343, scopeLine: 328, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!379 = !DILocation(line: 328, column: 15, scope: !378)
!380 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_bad", scope: !3, file: !3, line: 34, type: !343, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!381 = !DILocalVariable(name: "data", scope: !380, file: !3, line: 36, type: !26)
!382 = !DILocation(line: 36, column: 12, scope: !380)
!383 = !DILocation(line: 37, column: 10, scope: !380)
!384 = !DILocalVariable(name: "dataBuffer", scope: !385, file: !3, line: 40, type: !26)
!385 = distinct !DILexicalBlock(scope: !380, file: !3, line: 38, column: 5)
!386 = !DILocation(line: 40, column: 16, scope: !385)
!387 = !DILocation(line: 40, column: 37, scope: !385)
!388 = !DILocation(line: 41, column: 16, scope: !385)
!389 = !DILocation(line: 41, column: 9, scope: !385)
!390 = !DILocation(line: 42, column: 9, scope: !385)
!391 = !DILocation(line: 42, column: 27, scope: !385)
!392 = !DILocation(line: 43, column: 16, scope: !385)
!393 = !DILocation(line: 43, column: 14, scope: !385)
!394 = !DILocation(line: 45, column: 67, scope: !380)
!395 = !DILocation(line: 45, column: 65, scope: !380)
!396 = !DILocation(line: 46, column: 5, scope: !380)
!397 = !DILocation(line: 47, column: 1, scope: !380)
!398 = distinct !DISubprogram(name: "CWE590_Free_Memory_Not_on_Heap__free_char_alloca_45_good", scope: !3, file: !3, line: 82, type: !343, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !63)
!399 = !DILocation(line: 84, column: 5, scope: !398)
!400 = !DILocation(line: 85, column: 1, scope: !398)
!401 = distinct !DISubprogram(name: "badSink", scope: !3, file: !3, line: 26, type: !343, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !63)
!402 = !DILocalVariable(name: "data", scope: !401, file: !3, line: 28, type: !26)
!403 = !DILocation(line: 28, column: 12, scope: !401)
!404 = !DILocation(line: 28, column: 19, scope: !401)
!405 = !DILocation(line: 29, column: 15, scope: !401)
!406 = !DILocation(line: 29, column: 5, scope: !401)
!407 = !DILocation(line: 31, column: 10, scope: !401)
!408 = !DILocation(line: 31, column: 5, scope: !401)
!409 = !DILocation(line: 32, column: 1, scope: !401)
!410 = distinct !DISubprogram(name: "goodG2B", scope: !3, file: !3, line: 62, type: !343, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !63)
!411 = !DILocalVariable(name: "data", scope: !410, file: !3, line: 64, type: !26)
!412 = !DILocation(line: 64, column: 12, scope: !410)
!413 = !DILocation(line: 65, column: 10, scope: !410)
!414 = !DILocalVariable(name: "dataBuffer", scope: !415, file: !3, line: 68, type: !26)
!415 = distinct !DILexicalBlock(scope: !410, file: !3, line: 66, column: 5)
!416 = !DILocation(line: 68, column: 16, scope: !415)
!417 = !DILocation(line: 68, column: 37, scope: !415)
!418 = !DILocation(line: 69, column: 13, scope: !419)
!419 = distinct !DILexicalBlock(scope: !415, file: !3, line: 69, column: 13)
!420 = !DILocation(line: 69, column: 24, scope: !419)
!421 = !DILocation(line: 69, column: 13, scope: !415)
!422 = !DILocation(line: 71, column: 13, scope: !423)
!423 = distinct !DILexicalBlock(scope: !419, file: !3, line: 70, column: 9)
!424 = !DILocation(line: 72, column: 13, scope: !423)
!425 = !DILocation(line: 74, column: 16, scope: !415)
!426 = !DILocation(line: 74, column: 9, scope: !415)
!427 = !DILocation(line: 75, column: 9, scope: !415)
!428 = !DILocation(line: 75, column: 27, scope: !415)
!429 = !DILocation(line: 76, column: 16, scope: !415)
!430 = !DILocation(line: 76, column: 14, scope: !415)
!431 = !DILocation(line: 78, column: 71, scope: !410)
!432 = !DILocation(line: 78, column: 69, scope: !410)
!433 = !DILocation(line: 79, column: 5, scope: !410)
!434 = !DILocation(line: 80, column: 1, scope: !410)
!435 = distinct !DISubprogram(name: "goodG2BSink", scope: !3, file: !3, line: 54, type: !343, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !63)
!436 = !DILocalVariable(name: "data", scope: !435, file: !3, line: 56, type: !26)
!437 = !DILocation(line: 56, column: 12, scope: !435)
!438 = !DILocation(line: 56, column: 19, scope: !435)
!439 = !DILocation(line: 57, column: 15, scope: !435)
!440 = !DILocation(line: 57, column: 5, scope: !435)
!441 = !DILocation(line: 59, column: 10, scope: !435)
!442 = !DILocation(line: 59, column: 5, scope: !435)
!443 = !DILocation(line: 60, column: 1, scope: !435)
