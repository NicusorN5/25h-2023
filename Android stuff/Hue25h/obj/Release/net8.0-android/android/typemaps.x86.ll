; ModuleID = 'typemaps.x86.ll'
source_filename = "typemaps.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.TypeMapJava = type {
	i32, ; uint32_t module_index
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_name_index
}

%struct.TypeMapModule = type {
	[16 x i8], ; uint8_t module_uuid[16]
	i32, ; uint32_t entry_count
	i32, ; uint32_t duplicate_count
	ptr, ; TypeMapModuleEntry map
	ptr, ; TypeMapModuleEntry duplicate_map
	ptr, ; char* assembly_name
	ptr, ; MonoImage image
	i32, ; uint32_t java_name_width
	ptr ; uint8_t java_map
}

%struct.TypeMapModuleEntry = type {
	i32, ; uint32_t type_token_id
	i32 ; uint32_t java_map_index
}

@map_module_count = dso_local local_unnamed_addr constant i32 2, align 4

@java_type_count = dso_local local_unnamed_addr constant i32 45, align 4

; Managed modules map
@map_modules = dso_local local_unnamed_addr global [2 x %struct.TypeMapModule] [
	%struct.TypeMapModule {
		[16 x i8] c"\03\5C_\9E}X,A\A3\93\10\9A\F5\08\E0\D2", ; module_uuid: 9e5f5c03-587d-412c-a393-109af508e0d2
		i32 43, ; uint32_t entry_count (0x2b)
		i32 12, ; uint32_t duplicate_count (0xc)
		ptr @module0_managed_to_java, ; TypeMapModuleEntry* map
		ptr @module0_managed_to_java_duplicates, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.0_assembly_name, ; assembly_name: Mono.Android
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	}, ; 0
	%struct.TypeMapModule {
		[16 x i8] c"\040\DA2Z\CE\E4H\A6\F9,\CE\00\EE\FD\10", ; module_uuid: 32da3004-ce5a-48e4-a6f9-2cce00eefd10
		i32 2, ; uint32_t entry_count (0x2)
		i32 0, ; uint32_t duplicate_count (0x0)
		ptr @module1_managed_to_java, ; TypeMapModuleEntry* map
		ptr null, ; TypeMapModuleEntry* duplicate_map
		ptr @.TypeMapModule.1_assembly_name, ; assembly_name: Hue25h
		ptr null, ; MonoImage* image
		i32 0, ; uint32_t java_name_width (0x0)
		ptr null; uint8_t* java_map (0x0)
	} ; 1
], align 4

