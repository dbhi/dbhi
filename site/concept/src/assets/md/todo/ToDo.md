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
