// function_multiplexer_4_to_1
`timescale 1ns/10ps

module fn_mux_4(A, B, SEL, Y);
	input A, B;
	input[1:0] SEL;
	output Y;

	reg Y; // Y should be used as reg when appeared in always
	always @(A or B or SEL) begin
		case(SEL)
		2'b00: Y<=A&B;
		2'b01: Y<=A|B;
		2'b10: Y<=A^B;
		2'b11: Y<=~(A^B);
		endcase
	end
endmodule

// -----------testbench-------

module fn_mux_4_tb;
	reg[3:0] absel;
	wire yy;
	fn_mux_4 fn_mux_4(.A(absel[0]), .B(absel[1]), .SEL(absel[3:2]), .Y(yy));

	initial begin
		absel<=0;
		#200 $stop;
	end

	always #10 absel<=absel+1;

	initial begin
		$dumpfile("wave.vcd"); // 指定用作dumpfile的文件
		$dumpvars; // dump all vars
	end
endmodule