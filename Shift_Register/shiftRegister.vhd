library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shiftRegister is
    port (
        clk, rst: in  std_logic;
        load    : in  std_logic_vector(1 downto 0); -- 2-bit load signal
        din     : in  std_logic_vector(3 downto 0);
        sin_r   : in  std_logic;                      -- Serial input for right shift
        sin_l   : in  std_logic;                      -- Serial input for left shift
        dout    : out std_logic_vector(3 downto 0)
    );
end entity shiftRegister;

architecture rtl of shiftRegister is
    signal d_temp: std_logic_vector(3 downto 0);
begin
    process (clk, rst) is
    begin
        if rst = '1' then
            d_temp <= (others => '0');
        elsif rising_edge(clk) then
            case load is
                when "00" => -- Hold current value
                    null;
                when "01" => -- Shift right
                    d_temp <= sin_r & d_temp(3 downto 1);
                when "10" => -- Shift left
                    d_temp <= d_temp(2 downto 0) & sin_l;
                when "11" => -- Load parallel data
                    d_temp <= din;
                when others =>
                    null; 
            end case;
        end if;
    end process;

    dout <= d_temp;
end architecture rtl;