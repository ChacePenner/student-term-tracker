; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [131 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [262 x i64] [
	i64 36418902923615093, ; 0: Plugin.LocalNotification => 0x8162cc9bdf1b75 => 49
	i64 98382396393917666, ; 1: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 43
	i64 120698629574877762, ; 2: Mono.Android => 0x1accec39cafe242 => 130
	i64 131669012237370309, ; 3: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 47
	i64 196720943101637631, ; 4: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 101
	i64 210515253464952879, ; 5: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 59
	i64 232391251801502327, ; 6: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 76
	i64 435118502366263740, ; 7: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 77
	i64 435170709725415398, ; 8: Xamarin.GooglePlayServices.Location => 0x60a097471d687e6 => 85
	i64 545109961164950392, ; 9: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 687654259221141486, ; 10: Xamarin.GooglePlayServices.Base => 0x98b09e7c92917ee => 83
	i64 750875890346172408, ; 11: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 122
	i64 799765834175365804, ; 12: System.ComponentModel.dll => 0xb1956c9f18442ac => 96
	i64 849051935479314978, ; 13: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 870603111519317375, ; 14: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 53
	i64 872800313462103108, ; 15: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 64
	i64 1120440138749646132, ; 16: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 82
	i64 1121665720830085036, ; 17: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1301485588176585670, ; 18: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 52
	i64 1369545283391376210, ; 19: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 72
	i64 1476839205573959279, ; 20: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 105
	i64 1486715745332614827, ; 21: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 44
	i64 1513467482682125403, ; 22: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 129
	i64 1518315023656898250, ; 23: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 54
	i64 1537168428375924959, ; 24: System.Threading.Thread.dll => 0x15551e8a954ae0df => 122
	i64 1556147632182429976, ; 25: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1559087064654078745, ; 26: BCrypt.Net-Next.dll => 0x15a2fd6cc69ce319 => 35
	i64 1624659445732251991, ; 27: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 57
	i64 1628611045998245443, ; 28: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 69
	i64 1743969030606105336, ; 29: System.Memory.dll => 0x1833d297e88f2af8 => 103
	i64 1767386781656293639, ; 30: System.Private.Uri.dll => 0x188704e9f5582107 => 109
	i64 1795316252682057001, ; 31: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 56
	i64 1825687700144851180, ; 32: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 111
	i64 1835311033149317475, ; 33: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 34: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 76
	i64 1881198190668717030, ; 35: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1897575647115118287, ; 36: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 77
	i64 1920760634179481754, ; 37: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 45
	i64 1959996714666907089, ; 38: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1972385128188460614, ; 39: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 115
	i64 1981742497975770890, ; 40: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 68
	i64 1983698669889758782, ; 41: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 42: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2262844636196693701, ; 43: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 64
	i64 2287834202362508563, ; 44: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 90
	i64 2302323944321350744, ; 45: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2329709569556905518, ; 46: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 67
	i64 2335503487726329082, ; 47: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 119
	i64 2470498323731680442, ; 48: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 60
	i64 2497223385847772520, ; 49: System.Runtime => 0x22a7eb7046413568 => 114
	i64 2547086958574651984, ; 50: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 55
	i64 2602673633151553063, ; 51: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2656907746661064104, ; 52: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 38
	i64 2662981627730767622, ; 53: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2895129759130297543, ; 54: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 55: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 82
	i64 3289520064315143713, ; 56: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 66
	i64 3311221304742556517, ; 57: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 107
	i64 3344514922410554693, ; 58: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 88
	i64 3411255996856937470, ; 59: Xamarin.GooglePlayServices.Basement => 0x2f5737416a942bfe => 84
	i64 3429672777697402584, ; 60: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 47
	i64 3494946837667399002, ; 61: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 36
	i64 3522470458906976663, ; 62: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 78
	i64 3551103847008531295, ; 63: System.Private.CoreLib.dll => 0x31480e226177735f => 127
	i64 3567343442040498961, ; 64: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 65: System.Runtime.dll => 0x319037675df7e556 => 114
	i64 3638003163729360188, ; 66: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 37
	i64 3647754201059316852, ; 67: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 124
	i64 3655542548057982301, ; 68: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 36
	i64 3716579019761409177, ; 69: netstandard.dll => 0x3393f0ed5c8c5c99 => 126
	i64 3727469159507183293, ; 70: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 75
	i64 3869221888984012293, ; 71: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 40
	i64 3890352374528606784, ; 72: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 45
	i64 3933965368022646939, ; 73: System.Net.Requests => 0x369840a8bfadc09b => 106
	i64 3966267475168208030, ; 74: System.Memory => 0x370b03412596249e => 103
	i64 4073500526318903918, ; 75: System.Private.Xml.dll => 0x3887fb25779ae26e => 110
	i64 4120493066591692148, ; 76: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 77: System.ComponentModel => 0x39a7562737acb67e => 96
	i64 4187479170553454871, ; 78: System.Linq.Expressions => 0x3a1cea1e912fa117 => 101
	i64 4205801962323029395, ; 79: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 95
	i64 4247996603072512073, ; 80: Xamarin.GooglePlayServices.Tasks => 0x3af3ea6755340049 => 86
	i64 4337444564132831293, ; 81: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 51
	i64 4356591372459378815, ; 82: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4636684751163556186, ; 83: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 79
	i64 4653218859990629377, ; 84: D424Capstone => 0x40938de63be3bc01 => 89
	i64 4679594760078841447, ; 85: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4743821336939966868, ; 86: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 93
	i64 4794310189461587505, ; 87: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 55
	i64 4795410492532947900, ; 88: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 78
	i64 4853321196694829351, ; 89: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 113
	i64 5290786973231294105, ; 90: System.Runtime.Loader => 0x496ca6b869b72699 => 113
	i64 5423376490970181369, ; 91: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 111
	i64 5471532531798518949, ; 92: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 93: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5528247634813456972, ; 94: Plugin.LocalNotification.dll => 0x4cb847ef1773124c => 49
	i64 5570799893513421663, ; 95: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 99
	i64 5573260873512690141, ; 96: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 117
	i64 5650097808083101034, ; 97: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 115
	i64 5692067934154308417, ; 98: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 81
	i64 5984759512290286505, ; 99: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 116
	i64 6068057819846744445, ; 100: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6183170893902868313, ; 101: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 51
	i64 6200764641006662125, ; 102: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 103: System.Text.Json.dll => 0x565a67a0ffe264a7 => 120
	i64 6357457916754632952, ; 104: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 105: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 67
	i64 6478287442656530074, ; 106: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 107: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 63
	i64 6560151584539558821, ; 108: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 42
	i64 6743165466166707109, ; 109: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6777482997383978746, ; 110: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6894844156784520562, ; 111: System.Numerics.Vectors => 0x5faf683aead1ad72 => 107
	i64 7220009545223068405, ; 112: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7270811800166795866, ; 113: System.Linq => 0x64e71ccf51a90a5a => 102
	i64 7377312882064240630, ; 114: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 95
	i64 7489048572193775167, ; 115: System.ObjectModel => 0x67ee71ff6b419e3f => 108
	i64 7654504624184590948, ; 116: System.Net.Http => 0x6a3a4366801b8264 => 104
	i64 7708790323521193081, ; 117: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 118: System.Private.CoreLib => 0x6b0ff375198b9c17 => 127
	i64 7735352534559001595, ; 119: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 87
	i64 7836164640616011524, ; 120: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 57
	i64 8064050204834738623, ; 121: System.Collections.dll => 0x6fe942efa61731bf => 92
	i64 8083354569033831015, ; 122: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 66
	i64 8087206902342787202, ; 123: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 98
	i64 8167236081217502503, ; 124: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 128
	i64 8185542183669246576, ; 125: System.Collections => 0x7198e33f4794aa70 => 92
	i64 8246048515196606205, ; 126: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 48
	i64 8368701292315763008, ; 127: System.Security.Cryptography => 0x7423997c6fd56140 => 117
	i64 8400357532724379117, ; 128: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 74
	i64 8476828615142258695, ; 129: BCrypt.Net-Next => 0x75a3beb69b6bb807 => 35
	i64 8563666267364444763, ; 130: System.Private.Uri => 0x76d841191140ca5b => 109
	i64 8614108721271900878, ; 131: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 132: Java.Interop => 0x77b654e585b55834 => 128
	i64 8639588376636138208, ; 133: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 73
	i64 8677882282824630478, ; 134: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 135: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 98
	i64 9045785047181495996, ; 136: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9312692141327339315, ; 137: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 81
	i64 9324707631942237306, ; 138: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 56
	i64 9659729154652888475, ; 139: System.Text.RegularExpressions => 0x860e407c9991dd9b => 121
	i64 9678050649315576968, ; 140: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 60
	i64 9702891218465930390, ; 141: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 91
	i64 9808709177481450983, ; 142: Mono.Android.dll => 0x881f890734e555e7 => 130
	i64 9875200773399460291, ; 143: Xamarin.GooglePlayServices.Base.dll => 0x890bc2c8482339c3 => 83
	i64 9956195530459977388, ; 144: Microsoft.Maui => 0x8a2b8315b36616ac => 46
	i64 9991543690424095600, ; 145: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10038780035334861115, ; 146: System.Net.Http.dll => 0x8b50e941206af13b => 104
	i64 10051358222726253779, ; 147: System.Private.Xml => 0x8b7d990c97ccccd3 => 110
	i64 10092835686693276772, ; 148: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 44
	i64 10143853363526200146, ; 149: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10229024438826829339, ; 150: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 63
	i64 10406448008575299332, ; 151: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 88
	i64 10430153318873392755, ; 152: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 61
	i64 10506226065143327199, ; 153: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10785150219063592792, ; 154: System.Net.Primitives => 0x95ac8cfb68830758 => 105
	i64 11002576679268595294, ; 155: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 41
	i64 11009005086950030778, ; 156: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 46
	i64 11103970607964515343, ; 157: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 158: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 80
	i64 11220793807500858938, ; 159: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 160: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 42
	i64 11340910727871153756, ; 161: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 62
	i64 11485890710487134646, ; 162: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 112
	i64 11518296021396496455, ; 163: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 164: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 80
	i64 11530571088791430846, ; 165: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 40
	i64 11597940890313164233, ; 166: netstandard => 0xa0f429ca8d1805c9 => 126
	i64 11705530742807338875, ; 167: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 11739066727115742305, ; 168: SQLite-net.dll => 0xa2e98afdf8575c61 => 50
	i64 11806260347154423189, ; 169: SQLite-net => 0xa3d8433bc5eb5d95 => 50
	i64 12145679461940342714, ; 170: System.Text.Json => 0xa88e1f1ebcb62fba => 120
	i64 12279246230491828964, ; 171: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 54
	i64 12451044538927396471, ; 172: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 65
	i64 12466513435562512481, ; 173: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 70
	i64 12475113361194491050, ; 174: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12538491095302438457, ; 175: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 58
	i64 12550732019250633519, ; 176: System.IO.Compression => 0xae2d28465e8e1b2f => 100
	i64 12681088699309157496, ; 177: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12700543734426720211, ; 178: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 59
	i64 12708922737231849740, ; 179: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 118
	i64 12823819093633476069, ; 180: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12843321153144804894, ; 181: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 43
	i64 13221551921002590604, ; 182: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 183: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13343850469010654401, ; 184: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 129
	i64 13381594904270902445, ; 185: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13465488254036897740, ; 186: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 87
	i64 13467053111158216594, ; 187: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13540124433173649601, ; 188: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 189: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13572454107664307259, ; 190: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 75
	i64 13717397318615465333, ; 191: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 94
	i64 13755568601956062840, ; 192: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 193: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 194: System.Console.dll => 0xc0a5f3cade5c6774 => 97
	i64 13959074834287824816, ; 195: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 65
	i64 14100563506285742564, ; 196: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 197: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 58
	i64 14125464355221830302, ; 198: System.Threading.dll => 0xc407bafdbc707a9e => 123
	i64 14254574811015963973, ; 199: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 118
	i64 14461014870687870182, ; 200: System.Net.Requests.dll => 0xc8afd8683afdece6 => 106
	i64 14464374589798375073, ; 201: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14508886941262395338, ; 202: D424Capstone.dll => 0xc959ebcd3c3fb7ca => 89
	i64 14522721392235705434, ; 203: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14551742072151931844, ; 204: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 119
	i64 14561513370130550166, ; 205: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 116
	i64 14669215534098758659, ; 206: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 38
	i64 14678510994762383812, ; 207: Xamarin.GooglePlayServices.Location.dll => 0xcbb48bfaca7a41c4 => 85
	i64 14705122255218365489, ; 208: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 209: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14852515768018889994, ; 210: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 62
	i64 14892012299694389861, ; 211: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14904040806490515477, ; 212: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14954917835170835695, ; 213: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 39
	i64 14987728460634540364, ; 214: System.IO.Compression.dll => 0xcfff1ba06622494c => 100
	i64 15076659072870671916, ; 215: System.ObjectModel.dll => 0xd13b0d8c1620662c => 108
	i64 15111608613780139878, ; 216: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 217: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 99
	i64 15133485256822086103, ; 218: System.Linq.dll => 0xd204f0a9127dd9d7 => 102
	i64 15227001540531775957, ; 219: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 37
	i64 15370334346939861994, ; 220: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 61
	i64 15391712275433856905, ; 221: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 39
	i64 15527772828719725935, ; 222: System.Console => 0xd77dbb1e38cd3d6f => 97
	i64 15536481058354060254, ; 223: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15582737692548360875, ; 224: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 69
	i64 15609085926864131306, ; 225: System.dll => 0xd89e9cf3334914ea => 125
	i64 15661133872274321916, ; 226: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 124
	i64 15664356999916475676, ; 227: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 228: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15783653065526199428, ; 229: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15930129725311349754, ; 230: Xamarin.GooglePlayServices.Tasks.dll => 0xdd1330956f12f3fa => 86
	i64 16154507427712707110, ; 231: System => 0xe03056ea4e39aa26 => 125
	i64 16288847719894691167, ; 232: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 233: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 41
	i64 16649148416072044166, ; 234: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 48
	i64 16677317093839702854, ; 235: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 74
	i64 16755018182064898362, ; 236: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 52
	i64 16890310621557459193, ; 237: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 121
	i64 16942731696432749159, ; 238: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 239: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 72
	i64 17008137082415910100, ; 240: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 91
	i64 17031351772568316411, ; 241: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 71
	i64 17062143951396181894, ; 242: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 94
	i64 17089008752050867324, ; 243: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17187273293601214786, ; 244: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 93
	i64 17342750010158924305, ; 245: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17438153253682247751, ; 246: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17514990004910432069, ; 247: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 248: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17702523067201099846, ; 249: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 250: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 70
	i64 17710060891934109755, ; 251: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 68
	i64 17712670374920797664, ; 252: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 112
	i64 17986907704309214542, ; 253: Xamarin.GooglePlayServices.Basement.dll => 0xf99e554223166d4e => 84
	i64 18025913125965088385, ; 254: System.Threading => 0xfa28e87b91334681 => 123
	i64 18099568558057551825, ; 255: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 256: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 71
	i64 18245806341561545090, ; 257: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 90
	i64 18305135509493619199, ; 258: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 73
	i64 18324163916253801303, ; 259: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18370042311372477656, ; 260: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 53
	i64 18380184030268848184 ; 261: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 79
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [262 x i32] [
	i32 49, ; 0
	i32 43, ; 1
	i32 130, ; 2
	i32 47, ; 3
	i32 101, ; 4
	i32 59, ; 5
	i32 76, ; 6
	i32 77, ; 7
	i32 85, ; 8
	i32 7, ; 9
	i32 83, ; 10
	i32 122, ; 11
	i32 96, ; 12
	i32 10, ; 13
	i32 53, ; 14
	i32 64, ; 15
	i32 82, ; 16
	i32 18, ; 17
	i32 52, ; 18
	i32 72, ; 19
	i32 105, ; 20
	i32 44, ; 21
	i32 129, ; 22
	i32 54, ; 23
	i32 122, ; 24
	i32 16, ; 25
	i32 35, ; 26
	i32 57, ; 27
	i32 69, ; 28
	i32 103, ; 29
	i32 109, ; 30
	i32 56, ; 31
	i32 111, ; 32
	i32 6, ; 33
	i32 76, ; 34
	i32 28, ; 35
	i32 77, ; 36
	i32 45, ; 37
	i32 28, ; 38
	i32 115, ; 39
	i32 68, ; 40
	i32 2, ; 41
	i32 20, ; 42
	i32 64, ; 43
	i32 90, ; 44
	i32 24, ; 45
	i32 67, ; 46
	i32 119, ; 47
	i32 60, ; 48
	i32 114, ; 49
	i32 55, ; 50
	i32 27, ; 51
	i32 38, ; 52
	i32 2, ; 53
	i32 7, ; 54
	i32 82, ; 55
	i32 66, ; 56
	i32 107, ; 57
	i32 88, ; 58
	i32 84, ; 59
	i32 47, ; 60
	i32 36, ; 61
	i32 78, ; 62
	i32 127, ; 63
	i32 22, ; 64
	i32 114, ; 65
	i32 37, ; 66
	i32 124, ; 67
	i32 36, ; 68
	i32 126, ; 69
	i32 75, ; 70
	i32 40, ; 71
	i32 45, ; 72
	i32 106, ; 73
	i32 103, ; 74
	i32 110, ; 75
	i32 33, ; 76
	i32 96, ; 77
	i32 101, ; 78
	i32 95, ; 79
	i32 86, ; 80
	i32 51, ; 81
	i32 30, ; 82
	i32 79, ; 83
	i32 89, ; 84
	i32 0, ; 85
	i32 93, ; 86
	i32 55, ; 87
	i32 78, ; 88
	i32 113, ; 89
	i32 113, ; 90
	i32 111, ; 91
	i32 26, ; 92
	i32 29, ; 93
	i32 49, ; 94
	i32 99, ; 95
	i32 117, ; 96
	i32 115, ; 97
	i32 81, ; 98
	i32 116, ; 99
	i32 23, ; 100
	i32 51, ; 101
	i32 23, ; 102
	i32 120, ; 103
	i32 34, ; 104
	i32 67, ; 105
	i32 11, ; 106
	i32 63, ; 107
	i32 42, ; 108
	i32 19, ; 109
	i32 22, ; 110
	i32 107, ; 111
	i32 26, ; 112
	i32 102, ; 113
	i32 95, ; 114
	i32 108, ; 115
	i32 104, ; 116
	i32 17, ; 117
	i32 127, ; 118
	i32 87, ; 119
	i32 57, ; 120
	i32 92, ; 121
	i32 66, ; 122
	i32 98, ; 123
	i32 128, ; 124
	i32 92, ; 125
	i32 48, ; 126
	i32 117, ; 127
	i32 74, ; 128
	i32 35, ; 129
	i32 109, ; 130
	i32 21, ; 131
	i32 128, ; 132
	i32 73, ; 133
	i32 21, ; 134
	i32 98, ; 135
	i32 31, ; 136
	i32 81, ; 137
	i32 56, ; 138
	i32 121, ; 139
	i32 60, ; 140
	i32 91, ; 141
	i32 130, ; 142
	i32 83, ; 143
	i32 46, ; 144
	i32 6, ; 145
	i32 104, ; 146
	i32 110, ; 147
	i32 44, ; 148
	i32 3, ; 149
	i32 63, ; 150
	i32 88, ; 151
	i32 61, ; 152
	i32 1, ; 153
	i32 105, ; 154
	i32 41, ; 155
	i32 46, ; 156
	i32 12, ; 157
	i32 80, ; 158
	i32 15, ; 159
	i32 42, ; 160
	i32 62, ; 161
	i32 112, ; 162
	i32 13, ; 163
	i32 80, ; 164
	i32 40, ; 165
	i32 126, ; 166
	i32 9, ; 167
	i32 50, ; 168
	i32 50, ; 169
	i32 120, ; 170
	i32 54, ; 171
	i32 65, ; 172
	i32 70, ; 173
	i32 34, ; 174
	i32 58, ; 175
	i32 100, ; 176
	i32 14, ; 177
	i32 59, ; 178
	i32 118, ; 179
	i32 27, ; 180
	i32 43, ; 181
	i32 1, ; 182
	i32 15, ; 183
	i32 129, ; 184
	i32 9, ; 185
	i32 87, ; 186
	i32 29, ; 187
	i32 30, ; 188
	i32 13, ; 189
	i32 75, ; 190
	i32 94, ; 191
	i32 8, ; 192
	i32 11, ; 193
	i32 97, ; 194
	i32 65, ; 195
	i32 3, ; 196
	i32 58, ; 197
	i32 123, ; 198
	i32 118, ; 199
	i32 106, ; 200
	i32 24, ; 201
	i32 89, ; 202
	i32 5, ; 203
	i32 119, ; 204
	i32 116, ; 205
	i32 38, ; 206
	i32 85, ; 207
	i32 16, ; 208
	i32 32, ; 209
	i32 62, ; 210
	i32 33, ; 211
	i32 0, ; 212
	i32 39, ; 213
	i32 100, ; 214
	i32 108, ; 215
	i32 17, ; 216
	i32 99, ; 217
	i32 102, ; 218
	i32 37, ; 219
	i32 61, ; 220
	i32 39, ; 221
	i32 97, ; 222
	i32 4, ; 223
	i32 69, ; 224
	i32 125, ; 225
	i32 124, ; 226
	i32 4, ; 227
	i32 12, ; 228
	i32 5, ; 229
	i32 86, ; 230
	i32 125, ; 231
	i32 18, ; 232
	i32 41, ; 233
	i32 48, ; 234
	i32 74, ; 235
	i32 52, ; 236
	i32 121, ; 237
	i32 25, ; 238
	i32 72, ; 239
	i32 91, ; 240
	i32 71, ; 241
	i32 94, ; 242
	i32 32, ; 243
	i32 93, ; 244
	i32 10, ; 245
	i32 25, ; 246
	i32 8, ; 247
	i32 20, ; 248
	i32 31, ; 249
	i32 70, ; 250
	i32 68, ; 251
	i32 112, ; 252
	i32 84, ; 253
	i32 123, ; 254
	i32 19, ; 255
	i32 71, ; 256
	i32 90, ; 257
	i32 73, ; 258
	i32 14, ; 259
	i32 53, ; 260
	i32 79 ; 261
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ a8cd27e430e55df3e3c1e3a43d35c11d9512a2db"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
