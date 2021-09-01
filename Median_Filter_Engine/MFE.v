`timescale 1ns/10ps

module MFE(clk,reset,busy,ready,iaddr,idata,data_rd,data_wr,addr,wen);
input				clk;
input				reset;
output	reg			busy;	// 1: Start to process image(median filter)
input				ready;	// 1: Start to obtain data from grayscale image address
output	reg [13:0]	iaddr;  // Grayscale image memory address, used to request pixel value. 14bits = Max 16383 in decimal.
input	[7:0]		idata;	// Grayscale image pixel value, 8 bits unsigned integer.
input	[7:0]		data_rd;
output	reg [7:0]	data_wr;
output	reg [13:0]	addr;
output	reg			wen;

reg [14:0] num; // 0 -> 16383 (inclusive) SUM(1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192) = 16383
reg [6:0] row, column; // max 127
reg [7:0] temp [0:8]; // store each patch data.
reg recount;
reg [3:0] index, index2, index3;

// Declare state register
reg	[1:0] state, nxt_state;
// Declare states
parameter [1:0] S0 = 0, S1 = 1, S2 = 2, S3 = 3;

/*********************************************************************
	1 sequential + 2 combinational, common circuit design pattern.
*********************************************************************/
// control unit: state control
always @(posedge clk or posedge reset)
	begin
	if(reset)
		begin
		state <= S0;
		end
	else
		begin
		state <= nxt_state;
		end
	end	

// Determine the next state
always @ (*) 
	begin
	case (state)
		S0:
			begin
			if (index3 == 9)
				begin
				nxt_state = S1;
				recount = 1;
				end
			else
				begin
				nxt_state = S0;
				recount = 0;
				end
			end
		S1:
			begin
			if (index2 == 7)
				begin
				nxt_state = S2;
				recount = 1;
				end
			else
				begin
				nxt_state = S1;
				recount = 0;
				end
			end
		S2:
			begin
			nxt_state = S0;
			recount = 1;
			end
	endcase
	end

/* Not needed in this design.
// Output depends only on the state
always @ (state) begin
	case (state)
		S0:
			output = 1'b1;
		S1:
			output = 1'b0;
		S2:
			output = 1'b1;
		S3:
			output = 1'b0;
		default:
			output = 1'b0;
	endcase
end
*/

/*********************************************************************
	Signals control
*********************************************************************/
// control index, index2 signal for bubble sorting.
always @(posedge clk)
	begin
	if(reset)
		begin
		index <= 0;
		index2 <= 0;
		end
	else
		begin
		case (state)
			S1 :
				begin
				if (index2 < 8)
					begin
					if (index < (7 - index2))
						begin	
						index <= index + 1 ;
						end
					else
						begin
						index2 <= index2 + 1;
						index <= 0 ;
						end
					end
				end
			default :
				begin
				index <= 0;
				index2 <= 0;
				end
		endcase
		end
	end

// control num signal
always @(posedge clk)
	begin
	if (reset)
		begin
		num <= 0;
		end
	if (index2 == 6 && index == 1)
		begin
		num <= num + 1;
		end
	end

// control busy signal. 
always @(posedge clk)
	begin
	if (reset)
		begin
		busy <= 1'b0;
		end
	else
		begin
		busy <= 1'b1;
		if (num == 16385)
			begin
			busy <= 1'b0;
			end
		end
	end

// control row, column signals
always @(posedge clk)
	begin
	if (reset)
		begin
		row <= 0;
		column <= 0;
		end
	case (state)
	S2 :
		begin
		if (column == 127)
			begin
			row <= row + 1;
			column <= 0;
			end
		else
			begin
			column <= column + 1;
			end
		end
	endcase
	end

// control index3 signal
always @(posedge clk)
	begin
	if (reset || (state == S2))
		begin
		index3 <= 0;
		end
	else
		begin
		index3 <= index3 + 1;
		end
	end
/*********************************************************************
	Datapath
*********************************************************************/
// Datapath 
always @(posedge clk)
	begin
	case (state)
		S0: // read pixel value. Must be carefully construct the below if, else if flow. Absolute coordinate must be place before a target range.
			begin
			if ((row == 0) && (column == 0)) // OK Pixel 0: first row, first column
				begin
				case (index3)
					4 :
						begin
						iaddr <= 1;
						temp[index3-1] <= idata;
						end
					5 :
						begin
						iaddr <= 128;
						temp[index3-1] <= idata;
						end
					7 :
						begin
						iaddr <= 129;
						temp[index3-1] <= idata;
						end
					8 :
						begin
						iaddr <= 0;
						temp[index3-1] <= idata;
						end
					default :
						begin
						temp[index3-1] <= 0;
						iaddr <= 0;
						end
				endcase
				end
			else if ((row == 0) && (column == 127)) // OK Pixel 127: first row, last column 
				begin
				case (index3)
					3 :
						begin
						iaddr <= 127;
						temp[index3] <= idata;
						end
					4 :
						begin
						//iaddr <= 254;
						temp[index3] <= idata;
						end
					5 :
						begin
						iaddr <= 254;
						temp[index3] <= 0;
						end
					6 :
						begin
						iaddr <= 255;
						temp[index3] <= idata;
						end
					7 :
						begin
						//iaddr <= 0;
						temp[index3] <= idata;
						end
					default :
						begin
						iaddr <= 126;
						temp[index3] <= 0;
						end
				endcase
				end
			else if ((row == 127) && (column == 0)) // OK last row, first column 
				begin
				case (index3)
					1 :
						begin
						iaddr <= 16129;
						temp[index3] <= idata;
						end
					2 :
						begin
						iaddr <= 16129;
						temp[index3] <= idata;
						end
					3 :
						begin
						iaddr <= 16256;
						temp[index3] <= 0;
						end
					4 :
						begin
						iaddr <= 16257;
						temp[index3] <= idata;
						end
					5 :
						begin
						iaddr <= 16257;
						temp[index3] <= idata;
						end
					8 : // added this 
						begin
						iaddr <= num - 129;
						temp[index3] <= 0;
						end
					default :
						begin
						temp[index3] <= 0;
						iaddr <= 16128;
						end
				endcase
				end
			else if ((row == 127) && (column == 127)) // Pixel 16383: last row, last column 
				begin
				case (index3)
					0 :
						begin
						iaddr <= 16254;
						temp[index3] <= idata;
						end
					1 :
						begin
						iaddr <= 16255;
						temp[index3] <= idata;
						end
					3 :
						begin
						iaddr <= 16382;
						temp[index3] <= idata;
						end
					4 :
						begin
						iaddr <= 16383;
						temp[index3] <= idata;
						end
					default :
						begin
						temp[index3] <= 0;
						//iaddr <= num - 1;
						end
				endcase
				end
			else if ((row == 0) && (column > 0)) // OK Pixels 1-126: first row, middle column 
				begin
				case (index3)
					3 :
						begin
						iaddr <= num;
						temp[index3] <= idata;
						end
					4 :
						begin
						iaddr <= num + 1;
						temp[index3] <= idata;
						end
					5 :
						begin
						iaddr <= num + 127;
						temp[index3] <= idata;
						end
					6 :
						begin
						iaddr <= num + 128;
						temp[index3] <= idata;
						end
					7 :
						begin
						iaddr <= num + 129;
						temp[index3] <= idata;
						end
					8 :
						begin
						iaddr <= num + 129;
						temp[index3] <= idata;
						end
					default :
						begin
						temp[index3] <= 0;
						iaddr <= num - 1;
						end
				endcase
				end
			else if ((row > 0) && (column == 0)) // OK middle row, first column 
				begin
				case (index3)
					1 :
						begin
						iaddr <= num - 127;
						temp[index3] <= idata;
						end
					2 :
						begin
						iaddr <= num - 1;
						temp[index3] <= idata;
						end
					3 :
						begin
						iaddr <= num;
						temp[index3] <= 0;
						end
					4 :
						begin
						iaddr <= num + 1;
						temp[index3] <= idata;
						end
					5 :
						begin
						iaddr <= num + 127;
						temp[index3] <= idata;
						end
					6 :
						begin
						iaddr <= num + 128;
						temp[index3] <= 0;
						end
					7 :
						begin
						iaddr <= num + 129;
						temp[index3] <= idata;
						end
					8 :
						begin
						iaddr <= num - 128;
						temp[index3] <= idata;
						end
					default :
						begin
						temp[index3] <= 0;
						iaddr <= num - 128;
						end
				endcase
				end
			else if ((row > 0) && (column == 127)) // OK middle row, last column 
				begin
				case (index3)
					0 :
						begin
						iaddr <= num - 128;
						temp[index3] <= idata;
						end
					1 :
						begin
						iaddr <= num - 127;
						temp[index3] <= idata;
						end
					2 :
						begin
						iaddr <= num - 1;
						temp[index3] <= 0;
						end
					3 :
						begin
						iaddr <= num;
						temp[index3] <= idata;
						end
					4 :
						begin
						iaddr <= num;
						temp[index3] <= idata;
						end
					5 :
						begin
						iaddr <= num + 127;
						temp[index3] <= 0;
						end
					6 :
						begin
						iaddr <= num + 128;
						temp[index3] <= idata;
						end
					7 :
						begin
						iaddr <= num + 129;
						temp[index3] <= idata;
						end
					default :
						begin
						temp[index3] <= 0;
						//iaddr <= num - 1;
						end
				endcase
				end
			else if ((row == 127) && (column > 0)) // OK last row, middle column 
				begin
				case (index3)
					0 :
						begin
						iaddr <= num - 128;
						temp[index3] <= idata;
						end
					1 :
						begin
						iaddr <= num - 127;
						temp[index3] <= idata;
						end
					2 :
						begin
						iaddr <= num - 1;
						temp[index3] <= idata;
						end
					3 :
						begin
						iaddr <= num;
						temp[index3] <= idata;
						end
					4 :
						begin
						iaddr <= num + 1;
						temp[index3] <= idata;
						end
					5 :
						begin
						iaddr <= num + 126;
						temp[index3] <= idata;
						end
					default :
						begin
						temp[index3] <= 0;
						iaddr <= num - 128;
						end
				endcase
				end
			else //  OK
				begin
				case (index3)
					0 :
						begin
						iaddr <= num - 128;
						temp[index3] <= idata;
						end
					1 :
						begin
						iaddr <= num - 127;
						temp[index3] <= idata;
						end
					2 :
						begin
						iaddr <= num - 1;
						temp[index3] <= idata;
						end
					3 :
						begin
						iaddr <= num;
						temp[index3] <= idata;
						end
					4 :
						begin
						iaddr <= num + 1;
						temp[index3] <= idata;
						end
					5 :
						begin
						iaddr <= num + 127;
						temp[index3] <= idata;
						end
					6 :
						begin
						iaddr <= num + 128;
						temp[index3] <= idata;
						end
					7 :
						begin
						iaddr <= num + 129;
						temp[index3] <= idata;
						end
					8 :
						begin
						iaddr <= num - 128;
						temp[index3] <= idata;
						end
					default :
						begin
						temp[index3] <= 0;
						//iaddr <= num - 129;
						end
				endcase
				end
			end
		S1: // find median using bubble sort.
			begin
			if (temp[index] > temp[index+1])
				begin
				// point_1 larger than point_2, swap
				temp[index] <= temp[index+1];
				temp[index] <= temp[index+1];
				temp[index+1] <= temp[index];
				temp[index+1] <= temp[index];
				end
			end
		S2: // output resulted image to 'result memory'.
			begin
			wen <= 1;
			addr <= num - 1;
			data_wr <= temp[4];
			end
	endcase
	end

endmodule




