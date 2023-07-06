// Visit downtothecircuits.com for more information
// Code by: circuitpotato
`timescale 1ns / 1ps
module four_bit_adder_verilog_sim();
    reg [3:0] i_A;
    reg [3:0] i_B;
    reg i_Cin;
    
    wire [4:0] o_total;     // o_Cout + o_Sum --> easier visualisation on sim
    
    integer i=0;
    
    four_bit_adder_verilog uut (.i_A(i_A), .i_B(i_B), .i_Cin(i_Cin), .o_Sum(o_total[3:0]), .o_Cout(o_total[4]));
    
    initial 
    begin
        i_A = 4'b0000;
        i_B = 4'b0000;
        i_Cin = 0;
        #10;
        
        for (i=1;i<=15;i=i+1)
        begin
            i_A = i_A + 1;
            i_B = i_B + 1; 
            #10;
            $display("i values: %d", i);
        end
        
        // stop simulation after producing required values
        $finish;
    end
endmodule
