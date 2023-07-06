// Visit downtothecircuits.com for more information
// Code by: circuitpotato
`timescale 1ns / 1ps
module gray_counter_verilog_sim();
    
    localparam N = 4;   // No. of bits
    
    reg i_clk;            
    reg i_reset;      
    wire [N-1:0] o_gray_count;
    
    // unit under test
    gray_counter_verilog uut (.i_clk(i_clk), .i_reset(i_reset) ,.o_gray_count(o_gray_count));
    
    initial 
    begin
        i_reset <= 1;
        #50 i_reset <= 0;
    end 
    
    // Simulate i_clk
    initial 
    begin
        i_clk = 1'b0;
        forever #5 i_clk = ~i_clk;
    end
    
endmodule
