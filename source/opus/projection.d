/+
+                Copyright 2023 Aya Partridge
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module opus.projection;

import bindbc.opus.config;
import bindbc.opus.codegen;

enum{
	OPUS_PROJECTION_GET_DEMIXING_MATRIX_GAIN_REQUEST    = 6001,
	OPUS_PROJECTION_GET_DEMIXING_MATRIX_SIZE_REQUEST    = 6003,
	OPUS_PROJECTION_GET_DEMIXING_MATRIX_REQUEST         = 6005,
}

auto OPUS_PROJECTION_GET_DEMIXING_MATRIX_GAIN(OpusProjectionEncoder* st, int* x){ return opus_projection_encoder_ctl(st, OPUS_PROJECTION_GET_DEMIXING_MATRIX_GAIN_REQUEST, x); }
auto OPUS_PROJECTION_GET_DEMIXING_MATRIX_SIZE(OpusProjectionEncoder* st, int* x){ return opus_projection_encoder_ctl(st, OPUS_PROJECTION_GET_DEMIXING_MATRIX_SIZE_REQUEST, x); }
auto OPUS_PROJECTION_GET_DEMIXING_MATRIX(OpusProjectionEncoder* st, ubyte* x, int y){ return opus_projection_encoder_ctl(st, OPUS_PROJECTION_GET_DEMIXING_MATRIX_REQUEST, x, y); }

struct OpusProjectionEncoder;

struct OpusProjectionDecoder;

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{int}, q{opus_projection_ambisonics_encoder_get_size}, q{int channels, int mapping_family}},
		{q{OpusProjectionEncoder*}, q{opus_projection_ambisonics_encoder_create}, q{int Fs, int channels, int mapping_family, int* streams, int* coupled_streams, int application, int* error}},
		{q{int}, q{opus_projection_ambisonics_encoder_init}, q{OpusProjectionEncoder* st, int Fs, int channels, int mapping_family, int* streams, int* coupled_streams, int application}},
		{q{int}, q{opus_projection_encode}, q{OpusProjectionEncoder* st, const(short)* pcm, int frame_size, ubyte* data, int max_data_bytes}},
		{q{int}, q{opus_projection_encode_float}, q{OpusProjectionEncoder* st, const(float)* pcm, int frame_size, ubyte* data, int max_data_bytes}},
		{q{void}, q{opus_projection_encoder_destroy}, q{OpusProjectionEncoder* st}},
		{q{int}, q{opus_projection_encoder_ctl}, q{OpusProjectionEncoder* st, int request, ...}},
		{q{int}, q{opus_projection_decoder_get_size}, q{int channels, int streams, int coupled_streams}},
		{q{OpusProjectionDecoder*}, q{opus_projection_decoder_create}, q{int Fs, int channels, int streams, int coupled_streams, ubyte* demixing_matrix, int demixing_matrix_size, int* error}},
		{q{int}, q{opus_projection_decoder_init}, q{OpusProjectionDecoder* st, int Fs, int channels, int streams, int coupled_streams, ubyte* demixing_matrix, int demixing_matrix_size}},
		{q{int}, q{opus_projection_decode}, q{OpusProjectionDecoder* st, const(ubyte)* data, int len, short* pcm, int frame_size, int decode_fec}},
		{q{int}, q{opus_projection_decode_float}, q{OpusProjectionDecoder* st, const(ubyte)* data, int len, float* pcm, int frame_size, int decode_fec}},
		{q{int}, q{opus_projection_decoder_ctl}, q{OpusProjectionDecoder* st, int request, ...}},
		{q{void}, q{opus_projection_decoder_destroy}, q{OpusProjectionDecoder* st}},
	];
	return ret;
}()));
