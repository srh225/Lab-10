`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 12:18:09 AM
// Design Name: 
// Module Name: Ram
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


module Ram(
    input clk, reset, write_en,
    input [2:0] addr,
    input [7:0] write_data,
    output reg [7:0] read_data
);
    reg [7:0] mem [0:7];

    always @(posedge clk) 
    begin
        if(reset) begin 
            mem[0] <= 8'b0;
            mem[1] <= 8'b0;
            mem[2] <= 8'b0;
            mem[3] <= 8'b0;
            mem[4] <= 8'b0;
            mem[5] <= 8'b0;
            mem[6] <= 8'b0;
            mem[7] <= 8'b0;
        end 
        else 
        begin
            if(write_en)
            begin
                mem[addr] <= write_data; 
            end
            else
            begin
                read_data <= mem[addr]; 
            end
        end
    end
endmodule
