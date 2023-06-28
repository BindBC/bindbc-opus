/+
+                Copyright 2023 Aya Partridge
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opus.codegen;

import bindbc.opus.config;
import bindbc.common.codegen;

mixin(makeFnBindFns(staticBinding));