; Java types name hashes
@map_java_hashes = dso_local local_unnamed_addr constant [45 x i32] [
	i32 12341354, ; 0: 0xbc506a => java/lang/Object
	i32 74282880, ; 1: 0x46d7780 => android/view/ViewGroup
	i32 393371378, ; 2: 0x17725ef2 => mono/java/lang/RunnableImplementor
	i32 531198748, ; 3: 0x1fa9731c => mono/android/runtime/OutputStreamAdapter
	i32 581097368, ; 4: 0x22a2d798 => java/nio/channels/FileChannel
	i32 591810476, ; 5: 0x23464fac => android/os/Bundle
	i32 780987551, ; 6: 0x2e8cec9f => java/io/PrintWriter
	i32 806800039, ; 7: 0x3016caa7 => java/lang/Thread
	i32 1055644286, ; 8: 0x3eebda7e => android/widget/AbsoluteLayout
	i32 1298454265, ; 9: 0x4d64d6f9 => java/lang/Throwable
	i32 1348172419, ; 10: 0x505b7a83 => android/app/ActionBar
	i32 1489594546, ; 11: 0x58c968b2 => java/nio/channels/spi/AbstractInterruptibleChannel
	i32 1586851388, ; 12: 0x5e956e3c => android/os/Handler
	i32 1646348278, ; 13: 0x622147f6 => android/view/View
	i32 1758490869, ; 14: 0x68d070f5 => android/os/BaseBundle
	i32 1851730788, ; 15: 0x6e5f2b64 => java/lang/Runnable
	i32 1944129628, ; 16: 0x73e1105c => java/io/OutputStream
	i32 1985929388, ; 17: 0x765ee0ac => android/app/Activity
	i32 2027782872, ; 18: 0x78dd82d8 => android/view/ContextThemeWrapper
	i32 2284656609, ; 19: 0x882d17e1 => android/app/Application
	i32 2484873381, ; 20: 0x941c28a5 => android/webkit/WebSettings
	i32 2558143838, ; 21: 0x987a2d5e => java/io/FileInputStream
	i32 2675615863, ; 22: 0x9f7aa877 => android/webkit/WebViewClient
	i32 2815615939, ; 23: 0xa7d2e3c3 => android/os/Build
	i32 2874673969, ; 24: 0xab580b31 => java/lang/StackTraceElement
	i32 2933762856, ; 25: 0xaeddab28 => android/util/AttributeSet
	i32 2942792700, ; 26: 0xaf6773fc => java/lang/Exception
	i32 2983720033, ; 27: 0xb1d7f461 => mono/android/TypeManager
	i32 3032808825, ; 28: 0xb4c4fd79 => java/io/StringWriter
	i32 3074039996, ; 29: 0xb73a20bc => crc64050f43a66434659d/MainActivity
	i32 3576242387, ; 30: 0xd52920d3 => android/runtime/JavaProxyThrowable
	i32 3666243682, ; 31: 0xda867062 => java/lang/String
	i32 3715861037, ; 32: 0xdd7b8a2d => android/os/Build$VERSION
	i32 3763853270, ; 33: 0xe057d7d6 => android/view/Window
	i32 3882570516, ; 34: 0xe76b5314 => java/lang/Class
	i32 3884080736, ; 35: 0xe7825e60 => android/webkit/WebView
	i32 3900581163, ; 36: 0xe87e252b => java/io/InputStream
	i32 3969984744, ; 37: 0xeca128e8 => mono/android/runtime/InputStreamAdapter
	i32 3993327007, ; 38: 0xee05559f => android/content/ContextWrapper
	i32 4020308495, ; 39: 0xefa10a0f => java/lang/Error
	i32 4051772911, ; 40: 0xf18125ef => android/content/Context
	i32 4101363546, ; 41: 0xf475d75a => java/io/Writer
	i32 4118878202, ; 42: 0xf58117fa => android/os/Looper
	i32 4157808693, ; 43: 0xf7d32035 => java/io/IOException
	i32 4243141098 ; 44: 0xfce931ea => crc64050f43a66434659d/MainActivity_WebClient
], align 4

