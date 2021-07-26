module booth(out, in1, in2);

parameter width = 6;

input [width-1:0] in1;   //multiplicand
input [width-1:0] in2;   //multiplier
output  [2*width-1:0] out; //product

reg [2*width:0] p;
reg [2:0] counter; // loop 6 times

always @(in1 or in2)
begin
	p = {6'b000000, in2, 1'b0};
	counter = width;
	$display("in1 = %b", in1);	
	$display("in2 = %b", in2);	
	$display("p = %b", p);	
	$display("counter = %b", counter);	
	while(counter)
		begin
		$display("counter = %b", counter);	
		case(p[1:0])
			2'b01 : p = {p[12:7]+in1,p[6:1],p[0]};
			2'b10 : p = {p[12:7]-in1,p[6:1],p[0]};
			default : p = p ;
		endcase
		$display("p = %b", p);	
		p = {p[12],p[12],p[11],p[10],p[9],p[8],p[7],p[6],p[5],p[4],p[3],p[2],p[1]}; // shift right algebraic
		$display("p = %b", p);	
		counter = counter - 1;			
		end
	$display("counter_last = %b", counter);	
end

assign out = p[12:1];

endmodule
