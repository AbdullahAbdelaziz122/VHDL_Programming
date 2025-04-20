library ieee;
use ieee.std_logic_1164.all;

entity stdLogicVector is
end entity stdLogicVector;
    
architecture sim of stdLogicVector is
	signal Slv1: std_logic_vector(7 downto 0) := "00000001";
begin

	-- shif register
	process is 
	begin
		wait for 10 ps;
		for i in Slv1'left downto Slv1'right + 1 loop
			Slv1(i) <= Slv1(i - 1);
		end loop;
		Slv1(Slv1'right) <= Slv1(Slv1'left);
	end process;
	
	
end architecture sim;
    