module I2C_Master (
  input wire clk,             // System clock
  input wire rst,             // Reset
  input wire [7:0] data_in,   // Data to be sent (key_data)
  output reg scl,             // I2C Clock
  inout wire sda              // I2C Data
);

  reg [3:0] state;
  reg [7:0] shift_reg;
  reg [3:0] bit_count;
  reg sda_out;

  assign sda = (sda_out) ? 1'bz : 1'b0;

  localparam IDLE = 4'd0,
             START = 4'd1,
             SEND_DATA = 4'd2,
             STOP = 4'd3;

  always @(posedge clk or posedge rst) begin
      if (rst) begin
          state <= IDLE;
          scl <= 1'b1;
          sda_out <= 1'b1;
          shift_reg <= 8'd0;
          bit_count <= 4'd0;
      end
      else begin
          case (state)
              IDLE: begin
                  sda_out <= 1'b1;
                  if (data_in != 8'd0) begin
                      shift_reg <= data_in;
                      bit_count <= 4'd8;
                      state <= START;
                  end
              end
              START: begin
                  sda_out <= 1'b0;  // Start condition
                  state <= SEND_DATA;
              end
              SEND_DATA: begin
                  if (bit_count > 0) begin
                      scl <= 1'b0;
                      sda_out <= shift_reg[7]; // Send MSB first
                      shift_reg <= {shift_reg[6:0], 1'b0};
                      bit_count <= bit_count - 1;
                      scl <= 1'b1;
                  end
                  else begin
                      state <= STOP;
                  end
              end
              STOP: begin
                  scl <= 1'b0;
                  sda_out <= 1'b0;  // Stop condition
                  scl <= 1'b1;
                  sda_out <= 1'b1;
                  state <= IDLE;
              end
          endcase
      end
  end
endmodule
