/+
+                Copyright 2023 Aya Partridge
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module opusenc;

import bindbc.opus.config;
static if(bindOpusenc):
import bindbc.opus.codegen;

enum opusencVersion = (){
	version(Opusenc_0_2) return Version(0,2,0);
	else static assert(0);
}();

enum OPE_API_VERSION = 0;

enum{
	OPE_OK               = 0,
	OPE_BAD_ARG          = -11,
	OPE_INTERNAL_ERROR   = -13,
	OPE_UNIMPLEMENTED    = -15,
	OPE_ALLOC_FAIL       = -17,
	
	OPE_CANNOT_OPEN      = -30,
	OPE_TOO_LATE         = -31,
	OPE_INVALID_PICTURE  = -32,
	OPE_INVALID_ICON     = -33,
	OPE_WRITE_FAIL       = -34,
	OPE_CLOSE_FAIL       = -35,
}

enum{
	OPE_SET_DECISION_DELAY_REQUEST      = 14000,
	OPE_GET_DECISION_DELAY_REQUEST      = 14001,
	OPE_SET_MUXING_DELAY_REQUEST        = 14002,
	OPE_GET_MUXING_DELAY_REQUEST        = 14003,
	OPE_SET_COMMENT_PADDING_REQUEST     = 14004,
	OPE_GET_COMMENT_PADDING_REQUEST     = 14005,
	OPE_SET_SERIALNO_REQUEST            = 14006,
	OPE_GET_SERIALNO_REQUEST            = 14007,
	OPE_SET_PACKET_CALLBACK_REQUEST     = 14008,
	
	OPE_SET_HEADER_GAIN_REQUEST         = 14010,
	OPE_GET_HEADER_GAIN_REQUEST         = 14011,
	OPE_GET_NB_STREAMS_REQUEST          = 14013,
	OPE_GET_NB_COUPLED_STREAMS_REQUEST  = 14015,
}

alias ope_write_func = int function(void* user_data, const(ubyte)* ptr, int len);

alias ope_close_func = int function(void* user_data);

alias ope_packet_func = void function(void* user_data, const(ubyte)* packet_ptr, int packet_len, uint flags);

struct OpusEncCallbacks{
	ope_write_func write;
	ope_close_func close;
}

struct OggOpusComments;

struct OggOpusEnc;

pragma(inline,true) nothrow @nogc{
	auto OPE_SET_DECISION_DELAY(OggOpusEnc* enc, int x){ return ope_encoder_ctl(enc, OPE_SET_DECISION_DELAY_REQUEST, x); }
	auto OPE_GET_DECISION_DELAY(OggOpusEnc* enc, int* x){ return ope_encoder_ctl(enc, OPE_GET_DECISION_DELAY_REQUEST, x); }
	auto OPE_SET_MUXING_DELAY(OggOpusEnc* enc, int x){ return ope_encoder_ctl(enc, OPE_SET_MUXING_DELAY_REQUEST, x); }
	auto OPE_GET_MUXING_DELAY(OggOpusEnc* enc, int* x){ return ope_encoder_ctl(enc, OPE_GET_MUXING_DELAY_REQUEST, x); }
	auto OPE_SET_COMMENT_PADDING(OggOpusEnc* enc, int x){ return ope_encoder_ctl(enc, OPE_SET_COMMENT_PADDING_REQUEST, x); }
	auto OPE_GET_COMMENT_PADDING(OggOpusEnc* enc, int* x){ return ope_encoder_ctl(enc, OPE_GET_COMMENT_PADDING_REQUEST, x); }
	auto OPE_SET_SERIALNO(OggOpusEnc* enc, int x){ return ope_encoder_ctl(enc, OPE_SET_SERIALNO_REQUEST, x); }
	auto OPE_GET_SERIALNO(OggOpusEnc* enc, int* x){ return ope_encoder_ctl(enc, OPE_GET_SERIALNO_REQUEST, x); }
	auto OPE_SET_PACKET_CALLBACK(OggOpusEnc* enc, ope_packet_func x, void* u){ return ope_encoder_ctl(enc, OPE_SET_PACKET_CALLBACK_REQUEST, x, u); }
	auto OPE_SET_HEADER_GAIN(OggOpusEnc* enc, int x){ return ope_encoder_ctl(enc, OPE_SET_HEADER_GAIN_REQUEST, x); }
	auto OPE_GET_HEADER_GAIN(OggOpusEnc* enc, int* x){ return ope_encoder_ctl(enc, OPE_GET_HEADER_GAIN_REQUEST, x); }
	auto OPE_GET_NB_STREAMS(OggOpusEnc* enc, int* x){ return ope_encoder_ctl(enc, OPE_GET_NB_STREAMS_REQUEST, x); }
	auto OPE_GET_NB_COUPLED_STREAMS(OggOpusEnc* enc, int* x){ return ope_encoder_ctl(enc, OPE_GET_NB_COUPLED_STREAMS_REQUEST, x); }
}

