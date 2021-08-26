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

reg [14:0] counter, num; // 0 -> 16383 (inclusive) SUM(1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192) = 16383
reg [6:0] row, column; // max 127
reg [7:0] temp [0:8]; // store each patch data.
reg [7:0] sram [0:16383]; // reg [DATA_WIDTH-1 : 0] ram [2** ADDR_WIDTH-1 : 0]
reg recount;
reg [3:0] index, index2;
// Declare state register
reg	[1:0] state, nxt_state;


reg [7:0] res [0:16385];
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
			if (counter == 16385)
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
			nxt_state = S2;
			recount = 1;
			end
		S2:
			begin
			if (num == 16385)
				begin
				nxt_state = S3;
				recount = 1;
				end
			else if (index2 == 7)
				begin
				nxt_state = S1;
				recount = 1;
				end
			else
				begin
				nxt_state = S2;
				recount = 0;
				end
			end
		S3:
			begin
			if (counter == 16384)
				begin
				nxt_state = S1;
				recount = 1;
				end
			else
				begin
				nxt_state = S3;
				recount = 0;
				end
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
			S2 :
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
		if (state == S3 && counter == 16384)
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
	S1 :
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

// Counter
always @(posedge clk)
	begin
	if (reset || recount)
		begin
		counter <= 0;
		end
	else
		begin
		counter <= counter + 1;
		end
	end

/*********************************************************************
	Datapath
*********************************************************************/
// Datapath 
always @(posedge clk)
	begin
	case (state)
		S0: // read pixel value
			begin
			iaddr <= counter;
			sram[counter-1] <= idata;
			end
		S1: // zero padding, divided into 9 cases, different padding method for each case. 
			begin
			if ((row == 0) && (column == 0)) // first row, first column
				begin
				temp[0] <= 0;
				temp[1] <= 0;
				temp[2] <= 0;
				temp[3] <= 0;
				temp[4] <= sram[0];
				temp[5] <= sram[1];
				temp[6] <= 0;
				temp[7] <= sram[128];
				temp[8] <= sram[129];
				end
			else if ((row == 0) && (column == 127)) // first row, last column 
				begin
				temp[0] <= 0;
				temp[1] <= 0;
				temp[2] <= 0;
				temp[3] <= sram[126];
				temp[4] <= sram[127];
				temp[5] <= 0;
				temp[6] <= sram[254];
				temp[7] <= sram[255];
				temp[8] <= 0;
				end
			else if ((row == 127) && (column == 0)) // last row, first column 
				begin
				temp[0] <= 0;
				temp[1] <= sram[16128];
				temp[2] <= sram[16129];
				temp[3] <= 0;
				temp[4] <= sram[16256];
				temp[5] <= sram[16257];
				temp[6] <= 0;
				temp[7] <= 0;
				temp[8] <= 0;
				end
			else if ((row == 127) && (column == 127)) // last row, last column 
				begin
				temp[0] <= sram[16254];
				temp[1] <= sram[16255];
				temp[2] <= 0;
				temp[3] <= sram[16382];
				temp[4] <= sram[16383];
				temp[5] <= 0;
				temp[6] <= 0;
				temp[7] <= 0;
				temp[8] <= 0;
				end
			else if ((row == 0) && (column > 0)) // first row, middle column 
				begin
				temp[0] <= 0;
				temp[1] <= 0;
				temp[2] <= 0;
				temp[3] <= sram[num - 1];
				temp[4] <= sram[num];
				temp[5] <= sram[num + 1];
				temp[6] <= sram[num + 127];
				temp[7] <= sram[num + 128];
				temp[8] <= sram[num + 129];
				end
			else if ((row > 0) && (column == 0)) // first column, middle row
				begin
				temp[0] <= 0;
				temp[1] <= sram[num - 128];
				temp[2] <= sram[num - 127];
				temp[3] <= 0;
				temp[4] <= sram[num];
				temp[5] <= sram[num + 1];
				temp[6] <= 0;
				temp[7] <= sram[num + 128];
				temp[8] <= sram[num + 129];
				end
			else if ((row > 0) && (column == 127)) // last column, middle row 
				begin
				temp[0] <= sram[num - 129];
				temp[1] <= sram[num - 128];
				temp[2] <= 0;
				temp[3] <= sram[num - 1];
				temp[4] <= sram[num];
				temp[5] <= 0;
				temp[6] <= sram[num + 127];
				temp[7] <= sram[num + 128];
				temp[8] <= 0;
				end
			else if ((row == 127) && (column > 0)) // last row, middle column
				begin
				temp[0] <= sram[num - 129];
				temp[1] <= sram[num - 128];
				temp[2] <= sram[num - 127];
				temp[3] <= sram[num - 1];
				temp[4] <= sram[num];
				temp[5] <= sram[num + 1];
				temp[6] <= 0;
				temp[7] <= 0;
				temp[8] <= 0;
				end
			else // no padding needed
				begin
				temp[0] <= sram[num - 129];
				temp[1] <= sram[num - 128];
				temp[2] <= sram[num - 127];
				temp[3] <= sram[num - 1];
				temp[4] <= sram[num];
				temp[5] <= sram[num + 1];
				temp[6] <= sram[num + 127];
				temp[7] <= sram[num + 128];
				temp[8] <= sram[num + 129];
				end
			end
		S2: // find median using bubble sort.
			begin
			if (temp[index] > temp[index+1])
				begin
				// point_1 larger than point_2, swap
				temp[index] <= temp[index+1];
				temp[index] <= temp[index+1];
				temp[index+1] <= temp[index];
				temp[index+1] <= temp[index];
				end
			if (index2 == 7)
				begin
				res[num-1] = temp[4];
				end
			end
		S3: // output resulted image to 'result memory'.
			begin
			if (counter < 16384)
				begin
				wen <= 1;
				addr <= counter;
				data_wr <= res[counter];
				end
			end
	endcase
	end

endmodule




