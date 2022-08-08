module LCD_CTRL
(
input 				clk,
input 				reset,
input 		[7:0]	IROM_Q,
input 		[2:0]	cmd,
input 				cmd_valid,
output reg			IROM_EN,
output reg	[5:0]	IROM_A,
output reg			IRB_RW,
output reg	[7:0]	IRB_D,
output reg	[5:0]	IRB_A,
output reg			busy,
output reg			done
);

reg  [7:0] image[63:0];	
reg  [5:0] counter;
wire [9:0] sum;
reg  [9:0] addend_1, addend_2;
integer i;
reg  [3:0] cur_state, nxt_state;
localparam input_state=0, shift_input=1, read_cmd=2, write=3, shift_u=4, shift_d=5, shift_l=6, shift_r=7,
		   average_0=8, average_1=9, average_2=10, average_3=11, mirror_x=12, mirror_y=13;

//------------------- FSM ---------------
//---------------------------------------
always @(posedge clk or posedge reset) 
begin
	if (reset) 
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
				if(IROM_A == 63)
					begin
						nxt_state = read_cmd;
					end
				else 
					begin
						nxt_state = shift_input;
					end
			end
		shift_input:
			begin
				nxt_state = input_state;
			end
		read_cmd:
			begin
				case({cmd_valid, cmd})
					4'b1000:
						begin
							nxt_state = write;
						end
					4'b1001:
						begin
							nxt_state = shift_u;
						end
					4'b1010:
						begin
							nxt_state = shift_d;
						end
					4'b1011:
						begin
							nxt_state = shift_l;
						end
					4'b1100:
						begin
							nxt_state = shift_r;
						end
					4'b1101:
						begin
							nxt_state = average_0;
						end
					4'b1110:
						begin
							nxt_state = mirror_x;
						end
					4'b1111:
						begin
							nxt_state = mirror_y;
						end
					default:
						begin
							nxt_state = read_cmd;
						end
				endcase
			end
		write:
			begin
				nxt_state = write;
			end
		shift_u:
			begin
				nxt_state = read_cmd;
			end
		shift_d:
			begin
				nxt_state = read_cmd;
			end
		shift_l:
			begin
				nxt_state = read_cmd;
			end
		shift_r:
			begin
				nxt_state = read_cmd;
			end
		average_0:
			begin
				nxt_state = average_1;
			end
		average_1:
			begin
				nxt_state = average_2;
			end
		average_2:
			begin
				nxt_state = average_3;
			end
		average_3:
			begin
				nxt_state = read_cmd;
			end
		mirror_x:
			begin
				nxt_state = read_cmd;
			end
		mirror_y:
			begin
				nxt_state = read_cmd;
			end
		default:
			begin
				nxt_state = read_cmd;
			end
	endcase
end

//--------------------Datapath-----------
//---------------------------------------
assign sum = addend_1 + addend_2;

always@(posedge clk or posedge reset)
begin
	if(reset)
		begin
			counter <= 0;
			IROM_EN <= 0;
			IRB_RW <= 1;
			IRB_A <= 0;
			IRB_D <= 0;
			IROM_A <= 0;
			busy <= 1;
			done <= 0;
			addend_1 <= 10'd0;
			addend_2 <= 10'd0;
		end
	else 	
		begin
			case(cur_state)
				input_state:
					begin
						image[63] <= IROM_Q;
						IROM_A <= counter;
						counter <= counter + 1;
						if(IROM_A == 63)
							begin
								busy <= 0;
								counter <= 27;
								IROM_EN <= 1;
							end
					end
				shift_input:
					begin
						for(i=0; i<=62; i=i+1)
							begin
								image[i] <= image[i+1];
							end						
					end
				read_cmd:
					begin
						busy <= 1;
						if(cmd == 0)
							begin
								counter <= 0;
							end
					end
				write:
					begin
						IRB_RW <= 0;
						IRB_A <= counter;
						IRB_D <= image[counter];
						counter <= counter + 1;
						if(IRB_A == 63)
							begin
								done <= 1;
								busy <= 0;
								IRB_RW <= 1;
							end
					end
				shift_u:
					begin
						if(counter >= 8)
							begin
								counter <= counter - 8;
							end
						busy <= 0;
					end
				shift_d:
					begin
						if(counter <= 46)
							begin
								counter <= counter + 8;
							end
						busy <= 0;
					end
				shift_l:
					begin
						if(counter[2:0] != 3'b000)
							begin
								counter <= counter - 1;
							end
						busy <= 0;
					end
				shift_r:
					begin
						if(counter[2:0] != 3'b110)
							begin
								counter <= counter + 1;
							end
						busy <= 0;
					end
				average_0:
					begin
						addend_1 <= image[counter];
						addend_2 <= image[counter+1];
					end
				average_1:
					begin
						addend_1 <= sum;
						addend_2 <= image[counter+8];
					end
				average_2:
					begin
						addend_1 <= sum;
						addend_2 <= image[counter+9];
					end
				average_3:
					begin
						image[counter] <= sum >> 2;
						image[counter+1] <= sum >> 2;
						image[counter+8] <= sum >> 2;
						image[counter+9] <= sum >> 2;
						busy <= 0;
					end
				mirror_x:
					begin
						image[counter] <= image[counter+8];
						image[counter+8] <= image[counter];
						image[counter+1] <= image[counter+9];
						image[counter+9] <= image[counter+1];
						busy <= 0;
					end
				mirror_y:
					begin
						image[counter] <= image[counter+1];
						image[counter+1] <= image[counter];
						image[counter+8] <= image[counter+9];
						image[counter+9] <= image[counter+8];
						busy <= 0;
					end
			endcase
		end
end
endmodule

