// Visit downtothecircuits.com for more information
// Code by: circuitpotato
module gray_counter_verilog 
  #(parameter N =4)     // No. of bits
  (input i_clk,
   input i_reset,
   output reg [N-1:0] o_gray_count
);
    
    reg [N-1:0] count = 0; 
    
    always @ (posedge i_reset, posedge i_clk) 
    begin
        if (i_reset) begin
            o_gray_count <= 0;
            count = 0;
        end
        else begin
            o_gray_count <= ({1'b0, count[N-1:1]}) ^ count;
            count = count + 1; 
        end 
    end 
        
endmodule

