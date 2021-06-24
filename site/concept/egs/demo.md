# demo

- This a minimal working example to combine GHDL and a DBM tool (MAMBO or DynamoRIO). VUnit is not used.
- The original function in the software app just prints `[demo] placeholder`.
- The DBM tool replace it with the VHDL simulation, which prints `HELLO WORLD!`, generates an image in a memory buffer and saves it to a file (`mmap_img.raw24`).
