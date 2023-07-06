// Visit downtothecircuits.com for more information
// Code by: circuitpotato
`timescale 1ns / 1ps
module full_adder_verilog_sim();
    reg i_A, i_B, i_Cin;
    wire o_Sum, o_Cout;
    
    full_adder_verilog uut (.i_A(i_A), .i_B(i_B), .i_Cin(i_Cin), .o_Sum(o_Sum), .o_Cout(o_Cout));
    
    initial
        begin
        i_A = 0;
        i_B = 0;
        i_Cin = 0;
        #5;

        i_A = 0;
        i_B = 0;
        i_Cin = 1;
        #5;

        i_A = 0;
        i_B = 1;
        i_Cin = 0;
        #5;

        i_A = 0;
        i_B = 1;
        i_Cin = 1;
        #5;

        i_A = 1;
        i_B = 0;
        i_Cin = 0;
        #5;

        i_A = 1;
        i_B = 0;
        i_Cin = 1;
        #5;                

        i_A = 1;
        i_B = 1;
        i_Cin = 0;
        #5;

        i_A = 1;
        i_B = 1;
        i_Cin = 1;
        #5;
    end
endmodule
