// A total of 40320 permutations. The maximum cycle allowable: 430000 cycles, (deriving new permutation + calculating cost) must be done within 10.66 cycles in order to achieve Grade A. 

module JAM 
#(parameter N = 7) // 8 jobs and 8 workers
(
input CLK,
input RST,
output reg [2:0] W,
output reg [2:0] J,
input [6:0] Cost,
output reg [3:0] MatchCount,
output reg [9:0] MinCost,
output reg Valid
);

reg [2:0] array[0:N];
reg [2:0] array_tmp[0:N];
reg [2:0] pivot; 
reg [2:0] swap_pos;
reg [3:0] index; 
reg [9:0] total_cost;
integer i;

reg cur_state;
reg nxt_state;
localparam cal_cost = 0,  match_count= 1;

// FSM: 2C 1S design.  1C for output is obmitted since it is unsuitable for this question.
//------------------------------------------------------------------------------------------------------------

always@(posedge CLK, posedge RST)
begin
	if(RST)
		begin
			cur_state <= cal_cost;
		end
	else 
		begin
			cur_state <= nxt_state;
		end
end

always@(*)
begin
	case(cur_state)
		cal_cost:
			begin
				if(index == 8)
					begin
						nxt_state = match_count;
					end
				else
					begin
						nxt_state = cal_cost;
					end
			end
		match_count:
			begin
				nxt_state = cal_cost;
			end
	endcase
end


// Datapath
//------------------------------------------------------------------------------------------------------------

always@(posedge CLK, posedge RST)
begin
	if(RST)
		begin
			index <= 0;
		end
	else 
		begin
			if(index < 8)
				begin
					index <= index + 1;					
				end
			else 
				begin
					index <= 0;
				end
		end
end

always@(posedge CLK, posedge RST)
begin
	if(RST) 
		begin
			Valid <= 1'b0;
			total_cost <= 10'b0;
			MinCost <= 10'b11_1111_1111;
			for(i = 0; i <= N; i = i + 1)
				begin			
					array[i] <= i;
				end
		end
	else 
		begin
			case(cur_state)
				cal_cost:// Calculate total cost for current permutation.
					begin
						total_cost <= total_cost + Cost; 
					end
				match_count:
					begin
						total_cost <= 0;
						// Update new permutation
						for(i = 0; i <= N; i = i + 1)
							begin			
								array[i] <= array_tmp[i];
							end
						if(total_cost < MinCost)
							begin
								MinCost <= total_cost;
								MatchCount <= 1;
							end
						else if(total_cost == MinCost)
							begin
								MatchCount <= MatchCount + 1;
							end
						// Found all permutations, end. 
						if(array[0] == 7 && array[1] == 6 && array[2] == 5 && array[3] == 4 && array[4] == 3 && array[5] == 2 && array[6] == 1)
							begin
								Valid <= 1;
							end
					end
			endcase
		end
end

always@(posedge CLK, posedge RST)
begin
	if(RST)
		begin
			for(i = 0; i <= N; i = i + 1)
				begin			
					array_tmp[i] <= i;
				end
		end
	else
		begin
			case({cur_state, index})	
				6'b0_0001:
					begin
						case(swap_pos)	// swap pivot with swap_pos
							3'd7:
								begin
									array_tmp[pivot] <= array_tmp[7];
									array_tmp[7] <= array_tmp[pivot];
								end
							3'd6:
								begin
									array_tmp[pivot] <= array_tmp[6];
									array_tmp[6] <= array_tmp[pivot];
								end
							3'd5:
								begin
									array_tmp[pivot] <= array_tmp[5];
									array_tmp[5] <= array_tmp[pivot];
								end
							3'd4:
								begin
									array_tmp[pivot] <= array_tmp[4];
									array_tmp[4] <= array_tmp[pivot];
								end
							3'd3:
								begin
									array_tmp[pivot] <= array_tmp[3];
									array_tmp[3] <= array_tmp[pivot];
								end
							3'd2:
								begin
									array_tmp[pivot] <= array_tmp[2];
									array_tmp[2] <= array_tmp[pivot];
								end
							3'd1:
								begin
									array_tmp[pivot] <= array_tmp[1];
									array_tmp[1] <= array_tmp[pivot];
								end
						endcase
					end
				6'b0_0010: // Reverse order
					begin
						case(pivot)
							3'd4, 3'd5:
								begin
									array_tmp[pivot + 1] <= array_tmp[7];
									array_tmp[7] <= array_tmp[pivot + 1];
								end
							3'd2, 3'd3:
								begin
									array_tmp[pivot + 1] <= array_tmp[7];
									array_tmp[7] <= array_tmp[pivot + 1];
									array_tmp[pivot + 2] <= array_tmp[6];
									array_tmp[6] <= array_tmp[pivot + 2];
								end
							3'd0, 3'd1:
								begin
									array_tmp[pivot + 1] <= array_tmp[7];
									array_tmp[7] <= array_tmp[pivot + 1];
									array_tmp[pivot + 2] <= array_tmp[6];
									array_tmp[6] <= array_tmp[pivot + 2];
									array_tmp[pivot + 3] <= array_tmp[5];
									array_tmp[5] <= array_tmp[pivot + 3];
								end
						endcase
					end
			endcase
		end
end

// algorithm step 1: Check array right > array left, start from rhs. Get pivot number.
always@(*)
begin
	if(array[7] > array[6])
		begin
			pivot <= 3'd6;
		end
	else if(array[6] > array[5])
		begin
			pivot <= 3'd5;
		end
	else if(array[5] > array[4])
		begin
			pivot <= 3'd4;
		end
	else if(array[4] > array[3])
		begin
			pivot <= 3'd3;
		end
	else if(array[3] > array[2])
		begin
			pivot <= 3'd2;
		end
	else if(array[2] > array[1])
		begin
			pivot <= 3'd1;
		end
	else// if(array[1] > array[0])
		begin
			pivot <= 3'd0;
		end
end

// algorithm step 2: The number which is the smallest but larger than pivot. 
always@(*)
begin
	if(array[pivot] < array[7])
		begin
			swap_pos = 3'd7;
		end
	else if(array[pivot] < array[6])
		begin
			swap_pos = 3'd6;
		end
	else if(array[pivot] < array[5])
		begin
			swap_pos = 3'd5;
		end
	else if(array[pivot] < array[4])
		begin
			swap_pos = 3'd4;
		end
	else if(array[pivot] < array[3])
		begin
			swap_pos = 3'd3;
		end
	else if(array[pivot] < array[2])
		begin
			swap_pos = 3'd2;
		end
	else
		begin
			swap_pos = 3'd1;
		end
end

always@(negedge CLK)
begin
	W <= index;
	J <= array[index];
end

endmodule


