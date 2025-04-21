library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Problem2 is
    port (
        x, y    : in  std_logic;
        dout    : out std_logic;
        clk, rst: in  std_logic
    );
end entity Problem2;

architecture rtl of Problem2 is
    signal q1 : std_logic; -- Output of the first DFF
    signal q2 : std_logic; -- Output of the second DFF (which is dout)
begin
    process (clk, rst) is
        variable next_q1 : std_logic;
    begin
        if rst = '1' then
            q1 <= '0';
            q2 <= '0';
        elsif rising_edge(clk) then
            next_q1 := x xor y;
            q1 <= next_q1;
            q2 <= q1; -- The previous state of q1 becomes the new state of q2
        end if;
    end process;

    dout <= q2; -- Assign the output of the second DFF to the output port
end architecture rtl;