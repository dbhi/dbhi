# axisbuffer

- The target design in this example is an AXI4 Stream buffer: an IP core with one AXI4 Stream Slave interface, one AXI4 Stream Master interface and a FIFO between them.
- The prototype of the test function is `cp(int32_t *I, int32_t *O, uint32_t l)`.
- The application allocates two memory regions of size `length*sizeof(data_type)` bytes and generates `length` pseudo-random values in one of them (`*I`). Then, `cp` is called, and the result is checked.
  - In the software version, data is copied with `memcpy`.
  - In the VHDL C testbench, data is passed from `*I` to a VUnit verification component, then to the target IP, and back to `*O` through another verification component.
  - In the VHDL Python testbench, data is read from a CSV file and saved to a different CSV file. Moreover, data is arranged in 2D and it is transferred row-by-row.
