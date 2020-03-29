#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <libgrpc-go.h>

#define true 1
#define false 0

GoString cgo_str(char *s) {
  GoString id = {s, strlen(s)};
  return id;
}

void dbhi_cp(int32_t *I, int32_t *O, uint32_t l) {
  printf(">> grpc_cp\n");
  printf("%p %p %d\n", I, O, l);

  goConnect(cgo_str(":8888"));

  GoString ids[] = {cgo_str("axisbuffer/axis/s"), cgo_str("axisbuffer/axis/m")};
  int n = sizeof(ids)/sizeof(ids[0]);
  GoSlice slice = {ids, n, n};

  while (!goCheckIds(slice)) {
    uint t = 2;
    printf("Target channel identifiers not registered. Retrying in %d seconds...\n", t);
    sleep(t);
  };

  int k=2*8192;

  int d = l/k;
  int r = l%k;

  if (r != 0) {
    d++;
  }

  printf("%d %d %d\n", l, l/k, d);

  int w, x, y, z;
  for (y=0; y<d; y++) {
    z = y*k;
    w = (y==d-1) ? l-z : k;
    printf("WRITE %d/%d [%d]\n", y+1, d, w);
    for (x=0; x<w; x++) {
      goWriteBlocking(cgo_str("axisbuffer/axis/s"), I[z+x], 4);
    }
    printf("READ %d/%d [%d]\n", y+1, d, w);
    for (x=0; x<w; x++) {
      O[z+x] = goReadBlocking(cgo_str("axisbuffer/axis/m"), 3);
    }
  }

}
