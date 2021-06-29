@umarcor:

- Enhance VUnit's build options for GHDL in order to compile VHDL sources and build PIE binaries without executing the simulation.
- Enhance `string_ptr` and `integer_vector_ptr` VHDL data types in VUnit, by contributing 'external modes' that allow to use GHDL's VHPIDIRECT support as a built-in feature. Provide C API header (`vhpidirect_user.h`) that maps to default VHDL procedures/functions.
- Fix VUnit's handling of return values to properly detect simulation success/failure status.
- Enhance GHDL's build procedure and sources to support building PIE binaries with custom functions by default.
- Develop/adapt use three use cases to test the workflow:
  - `axis_buffer` adapted from VUnit's example.
  - `hsconv2` is his own design.
  - `riscv` is generated with SpinalHDL's VexRiscV. A custom AXI Stream peripheral was written.
- Develop prototype of gRPC client/server framework in golang, and provide _glue_ sources to use the client from C applications (dbhi/grpc).
- Develop reference `main.c` source that allows to use VUnit and GHDL in any of the workflows below (standalone, embedded, dynamically loaded, etc.).
- Develop/enhance shell scripts (dbhi/qus) to allow executing tools for foreign applications using QEMU and Docker (OCI containers).
- Develop multiarch Docker images that allow to test the proposed workflow on any target architecture/platform (dbhi/docker). Images for `amd64`, `arm32v7` and `arm64v8` are provided.
  - These images were used to execute the tests on some of the target platforms and/or to generate the binaries.

---

@GuillermoCallaghan:

- Develop DBHI plugin v1 for MAMBO (`mambo_plugin.c`), which uses MAMBO's API to call a function built in the plugin while preserving the arguments that are passed to the functions that is replaced. The implementation supports arm, thumb and/or aarch64.

---

@lgeek:

- Add `mambo_register_function_replace` to MAMBO's public API, which allows to replace a function in a target application with a handler/callback. Also, apply multiple fixes/enhancements to MAMBO so that the examples work on any of the target armv7 or aarch64 devices. .
