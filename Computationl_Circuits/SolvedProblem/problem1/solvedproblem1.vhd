library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity solvedProblem is

port(
    x, y : in std_logic;
    dout : out std_logic;
   
    clk : in std_logic;
    rst : in std_logic
);
end entity solvedProblem;
architecture rtl of Problem2 is
begin

    -- لو عندنا اي جزء في الدائرة compartorial circuit --
    -- :ومش هاوزة يتحول ل سيكونشيال سيركت , بعرفه علي انه --
    -- variable--

    process(clk, rst) is

        variable din : std_logic;

    begin
        if rst = '1' then
            dout <= '0';
        else
            if rising_edge(clk) then
                din := x xor y;
                dout <= din;
            end if;
        end if;
    end process;
end architecture rtl;