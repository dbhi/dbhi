#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#ifdef GHDL
  extern void dbhi_cp(int32_t *I, int32_t *O, uint32_t l);
#else
  void cp(int32_t *I, int32_t *O, uint32_t l) {
    printf("[memcopy] soft\n");
    memcpy(O,I,l*sizeof(int32_t));
  }
#endif

int check(int32_t *I, int32_t *O, uint32_t l) {
  int i;
  for ( i=0 ; i<l ; i++ ) {
    if ( I[i] != O[i] ) {
      printf("check failed! %d: %d %d\n", i, I[i], O[i]);
      return -1;
    }
  }
  printf("check successful\n");
  return 0;
}

int main(int argc, char **argv) {
  uint32_t length = 262144;

  int32_t *I = (int32_t *) malloc(length*sizeof(uint32_t));
  if ( I == NULL ) {
    perror("execution of malloc() failed!\n");
    return -1;
  }

  int32_t *O = (int32_t *) malloc(length*sizeof(uint32_t));
  if ( O == NULL ) {
    perror("execution of malloc() failed!\n");
    return -1;
  }

  int i;
  for (i=0 ; i<length ; i++) {
    I[i]=i*100+rand()/(RAND_MAX/100);
  }

  if ( argc > 1 ) {
    FILE *fp = fopen(argv[1], "w");
    if ( fp == NULL ) {
      perror("opening csv file\n");
      return -1;
    }
    int j = 0;
    for (i=0; i<length ; i++) {
      fprintf(fp, "%d,", I[i]);
      j++;
      if ( j == 20 ) {
        fprintf(fp, "\n");
        j = 0;
      }
    }
    fclose(fp);
  }

  #ifdef GHDL
    printf("> Call 'dbhi_cp'\n");
    dbhi_cp(I,O,length);
  #else
    printf("> Call 'cp'\n");
    cp(I,O,length);
  #endif

  printf("> Call 'check'\n");
  if ( check(I,O,length) != 0 ) {
    printf("check failed!\n");
    return -1;
  };

  free(I);
  free(O);

  return 0;
}
