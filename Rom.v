`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 12:18:09 AM
// Design Name: 
// Module Name: Rom
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


module Rom(Rom_data, Rom_addr);
    input [2:0] Rom_addr;
    output reg [3:0] Rom_data;
    
    always @(Rom_addr) 
    begin
        case (Rom_addr)
            3'd0: Rom_data = 4'b0010;
            3'd1: Rom_data = 4'b1100;
            3'd2: Rom_data = 4'b0110;
            3'd3: Rom_data = 4'b0111;
            3'd4: Rom_data = 4'b1000;
            3'd5: Rom_data = 4'b0001;
            3'd6: Rom_data = 4'b1101;
            3'd7: Rom_data = 4'b1110;
        endcase
    end
endmodule
