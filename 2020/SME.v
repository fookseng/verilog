module SME
(
input 				clk,
input 				reset,
input 		[7:0] 	chardata,
input 				isstring,
input 				ispattern,
output reg  		valid,
output reg			match,
output reg	[4:0] 	match_index
);

reg [1:0] cur_state;
reg [1:0] nxt_state;
reg	[7:0] string [0:31];
reg	[7:0] pattern [0:7];
reg [5:0] str_len, cur_str; // Max length 32
reg [3:0] pat_len, cur_pat, temp_pat; // Max length 8
reg asterisk_sym, equal;

integer i;
localparam read_char=0, compare=1, check_match=2, result=3;

//----------- FSM 2c1s ------------
//------------------------------------------
always@(posedge clk, posedge reset)
begin
	if(reset)
		begin
			cur_state <= read_char;
		end
	else 
		begin
			cur_state <= nxt_state;
		end
end

always@(*)
begin
	case(cur_state)
		read_char:
			begin
				if(isstring || ispattern)
					begin
						nxt_state = read_char;
					end
				else 
					begin
						nxt_state = compare;
					end
			end
		compare:
			begin
				nxt_state = check_match;
			end
		check_match:
			begin
				if(cur_str == str_len-1 || (cur_pat == pat_len-1 && equal))
					begin
						nxt_state = result;
					end
				else 
					begin
						nxt_state = check_match;
					end
			end
		result:
			begin
				nxt_state = read_char;
			end
	endcase
end

//--------------Datapath-------------
//------------------------------------------

always@(posedge clk, posedge reset)
begin
	if(reset)
		begin
			str_len <= 6'd0;
			cur_str <= 6'd0;
			pat_len <= 4'd0;
			cur_pat <= 4'd0;
			temp_pat <= 4'd0;

			asterisk_sym <= 1'b0;
			
			valid <= 1'b0;
			match <= 1'b0;
			match_index <= 5'b11111;

			for(i = 0; i <= 7; i=i+1)
				begin
					pattern[i] <= 8'd0;
				end
			for(i = 0; i <= 31; i=i+1)
				begin
					string[i] <= 8'd0;
				end
		end
	else 
		begin
			case(cur_state)
				read_char:
					begin
						valid <= 1'b0;
						match_index <= 5'b11111;
						match <= 1'b0;
						if(isstring)
							begin
								string[str_len] <= chardata;
								str_len <= str_len + 1;
							end
						else if(ispattern) 
							begin
								pattern[pat_len] <= chardata;
								pat_len <= pat_len + 1;
							end
					end
				compare: 
					begin
						cur_str <= 6'd0;
						cur_pat <= 4'd0;
						if(str_len == 6'd0)
							begin
								str_len <= cur_str;
							end
					end
				check_match:
					begin
						if((equal && cur_pat < 7 ) || (asterisk_sym && equal))
							begin
								cur_pat <= cur_pat + 1;
							end
						else if(asterisk_sym && !equal)
							begin
								cur_pat <= temp_pat;
							end
						else 
							begin
								cur_pat <= 4'd0;
							end

						if((cur_pat == pat_len-1 && equal) || (cur_str == str_len-1 ))
							begin
								cur_str <= str_len;
							end
						else if((!equal && cur_pat > 0 && cur_str > 0) || (pattern[cur_pat] == 8'h5e && cur_str == 0) || (pattern[cur_pat] == 8'h2a && !asterisk_sym))
							begin
								cur_str <= cur_str;
							end
						else 
							begin
								cur_str <= cur_str+1;
							end

						if(pattern[cur_pat] == 8'h2a)
							begin
								asterisk_sym <= 1'b1;
								temp_pat <= cur_pat;
							end

						if(equal && match_index == 5'b11111  && string[cur_str] != 8'h20)
							begin
								match_index <= cur_str;
							end
						else if(!equal && !asterisk_sym)
							begin
								match_index <= 5'b11111;
							end
					end
				result:
					begin
						valid <= 1'b1;
						
						if(cur_pat == pat_len || (cur_pat == pat_len-1 && pattern[cur_pat] == 8'h24))
							begin
								match <= 1'b1;								
							end
						else 
							begin
								match <= 1'b0;
							end
						
						str_len <= 6'd0;
						pat_len <= 4'd0;
						asterisk_sym <= 1'b0;
					end
			endcase
		end
end

always@(*)
begin
	if((pattern[cur_pat] == 8'h5e && (!cur_str || string[cur_str] == 8'h20)) || (pattern[cur_pat] == 8'h24 && (cur_str == str_len || string[cur_str] == 8'h20)) || (string[cur_str] == pattern[cur_pat] || pattern[cur_pat] == 8'h2e || pattern[cur_pat] == 8'h2a))
		begin
			equal = 1'b1;
		end
	else  
		begin
			equal = 1'b0;
		end
end

endmodule
