package pkg_grpc is
  function get_p(f: integer) return integer;
    attribute foreign of get_p :
      function is "VHPIDIRECT get_p";
  function grpc_read(c: integer) return integer;
    attribute foreign of grpc_read :
      function is "VHPIDIRECT read";
  procedure grpc_write(c, v: integer);
    attribute foreign of grpc_write :
      procedure is "VHPIDIRECT write";
end pkg_grpc;

package body pkg_grpc is
  function get_p(f: integer) return integer is begin
    assert false report "VHPI" severity failure;
  end get_p;
  function grpc_read(c: integer) return integer is begin
    assert false report "VHPI" severity failure;
  end grpc_read;
  procedure grpc_write(c, v: integer) is begin
    assert false report "VHPI" severity failure;
  end grpc_write;
end pkg_grpc;
