-- Visit downtothecircuits.com for more information
-- Code by: circuitpotato
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_to_one_mux_vhdl is
    generic (bit_width: integer:=1);
    Port ( i_A: in std_logic_vector(bit_width-1 downto 0);
           i_B: in std_logic_vector(bit_width-1 downto 0);
           i_C: in std_logic_vector(bit_width-1 downto 0);
           i_D: in std_logic_vector(bit_width-1 downto 0);
           i_sel: in std_logic_vector(1 downto 0);   
           
           o_Z: out std_logic_vector(bit_width-1 downto 0));
end four_to_one_mux_vhdl;

architecture rtl of four_to_one_mux_vhdl is
    
begin
    o_Z <= i_A when i_Sel = "00" else 
           i_B when i_Sel = "01" else
           i_C when i_Sel = "10" else
           i_D;
end rtl;