mixin(joinFnBinds((){
	string[][] ret;
	ret ~= makeFnBinds([
		[q{OggOpusComments*}, q{ope_comments_create}, q{}],
		[q{OggOpusComments*}, q{ope_comments_copy}, q{OggOpusComments* comments}],
		[q{void}, q{ope_comments_destroy}, q{OggOpusComments* comments}],
		[q{int}, q{ope_comments_add}, q{OggOpusComments* comments, const(char)* tag, const(char)* val}],
		[q{int}, q{ope_comments_add_string}, q{OggOpusComments* comments, const(char)* tag_and_val}],
		[q{int}, q{ope_comments_add_picture}, q{OggOpusComments* comments, const(char)* filename, int picture_type, const(char)* description}],
		[q{int}, q{ope_comments_add_picture_from_memory}, q{OggOpusComments* comments, const(ubyte)* ptr, size_t size, int picture_type, const(char)* description}],
		[q{OggOpusEnc*}, q{ope_encoder_create_file}, q{const(char)* path, OggOpusComments* comments, int rate, int channels, int family, int* error}],
		[q{OggOpusEnc*}, q{ope_encoder_create_callbacks}, q{const(OpusEncCallbacks)* callbacks, void* user_data, OggOpusComments* comments, int rate, int channels, int family, int* error}],
		[q{OggOpusEnc*}, q{ope_encoder_create_pull}, q{OggOpusComments* comments, int rate, int channels, int family, int* error}],
		[q{int}, q{ope_encoder_deferred_init_with_mapping}, q{OggOpusEnc* enc, int family, int streams, int coupled_streams, const(ubyte)* mapping}],
		[q{int}, q{ope_encoder_write_float}, q{OggOpusEnc* enc, const(float)* pcm, int samples_per_channel}],
		[q{int}, q{ope_encoder_write}, q{OggOpusEnc* enc, const(short)* pcm, int samples_per_channel}],
		[q{int}, q{ope_encoder_get_page}, q{OggOpusEnc* enc, ubyte* *page, int* len, int flush}],
		[q{int}, q{ope_encoder_drain}, q{OggOpusEnc* enc}],
		[q{void}, q{ope_encoder_destroy}, q{OggOpusEnc* enc}],
		[q{int}, q{ope_encoder_chain_current}, q{OggOpusEnc* enc, OggOpusComments* comments}],
		[q{int}, q{ope_encoder_continue_new_file}, q{OggOpusEnc* enc, const(char)* path, OggOpusComments* comments}],
		[q{int}, q{ope_encoder_continue_new_callbacks}, q{OggOpusEnc* enc, void* user_data, OggOpusComments* comments}],
		[q{int}, q{ope_encoder_flush_header}, q{OggOpusEnc* enc}],
		[q{int}, q{ope_encoder_ctl}, q{OggOpusEnc* enc, int request, ...}],
		[q{const(char)*}, q{ope_strerror}, q{int error}],
		[q{const(char)*}, q{ope_get_version_string}, q{}],
		[q{int}, q{ope_get_abi_version}, q{}],
	]);
	return ret;
}(), __MODULE__));

static if(!staticBinding):
import bindbc.loader;

mixin(makeDynloadFns("Opusenc", makeLibPaths(["opusenc"]), [__MODULE__]));
