/+
+                Copyright 2023 Aya Partridge
+ Distributed under the Boost Software License,Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module opus.defines;

import bindbc.opus.config;
import bindbc.opus.codegen;

import opus.opus: OpusEncoder, OpusDecoder, opus_encoder_ctl, opus_decoder_ctl;
import opus.multistream: OpusMSEncoder, OpusMSDecoder, opus_multistream_encoder_ctl, opus_multistream_decoder_ctl;

enum: int{
	OPUS_OK                =  0,
	OPUS_BAD_ARG           = -1,
	OPUS_BUFFER_TOO_SMALL  = -2,
	OPUS_INTERNAL_ERROR    = -3,
	OPUS_INVALID_PACKET    = -4,
	OPUS_UNIMPLEMENTED     = -5,
	OPUS_INVALID_STATE     = -6,
	OPUS_ALLOC_FAIL        = -7,
}

enum: int{
	OPUS_SET_APPLICATION_REQUEST         = 4000,
	OPUS_GET_APPLICATION_REQUEST         = 4001,
	OPUS_SET_BITRATE_REQUEST             = 4002,
	OPUS_GET_BITRATE_REQUEST             = 4003,
	OPUS_SET_MAX_BANDWIDTH_REQUEST       = 4004,
	OPUS_GET_MAX_BANDWIDTH_REQUEST       = 4005,
	OPUS_SET_VBR_REQUEST                 = 4006,
	OPUS_GET_VBR_REQUEST                 = 4007,
	OPUS_SET_BANDWIDTH_REQUEST           = 4008,
	OPUS_GET_BANDWIDTH_REQUEST           = 4009,
	OPUS_SET_COMPLEXITY_REQUEST          = 4010,
	OPUS_GET_COMPLEXITY_REQUEST          = 4011,
	OPUS_SET_INBAND_FEC_REQUEST          = 4012,
	OPUS_GET_INBAND_FEC_REQUEST          = 4013,
	OPUS_SET_PACKET_LOSS_PERC_REQUEST    = 4014,
	OPUS_GET_PACKET_LOSS_PERC_REQUEST    = 4015,
	OPUS_SET_DTX_REQUEST                 = 4016,
	OPUS_GET_DTX_REQUEST                 = 4017,
	OPUS_SET_VBR_CONSTRAINT_REQUEST      = 4020,
	OPUS_GET_VBR_CONSTRAINT_REQUEST      = 4021,
	OPUS_SET_FORCE_CHANNELS_REQUEST      = 4022,
	OPUS_GET_FORCE_CHANNELS_REQUEST      = 4023,
	OPUS_SET_SIGNAL_REQUEST              = 4024,
	OPUS_GET_SIGNAL_REQUEST              = 4025,
	OPUS_GET_LOOKAHEAD_REQUEST           = 4027,
	OPUS_GET_SAMPLE_RATE_REQUEST         = 4029,
	OPUS_GET_FINAL_RANGE_REQUEST         = 4031,
	OPUS_GET_PITCH_REQUEST               = 4033,
	OPUS_SET_GAIN_REQUEST                = 4034,
	OPUS_GET_GAIN_REQUEST                = 4045,
	OPUS_SET_LSB_DEPTH_REQUEST           = 4036,
	OPUS_GET_LSB_DEPTH_REQUEST           = 4037,
	OPUS_GET_LAST_PACKET_DURATION_REQUEST = 4039,
	OPUS_SET_EXPERT_FRAME_DURATION_REQUEST = 4040,
	OPUS_GET_EXPERT_FRAME_DURATION_REQUEST = 4041,
	OPUS_SET_PREDICTION_DISABLED_REQUEST = 4042,
	OPUS_GET_PREDICTION_DISABLED_REQUEST = 4043,
	OPUS_SET_PHASE_INVERSION_DISABLED_REQUEST = 4046,
	OPUS_GET_PHASE_INVERSION_DISABLED_REQUEST = 4047,
	OPUS_GET_IN_DTX_REQUEST              = 4049,
	
	OPUS_AUTO                            = -1000,
	OPUS_BITRATE_MAX                     = -1,
	
	OPUS_APPLICATION_VOIP                = 2048,
	OPUS_APPLICATION_AUDIO               = 2049,
	OPUS_APPLICATION_RESTRICTED_LOWDELAY = 2051,
	
