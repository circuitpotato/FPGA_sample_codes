// Visit downtothecircuits.com for more information
// Code by: circuitpotato
module four_to_one_mux_verilog
#(parameter bit_width=1)
   (input [bit_width-1:0] i_A, //i_Sel = 00 for i_A 
    input [bit_width-1:0] i_B, //i_Sel = 01 for i_B
    input [bit_width-1:0] i_C, //i_Sel = 10 for i_C
    input [bit_width-1:0] i_D, //i_Sel = 11 for i_D 
    input [1:0] i_Sel,
    
    output [bit_width-1:0]o_Z
    );
    
    assign o_Z = i_Sel[1] ? (i_Sel[0] ? i_D : i_C):(i_Sel[0] ? i_B : i_A);   
endmodule
