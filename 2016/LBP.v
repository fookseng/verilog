`timescale 1ns/10ps
module LBP 
( 
input				clk,
input				reset, 
input				gray_ready, 
input   	[7:0]	gray_data, 
output reg 	[13:0] 	gray_addr, 
output reg			gray_req, 
output reg 	[13:0] 	lbp_addr,
output reg 			lbp_valid,
output reg 	[7:0] 	lbp_data,
output reg 			finish
);

reg	 [3:0] 	cur_state, nxt_state;
reg  [7:0]	gc;
localparam reset_state=0, request_gp0_data=2, request_gp1_data=3, request_gp2_data=4, request_gp3_data=5, 
		   request_gp4_data=6, request_gp5_data=7, request_gp6_data=8, request_gp7_data=9, request_gp8_data=10;

//-------------------- FSM ------------------
//-------------------------------------------
always@(posedge clk, posedge reset)
begin
	if(reset)
		begin
			cur_state <= reset_state;
		end
	else 
		begin
			cur_state <= nxt_state;
		end
end

always@(*)
begin
	case(cur_state)
		reset_state:
			begin
				if(gray_ready)
					begin
						nxt_state = request_gp0_data;
					end
				else 
					begin
						nxt_state = reset_state;
					end
			end
		request_gp0_data:
			begin
				nxt_state = request_gp1_data;
			end
		request_gp1_data:
			begin
				nxt_state = request_gp2_data;
			end
		request_gp2_data:
			begin
				nxt_state = request_gp3_data;
			end
		request_gp3_data:
			begin
				nxt_state = request_gp4_data;
			end
		request_gp4_data:
			begin
				nxt_state = request_gp5_data;
			end
		request_gp5_data:
			begin
				nxt_state = request_gp6_data;
			end
		request_gp6_data:
			begin
				nxt_state = request_gp7_data;
			end
		request_gp7_data:
			begin
				nxt_state = request_gp8_data;
			end
		request_gp8_data:
			begin
				nxt_state = request_gp0_data;
			end
		default:
			begin
				nxt_state = reset_state;
			end
	endcase
end

//------------------ Datapath ---------------
//-------------------------------------------
always@(posedge clk, posedge reset)
begin
	if(reset)
		begin
			lbp_addr <= 128;
			gray_addr <= 129;
			lbp_valid <= 0;
			gray_req <= 1;
			finish <= 0;
			lbp_data <= 0;
		end
	else 
		begin
		case(cur_state)
			request_gp0_data:
				begin
					gc <=  gray_data;
					gray_addr <= gray_addr - 129;
					lbp_valid <= 0;
					lbp_data <= 0;
					if(lbp_addr[6:0] == 7'b111_1110) 
						begin
							lbp_addr <= lbp_addr + 3;
						end
					else 
						begin
							lbp_addr <= lbp_addr + 1;
						end
				end
			request_gp1_data:
				begin
					gray_addr <= gray_addr + 1;
					if(gray_data >= gc)
						begin
							lbp_data <= lbp_data + 1;
						end
				end
			request_gp2_data:
				begin
					gray_addr <= gray_addr + 1;
					if(gray_data >= gc)
						begin
							lbp_data <= lbp_data + 2;
						end
				end
			request_gp3_data:
				begin
					gray_addr <= gray_addr + 126;
					if(gray_data >= gc)
						begin
							lbp_data <= lbp_data + 4;
						end
				end
			request_gp4_data:
				begin
					gray_addr <= gray_addr + 2;
					if(gray_data >= gc)
						begin
							lbp_data <= lbp_data + 8;
						end
				end
			request_gp5_data:
				begin
					gray_addr <= gray_addr + 126;
					if(gray_data >= gc)
						begin
							lbp_data <= lbp_data + 16;
						end
				end
			request_gp6_data:
				begin
					gray_addr <= gray_addr + 1;
					if(gray_data >= gc)
						begin
							lbp_data <= lbp_data + 32;
						end
				end
			request_gp7_data:
				begin
					gray_addr <= gray_addr + 1;
					if(gray_data >= gc)
						begin
							lbp_data <= lbp_data + 64;
						end
				end
			request_gp8_data:
				begin
					if(lbp_addr[6:0] == 7'b111_1110) 
						begin
							gray_addr <= gray_addr - 126; 
						end
					else 
						begin
							gray_addr <= gray_addr - 128;
						end
					if(gray_data >= gc)
						begin
							lbp_data <= lbp_data + 128;
						end
					lbp_valid <= 1;
					if(lbp_addr == 16254)
						begin
							finish <= 1;
						end
				end
		endcase
	end
end
endmodule
