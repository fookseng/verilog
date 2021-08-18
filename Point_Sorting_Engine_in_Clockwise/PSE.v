module PSE ( clk,reset,Xin,Yin,point_num,valid,Xout,Yout);

input clk;
input reset;
input [9:0] Xin;
input [9:0] Yin;
input [2:0] point_num;

output valid;
output [9:0] Xout;
output [9:0] Yout;

reg valid; // register is 1 bit by default.

reg [9:0] x_coor [5:0];  // 10bits width array with depth 6: point_num is 3bits(7), but inputs are between 3 to 6.
reg [9:0] y_coor [5:0];

reg recount, pos; //left or right position after cross_product
reg [1:0] state, nxt_state;
reg [2:0] counter, index, index2;

reg [9:0] Xout;
reg [9:0] Yout;

parameter [1:0] state_read_input = 2'b00,
          state_process_input = 2'b01,
          state_output_result = 2'b11;

// control unit: state control
always @(posedge clk)
	begin
	if(reset)
		begin
		state <= state_read_input;
		end
	else
		begin
		state <= nxt_state;
		end
	end	

// control counter signal
always @(posedge clk)
	begin
	if(reset || recount)
		begin
		counter <= 0;
		end
	else
		begin
		counter <= counter + 1;
		end
	end

// control valid signal
always @(posedge clk)
	begin
	if(reset || recount)
		begin
		valid <= 0;
		end
	else
		begin
		case (state)
			2'b11 :
				begin
				if (counter == point_num)
					valid <= 0 ;
				else
					valid <= 1;
				end
			default :
				begin
				valid <= 0;
				end
		endcase
		end
	end

// control index, index2 signal
always @(posedge clk)
	begin
	if(reset || recount)
		begin
		index <= 1;
		index2 <= 1 ;
		end
	else
		begin
		case (state)
			2'b01 :
				begin
				if (index2 < (point_num-1))
					begin
					if (index < (point_num - 1 - index2))
						begin	
						index <= index + 1 ;
						end
					else
						begin
						index2 <= index2 + 1;
						index <= 1 ;
						end
					end
				end
			default :
				begin
				index <= 1;
				index2 <= 1;
				end
		endcase
		end
	end

// control unit: next state logic combinational circuit
always @(*)
	begin
	case (state)
		state_read_input : 
			begin
			if ((counter == (point_num-1)) && (point_num)) // all inputs are read into memory.
				begin
				nxt_state = state_process_input;
				recount = 1;
				end
			else
				begin
				nxt_state = state_read_input;
				recount = 0;
				end
			end
		state_process_input : 
			begin
			if(index2 == (point_num - 2))
				begin
				nxt_state = state_output_result;
				recount = 1;
				end
			else
				begin
				nxt_state = state_process_input;
				recount = 0;
				end
			end
		state_output_result : 
			begin
			if (counter == point_num)
				begin
				recount = 1;
				nxt_state = state_read_input ;
				end
			else
				begin
				recount = 0;
				nxt_state = state_output_result;
				end
			end
		default : 
			begin
			nxt_state = state_read_input ;
			recount = 0;
			end
	endcase
	end

/*
// control unit: output logic combinational circuit (not needed in this design.)
always @(state)
	begin
	case (state)
		state_read_input :
			begin
			
			end
		
		state_process_input :
			begin
			
			end
		
		state_output_result : 
			begin

			end
		
		default : 
			begin

			end
	endcase	
	end
*/

// Datapath: Cross-Product calculation
always @(*)
	begin
	pos = clockwise(x_coor[0], y_coor[0], x_coor[index], y_coor[index], x_coor[index+1], y_coor[index+1]) ;			
	end

// Datapath 
always @(posedge clk)
	begin
	case (state)
		2'b00 :
			begin
			x_coor[counter] <= Xin;
			y_coor[counter] <= Yin;
			end
		2'b01 : // bubble sort
			begin
			if (!pos)
				begin
				// point_1 and point_2 are in anti-clockwise order. Switch their position. Since non-blocking is used here, temp register is not needed. 
				x_coor[index] <= x_coor[index+1];
				y_coor[index] <= y_coor[index+1];
				x_coor[index+1] <= x_coor[index];
				y_coor[index+1] <= y_coor[index];
				end
			else
				begin
				x_coor[index] <= x_coor[index];
				y_coor[index] <= y_coor[index];
				x_coor[index+1] <= x_coor[index+1];
				y_coor[index+1] <= y_coor[index+1];
				end	
			end
		2'b11 :
			begin	
			Xout <= x_coor[counter];
			Yout <= y_coor[counter];
			end
	endcase
	end

function clockwise; // if point_2 is in the clockwise direction of point_1, return value = 1
	input signed [10:0] x0_in, y0_in, x1_in, y1_in, x2_in, y2_in;
	reg signed [10:0] ax, ay, bx, by; //local variables
	reg signed [20:0] w1, w2, w3; //local variables
	reg [1:0] quad_1, quad_2 ;

	begin
	// calculate cross product
	ax = x1_in - x0_in;
	bx = x2_in - x0_in;
	ay = y1_in - y0_in;
	by = y2_in - y0_in;

	w1 =  ax * by;
	w2 =  bx * ay;
	w3 = w1 - w2 ; // if w3 is negative, w3[20] = 1, else 0.
	
	clockwise = w3[20] ; // if w3[20] is 1, clockwise order: point_1 -> point_2.
	end
endfunction
endmodule

