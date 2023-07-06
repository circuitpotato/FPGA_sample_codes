--Visit downtothecircuits.com for more information
-- Code by: circuitpotato
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity clock_divide_vhdl_sim is
--  Port ( );
end clock_divide_vhdl_sim;
 
architecture Behavioral of clock_divide_vhdl_sim is
    signal i_clock: std_logic:='0';
    signal o_clock: std_logic:='0';
    constant clock_period: time:=10ns;  -- 100 MHz 
     
    component clock_divide_vhdl is
        Port    (i_clock: in std_logic;
                 o_clock: out std_logic);
    end component;
begin
    --Instantiate
    uut: clock_divide_vhdl 
    port map (i_clock=>i_clock, o_clock=>o_clock);
     
    --Simulate i_clock
    process is
    begin
        wait for clock_period/2;
        i_clock <= not i_clock;
    end process p_CLK_GEN; 
 
end Behavioral;
