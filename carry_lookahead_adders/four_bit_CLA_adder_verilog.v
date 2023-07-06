// Visit downtothecircuits.com for more information
// Code by: circuitpotato
module four_bit_CLA_adder_verilog(
    input [3:0] i_A, [3:0] i_B, 
    input i_Cin,
    
    output [3:0] o_Sum,
    output o_Cout
    );
    
    wire [3:0] P, G;    // P(i) = A(i) xor B(i)    G(i) = A(i) and B(i)
    wire [2:0] C;       // Cout of FA0, FA1, FA2 respectively
    
    CLA_full_adder_verilog CLA_FA0 (.i_A(i_A[0]), .i_B(i_B[0]), .i_Cin(i_Cin), .o_Sum(o_Sum[0]), .o_P(P[0]), .o_G(G[0]));
    CLA_full_adder_verilog CLA_FA1 (.i_A(i_A[1]), .i_B(i_B[1]), .i_Cin(C[0]), .o_Sum(o_Sum[1]), .o_P(P[1]), .o_G(G[1]));
    CLA_full_adder_verilog CLA_FA2 (.i_A(i_A[2]), .i_B(i_B[2]), .i_Cin(C[1]), .o_Sum(o_Sum[2]), .o_P(P[2]), .o_G(G[2]));
    CLA_full_adder_verilog CLA_FA3 (.i_A(i_A[3]), .i_B(i_B[3]), .i_Cin(C[2]), .o_Sum(o_Sum[3]), .o_P(P[3]), .o_G(G[3]));
    
    // C(0) = G(0) + (P(0)*i_Cin)
    assign C[0] = G[0] | (P[0] & i_Cin);
    // C(1) = G(1) + (P(1)*C(0));
    assign C[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & i_Cin);
    // C(2) = G(2) + (P(2)*C(1))
    assign C[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & i_Cin);
    // o_Cout = G(3) + (P(3)*C(2))
    assign o_Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & i_Cin);

endmodule
