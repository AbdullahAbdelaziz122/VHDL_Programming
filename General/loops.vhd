entity loops is
end entity;
    
architecture sim of loops is
begin
    process is
    begin
        report "Hello";
        loop
            report "yes";
            wait for 10 ps;
        end loop;

        report "Goodbye";
        wait;
    end process;
    

end architecture sim;
    
