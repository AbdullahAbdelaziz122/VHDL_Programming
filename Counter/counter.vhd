library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_UNSIGNED.all;
entity counter is
port(
	clk : in std_logic;
	count: out std_logic_vector(3 downto 0)
);
end entity counter;

architecture sim of counter is
		-- We could use signal but there will be dely as the count will only update afte the clk = 0;
		-- signal temp: std_logic_vector(3 downto 0) := (others => '0');
begin
	process (clk) is
		variable temp: std_logic_vector(3 downto 0) := (others => '0');
	begin
		if rising_edge(clk) then
			temp := temp + '1';
		end if;
		count <= temp;
	end process;
end architecture sim;
