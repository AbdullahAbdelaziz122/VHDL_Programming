library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer is
generic(clockFrequency : integer);
port(
	clk     : in std_logic;
	nRst    : in std_logic; -- Negative Reset
	seconds : inout integer;
	minutes : inout integer;
	hours   : inout integer
);
end entity timer;
architecture rtl of timer is

	signal ticks : integer;
	
begin
	process (clk) is
	begin
		
		if rising_edge(clk) then
			if nRst = '0' then
				ticks   <= 0;
				seconds <= 0;
				minutes <= 0;
				hours   <= 0;
			else
				
				-- True once every second
				if ticks = clockFrequency - 1 then
					ticks <= 0;
					
					if seconds = 59 then
						seconds <= 0;
						
						-- True once every minute
						if minutes = 59 then
							minutes <= 0;
							
							-- True once every hour
							if hours = 23 then
								hours <= 0;
							else
								hours <= hours + 1;
							end if;
						else
							minutes <= minutes + 1;
						end if;
					else
						seconds <= seconds + 1;
					end if;
				else
					ticks <= ticks +1;
				end if;
			end if;
		end if;
	end process;
end architecture rtl;
