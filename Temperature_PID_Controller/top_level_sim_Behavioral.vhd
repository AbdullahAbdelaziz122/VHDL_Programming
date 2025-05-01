--
-- VHDL Architecture Temperature_PIDcontroller_lib.top_level_sim.Behavioral
--
-- Created:
--          by - Abdelaziz.UNKNOWN (ABDULLAH)
--          at - 17:16:17 05/ 1/2025
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY top_level_sim IS
    port (
        clk    : in std_logic;
        reset  : in std_logic;
        setpoint : in integer range 0 to 100;
        ambient_temp_in : in integer range 0 to 100;  
        sim_temp_out : out integer range 0 to 100;
        pid_output_out : out integer range 0 to 100
    );
END ENTITY top_level_sim;

--
architecture Behavioral of top_level_sim is

    signal pid_to_temp    : integer range 0 to 100;
    signal current_temp   : integer range 0 to 100;

    component PIDController_sim is
        port (
            samplingRateClock : in std_logic;
            reset             : in std_logic;
            setpoint          : in integer range 0 to 100;
            simulated_temp_in : in integer range 0 to 100;
            controlOutput     : out integer range 0 to 100
        );
    end component;

    component temperature_model is
        port (
            clk             : in  std_logic;
            reset           : in  std_logic;
            fan_speed_in    : in  integer range 0 to 100;
            ambient_temp_in : in  integer range 0 to 100;  
            current_temp_out: out integer range 0 to 100
        );
    end component;

begin

    pid_instance : PIDController_sim
    port map (
        samplingRateClock => clk,
        reset             => reset,
        setpoint          => setpoint,
        simulated_temp_in => current_temp,
        controlOutput     => pid_to_temp
    );

    temp_model_instance : temperature_model
    port map (
        clk             => clk,
        reset           => reset,
        fan_speed_in    => pid_to_temp,
        ambient_temp_in => ambient_temp_in,  
        current_temp_out=> current_temp
    );

    sim_temp_out <= current_temp;
    pid_output_out <= pid_to_temp;

end architecture Behavioral;
