entity helloworld is
end entity helloworld;
    
architecture sim of helloworld is
begin
    process is
    begin
        report "Hello world";
        wait;
    end process;
    

end architecture sim;
    
