`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2024 14:56:49
// Design Name: 
// Module Name: test
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
`timescale 1ns/1ns

module ParkingSystem_tb;

    // Inputs
    reg clk;
    reg reset;
    reg set_slots;
    reg [3:0] num_slots;
    reg start;
    reg inc_car;
    reg dec_car;
    
    // Outputs
    wire [6:0] seg1;
    wire [6:0] seg2;
    wire slow_clk;
    wire [3:0] total_number_of_slots;
    
    // Instantiate the DUT
    ParkingSystem dut(
        .clk(clk),
        .reset(reset),
        .set_slots(set_slots),
        .num_slots(num_slots),
        .start(start),
        .inc_car(inc_car),
        .dec_car(dec_car),
        .seg1(seg1),
        .seg2(seg2),
        .free_slots(free_slots),
        .slow_clk(slow_clk)
        //.total_number_of_slots(total_number_of_slots)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Initial values
    initial begin
        clk = 0;
        reset = 1;
        set_slots = 0;
        num_slots = 0;
        start = 0;
        inc_car = 0;
        dec_car = 0;
        #10 reset = 0;
        #10 set_slots = 1;
        #10 num_slots = 10; // Set total parking slots to 10
        #10 set_slots = 0;
        #10 start = 1; // Start car counting
        #100 inc_car = 1; // Simulate a car entering
        #100 dec_car = 1; // Simulate a car exiting
        #100 start = 0; // Stop car counting
        #100 $finish; // End simulation
    end
    
endmodule
