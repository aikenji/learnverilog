// nand_4bits
`timescale 1ns/10ps

module nand_4bits(A, B, Y);
input[3:0] A, B;
output[3:0] Y;

assign Y = ~(A&B);

endmodule

// -----------testbench of nand_4bits-------

module nand_4bits_tb;
reg[3:0] aa, bb;
wire[3:0] yy;

nand_4bits nand_4bits(.A(aa), .B(bb), .Y(yy));

initial begin
		
				aa<=4'b0000; bb<=4'b0011;
		#10     aa<=4'b0100; bb<=4'b0011;
		#10     aa<=4'b0010; bb<=4'b0111;
		#10     aa<=4'b1100; bb<=4'b1111;
		#10     aa<=4'b1000; bb<=4'b0011;
		#10     $stop;
end

initial begin
			$dumpfile("wave.vcd"); // 指定用作dumpfile的文件
			$dumpvars; // dump all vars
end
endmodule

