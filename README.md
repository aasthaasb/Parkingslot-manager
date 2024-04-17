# Parkingslot-manager 🚗🅿️

## Car Park Occupied Slot Counting System
Welcome to the Car Park Occupied Slot Counting System GitHub repository! In this project, we'll learn how to implement a parking slot system using the PYNQ Z2 board, seven-segment display, wires, and a breadboard.

### Overview:
Imagine a car park with 15 slots, and we want to know how many of these slots are occupied at any given time. To achieve this, we'll use sensors placed over each slot. These sensors will output a logic level of 1 when the slot is occupied and 0 when it's empty. We'll use switches on the PYNQ Z2 board to simulate these sensors.

The system will then count the number of occupied slots and display the count using LEDs and a seven-segment display.

### Components Needed
PYNQ Z2 board
Breadboard
Wires
Seven-segment display
LEDs
Switches

### Implementation Steps
Connect the Components: Set up the PYNQ Z2 board, breadboard, LEDs, switches, and seven-segment display according to the circuit diagram provided in the project files.

Write Verilog Code: Implement the logic in Verilog to read the input from switches, count the number of occupied slots, and display the count on the seven-segment display.

Synthesize and Implement: Use Vivado  to synthesize the Verilog code and implement it on the PYNQ Z2 board.

Test the System: Test the system by toggling the switches to simulate occupied and empty slots. Verify that the count displayed on the seven-segment display matches the actual number of occupied slots.

### Project Structure
verilog_code: Contains the Verilog code for the parking slot system.
images: Includes images of the circuit diagram and setup.
docs: Additional documentation and resources.

### Getting Started
To get started with this project, follow these steps:
Clone this repository to your local machine.
Set up the hardware components as per the circuit diagram provided.
Load the Verilog code onto the PYNQ Z2 board.
Test the system by toggling the switches and observing the count on the seven-segment display.
