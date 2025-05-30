library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clockedProcessTb is
end entity clockedProcessTb;

architecture sim of clockedProcessTb is
	constant clockFrequency : integer := 100e6; -- 100^6 [100 MHZ]
	constant clockPeriod : time := 1000 ms / clockFrequency;
	
	signal clk 	  : std_logic := '1';
	signal nRst	  : std_logic := '0';
	signal input  : std_logic := '0';
	signal output : std_logic;
begin
	
	-- The Device Under Test (DUT)
	i_flipflop: entity work.flipflop(rtl)
	port map (
		clk    => clk,
		nRst   => nRst,
		input  => input,
		output => output
	);
	
	-- process for generating the clock
	clk <= not clk after clockPeriod / 2;
	
	-- Testbench sequence 
	process is
	begin
		nRst <= '1';
		wait for 20 ns;
		
		input <= '1';
		wait for 22 ns;
		
		input <= '0';
		wait for 6 ns;
		input <= '1';
		wait for 20 ns;
		
		-- reset the DUT
		nRst <= '0';
		
		wait;
	end process;
	
end architecture sim;
