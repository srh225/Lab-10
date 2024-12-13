`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 12:41:50 AM
// Design Name: 
// Module Name: Ram_tb
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


module Ram_tb;
    reg clk;
    reg reset;
    reg write_en;
    reg [2:0] addr;
    reg [7:0] write_data;
    wire [7:0] read_data;

    Ram uut(.clk(clk), .reset(reset), .write_en(write_en), .addr(addr), .write_data(write_data), .read_data(read_data));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1; #10;
        reset = 0;
        write_en = 1; addr = 3'b000; write_data = 8'b10011000; #10;
        write_en = 0; addr = 3'b000; #10;
        write_en = 1; addr = 3'b001; write_data = 8'b00001010; #10;
        write_en = 0; addr = 3'b001; #10;
        $stop;
    end
endmodule
