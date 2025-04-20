library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer is
port(
	clk    : in std_logic;
	nRst   : in std_logic -- Negative Reset
);
end entity timer;
architecture rtl of timer is

begin
	process (clk) is
	begin
		
		if rising_edge(clk) then
			if nRst = '0' then
			else
			end if;
		end if;
	end process;
end architecture rtl;
