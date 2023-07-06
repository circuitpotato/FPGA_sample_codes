// Visit downtothecircuits.com for more information
// Code by: circuitpotato
module two_to_one_mux_verilog 
#(parameter bit_width = 1)
   (input [bit_width-1:0] i_A,  //i_Sel = 0 for i_A
    input [bit_width-1:0] i_B,  //i_Sel = 1 for i_B
    input i_Sel,
    
    output [bit_width-1:0] o_Z
    );
    
    //assign i_B to o_Z if i_Sel=1, assign i_A to o_Z if i_Sel=0
    assign o_Z = i_Sel ? i_B: i_A;  
endmodule
