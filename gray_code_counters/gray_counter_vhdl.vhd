-- Visit downtothecircuits.com for more information
-- Code by: circuitpotato
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity gray_counter_vhdl is
    generic  (N: integer:=4);   -- No. of bits 
    Port ( i_clk : in  std_logic;
           i_reset: in std_logic;
           o_gray_count : out  std_logic_vector(N-1 downto 0));
end gray_counter_vhdl;

architecture Behavioral of gray_counter_vhdl is	
    
begin

   process(i_reset, i_clk)
        variable count : std_logic_vector(N-1 downto 0) := (others => '0');
   begin		
		if i_reset = '1' then
		    o_gray_count <= (others => '0');
		    
		elsif rising_edge(i_clk) then 			
			o_gray_count <= ('0' & count(N-1 downto 1)) xor count;
			count := std_logic_vector(unsigned(count) + 1);
		end if;		
   end process; 
end Behavioral;

