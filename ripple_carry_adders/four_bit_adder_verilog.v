// Visit downtothecircuits.com for more information
// Code by: circuitpotato
module four_bit_adder_verilog(
    input [3:0] i_A,    
    input [3:0] i_B,
    input i_Cin,
    
    output [3:0] o_Sum, 
    output o_Cout);
    
    wire C1, C2, C3;
    
    full_adder_verilog FA0 (.i_A(i_A[0]), .i_B(i_B[0]), .i_Cin(i_Cin), .o_Sum(o_Sum[0]), .o_Cout(C1));
    full_adder_verilog FA1 (.i_A(i_A[1]), .i_B(i_B[1]), .i_Cin(C1), .o_Sum(o_Sum[1]), .o_Cout(C2));
    full_adder_verilog FA2 (.i_A(i_A[2]), .i_B(i_B[2]), .i_Cin(C2), .o_Sum(o_Sum[2]), .o_Cout(C3));
    full_adder_verilog FA3 (.i_A(i_A[3]), .i_B(i_B[3]), .i_Cin(C3), .o_Sum(o_Sum[3]), .o_Cout(o_Cout));
endmodule
