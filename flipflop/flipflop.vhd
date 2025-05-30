library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flipflop is
port(
	clk    : in std_logic;
	nRst   : in std_logic; -- Negative Reset
	input  : in std_logic;
	output : out std_logic
);
end entity flipflop;

architecture rtl of flipflop is

begin
	process (clk) is
	begin
		
		if rising_edge(clk) then
			if nRst = '0' then
				output <= '0';
			else
				output <= input;
			end if;
		end if;
	end process;
end architecture rtl;
