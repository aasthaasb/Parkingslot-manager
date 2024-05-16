# Parking Slot Management System

## Introduction
This Verilog project simulates a parking slot management system. While in real-life scenarios, sensors would detect entry and exit of vehicles, this mini demo project employs buttons to simulate entry and exit events. Upon entry, the number of free parking slots decreases, and upon exit, it increases.

## Features
- Simulates parking slot management.
- Allows for entry and exit of vehicles using buttons.
- Displays the number of free parking slots.

## Components
The project consists of the following components:
1. **Entry Button:** Simulates the entry of a vehicle into the parking lot. Pressing this button decrements the number of free slots.
2. **Exit Button:** Simulates the exit of a vehicle from the parking lot. Pressing this button increments the number of free slots.
3. **Free Slots Counter:** Keeps track of the number of available parking slots on a SSD.

## Usage
1. **Simulation Environment:**
    - Ensure that you have a Verilog simulation environment set up (e.g., Vivado).
    - Compile the Verilog files using the appropriate commands.

2. **Running the Simulation:**
    - Start the simulation in your Verilog simulation environment.
    - Simulate the entry and exit of vehicles by pressing the Entry and Exit buttons accordingly.
    - Observe the changes in the number of free parking slots.

## Example
Here's a basic example of how to use the system:
1. Start the simulation.
2. Initially, set the free parking slots.
3. Press the Entry button to simulate a vehicle entering the parking lot.
4. The number of free slots decreases by 1.
5. Press the Exit button to simulate a vehicle exiting the parking lot.
6. The number of free slots increases by 1.
7. Repeat steps 3-6 to simulate more vehicles entering

