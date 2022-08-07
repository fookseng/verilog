module SET 
(
input 				clk,
input 				rst,
input 				en,
input 		[23:0]	central,
input 		[11:0] 	radius,
input 		[1:0]	mode,
output reg 			busy,
output reg 			valid,
output reg 	[7:0]	candidate
);

reg  [3:0] x, y;
reg  [3:0] minuend, subtrahend, difference;
reg  [6:0] product_A, product_B;
reg 	   inA, inB, inC;
wire [6:0] product;

reg	 [3:0] cur_state, nxt_state;
localparam input_state=0, circle_A0=1, circle_A1=2, circle_A2=3, circle_B0=4, circle_B1=5, circle_B2=6,circle_C0=7, circle_C1=8,
		   circle_C2=9, is_in_circleA=10, is_in_circleB=11, is_in_circleC=12, output_state=13, calculate_candidate=14;

//------------ FSM --------------------
//-------------------------------------
always@(posedge clk, posedge rst)
begin
	if(rst)
		begin
			cur_state <= input_state;
		end
	else 
		begin
			cur_state <= nxt_state;
		end
end

always@(*)
begin
	case(cur_state)
		input_state:
			begin
				if(en)
					begin
						nxt_state = circle_A0;
					end 
				else 
					begin
						nxt_state = input_state;
					end
			end
		circle_A0:
			begin
				nxt_state = circle_A1;
			end
		circle_A1:
			begin
				nxt_state = circle_A2;
			end
		circle_A2:
			begin
				nxt_state = is_in_circleA;
			end
		is_in_circleA:
			begin
				nxt_state = circle_B0;
			end
		circle_B0:
			begin
				nxt_state = circle_B1;
			end
		circle_B1:
			begin
				nxt_state = circle_B2;
			end
		circle_B2:
			begin
				nxt_state = is_in_circleB;
			end
		is_in_circleB:
			begin
				nxt_state = circle_C0;
			end
		circle_C0:
			begin
				nxt_state = circle_C1;
			end
		circle_C1:
			begin
				nxt_state = circle_C2;
			end
		circle_C2:
			begin
				nxt_state = is_in_circleC;
			end
		is_in_circleC:
			begin
				nxt_state = calculate_candidate;
			end
		calculate_candidate:
			begin
				nxt_state = output_state;
			end
		output_state:
			begin
				if(x==8 && y==8)
					begin
						nxt_state = input_state;
					end
				else 
					begin
						nxt_state = circle_A0;
					end
			end
		default:
			begin
				nxt_state = input_state;
			end
	endcase
end

//-----------Datapath-------------------
//--------------------------------------
assign product = difference * difference;

always@(*)
begin
	if(minuend > subtrahend)
		begin
			difference = minuend - subtrahend;
		end 
	else 
		begin
			difference = subtrahend - minuend;
		end
end

always@(posedge clk, posedge rst)
begin
	if(rst)
		begin
			busy <= 0;
			valid <= 0;
			candidate <= 0;
			x <= 1;
			y <= 1;
			inA <= 0;
			inB <= 0;
			inC <= 0;
		end
	else 
		begin
			case(cur_state)
				input_state:
					begin
						valid <= 0;
						x <= 1;
						y <= 1;
						candidate <= 0;
					end
				circle_A0:
					begin
						busy <= 1;
						minuend <= radius[11:8]; // calculate r^2
						subtrahend <= 0;
					end
				circle_A1:
					begin
						product_A <= product; // store r^2 in product_A
						minuend <= x; // calculate (x-h)^2
						subtrahend <= central[23:20];
					end
				circle_A2:
					begin
						product_B <= product; // store (x-h)^2 in product_B
						minuend <= y; // calculate (y-k)^2
						subtrahend <= central[19:16];
					end
				is_in_circleA:
					begin
						if(product + product_B <= {1'b0,product_A})
							begin
								inA <= 1;
							end
						else 
							begin
								inA <= 0;
							end
					end
				circle_B0:
					begin
						minuend <= radius[7:4]; // calculate r^2
						subtrahend <= 0;
					end
				circle_B1:
					begin
						product_A <= product; // store r^2 in product_A
						minuend <= x; // calculate (x-h)^2
						subtrahend <= central[15:12];
					end
				circle_B2:
					begin
						product_B <= product; // store (x-h)^2 in product_B
						minuend <= y; // calculate (y-k)^2
						subtrahend <= central[11:8];
					end
				is_in_circleB:
					begin
						if(product + product_B <= {1'b0,product_A})
							begin
								inB <= 1;
							end
						else 
							begin
								inB <= 0;
							end
					end
				circle_C0:
					begin
						minuend <= radius[3:0]; // calculate r^2
						subtrahend <= 0;
					end
				circle_C1:
					begin
						product_A <= product; // store r^2 in product_A
						minuend <= x; // calculate (x-h)^2
						subtrahend <= central[7:4];
					end
				circle_C2:
					begin
						product_B <= product; // store (x-h)^2 in product_B
						minuend <= y; // calculate (y-k)^2
						subtrahend <= central[3:0];
					end
				is_in_circleC:
					begin
						if(product + product_B <= {1'b0,product_A})
							begin
								inC <= 1;
							end
						else 
							begin
								inC <= 0;
							end
					end
				calculate_candidate:
					begin
						case(mode)
							2'd1:
								begin
								if(inA && inB)
									begin
										candidate <= candidate+1;
									end
								end
							2'd2:
								begin
								if(inA ^ inB)
									begin
										candidate <= candidate+1;
									end
								end
							2'd3:
								begin
								//if ((!((md1&&md2)&&md3)) && (((md1~^md2)~^md3))) // NOT working, why?
								if (((inA && inB) ^ (inA&&inB&&inC)) || ((inB && inC) ^ (inA&&inB&&inC)) || ((inA && inC) ^ (inA&&inB&&inC)))
									begin
										candidate <= candidate+1;
									end
								end
							default:
								begin
								if(inA)
									begin
										candidate <= candidate+1;
									end
								end
						endcase
					end
				output_state:
					begin
						if(x==8 && y==8)
							begin
								valid <= 1;
								busy <= 0;
							end
						else if(y==8)
							begin
								x <= x+1;
								y <= 1;
							end
						else 
							begin
								y <= y+1;								
							end
					end
			endcase
		end
end
endmodule