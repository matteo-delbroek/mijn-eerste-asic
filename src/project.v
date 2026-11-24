`default_nettype none

module tt_um_blinky (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered
    input  wire       clk,      // clock (10 MHz)
    input  wire       rst_n     // reset_n - low to reset
);

  reg [23:0] counter;
  reg led_state;

  always @(posedge clk) begin
    if (!rst_n) begin
      counter   <= 24'd0;
      led_state <= 1'b0;
    end else begin
      if (counter == 24'd4_999_999) begin
        counter   <= 24'd0;
        led_state <= ~led_state;
      end else begin
        counter   <= counter + 24'd1;
      end
    end
  end

  assign uo_out  = {7'b0000000, led_state};
  assign uio_out = 8'b00000000;
  assign uio_oe  = 8'b00000000;

  wire _unused = &{ena, ui_in, uio_in, 1'b0};

endmodule