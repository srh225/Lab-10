`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 12:41:50 AM
// Design Name: 
// Module Name: reg_cu_tb
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


module reg_cu_tb;

    // Signals for the register file
    reg clk, reset;
    reg [2:0] addr1, addr2, addr3;
    reg [3:0] write_data;
    reg write_en;
    wire [3:0] read_data1, read_data2;

    // Signals for the control unit
    reg start;
    reg [2:0] op_code;
    wire done;

    // Instantiate the register file
    RF rfuut (.a(a), .b(b), .SA(SA), .SB(SB), .ROM_data(ROM_data), .DA(DA), .w_rf(w_rf), .rst(reset), .clk(clk));

    // Instantiate the control unit
    cu CUuut (.clk(clk), .rst(reset), .adr1_r(addr1), .adr2_r(addr2), .w_rf(w_rf), .ROMO_addr(ROM_addr), .DA(DA), .SA(SA), .SB(SB), .st_out(st_out), .w_ram(w_ram));

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Reset system
        reset = 1; #10;
        reset = 0; 

        // Initialize the register file
        write_en = 1;
        write_addr = 3'b000; write_data = 4'b0011; #10; // Write 3 to address 0
        write_addr = 3'b001; write_data = 4'b0101; #10; // Write 5 to address 1
        write_en = 0;
        
        // Read values from the register file
        read_addr1 = 3'b000; read_addr2 = 3'b001; #10; // Read addresses 0 and 1

        // Start an operation in the control unit
        start = 1;
        op_code = 3'b010; // Example operation: Multiply
        #20;
        start = 0;

        // Check results
        #10;
        $stop;
    end
endmodule
