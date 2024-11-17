/+
+            Copyright 2023 – 2024 Aya Partridge
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module opus;

import bindbc.opus.config;
import bindbc.opus.codegen;

public import
	opus.custom,
	opus.defines,
	opus.multistream,
	opus.projection;

struct OpusEncoder;

struct OpusDecoder;

struct OpusRepacketiser;
alias OpusRepacketizer = OpusRepacketiser;

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{int}, q{opus_encoder_get_size}, q{int channels}},
		{q{OpusEncoder*}, q{opus_encoder_create}, q{int fs, int channels, int application, int* error}},
		{q{int}, q{opus_encoder_init}, q{OpusEncoder* st, int fs, int channels, int application}},
		{q{int}, q{opus_encode}, q{OpusEncoder* st, const(short)* pcm, int frameSize, ubyte* data, int maxDataBytes}},
		{q{int}, q{opus_encode_float}, q{OpusEncoder* st, const(float)* pcm, int frameSize, ubyte* data, int maxDataBytes}},
		{q{int}, q{opus_encoder_ctl}, q{OpusEncoder* st, int request, ...}},
		{q{int}, q{opus_decoder_get_size}, q{int channels}},
		{q{OpusDecoder*}, q{opus_decoder_create}, q{int fs, int channels, int* error}},
		{q{int}, q{opus_decoder_init}, q{OpusDecoder* st, int fs, int channels}},
		{q{int}, q{opus_decode}, q{OpusDecoder* st, const(ubyte)* data, int len, short* pcm, int frameSize, int decodeFEC}},
		{q{int}, q{opus_decode_float}, q{OpusDecoder* st, const(ubyte)* data, int len, float* pcm, int frameSize, int decodeFEC}},
		{q{int}, q{opus_decoder_ctl}, q{OpusDecoder* st, int request, ...}},
		{q{void}, q{opus_decoder_destroy}, q{OpusDecoder* st}},
		{q{int}, q{opus_packet_parse}, q{const(ubyte)* data, int len, ubyte* outTOC, ref const(ubyte)*[48] frames, ref short[48] size, int* payloadOffset}},
		{q{int}, q{opus_packet_get_bandwidth}, q{const(ubyte)* data}},
		{q{int}, q{opus_packet_get_samples_per_frame}, q{const(ubyte)* data, int fs}},
		{q{int}, q{opus_packet_get_nb_channels}, q{const(ubyte)* data}},
		{q{int}, q{opus_packet_get_nb_frames}, q{const(ubyte)* packet, int len}},
		{q{int}, q{opus_packet_get_nb_samples}, q{const(ubyte)* packet, int len, int fs}},
		{q{int}, q{opus_decoder_get_nb_samples}, q{const(OpusDecoder)* dec, const(ubyte)* packet, int len}},
		{q{void}, q{opus_pcm_soft_clip}, q{float* pcm, int frameSize, int channels, float* softClipMem}},
		{q{int}, q{opus_repacketizer_get_size}, q{}},
		{q{OpusRepacketiser*}, q{opus_repacketizer_init}, q{OpusRepacketiser* rp}, aliases: [q{opus_repacketiser_init}]},
		{q{OpusRepacketiser*}, q{opus_repacketizer_create}, q{}, aliases: [q{opus_repacketiser_create}]},
		{q{void}, q{opus_repacketizer_destroy}, q{OpusRepacketiser* rp}, aliases: [q{opus_repacketiser_destroy}]},
		{q{int}, q{opus_repacketizer_cat}, q{OpusRepacketiser* rp, const(ubyte)* data, int len}, aliases: [q{opus_repacketiser_cat}]},
		{q{int}, q{opus_repacketizer_out_range}, q{OpusRepacketiser* rp, int begin, int end, ubyte* data, int maxLen}, aliases: [q{opus_repacketiser_out_range}]},
		{q{int}, q{opus_repacketizer_get_nb_frames}, q{OpusRepacketiser* rp}, aliases: [q{opus_repacketiser_get_nb_frames}]},
		{q{int}, q{opus_repacketizer_out}, q{OpusRepacketiser* rp, ubyte* data, int maxLen}, aliases: [q{opus_repacketiser_out}]},
		{q{int}, q{opus_packet_pad}, q{ubyte* data, int len, int newLen}},
		{q{int}, q{opus_packet_unpad}, q{ubyte* data, int len}},
		{q{int}, q{opus_multistream_packet_pad}, q{ubyte* data, int len, int newLen, int nbStreams}},
		{q{int}, q{opus_multistream_packet_unpad}, q{ubyte* data, int len, int nbStreams}},
	];
	return ret;
}()));

static if(!staticBinding):
import bindbc.loader;

mixin(makeDynloadFns("Opus", makeLibPaths(["opus"], ["Linux": ["libopus.so.0", "libopus.so.0.8.0"]]), [
	__MODULE__,
	"opus.custom",
	"opus.defines",
	"opus.multistream",
	"opus.projection",
]));
