library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux4_1_1input is
    port(
        a: in std_logic_vector(3 downto 0);
        sel: in std_logic_vector(1 downto 0);
        y: out std_logic 
    );
end entity mux4_1_1input;

architecture rtl of mux4_1_1input is
begin

with sel select
y <= 
a(0) when "00",
a(1) when "01",
a(2) when "10",
a(3) when others;

   
  

end architecture rtl;