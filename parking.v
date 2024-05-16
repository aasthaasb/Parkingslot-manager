`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2024 14:44:22
// Design Name: 
// Module Name: parking
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

module Binary_to_Decimal(input [4:0] binary, output [5:0]decimal,[5:0]decimal_tens,[5:0]decimal_ones);
        integer i;
        integer dec;
        always @* begin
            dec=0;
            for (i=0;i<5;i=i+1)begin
                dec = dec + binary[i]*(2**i);
            
            end     
        end
        assign decimal=dec;
        assign decimal_tens=decimal/10;
        assign decimal_ones= decimal%10;
            
endmodule

module decimal_to_binary(input [5:0] decimal, output [3:0] binary);
    integer i;
    integer temp_binary;
    reg[5:0] temp_decimal;
    always @* begin
        temp_decimal=decimal;
        for (i=0;i<4;i=i+1)begin
            temp_binary[i]= temp_decimal%2;
            temp_decimal=temp_decimal/2;
        end
    end
    assign binary=temp_binary;
endmodule


module Binary_to_SSD(
    input [3:0] binary,
    output reg [6:0] SSD // Directly drive the output from the always block
);
    always @* begin
        case (binary)
            4'b0000: SSD = 7'b1111110; // 0	
            4'b0001: SSD = 7'b0110000; // 1
            4'b0010: SSD = 7'b1101101; // 2
            4'b0011: SSD = 7'b1111001; // 3
            4'b0100: SSD = 7'b0110011; // 4
            4'b0101: SSD = 7'b1011011; // 5
            4'b0110: SSD = 7'b1011111; // 6
            4'b0111: SSD = 7'b1110000; // 7
            4'b1000: SSD = 7'b1111111; // 8
            4'b1001: SSD = 7'b1111011; // 9
            default: SSD = 7'b1111111; // Default or invalid input
        endcase
    end
endmodule


module SevenSegment(
    input [3:0] in,
    output reg [6:0] seg
);
    always @(*) begin
        case (in)
            4'h0: seg = ~7'b0000001; // "0"
            4'h1: seg = ~7'b1001111; // "1"
            4'h2: seg = ~7'b0010010; // "2"
            4'h3: seg = ~7'b0000110; // "3"
            4'h4: seg = ~7'b1001100; // "4"
            4'h5: seg = ~7'b0100100; // "5"
            4'h6: seg = ~7'b0100000; // "6"
            4'h7: seg = ~7'b0001111; // "7"
            4'h8: seg = ~7'b0000000; // "8"
            4'h9: seg = ~7'b0000100; // "9"
            default: seg = ~7'b1111111; // Blank display for undefined values
        endcase
    end
endmodule


module ParkingSystem(
    input clk,           // System clock
    input reset,         // Reset signal
    input set_slots,     // Signal to enable setting total parking slots
    input [3:0] num_slots, // Number of total parking slots
    input start,         // Start signal for car counting
    input inc_car,       // Signal for a car entering
    input dec_car,       // Signal for a car exiting
    output [6:0] seg1, // First 7-segment display
    output [6:0] seg2,  // Second 7-segment display
    output [3:0] free_slots,
    output slow_clk
);

// Slow clock generation
reg [27:0] count = 0;
reg slow_clk = 0;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 0;
        slow_clk <= 0;
    end else begin
        count <= count + 1;
        if (count[27]) begin
            slow_clk <= ~slow_clk;
        end
    end
end

// Internal state registers
reg [3:0] total_slots = 0; // Total number of slots
reg [3:0] num_cars = 0;    // Cars currently parked
//wire [3:0] free_slots;     // Computed free slots

// Set total slots when enabled
always @(posedge clk) begin     //slow_clock
    if (set_slots) begin
        total_slots <= num_slots;
    end
end

// Car counting logic
always @(posedge clk) begin         //slow_clock
    if (start) begin
        if (inc_car && (num_cars < total_slots))
            num_cars <= num_cars + 1;
        else if (dec_car && (num_cars > 0))
            num_cars <= num_cars - 1;
    end
end

assign free_slots = total_slots - num_cars;
wire [5:0] decimal,decimal_tens,decimal_ones;
wire [6:0] ssd_tens,ssd_ones;
wire [3:0] binary_tens,binary_ones;
Binary_to_Decimal BD1(free_slots,decimal,decimal_tens,decimal_ones);
decimal_to_binary DB1(decimal_tens,binary_tens);
decimal_to_binary DB2(decimal_ones,binary_ones);


Binary_to_SSD DB12(binary_tens,seg1);
Binary_to_SSD DB3(binary_ones,seg2);


// Seven-segment display decoding for two digits
//wire [3:0] tens = free_slots / 10;
//wire [3:0] ones = free_slots % 10;

//Binary_to_SSD ss1(tens, seg1);
//Binary_to_SSD ss2(ones, seg2);

endmodule




module temp_ParkingSystem(
    
    input clk,           // System clock
    input reset,         // Reset signal
    input set_slots,     // Signal to enable setting total parking slots
    input [3:0] num_slots, // Number of total parking slots
    input start,         // Start signal for car counting
    input inc_car,       // Signal for a car entering
    input dec_car,       // Signal for a car exiting
    output [6:0] seg1, // First 7-segment display
    output [6:0] seg2,  // Second 7-segment display
    output slow_clk,
    output [3:0]total_number_of_slots
);
    wire [3:0]free_slots;
//    assign total_number_of_slots=num_slots;
    ParkingSystem dut(clk,reset, set_slots, num_slots,start,inc_car,dec_car,seg1,seg2,free_slots,slow_clk);
    assign total_number_of_slots=num_slots;

endmodule
