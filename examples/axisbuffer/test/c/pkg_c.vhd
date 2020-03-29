--library vunit_lib;
--context vunit_lib.vunit_context;

package pkg_c is

  function get_p(f: integer) return integer;
    attribute foreign of get_p :
      function is "VHPIDIRECT get_p";

  constant stream_length : integer := get_p(0);

  type buffer_t is array(integer range 0 to stream_length-1) of integer;
  type buffer_p is access buffer_t;

  impure function get_b(f: integer) return buffer_p;
    attribute foreign of get_b :
      function is "VHPIDIRECT get_b";

  type buffet_t_prot is protected
    procedure init ( i: integer );
    procedure set ( i: integer; v: integer);
    impure function get (i: integer) return integer;
  end protected buffet_t_prot;

  shared variable ibuffer: buffet_t_prot;
  shared variable obuffer: buffet_t_prot;

end pkg_c;

package body pkg_c is
  function get_p(f: integer) return integer is begin
    assert false report "VHPI" severity failure;
  end get_p;

  impure function get_b(f: integer) return buffer_p is begin
    assert false report "VHPI" severity failure;
  end get_b;

  type buffet_t_prot is protected body
    variable var: buffer_p;
    procedure init ( i: integer ) is begin
      var := get_b(i);
    end procedure;
    procedure set ( i: integer; v: integer ) is begin
      var(i) := v;
--      info("set(" & integer'image(i) & "): " & integer'image(var(i)));
    end procedure;
    impure function get ( i: integer ) return integer is begin
--      info("get(" & integer'image(i) & "): " & integer'image(var(i)));
      return var(i);
    end get;
  end protected body buffet_t_prot;
end pkg_c;
