library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Decode2_1 is
    port(
        a: in std_logic_vector(1 downto 0);
        y: out std_logic_vector(3 downto 0)
    );
end entity Decode2_1;

architecture rtl of Decode2_1 is
    
begin
    process(a)
    begin
        if (a = "00") then y <= "0001";
        elsif (a = "01") then y <= "0010";
        elsif (a = "10") then y <= "0100";
        else y <= "1000";
        end if;
    end process;
            
        end architecture rtl;