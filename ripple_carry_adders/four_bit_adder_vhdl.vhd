-- Visit downtothecircuits.com for more information 
-- Code by: circuitpotato
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_bit_adder_vhdl is
    Port ( i_A: in STD_LOGIC_VECTOR(3 downto 0);    --input
           i_B : in STD_LOGIC_VECTOR(3 downto 0);
           i_Cin: in STD_LOGIC;
           
           o_Sum: out STD_LOGIC_VECTOR(3 downto 0); --output
           o_Cout: out STD_LOGIC);
end four_bit_adder_vhdl;

architecture struct of four_bit_adder_vhdl is

signal C1, C2, C3: std_logic;


    component full_adder_vhdl is
        Port ( i_A : in STD_LOGIC;  --input
               i_B : in STD_LOGIC;
               i_Cin : in STD_LOGIC;
               
               o_Sum : out STD_LOGIC;   --output
               o_Cout : out STD_LOGIC);
    end component;

begin

    FA0: full_adder_vhdl port map (i_A => i_A(0), i_B => i_B(0), i_Cin => i_Cin, o_Sum => o_Sum(0), o_Cout => C1);
    FA1: full_adder_vhdl port map (i_A => i_A(1), i_B => i_B(1), i_Cin => C1, o_Sum => o_Sum(1), o_Cout => C2);
    FA2: full_adder_vhdl port map (i_A => i_A(2), i_B => i_B(2), i_Cin => C2, o_Sum => o_Sum(2), o_Cout => C3);
    FA3: full_adder_vhdl port map (i_A => i_A(3), i_B => i_B(3), i_Cin => C3, o_Sum => o_Sum(3), o_Cout => o_Cout);
end struct;
