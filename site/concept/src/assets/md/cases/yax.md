---
id: yax
status: 'supported'
artifacts:
  - grpc
  - app:arm
  - hgrpc:amd64
dependencies:
  - ghdl
  - gcc
  - golang
  - protoc
---

- Build VHDL sources on/for amd64.
- Build VHPI wrapper (C) on/for amd64.
- Build gRPC client (C or golang) with the VHPI wrapper (C) on/for amd64.
- Modify the sources to use the gRPC client library (C), instead of the original function.
- Build the application on/for ARM.
- Get/build gRPC server on/for amd64 or ARM.
