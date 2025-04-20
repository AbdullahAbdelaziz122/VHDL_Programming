entity waitingOn is
end entity waitingOn;
    
architecture sim of waitingOn is
	signal CountUp : integer := 0;
	signal CountDown : integer := 10;
begin
    process is
    begin
		CountUp <= CountUp + 1;
		CountDown <= CountDown - 1; 
		wait for 10 ps;
    end process;
    
	process (CountUp, CountDown) 
	begin
		report "CountUp= " & integer'image(CountUp) &
		", CountDown= " & integer'image(CountDown);
	end process;
	
	process (CountUp, CountDown)
	begin
		if (CountUp = CountDown) then
			report "Jackpot!";
		end if;
	end process;
end architecture sim;
    