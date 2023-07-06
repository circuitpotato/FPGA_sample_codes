-- Visit downtothecircuits.com for more information
-- Code by: circuitpotato
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity two_to_one_mux_vhdl is
    generic (bit_width: integer:=1);    -- width of inputs and outputs
    Port ( i_A : in std_logic_vector (bit_width-1 downto 0);    --i_Sel = 0 for i_A
           i_B : in std_logic_vector (bit_width-1 downto 0);    --i_Sel = 1 for i_B
           i_Sel : in std_logic;
           
           o_Z : out std_logic_vector (bit_width-1 downto 0) );
end two_to_one_mux_vhdl;

architecture rtl of two_to_one_mux_vhdl is

begin
    o_Z <= i_A when i_Sel='0' else i_B;
end rtl;
