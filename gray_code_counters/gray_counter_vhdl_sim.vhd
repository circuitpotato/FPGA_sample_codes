-- Visit downtothecircuits.com for more information
-- Code by: circuitpotato
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gray_counter_vhdl_sim is
--  Port ( );
end gray_counter_vhdl_sim;

architecture Behavioral of gray_counter_vhdl_sim is
    
    constant N: integer:=4;     -- No. of bits
    
    signal i_clk: std_logic:='0';
    signal i_reset: std_logic:='0';
    signal o_gray_count: std_logic_vector(N-1 downto 0):=(others => '0');
    constant clock_period: time:=10ns;      

    component gray_counter_vhdl is
        Port ( i_clk : in  std_logic;
               i_reset: in std_logic;
               o_gray_count : out  std_logic_vector(N-1 downto 0));
    end component;
    
begin
    
    -- unit under test
    uut: gray_counter_vhdl port map (i_clk => i_clk, i_reset => i_reset, o_gray_count => o_gray_count);
    
    i_reset <= '1', '0' after 50 ns;
    
    -- Simulate i_clk
    process is
    begin
        wait for clock_period/2;
        i_clk <= not i_clk;
    end process p_CLK_GEN;     
    
end Behavioral;
