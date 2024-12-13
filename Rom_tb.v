`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 12:41:50 AM
// Design Name: 
// Module Name: Rom_tb
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


module Rom_tb;
    reg [2:0] Rom_addr;
    wire [3:0] Rom_data;
    
    Rom uut(.Rom_addr(Rom_addr), .Rom_data(Rom_data));

    initial begin
        #10;
        Rom_addr = 3'b000;
        #10;
        Rom_addr = 3'b001; 
        #10;
        Rom_addr = 3'b010;
        #10;
        Rom_addr = 3'b011;
        $stop;
    end
endmodule
