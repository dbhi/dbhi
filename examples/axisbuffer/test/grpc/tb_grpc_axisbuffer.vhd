library ieee;
context ieee.ieee_std_context;

library vunit_lib;
context vunit_lib.vunit_context;
context vunit_lib.vc_context;
use vunit_lib.core_pkg.stop;

use work.pkg_grpc.all;

entity tb_grpc_buffer is
end tb_grpc_buffer;

architecture test of tb_grpc_buffer is

  constant clk_period : time := 20 ns;
  constant data_width : natural := get_p(0);
  constant fifo_depth : natural := get_p(1);

  constant m_axis : axi_stream_master_t := new_axi_stream_master(data_length => data_width);
  constant s_axis : axi_stream_slave_t := new_axi_stream_slave(data_length => data_width);

  signal clk, rst, rstn : std_logic := '0';
  signal run : boolean := false;

begin

  clk <= not clk after (clk_period/2);
  rstn <= not rst;

  main: process
  begin
    rst <= '1';
    wait for 16*clk_period;
    rst <= '0';
    wait for 10*clk_period;
    info("UUT ready");
    run <= true;
    wait;
  end process;

--

  stimuli: process
    variable d : std_logic_vector(31 downto 0);
  begin
    wait until rising_edge(clk);
    if run then
      d := std_logic_vector(to_signed(grpc_read(0), data_width));
      if get_p(2) = 0 then
        push_axi_stream(net, m_axis, d , tlast => '0');
      end if;
    end if;
  end process;

  save: process
    variable d : std_logic_vector(31 downto 0);
    variable last : std_logic:='0';
  begin
    wait until rising_edge(clk);
    if run then
      pop_axi_stream(net, s_axis, tdata => d, tlast => last);
      if get_p(3) = 0 then
        grpc_write(1, to_integer(signed(d)));
      end if;
    end if;
  end process;

--

  uut_vc: entity work.vc_axisbuffer
  generic map (
    m_axis => m_axis,
    s_axis => s_axis,
    data_width => data_width,
    fifo_depth => fifo_depth
  )
  port map (
    clk   => clk,
    rstn  => rstn
  );

end architecture;
