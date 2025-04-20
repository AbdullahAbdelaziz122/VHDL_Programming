library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Decoder_3_8 is
    port(
        a: in std_logic_vector(2 downto 0);
        y: out std_logic_vector(7 downto 0)
    );
end entity Decoder_3_8;

architecture rtl of Decoder_3_8 is
begin

    process(a)
    begin
        if (a = "000") then y <= "00000001";
        elsif (a = "001") then y <= "00000010";
        elsif (a = "010") then y <= "00000100";
        elsif (a = "011") then y <= "00001000";
        elsif (a = "100") then y <= "00010000";
        elsif (a = "101") then y <= "00100000";
        elsif (a = "110") then y <= "01000010";
        else y <= "10000010";
        end if;
    end process;
end architecture rtl;