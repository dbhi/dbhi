---
app: software only application.
agrpc: software only application, where a function is replaced with a gRPC client.
cgrpc: a gRPC client written in C.
dgrpc: DBM tool (MAMBO) including a plugin to replace a function with a gRPC client.
dbm: DBM tool (MAMBO) without any plugin.
grpc.client: a gRPC client written in go(lang) that implements some data processing logic.
full: all the supported sources, targets, tasks and intermediate objects.
grpc: a gRPC server written in go(lang).
grpc.gen: a gRPC client written in go(lang) that sends some generated data and retrieves the result.
happ: software application where sources are modified to replace a function with an embedded GHDL simulation.
hdbm: DBM tool (MAMBO) including a plugin to replace a function with an embedded GHDL simulation.
hgrpc: GHDL simulation wrapped around with a gRPC client.
vunit: usual simulation with VUnit; data is read from and written to CSV files.
Murax.vhd: SoC design based on RISC-V and written in SpinalHDL, which can be exported to either VHDL or Verilog.
bit: production-ready bitstream to be used with bare-metal software (eapp).
bit.mast: bitstream to be used with MAST (DBM plugin, driver and hardware interconnect logic).
eapp: bare-metal application.
mast: DBM plugin to be used with MAST.
---

Since DBHI is an iterative design flow, variations to similar groups of sources files need to be continuously compiled
and tested.
In order to do so, several build tools need to be used, such as `make`, `cmake`, `go build`, etc.
Moreover, supporting multiple use cases (see [Use cases](/cases)), produces a rather complex dependency graph, as shown
below.
This section allows the user to analyse the subset of tasks that need to be executed to build a specific binary for a
given use case.

In order to automate task execution, a companion golang package was designed.
[github.com/dbhi/run](https://github.com/dbhi/run) allows analysing complex dependency graphs (multitree directed
acyclic graphs), and retrieving or executing ordered lists of tasks.
The functionaly of `run` is integrated into the `dbhi` CLI tool, but it can also be used as a standalone static binary
([see run: README.md#usage](https://github.com/dbhi/run/blob/master/README.md#usage)).
Users willing to extend the proposed flow with other tools such as Verilator, Chisel or High-Level Synthesis (HLS)
should take this approach.
Please reach us at [github.com/dbhi/dbhi](https://github.com/dbhi/dbhi) for any issue, bug report or contributions
regarding the addition of use cases to the list below.
