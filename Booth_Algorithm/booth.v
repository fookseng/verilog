module booth(out, in1, in2);

parameter width = 6;

input [width-1:0] in1;   //multiplicand
input [width-1:0] in2;   //multiplier
output  [2*width-1:0] out; //product

reg [2*width:0] p;

always @(in1 or in2)
begin
	p = {6'b000000, in2, 1'b0};
	
	case(p[1:0])
		2'b01 : p = {p[12:7]+in1,p[6:1],p[0]};
		2'b10 : p = {p[12:7]-in1,p[6:1],p[0]};
		default : p = p ;
	endcase
	// shift right algebraic can be done with the operator '>>>' on signed number. Since i do not declare signed number here, the following method is used instead.
	p = {p[12],p[12],p[11],p[10],p[9],p[8],p[7],p[6],p[5],p[4],p[3],p[2],p[1]}; // shift right algebraic

	case(p[1:0])
		2'b01 : p = {p[12:7]+in1,p[6:1],p[0]};
		2'b10 : p = {p[12:7]-in1,p[6:1],p[0]};
		default : p = p ;
	endcase
	p = {p[12],p[12],p[11],p[10],p[9],p[8],p[7],p[6],p[5],p[4],p[3],p[2],p[1]};

	case(p[1:0])
		2'b01 : p = {p[12:7]+in1,p[6:1],p[0]};
		2'b10 : p = {p[12:7]-in1,p[6:1],p[0]};
		default : p = p ;
	endcase
	p = {p[12],p[12],p[11],p[10],p[9],p[8],p[7],p[6],p[5],p[4],p[3],p[2],p[1]}; 

	case(p[1:0])
		2'b01 : p = {p[12:7]+in1,p[6:1],p[0]};
		2'b10 : p = {p[12:7]-in1,p[6:1],p[0]};
		default : p = p ;
	endcase
	p = {p[12],p[12],p[11],p[10],p[9],p[8],p[7],p[6],p[5],p[4],p[3],p[2],p[1]}; 

	case(p[1:0])
		2'b01 : p = {p[12:7]+in1,p[6:1],p[0]};
		2'b10 : p = {p[12:7]-in1,p[6:1],p[0]};
		default : p = p ;
	endcase
	p = {p[12],p[12],p[11],p[10],p[9],p[8],p[7],p[6],p[5],p[4],p[3],p[2],p[1]};

	case(p[1:0])
		2'b01 : p = {p[12:7]+in1,p[6:1],p[0]};
		2'b10 : p = {p[12:7]-in1,p[6:1],p[0]};
		default : p = p ;
	endcase
	p = {p[12],p[12],p[11],p[10],p[9],p[8],p[7],p[6],p[5],p[4],p[3],p[2],p[1]};
end

assign out = p[12:1];

endmodule
