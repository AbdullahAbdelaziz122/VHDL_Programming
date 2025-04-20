library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
  
entity TrafficLight is
generic(ClockFrequencyHz : integer);
port(
    Clk         : in std_logic;
    nRst        : in std_logic; -- Negative reset
    NorthRed    : out std_logic; 
    NorthYellow : out std_logic;
    NorthGreen  : out std_logic;
    WestRed     : out std_logic;
    WestYellow  : out std_logic;
    WestGreen   : out std_logic
);
end entity;
  
  
  
  
architecture rtl of TrafficLight is

    -- calculate  the number if clock cycles in minutes / seconds 
    function CounterVal(
        Minutes : integer := 0;
        Seconds : integer := 0
        ) return integer is

            variable TotalSeconds : integer;
    begin
        TotalSeconds := Seconds + Minutes * 60;
        return TotalSeconds * ClockFrequencyHz - 1;
    end function;
	
    -- Enumerated type declaration and state signal declaration
    type t_state is (NorthNext, StartNorth, North, StopNorth, WestNext, StartWest, West, StopWest);

    signal State : t_State;

    -- counter for counting clock periods, 1 minute max
    signal Counter : integer range 0 to ClockFrequencyHz * 60;

begin
  
    process(Clk) is

        impure function CounterExpired
        (
            Minutes : integer := 0;
            Seconds : integer := 0) return boolean is
        
        begin
            if Counter = CounterVal(Minutes, Seconds) then
                Counter <= 0;
                return true; 
            else
                return false;
            end if; 
        end function;

    begin
        if rising_edge(Clk) then
    
            -- If the negative reset signal is active
            if nRst = '0' then
				
                -- Reset Values
                State <= NorthNext;
                NorthRed     <= '1';
                NorthYellow  <= '0';
                NorthGreen   <= '0';
                WestRed      <= '1';
                WestYellow   <= '0';
                WestGreen    <= '0';
                Counter <= 0;

            else

                
                -- Default values
                NorthRed     <= '0';
                NorthYellow  <= '0';
                NorthGreen   <= '0';
                WestRed      <= '0';
                WestYellow   <= '0';
                WestGreen    <= '0';
                
                Counter <= Counter + 1;

                case State is
                    -- Red in all direction
                    when NorthNext => 
                        NorthRed <= '1';
                        WestRed <= '1';
                        if CounterExpired(Seconds => 5) then 
                            State <= StartNorth;
                        end if;
                    
                    
                    -- Red and Yellow in North/South directions    
                    when StartNorth => 
                        NorthRed    <= '1';
                        NorthYellow <= '1';
                        WestRed     <= '1';
                        if CounterExpired(Seconds => 5) then 
                            State <= North;
                        end if;
                        
                    
                    -- Green in North/South direction and Red in West/East 
                    when North =>
                        NorthGreen <= '1';
                        WestRed <='1';
                        if CounterExpired(Seconds => 60) then 
                            State <= StopNorth;
                        end if;
                        
                    
                    -- Yellow in North/South and Red in West/East
                    when StopNorth =>
                        NorthYellow <= '1';
                        WestRed <= '1';
                        if CounterExpired(Seconds => 5) then 
                            State <= WestNext;
                        end if;
                        
                    
                    -- Red in all direction
                    when WestNext =>
                        NorthRed <= '1';
                        WestRed <= '1';
                        if CounterExpired(Seconds => 5) then 
                            State <= StartWest;
                        end if;
                        
                        
                    -- Red and Yellow in West/East direction and Red in North/South 
                    when StartWest =>
                        WestRed <= '1';
                        WestYellow <= '1';
                        NorthRed <= '1';
                        if CounterExpired(Seconds => 5) then 
                            State <= West;
                        end if;
                        
                       
                    
                    -- Green in West/East and Red in North/South
                    when West =>
                        WestGreen <= '1';
                        NorthRed <= '1';
                        if CounterExpired(Seconds => 60) then 
                            State <= StopWest;
                        end if;
                        
                    
                    -- Yellow in West/East and Red in North/South
                    when StopWest =>
                        WestYellow <= '1';
                        NorthRed <= '1';
                        if CounterExpired(Seconds => 5) then 
                            State <= NorthNext;
                        end if;
                    
                end case;
            end if;
        end if;
    end process;
  
end architecture;