module booth(out, in1, in2);

parameter width = 6;

input [width-1:0] in1;   //multiplicand
input [width-1:0] in2;   //multiplier
output [2*width-1:0] out; //product

reg signed [2*width:0] p, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12;

always @(in1 or in2)
begin
	p = {6'b000000, in2, 1'b0};
	
	case(p[1:0])
		2'b01 : w1 = {p[12:7]+in1,p[6:1],p[0]};
		2'b10 : w1 = {p[12:7]-in1,p[6:1],p[0]};
		default : w1 = p;
	endcase
	w2 = w1 >>> 1;
	case(w2[1:0])
		2'b01 : w3 = {w2[12:7]+in1,w2[6:1],w2[0]};
		2'b10 : w3 = {w2[12:7]-in1,w2[6:1],w2[0]};
		default : w3 = w2;
	endcase
	w4 = w3 >>> 1;
	case(w4[1:0])
		2'b01 : w5 = {w4[12:7]+in1,w4[6:1],w4[0]};
		2'b10 : w5 = {w4[12:7]-in1,w4[6:1],w4[0]};
		default : w5 = w4;
	endcase
	w6 = w5 >>> 1;
	case(w6[1:0])
		2'b01 : w7 = {w6[12:7]+in1,w6[6:1],w6[0]};
		2'b10 : w7 = {w6[12:7]-in1,w6[6:1],w6[0]};
		default : w7 = w6;
	endcase
	w8 = w7 >>> 1;
	case(w8[1:0])
		2'b01 : w9 = {w8[12:7]+in1,w8[6:1],w8[0]};
		2'b10 : w9 = {w8[12:7]-in1,w8[6:1],w8[0]};
		default : w9 = w8;
	endcase
	w10 = w9 >>> 1;
	case(w10[1:0])
		2'b01 : w11 = {w10[12:7]+in1,w10[6:1],w10[0]};
		2'b10 : w11 = {w10[12:7]-in1,w10[6:1],w10[0]};
		default : w11 = w10;
	endcase	
	w12 = w11 >>> 1;
end

assign out = w12[12:1];

endmodule
