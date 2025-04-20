library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux8_1_with_mux2_1 is
    port(
        s0, s1, s2 : in std_logic;
        a0, a1, a2, a3, a4, a5, a6, a7 : in std_logic;
        y : out std_logic
    );
end entity mux8_1_with_mux2_1;

architecture rtl of mux8_1_with_mux2_1 is
begin
    process(s0, s1, s2, a0, a1, a2, a3, a4, a5, a6, a7)
    variable sel : std_logic_vector(2 downto 0);
    begin
        sel := s2 & s1 & s0;
        if sel = "000" then
            y <= a0;
        elsif sel = "001" then
            y <= a1;
        elsif sel = "010" then
            y <= a2;
        elsif sel = "011" then
            y <= a3;
        elsif sel = "100" then
            y <= a4;
        elsif sel = "101" then
            y <= a5;
        elsif sel = "110" then
            y <= a6;
        else
            y <= a7;
        end if;
    end process;
end architecture;
