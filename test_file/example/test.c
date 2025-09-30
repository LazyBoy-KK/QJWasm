#include <string.h>

__attribute__((export_name("add")))
int add(int x, int y) { return x + y; }

__attribute__((export_name("add-all")))
int add_all(int* ptr, size_t len) {
  int val = 0;
  int *v = ptr;
  for (int i = 0; i < len; i++, v++) {
    val += *v;
  }
  return val;
}
