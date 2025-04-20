entity loops is
end entity;
    
architecture sim of loops is
begin
    process is
    variable i : integer := 0 ;
    begin
    while i < 10 loop
        report "i=" & integer'image(i);
        i:= i + 1;
    end loop;

    end process;
    

end architecture sim;
    
