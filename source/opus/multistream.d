/+
+            Copyright 2023 – 2024 Aya Partridge
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module opus.multistream;

import bindbc.opus.config;
import bindbc.opus.codegen;

import bindbc.opus;

enum{
	OPUS_MULTISTREAM_GET_ENCODER_STATE_REQUEST = 5120,
	OPUS_MULTISTREAM_GET_DECODER_STATE_REQUEST = 5122,
}

pragma(inline,true) nothrow @nogc{
	auto OPUS_MULTISTREAM_GET_ENCODER_STATE(OpusMSEncoder* st, int x, OpusEncoder* y){ return opus_multistream_encoder_ctl(st, OPUS_MULTISTREAM_GET_ENCODER_STATE_REQUEST, x, y); }
	auto OPUS_MULTISTREAM_GET_DECODER_STATE(OpusMSDecoder* st, int x, OpusDecoder* y){ return opus_multistream_decoder_ctl(st, OPUS_MULTISTREAM_GET_DECODER_STATE_REQUEST, x, y); }
}

struct OpusMSEncoder;

struct OpusMSDecoder;

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{int}, q{opus_multistream_encoder_get_size}, q{int streams, int coupledStreams}},
		{q{int}, q{opus_multistream_surround_encoder_get_size}, q{int channels, int mappingFamily}},
		{q{OpusMSEncoder*}, q{opus_multistream_encoder_create}, q{int fs, int channels, int streams, int coupledStreams, const(ubyte)* mapping, int application, int* error}},
		{q{OpusMSEncoder*}, q{opus_multistream_surround_encoder_create}, q{int fs, int channels, int mappingFamily, int* streams, int* coupledStreams, ubyte* mapping, int application, int* error}},
		{q{int}, q{opus_multistream_encoder_init}, q{OpusMSEncoder* st, int fs, int channels, int streams, int coupledStreams, const(ubyte)* mapping, int application}},
		{q{int}, q{opus_multistream_surround_encoder_init}, q{OpusMSEncoder* st, int fs, int channels, int mappingFamily, int* streams, int* coupledStreams, ubyte* mapping, int application}},
		{q{int}, q{opus_multistream_encode}, q{OpusMSEncoder* st, const(short)* pcm, int frameSize, ubyte* data, int maxDataBytes}},
		{q{int}, q{opus_multistream_encode_float}, q{OpusMSEncoder* st, const(float)* pcm, int frameSize, ubyte* data, int maxDataBytes}},
		{q{int}, q{opus_multistream_encoder_ctl}, q{OpusMSEncoder* st, int request, ...}},
		{q{int}, q{opus_multistream_decoder_get_size}, q{int streams, int coupled_streams}},
		{q{OpusMSDecoder*}, q{opus_multistream_decoder_create}, q{int fs, int channels, int streams, int coupled_streams, const(ubyte)* mapping, int* error}},
		{q{int}, q{opus_multistream_decoder_init}, q{OpusMSDecoder* st, int fs, int channels, int streams, int coupledStreams, const(ubyte)* mapping}},
		{q{int}, q{opus_multistream_decode}, q{OpusMSDecoder* st, const(ubyte)* data, int len, short* pcm, int frameSize, int decodeFEC}},
		{q{int}, q{opus_multistream_decode_float}, q{OpusMSDecoder* st, const(ubyte)* data, int len, float* pcm, int frameSize, int decodeFEC}},
		{q{int}, q{opus_multistream_decoder_ctl}, q{OpusMSDecoder* st, int request, ...}},
		{q{void}, q{opus_multistream_decoder_destroy}, q{OpusMSDecoder* st}},
	];
	return ret;
}()));
