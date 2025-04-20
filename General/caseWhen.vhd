library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity caseWhen is
end entity caseWhen;

architecture sim of caseWhen is
    signal Sig1: std_logic_vector(7 downto 0) := x"AA";
    signal Sig2: std_logic_vector(7 downto 0) := x"BB";
    signal Sig3: std_logic_vector(7 downto 0) := x"CC";
    signal Sig4: std_logic_vector(7 downto 0) := x"DD";

    signal sel : unsigned(1 downto 0) := (others => '0');
    signal output1 : std_logic_vector(7 downto 0);
begin

    -- sel counter
    process
        variable i : integer := 0;
    begin
        while i < 3 loop
            wait for 10 ps;
            sel <= sel + 1;
            i := i + 1;
        end loop;
		
		sel <= (others => 'X');
	
        wait; -- stop simulation
    end process;

    -- case selection logic
    process(sel, Sig1, Sig2, Sig3, Sig4)
    begin
        case sel is
            when "00" =>
                output1 <= Sig1;
            when "01" =>
                output1 <= Sig2;
            when "10" =>
                output1 <= Sig3;
            when "11" =>
                output1 <= Sig4;
            when others =>
                output1 <= (others => 'X');
        end case;
    end process;

end architecture sim;
