# FPGA Keyboard Interface using USB and I2C Protocols

## Project Overview

This project demonstrates interfacing a USB keyboard with an FPGA and transmitting the keypress data to peripherals via the I2C protocol. The system consists of multiple modules written in Verilog, which handle the USB data decoding and the I2C communication to display the keypresses on a connected I2C device (e.g., an LCD).

The project is structured into different modules for handling USB and I2C communication, along with individual test benches for verifying the functionality of each module.

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
