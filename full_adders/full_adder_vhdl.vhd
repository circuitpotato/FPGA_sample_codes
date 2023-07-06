-- Visit downtothecircuits.com for more information
-- Code by: circuitpotato
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_vhdl is
    Port ( i_A : in STD_LOGIC;  --input
           i_B : in STD_LOGIC;
           i_Cin : in STD_LOGIC;
           
           o_Sum : out STD_LOGIC;   --output
           o_Cout : out STD_LOGIC);
end full_adder_vhdl;

architecture rtl of full_adder_vhdl is

begin
    o_Sum <= i_A xor i_B xor i_Cin;                         --sum = A xor B xor Cin
    o_Cout <= ((i_A xor i_B) and i_Cin) or (i_A and i_B);   --Cout = ((A xor B) and Cin) or (A and B)
end rtl;
