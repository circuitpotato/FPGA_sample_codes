// Visit downtothecircuits.com for more information
// Code by: circuitpotato
`timescale 1ns / 1ps

module four_bit_CLA_adder_verilog_sim();
    reg [3:0] i_A, i_B;
    reg i_Cin;
    
    wire [4:0] o_Total;
    
    integer i;
    
    // unit under test    
    four_bit_CLA_adder_verilog uut (.i_A(i_A), .i_B(i_B), .i_Cin(i_Cin), .o_Sum(o_Total[3:0]), .o_Cout(o_Total[4]));
    
    initial begin
        // when i_Cin = 0
        i = 0;
        i_Cin = 1'b0;
        i_A = 4'b0000;
        i_B = 4'b0000;
        #10; 
        
        for (i=1; i<=15; i=i+1) begin
            i_A = i_A + 1;
            i_B = i_B + 1;
            #10;
        end   
        
        // when i_Cin = 1
        i = 0;
        i_Cin = 1'b1;
        i_A = 4'b0000;
        i_B = 4'b0000;
        #10;
        
        for (i=1; i<=15; i=i+1) begin
            i_A = i_A + 1;
            i_B = i_B + 1;
            #10;
        end
        $finish;
    end        
      
endmodule
