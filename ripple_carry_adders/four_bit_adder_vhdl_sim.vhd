-- Visit downtothecircuits.com for more information
-- Code by: circuitpotato
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity four_bit_adder_vhdl_sim is
--  Port ( );
end four_bit_adder_vhdl_sim;

architecture Behavioral of four_bit_adder_vhdl_sim is
    signal i_A: std_logic_vector(3 downto 0);
    signal i_B: std_logic_vector(3 downto 0);
    signal i_Cin: std_logic;
    
    signal o_total: std_logic_vector(4 downto 0);   -- o_Cout + o_Sum --> easier visualisation on sim
    
    component four_bit_adder_vhdl is
        Port ( i_A: in STD_LOGIC_VECTOR(3 downto 0);    
               i_B : in STD_LOGIC_VECTOR(3 downto 0);
               i_Cin: in STD_LOGIC;
               
               o_Sum: out STD_LOGIC_VECTOR(3 downto 0); 
               o_Cout: out STD_LOGIC);
    end component;
begin
    
    uut: four_bit_adder_vhdl port map (i_A => i_A, i_B => i_B, i_Cin => i_Cin, o_Sum => o_total(3 downto 0), o_Cout => o_total(4));
    
    process
    begin
        i_Cin <= '0';
        i_A <= "0000";
        i_B <= "0000";
        wait for 10ns;  
        
        for i in 1 to 15 loop
            i_A <= i_A + 1;
            i_B <= i_B + 1;
            wait for 10ns;
        end loop;
        
--        -- stop simulation after producing required values (not an elegant way)
--        assert false report "NONE. End of simulation." severity failure;
        
    end process;
end Behavioral;
