// inverter
`timescale 1ns/10ps
module inv(A, Y);
input A;
output Y;

assign Y = ~A;

endmodule

// ---------testbench of inv------
module inv_tb;
reg aa;
wire yy;

inv inv(.A(aa), .Y(yy));
initial begin
		
				aa<=0;
		#10     aa<=1;
		#10     aa<=0;
		#10     aa<=1;
		#10     aa<=0;
		#10     $stop;
end

initial begin
			$dumpfile("wave.vcd"); // 指定用作dumpfile的文件
			$dumpvars; // dump all vars
end
endmodule