@module0_managed_to_java = internal dso_local constant [43 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554487, ; uint32_t type_token_id (0x2000037)
		i32 8; uint32_t java_map_index (0x8)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554488, ; uint32_t type_token_id (0x2000038)
		i32 20; uint32_t java_map_index (0x14)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554490, ; uint32_t type_token_id (0x200003a)
		i32 35; uint32_t java_map_index (0x23)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554491, ; uint32_t type_token_id (0x200003b)
		i32 22; uint32_t java_map_index (0x16)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554492, ; uint32_t type_token_id (0x200003c)
		i32 25; uint32_t java_map_index (0x19)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554494, ; uint32_t type_token_id (0x200003e)
		i32 14; uint32_t java_map_index (0xe)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554495, ; uint32_t type_token_id (0x200003f)
		i32 23; uint32_t java_map_index (0x17)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554496, ; uint32_t type_token_id (0x2000040)
		i32 32; uint32_t java_map_index (0x20)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554497, ; uint32_t type_token_id (0x2000041)
		i32 5; uint32_t java_map_index (0x5)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554498, ; uint32_t type_token_id (0x2000042)
		i32 12; uint32_t java_map_index (0xc)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554499, ; uint32_t type_token_id (0x2000043)
		i32 42; uint32_t java_map_index (0x2a)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554502, ; uint32_t type_token_id (0x2000046)
		i32 10; uint32_t java_map_index (0xa)
	}, ; 11
	%struct.TypeMapModuleEntry {
		i32 33554504, ; uint32_t type_token_id (0x2000048)
		i32 17; uint32_t java_map_index (0x11)
	}, ; 12
	%struct.TypeMapModuleEntry {
		i32 33554505, ; uint32_t type_token_id (0x2000049)
		i32 19; uint32_t java_map_index (0x13)
	}, ; 13
	%struct.TypeMapModuleEntry {
		i32 33554508, ; uint32_t type_token_id (0x200004c)
		i32 18; uint32_t java_map_index (0x12)
	}, ; 14
	%struct.TypeMapModuleEntry {
		i32 33554509, ; uint32_t type_token_id (0x200004d)
		i32 13; uint32_t java_map_index (0xd)
	}, ; 15
	%struct.TypeMapModuleEntry {
		i32 33554510, ; uint32_t type_token_id (0x200004e)
		i32 1; uint32_t java_map_index (0x1)
	}, ; 16
	%struct.TypeMapModuleEntry {
		i32 33554512, ; uint32_t type_token_id (0x2000050)
		i32 33; uint32_t java_map_index (0x21)
	}, ; 17
	%struct.TypeMapModuleEntry {
		i32 33554534, ; uint32_t type_token_id (0x2000066)
		i32 37; uint32_t java_map_index (0x25)
	}, ; 18
	%struct.TypeMapModuleEntry {
		i32 33554536, ; uint32_t type_token_id (0x2000068)
		i32 30; uint32_t java_map_index (0x1e)
	}, ; 19
	%struct.TypeMapModuleEntry {
		i32 33554547, ; uint32_t type_token_id (0x2000073)
		i32 3; uint32_t java_map_index (0x3)
	}, ; 20
	%struct.TypeMapModuleEntry {
		i32 33554555, ; uint32_t type_token_id (0x200007b)
		i32 40; uint32_t java_map_index (0x28)
	}, ; 21
	%struct.TypeMapModuleEntry {
		i32 33554557, ; uint32_t type_token_id (0x200007d)
		i32 38; uint32_t java_map_index (0x26)
	}, ; 22
	%struct.TypeMapModuleEntry {
		i32 33554558, ; uint32_t type_token_id (0x200007e)
		i32 4; uint32_t java_map_index (0x4)
	}, ; 23
	%struct.TypeMapModuleEntry {
		i32 33554560, ; uint32_t type_token_id (0x2000080)
		i32 11; uint32_t java_map_index (0xb)
	}, ; 24
	%struct.TypeMapModuleEntry {
		i32 33554562, ; uint32_t type_token_id (0x2000082)
		i32 21; uint32_t java_map_index (0x15)
	}, ; 25
	%struct.TypeMapModuleEntry {
		i32 33554563, ; uint32_t type_token_id (0x2000083)
		i32 36; uint32_t java_map_index (0x24)
	}, ; 26
	%struct.TypeMapModuleEntry {
		i32 33554565, ; uint32_t type_token_id (0x2000085)
		i32 43; uint32_t java_map_index (0x2b)
	}, ; 27
	%struct.TypeMapModuleEntry {
		i32 33554566, ; uint32_t type_token_id (0x2000086)
		i32 16; uint32_t java_map_index (0x10)
	}, ; 28
	%struct.TypeMapModuleEntry {
		i32 33554568, ; uint32_t type_token_id (0x2000088)
		i32 6; uint32_t java_map_index (0x6)
	}, ; 29
	%struct.TypeMapModuleEntry {
		i32 33554569, ; uint32_t type_token_id (0x2000089)
		i32 28; uint32_t java_map_index (0x1c)
	}, ; 30
	%struct.TypeMapModuleEntry {
		i32 33554570, ; uint32_t type_token_id (0x200008a)
		i32 41; uint32_t java_map_index (0x29)
	}, ; 31
	%struct.TypeMapModuleEntry {
		i32 33554572, ; uint32_t type_token_id (0x200008c)
		i32 34; uint32_t java_map_index (0x22)
	}, ; 32
	%struct.TypeMapModuleEntry {
		i32 33554573, ; uint32_t type_token_id (0x200008d)
		i32 39; uint32_t java_map_index (0x27)
	}, ; 33
	%struct.TypeMapModuleEntry {
		i32 33554574, ; uint32_t type_token_id (0x200008e)
		i32 26; uint32_t java_map_index (0x1a)
	}, ; 34
	%struct.TypeMapModuleEntry {
		i32 33554575, ; uint32_t type_token_id (0x200008f)
		i32 15; uint32_t java_map_index (0xf)
	}, ; 35
	%struct.TypeMapModuleEntry {
		i32 33554577, ; uint32_t type_token_id (0x2000091)
		i32 0; uint32_t java_map_index (0x0)
	}, ; 36
	%struct.TypeMapModuleEntry {
		i32 33554578, ; uint32_t type_token_id (0x2000092)
		i32 24; uint32_t java_map_index (0x18)
	}, ; 37
	%struct.TypeMapModuleEntry {
		i32 33554579, ; uint32_t type_token_id (0x2000093)
		i32 31; uint32_t java_map_index (0x1f)
	}, ; 38
	%struct.TypeMapModuleEntry {
		i32 33554581, ; uint32_t type_token_id (0x2000095)
		i32 7; uint32_t java_map_index (0x7)
	}, ; 39
	%struct.TypeMapModuleEntry {
		i32 33554582, ; uint32_t type_token_id (0x2000096)
		i32 2; uint32_t java_map_index (0x2)
	}, ; 40
	%struct.TypeMapModuleEntry {
		i32 33554583, ; uint32_t type_token_id (0x2000097)
		i32 9; uint32_t java_map_index (0x9)
	}, ; 41
	%struct.TypeMapModuleEntry {
		i32 33554594, ; uint32_t type_token_id (0x20000a2)
		i32 27; uint32_t java_map_index (0x1b)
	} ; 42
], align 4

