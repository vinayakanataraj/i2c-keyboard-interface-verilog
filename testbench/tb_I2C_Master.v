module tb_I2C_Master();

    // Testbench signals
    reg clk;
    reg rst;
    reg [7:0] data_in;
    wire scl;
    wire sda;

    // Bidirectional SDA signal
    reg sda_drv;
    assign sda = sda_drv ? 1'bz : 1'b0;

    // Instantiate the I2C Master module
    I2C_Master uut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
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
        data_in = 8'b0;
        sda_drv = 1;
        #10 rst = 0;

        // Send data over I2C
        #20 data_in = 8'hA5;  // Simulate sending data (e.g., key press 'A')
        #100 data_in = 8'h5A; // Simulate sending data (e.g., key press 'B')

        // End simulation
        #200 $stop;
    end
endmodule
