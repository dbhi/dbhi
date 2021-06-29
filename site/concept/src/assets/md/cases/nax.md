---
id: nax
status: 'supported'
artifacts:
  - grpc
  - dgrpc:arm
  - app:arm
  - hgrpc:amd64
dependencies:
  - ghdl
  - gcc
  - dbm
  - golang
  - protoc
---

- Build VHDL sources on/for amd64.
- Build VHPI wrapper (C) on/for amd64.
- Build gRPC client (C or golang) with the VHPI wrapper (C) on/for amd64.
- Build plugin (C) with the gRPC client library (C) on/for ARM.
- Get the application on/for ARM.
- Get/build gRPC server on/for amd64 or ARM.
