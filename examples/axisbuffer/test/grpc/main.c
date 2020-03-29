#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
#include <libgrpc-go.h>

extern int ghdl_main (int argc, char **argv);

uint32_t read_invalid = 0;
clock_t read_block;
uint32_t write_invalid = 0;
clock_t write_block;

uintptr_t get_p(uint32_t w) {
  uintptr_t o = 0;
  switch(w) {
    case 0 : // data width (in bits)
      o = 8*sizeof(int32_t);
      break;
    case 1 : // fifo depth
      o = 5;
      break;
    case 2 : // read_invalid
      o = read_invalid;
      break;
    case 3 : // write_invalid
      o = write_invalid;
      break;
  }
//  printf("get_p(%d): %d\n", w, (int)o);
  return o;
}

GoString cgo_str(char *s) {
  GoString id = {s, strlen(s)};
  return id;
}

char *ids[] = {"axisbuffer/axis/s", "axisbuffer/axis/m"};

int32_t read(int32_t c) {
  struct goRead_return r;
  clock_t t = clock();
  double d = 100;
  if ( read_invalid ) {
    d = ((double)(t-read_block))/CLOCKS_PER_SEC;
  }
  if ( (int)d > 2 ) {
    read_block=t;
    r = goRead(cgo_str(ids[c]));
    read_invalid = (r.r1.n != 0 ) ? 1 : 0;
  }
  return r.r0;
}

void write(int32_t c, int32_t i) {
  clock_t t = clock();
  double d = 100;
  if ( write_invalid ) {
    double d = ((double)(t-write_block))/CLOCKS_PER_SEC;
  }
  if ( (int)d > 2 ) {
    write_block=t;
    GoString e = goWrite(cgo_str(ids[c]), i);
    write_invalid = (e.n != 0 ) ? 1 : 0;
  }
}

void registerIds(void) {
  int n = sizeof(ids)/sizeof(ids[0]);
  GoString gids[2];
  int x;
  for (x=0 ; x<n ; x++) {
    gids[x] = cgo_str(ids[x]);
  }
  GoSlice slice = {gids, n, n};
  goRegister(slice);
}

void main(int argc, char *argv) {
  read_block = clock();;
  write_block = clock();;

  goConnect(cgo_str(":8888"));
  registerIds();

  char *gargv[3];
  gargv[1]="--ieee-asserts=disable";
  //gargv[2]="--vcd=grpc.vcd";
  ghdl_main(2, gargv);
}
