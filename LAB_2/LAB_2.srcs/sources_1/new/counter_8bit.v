`timescale 1ns / 1ps
module counter_8bit(
    input Clk_1Hz,
    input reset,
    input UP,
    output reg [6:0] Count  
    );
    
    reg [6:0] PS, NS;
    
    always @(posedge Clk_1Hz or posedge reset)
    begin
        if (reset)
            PS <= 7'd0;   
        else
            PS <= NS;     
    end
    
    always @(*)
    begin
        if (UP) begin  
            if (PS == 7'd85)
                NS = 7'd0;   
            else
                NS = PS + 7'd1;  
        end 
        else begin  
            if (PS == 7'd0)
                NS = 7'd85;  
            else
                NS = PS - 7'd1;  
        end
    end    
    
    always @(posedge Clk_1Hz or posedge reset)
    begin
        if (reset)
            Count <= 7'd0;   
        else
            Count <= PS;     
    end
endmodule
