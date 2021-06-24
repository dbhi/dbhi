---
id: yxa
status: "supported"
artifacts:
  - grpc
  - agrpc:amd64
  - hgrpc:arm
dependencies:
  - ghdl
  - gcc
  - golang
  - protoc
---
- Build VHDL sources on/for ARM.
- Build VHPI wrapper (C) on/for ARM.
- Build gRPC client (C or golang) with the VHPI wrapper (C) on/for ARM.
- Modify the sources to use the gRPC client library (C), instead of the original function.
- Build the application on/for amd64.
- Get/build gRPC server on/for amd64 or ARM.
