`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 04:08:25 AM
// Design Name: 
// Module Name: Multiplier_Top_Module_tb
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


module Multiplier_Top_Module_tb;
    reg clk, reset;
    reg [2:0] addr1, addr2, addr3;
    wire [7:0] result;
    wire [2:0] st_out;
    
    Multiplier_Top_Module uut(clk, reset, addr1, addr2, addr3, result, st_out);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1; #10;
        reset = 0;
        addr1 = 3'b000; addr2 = 3'b001; addr3 = 3'b010;
        #10;
//        addr1 = 3'b011; addr2 = 3'b100; addr3 = 3'b101;
//        #100;
//        addr1 = 3'b110; addr2 = 3'b111; addr3 = 3'b000; 
//        #10;
        $stop;
    end


endmodule
