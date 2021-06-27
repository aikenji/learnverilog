// You can make a your own header file and set its path to settings.
// (Preferences > Package Settings > Verilog Gadget > Settings - User)
//
//		"header": "Packages/Verilog Gadget/template/verilog_header.v"
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2021 All rights reserved
// -----------------------------------------------------------------------------
// Author : aikenji
// File   : comp_conv.v
// Create : 2021-06-27 11:25:41
// Revise : 2021-06-27 11:25:41
// Editor : sublime text4, tab size (4)
// -----------------------------------------------------------------------------
// comp_conv

`timescale 1ns/10ps

module comp_conv (
	a,    // 8bit input
	a_comp // 8bit output
																							
);
input[7:0]		a; 
output[7:0] 	a_comp;

wire[7:0]		y;

assign y = {a[7],~a[6:0]+1'b1};
assign a_comp = a[7]?y:a;

endmodule

// ------------testbench---------
module tb_comp_conv;
reg[7:0] 		a_in;
wire[7:0]		y_out;

comp_conv comp_conv (
	.a(a_in),    // 8bit input
	.a_comp(y_out) // 8bit output
																							
);

initial begin
	a_in <= 0;
	#3000 $stop;
end

always #10 a_in <= a_in + 1;

initial begin
			$dumpfile("wave.vcd"); // 指定用作dumpfile的文件
			$dumpvars; // dump all vars
end

endmodule