@module0_managed_to_java_duplicates = internal dso_local constant [12 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554489, ; uint32_t type_token_id (0x2000039)
		i32 20; uint32_t java_map_index (0x14)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554493, ; uint32_t type_token_id (0x200003d)
		i32 25; uint32_t java_map_index (0x19)
	}, ; 1
	%struct.TypeMapModuleEntry {
		i32 33554503, ; uint32_t type_token_id (0x2000047)
		i32 10; uint32_t java_map_index (0xa)
	}, ; 2
	%struct.TypeMapModuleEntry {
		i32 33554511, ; uint32_t type_token_id (0x200004f)
		i32 1; uint32_t java_map_index (0x1)
	}, ; 3
	%struct.TypeMapModuleEntry {
		i32 33554513, ; uint32_t type_token_id (0x2000051)
		i32 33; uint32_t java_map_index (0x21)
	}, ; 4
	%struct.TypeMapModuleEntry {
		i32 33554556, ; uint32_t type_token_id (0x200007c)
		i32 40; uint32_t java_map_index (0x28)
	}, ; 5
	%struct.TypeMapModuleEntry {
		i32 33554559, ; uint32_t type_token_id (0x200007f)
		i32 4; uint32_t java_map_index (0x4)
	}, ; 6
	%struct.TypeMapModuleEntry {
		i32 33554561, ; uint32_t type_token_id (0x2000081)
		i32 11; uint32_t java_map_index (0xb)
	}, ; 7
	%struct.TypeMapModuleEntry {
		i32 33554564, ; uint32_t type_token_id (0x2000084)
		i32 36; uint32_t java_map_index (0x24)
	}, ; 8
	%struct.TypeMapModuleEntry {
		i32 33554567, ; uint32_t type_token_id (0x2000087)
		i32 16; uint32_t java_map_index (0x10)
	}, ; 9
	%struct.TypeMapModuleEntry {
		i32 33554571, ; uint32_t type_token_id (0x200008b)
		i32 41; uint32_t java_map_index (0x29)
	}, ; 10
	%struct.TypeMapModuleEntry {
		i32 33554576, ; uint32_t type_token_id (0x2000090)
		i32 15; uint32_t java_map_index (0xf)
	} ; 11
], align 4

@module1_managed_to_java = internal dso_local constant [2 x %struct.TypeMapModuleEntry] [
	%struct.TypeMapModuleEntry {
		i32 33554434, ; uint32_t type_token_id (0x2000002)
		i32 29; uint32_t java_map_index (0x1d)
	}, ; 0
	%struct.TypeMapModuleEntry {
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 44; uint32_t java_map_index (0x2c)
	} ; 1
], align 4

