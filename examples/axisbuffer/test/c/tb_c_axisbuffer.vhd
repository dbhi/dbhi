library ieee;
context ieee.ieee_std_context;

library vunit_lib;
context vunit_lib.vunit_context;
context vunit_lib.vc_context;
use vunit_lib.core_pkg.stop;

use work.pkg_c.all;

entity test_axisbuffer is
end entity;

architecture test of test_axisbuffer is

  constant clk_period : time := 20 ns;
  constant data_width : natural := get_p(1);
  constant fifo_depth : natural := get_p(2);

  constant m_axis : axi_stream_master_t := new_axi_stream_master(data_length => data_width);
  constant s_axis : axi_stream_slave_t := new_axi_stream_slave(data_length => data_width);

  signal clk, rst, rstn : std_logic := '0';
  signal start, sent, saved : boolean := false;

begin

  clk <= not clk after (clk_period/2);
  rstn <= not rst;

  main: process
    procedure run_test is begin
      info("Init test");
      wait until rising_edge(clk); start <= true;
      wait until rising_edge(clk); start <= false;
      wait until (sent and saved and rising_edge(clk));
      info("Test done");
    end procedure;
  begin
    ibuffer.init(0);
    obuffer.init(1);
    rst <= '1';
    wait for 16*clk_period;
    rst <= '0';
    run_test;
    stop(0);
    wait;
  end process;

--

  stimuli: process
    variable last : std_logic;
  begin
    sent <= false;
    wait until start and rising_edge(clk);

    for y in 0 to stream_length-1 loop
      wait until rising_edge(clk);
      push_axi_stream(net, m_axis, std_logic_vector(to_signed(ibuffer.get(y), data_width)) , tlast => '0');
    end loop;

    wait until rising_edge(clk);
    sent <= true;
    wait;
  end process;

  save: process
    variable o : std_logic_vector(31 downto 0);
    variable last : std_logic:='0';
  begin
    saved <= false;
    wait until start and rising_edge(clk);
    wait for 50*clk_period;

    for y in 0 to stream_length-1 loop
      pop_axi_stream(net, s_axis, tdata => o, tlast => last);
      obuffer.set(y,to_integer(signed(o)));
    end loop;

    wait until rising_edge(clk);
    saved <= true;
    wait;
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
