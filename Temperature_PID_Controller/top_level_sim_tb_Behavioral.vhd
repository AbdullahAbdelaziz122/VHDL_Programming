--
-- VHDL Architecture Temperature_PIDcontroller_lib.top_level_sim_tb.Behavioral
--
-- Created:
--          by - Abdelaziz.UNKNOWN (ABDULLAH)
--          at - 17:17:59 05/ 1/2025
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_level_sim_tb is
end entity top_level_sim_tb;

architecture Behavioral of top_level_sim_tb is

    signal clk_tb      : std_logic := '0';
    signal reset_tb    : std_logic := '1';
    signal setpoint_tb : integer range 0 to 100 := 60;
    signal ambient_temp_tb : integer range 0 to 100 := 25;  -- Initial ambient temp
    signal sim_temp_tb : integer range 0 to 100;
    signal pid_output_tb : integer range 0 to 100;

    constant clk_period : time := 10 ns;

    component top_level_sim is
        port (
            clk    : in std_logic;
            reset  : in std_logic;
            setpoint : in integer range 0 to 100;
            ambient_temp_in : in integer range 0 to 100;
            sim_temp_out : out integer range 0 to 100;
            pid_output_out : out integer range 0 to 100
        );
    end component;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut : top_level_sim
    port map (
        clk    => clk_tb,
        reset  => reset_tb,
        setpoint => setpoint_tb,
        ambient_temp_in => ambient_temp_tb,
        sim_temp_out => sim_temp_tb,
        pid_output_out => pid_output_tb
    );

    -- Clock Generation Process
    clk_process : process
    begin
        while true loop
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Stimulus Process
    stim_process : process
    begin
        -- Reset the system
        reset_tb <= '0';
        wait for 2 * clk_period;
        reset_tb <= '1';
        wait for 10 * clk_period;

        -- Change the setpoint
        wait for 50 * clk_period;
        setpoint_tb <= 30;
        wait for 100 * clk_period;

        -- Change the ambient temperature
        wait for 150 * clk_period;
        ambient_temp_tb <= 75;
        wait for 100 * clk_period;
        
        wait for 50 * clk_period;
        ambient_temp_tb <= 70;
        wait for 50 * clk_period;
        
        wait for 50 * clk_period;
        ambient_temp_tb <= 65;
        wait for 50 * clk_period;
        
        wait for 50 * clk_period;
        ambient_temp_tb <= 40;
        wait for 100 * clk_period;

        -- Change the setpoint again
        setpoint_tb <= 40;
        wait for 100 * clk_period;
        
        wait for 50 * clk_period;
        ambient_temp_tb <= 20;
        wait for 100 * clk_period;

        wait;
    end process;

end architecture Behavioral;