	OPUS_SIGNAL_VOICE                    = 3001,
	OPUS_SIGNAL_MUSIC                    = 3002,
	OPUS_BANDWIDTH_NARROWBAND            = 1101,
	OPUS_BANDWIDTH_MEDIUMBAND            = 1102,
	OPUS_BANDWIDTH_WIDEBAND              = 1103,
	OPUS_BANDWIDTH_SUPERWIDEBAND         = 1104,
	OPUS_BANDWIDTH_FULLBAND              = 1105,
	
	OPUS_FRAMESIZE_ARG                   = 5000,
	OPUS_FRAMESIZE_2_5_MS                = 5001,
	OPUS_FRAMESIZE_5_MS                  = 5002,
	OPUS_FRAMESIZE_10_MS                 = 5003,
	OPUS_FRAMESIZE_20_MS                 = 5004,
	OPUS_FRAMESIZE_40_MS                 = 5005,
	OPUS_FRAMESIZE_60_MS                 = 5006,
	OPUS_FRAMESIZE_80_MS                 = 5007,
	OPUS_FRAMESIZE_100_MS                = 5008,
	OPUS_FRAMESIZE_120_MS                = 5009,
	
	OPUS_RESET_STATE                     = 4028,
}

pragma(inline,true) nothrow @nogc{
	auto OPUS_SET_COMPLEXITY(OpusEncoder* st, int x){ return opus_encoder_ctl(st, OPUS_SET_COMPLEXITY_REQUEST, x); }
	auto OPUS_SET_COMPLEXITY(OpusMSEncoder* st, int x){ return opus_multistream_encoder_ctl(st, OPUS_SET_COMPLEXITY_REQUEST, x); }
	auto OPUS_GET_COMPLEXITY(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_COMPLEXITY_REQUEST, x); }
	auto OPUS_GET_COMPLEXITY(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_COMPLEXITY_REQUEST, x); }
	auto OPUS_SET_BITRATE(OpusEncoder* st, int x){ return opus_encoder_ctl(st, OPUS_SET_BITRATE_REQUEST, x); }
	auto OPUS_SET_BITRATE(OpusMSEncoder* st, int x){ return opus_multistream_encoder_ctl(st, OPUS_SET_BITRATE_REQUEST, x); }
	auto OPUS_GET_BITRATE(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_BITRATE_REQUEST, x); }
	auto OPUS_GET_BITRATE(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_BITRATE_REQUEST, x); }
	auto OPUS_SET_VBR(OpusEncoder* st, int x){ return opus_encoder_ctl(st, OPUS_SET_VBR_REQUEST, x); }
	auto OPUS_SET_VBR(OpusMSEncoder* st, int x){ return opus_multistream_encoder_ctl(st, OPUS_SET_VBR_REQUEST, x); }
	auto OPUS_GET_VBR(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_VBR_REQUEST, x); }
	auto OPUS_GET_VBR(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_VBR_REQUEST, x); }
	auto OPUS_SET_VBR_CONSTRAINT(OpusEncoder* st, int x){ return opus_encoder_ctl(st, OPUS_SET_VBR_CONSTRAINT_REQUEST, x); }
	auto OPUS_SET_VBR_CONSTRAINT(OpusMSEncoder* st, int x){ return opus_multistream_encoder_ctl(st, OPUS_SET_VBR_CONSTRAINT_REQUEST, x); }
	auto OPUS_GET_VBR_CONSTRAINT(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_VBR_CONSTRAINT_REQUEST, x); }
	auto OPUS_GET_VBR_CONSTRAINT(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_VBR_CONSTRAINT_REQUEST, x); }
	auto OPUS_SET_FORCE_CHANNELS(OpusEncoder* st, int x){ return opus_encoder_ctl(st, OPUS_SET_FORCE_CHANNELS_REQUEST, x); }
	auto OPUS_SET_FORCE_CHANNELS(OpusMSEncoder* st, int x){ return opus_multistream_encoder_ctl(st, OPUS_SET_FORCE_CHANNELS_REQUEST, x); }
	auto OPUS_GET_FORCE_CHANNELS(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_FORCE_CHANNELS_REQUEST, x); }
	auto OPUS_GET_FORCE_CHANNELS(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_FORCE_CHANNELS_REQUEST, x); }
	auto OPUS_SET_MAX_BANDWIDTH(OpusEncoder* st, int x){ return opus_encoder_ctl(st, OPUS_SET_MAX_BANDWIDTH_REQUEST, x); }
	auto OPUS_SET_MAX_BANDWIDTH(OpusMSEncoder* st, int x){ return opus_multistream_encoder_ctl(st, OPUS_SET_MAX_BANDWIDTH_REQUEST, x); }
	auto OPUS_GET_MAX_BANDWIDTH(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_MAX_BANDWIDTH_REQUEST, x); }
	auto OPUS_GET_MAX_BANDWIDTH(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_MAX_BANDWIDTH_REQUEST, x); }
	auto OPUS_SET_BANDWIDTH(OpusEncoder* st, int x){ return opus_encoder_ctl(st, OPUS_SET_BANDWIDTH_REQUEST, x); }
	auto OPUS_SET_BANDWIDTH(OpusMSEncoder* st, int x){ return opus_multistream_encoder_ctl(st, OPUS_SET_BANDWIDTH_REQUEST, x); }
	auto OPUS_SET_SIGNAL(OpusEncoder* st, int x){ return opus_encoder_ctl(st, OPUS_SET_SIGNAL_REQUEST, x); }
	auto OPUS_SET_SIGNAL(OpusMSEncoder* st, int x){ return opus_multistream_encoder_ctl(st, OPUS_SET_SIGNAL_REQUEST, x); }
	auto OPUS_GET_SIGNAL(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_SIGNAL_REQUEST, x); }
	auto OPUS_GET_SIGNAL(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_SIGNAL_REQUEST, x); }
	auto OPUS_SET_APPLICATION(OpusEncoder* st, int x){ return opus_encoder_ctl(st, OPUS_SET_APPLICATION_REQUEST, x); }
	auto OPUS_SET_APPLICATION(OpusMSEncoder* st, int x){ return opus_multistream_encoder_ctl(st, OPUS_SET_APPLICATION_REQUEST, x); }
	auto OPUS_GET_APPLICATION(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_APPLICATION_REQUEST, x); }
	auto OPUS_GET_APPLICATION(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_APPLICATION_REQUEST, x); }
	auto OPUS_GET_LOOKAHEAD(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_LOOKAHEAD_REQUEST, x); }
	auto OPUS_GET_LOOKAHEAD(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_LOOKAHEAD_REQUEST, x); }
	auto OPUS_SET_INBAND_FEC(OpusEncoder* st, int x){ return opus_encoder_ctl(st, OPUS_SET_INBAND_FEC_REQUEST, x); }
	auto OPUS_SET_INBAND_FEC(OpusMSEncoder* st, int x){ return opus_multistream_encoder_ctl(st, OPUS_SET_INBAND_FEC_REQUEST, x); }
	auto OPUS_GET_INBAND_FEC(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_INBAND_FEC_REQUEST, x); }
	auto OPUS_GET_INBAND_FEC(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_INBAND_FEC_REQUEST, x); }
	auto OPUS_SET_PACKET_LOSS_PERC(OpusEncoder* st, int x){ return opus_encoder_ctl(st, OPUS_SET_PACKET_LOSS_PERC_REQUEST, x); }
	auto OPUS_SET_PACKET_LOSS_PERC(OpusMSEncoder* st, int x){ return opus_multistream_encoder_ctl(st, OPUS_SET_PACKET_LOSS_PERC_REQUEST, x); }
	auto OPUS_GET_PACKET_LOSS_PERC(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_PACKET_LOSS_PERC_REQUEST, x); }
	auto OPUS_GET_PACKET_LOSS_PERC(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_PACKET_LOSS_PERC_REQUEST, x); }
	auto OPUS_SET_DTX(OpusEncoder* st, int x){ return opus_encoder_ctl(st, OPUS_SET_DTX_REQUEST, x); }
	auto OPUS_SET_DTX(OpusMSEncoder* st, int x){ return opus_multistream_encoder_ctl(st, OPUS_SET_DTX_REQUEST, x); }
	auto OPUS_GET_DTX(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_DTX_REQUEST, x); }
	auto OPUS_GET_DTX(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_DTX_REQUEST, x); }
	auto OPUS_SET_LSB_DEPTH(OpusEncoder* st, int x){ return opus_encoder_ctl(st, OPUS_SET_LSB_DEPTH_REQUEST, x); }
	auto OPUS_SET_LSB_DEPTH(OpusMSEncoder* st, int x){ return opus_multistream_encoder_ctl(st, OPUS_SET_LSB_DEPTH_REQUEST, x); }
	auto OPUS_GET_LSB_DEPTH(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_LSB_DEPTH_REQUEST, x); }
	auto OPUS_GET_LSB_DEPTH(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_LSB_DEPTH_REQUEST, x); }
	auto OPUS_SET_EXPERT_FRAME_DURATION(OpusEncoder* st, int x){ return opus_encoder_ctl(st, OPUS_SET_EXPERT_FRAME_DURATION_REQUEST, x); }
	auto OPUS_SET_EXPERT_FRAME_DURATION(OpusMSEncoder* st, int x){ return opus_multistream_encoder_ctl(st, OPUS_SET_EXPERT_FRAME_DURATION_REQUEST, x); }
	auto OPUS_GET_EXPERT_FRAME_DURATION(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_EXPERT_FRAME_DURATION_REQUEST, x); }
	auto OPUS_GET_EXPERT_FRAME_DURATION(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_EXPERT_FRAME_DURATION_REQUEST, x); }
	auto OPUS_SET_PREDICTION_DISABLED(OpusEncoder* st, int x){ return opus_encoder_ctl(st, OPUS_SET_PREDICTION_DISABLED_REQUEST, x); }
	auto OPUS_SET_PREDICTION_DISABLED(OpusMSEncoder* st, int x){ return opus_multistream_encoder_ctl(st, OPUS_SET_PREDICTION_DISABLED_REQUEST, x); }
	auto OPUS_GET_PREDICTION_DISABLED(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_PREDICTION_DISABLED_REQUEST, x); }
	auto OPUS_GET_PREDICTION_DISABLED(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_PREDICTION_DISABLED_REQUEST, x); }
	
	auto OPUS_GET_FINAL_RANGE(OpusEncoder* st, uint* x){ return opus_encoder_ctl(st, OPUS_GET_FINAL_RANGE_REQUEST, x); }
	auto OPUS_GET_FINAL_RANGE(OpusMSEncoder* st, uint* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_FINAL_RANGE_REQUEST, x); }
	auto OPUS_GET_FINAL_RANGE(OpusDecoder* st, uint* x){ return opus_decoder_ctl(st, OPUS_GET_FINAL_RANGE_REQUEST, x); }
	auto OPUS_GET_FINAL_RANGE(OpusMSDecoder* st, uint* x){ return opus_multistream_decoder_ctl(st, OPUS_GET_FINAL_RANGE_REQUEST, x); }
	auto OPUS_GET_BANDWIDTH(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_BANDWIDTH_REQUEST, x); }
	auto OPUS_GET_BANDWIDTH(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_BANDWIDTH_REQUEST, x); }
	auto OPUS_GET_BANDWIDTH(OpusDecoder* st, int* x){ return opus_decoder_ctl(st, OPUS_GET_BANDWIDTH_REQUEST, x); }
	auto OPUS_GET_BANDWIDTH(OpusMSDecoder* st, int* x){ return opus_multistream_decoder_ctl(st, OPUS_GET_BANDWIDTH_REQUEST, x); }
	auto OPUS_GET_SAMPLE_RATE(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_SAMPLE_RATE_REQUEST, x); }
	auto OPUS_GET_SAMPLE_RATE(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_SAMPLE_RATE_REQUEST, x); }
	auto OPUS_GET_SAMPLE_RATE(OpusDecoder* st, int* x){ return opus_decoder_ctl(st, OPUS_GET_SAMPLE_RATE_REQUEST, x); }
	auto OPUS_GET_SAMPLE_RATE(OpusMSDecoder* st, int* x){ return opus_multistream_decoder_ctl(st, OPUS_GET_SAMPLE_RATE_REQUEST, x); }
	auto OPUS_SET_PHASE_INVERSION_DISABLED(OpusEncoder* st, int x){ return opus_encoder_ctl(st, OPUS_SET_PHASE_INVERSION_DISABLED_REQUEST, x); }
	auto OPUS_SET_PHASE_INVERSION_DISABLED(OpusMSEncoder* st, int x){ return opus_multistream_encoder_ctl(st, OPUS_SET_PHASE_INVERSION_DISABLED_REQUEST, x); }
	auto OPUS_SET_PHASE_INVERSION_DISABLED(OpusDecoder* st, int x){ return opus_decoder_ctl(st, OPUS_SET_PHASE_INVERSION_DISABLED_REQUEST, x); }
	auto OPUS_SET_PHASE_INVERSION_DISABLED(OpusMSDecoder* st, int x){ return opus_multistream_decoder_ctl(st, OPUS_SET_PHASE_INVERSION_DISABLED_REQUEST, x); }
	auto OPUS_GET_PHASE_INVERSION_DISABLED(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_PHASE_INVERSION_DISABLED_REQUEST, x); }
	auto OPUS_GET_PHASE_INVERSION_DISABLED(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_PHASE_INVERSION_DISABLED_REQUEST, x); }
	auto OPUS_GET_PHASE_INVERSION_DISABLED(OpusDecoder* st, int* x){ return opus_decoder_ctl(st, OPUS_GET_PHASE_INVERSION_DISABLED_REQUEST, x); }
	auto OPUS_GET_PHASE_INVERSION_DISABLED(OpusMSDecoder* st, int* x){ return opus_multistream_decoder_ctl(st, OPUS_GET_PHASE_INVERSION_DISABLED_REQUEST, x); }
	auto OPUS_GET_IN_DTX(OpusEncoder* st, int* x){ return opus_encoder_ctl(st, OPUS_GET_IN_DTX_REQUEST, x); }
	auto OPUS_GET_IN_DTX(OpusMSEncoder* st, int* x){ return opus_multistream_encoder_ctl(st, OPUS_GET_IN_DTX_REQUEST, x); }
	auto OPUS_GET_IN_DTX(OpusDecoder* st, int* x){ return opus_decoder_ctl(st, OPUS_GET_IN_DTX_REQUEST, x); }
	auto OPUS_GET_IN_DTX(OpusMSDecoder* st, int* x){ return opus_multistream_decoder_ctl(st, OPUS_GET_IN_DTX_REQUEST, x); }
	
	auto OPUS_SET_GAIN(OpusDecoder* st, int x){ return opus_decoder_ctl(st, OPUS_SET_GAIN_REQUEST, x); }
	auto OPUS_SET_GAIN(OpusMSDecoder* st, int x){ return opus_multistream_decoder_ctl(st, OPUS_SET_GAIN_REQUEST, x); }
	auto OPUS_GET_GAIN(OpusDecoder* st, int* x){ return opus_decoder_ctl(st, OPUS_GET_GAIN_REQUEST, x); }
	auto OPUS_GET_GAIN(OpusMSDecoder* st, int* x){ return opus_multistream_decoder_ctl(st, OPUS_GET_GAIN_REQUEST, x); }
	auto OPUS_GET_LAST_PACKET_DURATION(OpusDecoder* st, int* x){ return opus_decoder_ctl(st, OPUS_GET_LAST_PACKET_DURATION_REQUEST, x); }
	auto OPUS_GET_LAST_PACKET_DURATION(OpusMSDecoder* st, int* x){ return opus_multistream_decoder_ctl(st, OPUS_GET_LAST_PACKET_DURATION_REQUEST, x); }
	auto OPUS_GET_PITCH(OpusDecoder* st, int* x){ return opus_decoder_ctl(st, OPUS_GET_PITCH_REQUEST, x); }
	auto OPUS_GET_PITCH(OpusMSDecoder* st, int* x){ return opus_multistream_decoder_ctl(st, OPUS_GET_PITCH_REQUEST, x); }
}

mixin(joinFnBinds((){
	string[][] ret;
	ret ~= makeFnBinds([
		[q{const(char)*}, q{opus_strerror}, q{int error}],
		[q{const(char)*}, q{opus_get_version_string}, q{}],
	]);
	return ret;
}()));
