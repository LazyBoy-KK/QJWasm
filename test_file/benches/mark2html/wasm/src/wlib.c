#include "common.h"
#include "wlib.h"

// globals of last error
static uint32_t    errcode = 0;
static const char* errmsg = "";
static bool        errmsg_free = false;

__attribute__((export_name("_wrealloc")))
void* wrealloc(void* ptr, size_t size) {
  return realloc(ptr, size);
}

__attribute__((export_name("_wfree")))
void wfree(void* ptr) {
  free(ptr);
}

__attribute__((export_name("_WErrGetCode")))
uint32_t WErrGetCode() {
  return errcode;
}

__attribute__((export_name("_WErrGetMsg")))
const char* WErrGetMsg() {
  return errmsg;
}

__attribute__((export_name("_WErrClear")))
void WErrClear() {
  errcode = 0;
  if (errmsg_free) {
    free((void*)errmsg);
    errmsg_free = false;
  }
  errmsg = NULL;
}


bool WErrSet(uint32_t code, const char* msg) {
  WErrClear();
  if (code != 0) {
    errcode = code;
    errmsg = msg;
    return true;
  }
  return false;
}
