-- Visit downtothecircuits.com for more information
-- Code by: circuitpotato
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity four_bit_CLA_adder_vhdl_sim is
--  Port ( );
end four_bit_CLA_adder_vhdl_sim;

architecture Behavioral of four_bit_CLA_adder_vhdl_sim is
    
    signal i_A, i_B: std_logic_vector(3 downto 0):="0000";
    signal i_Cin: std_logic:='0';
    signal o_Total: std_logic_vector(4 downto 0);
    
    component four_bit_CLA_adder_vhdl is
        Port ( i_A, i_B : in std_logic_vector(3 downto 0);
               i_Cin: in std_logic;
               
               o_Sum: out std_logic_vector(3 downto 0);
               o_Cout: out std_logic);
    end component; 
      
begin
    
    -- unit under test
    uut: four_bit_CLA_adder_vhdl port map (i_A => i_A, i_B => i_B, i_Cin => i_Cin, o_Sum => o_Total(3 downto 0), o_Cout => o_Total(4));
    
    process begin
        -- when i_Cin = 0
        i_Cin <= '0';
        i_A <= "0000";
        i_B <= "0000";
        wait for 10ns;
        
        for i in 1 to 15 loop
            i_A <= i_A + 1;
            i_B <= i_B + 1;
            wait for 10ns;
        end loop;
        
        -- when i_Cin = 1
        i_Cin <= '1';
        i_A <= "0000";
        i_B <= "0000";
        wait for 10ns;
        
        for i in 1 to 15 loop
            i_A <= i_A + 1;
            i_B <= i_B + 1;
            wait for 10ns;
        end loop;
        
    end process;
    
end Behavioral;
