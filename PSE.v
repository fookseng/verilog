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
reg [9:0] x_coor [2:0];
reg [9:0] y_coor [2:0];
reg [1:0] state, nxt_state;
reg [2:0] count;

parameter state_a = 2'b00,
          state_b = 2'b01,
          state_c = 2'b11,    

always @(posedge clk)
	begin
	if (reset)
		begin
		state <= state_a;
		end	
	else
		begin
		state <= nxt_state;
		end
	end	

// store x,y coordinates
always @(posedge clk)
	begin:
	x_coor[point_num] <= Xin ;
	y_coor[point_num] <= Yin ;
	end

always @(posedge clk)
	begin: first_block

	case (state)
	state_a :
		begin
		valid <= 0;
		count <= point_num;
		end
	state_b :
	state_c :
	
		begin
		// valid signal = 0
		valid <= 0;
		// number of points to be sorted

		// input (x,y) coordinates
		repeat(point_num)
			begin
			x_coor[point_num] <= Xin ;
			y_coor[point_num] <= Yin ;
			end
		
		end
	else	
		begin
		// calculation 
		// output (x,y) coordinates
		// valid signal = 1
		valid <= 1 ;
		end
	end


endmodule

module cross_product(x0_in, y0_in, x1_in, y1_in, x2_in, y2_in, out);

input [9:0] x0_in, y0_in, x1_in, y1_in, x2_in, y2_in;
output [19:0] out;

reg [9:0] ax, ay, bx, by;
reg [19:0] w1, w2, w3;

always @(x0_in, y0_in, x1_in, y1_in, x2_in, y2_in)
	begin
	ax = x1_in - x0_in;
	bx = x2_in - x0_in;
	ay = y1_in - y0_in;
	by = y2_in - y0_in;

	w1 =  ax * by;
	w2 =  bx * ay;

	w3 = w1 - w2 ;

	end
assign out = w3;

endmodule

module booth(out, in1, in2);

parameter width = 10;

input [width-1:0] in1;   //multiplicand
input [width-1:0] in2;   //multiplier
output  [2*width-1:0] out; //product

reg [2*width:0] p;
reg [3:0] counter;
reg [width-1:0] in1, in2;

always @(in1 or in2)
begin
	in1 = ~in1 +1; //2's complement
	in2 = ~in2 +1;

	p = {10'b0, in2, 1'b0};
	counter = width;
	while(counter)
		begin
		case(p[1:0])
			2'b01 : p = {p[12:7]+in1,p[6:1],p[0]};
			2'b10 : p = {p[12:7]-in1,p[6:1],p[0]};
			default : p = p ;
		endcase
		p = {p[12],p[12],p[11],p[10],p[9],p[8],p[7],p[6],p[5],p[4],p[3],p[2],p[1]}; // shift right algebraic
		counter = counter - 1;			
		end
end

assign out = p[12:1];

//$display("counter_last = %b", counter);	

endmodule