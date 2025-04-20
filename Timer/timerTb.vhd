library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timerTb is
end entity timerTb;

architecture sim of timerTb is
	--constant clockFrequency : integer := 100e6; -- 100^6 [100 MHZ]
	
	-- we are slowing down the clock to speed simulation time
	constant clockFrequency : integer := 10; -- 10 Hz 
	constant clockPeriod : time := 1000 ms / clockFrequency;
	
	signal clk 	   : std_logic := '1';
	signal nRst	   : std_logic := '0';
	signal seconds : integer;
	signal minutes : integer;
	signal hours   : integer;
	 
begin
	
	-- The Device Under Test (DUT)
	i_Timer : entity work.timer(rtl)
	generic map (clockFrequency => clockFrequency)
	port map (
		clk     => clk,
		nRst    => nRst,
		seconds => seconds,
		minutes => minutes,
		hours   => hours
	);

	
	-- process for generating the clock
	clk <= not clk after clockPeriod / 2;
	
	-- Testbench sequence 
	process is
	begin
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		-- Take the DUT out of reset
		nRst <= '1';
		wait;
	end process;
	
end architecture sim;
