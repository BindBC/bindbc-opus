/+
+            Copyright 2023 – 2023 Aya Partridge
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

struct Version{
	int major;
	int minor;
	int patch;
	
	int opCmp(Version x) @nogc nothrow pure{
		if(major != x.major)
			return major - x.major;
		else if(minor != x.minor)
			return minor - x.minor;
		else
			return patch - x.patch;
	}
}

enum opusVersion = (){
	version(none)    return Version(1,3,1); //just a placeholder
	else             return Version(1,3,1);
}();
