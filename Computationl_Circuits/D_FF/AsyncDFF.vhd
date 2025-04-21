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
    -- Asynchronous DFF: The output is conrolled by the rst being 0 not 1 
    -- With the rising_edge if clk (q/output = din)
    process(din, clk, rst) is
    begin
        if (rst = '1') then
            dout <= '0';
        elsif (rising_edge(clk)) then
            dout <= din;
        end if;
    end process;
end architecture rtl;