; Java to managed map
@map_java = dso_local local_unnamed_addr constant [45 x %struct.TypeMapJava] [
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554577, ; uint32_t type_token_id (0x2000091)
		i32 36; uint32_t java_name_index (0x24)
	}, ; 0
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554510, ; uint32_t type_token_id (0x200004e)
		i32 16; uint32_t java_name_index (0x10)
	}, ; 1
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554582, ; uint32_t type_token_id (0x2000096)
		i32 40; uint32_t java_name_index (0x28)
	}, ; 2
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554547, ; uint32_t type_token_id (0x2000073)
		i32 20; uint32_t java_name_index (0x14)
	}, ; 3
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554558, ; uint32_t type_token_id (0x200007e)
		i32 23; uint32_t java_name_index (0x17)
	}, ; 4
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554497, ; uint32_t type_token_id (0x2000041)
		i32 8; uint32_t java_name_index (0x8)
	}, ; 5
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554568, ; uint32_t type_token_id (0x2000088)
		i32 29; uint32_t java_name_index (0x1d)
	}, ; 6
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554581, ; uint32_t type_token_id (0x2000095)
		i32 39; uint32_t java_name_index (0x27)
	}, ; 7
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554487, ; uint32_t type_token_id (0x2000037)
		i32 0; uint32_t java_name_index (0x0)
	}, ; 8
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554583, ; uint32_t type_token_id (0x2000097)
		i32 41; uint32_t java_name_index (0x29)
	}, ; 9
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554502, ; uint32_t type_token_id (0x2000046)
		i32 11; uint32_t java_name_index (0xb)
	}, ; 10
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554560, ; uint32_t type_token_id (0x2000080)
		i32 24; uint32_t java_name_index (0x18)
	}, ; 11
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554498, ; uint32_t type_token_id (0x2000042)
		i32 9; uint32_t java_name_index (0x9)
	}, ; 12
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554509, ; uint32_t type_token_id (0x200004d)
		i32 15; uint32_t java_name_index (0xf)
	}, ; 13
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554494, ; uint32_t type_token_id (0x200003e)
		i32 5; uint32_t java_name_index (0x5)
	}, ; 14
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 35; uint32_t java_name_index (0x23)
	}, ; 15
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554566, ; uint32_t type_token_id (0x2000086)
		i32 28; uint32_t java_name_index (0x1c)
	}, ; 16
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554504, ; uint32_t type_token_id (0x2000048)
		i32 12; uint32_t java_name_index (0xc)
	}, ; 17
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554508, ; uint32_t type_token_id (0x200004c)
		i32 14; uint32_t java_name_index (0xe)
	}, ; 18
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554505, ; uint32_t type_token_id (0x2000049)
		i32 13; uint32_t java_name_index (0xd)
	}, ; 19
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554488, ; uint32_t type_token_id (0x2000038)
		i32 1; uint32_t java_name_index (0x1)
	}, ; 20
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554562, ; uint32_t type_token_id (0x2000082)
		i32 25; uint32_t java_name_index (0x19)
	}, ; 21
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554491, ; uint32_t type_token_id (0x200003b)
		i32 3; uint32_t java_name_index (0x3)
	}, ; 22
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554495, ; uint32_t type_token_id (0x200003f)
		i32 6; uint32_t java_name_index (0x6)
	}, ; 23
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554578, ; uint32_t type_token_id (0x2000092)
		i32 37; uint32_t java_name_index (0x25)
	}, ; 24
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 0, ; uint32_t type_token_id (0x0)
		i32 4; uint32_t java_name_index (0x4)
	}, ; 25
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554574, ; uint32_t type_token_id (0x200008e)
		i32 34; uint32_t java_name_index (0x22)
	}, ; 26
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554594, ; uint32_t type_token_id (0x20000a2)
		i32 42; uint32_t java_name_index (0x2a)
	}, ; 27
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554569, ; uint32_t type_token_id (0x2000089)
		i32 30; uint32_t java_name_index (0x1e)
	}, ; 28
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554434, ; uint32_t type_token_id (0x2000002)
		i32 43; uint32_t java_name_index (0x2b)
	}, ; 29
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554536, ; uint32_t type_token_id (0x2000068)
		i32 19; uint32_t java_name_index (0x13)
	}, ; 30
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554579, ; uint32_t type_token_id (0x2000093)
		i32 38; uint32_t java_name_index (0x26)
	}, ; 31
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554496, ; uint32_t type_token_id (0x2000040)
		i32 7; uint32_t java_name_index (0x7)
	}, ; 32
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554512, ; uint32_t type_token_id (0x2000050)
		i32 17; uint32_t java_name_index (0x11)
	}, ; 33
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554572, ; uint32_t type_token_id (0x200008c)
		i32 32; uint32_t java_name_index (0x20)
	}, ; 34
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554490, ; uint32_t type_token_id (0x200003a)
		i32 2; uint32_t java_name_index (0x2)
	}, ; 35
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554563, ; uint32_t type_token_id (0x2000083)
		i32 26; uint32_t java_name_index (0x1a)
	}, ; 36
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554534, ; uint32_t type_token_id (0x2000066)
		i32 18; uint32_t java_name_index (0x12)
	}, ; 37
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554557, ; uint32_t type_token_id (0x200007d)
		i32 22; uint32_t java_name_index (0x16)
	}, ; 38
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554573, ; uint32_t type_token_id (0x200008d)
		i32 33; uint32_t java_name_index (0x21)
	}, ; 39
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554555, ; uint32_t type_token_id (0x200007b)
		i32 21; uint32_t java_name_index (0x15)
	}, ; 40
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554570, ; uint32_t type_token_id (0x200008a)
		i32 31; uint32_t java_name_index (0x1f)
	}, ; 41
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554499, ; uint32_t type_token_id (0x2000043)
		i32 10; uint32_t java_name_index (0xa)
	}, ; 42
	%struct.TypeMapJava {
		i32 0, ; uint32_t module_index (0x0)
		i32 33554565, ; uint32_t type_token_id (0x2000085)
		i32 27; uint32_t java_name_index (0x1b)
	}, ; 43
	%struct.TypeMapJava {
		i32 1, ; uint32_t module_index (0x1)
		i32 33554436, ; uint32_t type_token_id (0x2000004)
		i32 44; uint32_t java_name_index (0x2c)
	} ; 44
], align 4

