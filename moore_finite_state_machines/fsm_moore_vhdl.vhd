-- Visit downtothecircuits.com for more information
-- Code by: circuitpoato
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity fsm_moore_vhdl is
    Port ( i_reset: in std_logic;
           i_clock: in std_logic;
           i_data_in: in std_logic;
           o_data_out : out std_logic);
end fsm_moore_vhdl;

architecture Behavioral of fsm_moore_vhdl is
    type state_type is (idle, state_undetected, state_detected);    -- state machine declaration 
    signal state: state_type;           
    
    signal sequence_capture: std_logic_vector(2 downto 0);          -- works like a shift register
    
begin
    
    -- combinational logic process 
    -- output only updates at respective states and is unaffected by input
    process (state) begin
        case state is
            when idle => 
                o_data_out <= '0';   
                 
            when state_undetected =>  
                o_data_out <= '0';
                              
            when state_detected =>  
                o_data_out <= '1';
            
            when others => 
                o_data_out <= '0';    
        end case;
    end process;
    
    -- clock process 
    process (i_clock) begin
        if rising_edge(i_clock) then
            if (i_reset = '0') then                             -- active low reset
                sequence_capture <= (others => '0');
                state <= idle;
            else
                case state is
                    when idle => 
                        sequence_capture <= (others => '0');
                        state <= state_undetected;
                    
                    when state_undetected => 
                        sequence_capture <= sequence_capture(1 downto 0) & i_data_in;   
                        
                        if (sequence_capture = "101") then
                            state <= state_detected;
                        end if;
                        
                    when state_detected => 
                        sequence_capture <= sequence_capture(1 downto 0) & i_data_in;
                        
                        if (sequence_capture = "101") then
                            state <= state_detected;
                        else
                            state <= state_undetected;
                        end if;
                    
                    when others => 
                        sequence_capture <= (others => '0');
                        state <= idle;    
                end case;
            end if;
        end if;
    end process;

end Behavioral;
