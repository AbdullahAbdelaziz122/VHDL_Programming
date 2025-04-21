library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity parallelRegister is

port(
    din : in std_logic_vector(0 downto 7);
    dout : out std_logic_vector(0 downto 7);
   
    clk : in std_logic;
    rst : in std_logic
);

end entity parallelRegister;
architecture rtl of parallelRegister is
begin

    process(clk, rst) is
    begin
        if rst = '1' then
            dout <= (others => 0);
        else
            if rising_edge(clk) then
                dout <= din;
            end if;
        end if;
    end process;
end architecture rtl;
