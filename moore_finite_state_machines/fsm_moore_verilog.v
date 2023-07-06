// Visit downtothecircuits.com for more information
// Code by: circuitpotato
module fsm_moore_verilog(
    input i_reset,
    input i_clock,
    input i_data_in,
    output reg o_data_out
    );

    parameter  idle = 2'b00, state_undetected = 2'b01, state_detected = 2'b10;      // state machine declaration
    reg [1:0] state;
    
    reg [2:0] sequence_capture;                                                     // works like a shift register

    // combinational logic process
    // output only updates at respective states and is unaffected by input
    always @ (state) begin
        case (state) 
            idle: 
                o_data_out <= 1'b0;
            
            state_undetected: 
                o_data_out <= 1'b0; 
            
            state_detected: 
                o_data_out <= 1'b1;
            
            default: 
                o_data_out <= 1'b0;
                
        endcase
    end
    
    // clock process
    always @ (posedge i_clock) begin
        if (i_reset == 0) begin                                                 // active low reset
            sequence_capture <= 3'b000;
            state <= idle;
        end
        else begin
            case (state) 
                idle: begin
                    sequence_capture <= 3'b000;
                    state <= state_undetected;
                end 
                
                state_undetected: begin
                    sequence_capture <= {sequence_capture[1:0], i_data_in};
                    
                    if (sequence_capture == 3'b101) begin
                        state <= state_detected;
                    end
                end
                
                state_detected: begin
                    sequence_capture <= {sequence_capture[1:0], i_data_in};
                    
                    if (sequence_capture == 3'b101) begin
                        state <= state_detected;
                    end
                    else begin
                        state <= state_undetected;
                    end
                end
                
                default: begin
                    sequence_capture <= 0;
                    state <= idle;
                end
            endcase
        end
    end
endmodule
