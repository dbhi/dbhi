---
intro: 'There are several alternatives for hardware-software co-execution.
  Certainly, very different contexts are shaped after constraints such as
  where is the software application to be executed, whether sources are
  available, if the host and the target architectures match, etc. All of
  the environments that are currently supported by DBHI are shown in the
  table below, along with those which are on the roadmap and others which
  have been reported by third-parties.'
---

## Multiple hardware simulations in parallel on the same host

GHDL is CPU bound and it is not multi-threaded. However, it is possible to build multiple `hgrpc` binaries and execute them at the same time. If two or more of these are to be executed on the same host, performance can be improved by using go channels directly, instead of gRPC. In order to do so, execute `dbhi server add <path to hgrpc>` once for each binary, instead of executing them directly.

---

- the server can support both gRPC and channels (need to adapt it)
- the client libraries (golang exported to C) can support both gRPC and channes (need to adapt them)

---

- in order to execute multiple hardware binaries on a host and other several on a different host, two grpc servers need to be started.
- I do not remember if data forwarding between servers is implemented yet.
