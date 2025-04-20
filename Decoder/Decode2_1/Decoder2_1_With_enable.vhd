library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Decoder2_1_With_enable is
    port(
        a: in std_logic_vector(1 downto 0);
        en: in std_logic;
        y: out std_logic_vector(3 downto 0)
    );
end entity Decoder2_1_With_enable;

architecture rtl of Decoder2_1_With_enable is
begin
process(a, en)
begin
    if (en = '1') then
        if (a = "00") then y <= "0001";
        elsif (a = "01") then y <= "0010";
        elsif (a = "10") then y <= "0100";
        else y <= "1000";
        end if;
    else y <= "0000";
    end if;
end process;

    end architecture rtl;