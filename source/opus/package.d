/+
+                Copyright 2023 Aya Partridge
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module opus;

import bindbc.opus.config;
import bindbc.opus.codegen;

public import
	opus.opus,
	opus.defines,
	opus.multistream,
	opus.projection;

static if(!staticBinding):
import bindbc.loader;

mixin(makeDynloadFns("Opus",
	(){
		version(Windows){
			return q{[
				`opus.dll`,
			]};
		}else version(OSX){
			return q{[
				`libopus.dylib`,
				`opus`,
				`/Library/Frameworks/opus.framework/opus`,
				`/System/Library/Frameworks/opus.framework/opus`,
			]};
		}else version(Posix){
			return q{[
				`libopus.so`,
				`libopus.so.0`,
				`libopus.so.0.8.0`,
			]};
		}else static assert(0, "BindBC-Opus does not have library search paths set up for this platform.");
	}(), [
	"opus.opus",
	"opus.defines",
	"opus.multistream",
	"opus.projection",
]));
