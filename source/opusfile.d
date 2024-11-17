/+
+            Copyright 2023 – 2024 Aya Partridge
+ Distributed under the Boost Software License, Version 1.0.
+     (See accompanying file LICENSE_1_0.txt or copy at
+           http://www.boost.org/LICENSE_1_0.txt)
+/
module opusfile;

import bindbc.opus.config;
static if(bindOpusfile):
import bindbc.opus.codegen;

enum opusfileVersion = (){
	version(Opusfile_0_12) return Version(0,12,0);
	else static assert(0);
}();

struct OpusHead;

struct OpusTags;

struct OpusPictureTag;

struct OpusServerInfo;

struct OpusFileCallbacks;

struct OggOpusFile;

enum{
	OP_FALSE          = -1,
	OP_EOF            = -2,
	OP_HOLE           = -3,
	OP_EREAD          = -128,
	OP_EFAULT         = -129,
	OP_EIMPL          = -130,
	OP_EINVAL         = -131,
	OP_ENOTFORMAT     = -132,
	OP_EBADHEADER     = -133,
	OP_EVERSION       = -134,
	OP_ENOTAUDIO      = -135,
	OP_EBADPACKET     = -136,
	OP_EBADLINK       = -137,
	OP_ENOSEEK        = -138,
	OP_EBADTIMESTAMP  = -139,
}

enum OPUS_CHANNEL_COUNT_MAX = 255;

struct OpusHead{
	int version_;
	int channelCount;
	uint preSkip, inputSampleRate;
	int outputGain, mappingFamily;
	int streamCount, coupledCount;
	ubyte[OPUS_CHANNEL_COUNT_MAX] mapping;
	
	alias channel_count = channelCount;
	alias pre_skip = preSkip;
	alias input_sample_rate = inputSampleRate;
	alias output_gain = outputGain;
	alias mapping_family = mappingFamily;
	alias stream_count = streamCount;
	alias coupled_count = coupledCount;
}

struct OpusTags{
	char** userComments;
	int* commentLengths;
	int comments;
	char* vendor;
	
	alias user_comments = userComments;
	alias comment_lengths = commentLengths;
}

enum{
	OP_PIC_FORMAT_UNKNOWN  = -1,
	OP_PIC_FORMAT_URL      =  0,
	OP_PIC_FORMAT_JPEG     =  1,
	OP_PIC_FORMAT_PNG      =  2,
	OP_PIC_FORMAT_GIF      =  3,
}

struct OpusPictureTag{
	int type;
	char* mimeType, description;
	uint width, height, depth, colours;
	uint dataLength;
	ubyte* data;
	int format;
	
	alias mime_type = mimeType;
	alias colors = colours;
	alias data_length = dataLength;
}

mixin(joinFnBinds((){
	FnBind[] ret = [
		{q{int}, q{opus_head_parse}, q{OpusHead* head, const(ubyte)* data, size_t len}},
		{q{long}, q{opus_granule_sample}, q{const(OpusHead)* head, long gp}},
		{q{int}, q{opus_tags_parse}, q{OpusTags* tags, const(ubyte)* data, size_t len}},
		{q{int}, q{opus_tags_copy}, q{OpusTags* dst, const(OpusTags)* src}},
		{q{void}, q{opus_tags_init}, q{OpusTags* tags}},
		{q{int}, q{opus_tags_add}, q{OpusTags* tags, const(char)* tag, const(char)* value}},
		{q{int}, q{opus_tags_add_comment}, q{OpusTags* tags, const(char)* comment}},
		{q{int}, q{opus_tags_set_binary_suffix}, q{OpusTags* tags, const(ubyte)* _data, int len}},
		{q{const(char)*}, q{opus_tags_query}, q{const(OpusTags)* tags, const(char)* tag, int count}},
		{q{int}, q{opus_tags_query_count}, q{const(OpusTags)* tags, const(char)* tag}},
		{q{const(ubyte)*}, q{opus_tags_get_binary_suffix}, q{const(OpusTags)* tags, int* len}},
		{q{int}, q{opus_tags_get_album_gain}, q{const(OpusTags)* tags, int* gainQ8}},
		{q{int}, q{opus_tags_get_track_gain}, q{const(OpusTags)* tags, int* gainQ8}},
		{q{void}, q{opus_tags_clear}, q{OpusTags* tags}},
		{q{int}, q{opus_tagcompare}, q{const(char)* tagName, const(char)* comment}},
		{q{int}, q{opus_tagncompare}, q{const(char)* tagName, int tagLen, const(char)* comment}},
		{q{int}, q{opus_picture_tag_parse}, q{OpusPictureTag* pic, const(char)* tag}},
		{q{void}, q{opus_picture_tag_init}, q{OpusPictureTag* pic}},
		{q{void}, q{opus_picture_tag_clear}, q{OpusPictureTag* pic}},
	];
	return ret;
}()));

static if(!staticBinding):
import bindbc.loader;

mixin(makeDynloadFns("Opusfile", makeLibPaths(["opusfile"]), [__MODULE__]));
