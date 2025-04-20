library ieee;
use ieee.std_logic_1164.all;

entity stdLogic is
end entity stdLogic;
    
architecture sim of stdLogic is
	signal signal1 : std_logic := '0';
	signal signal2 : std_logic;
	signal signal3 : std_logic;
begin
	-- 
    process is
	begin 
		wait for 20 ps;
		signal1 <= not signal1;
	
    end process;
	
	-- Driver A
	process is
	begin
		signal2 <= 'Z';
		signal3 <= '0';
		wait;
	end process;
	
	-- Driver B
	process (signal1) is 
	begin
		
		if (signal1 = '1') then
			signal2 <= '1';
			signal3 <= '1';
		else
			signal2 <= 'Z';
			signal3 <= 'Z';
		
		end if;
		end process;
end architecture sim;
    