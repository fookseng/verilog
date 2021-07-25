module HA(s, c, x, y);

input x, y;
output s, c;

xor U1 (s, x, y);
and U2 (c, x, y);
  
endmodule
