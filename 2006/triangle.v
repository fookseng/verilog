module triangle
(
input             clk, 
input             reset, 
input             nt, 
input       [2:0] xi, 
input       [2:0] yi, 
output reg        busy, 
output reg        po, 
output reg  [2:0] xo, 
output reg  [2:0] yo
);  

reg         [2:0] Xcoor[0:2];
reg         [2:0] Ycoor[0:2];
reg         [1:0] counter;
wire        [5:0] flag;
reg         [5:0] temp; 
reg         [2:0] x, x1, y2, y1;
reg         [1:0] cur_state;
reg         [1:0] nxt_state;
localparam  input_state=0, calculation_state_1=1, calculation_state_2=3, point_in_triangle=2;

//------------------------ FSM, 2c1s design style----------------------
//---------------------------------------------------------------------
always@(posedge clk, posedge reset)
begin
   if(reset)
      begin
         cur_state <= input_state;
      end
   else 
      begin
         cur_state <= nxt_state;
      end
end

always@(*)
begin
   case(cur_state)
      input_state:
         begin
            if(counter == 2)
               begin
                  nxt_state = calculation_state_1;
               end
            else 
               begin
                  nxt_state = input_state;
               end
         end
      calculation_state_1:
         begin
            nxt_state = calculation_state_2;
         end
      calculation_state_2:
         begin
            nxt_state = point_in_triangle;
         end
      point_in_triangle:
         begin
            if(yo == Ycoor[2] && xo == Xcoor[2])
               begin
                  nxt_state = input_state;
               end
            else 
                begin
                  nxt_state = calculation_state_1;
                end
         end
   endcase
end

always@(*)
begin
   busy = counter[1];
   po = 0;
   if(cur_state == point_in_triangle)
      begin
         if(Xcoor[0] < Xcoor[1]) // first type of triangle, as shown in figure 3.
            begin
               if(temp <= flag) // point lies in the RHS of the line
                  begin
                     po = 1;
                  end
            end
         else // Second type of triangle, as shown in figure 4.
            begin
               if(temp >= flag || xo == Xcoor[0]) // point lies in the RHS of the line
                  begin
                     po = 1;
                  end
            end
      end
end
//-------------------Datapath-----------------------
//--------------------------------------------------

/* Must consider the case where Negative number occurs.
   Min(x-x1) = -7, Max(y2-y1) = 6
   Min(flag) = -42
   Therefore, 7bits are needed.(1 signed bit + 6-bits)
   OR
   6-bits are needed if using 2's complement.
*/
assign flag = (x-x1)*(y2-y1) ; 

always@(posedge clk, posedge reset)
begin
   if(reset)
      begin
         counter <= 0;
      end
   else 
      begin
         case(cur_state)
            input_state:
               begin
                  Xcoor[counter] <= xi;
                  Ycoor[counter] <= yi;
                  xo <= Xcoor[0];
                  yo <= Ycoor[0];
                  if(nt)
                     begin
                        counter <= 1;                        
                     end
                  else if(counter == 1)
                     begin
                        counter <= 2;
                     end
               end
            calculation_state_1: // equation = (x-x1)*(y2-y1)
               begin
                  if(yo <= Ycoor[1]) // bottom line
                     begin
                        x <= xo;
                        x1 <= Xcoor[0];
                        y2 <= Ycoor[1];
                        y1 <= Ycoor[0];
                     end
                  else  // upper line
                     begin
                        x <= xo;
                        x1 <= Xcoor[1];
                        y2 <= Ycoor[2];
                        y1 <= Ycoor[1];
                     end
               end
            calculation_state_2: // equation = (x2-x1)*(y-y1)
               begin
                  temp <= flag; // save previous result
                  if(yo <= Ycoor[1]) // bottom line
                     begin
                        x <= Xcoor[1];
                        x1 <= Xcoor[0];
                        y2 <= yo;
                        y1 <= Ycoor[0];
                     end 
                  else  // upper line
                     begin
                        x <= Xcoor[2];
                        x1 <= Xcoor[1];
                        y2 <= yo;
                        y1 <= Ycoor[1];
                     end
               end
            point_in_triangle:
               begin
                  if(Xcoor[0] < Xcoor[1]) // first type of triangle, as shown in figure 3.
                     begin
                        if(temp > flag) // point lies in the RHS of the line
                           begin
                              yo <= yo + 1; 
                              xo <= Xcoor[0];
                           end
                        else 
                           begin
                              xo <= xo + 1;
                           end
                     end
                  else // Second type of triangle, as shown in figure 4.
                     begin
                        if(xo == Xcoor[0]) // point lies in the LHS of the line
                           begin
                              yo <= yo + 1;
                              xo <= Xcoor[1]; 
                           end
                        else 
                           begin
                              xo <= xo + 1;
                           end
                     end
                  if(yo == Ycoor[2] && xo == Xcoor[2])
                     begin
                        counter <= 0; // counter = 0 will set busy to 0.
                     end
               end
         endcase
      end
end


endmodule