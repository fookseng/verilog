`timescale 1ns/10ps
/*
 * IC Contest Computational System (CS)
*/
module CS(Y, X, reset, clk);

input clk, reset; 
input [7:0] X;
output reg [9:0] Y;

reg [71:0] temp; // store the input value X. ---> [t-9, t-8, t-7, t-6, t-5, t-4, t-3, t-2, t(current input X)]
reg [10:0] average;
reg [8:0] appro;
reg [10:0] sum;

// Comb. circuit for equation 3.
always@(*)
	begin
	appro = 0;
	average = sum / 9;
	if(temp[7:0] <= average && temp[7:0] > appro)
		begin
		appro = temp[7:0];
		end
	if(temp[15:8] <= average && temp[15:8] > appro)
		begin
		appro = temp[15:8];
		end
	if(temp[23:16] <= average && temp[23:16] > appro)
		begin
		appro = temp[23:16];
		end
	if(temp[31:24] <= average && temp[31:24] > appro)
		begin
		appro = temp[31:24];
		end
	if(temp[39:32] <= average && temp[39:32] > appro)
		begin
		appro = temp[39:32];
		end
	if(temp[47:40] <= average && temp[47:40] > appro)
		begin
		appro = temp[47:40];
		end
	if(temp[55:48] <= average && temp[55:48] > appro)
		begin
		appro = temp[55:48];
		end
	if(temp[63:56] <= average && temp[63:56] > appro)
		begin
		appro = temp[63:56];
		end
	if(temp[71:64] <= average && temp[71:64] > appro)
		begin
		appro = temp[71:64];
		end

	Y = (sum + ({appro,3'b0} + appro)) >> 3;
	end

// Seq. circuit for reset signal.
always@(posedge clk)
	begin
	if (reset)
		begin
		temp <= 0;
		sum <= 0;
		end
	else
		begin
		temp <= temp << 8;
		temp[7:0] <= X;
		sum <= sum + X - temp[71:64];
		end
	end
	
endmodule

