`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.12.2018 22:24:21
// Design Name: 
// Module Name: uart
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


module uart #(
        parameter N_BITS = 8
    )
    (
    output [N_BITS-1:0] d_rx2alu,
    output rx_empty_tick,
    input clk,
    input rst,
    input rx,
    input alu_ready2rd
    );
    
        wire tick, rx_done_tick;//,rx_empty_tick, alu_ready2rd, alu2uart, ic_tx_empty_tick, tx_done_tick;
        wire [7:0] d_rx2fifo;//, d_rx2alu, val_A, val_B, d_alu2ic, d_alu2fifo, d_ic2tx;
       // wire [5:0] val_OC;
        /*reg [7:0] data;
       always @(posedge clk)
           data <= d_alu2fifo;*/
        //
        brg
        BaudRateGenerator(
                            .s_tick(tick),
                            .clk(clk),
                            .rst(rst)
                        );
                        
        rx
        Receptor (
                    .d_rx2ic(d_rx2fifo),//), dout
                    .rx_done(rx_done_tick),
                    .clk(clk),
                    .rst(rst),
                    .s_tick(tick),
                    .rx(rx)
                 );
       fifo 
        RxInterface (
                    .empty (rx_empty_tick),
                    .out_data (d_rx2alu),
                    .clk (clk) ,
                    .rst (rst) ,    
                    .wr (rx_done_tick), 
                    .rd (alu_ready2rd),
                    .in_data (d_rx2fifo)   
               );
           
endmodule