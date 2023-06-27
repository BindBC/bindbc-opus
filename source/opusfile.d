/+
+                Copyright 2023 Aya Partridge
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
	int channel_count;
	uint pre_skip;
	uint input_sample_rate;
	int output_gain;
	int mapping_family;
	int stream_count;
	int coupled_count;
	ubyte[OPUS_CHANNEL_COUNT_MAX] mapping;
}

struct OpusTags{
	char** user_comments;
	int* comment_lengths;
	int comments;
	char* vendor;
}

enum{
	OP_PIC_FORMAT_UNKNOWN  = -1,
	OP_PIC_FORMAT_URL      = 0,
	OP_PIC_FORMAT_JPEG     = 1,
	OP_PIC_FORMAT_PNG      = 2,
	OP_PIC_FORMAT_GIF      = 3,
}

struct OpusPictureTag{
	int type;
	char* mime_type;
	char* description;
	uint width;
	uint height;
	uint depth;
	uint colors;
	uint data_length;
	ubyte* data;
	int format;
}

mixin(joinFnBinds((){
	string[][] ret;
	ret ~= makeFnBinds([
		[q{int}, q{opus_head_parse}, q{OpusHead* _head, const(ubyte)* _data, size_t _len}],
		[q{long}, q{opus_granule_sample}, q{const(OpusHead)* _head, long _gp}],
		[q{int}, q{opus_tags_parse}, q{OpusTags* _tags, const(ubyte)* _data, size_t _len}],
		[q{int}, q{opus_tags_copy}, q{OpusTags* _dst, const(OpusTags)* _src}],
		[q{void}, q{opus_tags_init}, q{OpusTags* _tags}],
		[q{int}, q{opus_tags_add}, q{OpusTags* _tags, const(char)* _tag, const(char)* _value}],
		[q{int}, q{opus_tags_add_comment}, q{OpusTags* _tags, const(char)* _comment}],
		[q{int}, q{opus_tags_set_binary_suffix}, q{OpusTags* _tags, const(ubyte)* _data, int _len}],
		[q{const(char)*}, q{opus_tags_query}, q{const(OpusTags)* _tags, const(char)* _tag, int _count}],
		[q{int}, q{opus_tags_query_count}, q{const(OpusTags)* _tags, const(char)* _tag}],
		[q{const(ubyte)*}, q{opus_tags_get_binary_suffix}, q{const(OpusTags)* _tags, int* _len}],
		[q{int}, q{opus_tags_get_album_gain}, q{const(OpusTags)* _tags, int* _gain_q8}],
		[q{int}, q{opus_tags_get_track_gain}, q{const(OpusTags)* _tags, int* _gain_q8}],
		[q{void}, q{opus_tags_clear}, q{OpusTags* _tags}],
		[q{int}, q{opus_tagcompare}, q{const(char)* _tag_name, const(char)* _comment}],
		[q{int}, q{opus_tagncompare}, q{const(char)* _tag_name, int _tag_len, const(char)* _comment}],
		[q{int}, q{opus_picture_tag_parse}, q{OpusPictureTag* _pic, const(char)* _tag}],
		[q{void}, q{opus_picture_tag_init}, q{OpusPictureTag* _pic}],
		[q{void}, q{opus_picture_tag_clear}, q{OpusPictureTag* _pic}],
	]);
	return ret;
}(), __MODULE__));

static if(!staticBinding):
import bindbc.loader;

mixin(makeDynloadFns("Opusfile", makeLibPaths(["opusfile"]), [__MODULE__]));
