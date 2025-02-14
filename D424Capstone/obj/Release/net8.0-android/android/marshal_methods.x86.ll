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

@assembly_image_cache = dso_local local_unnamed_addr global [131 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [262 x i32] [
	i32 1846355, ; 0: D424Capstone => 0x1c2c53 => 89
	i32 42639949, ; 1: System.Threading.Thread => 0x28aa24d => 122
	i32 67008169, ; 2: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 68219467, ; 3: System.Security.Cryptography.Primitives => 0x410f24b => 116
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 48
	i32 117431740, ; 5: System.Runtime.InteropServices => 0x6ffddbc => 112
	i32 149972175, ; 6: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 116
	i32 159306688, ; 7: System.ComponentModel.Annotations => 0x97ed3c0 => 93
	i32 165246403, ; 8: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 59
	i32 182336117, ; 9: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 78
	i32 195452805, ; 10: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 11: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 12: System.ComponentModel => 0xc38ff48 => 96
	i32 280992041, ; 13: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 14: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 15: Xamarin.AndroidX.Activity.dll => 0x13031348 => 55
	i32 336156722, ; 16: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 17: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 66
	i32 347068432, ; 18: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 53
	i32 356389973, ; 19: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 379916513, ; 20: System.Threading.Thread.dll => 0x16a510e1 => 122
	i32 385762202, ; 21: System.Memory.dll => 0x16fe439a => 103
	i32 395744057, ; 22: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 23: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 24: System.Collections => 0x1a61054f => 92
	i32 450948140, ; 25: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 65
	i32 469710990, ; 26: System.dll => 0x1bff388e => 125
	i32 498788369, ; 27: System.ObjectModel => 0x1dbae811 => 108
	i32 500358224, ; 28: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 29: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 504143952, ; 30: Plugin.LocalNotification.dll => 0x1e0ca050 => 49
	i32 513247710, ; 31: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 43
	i32 539058512, ; 32: Microsoft.Extensions.Logging => 0x20216150 => 40
	i32 592146354, ; 33: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 613668793, ; 34: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 115
	i32 627609679, ; 35: Xamarin.AndroidX.CustomView => 0x2568904f => 63
	i32 627931235, ; 36: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 37: System.Text.Encodings.Web.dll => 0x27787397 => 119
	i32 663517072, ; 38: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 79
	i32 672442732, ; 39: System.Collections.Concurrent => 0x2814a96c => 90
	i32 688181140, ; 40: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 706645707, ; 41: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 42: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 43: System.Runtime.Loader.dll => 0x2b15ed29 => 113
	i32 748832960, ; 44: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 51
	i32 759454413, ; 45: System.Net.Requests => 0x2d445acd => 106
	i32 775507847, ; 46: System.IO.Compression => 0x2e394f87 => 100
	i32 777317022, ; 47: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 48: Microsoft.Extensions.Options => 0x2f0980eb => 42
	i32 823281589, ; 49: System.Private.Uri.dll => 0x311247b5 => 109
	i32 830298997, ; 50: System.IO.Compression.Brotli => 0x317d5b75 => 99
	i32 904024072, ; 51: System.ComponentModel.Primitives.dll => 0x35e25008 => 94
	i32 926902833, ; 52: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 967690846, ; 53: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 66
	i32 992768348, ; 54: System.Collections.dll => 0x3b2c715c => 92
	i32 1012816738, ; 55: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 76
	i32 1028951442, ; 56: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 39
	i32 1029334545, ; 57: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 58: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 56
	i32 1044663988, ; 59: System.Linq.Expressions.dll => 0x3e444eb4 => 101
	i32 1052210849, ; 60: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 68
	i32 1082857460, ; 61: System.ComponentModel.TypeConverter => 0x408b17f4 => 95
	i32 1084122840, ; 62: Xamarin.Kotlin.StdLib => 0x409e66d8 => 87
	i32 1098259244, ; 63: System => 0x41761b2c => 125
	i32 1118262833, ; 64: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 65: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 66: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 73
	i32 1203215381, ; 67: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1234928153, ; 68: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 69: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1292207520, ; 70: SQLitePCLRaw.core.dll => 0x4d0585a0 => 52
	i32 1293217323, ; 71: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 64
	i32 1324164729, ; 72: System.Linq => 0x4eed2679 => 102
	i32 1373134921, ; 73: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 74: Xamarin.AndroidX.SavedState => 0x52114ed3 => 76
	i32 1406073936, ; 75: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 60
	i32 1430672901, ; 76: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 77: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 78: System.IO.Compression.dll => 0x57261233 => 100
	i32 1469204771, ; 79: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 57
	i32 1470490898, ; 80: Microsoft.Extensions.Primitives => 0x57a5e912 => 43
	i32 1480492111, ; 81: System.IO.Compression.Brotli.dll => 0x583e844f => 99
	i32 1493001747, ; 82: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 83: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1524747670, ; 84: Plugin.LocalNotification => 0x5ae1cd96 => 49
	i32 1543031311, ; 85: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 121
	i32 1551623176, ; 86: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 87: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 70
	i32 1624863272, ; 88: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 81
	i32 1636350590, ; 89: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 62
	i32 1639515021, ; 90: System.Net.Http.dll => 0x61b9038d => 104
	i32 1639986890, ; 91: System.Text.RegularExpressions => 0x61c036ca => 121
	i32 1657153582, ; 92: System.Runtime => 0x62c6282e => 114
	i32 1658251792, ; 93: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 82
	i32 1677501392, ; 94: System.Net.Primitives.dll => 0x63fca3d0 => 105
	i32 1679769178, ; 95: System.Security.Cryptography => 0x641f3e5a => 117
	i32 1711441057, ; 96: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 53
	i32 1729485958, ; 97: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 58
	i32 1736233607, ; 98: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 99: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1766324549, ; 100: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 78
	i32 1770582343, ; 101: Microsoft.Extensions.Logging.dll => 0x6988f147 => 40
	i32 1780572499, ; 102: Mono.Android.Runtime.dll => 0x6a216153 => 129
	i32 1782862114, ; 103: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 104: Xamarin.AndroidX.Fragment => 0x6a96652d => 65
	i32 1793755602, ; 105: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 106: Xamarin.AndroidX.Loader => 0x6bcd3296 => 70
	i32 1813058853, ; 107: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 87
	i32 1813201214, ; 108: Xamarin.Google.Android.Material => 0x6c13413e => 82
	i32 1818569960, ; 109: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 74
	i32 1824175904, ; 110: System.Text.Encoding.Extensions => 0x6cbab720 => 118
	i32 1828688058, ; 111: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 41
	i32 1842015223, ; 112: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 113: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 114: System.Linq.Expressions => 0x6ec71a65 => 101
	i32 1875935024, ; 115: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1908813208, ; 116: Xamarin.GooglePlayServices.Basement => 0x71c62d98 => 84
	i32 1910275211, ; 117: System.Collections.NonGeneric.dll => 0x71dc7c8b => 91
	i32 1960088917, ; 118: D424Capstone.dll => 0x74d49555 => 89
	i32 1961813231, ; 119: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 77
	i32 1968388702, ; 120: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 36
	i32 2003115576, ; 121: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 122: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 68
	i32 2025202353, ; 123: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 124: System.Private.Xml => 0x79eb68ee => 110
	i32 2055257422, ; 125: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 67
	i32 2066184531, ; 126: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2079903147, ; 127: System.Runtime.dll => 0x7bf8cdab => 114
	i32 2090596640, ; 128: System.Numerics.Vectors => 0x7c9bf920 => 107
	i32 2103459038, ; 129: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 54
	i32 2127167465, ; 130: System.Console => 0x7ec9ffe9 => 97
	i32 2129483829, ; 131: Xamarin.GooglePlayServices.Base.dll => 0x7eed5835 => 83
	i32 2159891885, ; 132: Microsoft.Maui => 0x80bd55ad => 46
	i32 2169148018, ; 133: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 134: Microsoft.Extensions.Options.dll => 0x820d22b3 => 42
	i32 2192057212, ; 135: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 41
	i32 2193016926, ; 136: System.ObjectModel.dll => 0x82b6c85e => 108
	i32 2201107256, ; 137: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 88
	i32 2201231467, ; 138: System.Net.Http => 0x8334206b => 104
	i32 2207618523, ; 139: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 140: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 37
	i32 2270573516, ; 141: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 142: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 75
	i32 2303942373, ; 143: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 144: System.Private.CoreLib.dll => 0x896b7878 => 127
	i32 2340441535, ; 145: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 111
	i32 2353062107, ; 146: System.Net.Primitives => 0x8c40e0db => 105
	i32 2368005991, ; 147: System.Xml.ReaderWriter.dll => 0x8d24e767 => 124
	i32 2371007202, ; 148: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 36
	i32 2395872292, ; 149: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 150: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 151: System.Console.dll => 0x912896e5 => 97
	i32 2465273461, ; 152: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 51
	i32 2471841756, ; 153: netstandard.dll => 0x93554fdc => 126
	i32 2475788418, ; 154: Java.Interop.dll => 0x93918882 => 128
	i32 2480646305, ; 155: Microsoft.Maui.Controls => 0x93dba8a1 => 44
	i32 2550873716, ; 156: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 157: System.Text.Encodings.Web => 0x9930ee42 => 119
	i32 2585220780, ; 158: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 118
	i32 2593496499, ; 159: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 160: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 88
	i32 2617129537, ; 161: System.Private.Xml.dll => 0x9bfe3a41 => 110
	i32 2620871830, ; 162: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 62
	i32 2626831493, ; 163: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 164: System.Runtime.Loader => 0x9ec4cf01 => 113
	i32 2732626843, ; 165: Xamarin.AndroidX.Activity => 0xa2e0939b => 55
	i32 2737747696, ; 166: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 57
	i32 2752995522, ; 167: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 168: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 45
	i32 2764765095, ; 169: Microsoft.Maui.dll => 0xa4caf7a7 => 46
	i32 2778768386, ; 170: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 80
	i32 2785988530, ; 171: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 172: Microsoft.Maui.Graphics => 0xa7008e0b => 48
	i32 2806116107, ; 173: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 174: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 60
	i32 2831556043, ; 175: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2847418871, ; 176: Xamarin.GooglePlayServices.Base => 0xa9b829f7 => 83
	i32 2853208004, ; 177: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 80
	i32 2861189240, ; 178: Microsoft.Maui.Essentials => 0xaa8a4878 => 47
	i32 2909740682, ; 179: System.Private.CoreLib => 0xad6f1e8a => 127
	i32 2916838712, ; 180: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 81
	i32 2919462931, ; 181: System.Numerics.Vectors.dll => 0xae037813 => 107
	i32 2959614098, ; 182: System.ComponentModel.dll => 0xb0682092 => 96
	i32 2970759306, ; 183: BCrypt.Net-Next.dll => 0xb112308a => 35
	i32 2972252294, ; 184: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 115
	i32 2978675010, ; 185: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 64
	i32 2987532451, ; 186: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 77
	i32 3038032645, ; 187: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 188: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 71
	i32 3058099980, ; 189: Xamarin.GooglePlayServices.Tasks => 0xb646e70c => 86
	i32 3059408633, ; 190: Mono.Android.Runtime => 0xb65adef9 => 129
	i32 3059793426, ; 191: System.ComponentModel.Primitives => 0xb660be12 => 94
	i32 3077302341, ; 192: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3178803400, ; 193: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 72
	i32 3220365878, ; 194: System.Threading => 0xbff2e236 => 123
	i32 3230466174, ; 195: Xamarin.GooglePlayServices.Basement.dll => 0xc08d007e => 84
	i32 3258312781, ; 196: Xamarin.AndroidX.CardView => 0xc235e84d => 58
	i32 3280506390, ; 197: System.ComponentModel.Annotations.dll => 0xc3888e16 => 93
	i32 3286872994, ; 198: SQLite-net.dll => 0xc3e9b3a2 => 50
	i32 3305363605, ; 199: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 200: System.Net.Requests.dll => 0xc5b097e4 => 106
	i32 3317135071, ; 201: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 63
	i32 3346324047, ; 202: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 73
	i32 3357674450, ; 203: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 204: System.Text.Json => 0xc82afec1 => 120
	i32 3360279109, ; 205: SQLitePCLRaw.core => 0xc849ca45 => 52
	i32 3362522851, ; 206: Xamarin.AndroidX.Core => 0xc86c06e3 => 61
	i32 3366347497, ; 207: Java.Interop => 0xc8a662e9 => 128
	i32 3374999561, ; 208: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 75
	i32 3381016424, ; 209: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 210: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 38
	i32 3430777524, ; 211: netstandard => 0xcc7d82b4 => 126
	i32 3463511458, ; 212: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 213: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 95
	i32 3472012038, ; 214: BCrypt.Net-Next => 0xcef2b306 => 35
	i32 3476120550, ; 215: Mono.Android => 0xcf3163e6 => 130
	i32 3479583265, ; 216: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 217: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 218: System.Text.Json.dll => 0xcfbaacae => 120
	i32 3494395880, ; 219: Xamarin.GooglePlayServices.Location.dll => 0xd0483fe8 => 85
	i32 3580758918, ; 220: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 221: System.Linq.dll => 0xd715a361 => 102
	i32 3624195450, ; 222: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 111
	i32 3641597786, ; 223: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 67
	i32 3643446276, ; 224: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 225: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 72
	i32 3657292374, ; 226: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 37
	i32 3672681054, ; 227: Mono.Android.dll => 0xdae8aa5e => 130
	i32 3697841164, ; 228: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 229: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 71
	i32 3748608112, ; 230: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 98
	i32 3754567612, ; 231: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 54
	i32 3786282454, ; 232: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 59
	i32 3792276235, ; 233: System.Collections.NonGeneric => 0xe2098b0b => 91
	i32 3823082795, ; 234: System.Security.Cryptography.dll => 0xe3df9d2b => 117
	i32 3841636137, ; 235: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 39
	i32 3849253459, ; 236: System.Runtime.InteropServices.dll => 0xe56ef253 => 112
	i32 3876362041, ; 237: SQLite-net => 0xe70c9739 => 50
	i32 3889960447, ; 238: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 239: System.Collections.Concurrent.dll => 0xe839deed => 90
	i32 3896760992, ; 240: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 61
	i32 3921031405, ; 241: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 79
	i32 3928044579, ; 242: System.Xml.ReaderWriter => 0xea213423 => 124
	i32 3931092270, ; 243: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 74
	i32 3955647286, ; 244: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 56
	i32 3967165417, ; 245: Xamarin.GooglePlayServices.Location => 0xec7623e9 => 85
	i32 3970018735, ; 246: Xamarin.GooglePlayServices.Tasks.dll => 0xeca1adaf => 86
	i32 3980434154, ; 247: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 248: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 249: System.Memory => 0xeff49a63 => 103
	i32 4046471985, ; 250: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 45
	i32 4073602200, ; 251: System.Threading.dll => 0xf2ce3c98 => 123
	i32 4094352644, ; 252: Microsoft.Maui.Essentials.dll => 0xf40add04 => 47
	i32 4100113165, ; 253: System.Private.Uri => 0xf462c30d => 109
	i32 4102112229, ; 254: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 255: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 256: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 38
	i32 4150914736, ; 257: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 258: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 69
	i32 4213026141, ; 259: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 98
	i32 4271975918, ; 260: Microsoft.Maui.Controls.dll => 0xfea12dee => 44
	i32 4292120959 ; 261: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 69
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [262 x i32] [
	i32 89, ; 0
	i32 122, ; 1
	i32 33, ; 2
	i32 116, ; 3
	i32 48, ; 4
	i32 112, ; 5
	i32 116, ; 6
	i32 93, ; 7
	i32 59, ; 8
	i32 78, ; 9
	i32 30, ; 10
	i32 31, ; 11
	i32 96, ; 12
	i32 2, ; 13
	i32 30, ; 14
	i32 55, ; 15
	i32 15, ; 16
	i32 66, ; 17
	i32 53, ; 18
	i32 14, ; 19
	i32 122, ; 20
	i32 103, ; 21
	i32 34, ; 22
	i32 26, ; 23
	i32 92, ; 24
	i32 65, ; 25
	i32 125, ; 26
	i32 108, ; 27
	i32 13, ; 28
	i32 7, ; 29
	i32 49, ; 30
	i32 43, ; 31
	i32 40, ; 32
	i32 21, ; 33
	i32 115, ; 34
	i32 63, ; 35
	i32 19, ; 36
	i32 119, ; 37
	i32 79, ; 38
	i32 90, ; 39
	i32 1, ; 40
	i32 16, ; 41
	i32 4, ; 42
	i32 113, ; 43
	i32 51, ; 44
	i32 106, ; 45
	i32 100, ; 46
	i32 25, ; 47
	i32 42, ; 48
	i32 109, ; 49
	i32 99, ; 50
	i32 94, ; 51
	i32 28, ; 52
	i32 66, ; 53
	i32 92, ; 54
	i32 76, ; 55
	i32 39, ; 56
	i32 3, ; 57
	i32 56, ; 58
	i32 101, ; 59
	i32 68, ; 60
	i32 95, ; 61
	i32 87, ; 62
	i32 125, ; 63
	i32 16, ; 64
	i32 22, ; 65
	i32 73, ; 66
	i32 20, ; 67
	i32 18, ; 68
	i32 2, ; 69
	i32 52, ; 70
	i32 64, ; 71
	i32 102, ; 72
	i32 32, ; 73
	i32 76, ; 74
	i32 60, ; 75
	i32 0, ; 76
	i32 6, ; 77
	i32 100, ; 78
	i32 57, ; 79
	i32 43, ; 80
	i32 99, ; 81
	i32 10, ; 82
	i32 5, ; 83
	i32 49, ; 84
	i32 121, ; 85
	i32 25, ; 86
	i32 70, ; 87
	i32 81, ; 88
	i32 62, ; 89
	i32 104, ; 90
	i32 121, ; 91
	i32 114, ; 92
	i32 82, ; 93
	i32 105, ; 94
	i32 117, ; 95
	i32 53, ; 96
	i32 58, ; 97
	i32 23, ; 98
	i32 1, ; 99
	i32 78, ; 100
	i32 40, ; 101
	i32 129, ; 102
	i32 17, ; 103
	i32 65, ; 104
	i32 9, ; 105
	i32 70, ; 106
	i32 87, ; 107
	i32 82, ; 108
	i32 74, ; 109
	i32 118, ; 110
	i32 41, ; 111
	i32 29, ; 112
	i32 26, ; 113
	i32 101, ; 114
	i32 8, ; 115
	i32 84, ; 116
	i32 91, ; 117
	i32 89, ; 118
	i32 77, ; 119
	i32 36, ; 120
	i32 5, ; 121
	i32 68, ; 122
	i32 0, ; 123
	i32 110, ; 124
	i32 67, ; 125
	i32 4, ; 126
	i32 114, ; 127
	i32 107, ; 128
	i32 54, ; 129
	i32 97, ; 130
	i32 83, ; 131
	i32 46, ; 132
	i32 12, ; 133
	i32 42, ; 134
	i32 41, ; 135
	i32 108, ; 136
	i32 88, ; 137
	i32 104, ; 138
	i32 14, ; 139
	i32 37, ; 140
	i32 8, ; 141
	i32 75, ; 142
	i32 18, ; 143
	i32 127, ; 144
	i32 111, ; 145
	i32 105, ; 146
	i32 124, ; 147
	i32 36, ; 148
	i32 13, ; 149
	i32 10, ; 150
	i32 97, ; 151
	i32 51, ; 152
	i32 126, ; 153
	i32 128, ; 154
	i32 44, ; 155
	i32 11, ; 156
	i32 119, ; 157
	i32 118, ; 158
	i32 20, ; 159
	i32 88, ; 160
	i32 110, ; 161
	i32 62, ; 162
	i32 15, ; 163
	i32 113, ; 164
	i32 55, ; 165
	i32 57, ; 166
	i32 21, ; 167
	i32 45, ; 168
	i32 46, ; 169
	i32 80, ; 170
	i32 27, ; 171
	i32 48, ; 172
	i32 6, ; 173
	i32 60, ; 174
	i32 19, ; 175
	i32 83, ; 176
	i32 80, ; 177
	i32 47, ; 178
	i32 127, ; 179
	i32 81, ; 180
	i32 107, ; 181
	i32 96, ; 182
	i32 35, ; 183
	i32 115, ; 184
	i32 64, ; 185
	i32 77, ; 186
	i32 34, ; 187
	i32 71, ; 188
	i32 86, ; 189
	i32 129, ; 190
	i32 94, ; 191
	i32 12, ; 192
	i32 72, ; 193
	i32 123, ; 194
	i32 84, ; 195
	i32 58, ; 196
	i32 93, ; 197
	i32 50, ; 198
	i32 7, ; 199
	i32 106, ; 200
	i32 63, ; 201
	i32 73, ; 202
	i32 24, ; 203
	i32 120, ; 204
	i32 52, ; 205
	i32 61, ; 206
	i32 128, ; 207
	i32 75, ; 208
	i32 3, ; 209
	i32 38, ; 210
	i32 126, ; 211
	i32 11, ; 212
	i32 95, ; 213
	i32 35, ; 214
	i32 130, ; 215
	i32 24, ; 216
	i32 23, ; 217
	i32 120, ; 218
	i32 85, ; 219
	i32 31, ; 220
	i32 102, ; 221
	i32 111, ; 222
	i32 67, ; 223
	i32 28, ; 224
	i32 72, ; 225
	i32 37, ; 226
	i32 130, ; 227
	i32 33, ; 228
	i32 71, ; 229
	i32 98, ; 230
	i32 54, ; 231
	i32 59, ; 232
	i32 91, ; 233
	i32 117, ; 234
	i32 39, ; 235
	i32 112, ; 236
	i32 50, ; 237
	i32 32, ; 238
	i32 90, ; 239
	i32 61, ; 240
	i32 79, ; 241
	i32 124, ; 242
	i32 74, ; 243
	i32 56, ; 244
	i32 85, ; 245
	i32 86, ; 246
	i32 27, ; 247
	i32 9, ; 248
	i32 103, ; 249
	i32 45, ; 250
	i32 123, ; 251
	i32 47, ; 252
	i32 109, ; 253
	i32 22, ; 254
	i32 17, ; 255
	i32 38, ; 256
	i32 29, ; 257
	i32 69, ; 258
	i32 98, ; 259
	i32 44, ; 260
	i32 69 ; 261
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
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ a8cd27e430e55df3e3c1e3a43d35c11d9512a2db"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
