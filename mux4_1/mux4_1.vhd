library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux4_1 is
generic(DataWidth : integer);
port(
	-- inputs
	Sig1, Sig2, Sig3, Sig4 : in unsigned(DataWidth - 1 downto 0);
	sel : in unsigned(1 downto 0);
	
	-- outputs
	output: out unsigned(DataWidth - 1 downto 0)
);
end entity mux4_1;

architecture rtl of mux4_1 is
begin
    -- case selection logic
    process(sel, Sig1, Sig2, Sig3, Sig4)
    begin
        case sel is
            when "00" =>
                output <= Sig1;
            when "01" =>
                output <= Sig2;
            when "10" =>
                output <= Sig3;
            when "11" =>
                output <= Sig4;
            when others =>
                output <= (others => 'X');
        end case;
    end process;

end architecture rtl;
