// Visit downtothecircuits.com for more information
// Code by: circuitpotato
`timescale 1ns / 1ps
module fsm_mealy_verilog(
    input i_reset,
    input i_clock,
    input i_data_in,
    output reg o_data_out
    );
    
    parameter idle = 1'b0, state_detect = 1'b1;     // state machine declaration    
    reg state;                      
    
    reg [1:0] sequence_capture;                     // works like a shift register
    
    // combinational logic process
    // output depends on state and input
    always @ (state, sequence_capture, i_data_in) begin
        case (state)
            idle: 
                o_data_out <= 1'b0;
            
            state_detect: begin
                if (i_data_in == 1'b1 && sequence_capture == 2'b10) begin
                    o_data_out <= 1'b1;
                end
                else begin 
                    o_data_out <= 1'b0;
                end
            end     
            
            default: begin
                o_data_out <= 1'b0;
            end    
        endcase
    end
    
    // clock process
    always @ (posedge i_clock) begin
        if (i_reset == 0) begin                 // active low reset
            sequence_capture <= 2'b00;
            state <= idle;
        end
        else begin
            case (state)
                idle: begin
                    sequence_capture <= 2'b00;
                    state <= state_detect;
                end
                
                state_detect: begin
                    sequence_capture <= {sequence_capture[0], i_data_in};
                end    
                
                default: begin
                    sequence_capture <= 2'b00;
                    state <= idle; 
                end
            endcase
        end
    end     
    
endmodule
