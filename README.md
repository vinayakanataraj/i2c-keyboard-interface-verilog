# FPGA Keyboard Interface using USB and I2C Protocols

## Project Overview

This project demonstrates interfacing a USB keyboard with an FPGA and transmitting the keypress data to peripherals via the I2C protocol. The system consists of multiple modules written in Verilog, which handle the USB data decoding and the I2C communication to display the keypresses on a connected I2C device (e.g., an LCD).

The project is structured into different modules for handling USB and I2C communication, along with individual test benches for verifying the functionality of each module.

## Directory Structure

The project is organized as follows:

project_directory/
│
├── src/                        # Source code for Verilog modules
│   ├── USB_Interface.v          # USB Interface module (USB to keypress decoder)
│   ├── I2C_Master.v             # I2C Master module (handles I2C communication)
│   └── Keyboard_Interface.v     # Top-level module integrating USB and I2C modules
│
├── testbench/                   # Testbench files for module verification
│   ├── tb_USB_Interface.v       # Testbench for USB_Interface module
│   ├── tb_I2C_Master.v          # Testbench for I2C_Master module
│   └── tb_Keyboard_Interface.v  # Testbench for top-level Keyboard_Interface module
│
└── sim/                         # Simulation output directory
    └── waveforms/               # Directory to store waveform files from simulations

## Modules

1. **USB_Interface.v**: 
   - This module receives data from a USB keyboard and decodes the keypresses using the USB HID protocol.
   
2. **I2C_Master.v**: 
   - This module handles the I2C communication. It sends the decoded keypress data over the I2C bus to a connected I2C device (e.g., LCD).

3. **Keyboard_Interface.v**: 
   - The top-level module that integrates the `USB_Interface` and `I2C_Master` modules. It receives data from the USB keyboard, decodes it, and sends it via I2C to the peripheral.

## Test Benches

1. **tb_USB_Interface.v**: 
   - Simulates the operation of the `USB_Interface` module by providing sample USB keypress data and observing the decoded output.

2. **tb_I2C_Master.v**: 
   - Tests the functionality of the `I2C_Master` module by sending sample data and verifying the I2C transmission.

3. **tb_Keyboard_Interface.v**: 
   - Simulates the entire system, from receiving USB keypress data to transmitting it via I2C.

## Setup and Usage

### Prerequisites

- An FPGA design tool such as Xilinx Vivado, ModelSim, or any other Verilog simulator.
- Basic knowledge of Verilog and FPGA simulation.
