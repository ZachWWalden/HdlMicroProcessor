`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Oklahoma Christian University
// Engineer: Zachary Walden
// 
// Create Date: 01/14/2022 12:44:56 PM
// Design Name: HDL Microprocessor System On Chip
// Module Name: soc
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


module soc(
    input CLK100MHZ,
    input reset,
    output wire [7:0] main_memory_data_out,
    output wire [13:0] call_stack_data_out,
    output wire [11:0] fb_a_dout,
    output wire [11:0] fb_b_dout,
    output wire [31:0] prg_mem_a_dout,
    output wire [7:0] prg_mem_b_dout
    );
    reg [16:0] addr_counter = 0;
    //main memory wires
    reg [16:0] main_memory_addr = 0;
    wire [7:0] main_memory_data_in = 0;
    reg main_memory_write_enable = 1;
    
    //call stack wires
    reg [7:0] call_stack_addr = 0;
    wire [13:0] call_stack_data_in = 0;
    
    //framebuffer wires
    reg [16:0] fb_a_addr = 0;
    reg [16:0] fb_b_addr = 0;
    wire [11:0] fb_a_din = 0;
    wire [11:0] fb_b_din = 0;
    
    //program memory wires
    reg [13:0] prg_mem_a_addr = 0;
    reg [15:0] prg_mem_b_addr = 0;
    
    //Main Memoru
    blk_mem_gen_0 main_mem (
            .clka(CLK100MHZ),    // input wire clka
            .wea(main_memory_write_enable),      // input wire [0 : 0] wea
            .addra(main_memory_addr),  // input wire [16 : 0] addra
            .dina(main_memory_data_in),    // input wire [7 : 0] dina
            .douta(main_memory_data_out)  // output wire [7 : 0] douta
        );
    call_stack call_stack_block (
            .clka(CLK100MHZ),    // input wire clka
            .wea(main_memory_write_enable),      // input wire [0 : 0] wea
            .addra(call_stack_addr),  // input wire [7 : 0] addra
            .dina(call_stack_data_in),    // input wire [13 : 0] dina
            .douta(call_stack_data_out)  // output wire [13 : 0] douta
        );
    frame_buffer frame_buffer_block (
            .clka(CLK100MHZ),    // input wire clka
            .wea(main_memory_write_enable),      // input wire [0 : 0] wea
            .addra(fb_a_addr),  // input wire [16 : 0] addra
            .dina(fb_a_din),    // input wire [11 : 0] dina
            .douta(fb_a_dout),  // output wire [11 : 0] douta
            .clkb(CLK100MHZ),    // input wire clkb
            .web(main_memory_write_enable),      // input wire [0 : 0] web
            .addrb(fb_b_addr),  // input wire [16 : 0] addrb
            .dinb(fb_b_din),    // input wire [11 : 0] dinb
            .doutb(fb_b_dout)  // output wire [11 : 0] doutb
        );
    program_memory prog_mem (
            .clka(CLK100MHZ),    // input wire clka
            .addra(prg_mem_a_addr),  // input wire [13 : 0] addra
            .douta(prg_mem_a_dout),  // output wire [31 : 0] douta
            .clkb(CLK100MHZ),    // input wire clkb
            .addrb(prg_mem_b_addr),  // input wire [15 : 0] addrb
            .doutb(prg_mem_b_dout)  // output wire [7 : 0] doutb
        );
        
        always @ (posedge CLK100MHZ)
        begin
            addr_counter <= addr_counter + 1;
        end
        always @ (negedge CLK100MHZ)
        begin
            main_memory_addr <= addr_counter;
            fb_a_addr <= addr_counter;
            fb_b_addr <= addr_counter;
            call_stack_addr <= addr_counter[7:0];
            prg_mem_a_addr <= addr_counter[13:0];
            prg_mem_b_addr <= addr_counter[15:0];            
        end
endmodule
