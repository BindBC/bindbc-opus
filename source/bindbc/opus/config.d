/+
+            Copyright 2023 – 2024 Aya Partridge
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opus.config;

enum staticBinding = (){
	version(BindBC_Static)        return true;
	else version(BindOpus_Static) return true;
	else return false;
}();

public import bindbc.common.versions;

//enum opusVersion = (){
//	version(Opus_1_4_0)     return Version(1,4,0);
//	else                    return Version(1,3,1);
//}();

enum bindOpusfile = (){
	version(Opusfile_0_12) return true;
	else return false;
}();

enum bindOpusenc = (){
	version(Opusenc_0_2) return true;
	else return false;
}();
