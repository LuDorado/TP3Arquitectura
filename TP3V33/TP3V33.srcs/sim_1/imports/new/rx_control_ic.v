`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2018 20:18:17
// Design Name: 
// Module Name: rx_control_ic
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


module rx_control_ic();
    localparam T = 5;

    wire [7:0] salida;
    wire finish_prog;
    reg clk;
    reg rst;
    reg rx;
    //reg [7:0] alu_ready2rd;
    
    bip uut
        (
         .salida(salida),
         .finish_prog(finish_prog),
        .clk(clk),
        .rst(rst),
        .rx(rx)
        //.alu_ready2rd(alu_ready2rd)
        );
    /*brg brg_uut(
                .s_tick(tick),
                .clk(clk),
                .rst(rst)
                );
    rx rx_uut (
                .d_rx2ic(d_rx2alu),
                .rx_done(rx_empty_tick),
                .clk(clk),
                .rst(rst),
                .s_tick(tick),
                .rx(rx));*/
    initial
    begin
        rst = 1'b0;
        clk = 1'b0;
        rx =1'b1;
        #T;
        rst = 1'b1;
        clk = 1'b1;
        #T;
        rst = ~rst;
        clk = ~clk;
        
        #52160;
                rx = 0;     //Dato = FC
                #52160;
                rx = 1'b0; //d7
                #52160;
                rx = 1'b0;  //D6
                #52160;
                rx = 1'b1;  //D5
                #52160;
                rx = 1'b1;  //D4
                #52160;
                rx = 1'b1;    //D3
                #52160; 
                rx = 1'b1;  //D2
                #52160;
                rx = 1'b1;  //D1
                #52160;
                rx = 1'b1;  //D0
                #52160;
                rx = 1'b1;  //PARITY
                
                #52160;
                                rx = 0;     //Dato = 72
                                #52160;
                                rx = 1'b0; //D7
                                #52160;
                                rx = 1'b1;  //D6
                                #52160;
                                rx = 1'b0;  //D5
                                #52160;
                                rx = 1'b0;  //D4
                                #52160;
                                rx = 1'b1;  //D3
                                #52160; 
                                rx = 1'b1;  //D2
                                #52160;
                                rx = 1'b1;  //D1
                                #52160;
                                rx = 1'b0;  //D0
                                #52160;
                                rx = 1'b1;  //PARITY
                
                #52160;
                rx = 0;     //DatoB = 42
                #52160;
                rx = 1'b0; //D7
                #52160;
                rx = 1'b1;  //D6
                #52160;
                rx = 1'b0;  //D5
                #52160;
                rx = 1'b0;  //D4
                #52160;
                rx = 1'b0;  //D3
                #52160; 
                rx = 1'b0;  //D2
                #52160;
                rx = 1'b1;  //D1
                #52160;
                rx = 1'b0;  //D0
                #52160;
                rx = 1'b1;  //PARITY
                
                #52160;
                rx = 0;     //Dato = 52
                #52160;
                rx = 1'b0; //D7
                #52160;
                rx = 1'b1;  //D6
                #52160;
                rx = 1'b0;  //D5
                #52160;
                rx = 1'b0;  //D4
                #52160;
                rx = 1'b1;  //D3
                #52160; 
                rx = 1'b0;  //D2
                #52160;
                rx = 1'b1;  //D1
                #52160;
                rx = 1'b0;  //D0
                #52160;
                rx = 1'b1;  //PARITY
                      
                
    end
    always
        begin
            #T;
            clk = ~clk;
            #T;
        end
endmodule
