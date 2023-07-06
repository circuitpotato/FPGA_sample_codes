-- Visit downtothecircuits.com for more information
-- Code by: circuitpotato
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity clock_divide_vhdl is
    Port    (i_clock: in std_logic;
             o_clock: out std_logic);
end clock_divide_vhdl;
 
architecture Behavioral of clock_divide_vhdl is

    -- i_count= (Freq_CLK / (2*Freq_desired )) - 1
    -- Note: Freq_CLK = 100MHz, Freq_desired = 10MHz
    constant i_count: integer:=4;   -- set as 10MHz 
    
    signal count: natural range 0 to i_count;   
    signal toggle: std_logic:='0';
 
begin
    o_clock <= toggle;
     
    clk_divider: process (i_clock) is
    begin
        if rising_edge(i_clock) then    -- set counter
            if (count=i_count) then
                count <= 0;
            else
                count<= count + 1;
            end if;
             
            if (count = 0) then         -- toggle when counter finishes
                toggle <= not toggle;
            else
                toggle <= toggle;
            end if;
        end if;
    end process;
end Behavioral;
