library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clockedProcess is
end entity clockedProcess;

architecture sim of clockedProcess is
	constant clockFrequency : integer := 100e6 -- 100^6 [100 MHZ]
	constant clockPeriod : time := 1000 ms / clockFrequency;
	
	signal clk : std_logic := '1';
begin
	
	-- process for generating the clock
	clk <= clk after clockPeriod / 2;
	
end architecture sim;
