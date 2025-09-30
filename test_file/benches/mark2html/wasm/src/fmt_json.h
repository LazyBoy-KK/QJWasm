#pragma once
#include "wbuf.h"

int fmt_json(const char* input, uint32_t inputlen, WBuf* outbuf, uint32_t parserFlags);
