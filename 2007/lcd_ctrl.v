module lcd_ctrl
(
input       	    clk,
input           	reset,
input   	[7:0]   datain,
input   	[2:0]   cmd,
input           	cmd_valid,
output  reg	[7:0]   dataout,
output 	reg         output_valid,
output 	reg         busy
);

reg [7:0] Mem[0:35]; 
reg [5:0] counter;
reg	[3:0] cur_state, nxt_state;
localparam new_cmd=15, reflash=0, load_data=1, shift_r=2, shift_l=3, shift_u=4, shift_d=5, output_data1=6,
		   output_data2=7, output_data3=8, output_data4=9, output_data5=10, output_data6=11, output_data7=12, 
		   output_data8=13, output_data9=14;


//---------- FSM --------------
//----------------------------

always@(posedge clk, posedge reset)
begin
	if(reset)
		begin
			cur_state <= new_cmd;
		end
	else 
		begin
			cur_state <= nxt_state;
		end
end

always@(*)
begin
	case(cur_state)
		new_cmd:
			begin
				case(cmd)
					default:
						begin
							nxt_state = reflash;
						end
					1:
						begin
							nxt_state = load_data;
						end
					2:
						begin
							nxt_state = shift_r;
						end
					3:
						begin
							nxt_state = shift_l;
						end
					4:
						begin
							nxt_state = shift_u;
						end
					5:
						begin
							nxt_state = shift_d;
						end
				endcase
			end
		load_data:
			begin
				if(counter == 35)
					begin
						nxt_state = output_data1;
					end
				else 
					begin
						nxt_state = load_data;
					end
			end
		reflash, shift_d, shift_u, shift_l, shift_r:
			begin
				nxt_state = output_data1;
			end
		output_data1:
			begin
				nxt_state = output_data2;
			end
		output_data2:
			begin
				nxt_state = output_data3;
			end
		output_data3:
			begin
				nxt_state = output_data4;
			end
		output_data4:
			begin
				nxt_state = output_data5;
			end
		output_data5:
			begin
				nxt_state = output_data6;
			end
		output_data6:
			begin
				nxt_state = output_data7;
			end
		output_data7:
			begin
				nxt_state = output_data8;
			end
		output_data8:
			begin
				nxt_state = output_data9;
			end
		output_data9:
			begin
				nxt_state = new_cmd;
			end
		default:
			begin
				nxt_state = new_cmd;
			end
	endcase
end

//----------------- Datapath ---------------
//----------------------------------------
always@(posedge clk, posedge reset)
begin
	if(reset)
		begin
			counter <= 0;
			output_valid <= 0;
			busy <= 0;
			dataout <= 0;
		end
	else 
		begin
			case(cur_state)
				new_cmd:
					begin
						busy <= 1;
						output_valid <= 0;
						if(cmd == 1)
							begin
								counter <= 0;
							end
					end
				load_data:
					begin
						Mem[counter] <= datain;
						if(counter == 35)
							begin
								counter <= 14;
							end
						else 
							begin
								counter <= counter + 1;
							end
					end
				reflash:
					begin
						counter <= counter - 14;
					end
				shift_d:
					begin
						if(counter <= 29)
							begin
								counter <= counter - 8;
							end
						else 	
							begin
								counter <= counter - 14;
							end
					end
				shift_l:
					begin
						if(counter != 14 && counter != 20 && counter != 26 && counter != 32)
							begin
								counter <= counter - 15;
							end
						else 	
							begin
								counter <= counter - 14;
							end
					end
				shift_r:
					begin
						if(counter != 17 && counter != 23 && counter != 29 && counter != 35)
							begin
								counter <= counter - 13;
							end
						else 	
							begin
								counter <= counter - 14;
							end
					end
				shift_u:
					begin
						if(counter >= 20)
							begin
								counter <= counter - 20;
							end
						else 	
							begin
								counter <= counter - 14;
							end
					end
				output_data1, output_data2, output_data4, output_data5, output_data7, output_data8:
					begin
						output_valid <= 1;
						dataout <= Mem[counter];
						counter <= counter + 1;
					end
				output_data3, output_data6:
					begin
						dataout <= Mem[counter];
						counter <= counter + 4;
					end
				output_data9:
					begin
						busy <= 0;
						dataout <= Mem[counter];
					end
			endcase
		end
end
endmodule
