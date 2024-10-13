module USB_Interface (
  input wire clk,
  input wire rst,
  input wire [7:0] usb_data,  // Data coming from USB Host Controller
  output reg [7:0] key_data   // Decoded key data
);

  always @(posedge clk or posedge rst) begin
      if (rst) begin
          key_data <= 8'd0;
      end
      else begin
          // USB HID protocol sends keypress data
          // Assume usb_data contains valid keypress data in 8-bit format
          key_data <= usb_data;
      end
  end
endmodule
