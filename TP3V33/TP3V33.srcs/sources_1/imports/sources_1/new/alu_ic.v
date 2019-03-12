`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:13:34 08/24/2017 
// Design Name: 
// Module Name:    placa 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu_ic #( 
    parameter   N_BITS = 8    //   data bits
    )
    (
        
        output o_rd_uart,
        output o_cpu_en,
        output o_wr_uart, // termino la ejecucion
        output [N_BITS-1:0] data_alu_out,
        input  clk,
        input  rst,
        input  rx_empty_in,
        input  [N_BITS-1:0] data_alu_in,
        input i_op_finish,
        input  [N_BITS-1:0] i_cycles_count//i_data_rslt  
    );
    
    //estados
        localparam [1:0] 
            IDLE = 2'b00,
            CHECK = 2'b01,
            BUSSY = 2'b10,
            PRINT = 2'b11;
  
    reg op_ok, new_op_ok, rd, rd_value, cpu_state, new_cpu_state, start_count, start_count_flag;

    //variables de ejecucion
    reg [1:0] crnt_state;
    reg [1:0] state_saved;
    //reg tick;
    reg [N_BITS-1:0] counter, counter_value;    
    always @(posedge clk)
    begin
        if(rst)
        begin
            cpu_state <= 1'b0;
            rd <= 1'b0; 
            op_ok <= 1'b0;
            crnt_state <= IDLE;
            start_count <=1'b0;
            counter <= 8'b0;
        end
        else
        begin
            cpu_state <= new_cpu_state;
            rd <= rd_value; 
            op_ok <= new_op_ok;
            crnt_state <= state_saved;
            start_count <= start_count_flag;
            counter <= counter_value;
       end
    end
    always @*
    begin
        state_saved =  crnt_state;
        new_cpu_state = 1'b0;
        rd_value = rd;
        new_op_ok = op_ok;
        start_count_flag = start_count;
        counter_value = counter;
        case(crnt_state)
            IDLE:
            begin
                new_op_ok = 1'b0;
                if(rx_empty_in)
                begin
                    rd_value = 1'b1;
                    state_saved = CHECK;
                end
           end
           
           CHECK:
           begin
               rd_value = 1'b0;
               if (data_alu_in == 8'b01000010)//8'b01010011)
               begin
                  new_cpu_state = 1'b1;
                  state_saved = BUSSY;
               end
               else
                   state_saved = IDLE;
           end  
           
           BUSSY:
           begin
                if(i_op_finish)
                begin
                    new_cpu_state = 1'b0;
                    new_op_ok = 1'b1;
                    counter_value = i_cycles_count;

                //get_rslt_state = counter;
                    state_saved = PRINT;
                end
           end  
           
           PRINT:	 
           begin
               //start_count_flag = 1'b0;
               //data_alu_out = counter;
               new_op_ok = 1'b0;
               state_saved = IDLE;        
           end
        endcase
    end
    
    assign o_cpu_en = cpu_state;
    assign o_rd_uart = rd; 
    assign o_wr_uart = op_ok;
    assign data_alu_out = counter;
endmodule
