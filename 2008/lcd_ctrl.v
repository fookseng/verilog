 module LCD_CTRL
 #(parameter width = 12, height = 9)
(
input           clk,
input           reset, 
input  [7:0]    datain, 
input  [2:0]    cmd, // cmd_valid=1, busy=0
input           cmd_valid, 
output [7:0]    dataout, 
output reg      output_valid, 
output reg      busy
);

reg [7:0]   image [0:width*height-1]; // 0~107
reg [6:0]   counter;
reg [3:0]   counter_2; // count total valid output for each cmd

reg [1:0]   cur_state;
reg [1:0]   nxt_state;
reg [1:0]   prev_state; 
localparam nxt_cmd=3, load_data=0, zoom_fit=2, zoom_in=1;

//------------------FSM-------------------
//----------------- 2C1S------------------
always@(posedge clk, posedge reset)
begin
    if(reset)
        begin
            cur_state <= nxt_cmd;
        end
    else 
        begin
            cur_state <= nxt_state;
        end
end

always@(*)
begin
    case(cur_state)
        nxt_cmd:
            begin
                if(cmd_valid && cmd == 2) // zoom fit
                    begin
                        nxt_state = zoom_fit;
                    end
                else if(cmd_valid && cmd == 1) // zoom in
                    begin
                        nxt_state = zoom_in;
                    end
                else if(cmd_valid && cmd == 0) // load data
                    begin
                        nxt_state = load_data;
                    end
                else if(cmd_valid)
                    begin
                        nxt_state = prev_state;
                    end
                else 
                    begin
                        nxt_state = nxt_cmd;
                    end
            end
        load_data:
            begin
                if(counter == 107)
                    begin
                        nxt_state = zoom_fit;
                    end
                else 
                    begin
                        nxt_state = load_data;
                    end
            end
        zoom_fit:
            begin
                if(counter == 94)
                    begin
                        nxt_state = nxt_cmd;
                    end
                else 
                    begin
                        nxt_state = zoom_fit;
                    end
            end
        zoom_in:
            begin
                if(counter_2 == 15)
                    begin
                        nxt_state = nxt_cmd;
                    end
                else 
                    begin
                        nxt_state = zoom_in;
                    end
            end
    endcase
end

always@(*)
begin
    busy = 1;
    output_valid = 0;
    case(cur_state)
        nxt_cmd:
            begin
                busy = 0;
                output_valid = 0;
            end
        zoom_fit, zoom_in:
            begin
                busy = 1;
                output_valid = 1;
            end
    endcase
end

//--------------- Datapath-----------------
//-----------------------------------------
assign dataout = image[counter];

always@(posedge clk)
begin
    case(cur_state)
        nxt_cmd:
            begin
                counter_2 <= 0;
                casez({prev_state, cmd}) // 2+3 bits
                    5'b??000: // Load data
                        begin
                            counter <= 0;
                        end
                    5'b10001: // zoom fit -> zoom in
                        begin
                            counter <= 40;
                        end
                    5'b01001: // zoom in -> zoom in
                        begin
                            counter <= counter - 39; 
                        end
                    5'b01011:
                        begin
                            if(counter != 47 && counter != 59 && counter != 71 && counter != 83 && counter != 95 && counter != 107)
                                begin
                                    counter <= counter - 38;
                                end
                            else 
                                begin
                                    counter <= counter - 39;
                                end
                        end
                    5'b01100:
                        begin
                            if(counter != 39 && counter != 51 && counter != 63 && counter != 75 && counter != 87 && counter != 99)
                                begin
                                    counter <= counter - 40;
                                end    
                            else 
                                begin
                                    counter <= counter - 39;
                                end                                
                        end
                    5'b01101:
                        begin
                            //if(counter > 47) // correct but larger area, not sure why?!
                            if(counter != 39 && counter != 40 && counter != 41 && counter != 42 && counter != 43 && counter != 44 && counter != 45 && counter != 46 && counter != 47)

                                begin
                                    counter <= counter - 51;
                                end      
                            else 
                                begin
                                    counter <= counter - 39;
                                end                              
                        end
                    5'b01110:
                        begin
                            if(counter <= 95)
                                begin
                                    counter <= counter - 27;
                                end   
                            else 
                                begin
                                    counter <= counter - 39;
                                end                                 
                        end
                    5'b??010, 5'b10???: // Zoom fit
                        begin
                            counter <= 13;
                        end
                endcase
            end
        load_data:
            begin
                image[counter] <= datain;
                counter <= counter + 1;
                if(counter == 107)
                    begin
                        counter <= 13;
                    end
            end
        zoom_fit:
            begin
                prev_state <= 2;
                case(counter)
                    13: counter <= 16;
                    16: counter <= 19;
                    19: counter <= 22;
                    22: counter <= 37;
                    37: counter <= 40;
                    40: counter <= 43;
                    43: counter <= 46;
                    46: counter <= 61;
                    61: counter <= 64;
                    64: counter <= 67;
                    67: counter <= 70;
                    70: counter <= 85;
                    85: counter <= 88;
                    88: counter <= 91;
                    91: counter <= 94;
                endcase
            end
        zoom_in:
            begin
                prev_state <= 1;
                counter_2 <= counter_2 + 1;
                if(counter_2[1:0] == 2'b11 && ~&counter_2) // 3,7,11
                    begin
                        counter <= counter+9;
                    end
                else if(counter_2 <= 14)
                    begin
                        counter <= counter+1;
                    end
                // case(counter_2)
                //     0,1,2,4,5,6,8,9,10,12,13,14: counter <= counter+1;
                //     3, 7, 11: counter <= counter+9;
                // endcase
            end
    endcase
end
endmodule 