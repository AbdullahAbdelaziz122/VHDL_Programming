library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity looping is
end entity looping;

architecture rtl of looping is
begin
    process is
        variable i : integer := 0 ;
    begin
        while i < 10 loop
            report "i=" & integer'image(i);
            i:= i + 1;
        end loop;

    end process;

end architecture rtl;