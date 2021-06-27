// -----------------------------------------------------------------------------
// Copyright (c) 2014-2021 All rights reserved
// -----------------------------------------------------------------------------
// Author : aikenji
// File   : 7seg_dec.v
// Create : 2021-06-27 16:22:39
// Revise : 2021-06-27 16:22:39
// Editor : sublime text4, tab size (4)
// -----------------------------------------------------------------------------
`timescale 1ns/10ps

module 7seg_dec(
	input[3:0]		num,
	output[6:0]		a_g
	);

reg[6:0]		a_g; //a_g[6:0]->{a,b,c,d,e,f,g}
always @(num) begin
	case(num)
	4'd0:a_g<=7'b111_1110;
	4'd1:a_g<=7'b111_1110;
	4'd2:a_g<=7'b111_1110;
	4'd3:a_g<=7'b111_1110;
	4'd4:a_g<=7'b111_1110;
	4'd5:a_g<=7'b111_1110;
	4'd6:a_g<=7'b111_1110;
	4'd7:a_g<=7'b111_1110;
	4'd8:a_g<=7'b111_1110;
	4'd9:a_g<=7'b111_1110;
	default:a_g<=7'b000_0001; //middle horizontal line
	endcase
end
endmodule

// ------------testbench-------
module 7seg_dec_tb;
reg[3:0] 		num;
wire[6:0]		a_g;
7seg_dec inst_7seg_dec (.num(num), .a_g(a_g));

initial begin
	num <= 0;
	#300 $stop;
end

always #10 num <= num+1;

initial begin
			$dumpfile("wave.vcd"); // 指定用作dumpfile的文件
			$dumpvars; // dump all vars
end

endmodule
