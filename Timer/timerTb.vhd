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
begin
	
	-- The Device Under Test (DUT)
	

	
	-- process for generating the clock
	clk <= not clk after clockPeriod / 2;
	
	-- Testbench sequence 
	process is
	begin
		
		wait;
	end process;
	
end architecture sim;
