/+
+                Copyright 2023 Aya Partridge
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module opus;

import bindbc.opus.config;

public import
	opus.custom,
	opus.defines,
	opus.multistream,
	opus.projection;

struct OpusEncoder;

struct OpusDecoder;

struct OpusRepacketizer;
alias OpusRepacketiser = OpusRepacketizer;

mixin(joinFnBinds((){
	string[][] ret;
	ret ~= makeFnBinds([
		[q{int}, q{opus_encoder_get_size}, q{int channels}],
		[q{OpusEncoder*}, q{opus_encoder_create}, q{int Fs, int channels, int application, int* error}],
		[q{int}, q{opus_encoder_init}, q{OpusEncoder* st, int Fs, int channels, int application}],
		[q{int}, q{opus_encode}, q{OpusEncoder* st, const(short)* pcm, int frame_size, ubyte* data, int max_data_bytes}],
		[q{int}, q{opus_encode_float}, q{OpusEncoder* st, const(float)* pcm, int frame_size, ubyte* data, int max_data_bytes}],
		[q{int}, q{opus_encoder_ctl}, q{OpusEncoder* st, int request, ...}],
		[q{int}, q{opus_decoder_get_size}, q{int channels}],
		[q{OpusDecoder*}, q{opus_decoder_create}, q{int Fs, int channels, int* error}],
		[q{int}, q{opus_decoder_init}, q{OpusDecoder* st, int Fs, int channels}],
		[q{int}, q{opus_decode}, q{OpusDecoder* st, const(ubyte)* data, int len, short* pcm, int frame_size, int decode_fec}],
		[q{int}, q{opus_decode_float}, q{OpusDecoder* st, const(ubyte)* data, int len, float* pcm, int frame_size, int decode_fec}],
		[q{int}, q{opus_decoder_ctl}, q{OpusDecoder* st, int request, ...}],
		[q{void}, q{opus_decoder_destroy}, q{OpusDecoder* st}],
		[q{int}, q{opus_packet_parse}, q{const(ubyte)* data, int len, ubyte* out_toc, ref const(ubyte)*[48] frames, ref short[48] size, int* payload_offset}],
		[q{int}, q{opus_packet_get_bandwidth}, q{const(ubyte)* data}],
		[q{int}, q{opus_packet_get_samples_per_frame}, q{const(ubyte)* data, int Fs}],
		[q{int}, q{opus_packet_get_nb_channels}, q{const(ubyte)* data}],
		[q{int}, q{opus_packet_get_nb_frames}, q{const(ubyte)* packet, int len}],
		[q{int}, q{opus_packet_get_nb_samples}, q{const(ubyte)* packet, int len, int Fs}],
		[q{int}, q{opus_decoder_get_nb_samples}, q{const(OpusDecoder)* dec, const(ubyte)* packet, int len}],
		[q{void}, q{opus_pcm_soft_clip}, q{float* pcm, int frame_size, int channels, float* softclip_mem}],
		[q{int}, q{opus_repacketizer_get_size}, q{}],
		[q{OpusRepacketizer*}, q{opus_repacketizer_init}, q{OpusRepacketizer* rp}],
		[q{OpusRepacketizer*}, q{opus_repacketizer_create}, q{}],
		[q{void}, q{opus_repacketizer_destroy}, q{OpusRepacketizer* rp}],
		[q{int}, q{opus_repacketizer_cat}, q{OpusRepacketizer* rp, const(ubyte)* data, int len}],
		[q{int}, q{opus_repacketizer_out_range}, q{OpusRepacketizer* rp, int begin, int end, ubyte* data, int maxlen}],
		[q{int}, q{opus_repacketizer_get_nb_frames}, q{OpusRepacketizer* rp}],
		[q{int}, q{opus_repacketizer_out}, q{OpusRepacketizer* rp, ubyte* data, int maxlen}],
		[q{int}, q{opus_packet_pad}, q{ubyte* data, int len, int new_len}],
		[q{int}, q{opus_packet_unpad}, q{ubyte* data, int len}],
		[q{int}, q{opus_multistream_packet_pad}, q{ubyte* data, int len, int new_len, int nb_streams}],
		[q{int}, q{opus_multistream_packet_unpad}, q{ubyte* data, int len, int nb_streams}],
	]);
	return ret;
}(), __MODULE__));

static if(!staticBinding):
import bindbc.loader;

mixin(makeDynloadFns("Opus", makeLibPaths(["opus"], ["Linux": ["libopus.so.0", "libopus.so.0.8.0"]]), [
	__MODULE__,
	"opus.custom",
	"opus.defines",
	"opus.multistream",
	"opus.projection",
]));