; Java type names
@java_type_names = dso_local local_unnamed_addr constant [45 x ptr] [
	ptr @.str.0, ; 0
	ptr @.str.1, ; 1
	ptr @.str.2, ; 2
	ptr @.str.3, ; 3
	ptr @.str.4, ; 4
	ptr @.str.5, ; 5
	ptr @.str.6, ; 6
	ptr @.str.7, ; 7
	ptr @.str.8, ; 8
	ptr @.str.9, ; 9
	ptr @.str.10, ; 10
	ptr @.str.11, ; 11
	ptr @.str.12, ; 12
	ptr @.str.13, ; 13
	ptr @.str.14, ; 14
	ptr @.str.15, ; 15
	ptr @.str.16, ; 16
	ptr @.str.17, ; 17
	ptr @.str.18, ; 18
	ptr @.str.19, ; 19
	ptr @.str.20, ; 20
	ptr @.str.21, ; 21
	ptr @.str.22, ; 22
	ptr @.str.23, ; 23
	ptr @.str.24, ; 24
	ptr @.str.25, ; 25
	ptr @.str.26, ; 26
	ptr @.str.27, ; 27
	ptr @.str.28, ; 28
	ptr @.str.29, ; 29
	ptr @.str.30, ; 30
	ptr @.str.31, ; 31
	ptr @.str.32, ; 32
	ptr @.str.33, ; 33
	ptr @.str.34, ; 34
	ptr @.str.35, ; 35
	ptr @.str.36, ; 36
	ptr @.str.37, ; 37
	ptr @.str.38, ; 38
	ptr @.str.39, ; 39
	ptr @.str.40, ; 40
	ptr @.str.41, ; 41
	ptr @.str.42, ; 42
	ptr @.str.43, ; 43
	ptr @.str.44 ; 44
], align 4

