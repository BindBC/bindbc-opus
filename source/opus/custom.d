/+
+            Copyright 2023 – 2024 Aya Partridge
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module opus.custom;

version(Opus_Custom):
import bindbc.opus.config;
import bindbc.opus.codegen;

struct OpusCustomEncoder;

struct OpusCustomDecoder;

struct OpusCustomMode;

pragma(inline,true) nothrow @nogc{
	auto OPUS_SET_COMPLEXITY(OpusEncoder* st, int x){ return opus_custom_encoder_ctl(st, OPUS_SET_COMPLEXITY_REQUEST, x); }
	auto OPUS_GET_COMPLEXITY(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_COMPLEXITY_REQUEST, x); }
	auto OPUS_SET_BITRATE(OpusEncoder* st, int x){ return opus_custom_encoder_ctl(st, OPUS_SET_BITRATE_REQUEST, x); }
	auto OPUS_GET_BITRATE(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_BITRATE_REQUEST, x); }
	auto OPUS_SET_VBR(OpusEncoder* st, int x){ return opus_custom_encoder_ctl(st, OPUS_SET_VBR_REQUEST, x); }
	auto OPUS_GET_VBR(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_VBR_REQUEST, x); }
	auto OPUS_SET_VBR_CONSTRAINT(OpusEncoder* st, int x){ return opus_custom_encoder_ctl(st, OPUS_SET_VBR_CONSTRAINT_REQUEST, x); }
	auto OPUS_GET_VBR_CONSTRAINT(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_VBR_CONSTRAINT_REQUEST, x); }
	auto OPUS_SET_FORCE_CHANNELS(OpusEncoder* st, int x){ return opus_custom_encoder_ctl(st, OPUS_SET_FORCE_CHANNELS_REQUEST, x); }
	auto OPUS_GET_FORCE_CHANNELS(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_FORCE_CHANNELS_REQUEST, x); }
	auto OPUS_SET_MAX_BANDWIDTH(OpusEncoder* st, int x){ return opus_custom_encoder_ctl(st, OPUS_SET_MAX_BANDWIDTH_REQUEST, x); }
	auto OPUS_GET_MAX_BANDWIDTH(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_MAX_BANDWIDTH_REQUEST, x); }
	auto OPUS_SET_BANDWIDTH(OpusEncoder* st, int x){ return opus_custom_encoder_ctl(st, OPUS_SET_BANDWIDTH_REQUEST, x); }
	auto OPUS_SET_SIGNAL(OpusEncoder* st, int x){ return opus_custom_encoder_ctl(st, OPUS_SET_SIGNAL_REQUEST, x); }
	auto OPUS_GET_SIGNAL(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_SIGNAL_REQUEST, x); }
	auto OPUS_SET_APPLICATION(OpusEncoder* st, int x){ return opus_custom_encoder_ctl(st, OPUS_SET_APPLICATION_REQUEST, x); }
	auto OPUS_GET_APPLICATION(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_APPLICATION_REQUEST, x); }
	auto OPUS_GET_LOOKAHEAD(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_LOOKAHEAD_REQUEST, x); }
	auto OPUS_SET_INBAND_FEC(OpusEncoder* st, int x){ return opus_custom_encoder_ctl(st, OPUS_SET_INBAND_FEC_REQUEST, x); }
	auto OPUS_GET_INBAND_FEC(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_INBAND_FEC_REQUEST, x); }
	auto OPUS_SET_PACKET_LOSS_PERC(OpusEncoder* st, int x){ return opus_custom_encoder_ctl(st, OPUS_SET_PACKET_LOSS_PERC_REQUEST, x); }
	auto OPUS_GET_PACKET_LOSS_PERC(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_PACKET_LOSS_PERC_REQUEST, x); }
	auto OPUS_SET_DTX(OpusEncoder* st, int x){ return opus_custom_encoder_ctl(st, OPUS_SET_DTX_REQUEST, x); }
	auto OPUS_GET_DTX(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_DTX_REQUEST, x); }
	auto OPUS_SET_LSB_DEPTH(OpusEncoder* st, int x){ return opus_custom_encoder_ctl(st, OPUS_SET_LSB_DEPTH_REQUEST, x); }
	auto OPUS_GET_LSB_DEPTH(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_LSB_DEPTH_REQUEST, x); }
	auto OPUS_SET_EXPERT_FRAME_DURATION(OpusEncoder* st, int x){ return opus_custom_encoder_ctl(st, OPUS_SET_EXPERT_FRAME_DURATION_REQUEST, x); }
	auto OPUS_GET_EXPERT_FRAME_DURATION(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_EXPERT_FRAME_DURATION_REQUEST, x); }
	auto OPUS_SET_PREDICTION_DISABLED(OpusEncoder* st, int x){ return opus_custom_encoder_ctl(st, OPUS_SET_PREDICTION_DISABLED_REQUEST, x); }
	auto OPUS_GET_PREDICTION_DISABLED(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_PREDICTION_DISABLED_REQUEST, x); }
	
	auto OPUS_GET_FINAL_RANGE(OpusEncoder* st, uint* x){ return opus_custom_encoder_ctl(st, OPUS_GET_FINAL_RANGE_REQUEST, x); }
	auto OPUS_GET_FINAL_RANGE(OpusDecoder* st, uint* x){ return opus_custom_decoder_ctl(st, OPUS_GET_FINAL_RANGE_REQUEST, x); }
	auto OPUS_GET_BANDWIDTH(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_BANDWIDTH_REQUEST, x); }
	auto OPUS_GET_BANDWIDTH(OpusDecoder* st, int* x){ return opus_custom_decoder_ctl(st, OPUS_GET_BANDWIDTH_REQUEST, x); }
	auto OPUS_GET_SAMPLE_RATE(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_SAMPLE_RATE_REQUEST, x); }
	auto OPUS_GET_SAMPLE_RATE(OpusDecoder* st, int* x){ return opus_custom_decoder_ctl(st, OPUS_GET_SAMPLE_RATE_REQUEST, x); }
	auto OPUS_SET_PHASE_INVERSION_DISABLED(OpusEncoder* st, int x){ return opus_custom_encoder_ctl(st, OPUS_SET_PHASE_INVERSION_DISABLED_REQUEST, x); }
	auto OPUS_SET_PHASE_INVERSION_DISABLED(OpusDecoder* st, int x){ return opus_custom_decoder_ctl(st, OPUS_SET_PHASE_INVERSION_DISABLED_REQUEST, x); }
	auto OPUS_GET_PHASE_INVERSION_DISABLED(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_PHASE_INVERSION_DISABLED_REQUEST, x); }
	auto OPUS_GET_PHASE_INVERSION_DISABLED(OpusDecoder* st, int* x){ return opus_custom_decoder_ctl(st, OPUS_GET_PHASE_INVERSION_DISABLED_REQUEST, x); }
	auto OPUS_GET_IN_DTX(OpusEncoder* st, int* x){ return opus_custom_encoder_ctl(st, OPUS_GET_IN_DTX_REQUEST, x); }
	auto OPUS_GET_IN_DTX(OpusDecoder* st, int* x){ return opus_custom_decoder_ctl(st, OPUS_GET_IN_DTX_REQUEST, x); }
	
	auto OPUS_SET_GAIN(OpusDecoder* st, int x){ return opus_custom_decoder_ctl(st, OPUS_SET_GAIN_REQUEST, x); }
	auto OPUS_GET_GAIN(OpusDecoder* st, int* x){ return opus_custom_decoder_ctl(st, OPUS_GET_GAIN_REQUEST, x); }
	auto OPUS_GET_LAST_PACKET_DURATION(OpusDecoder* st, int* x){ return opus_custom_decoder_ctl(st, OPUS_GET_LAST_PACKET_DURATION_REQUEST, x); }
	auto OPUS_GET_PITCH(OpusDecoder* st, int* x){ return opus_custom_decoder_ctl(st, OPUS_GET_PITCH_REQUEST, x); }
}

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{OpusCustomMode*}, q{opus_custom_mode_create}, q{int fs, int frameSize, int* error}},
		{q{void}, q{opus_custom_mode_destroy}, q{OpusCustomMode* mode}},
		{q{int}, q{opus_custom_encoder_get_size}, q{const(OpusCustomMode)* mode, int channels}},
		{q{int}, q{opus_custom_encoder_init}, q{OpusCustomEncoder* st, const(OpusCustomMode)* mode, int channels}},
		{q{OpusCustomEncoder*}, q{opus_custom_encoder_create}, q{const(OpusCustomMode)* mode, int channels, int* error}},
		{q{void}, q{opus_custom_encoder_destroy}, q{OpusCustomEncoder* st}},
		{q{int}, q{opus_custom_encode_float}, q{OpusCustomEncoder* st, const(float)* pcm, int frameSize, ubyte* compressed, int maxCompressedBytes}},
		{q{int}, q{opus_custom_encode}, q{OpusCustomEncoder* st, const(short)* pcm, int frameSize, ubyte* compressed, int maxCompressedBytes}},
		{q{int}, q{opus_custom_encoder_ctl}, q{OpusCustomEncoder* st, int request, ...}},
		{q{int}, q{opus_custom_decoder_get_size}, q{const(OpusCustomMode)* mode, int channels}},
		{q{int}, q{opus_custom_decoder_init}, q{OpusCustomDecoder* st, const(OpusCustomMode)* mode, int channels}},
		{q{OpusCustomDecoder*}, q{opus_custom_decoder_create}, q{const(OpusCustomMode)* mode, int channels, int* error}},
		{q{void}, q{opus_custom_decoder_destroy}, q{OpusCustomDecoder* st}},
		{q{int}, q{opus_custom_decode_float}, q{OpusCustomDecoder* st, const(ubyte)* data, int len, float* pcm, int frameSize}},
		{q{int}, q{opus_custom_decode}, q{OpusCustomDecoder* st, const(ubyte)* data, int len, short* pcm, int frameSize}},
		{q{int}, q{opus_custom_decoder_ctl}, q{OpusCustomDecoder* st, int request, ...}},
	];
	return ret;
}()));
