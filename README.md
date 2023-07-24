
# BindBC-Opus
This project provides a set of both static and dynamic bindings to the [Opus libraries](https://opus-codec.org/) opus, opusfile, and opusenc. They are compatible with `@nogc` and `nothrow`, and can be compiled with BetterC compatibility.

| Table of Contents |
|-------------------|
|[License](#license)|
|[Opus documentation](#opus-documentation)|
|[Quickstart guide](#quickstart-guide)|
|[Binding-specific changes](#binding-specific-changes)|
|[Configurations](#configurations)|
|[Library versions](#library-versions)|

## License

BindBC-Opus&mdash;as well as every other binding in the [BindBC project](https://github.com/BindBC)&mdash;is licensed under the [Boost Software License](https://www.boost.org/LICENSE_1_0.txt).

Bear in mind that you still need to abide by [Opus' license](https://opus-codec.org/license/).

## Opus documentation
This readme describes how to use BindBC-Opus, *not* the Opus libraries themselves. BindBC-Opus does have minor API changes from the Opus libraries, which are listed in [Binding-specific changes](#binding-specific-changes). Otherwise BindBC-Opus is a direct D binding to the Opus libraries' APIs, so any existing Opus documentation and tutorials can be adapted with only minor modifications.
* [The Opus libraries' official documentation](https://opus-codec.org/docs/) can be viewed in PDF or HTML form.

## Quickstart guide
To use BindBC-Opus in your dub project, add it to the list of `dependencies` in your dub configuration file. The easiest way is by running `dub add bindbc-opus` in your project folder. The result should look like this:

Example __dub.json__
```json
"dependencies": {
	"bindbc-opus": "~>1.0.0",
},
```
Example __dub.sdl__
```sdl
dependency "bindbc-opus" version="~>1.0.0"
```

By default, BindBC-Opus is configured to compile as a dynamic binding that is not BetterC-compatible. If you prefer static bindings or need BetterC compatibility, they can be enabled via `subConfigurations` in your dub configuration file. For configuration naming & more details, see [Configurations](#configurations).

Example __dub.json__
```json
"subConfigurations": {
	"bindbc-opus": "staticBC",
},
```
Example __dub.sdl__
```sdl
subConfiguration "bindbc-opus" "staticBC"
```

If you need to use opusfile, or opusenc, then you will have to add the appropriate version identifiers to `versions` in your dub configuration. For a list of library version identifiers, see [Library versions](#library-versions).

If using static bindings, then you will also need to add the name of each library you're using to `libs`.

Example __dub.json__
```json
"versions": [
	"Opusenc_0_2",
],
"libs": [
	"opus", "opusenc",
],
```
Example __dub.sdl__
```sdl
versions "Opusenc_0_2"
libs "opus" "opusenc"
```

**If you're using static bindings**: `import bindbc.opus` in your code, and then you can use all of Opus just like you would in C. That's it!
```d
import bindbc.opus;

void main(){
	int error;
	OpusEncoder encoder = opus_encoder_create(48_000, 2, OPUS_APPLICATION_AUDIO, &error);
	
	//etc.
	
	opus_encoder_destroy(encoder);
}
```

**If you're using dynamic bindings**: you need to load each library you need with the appropriate load function. `loadOpus` for opus, `loadOpusfile` for opusfile, and `loadOpusenc` for opusenc.

For most use cases, it's best to use BindBC-Loader's [error handling API](https://github.com/BindBC/bindbc-loader#error-handling) to see if there were any errors while loading the libraries. This information can be written to a log file before aborting the program.

The load function will also return a member of the `LoadMsg` enum, which can be used for debugging:

* `noLibrary` means the library couldn't be found.
* `badLibrary` means there was an error while loading the library.
* `success` means that the library was loaded without any errors.

Here's a simple example using only the load function's return value:

```d
import bindbc.opus;
import bindbc.loader;

/*
This code attempts to load the opus shared library using
well-known variations of the library name for the host system.
*/
LoadMsg ret = loadOpus();
if(ret != LoadMsg.success){
	/*
	Error handling. For most use cases, it's best to use the error handling API in
	BindBC-Loader to retrieve error messages for logging and then abort.
	If necessary, it's possible to determine the root cause via the return value:
	*/
	if(ret == LoadMsg.noLibrary){
		//The Opus shared library failed to load
	}else if(ret == LoadMsg.badLibrary){
		//One or more symbols failed to load.
	}
}

/*
This code attempts to load the Opus library using a user-supplied file name.
Usually, the name and/or path used will be platform specific, as in this
example which attempts to load `opus.dll` from the `libs` subdirectory,
relative to the executable, only on Windows.
*/
version(Windows) loadOpus("libs/opus.dll");
```

[The error handling API](https://github.com/BindBC/bindbc-loader#error-handling) in BindBC-Loader can be used to log error messages:
```d
import bindbc.opus;

/*
Import the sharedlib module for error handling. Assigning an alias ensures that the
function names do not conflict with other public APIs. This isn't strictly necessary,
but the API names are common enough that they could appear in other packages.
*/
import loader = bindbc.loader.sharedlib;

bool loadLib(){
	LoadMsg ret = loadOpusenc();
	if(ret != LoadMsg.success){
		//Log the error info
		foreach(info; loader.errors){
			/*
			A hypothetical logging function. Note that `info.error` and
			`info.message` are `const(char)*`, not `string`.
			*/
			logError(info.error, info.message);
		}
		
		//Optionally construct a user-friendly error message for the user
		string msg;
		if(ret == LoadMsg.noLibrary){
			msg = "This application requires the opusenc library.";
		}else{
			//NOTE: As of 2023-06-28, all opusenc versions use the same ABI, so this isn't a necessary check... yet.
			const(char)* version = ope_get_version_string();
			msg = "Your opusenc version is too low: "~version;
		}
		//A hypothetical message box function
		showMessageBox(msg);
		return false;
	}
	return true;
}
```

## Binding-specific changes

### CTLs
D does not have macros, so any CTL macros like this:
```c
#define OPUS_SET_BITRATE(x) OPUS_SET_BITRATE_REQUEST, __opus_check_int(x)
//used like:
opus_encoder_ctl(myEncoder, OPUS_SET_BITRATE(64000));
```
Have been changed to simple function wrappers that are used instead of the `*_ctl` functions themselves, like this:
```d
OPUS_SET_BITRATE(myEncoder, 64000);
```

## Configurations
BindBC-Opus has the following configurations:

|     ┌      |  DRuntime  |   BetterC   |
|-------------|------------|-------------|
| **Dynamic** | `dynamic`  | `dynamicBC` |
| **Static**  | `static`   | `staticBC`  |

For projects that don't use dub, if BindBC-Opus is compiled for static bindings then the version identifier `BindOpus_Static` must be passed to your compiler when building your project.

> [!NOTE]\
> The version identifier `BindBC_Static` can be used to configure all of the _official_ BindBC packages used in your program. (i.e. those maintained in [the BindBC GitHub organisation](https://github.com/BindBC)) Some third-party BindBC packages may support it as well.

To enable bindings of `opus_custom.h`, pass version identifier `Opus_Custom` to your compiler.

### Dynamic bindings
The dynamic bindings have no link-time dependency on the Opus libraries, so the Opus shared libraries must be manually loaded at runtime from the shared library search path of the user's system.
On Windows, this is typically handled by distributing the Opus DLLs with your program.
On other systems, it usually means installing the Opus shared libraries through a package manager.

The function `isOpusLoaded` returns `true` if any version of the shared library has been loaded and `false` if not. `unloadOpus` can be used to unload a successfully loaded shared library. opusfile and opusenc provide similar functions: `isOpusfileLoaded`, `isOpusencLoaded`, `unloadOpusfile`, and `unloadOpusenc`

### Static bindings
Static _bindings_ do not require static _linking_. The static bindings have a link-time dependency on either the shared _or_ static Opus libraries and if the program uses them, opusfile, and opusenc. On Windows, you can link with the static libraries or, to use the DLLs, the import libraries. On other systems, you can link with either the static libraries or directly with the shared libraries.

When linking with the shared (or import) libraries, there is a runtime dependency on the shared library just as there is when using the dynamic bindings. The difference is that the shared libraries are no longer loaded manually&mdash;loading is handled automatically by the system when the program is launched. Attempting to call `loadOpus` with the static bindings enabled will result in a compilation error.

Static linking requires the Opus libraries' development packages be installed on your system. The [Opus download page](https://opus-codec.org/downloads/) provides the libraries' source code. You can also install them via your system's package manager. For example, on Debian-based Linux distributions `sudo apt install libopus-dev` will install both the development and runtime packages for opus.

When linking with the static libraries, there is no runtime dependency on the Opus libraries.

## Library Versions
These are the supported versions of opusfile and opusenc, along with the corresponding version identifiers to add to your dub configuration or pass to the compiler. As of opus version 1.4.0, any opus version should work with these bindings.

> __Note__
>
> It is necessary to specify only a single version identifier per library. For example, `Opusfile_0_12` by itself will activate the opusfile binding.

<details>
	<summary><h3>opusfile versions</h3></summary>

| Version |Version identifier|
|---------|------------------|
| 0.12    | `Opusfile_0_12`  |

</details>

<details>
	<summary><h3>opusenc versions</h3></summary>

| Version |Version identifier|
|---------|------------------|
| 0.2     | `Opusenc_0_2`    |

</details>
