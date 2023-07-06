-- Visit downtothecircuits.com for more information
-- Code by: circuitpotato
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_mealy_vhdl is
    Port ( i_reset: in std_logic;
           i_clock: in std_logic;
           i_data_in: in std_logic;
           o_data_out : out std_logic);
end fsm_mealy_vhdl;

architecture Behavioral of fsm_mealy_vhdl is
    
    type state_type is (idle, state_detect);                    -- state machine declaration 
    signal state: state_type;                                   
    
    signal sequence_capture: std_logic_vector(1 downto 0);      -- works like a shift register
begin
    
    -- combinational logic process 
    -- output depends on state and input
    process (state, sequence_capture, i_data_in) begin
        case state is
            when idle =>    
                o_data_out <= '0';       
                                     
            when state_detect =>  
                if (i_data_in = '1' and sequence_capture = "10") then
                    o_data_out <= '1';
                else
                    o_data_out <= '0';
                end if;
            
            when others => 
                o_data_out <= '0';
        end case;
    end process;
    
    -- clock process
    process (i_clock) begin
        if rising_edge (i_clock) then
            if i_reset = '0' then                       -- active low reset
                sequence_capture <= (others => '0');            
                state <= idle; 
            else
                case (state) is
                    when idle => 
                        sequence_capture <= (others => '0');
                        state <= state_detect; 
                        
                    when state_detect => 
                        sequence_capture <= sequence_capture(0) & i_data_in;
                        
                    when others => 
                        sequence_capture <= (others => '0');
                        state <= idle;    
                end case;
            end if;
        end if;
    end process;

end Behavioral;
