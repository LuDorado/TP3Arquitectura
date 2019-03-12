`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2018 17:31:21
// Design Name: 
// Module Name: cycles
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cycles(
    output [7:0] counter,
    input clk,
    input rst,
    input strt_cnt
    );
    reg [7:0]count, count_saved;
    always @(negedge clk)
    begin
        if (rst)
            count <=8'b0;
        else
            count <= count_saved + 1'b1;
    end
    always @*
    begin
        if (strt_cnt) 
            count_saved = 8'b00000000;
        else
            count_saved = count;
    end
    assign counter = count;
        
    
    
endmodule
