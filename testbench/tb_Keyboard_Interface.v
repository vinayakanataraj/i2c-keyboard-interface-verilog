module tb_Keyboard_Interface();

    // Testbench signals
    reg clk;
    reg rst;
    reg [7:0] usb_data;
    wire scl;
    wire sda;

    // Instantiate the top-level Keyboard Interface module
    Keyboard_Interface uut (
        .clk(clk),
        .rst(rst),
        .usb_data(usb_data),
        .scl(scl),
        .sda(sda)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Stimulus
    initial begin
        // Reset the system
        rst = 1;
        usb_data = 8'b0;
        #10 rst = 0;

        // Simulate USB keypress data
        #20 usb_data = 8'h1C;  // Key press (e.g., 'A' key in USB HID)
        #100 usb_data = 8'h1D;  // Key press (e.g., 'S' key)
        #100 usb_data = 8'h00;  // No key pressed

        // End simulation
        #300 $stop;
    end
endmodule
