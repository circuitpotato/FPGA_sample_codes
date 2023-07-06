// Visit downtothecircuits.com for more information
// Code by: circuitpotato
module clock_divide_verilog 
    (input i_clock, 
     output o_clock);
    
    // i_count= (Freq_CLK / (2*Freq_desired )) - 1
    // Note: Freq_CLK = 100MHz, Freq_desired = 10MHz
    integer i_count = 4;    // set as 10MHz 
    
    // i_count_bits = log_2 (i_count)
    // round (i_count_bits) to the nearest whole number 
    // Note: edit (i_count_bits) together with (i_count). Otherwise just set i_count_bits = 31
    parameter i_count_bits = 2;
    
    reg [i_count_bits:0] count = 0;   
    reg toggle = 0;
    
    assign o_clock = toggle;
    
    always @ (posedge i_clock) begin
        count <= (count == i_count)? 0 : count + 1;     // set counter
        toggle <= (count == 0)? ~toggle : toggle;       // toggle when counter finishes
    end
endmodule
