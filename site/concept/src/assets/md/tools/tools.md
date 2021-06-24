---
intro: "The DBHI design flow is based on an automation CLI constructed from existing off-the-shelf tools. In this section, the tools are enumerated and a brief description is provided along with references to the corresponding web sites, repositories and/or Wikipedia entries. The ones on the left column are required for almost any use case, while the need for those on the right column depends on specific contexts."
---

## Docker images

Ready-to-use [docker](https://www.docker.com/) images are available at [hub.docker.com/r/aptman/dbhi](https://hub.docker.com/r/aptman/dbhi/). These images include all the required dependencies to evaluate the design flow with lightweight, open and free tools. Images provided by [docker-library/official-images](https://github.com/docker-library/official-images#architectures-other-than-amd64) are used to build manifests for `amd64`, `arm64v8` and `arm32v7` platforms. Currently, all the images are based on `Ubuntu 18.04 (bionic)`. See [github.com/dbhi/docker](https://github.com/dbhi/docker) for further details.

If `docker` is available on your target platform, using the provided images is recommended, because the overhead is negligible, it helps reproducibility and it significantly reduces setup time. The following script can be used to test if a platform fulfills the requirements to run the docker daemon:

``` bash
curl -fsSL https://raw.githubusercontent.com/moby/moby/master/contrib/check-config.sh | bash -
```

## Manual installation

Should you want to install the tools on your host, the dockerfiles at [github.com/dbhi/docker](https://github.com/dbhi/docker/blob/docker/dockerfiles) can be used as a reference. I.e., the same steps can be reproduced in a shell script. Nonetheless, please read the following notes carefully:

- Ensure that all the libraries are built with `-fPIC` when building GHDL.
- GHDL must be available in the `$PATH`.
- VUnit must be installed in a default location (e.g. `pip install vunit_hdl`), or:
    - It must be cloned recursively,
    - `colorama` must be installed (e.g. `pip install colorama`,
    - and `PYTHONPATH` must be set.
- MAMBO must be recursively cloned. ATM, not all the required features are available at the `master` branch of the official repository ([beehive-lab/mambo](https://github.com/beehive-lab/mambo)) yet. Please, clone branch `dbhi` from ([dbhi/mambo](https://github.com/dbhi/mambo)). Set the path to MAMBO through `DBHI_MAMBO`.
- To get DynamoRIO a release tarball can be downloaded or it can be built from sources. Set `DYNAMORIO_HOME` to the path of the distribution.

> NOTE: Building DynamoRIO with `g++-8` fails on `amd64`. Using `g++-6` or `g++-7` is suggested.
