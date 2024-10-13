module Keyboard_Interface (
  input wire clk,
  input wire rst,
  input wire [7:0] usb_data,  // From USB Host Controller
  output wire scl,            // I2C Clock Line
  inout wire sda              // I2C Data Line
);

  wire [7:0] key_data;

  // Instantiate USB Interface
  USB_Interface usb_inst (
      .clk(clk),
      .rst(rst),
      .usb_data(usb_data),
      .key_data(key_data)
  );

  // Instantiate I2C Master
  I2C_Master i2c_inst (
      .clk(clk),
      .rst(rst),
      .data_in(key_data),  // Send decoded key data over I2C
      .scl(scl),
      .sda(sda)
  );

endmodule
