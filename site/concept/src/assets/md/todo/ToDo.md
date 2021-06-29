# FixME

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

## Should be fixed, need check

- Segmentation fault on PYNQ/ZYNQ when executing `./dbhi ./hsconv_main`. See [lgeek/mambo_memcheck#5](https://github.com/lgeek/mambo_memcheck/issues/5).

# Work in progress

- @iordanouki commented that he was working with IP cores written in HLS that used AXI Master interfaces.
  @umarcor has enhanced the memory model of VUnit's Verification Component library to allow external access (as with
  strings and integer vectors).
  This has been tested with very simple HLS cores exported to VHDL, and there is a working example.
  However, we need to test it on more complex designs yet.

- @umarcor developed a VHDL clock-gating package for simulation that allows synchronized co-execution in multi-threaded
  contexts.
  This has been used to develop a prototype with a Flask web server and a Vue.js frontend that provides custom
  _real-time_ visualization of the buffers/memories that are externally accesible.

- @umarcor developed C++ sources to bind a VHDL simulation as a built-in function in Octave.
  This allows to share data between Octave's workspace and the simulation, without writing intermediate (CSV, BIN) files
  to disk.

---

- GHDL is not required in mambo/dr images, but libraries must be available. Is it feasible to copy them to the work dir?
- Is ruby required for mambo?
- @Cosmin. Add feature `mambo_register_function_cb` to the `master` branch of the public repo of MAMBO. See [beehive-lab/mambo/tree/symhooks](https://github.com/beehive-lab/mambo/tree/symhooks).
  - Is it possible to add `mambo_register_function_replace` (i.e. `plugin/plugin.c`) too?
- Add example Vivado design?
- Docker cannot be installed on `zynq`, but it might work on UltraScale+ MPSoC.
- Enable LLVM optimization phases in GHDL. https://github.com/ghdl/ghdl/issues/667
- Install additional dependencies on `mambo-vm`. Execute tests inside (with(out) docker). `sshfs -p 5040 alarm@localhost: tmp-mambo/`
- Find a procedure to get the compilation order from VUnit VHDL. Custom `run.py` that exports a list/json?
- Reduce the compilation overhead by either:
  - Building the C wrapper as a shared library.
  - Using a device node or pipe
- https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842109/QEMU+SystemC+and+TLM+CoSimulation
  - https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842060/QEMU#QEMU-RunningaLinuxKernelImageInQEMU

---

- golangci-lint
- codeclimate
- man page(s) See [Generating Man Pages For Your Own cobra.Command](https://github.com/spf13/cobra/blob/master/doc/man_docs.md).
- rice-box

# Enhance docker images

- Add docker images based on Debian.
- When sources of the examples are made public, add a test stage to `travis-ci.com/dbhi/docker`. Push images/manifests only if tests pass.
  - When these tests are implemented, we can go back to using `master` branches for development, instead of using a fixed commit for each tool.
- Implement verioning. I.e., when a tagged commit is pushed, create two tags: `*` and `*_vYY.MM`.

# Currently supported platforms

- arm32v7 GNU/Linux (tested ubuntu:18.04)
- aarch64 GNU/Linux (tested ubuntu:18.04)
- amd64 GNU/Linux (tested ubuntu:18.04, debian:buster) or Windows 10 (partial native, full in containers)
