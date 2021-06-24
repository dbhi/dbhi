# hsconv2

- The target design in this example is a sliding window spatial filter for hyperspectral cubes expecting data as a Band Interleaved by Pixel (BIP) stream. The main input is a FIFO interface to be written to, and the main output is a FIFO interface to be read from. The IP requires additional pairs of AXI4 Stream interfaces, to be connected to a buffer (either in hardware, in cache or in external memory). `(k-1)/2` master-slave pairs are required, where `k` is the size of the window (3, 5, 7...).
- The prototype of the test function is `hsconv2(int16_t *I, int16_t *O, uint16_t k, uint16_t b, uint16_t w, uint16_t h)`.
- The application allocates two memory regions of size `b*w*h*sizeof(data_type)` bytes, where `b` is the number of bands, `w` is the number of pixels/columns per spatial row, and `h` is the number of spatial rows. Input data is read from a binary file (`data.bin`) with a header of 32 bytes and the input stream starting at address `0x0010`. Then, `hsconv2` is called. Last, the expected result is read from a binary file (`ref.bin`) and it is compared with the output of the function.

```
data.bin format
header size: 32 bytes

0x0000 | data_width
0x0002 | window_width
0x0004 | window_div
0x0006 | band_depth
0x0008 | line_width
0x000a | spatial_height
0x000c | zpadding
0x000e | -
0x0010 | I
```

> NOTE: ATM `data_width` must be `16` and, the `window_width` must be `3` and `window_div` must be 3.

- In the software version, nothing is done, it is just a placeholder.
- In the VHDL C testbench, data is passed from `*I` to a VUnit verification component, then to the target IP, and back to `*O` through another verification component.
- In the VHDL Python testbench, data is read from a CSV file and saved to a different CSV file. Moreover, data is arranged in 2D (each row corresponding to a pixel) and it is transferred row-by-row.

> TODO: The IP requires the first and last spatial rows of the cube to be sent twice. Also, any data should be pushed to the input after all the valid stream is processed, in order to flush remaining valid data in the pipeline. This is handled in the VHDL testbench ATM, but it should be done in the C wrapper, as it will be done by the software in the target platform.

> TODO: ATM parameters and defined manually in octave/matlab and in VUnit. Should export JSON from `imgs2mats.m`, and import it in `sim.py`.

> TODO: Guess how to share data between C and VHDL which is different from `uint32_t`/`int32_t`/`integer`.

> TODO: Check (compare) simulation results in C. Write to binary (`out.bin`), and read it from octave/matlab.
