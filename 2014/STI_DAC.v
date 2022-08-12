module STI_DAC
(
input				clk, reset,
input				load, pi_msb, pi_low, pi_end,
input		[15:0]	pi_data,
input		[1:0]	pi_length,
input				pi_fill,
output	reg		    so_data, so_valid,
output  reg 	    oem_finish, odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr,
output 	reg [4:0]   oem_addr,
output 		[7:0]   oem_dataout
);

reg	[5:0]	counter;
reg			m1_full, m2_full, m3_full;
reg			Even;
reg	[2:0]	memory_flag;
reg	[7:0]	temp;
integer i;
reg [2:0]	cur_state, nxt_state;
localparam input_state=0, sti=1, sti_8=2, sti_16=3, sti_24=4, sti_32=5, zero_state=6;

//---------------------FSM--------------------------
//--------------------------------------------------
always@(posedge clk, posedge reset)
begin
	if(reset)
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
				if(load)
					begin
						nxt_state = sti;						
					end
				else if(pi_end)
					begin
						nxt_state = zero_state;
					end
				else
					begin
						nxt_state = input_state;
					end
			end
		sti:
			begin
				case(pi_length)
					2'b00:
						begin
							nxt_state = sti_8;
						end
					2'b01:
						begin
							nxt_state = sti_16;
						end
					2'b10:
						begin
							nxt_state = sti_24;
						end
					2'b11:
						begin
							nxt_state = sti_32;
						end
				endcase
			end
		zero_state:
			begin
				nxt_state = zero_state;
			end
		sti_8:
			begin
				if((~pi_msb && ~pi_low && counter == 6'd8) || 
				   (~pi_msb && pi_low && counter == 6'd16) || 
				   (pi_msb && ~pi_low && counter == 6'b111111) ||
				   (pi_msb && pi_low && counter == 6'd7))
					begin
						nxt_state = input_state;
					end 
				else 
					begin
						nxt_state = sti_8;
					end
			end
		sti_16:
			begin
				if((~pi_msb && counter == 16) || (pi_msb && counter == 6'b111111))
					begin
						nxt_state = input_state;
					end 
				else 
					begin
						nxt_state = sti_16;
					end
			end
		sti_24:
			begin
				if((~pi_msb && counter == 24) || (pi_msb && counter == 6'b111111))
					begin
						nxt_state = input_state;
					end 
				else 
					begin
						nxt_state = sti_24;
					end
			end
		sti_32:
			begin
				if((~pi_msb && counter == 32) || (pi_msb && counter == 6'b111111))
					begin
						nxt_state = input_state;
					end 
				else 
					begin
						nxt_state = sti_32;
					end
			end
		default:
			begin
				nxt_state = input_state;
			end
	endcase
end

//---------------------Datapath-------------------
//------------------------------------------------
always@(posedge clk or posedge reset) // counter
begin
	if(reset)
		begin
			counter <= 6'd0;
		end
	else 
		begin
			case(cur_state)
				input_state:
					begin
						if(nxt_state == 6)
							begin
								counter <= 0;
							end
					end
				sti:  // 1
					begin
						casez({pi_length, pi_msb, pi_low}) // 2 + 1 + 1 +1bits
							4'b00_0_0:
								begin
									counter <= 6'd0; 
								end
							4'b00_0_1:
								begin
									counter <= 6'd8; 
								end
							4'b00_1_0:
								begin
									counter <= 6'd7; 
								end
							4'b00_1_1:
								begin
									counter <= 6'd15; 
								end
							4'b01_0_?:
								begin
									counter <= 6'd0; 
								end
							4'b01_1_?:
								begin
									counter <= 6'd15; 
								end
							4'b11_0_?:
								begin
									counter <= 6'd0; 
								end
							4'b11_1_?:
								begin
									counter <= 6'd31; 
								end
							4'b10_0_?:
								begin
									counter <= 6'd0; 
								end
							4'b10_1_?:
								begin
									counter <= 6'd23;
								end
						endcase
					end
				sti_8, sti_16, sti_24, sti_32: 
					begin
						if(pi_msb)
							begin
								counter <= counter - 6'd1;
							end
						else 
							begin
								counter <= counter + 6'd1;
							end
					end
				zero_state:
					begin
						if(counter == 8)
							begin
								counter <= 1;
							end
						else 
							begin
								counter <= counter + 1;
							end
					end
			endcase
		end
end

always@(posedge clk, posedge reset) // write OEM
begin
	if(reset)
		begin
			memory_flag <= 3'b0;
			odd1_wr <= 1'b0;
			odd2_wr <= 1'b0; 
			odd3_wr <= 1'b0; 
			odd4_wr <= 1'b0; 
			even1_wr <= 1'b0; 
			even2_wr <= 1'b0; 
			even3_wr <= 1'b0; 
			even4_wr <= 1'b0;
		end
	else
		begin
			if(cur_state == 6 && Even)
				begin
					memory_flag <= memory_flag + 1;
					if(~m1_full)
						begin
							odd1_wr <= 1'b1;
							odd2_wr <= 1'b0; 
							odd3_wr <= 1'b0; 
							odd4_wr <= 1'b0; 
							even1_wr <= 1'b1; 
							even2_wr <= 1'b0; 
							even3_wr <= 1'b0; 
							even4_wr <= 1'b0;
						end
					else if(~m2_full)
						begin
							odd1_wr <= 1'b0;
							odd2_wr <= 1'b1; 
							odd3_wr <= 1'b0; 
							odd4_wr <= 1'b0; 
							even1_wr <= 1'b0; 
							even2_wr <= 1'b1; 
							even3_wr <= 1'b0; 
							even4_wr <= 1'b0;
						end
					else if(~m3_full)
						begin
							odd1_wr <= 1'b0;
							odd2_wr <= 1'b0; 
							odd3_wr <= 1'b1; 
							odd4_wr <= 1'b0; 
							even1_wr <= 1'b0; 
							even2_wr <= 1'b0; 
							even3_wr <= 1'b1; 
							even4_wr <= 1'b0;
						end
					else
						begin
							odd1_wr <= 1'b0;
							odd2_wr <= 1'b0; 
							odd3_wr <= 1'b0; 
							odd4_wr <= 1'b1; 
							even1_wr <= 1'b0; 
							even2_wr <= 1'b0; 
							even3_wr <= 1'b0; 
							even4_wr <= 1'b1;
						end
				end
			else if((cur_state >= 2 && ((counter[2:0] == 3'b111 && ~pi_msb) || (counter[2:0] == 3'b000 && pi_msb))))
				begin
					memory_flag <= memory_flag + 1;
					if(~m1_full && ~Even)
						begin
							odd1_wr <= 1'b1;
							odd2_wr <= 1'b0; 
							odd3_wr <= 1'b0; 
							odd4_wr <= 1'b0; 
							even1_wr <= 1'b0; 
							even2_wr <= 1'b0; 
							even3_wr <= 1'b0; 
							even4_wr <= 1'b0;
						end
					else if(~m1_full && Even)
						begin
							odd1_wr <= 1'b0;
							odd2_wr <= 1'b0; 
							odd3_wr <= 1'b0; 
							odd4_wr <= 1'b0; 
							even1_wr <= 1'b1; 
							even2_wr <= 1'b0; 
							even3_wr <= 1'b0; 
							even4_wr <= 1'b0;
						end
					else if(~m2_full && ~Even)
						begin
							odd1_wr <= 1'b0;
							odd2_wr <= 1'b1; 
							odd3_wr <= 1'b0; 
							odd4_wr <= 1'b0; 
							even1_wr <= 1'b0; 
							even2_wr <= 1'b0; 
							even3_wr <= 1'b0; 
							even4_wr <= 1'b0;
						end
					else if(~m2_full && Even)
						begin
							odd1_wr <= 1'b0;
							odd2_wr <= 1'b0; 
							odd3_wr <= 1'b0; 
							odd4_wr <= 1'b0; 
							even1_wr <= 1'b0; 
							even2_wr <= 1'b1; 
							even3_wr <= 1'b0; 
							even4_wr <= 1'b0;
						end
					else if(~m3_full && ~Even)
						begin
							odd1_wr <= 1'b0;
							odd2_wr <= 1'b0; 
							odd3_wr <= 1'b1; 
							odd4_wr <= 1'b0; 
							even1_wr <= 1'b0; 
							even2_wr <= 1'b0; 
							even3_wr <= 1'b0; 
							even4_wr <= 1'b0;
						end
					else if(~m3_full && Even)
						begin
							odd1_wr <= 1'b0;
							odd2_wr <= 1'b0; 
							odd3_wr <= 1'b0; 
							odd4_wr <= 1'b0; 
							even1_wr <= 1'b0; 
							even2_wr <= 1'b0; 
							even3_wr <= 1'b1; 
							even4_wr <= 1'b0;
						end
					else if(~Even)
						begin
							odd1_wr <= 1'b0;
							odd2_wr <= 1'b0; 
							odd3_wr <= 1'b0; 
							odd4_wr <= 1'b1; 
							even1_wr <= 1'b0; 
							even2_wr <= 1'b0; 
							even3_wr <= 1'b0; 
							even4_wr <= 1'b0;
						end
					else
						begin
							odd1_wr <= 1'b0;
							odd2_wr <= 1'b0; 
							odd3_wr <= 1'b0; 
							odd4_wr <= 1'b0; 
							even1_wr <= 1'b0; 
							even2_wr <= 1'b0; 
							even3_wr <= 1'b0; 
							even4_wr <= 1'b1;
						end
				end
			else  
				begin
					odd1_wr <= 1'b0;
					odd2_wr <= 1'b0; 
					odd3_wr <= 1'b0; 
					odd4_wr <= 1'b0; 
					even1_wr <= 1'b0; 
					even2_wr <= 1'b0; 
					even3_wr <= 1'b0; 
					even4_wr <= 1'b0;
				end
		end
end

always@(posedge clk, posedge reset) // oem_finish
begin
	if(reset)
		begin
			oem_finish <= 0;
		end
	else
		begin
			if(cur_state == 6 && oem_addr == 31 && m1_full && m2_full && m3_full)
				begin
					oem_finish <= 1;
				end	
		end
end

always@(posedge clk, posedge reset) // change memory
begin
	if(reset)
		begin
			m1_full <= 1'b0;
			m2_full <= 1'b0;
			m3_full <= 1'b0; 
		end
	else  
		begin
			if(memory_flag == 0 && oem_addr == 31)
				begin
					if(~m1_full)
						begin
							m1_full <= 1;
						end			
					else if(~m2_full)
						begin
							m2_full <= 1;
						end
					else if(~m3_full)
						begin
							m3_full <= 1;
						end
				end
		end
end

always@(posedge clk, posedge reset) // OEM address control
begin
	if(reset)
		begin
			oem_addr <= 5'd0;
		end
	else 
		begin
			if((memory_flag==0 || memory_flag==2 || memory_flag==4 || memory_flag==6) && |{odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr} == 1'b1)
				begin
					oem_addr <= oem_addr + 1; 
				end
		end
end

assign oem_dataout = temp;

always@(negedge clk, posedge reset) // OEM output
begin
	if(reset)
		begin
			temp[0] <= 1'b0;
			temp[1] <= 1'b0;
			temp[2] <= 1'b0;
			temp[3] <= 1'b0;
			temp[4] <= 1'b0;
			temp[5] <= 1'b0;
			temp[6] <= 1'b0;
			temp[7] <= 1'b0;
		end 
	else 
		begin
			case(cur_state)
				zero_state:
					begin
						temp <= 8'b0000_0000;
					end
				sti_8, sti_16: 
					begin
						temp <= {temp, pi_data[counter]};
					end
				sti_24:
					begin
						if((pi_fill && counter <= 7) || (~pi_fill && counter >= 16))
							begin		
								temp <= 1'b0;								
							end
						else if((~pi_msb && pi_fill) || (pi_msb && pi_fill))
							begin 
								temp <= {temp, pi_data[counter-8]};
							end 				
						else
							begin 
								temp <= {temp, pi_data[counter]};
							end 								
					end
				sti_32:
					begin
						if((pi_fill && counter <= 15) || (~pi_fill && counter >= 16))
							begin
								temp <= 1'b0;									
							end
						else if((~pi_msb && pi_fill) || (pi_msb && pi_fill))
							begin 
								temp <= {temp, pi_data[counter-16]};
							end 						
						else 
							begin 
								temp <= {temp, pi_data[counter]};
							end 		
					end
			endcase
		end
end

always@(posedge clk, posedge reset) // so_data
begin
	if(reset)
		begin
			so_data <= 0;
		end
	else 
		begin
			case(cur_state)
				zero_state:
					begin
						so_data <= 1'b0;
					end
				sti_8, sti_16: 
					begin
						so_data <= pi_data[counter];
					end
				sti_24:
					begin
						if((pi_fill && counter <= 7) || (~pi_fill && counter >= 16))
							begin
								so_data <= 1'b0;							
							end
						else if((~pi_msb && pi_fill) || (pi_msb && pi_fill))
							begin 
								so_data <= pi_data[counter-8];
							end 				
						else
							begin 
								so_data <= pi_data[counter];
							end 								
					end
				sti_32:
					begin
						if((pi_fill && counter <= 15) || (~pi_fill && counter >= 16))
							begin
								so_data <= 1'b0;							
							end
						else if((~pi_msb && pi_fill) || (pi_msb && pi_fill))
							begin 
								so_data <= pi_data[counter-16];
							end 						
						else 
							begin 
								so_data <= pi_data[counter];
							end 		
					end
			endcase
		end
	
end

always@(posedge clk, posedge reset) // so valid signal control
begin
	if(reset)
		begin
			so_valid <= 1'd0;
		end
	else  
		begin
			case(cur_state)
				sti_8:
					begin
						so_valid <= 1'd1;
						if((~pi_msb && ~pi_low && counter == 6'd8) || 
						   (~pi_msb && pi_low && counter == 6'd16) || 
						   (pi_msb && ~pi_low && counter == 6'b111111) ||
						   (pi_msb && pi_low && counter == 6'd7))
							begin
								so_valid <= 1'd0;
							end
					end
				sti_16:
					begin
						so_valid <= 1'd1;
						if((~pi_msb && counter == 6'd16) || (pi_msb && counter == 6'b111111))
							begin
								so_valid <= 1'd0;
							end
					end
				sti_24:
					begin
						so_valid <= 1'd1;
						if((~pi_msb && counter == 6'd24) || (pi_msb && counter == 6'b111111))
							begin
								so_valid <= 1'd0;
							end
					end
				sti_32:
					begin
						so_valid <= 1'd1;
						if((~pi_msb && counter == 6'd32) || (pi_msb && counter == 6'b111111))
							begin
								so_valid <= 1'd0;
							end
					end
			endcase
		end
	
end

always@(posedge clk, posedge reset) // Even control
begin
	if(reset)
		begin
			Even <= 1'b0;
		end
	else  
		begin
			if(cur_state >= 2 && cur_state <= 5)
				begin
					if(~pi_msb && memory_flag != 7) // && counter[2:0]==3'b111
						begin
							case(counter)
								7, 15, 23, 31:
									begin
										Even <= ~Even;
									end
							endcase
						end
					else if(memory_flag != 7)
						begin
							case(counter)
								0, 8, 16, 24:
									begin
										Even <= ~Even;
									end
							endcase
						end
				end
			else if(cur_state == 6)
				begin
					Even <= ~Even;
				end
		end
end

endmodule
