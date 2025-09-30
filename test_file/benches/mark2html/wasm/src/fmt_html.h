#pragma once

typedef struct FmtHTML {
  OutputFlags flags;
  uint32_t    parserFlags; // passed along to md_parse
  WBuf*       outbuf;

  // optional callbacks
  JSTextFilterFun onCodeBlock;

  // internal state
  int  imgnest;
  int  addanchor;
  int  codeBlockNest;
  WBuf tmpbuf;
} FmtHTML;

int fmt_html(const char* input, uint32_t inputlen, FmtHTML* fmt);
