/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

   reg [31:0] rf[31:0];
   reg [4:0]  rs1, rs2, rd;
   reg [7:0]  out_r;
   assign uo_out  = out_r;

   // We need logic complicated enough that rf isn't optimized away
   always @(posedge clk) begin
      //$display("%d %d %d   rf: %d %d %d", rs1, rs2, rd, rf[rs1], rf[rs2], rf[rd]);
      if (rst_n == 1)
	case (ui_in[2:0])
	  0: rs1 <= ui_in[7:3];
	  1: rs2 <= ui_in[7:3];
	  2: rd  <= ui_in[7:3];
	  3: rf[rd] <= rf[rs1] << rf[rs2];
	  4: rf[rd] <= ui_in[7:3];
	  5: rf[rd] <= rf[rs1] + rf[rs2];
	  6: rf[rd] <= rf[rs1] & rf[rs2];
	  7: out_r <= rf[rs1] >> 24;
	endcase
   end
endmodule
