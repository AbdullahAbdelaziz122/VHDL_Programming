library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PortMapTb is
end entity PortMapTb;

architecture sim of PortMapTb is
	
	constant DataWidth : integer := 8;
	
    signal Sig1: unsigned(DataWidth - 1 downto 0) := x"AA";
    signal Sig2: unsigned(DataWidth - 1 downto 0) := x"BB";
    signal Sig3: unsigned(DataWidth - 1 downto 0) := x"CC";
    signal Sig4: unsigned(DataWidth - 1 downto 0) := x"DD";

    signal sel : unsigned(1 downto 0) := (others => '0');
    signal output : unsigned(DataWidth - 1 downto 0);
begin
	
	-- An instance if mux4_1 with architecture rtl
	i_Mux1: entity work.mux4_1(rtl) 
	generic map(DataWidth => DataWidth)
	port map(
		sel    => sel,
		Sig1   => Sig1,
		Sig2   => Sig2,
		Sig3   => Sig3,
		Sig4   => Sig4,
		output => output
	);

    -- sel counter
    process
        variable i : integer := 0;
    begin
        while i < 4 loop
            wait for 10 ps;
            sel <= sel + 1;
            i := i + 1;
        end loop;
		
		sel <= (others => 'X');
	
        wait; -- stop simulation
    end process;

end architecture sim;
