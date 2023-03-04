/+
+            Copyright 2022 – 2023 Aya Partridge
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module bindbc.opus.codegen;

import bindbc.opus.config: staticBinding;

/*regex: function decl => makeFnBinds decl
^[ \t]*([A-Za-z0-9_()*\[\]]+) (\w+) ?\(([A-Za-z0-9_()*, .=\[\]]*)\);
\t\t[q{$1}, q{$2}, q{$3}],
*/
enum makeFnBinds = (string[3][] fns) nothrow pure @safe{
	string makeFnBinds = ``;
	string[] symbols;
	static if(staticBinding){
		foreach(fn; fns){
			makeFnBinds ~= "\n\t"~fn[0]~` `~fn[1]~`(`~fn[2]~`);`;
		}
	}else{
		foreach(fn; fns){
			if(fn[2].length > 3 && fn[2][$-3..$] == "..."){
				makeFnBinds ~= "\n\t private "~fn[0]~` function(`~fn[2]~`) _`~fn[1]~`;`;
				makeFnBinds ~= "\n\t alias "~fn[1]~` = _`~fn[1]~`;`;
			}else{
				makeFnBinds ~= "\n\tprivate "~fn[0]~` function(`~fn[2]~`) _`~fn[1]~`;`;
				if(fn[0] == "void"){
					makeFnBinds ~= "\n\t"~fn[0]~` `~fn[1]~`(`~fn[2]~`){ _`~fn[1]~`(__traits(parameters)); }`;
				}else{
					makeFnBinds ~= "\n\t"~fn[0]~` `~fn[1]~`(`~fn[2]~`){ return _`~fn[1]~`(__traits(parameters)); }`;
				}
			}
			symbols ~= fn[1];
		}
	}
	return [makeFnBinds] ~ symbols;
};

enum joinFnBinds = (string[][] list) nothrow pure @safe{
	string joined = `extern(C) @nogc nothrow`;
	string[] symbols;
	
	static if(staticBinding){
		joined ~= `{`;
		foreach(item; list){
			joined ~= item[0];
		}
	}else{
		joined ~= ` __gshared{`;
		foreach(item; list){
			joined ~= item[0];
			symbols ~= item[1..$];
		}
	}
	joined ~= "\n}";
	
	static if(!staticBinding){
		joined ~= "\n\nimport bindbc.loader: SharedLib, bindSymbol;\nvoid bindModuleSymbols(SharedLib lib) @nogc nothrow{";
		foreach(symbol; symbols){
			joined ~= "\n\tlib.bindSymbol(cast(void**)&_"~symbol~`, "`~symbol~`");`;
		}
		joined ~= "\n}";
	}
	
	return joined;
};
