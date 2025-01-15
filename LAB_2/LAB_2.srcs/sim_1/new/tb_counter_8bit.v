`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 10:13:49
// Design Name: 
// Module Name: tb_counter_8bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for 8-bit Up/Down Counter
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_counter_8bit;

    reg Clk_1Hz = 0;
    reg reset = 1;
    reg UP = 1;
    wire [6:0] Count;
    
    counter_8bit Cl(
        .Clk_1Hz(Clk_1Hz),
        .reset(reset),
        .UP(UP),
        .Count(Count)
    );
 
    always #5 Clk_1Hz = ~Clk_1Hz; 
  
    initial begin
        
        reset = 1;
        #50 reset = 0;
  
        UP = 1;
        #915; 
        
        UP = 0;
        #915; 
        
        $stop;
    end  
    
endmodule
