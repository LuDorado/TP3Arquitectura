`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2018 19:15:38
// Design Name: 
// Module Name: bip
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


// IMPORTANTE
// 1- LEE los datos al reves de como los ingresamos
// 2- NO OLVIDARSE LOS CAMBIOS EN EL BAUD RATE!!!!!!


module bip(
    output[7:0] salida,
    output finish_prog,
    input clk,
    input rst,
    input rx
    );
    wire rd2uart, rx_rdy, prog_end_signal, start_prog;
    wire [15:0] prog_result;
    wire [7:0] data_rx2ic, cycles_2ic;
    
    uart 
    comm_module (
        .d_rx2alu(data_rx2ic),
        .rx_empty_tick(rx_rdy),
        .clk(clk),
        .rst(rst),
        .rx(rx),
        .alu_ready2rd(rd2uart)
        );
    
    alu_ic
    ic_bus (
            .o_rd_uart(rd2uart),
            .o_cpu_en(start_prog),
            .o_wr_uart(finish_prog),
            .data_alu_out(salida),
            .clk(clk),
            .rst(rst),
            .rx_empty_in(rx_rdy),
            .data_alu_in(data_rx2ic),
            .i_op_finish(prog_end_signal),
            .i_cycles_count(cycles_2ic)//i_data_rslt(prog_result[7:0])  
        );
    cycles
    cycleCounter (
            .counter(cycles_2ic),
            .clk(clk),
            .rst(rst),
            .strt_cnt(start_prog)
            );
    cpu
    processor (
            .o_program_rdy(prog_end_signal),
            //.o_program_rslt(prog_result),
            .clk(clk),
            .rst(rst),
            .start(start_prog)
            );
endmodule