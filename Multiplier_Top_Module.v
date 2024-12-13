`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 02:01:03 AM
// Design Name: 
// Module Name: Multiplier_Top_Module
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


module Multiplier_Top_Module(
    input clk, reset,
    input [2:0] addr1, addr2, addr3,
    output [7:0] result,
    output [2:0] st_out
    );
    
    wire rw = 1'b1;
    wire [2:0] adr;
    

    wire w_rf;
    wire w_ram;
    wire DA, SA, SB;

    wire [7:0] product;
    wire [3:0] a, b;
    wire [3:0] Rom_data;

    Rom uut1 (.Rom_data(Rom_data), .Rom_addr(adr));
    cu uut4 (.clk(clk), .reset(reset), .adr1(addr1), .adr2(addr2), .w_rf(w_rf), .adr(adr), .DA(DA), .SA(SA), .SB(SB), .st_out(st_out), .w_ram(w_ram));
    RF uut5 (.A(a), .B(b), .SA(SA), .SB(SB), .D(Rom_data), .DA(DA), .W(w_rf), .rst(reset), .clk(clk)); 
    Multiplier uut2 (.a(a), .b(b), .p(product));
    Ram uut3 (.clk(clk), .reset(reset), .addr(addr3), .write_data(product), .write_en(w_ram), .read_data(result));
endmodule