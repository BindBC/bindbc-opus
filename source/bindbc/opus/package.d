/+
+            Copyright 2023 – 2024 Aya Partridge
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opus;

public import bindbc.opus.config;
public import opus;
static if(bindOpusfile) public import opusfile;
static if(bindOpusenc)  public import opusenc;
