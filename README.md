<p align="center">
  <a title="Site" href="https://dbhi.github.io"><img src="https://img.shields.io/website.svg?label=dbhi.github.io&longCache=true&style=flat-square&url=http%3A%2F%2Fdbhi.github.io%2Findex.html"></a><!--
  -->
  <a title="DevDependency Status" href="https://david-dm.org/dbhi/dbhi?path=site&type=dev"><img src="https://img.shields.io/david/dev/dbhi/dbhi.svg?path=site&longCache=true&style=flat-square&label=devdeps&logo=npm"></a><!--
  -->
  <a title="Dependency Status" href="https://david-dm.org/dbhi/dbhi?path=site"><img src="https://img.shields.io/david/dbhi/dbhi.svg?path=site&longCache=true&style=flat-square&label=deps&logo=npm"></a><!--
  -->
  <a title="'site' workflow status" href="https://github.com/dbhi/dbhi/actions?query=workflow%3Asite"><img alt="'site' workflow status" src="https://img.shields.io/github/workflow/status/dbhi/dbhi/site?longCache=true&style=flat-square&label=site&logo=github"></a>
</p>

Dynamic Binary Hardware Injection (DBHI) is a work flow towards decoupled functional hardware-software co-design on SoCs with FPGA, through injection of compiled HDL designs. The design flow is constructed from existing off-the-shelf tools, and it is tested on multiple architectures (ARMv7, ARMv8 and x86-64).

## Project structure

Resources, tools and examples are organized in multiple repositories:

- `dbhi/dbhi`: main repository, contains the documentation, publications and examples. Dependencies are included as submodules:
  - [VUnit/vunit](https://github.com/VUnit/vunit): a unit testing framework for VHDL/SystemVerilog.
  - [VUnit/cosim](https://github.com/VUnit/cosim): extends VUnit with co-simulation features.
  - [beehive-lab/mambo](https://github.com/beehive-lab/mambo): a low-overhead dynamic binary instrumentation and modification tool for ARM.
  - [dbhi/gRPC](https://github.com/dbhi/gRPC): go sources of the DBHI gRPC server, and common sources to embed go gRPC clients in C applications.
- Other helper repositories:
  - [dbhi/docker](https://github.com/dbhi/docker): sources and CI configuration to containerize open and free development tools that allow to evaluate DBHI. Images are periodically pushed to [hub.docker.com/r/aptman/dbhi](https://hub.docker.com/r/aptman/dbhi/).
  - [dbhi/qus](https://github.com/dbhi/qus): qemu-user-static (qus) and docker, non-invasive minimal working and non-working setups. Used by `dbhi/docker`.

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

Ready-to-use container images (for [docker](https://www.docker.com/)/[podman](https://podman.io/)) are available at [hub.docker.com/r/aptman/dbhi](https://hub.docker.com/r/aptman/dbhi/). These images include all the required dependencies to evaluate the design flow with lightweight, open and free tools.

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

> NOTE: If GHDL, VUnit and/or DynamoRIO are installed in custom locations, these can be defined through `PATH`, `PYTHONPATH` and/or `DYNAMORIO_HOME`, respectively.

> NOTE: Building DynamoRIO with `g++-8` fails on `amd64`. Using `g++-6` or `g++-7` is suggested.
