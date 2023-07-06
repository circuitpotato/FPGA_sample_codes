-- Visit downtothecircuits.com for more information
-- Code by: circuitpotato
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_mealy_vhdl_sim is
--  Port ( );
end fsm_mealy_vhdl_sim;

architecture Behavioral of fsm_mealy_vhdl_sim is
    signal i_reset: std_logic:='0';
    signal i_clock: std_logic:='0';
    signal i_data_in: std_logic:='0';
    signal o_data_out: std_logic:='0';
    
    constant clock_period: time:=10ns;
    
    component fsm_mealy_vhdl is
        Port ( i_reset: in std_logic;
               i_clock: in std_logic;
               i_data_in: in std_logic;
               o_data_out : out std_logic);
    end component;

begin
    -- unit under test
    uut: fsm_mealy_vhdl port map (i_reset => i_reset, i_clock => i_clock, i_data_in => i_data_in, o_data_out => o_data_out);

    -- simulated i_clock
    clock: process is 
    begin
        wait for clock_period/2;
        i_clock <= not i_clock;
    end process;
    
    sim: process is 
    begin
        i_data_in <= '0';
        i_reset <= '0';
        wait for 100ns;
        
        i_reset <= '1';
        wait for 10ns;
        
        i_data_in <= '1';
        wait for 10ns;
        
        i_data_in <= '0';
        wait for 10ns;
        
        i_data_in <= '1';
        wait for 10ns;
        
        i_data_in <= '0';
        wait for 10ns;
        
        i_data_in <= '0';
        wait for 10ns;
        
        i_data_in <= '1';
        wait for 10ns; 
        
        i_data_in <= '0';
        wait for 10ns;
        
        i_data_in <= '1';
        wait for 50ns;
        
    end process;

end Behavioral;
