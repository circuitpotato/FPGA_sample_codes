// Visit downtothecircuits.com for more information
// Code by: circuitpotato
`timescale 1ns / 1ps
module fsm_moore_verilog_sim();
    reg i_reset = 1'b0;
    reg i_clock = 1'b0;
    reg i_data_in = 1'b0;
    wire o_data_out;
    
    // unit under test
    fsm_moore_verilog uut (.i_reset(i_reset), .i_clock(i_clock), .i_data_in(i_data_in), .o_data_out(o_data_out));
    
    // simulated i_clock
    initial
    begin
        i_clock = 1'b0;
        forever #5 i_clock = ~i_clock;
    end
    
    // simulation
    initial 
    begin
        i_data_in = 1'b0;
        i_reset = 1'b0;
        #100;
        
        i_reset = 1'b1;
        #10;
        
        i_data_in = 1'b1;
        #10;
        
        i_data_in = 1'b0;
        #10;
        
        i_data_in = 1'b1;
        #10;
        
        i_data_in = 1'b0;
        #10;
        
        i_data_in = 1'b0;
        #10;
        
        i_data_in = 1'b1;
        #10;
        
        i_data_in = 1'b0;
        #10;
        
        i_data_in = 1'b1;
        #50;
    end


endmodule
