`timescale 1ns/10ps
module synopsys_directive 
( 
input				clk,
input				reset, 
input		[3:0]	sel, 
input   	[7:0]	data, 
output  			finish
);

reg 		[1:0]  	temp;

assign finish = &temp;

always@(posedge clk, negedge reset) begin
	if(!reset) begin
		temp <= 2'b0;
	end
	else begin
		case(sel) // synopsys parallel_case // synopsys full_case
			4'b0001: begin
				temp <= data[1:0];
			end
			4'b0010: begin
				temp <= data[3:2];
			end
			4'b0100: begin
				temp <= data[5:4];
			end
			4'b1000: begin
				temp <= data[7:6];
			end
		endcase

		/*
		temp <= {2{sel[0]}} & data[1:0] |
				{2{sel[1]}} & data[3:2] |
				{2{sel[2]}} & data[5:4] |
				{2{sel[3]}} & data[7:6] ;
		*/
	end
end

endmodule

