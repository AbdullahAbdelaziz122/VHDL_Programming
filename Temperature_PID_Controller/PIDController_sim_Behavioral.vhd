--
-- VHDL Architecture Temperature_PIDcontroller_lib.PIDController_sim.Behavioral
--
-- Created:
--          by - Abdelaziz.UNKNOWN (ABDULLAH)
--          at - 15:12:34 05/ 1/2025
--
-- using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY PIDController_sim IS
port(
   samplingRateClock  : in std_logic;
   reset              : in std_logic;
   setpoint           : in integer range 0 to 100;
   simulated_temp_in  : in integer range 0 to 100;  -- Intput from temperature model
   controlOutput      : out integer range 0 to 100  -- Output to temperature model
);
END ENTITY PIDController_sim;

--
ARCHITECTURE Behavioral OF PIDController_sim IS

      signal controllerOutput : integer range 0 to 100   := 0;
      constant kp             : integer range -1000 to 0 := -300;
      constant ki             : integer range -1000 to 0 := -2;
      constant kd             : integer range -1000 to 0 := 0;    
BEGIN
  
   process (samplingRateClock, reset)

      variable error         : integer range -1000 to 1000     := 0;
      variable previousError : integer range -1000 to 1000     := 0;
      variable errorSum      : integer range -100000 to 100000 := 0;
      variable errorChange   : integer range -1000 to 1000     := 0;
      variable output        : integer range -1000 to 1000     := 0;

   BEGIN
      if reset = '0' then
         error           := 0; 
         previousError   := 0;  
         errorSum        := 0;    
         errorChange     := 0;      
         output          := 0;
         controllerOutput <= 0;     
      
      elsif rising_edge(samplingRateClock) then
            -- Output Tuning  
            error := (setpoint - simulated_temp_in);
            errorSum := errorSum + error;

            if (errorSum > 10000) then
                errorSum := 10000;
            elsif (errorSum < -10000) then
                errorSum := -10000;
            end if;
            
            
            errorChange := error - previousError;
            output := (kp * error + ki * errorSum + kd * errorChange) / 100;
            previousError := error;
            
            if (output > 100) then
                output := 100;
            elsif (output < 0) then
                output := 0;
            end if;
            
            controllerOutput <= output;
      END if;
   END process;
   controlOutput <= controllerOutput;
END ARCHITECTURE Behavioral;

