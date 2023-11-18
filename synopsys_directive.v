`timescale 1ns/10ps
module synopsys_directive 
( 
input				clk,
input				reset, 
input		[1:0]	sel, 
input   	[7:0]	data, 
output reg 			finish
);

always@(posedge clk, negedge reset) begin
	if(!reset) begin
		finish <= 1'b0;
	end
	else begin
		case(sel) // synopsys parallel_case
			2'b00: begin
				finish <= &data;
			end
			2'b01: begin
				finish <= |data;
			end
			2'b10: begin
				finish <= ~&data;
			end
			default: begin
				finish <= ~|data;
			end
		endcase
	end
end
endmodule

