library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity latch is

port(
    din : in std_logic;
    dout: out std_logic;
    load: in std_logic
);
end entity latch;
architecture rtl of latch is
begin

    process(din, load) is
    begin
        if (load = '1') then
            dout <= din;
        end if;
    end process;
end architecture rtl;
