// fn_mux
`timescale 1ns/10ps

module fn_mux(A, B, SEL, Y);
input A, B, SEL;
output Y;

assign Y = SEL?A^B:A&B;
endmodule

// ---------testbench of fn_mux---------

module fn_mux_tb;
reg aa,bb,sel;
wire yy;

fn_mux fn_mux(.A(aa), .B(bb), .SEL(sel), .Y(yy));

initial begin
		
				aa<=0;bb<=1;sel<=0;
		#10     aa<=1;bb<=0;sel<=1;
		#10     aa<=0;bb<=1;sel<=1;
		#10     aa<=1;bb<=1;sel<=0;
		#10     aa<=0;bb<=0;sel<=1;
		#10     $stop;
end

initial begin
			$dumpfile("wave.vcd"); // 指定用作dumpfile的文件
			$dumpvars; // dump all vars
end

endmodule