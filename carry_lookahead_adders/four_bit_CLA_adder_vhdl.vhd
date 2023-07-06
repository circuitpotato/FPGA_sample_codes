-- Visit downtothecircuits.com for more information
-- Code by: circuitpotato
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_bit_CLA_adder_vhdl is
    Port ( i_A, i_B : in std_logic_vector(3 downto 0);
           i_Cin: in std_logic;
           
           o_Sum: out std_logic_vector(3 downto 0);
           o_Cout: out std_logic);
end four_bit_CLA_adder_vhdl;

architecture rtl of four_bit_CLA_adder_vhdl is

    component CLA_full_adder_vhdl is
        Port ( i_A, i_B, i_Cin : in STD_LOGIC; 
    
               o_Sum, o_P, o_G : out STD_LOGIC);
    end component;    
    
    signal P, G: std_logic_vector(3 downto 0);  -- P(i) = A(i) xor B(i)    G(i) = A(i) and B(i)
    signal C: std_logic_vector(2 downto 0);     -- Cout of FA0, FA1, FA2 respectively
    
begin
    
    CLA_FA0: CLA_full_adder_vhdl port map (i_A => i_A(0), i_B => i_B(0), i_Cin => i_Cin, o_Sum => o_Sum(0), o_P => P(0), o_G => G(0));
    CLA_FA1: CLA_full_adder_vhdl port map (i_A => i_A(1), i_B => i_B(1), i_Cin => C(0), o_Sum => o_Sum(1), o_P => P(1), o_G => G(1));
    CLA_FA2: CLA_full_adder_vhdl port map (i_A => i_A(2), i_B => i_B(2), i_Cin => C(1), o_Sum => o_Sum(2), o_P => P(2), o_G => G(2));
    CLA_FA3: CLA_full_adder_vhdl port map (i_A => i_A(3), i_B => i_B(3), i_Cin => C(2), o_Sum => o_Sum(3), o_P => P(3), o_G => G(3));
    
    -- C(0) = G(0) + (P(0)*i_Cin)
    C(0) <= G(0) or (P(0) and i_Cin);
    -- C(1) = G(1) + (P(1)*C(0));
    C(1) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and i_Cin);
    -- C(2) = G(2) + (P(2)*C(1))
    C(2) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and i_Cin);
    -- o_Cout = G(3) + (P(3)*C(2))
    o_Cout <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) and G(0)) or (P(3) and P(2) and P(1) and P(0) and i_Cin);

end rtl;
