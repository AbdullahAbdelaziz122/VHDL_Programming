library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity waitOnWaitUntil is
end entity waitOnWaitUntil;

architecture rtl of waitOnWaitUntil is
    signal CountUp : integer := 0;
    signal CountDown : integer := 10;
    
begin
    process is 
    begin 
        wait on CountUp, CountDown;
    CountUp

    

end architecture rtl;