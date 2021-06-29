- Fix hsconv2. Make checks work.
- Add small diagram to paper.

---

- Build `arm32v7` docker images, and build DynamoRIO for `armv7` or `aarch32`.
  - [dbhi/docker#1](https://github.com/dbhi/docker/issues/1)
  - [DynamoRIO/dynamorio#3382](https://github.com/DynamoRIO/dynamorio/pull/3382)
  - [DynamoRIO/dynamorio#3400](https://github.com/DynamoRIO/dynamorio/pull/3400)
  - [DynamoRIO/dynamorio#3403](https://github.com/DynamoRIO/dynamorio/pull/3403)
- PYNQ v2.3 and v2.4 SD images work. However, after executing `apt upgrade`, `gdb` fails as reported at [Xilinx/PYNQ#817](https://github.com/Xilinx/PYNQ/issues/817).
- Building GHDL and Dynamorio fails with `kata-runtime`. See [dbhi/docker#1](https://github.com/dbhi/docker/issues/1).

# Should be fixed, need check

- Segmentation fault on PYNQ/ZYNQ when executing `./dbhi ./hsconv_main`. See [lgeek/mambo_memcheck#5](https://github.com/lgeek/mambo_memcheck/issues/5).