; Strings
@.str.0 = private unnamed_addr constant [30 x i8] c"android/widget/AbsoluteLayout\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"android/webkit/WebSettings\00", align 1
@.str.2 = private unnamed_addr constant [23 x i8] c"android/webkit/WebView\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"android/webkit/WebViewClient\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"android/util/AttributeSet\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"android/os/BaseBundle\00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"android/os/Build\00", align 1
@.str.7 = private unnamed_addr constant [25 x i8] c"android/os/Build$VERSION\00", align 1
@.str.8 = private unnamed_addr constant [18 x i8] c"android/os/Bundle\00", align 1
@.str.9 = private unnamed_addr constant [19 x i8] c"android/os/Handler\00", align 1
@.str.10 = private unnamed_addr constant [18 x i8] c"android/os/Looper\00", align 1
@.str.11 = private unnamed_addr constant [22 x i8] c"android/app/ActionBar\00", align 1
@.str.12 = private unnamed_addr constant [21 x i8] c"android/app/Activity\00", align 1
@.str.13 = private unnamed_addr constant [24 x i8] c"android/app/Application\00", align 1
@.str.14 = private unnamed_addr constant [33 x i8] c"android/view/ContextThemeWrapper\00", align 1
@.str.15 = private unnamed_addr constant [18 x i8] c"android/view/View\00", align 1
@.str.16 = private unnamed_addr constant [23 x i8] c"android/view/ViewGroup\00", align 1
@.str.17 = private unnamed_addr constant [20 x i8] c"android/view/Window\00", align 1
@.str.18 = private unnamed_addr constant [40 x i8] c"mono/android/runtime/InputStreamAdapter\00", align 1
@.str.19 = private unnamed_addr constant [35 x i8] c"android/runtime/JavaProxyThrowable\00", align 1
@.str.20 = private unnamed_addr constant [41 x i8] c"mono/android/runtime/OutputStreamAdapter\00", align 1
@.str.21 = private unnamed_addr constant [24 x i8] c"android/content/Context\00", align 1
@.str.22 = private unnamed_addr constant [31 x i8] c"android/content/ContextWrapper\00", align 1
@.str.23 = private unnamed_addr constant [30 x i8] c"java/nio/channels/FileChannel\00", align 1
@.str.24 = private unnamed_addr constant [51 x i8] c"java/nio/channels/spi/AbstractInterruptibleChannel\00", align 1
@.str.25 = private unnamed_addr constant [24 x i8] c"java/io/FileInputStream\00", align 1
@.str.26 = private unnamed_addr constant [20 x i8] c"java/io/InputStream\00", align 1
@.str.27 = private unnamed_addr constant [20 x i8] c"java/io/IOException\00", align 1
@.str.28 = private unnamed_addr constant [21 x i8] c"java/io/OutputStream\00", align 1
@.str.29 = private unnamed_addr constant [20 x i8] c"java/io/PrintWriter\00", align 1
@.str.30 = private unnamed_addr constant [21 x i8] c"java/io/StringWriter\00", align 1
@.str.31 = private unnamed_addr constant [15 x i8] c"java/io/Writer\00", align 1
@.str.32 = private unnamed_addr constant [16 x i8] c"java/lang/Class\00", align 1
@.str.33 = private unnamed_addr constant [16 x i8] c"java/lang/Error\00", align 1
@.str.34 = private unnamed_addr constant [20 x i8] c"java/lang/Exception\00", align 1
@.str.35 = private unnamed_addr constant [19 x i8] c"java/lang/Runnable\00", align 1
@.str.36 = private unnamed_addr constant [17 x i8] c"java/lang/Object\00", align 1
@.str.37 = private unnamed_addr constant [28 x i8] c"java/lang/StackTraceElement\00", align 1
@.str.38 = private unnamed_addr constant [17 x i8] c"java/lang/String\00", align 1
@.str.39 = private unnamed_addr constant [17 x i8] c"java/lang/Thread\00", align 1
@.str.40 = private unnamed_addr constant [35 x i8] c"mono/java/lang/RunnableImplementor\00", align 1
@.str.41 = private unnamed_addr constant [20 x i8] c"java/lang/Throwable\00", align 1
@.str.42 = private unnamed_addr constant [25 x i8] c"mono/android/TypeManager\00", align 1
@.str.43 = private unnamed_addr constant [35 x i8] c"crc64050f43a66434659d/MainActivity\00", align 1
@.str.44 = private unnamed_addr constant [45 x i8] c"crc64050f43a66434659d/MainActivity_WebClient\00", align 1

;TypeMapModule
@.TypeMapModule.0_assembly_name = private unnamed_addr constant [13 x i8] c"Mono.Android\00", align 1
@.TypeMapModule.1_assembly_name = private unnamed_addr constant [7 x i8] c"Hue25h\00", align 1

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
