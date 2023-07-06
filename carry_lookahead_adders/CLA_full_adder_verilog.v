// Visit downtothecircuits.com for more information
// This is just a partial full adder without Cout
// Code by: circuitpotato
module CLA_full_adder_verilog(
    input i_A, i_B, i_Cin,
    
    output o_Sum, o_P, o_G);
    
    assign o_P = i_A ^ i_B;         // P = A xor B
    assign o_G = i_A & i_B;         // G = A and B
    assign o_Sum = o_P ^ i_Cin;     // Sum = A xor B xor Cin  
endmodule
