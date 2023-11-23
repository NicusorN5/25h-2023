; ModuleID = 'compressed_assemblies.armeabi-v7a.ll'
source_filename = "compressed_assemblies.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.CompressedAssemblies = type {
	i32, ; uint32_t count
	ptr ; CompressedAssemblyDescriptor descriptors
}

%struct.CompressedAssemblyDescriptor = type {
	i32, ; uint32_t uncompressed_file_size
	i8, ; bool loaded
	ptr ; uint8_t data
}

@compressed_assemblies = dso_local local_unnamed_addr global %struct.CompressedAssemblies {
	i32 13, ; uint32_t count (0xd)
	ptr @compressed_assembly_descriptors; CompressedAssemblyDescriptor* descriptors
}, align 4

@compressed_assembly_descriptors = internal dso_local global [13 x %struct.CompressedAssemblyDescriptor] [
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size (0x1600)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_0; uint8_t* data (0x0)
	}, ; 0
	%struct.CompressedAssemblyDescriptor {
		i32 129024, ; uint32_t uncompressed_file_size (0x1f800)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_1; uint8_t* data (0x0)
	}, ; 1
	%struct.CompressedAssemblyDescriptor {
		i32 18976, ; uint32_t uncompressed_file_size (0x4a20)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_2; uint8_t* data (0x0)
	}, ; 2
	%struct.CompressedAssemblyDescriptor {
		i32 195072, ; uint32_t uncompressed_file_size (0x2fa00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_3; uint8_t* data (0x0)
	}, ; 3
	%struct.CompressedAssemblyDescriptor {
		i32 10752, ; uint32_t uncompressed_file_size (0x2a00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_4; uint8_t* data (0x0)
	}, ; 4
	%struct.CompressedAssemblyDescriptor {
		i32 15872, ; uint32_t uncompressed_file_size (0x3e00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_5; uint8_t* data (0x0)
	}, ; 5
	%struct.CompressedAssemblyDescriptor {
		i32 8192, ; uint32_t uncompressed_file_size (0x2000)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_6; uint8_t* data (0x0)
	}, ; 6
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size (0x1600)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_7; uint8_t* data (0x0)
	}, ; 7
	%struct.CompressedAssemblyDescriptor {
		i32 2560, ; uint32_t uncompressed_file_size (0xa00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_8; uint8_t* data (0x0)
	}, ; 8
	%struct.CompressedAssemblyDescriptor {
		i32 1101312, ; uint32_t uncompressed_file_size (0x10ce00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_9; uint8_t* data (0x0)
	}, ; 9
	%struct.CompressedAssemblyDescriptor {
		i32 1088512, ; uint32_t uncompressed_file_size (0x109c00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_10; uint8_t* data (0x0)
	}, ; 10
	%struct.CompressedAssemblyDescriptor {
		i32 1088512, ; uint32_t uncompressed_file_size (0x109c00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_11; uint8_t* data (0x0)
	}, ; 11
	%struct.CompressedAssemblyDescriptor {
		i32 1182208, ; uint32_t uncompressed_file_size (0x120a00)
		i8 0, ; bool loaded
		ptr @__compressedAssemblyData_12; uint8_t* data (0x0)
	} ; 12
], align 4

@__compressedAssemblyData_0 = internal dso_local global [5632 x i8] zeroinitializer, align 1
@__compressedAssemblyData_1 = internal dso_local global [129024 x i8] zeroinitializer, align 1
@__compressedAssemblyData_2 = internal dso_local global [18976 x i8] zeroinitializer, align 1
@__compressedAssemblyData_3 = internal dso_local global [195072 x i8] zeroinitializer, align 1
@__compressedAssemblyData_4 = internal dso_local global [10752 x i8] zeroinitializer, align 1
@__compressedAssemblyData_5 = internal dso_local global [15872 x i8] zeroinitializer, align 1
@__compressedAssemblyData_6 = internal dso_local global [8192 x i8] zeroinitializer, align 1
@__compressedAssemblyData_7 = internal dso_local global [5632 x i8] zeroinitializer, align 1
@__compressedAssemblyData_8 = internal dso_local global [2560 x i8] zeroinitializer, align 1
@__compressedAssemblyData_9 = internal dso_local global [1101312 x i8] zeroinitializer, align 1
@__compressedAssemblyData_10 = internal dso_local global [1088512 x i8] zeroinitializer, align 1
@__compressedAssemblyData_11 = internal dso_local global [1088512 x i8] zeroinitializer, align 1
@__compressedAssemblyData_12 = internal dso_local global [1182208 x i8] zeroinitializer, align 1

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
!7 = !{i32 1, !"min_enum_size", i32 4}
