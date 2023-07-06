// Visit downtothecircuits.com for more information
// Code by: circuitpotato
module full_adder_verilog(
    input i_A,  //input
    input i_B,
    input i_Cin,
    
    output o_Sum,   //output
    output o_Cout);
    
    assign o_Sum = i_A ^ i_B ^ i_Cin;                       //sum = A xor B xor Cin
    assign o_Cout = ((i_A ^ i_B) & i_Cin) | (i_A & i_B);    //Cout = ((A xor B) and Cin) or (A and B)
endmodule
