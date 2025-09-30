#include <stddef.h>
#include <stdlib.h>
#include <string.h>

__attribute__((export_name("add")))
int add(int x, int y) { return x + y; }

static char *hello = "Hello, world!";

__attribute__((export_name("hello-ptr")))
char *hello_ptr() { return hello; }

__attribute__((export_name("hello-len")))
int hello_len() {
  return strlen(hello);
}

__attribute__((import_module("test"), import_name("calc")))
int calc(int x, int y);

__attribute__((export_name("calc")))
int do_calc(int x, int y) {
  return calc(x + 1, y - 1);
}

__attribute__((export_name("add-all")))
int add_all(int* ptr, size_t len) {
  int val = 0;
  int *v = ptr;
  for (int i = 0; i < len; i++, v++) {
    val += *v;
  }
  return val;
}

__attribute__((export_name("malloc")))
void* malloc_export(size_t size) {
  return malloc(size);
}

__attribute__((export_name("free")))
void free_export(void* ptr) {
  free(ptr);
}

__attribute__((import_module("test"), import_name("log")))
void console_log(char* ptr, size_t len);

__attribute__((export_name("test-log")))
void test_log() {
  console_log(hello, strlen(hello));
}
