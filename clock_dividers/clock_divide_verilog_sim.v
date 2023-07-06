// Visit downtothecircuits.com for more information
// Code by: circuitpotato
`timescale 1ns / 1ps
module clock_divide_verilog_sim();
    reg i_clock;
    wire o_clock;
    
    // clk period of 100 MHz is 10ns
    parameter clock_period = 10;    
    
    //Instantiate
    clock_divide_verilog uut (.i_clock(i_clock), .o_clock(o_clock));
    
    //Simulate i_clock
    initial 
    begin
        i_clock = 1'b0;
        forever #(clock_period/2) i_clock = ~i_clock;
    end
endmodule
