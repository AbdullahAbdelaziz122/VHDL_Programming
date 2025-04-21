library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity latch is

port(
    din : in std_logic;
    dout: out std_logic;
    clk: in std_logic;
    rst: in std_logic
);
end entity latch;
architecture rtl of latch is
begin
    --Synchronous DFF: The output is conrolled by the rising edge clk 
    -- With the rising_edge if rst = 0 then dout <= din;
    process(din, clk, rst) is
    begin
        if rising_edge(clk) then
            if rst = '1' then
                dout <= '0';
            else
                dout <= din;
            end if;
        end if;
    end process;
end architecture rtl;
