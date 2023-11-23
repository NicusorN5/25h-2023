; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [10 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [20 x i32] [
	i32 117431740, ; 0: System.Runtime.InteropServices => 0x6ffddbc => 4
	i32 395744057, ; 1: _Microsoft.Android.Resource.Designer => 0x17969339 => 0
	i32 1288529016, ; 2: Hue25h.dll => 0x4ccd6478 => 1
	i32 1324164729, ; 3: System.Linq => 0x4eed2679 => 3
	i32 1657153582, ; 4: System.Runtime => 0x62c6282e => 5
	i32 1780572499, ; 5: Mono.Android.Runtime.dll => 0x6a216153 => 8
	i32 2079903147, ; 6: System.Runtime.dll => 0x7bf8cdab => 5
	i32 2127167465, ; 7: System.Console => 0x7ec9ffe9 => 2
	i32 2305521784, ; 8: System.Private.CoreLib.dll => 0x896b7878 => 6
	i32 2435356389, ; 9: System.Console.dll => 0x912896e5 => 2
	i32 2475788418, ; 10: Java.Interop.dll => 0x93918882 => 7
	i32 2642122765, ; 11: Hue25h => 0x9d7b980d => 1
	i32 2909740682, ; 12: System.Private.CoreLib => 0xad6f1e8a => 6
	i32 3038032645, ; 13: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 0
	i32 3059408633, ; 14: Mono.Android.Runtime => 0xb65adef9 => 8
	i32 3366347497, ; 15: Java.Interop => 0xc8a662e9 => 7
	i32 3476120550, ; 16: Mono.Android => 0xcf3163e6 => 9
	i32 3608519521, ; 17: System.Linq.dll => 0xd715a361 => 3
	i32 3672681054, ; 18: Mono.Android.dll => 0xdae8aa5e => 9
	i32 3849253459 ; 19: System.Runtime.InteropServices.dll => 0xe56ef253 => 4
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [20 x i32] [
	i32 4, ; 0
	i32 0, ; 1
	i32 1, ; 2
	i32 3, ; 3
	i32 5, ; 4
	i32 8, ; 5
	i32 5, ; 6
	i32 2, ; 7
	i32 6, ; 8
	i32 2, ; 9
	i32 7, ; 10
	i32 1, ; 11
	i32 6, ; 12
	i32 0, ; 13
	i32 8, ; 14
	i32 7, ; 15
	i32 9, ; 16
	i32 3, ; 17
	i32 9, ; 18
	i32 4 ; 19
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
