#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern int ghdl_main (int argc, char **argv);

int32_t *ip = 0;
int32_t *op = 0;
uint32_t length = 100;

uintptr_t get_p(uint32_t w) {
  uintptr_t o = 0;
  switch(w) {
    case 0 : // buffer length
      o = length;
      break;;
    case 1 : // data width (in bits)
      o = 8*sizeof(int32_t);
      break;;
    case 2 : // fifo depth
      o = 5;
      break;;
    default:
      if (w>2) { o = ip[w-2]; }
      break;;
  }
  printf("get_p(%d): %d\n", w, (int)o);
  return o;
}

uintptr_t get_b(uint32_t w) {
  uintptr_t o = 0;
  switch(w) {
    case 0 :
      o = (uintptr_t)ip;
      break;;
    case 1 :
      o = (uintptr_t)op;
      break;;
  }
  printf("get_b(%d): %p\n", w, (void *)o);
  return o;
}

void dbhi_cp(int32_t *I, int32_t *O, uint32_t l) {
  printf(">> ghdl_cp\n");
  printf("%p %p %d\n", I, O, l);

  ip = I;
  op = O;
  length = l;

  printf(">> ghdl_main\n");
  char *argv[0];
  ghdl_main(0, argv);
}
