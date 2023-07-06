-- Visit downtothecircuits.com for more information
-- Code by: circuitpotato
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity full_adder_vhdl_sim is
--  Port ( );
end full_adder_vhdl_sim;

architecture Behavioral of full_adder_vhdl_sim is
    signal i_A, i_B, i_Cin: std_logic:='0';
    signal o_Sum, o_Cout: std_logic;
    component full_adder_vhdl is
        Port ( i_A : in STD_LOGIC;  --input
               i_B : in STD_LOGIC;
               i_Cin : in STD_LOGIC;
               
               o_Sum : out STD_LOGIC;   --output
               o_Cout : out STD_LOGIC);
    end component;
begin

uut: full_adder_vhdl port map (i_A => i_A, i_B => i_B, i_Cin => i_Cin, o_Sum => o_Sum, o_Cout => o_Cout);

    process 
        begin
        i_A <= '0';
        i_B <= '0';
        i_Cin <= '0';
        wait for 5 ns;
    
        i_A <= '0';
        i_B <= '0';
        i_Cin <= '1';
        wait for 5 ns;
    
        i_A <= '0';
        i_B <= '1';
        i_Cin <= '0';
        wait for 5 ns;
    
        i_A <= '0';
        i_B <= '1';
        i_Cin <= '1';
        wait for 5 ns;
    
        i_A <= '1';
        i_B <= '0';
        i_Cin <= '0';
        wait for 5 ns;
    
        i_A <= '1';
        i_B <= '0';
        i_Cin <= '1';
        wait for 5 ns;
    
        i_A <= '1';
        i_B <= '1';
        i_Cin <= '0';
        wait for 5 ns;
    
        i_A <= '1';
        i_B <= '1';
        i_Cin <= '1';
        wait for 5 ns;
       
    end process;
end Behavioral;
