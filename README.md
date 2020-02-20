# Dynamic Binary Hardware Injection (DBHI)

This is the main repository of project Dynamic Binary Hardware Injection (DBHI), a work flow towards decoupled functional hardware-software co-design on SoCs with FPGA, through injection of compiled HDL designs using binary modification. The design flow is constructed from existing off-the-shelf tools, and it is tested on multiple architectures (ARMv7, ARMv8 and x86-64).

## Project structure

Resources, tools and examples are organized in multiple repositories:

- `dbhi/dbhi`: main repository, contains the documentation and publications, includes suggested repos as submodules.
- Required:
  - `dbhi/VUnit`: fork of [VUnit/vunit](https://github.com/VUnit/vunit), a unit testing framework for VHDL/SystemVerilog.
  - `dbhi/cosim`: fork of [VUnit/cosim](https://github.com/VUnit/cosim), which extends VUnit with co-simulation features.
  - `dbhi/mambo`: fork of [beehive-lab/mambo](https://github.com/beehive-lab/mambo), a low-overhead dynamic binary instrumentation and modification tool for ARM.
  - `dbhi/gRPC`: go sources of the DBHI gRPC server, and common sources to embed go gRPC clients in C applications.
- Other:
  - `dbhi/docker`: sources and CI configuration to containerize open and free development tools that allow to evaluate DBHI. Images are periodically pushed to [hub.docker.com/r/aptman/dbhi](https://hub.docker.com/r/aptman/dbhi/).
  - `dbhi/qus`: qemu-user-static (qus) and docker, non-invasive minimal working and non-working setups. Used by `dbhi/docker`.

## Environment setup

The list of required tools to run the examples is the following:

- [GHDL](https://github.com/ghdl/ghdl)
- [VUnit](https://github.com/vunit/vunit)
- Either of:
    - [MAMBO](https://github.com/beehive-lab/mambo) (only avilable for ARM platforms)
    - [DynamoRIO](https://github.com/dynamorio/dynamorio)
- (Optional) [GtkWave](http://gtkwave.sourceforge.net/)
- (Optional, to use gRPC) [go(lang)](https://golang.org/)

---

Ready-to-use [docker](https://www.docker.com/) images are available at [hub.docker.com/r/aptman/dbhi](https://hub.docker.com/r/aptman/dbhi/). These images include all the required dependencies to evaluate the design flow with lightweight, open and free tools.

Images provided by [docker-library/official-images](https://github.com/docker-library/official-images#architectures-other-than-amd64) are used to build manifests for `amd64`, `arm64v8` and `arm32v7` platforms. Currently, all the images are based on `Ubuntu 18.04 (bionic)`. See [github.com/dbhi/docker](https://github.com/dbhi/docker) for further details.

If `docker` is available on your target platform, using the provided images is recommended, because the overhead is negligible, it helps reproducibility and it significantly reduces setup time. The following script can be used to test if a platform fulfills the requirements to run the docker daemon:

``` bash
curl -fsSL https://raw.githubusercontent.com/moby/moby/master/contrib/check-config.sh | bash -
```

---

Should you want to install the tools natively on your host, the dockerfiles at [github.com/dbhi/docker](https://github.com/dbhi/docker/blob/docker/dockerfiles) can be used as a reference. I.e., the same steps can be reproduced in a shell script. Nonetheless, please read the following notes carefully:

- Ensure that all the libraries are built with `-fPIC` when building GHDL.
- VUnit can be installed in a default location (e.g. `pip install vunit_hdl`), or:
    - It must be cloned recursively, and
    - `colorama` must be installed (e.g. `pip install colorama`).
- MAMBO must be recursively cloned.
- To get DynamoRIO, a release tarball can be downloaded or it can be built from sources.

> NOTE: If GHDL, VUnit and/or DynamoRIO installed in custom locations, these can be provided through `PATH`, `PYTHONPATH` and/or `DYNAMORIO_HOME`, respectively.

> NOTE: Building DynamoRIO with `g++-8` fails on `amd64`. Using `g++-6` or `g++-7` is suggested.
