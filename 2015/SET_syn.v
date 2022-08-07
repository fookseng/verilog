/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Sun Aug  7 18:14:07 2022
/////////////////////////////////////////////////////////////


module SET_DW01_inc_0_DW01_inc_2 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2XL U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  INVXL U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module SET_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5;
  wire   [7:1] carry;

  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(n1), .CO(carry[3]), .S(SUM[2]) );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(SUM[7]), .S(SUM[6]) );
  XOR3X1 U1 ( .A(A[5]), .B(B[5]), .C(carry[5]), .Y(SUM[5]) );
  AND2X2 U2 ( .A(B[1]), .B(n5), .Y(n1) );
  NAND2X1 U3 ( .A(B[5]), .B(carry[5]), .Y(n4) );
  NAND3X1 U4 ( .A(n2), .B(n3), .C(n4), .Y(carry[6]) );
  NAND2XL U5 ( .A(carry[5]), .B(A[5]), .Y(n2) );
  NAND2XL U6 ( .A(B[5]), .B(A[5]), .Y(n3) );
  AND2XL U7 ( .A(B[0]), .B(A[0]), .Y(n5) );
  XOR2XL U8 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  XOR2X1 U9 ( .A(B[1]), .B(n5), .Y(SUM[1]) );
endmodule


module SET ( clk, rst, en, central, radius, mode, busy, valid, candidate );
  input [23:0] central;
  input [11:0] radius;
  input [1:0] mode;
  output [7:0] candidate;
  input clk, rst, en;
  output busy, valid;
  wire   n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, inA, inB,
         inC, N178, N179, N180, N181, N182, N183, N184, N185, N186, N253, N254,
         N255, N256, N257, N258, N259, N260, N318, N319, N320, N321, n39, n40,
         n42, n43, n44, n46, n47, n51, n55, n57, n58, n60, n61, n62, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n101, n102, n103, n104, n105, n106, n107, n108,
         n110, n111, n112, n113, n114, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n150, n151, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, \mult_124/n13 ,
         \mult_124/n12 , \mult_124/n11 , \mult_124/n10 , \mult_124/n9 ,
         \mult_124/n7 , \mult_124/n6 , \mult_124/n5 , \mult_124/n4 ,
         \mult_124/n3 , \mult_124/n2 , n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n233, n235, n237, n239, n241, n243, n245, n247,
         n249, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337;
  wire   [3:0] cur_state;
  wire   [3:0] nxt_state;
  wire   [3:0] x;
  wire   [3:0] y;
  wire   [3:0] difference;
  wire   [6:0] product;
  wire   [3:0] minuend;
  wire   [3:0] subtrahend;
  wire   [6:0] product_B;
  wire   [6:0] product_A;

  SET_DW01_inc_0_DW01_inc_2 r418 ( .A({n340, n341, n342, n343, n344, n345, 
        n346, n347}), .SUM({N260, N259, N258, N257, N256, N255, N254, N253})
         );
  SET_DW01_add_0 r416 ( .A({1'b0, product[6:2], 1'b0, product[0]}), .B({1'b0, 
        product_B}), .CI(1'b0), .SUM({N185, N184, N183, N182, N181, N180, N179, 
        N178}) );
  ADDHXL \mult_124/U7  ( .A(difference[2]), .B(\mult_124/n11 ), .CO(
        \mult_124/n6 ), .S(\mult_124/n7 ) );
  EDFFX1 \product_A_reg[3]  ( .D(product[3]), .E(n316), .CK(clk), .QN(n310) );
  EDFFX1 \product_A_reg[1]  ( .D(1'b0), .E(n316), .CK(clk), .QN(n309) );
  EDFFX1 \product_A_reg[0]  ( .D(product[0]), .E(n316), .CK(clk), .QN(n308) );
  EDFFX1 \product_A_reg[2]  ( .D(product[2]), .E(n316), .CK(clk), .Q(
        product_A[2]) );
  EDFFX1 \product_A_reg[6]  ( .D(product[6]), .E(n316), .CK(clk), .Q(
        product_A[6]), .QN(n229) );
  EDFFX1 \product_B_reg[6]  ( .D(product[6]), .E(n223), .CK(clk), .Q(
        product_B[6]) );
  DFFRX1 inC_reg ( .D(n166), .CK(clk), .RN(n269), .Q(inC) );
  DFFRX1 \y_reg[3]  ( .D(n177), .CK(clk), .RN(n270), .Q(y[3]), .QN(n57) );
  DFFRX1 \x_reg[3]  ( .D(n172), .CK(clk), .RN(n269), .Q(x[3]) );
  DFFSX1 \y_reg[0]  ( .D(n178), .CK(clk), .SN(n270), .Q(y[0]), .QN(n60) );
  DFFRX1 inA_reg ( .D(n174), .CK(clk), .RN(n270), .Q(inA), .QN(n47) );
  DFFRX1 \x_reg[1]  ( .D(n168), .CK(clk), .RN(n270), .Q(x[1]), .QN(n43) );
  DFFRX1 \x_reg[2]  ( .D(n167), .CK(clk), .RN(n269), .Q(x[2]), .QN(n42) );
  DFFSX1 \x_reg[0]  ( .D(n169), .CK(clk), .SN(n270), .Q(x[0]), .QN(n44) );
  EDFFX1 \product_A_reg[5]  ( .D(product[5]), .E(n316), .CK(clk), .QN(n311) );
  EDFFX1 \product_A_reg[4]  ( .D(product[4]), .E(n316), .CK(clk), .Q(
        product_A[4]) );
  DFFRX1 \cur_state_reg[0]  ( .D(nxt_state[0]), .CK(clk), .RN(n270), .Q(
        cur_state[0]), .QN(n224) );
  DFFRX1 \cur_state_reg[1]  ( .D(nxt_state[1]), .CK(clk), .RN(n270), .Q(
        cur_state[1]), .QN(n40) );
  EDFFX1 \product_B_reg[5]  ( .D(product[5]), .E(n223), .CK(clk), .Q(
        product_B[5]) );
  EDFFX1 \product_B_reg[4]  ( .D(product[4]), .E(n223), .CK(clk), .Q(
        product_B[4]) );
  EDFFX1 \product_B_reg[3]  ( .D(product[3]), .E(n223), .CK(clk), .Q(
        product_B[3]) );
  EDFFX1 \product_B_reg[0]  ( .D(product[0]), .E(n223), .CK(clk), .Q(
        product_B[0]) );
  EDFFX1 \product_B_reg[2]  ( .D(product[2]), .E(n223), .CK(clk), .Q(
        product_B[2]) );
  EDFFX1 \minuend_reg[3]  ( .D(N321), .E(n317), .CK(clk), .QN(n61) );
  DFFRX1 \y_reg[1]  ( .D(n171), .CK(clk), .RN(n270), .Q(y[1]) );
  DFFRX1 \y_reg[2]  ( .D(n170), .CK(clk), .RN(n270), .Q(y[2]), .QN(n58) );
  DFFRX1 \cur_state_reg[2]  ( .D(nxt_state[2]), .CK(clk), .RN(n270), .Q(
        cur_state[2]), .QN(n39) );
  DFFQX1 \subtrahend_reg[1]  ( .D(n176), .CK(clk), .Q(subtrahend[1]) );
  DFFQX1 \subtrahend_reg[3]  ( .D(n175), .CK(clk), .Q(subtrahend[3]) );
  EDFFX1 \minuend_reg[1]  ( .D(N319), .E(n317), .CK(clk), .Q(minuend[1]), .QN(
        n62) );
  DFFRX1 inB_reg ( .D(n173), .CK(clk), .RN(n270), .Q(inB), .QN(n46) );
  EDFFX1 \minuend_reg[0]  ( .D(N318), .E(n317), .CK(clk), .Q(minuend[0]), .QN(
        n254) );
  EDFFX1 \minuend_reg[2]  ( .D(N320), .E(n317), .CK(clk), .Q(minuend[2]), .QN(
        n252) );
  EDFFX1 \subtrahend_reg[0]  ( .D(n228), .E(n317), .CK(clk), .Q(n255), .QN(n55) );
  EDFFX1 \subtrahend_reg[2]  ( .D(n227), .E(n317), .CK(clk), .Q(n253), .QN(n51) );
  DFFRX1 \candidate_reg[0]  ( .D(n164), .CK(clk), .RN(n269), .Q(n347), .QN(
        n249) );
  DFFRX1 \candidate_reg[7]  ( .D(n165), .CK(clk), .RN(n269), .Q(n340), .QN(
        n247) );
  DFFRX1 \candidate_reg[6]  ( .D(n158), .CK(clk), .RN(n269), .Q(n341), .QN(
        n245) );
  DFFRX1 \candidate_reg[5]  ( .D(n159), .CK(clk), .RN(n269), .Q(n342), .QN(
        n243) );
  DFFRX1 \candidate_reg[4]  ( .D(n160), .CK(clk), .RN(n269), .Q(n343), .QN(
        n241) );
  DFFRX1 \candidate_reg[3]  ( .D(n161), .CK(clk), .RN(n269), .Q(n344), .QN(
        n239) );
  DFFRX1 \candidate_reg[2]  ( .D(n162), .CK(clk), .RN(n269), .Q(n345), .QN(
        n237) );
  DFFRX1 busy_reg ( .D(n156), .CK(clk), .RN(n269), .Q(n338), .QN(n235) );
  DFFRX1 valid_reg ( .D(n157), .CK(clk), .RN(n269), .Q(n339), .QN(n233) );
  DFFRX1 \candidate_reg[1]  ( .D(n163), .CK(clk), .RN(n269), .Q(n346), .QN(
        n231) );
  DFFQXL \product_B_reg[1]  ( .D(n230), .CK(clk), .Q(product_B[1]) );
  DFFRX1 \cur_state_reg[3]  ( .D(nxt_state[3]), .CK(clk), .RN(n318), .Q(
        cur_state[3]), .QN(n293) );
  AOI21X2 U198 ( .A0(n337), .A1(n226), .B0(n335), .Y(n154) );
  NAND2X2 U199 ( .A(n260), .B(n261), .Y(difference[1]) );
  AOI21X2 U200 ( .A0(n67), .A1(n101), .B0(rst), .Y(n223) );
  OR2X1 U201 ( .A(n254), .B(n255), .Y(n225) );
  AOI21X2 U202 ( .A0(n252), .A1(n253), .B0(n335), .Y(n226) );
  NAND2X1 U203 ( .A(n110), .B(n111), .Y(n227) );
  NAND2X1 U204 ( .A(n116), .B(n117), .Y(n228) );
  NOR2BX1 U205 ( .AN(product_B[1]), .B(n223), .Y(n230) );
  INVX12 U206 ( .A(n231), .Y(candidate[1]) );
  INVX12 U207 ( .A(n233), .Y(valid) );
  INVX12 U208 ( .A(n235), .Y(busy) );
  OAI31X1 U209 ( .A0(n224), .A1(n267), .A2(n39), .B0(n278), .Y(n286) );
  INVX12 U210 ( .A(n237), .Y(candidate[2]) );
  INVX12 U211 ( .A(n239), .Y(candidate[3]) );
  INVX12 U212 ( .A(n241), .Y(candidate[4]) );
  INVX12 U213 ( .A(n243), .Y(candidate[5]) );
  INVX12 U214 ( .A(n245), .Y(candidate[6]) );
  INVX12 U215 ( .A(n247), .Y(candidate[7]) );
  INVX12 U216 ( .A(n249), .Y(candidate[0]) );
  ADDHX1 U217 ( .A(\mult_124/n12 ), .B(\mult_124/n5 ), .CO(\mult_124/n4 ), .S(
        product[3]) );
  OR2X1 U218 ( .A(n151), .B(n137), .Y(n261) );
  OR2X1 U219 ( .A(n55), .B(minuend[0]), .Y(n251) );
  XOR2X1 U220 ( .A(n142), .B(n226), .Y(n145) );
  NAND2X8 U221 ( .A(n258), .B(n259), .Y(n137) );
  OAI2BB1X1 U222 ( .A0N(n62), .A1N(n225), .B0(n155), .Y(n143) );
  AOI21X1 U223 ( .A0(N184), .A1(n314), .B0(N185), .Y(n296) );
  ADDFX2 U224 ( .A(\mult_124/n6 ), .B(\mult_124/n9 ), .CI(\mult_124/n3 ), .CO(
        \mult_124/n2 ), .S(product[5]) );
  INVX1 U225 ( .A(N186), .Y(n315) );
  OR2XL U226 ( .A(subtrahend[3]), .B(n61), .Y(n258) );
  OR2X4 U227 ( .A(n154), .B(n334), .Y(n259) );
  OR2X4 U228 ( .A(n333), .B(n150), .Y(n260) );
  ADDFXL U229 ( .A(\mult_124/n7 ), .B(\mult_124/n10 ), .CI(\mult_124/n4 ), 
        .CO(\mult_124/n3 ), .S(product[4]) );
  OAI22X1 U230 ( .A0(n333), .A1(n145), .B0(n137), .B1(n146), .Y(difference[2])
         );
  XOR2X1 U231 ( .A(n337), .B(n226), .Y(n146) );
  NAND3X1 U232 ( .A(n268), .B(n267), .C(n70), .Y(n75) );
  CLKINVX1 U233 ( .A(n137), .Y(n333) );
  CLKINVX1 U234 ( .A(n139), .Y(n334) );
  OAI31X1 U235 ( .A0(n137), .A1(n138), .A2(n139), .B0(n140), .Y(difference[3])
         );
  AOI21X1 U236 ( .A0(n251), .A1(minuend[1]), .B0(n262), .Y(n142) );
  OR2X1 U237 ( .A(n332), .B(n46), .Y(n256) );
  OR2X1 U238 ( .A(n315), .B(n75), .Y(n257) );
  NAND2X1 U239 ( .A(n256), .B(n257), .Y(n173) );
  INVXL U240 ( .A(n75), .Y(n332) );
  INVX1 U241 ( .A(product[0]), .Y(n273) );
  NOR2X1 U242 ( .A(n275), .B(n274), .Y(\mult_124/n11 ) );
  XOR2X1 U243 ( .A(difference[3]), .B(\mult_124/n2 ), .Y(n271) );
  CLKINVX1 U244 ( .A(difference[3]), .Y(n276) );
  CLKINVX1 U245 ( .A(N182), .Y(n313) );
  CLKINVX1 U246 ( .A(difference[1]), .Y(n274) );
  AOI22X1 U247 ( .A0(n301), .A1(N184), .B0(n301), .B1(n229), .Y(n302) );
  OAI21XL U248 ( .A0(product_A[6]), .A1(n297), .B0(n296), .Y(n307) );
  AOI22XL U249 ( .A0(y[0]), .A1(n287), .B0(x[0]), .B1(n286), .Y(n281) );
  AOI22XL U250 ( .A0(y[1]), .A1(n287), .B0(x[1]), .B1(n286), .Y(n283) );
  AOI22XL U251 ( .A0(y[2]), .A1(n287), .B0(x[2]), .B1(n286), .Y(n285) );
  AOI22XL U252 ( .A0(y[3]), .A1(n287), .B0(x[3]), .B1(n286), .Y(n292) );
  NAND2X1 U253 ( .A(minuend[2]), .B(n51), .Y(n144) );
  INVX1 U254 ( .A(n144), .Y(n335) );
  XOR2XL U255 ( .A(n251), .B(n153), .Y(n150) );
  XOR2XL U256 ( .A(n225), .B(n153), .Y(n151) );
  ADDHX1 U257 ( .A(difference[1]), .B(\mult_124/n13 ), .CO(\mult_124/n5 ), .S(
        product[2]) );
  INVX3 U258 ( .A(difference[2]), .Y(n275) );
  NOR2XL U259 ( .A(n275), .B(n276), .Y(n272) );
  OA21XL U260 ( .A0(minuend[1]), .A1(n251), .B0(n336), .Y(n262) );
  OAI211XL U261 ( .A0(n141), .A1(n335), .B0(n137), .C0(n334), .Y(n140) );
  AOI2BB1XL U262 ( .A0N(n51), .A1N(minuend[2]), .B0(n142), .Y(n141) );
  OAI21X1 U263 ( .A0(n62), .A1(n225), .B0(subtrahend[1]), .Y(n155) );
  INVXL U264 ( .A(subtrahend[1]), .Y(n336) );
  NOR4X1 U265 ( .A(n57), .B(y[0]), .C(y[1]), .D(y[2]), .Y(n123) );
  NOR2X1 U266 ( .A(cur_state[3]), .B(cur_state[2]), .Y(n77) );
  NOR2X1 U267 ( .A(n40), .B(n268), .Y(n73) );
  NOR2X1 U268 ( .A(n39), .B(cur_state[3]), .Y(n74) );
  NOR2X1 U269 ( .A(n313), .B(product_A[4]), .Y(n295) );
  OR2X1 U270 ( .A(N183), .B(n295), .Y(n264) );
  NAND3X1 U271 ( .A(n263), .B(n264), .C(n265), .Y(n297) );
  AOI2BB2XL U272 ( .B0(n143), .B1(n144), .A0N(n51), .A1N(minuend[2]), .Y(n138)
         );
  OR2XL U273 ( .A(N183), .B(n311), .Y(n263) );
  OR2X1 U274 ( .A(n295), .B(n311), .Y(n265) );
  NAND2X1 U275 ( .A(n321), .B(n324), .Y(n96) );
  INVX3 U276 ( .A(n102), .Y(n316) );
  OAI31XL U277 ( .A0(n103), .A1(n327), .A2(n330), .B0(n270), .Y(n102) );
  INVX3 U278 ( .A(n105), .Y(n317) );
  CLKINVX1 U279 ( .A(n90), .Y(n321) );
  CLKINVX1 U280 ( .A(n122), .Y(n324) );
  CLKINVX1 U281 ( .A(n71), .Y(n331) );
  CLKINVX1 U282 ( .A(n118), .Y(n330) );
  CLKINVX1 U283 ( .A(n119), .Y(n327) );
  CLKINVX1 U284 ( .A(n67), .Y(n328) );
  NOR2X1 U285 ( .A(n108), .B(n331), .Y(n101) );
  CLKINVX1 U286 ( .A(n68), .Y(n326) );
  OA21XL U287 ( .A0(n325), .A1(n324), .B0(n96), .Y(n93) );
  CLKINVX1 U288 ( .A(n124), .Y(n329) );
  CLKINVX1 U289 ( .A(n297), .Y(n314) );
  NAND2X1 U290 ( .A(n251), .B(n225), .Y(product[0]) );
  CLKINVX1 U291 ( .A(n143), .Y(n337) );
  CLKINVX1 U292 ( .A(N180), .Y(n312) );
  NOR2X2 U293 ( .A(n68), .B(n266), .Y(n85) );
  NAND2X1 U294 ( .A(n129), .B(n269), .Y(n105) );
  NAND4BX1 U295 ( .AN(n74), .B(n101), .C(n80), .D(n126), .Y(n129) );
  CLKBUFX3 U296 ( .A(n318), .Y(n269) );
  CLKBUFX3 U297 ( .A(n318), .Y(n270) );
  CLKINVX1 U298 ( .A(n277), .Y(n294) );
  OAI31X1 U299 ( .A0(n79), .A1(n323), .A2(n322), .B0(n124), .Y(n90) );
  CLKINVX1 U300 ( .A(n123), .Y(n322) );
  NOR2BX1 U301 ( .AN(n268), .B(n267), .Y(n78) );
  NOR2X1 U302 ( .A(n268), .B(n267), .Y(n83) );
  NAND2X1 U303 ( .A(n74), .B(n73), .Y(n67) );
  NAND2X1 U304 ( .A(n86), .B(n73), .Y(n68) );
  NAND2X2 U305 ( .A(n78), .B(n86), .Y(n79) );
  NOR2X1 U306 ( .A(n79), .B(n123), .Y(n122) );
  NAND2X1 U307 ( .A(n78), .B(n70), .Y(n71) );
  NAND2X1 U308 ( .A(n77), .B(n83), .Y(n124) );
  NAND2X1 U309 ( .A(n77), .B(n78), .Y(n126) );
  NAND2X1 U310 ( .A(n70), .B(n83), .Y(n118) );
  AND3X2 U311 ( .A(n268), .B(n267), .C(n77), .Y(n108) );
  NAND2X1 U312 ( .A(n77), .B(n73), .Y(n119) );
  AND4X1 U313 ( .A(n130), .B(n118), .C(n119), .D(n67), .Y(n80) );
  NAND2X1 U314 ( .A(n83), .B(n74), .Y(n130) );
  AND2X2 U315 ( .A(n78), .B(n74), .Y(n103) );
  CLKINVX1 U316 ( .A(n125), .Y(n323) );
  NAND2X1 U317 ( .A(n83), .B(n86), .Y(n66) );
  CLKINVX1 U318 ( .A(n92), .Y(n325) );
  XOR2X1 U319 ( .A(subtrahend[1]), .B(minuend[1]), .Y(n153) );
  OAI2BB2XL U320 ( .B0(n66), .B1(n315), .A0N(n66), .A1N(inC), .Y(n166) );
  OAI2BB2XL U321 ( .B0(n315), .B1(n99), .A0N(n99), .A1N(inA), .Y(n174) );
  NAND2X1 U322 ( .A(n70), .B(n73), .Y(n99) );
  XOR2X1 U323 ( .A(n61), .B(subtrahend[3]), .Y(n139) );
  AOI32X1 U324 ( .A0(n47), .A1(n320), .A2(inB), .B0(mode[0]), .B1(n135), .Y(
        n132) );
  OAI21XL U325 ( .A0(inC), .A1(n133), .B0(n136), .Y(n135) );
  OAI211X1 U326 ( .A0(inA), .A1(inB), .B0(n133), .C0(inC), .Y(n136) );
  CLKBUFX3 U327 ( .A(n84), .Y(n266) );
  AOI21X1 U328 ( .A0(n326), .A1(n131), .B0(n329), .Y(n84) );
  OAI221XL U329 ( .A0(n132), .A1(n319), .B0(mode[1]), .B1(n133), .C0(n134), 
        .Y(n131) );
  CLKINVX1 U330 ( .A(mode[1]), .Y(n319) );
  OAI22XL U331 ( .A0(n317), .A1(n336), .B0(n112), .B1(n105), .Y(n176) );
  AND2X2 U332 ( .A(n113), .B(n114), .Y(n112) );
  AOI222XL U333 ( .A0(central[5]), .A1(n330), .B0(central[9]), .B1(n328), .C0(
        central[1]), .C1(n331), .Y(n114) );
  AOI222XL U334 ( .A0(central[21]), .A1(n327), .B0(central[13]), .B1(n103), 
        .C0(central[17]), .C1(n108), .Y(n113) );
  AO22XL U335 ( .A0(candidate[0]), .A1(n266), .B0(N253), .B1(n85), .Y(n164) );
  AO22XL U336 ( .A0(candidate[6]), .A1(n266), .B0(N259), .B1(n85), .Y(n158) );
  AO22XL U337 ( .A0(candidate[5]), .A1(n266), .B0(N258), .B1(n85), .Y(n159) );
  AO22XL U338 ( .A0(candidate[4]), .A1(n266), .B0(N257), .B1(n85), .Y(n160) );
  AO22XL U339 ( .A0(candidate[3]), .A1(n266), .B0(N256), .B1(n85), .Y(n161) );
  AO22XL U340 ( .A0(candidate[2]), .A1(n266), .B0(N255), .B1(n85), .Y(n162) );
  AO22XL U341 ( .A0(candidate[1]), .A1(n266), .B0(N254), .B1(n85), .Y(n163) );
  AO22XL U342 ( .A0(candidate[7]), .A1(n266), .B0(N260), .B1(n85), .Y(n165) );
  CLKINVX1 U343 ( .A(rst), .Y(n318) );
  CLKINVX1 U344 ( .A(mode[0]), .Y(n320) );
  NAND3X1 U345 ( .A(n46), .B(n320), .C(inA), .Y(n134) );
  AOI222XL U346 ( .A0(central[4]), .A1(n330), .B0(central[8]), .B1(n328), .C0(
        central[0]), .C1(n331), .Y(n117) );
  AOI222XL U347 ( .A0(central[20]), .A1(n327), .B0(central[12]), .B1(n103), 
        .C0(central[16]), .C1(n108), .Y(n116) );
  AOI222XL U348 ( .A0(central[6]), .A1(n330), .B0(central[10]), .B1(n328), 
        .C0(central[2]), .C1(n331), .Y(n111) );
  AOI222XL U349 ( .A0(central[22]), .A1(n327), .B0(central[14]), .B1(n103), 
        .C0(central[18]), .C1(n108), .Y(n110) );
  OAI211X1 U350 ( .A0(n323), .A1(n79), .B0(n80), .C0(n81), .Y(nxt_state[0]) );
  AOI211X1 U351 ( .A0(n82), .A1(en), .B0(n326), .C0(n332), .Y(n81) );
  NOR2BX1 U352 ( .AN(n83), .B(cur_state[3]), .Y(n82) );
  OAI2BB2XL U353 ( .B0(n104), .B1(n105), .A0N(n105), .A1N(subtrahend[3]), .Y(
        n175) );
  AND2X2 U354 ( .A(n106), .B(n107), .Y(n104) );
  AOI222XL U355 ( .A0(central[7]), .A1(n330), .B0(central[11]), .B1(n328), 
        .C0(central[3]), .C1(n331), .Y(n107) );
  AOI222XL U356 ( .A0(central[23]), .A1(n327), .B0(central[15]), .B1(n103), 
        .C0(central[19]), .C1(n108), .Y(n106) );
  CLKBUFX3 U357 ( .A(cur_state[1]), .Y(n267) );
  CLKBUFX3 U358 ( .A(cur_state[0]), .Y(n268) );
  NOR2X2 U359 ( .A(n293), .B(cur_state[2]), .Y(n70) );
  OAI32X1 U360 ( .A0(n43), .A1(x[2]), .A2(n87), .B0(n88), .B1(n42), .Y(n167)
         );
  OAI32X1 U361 ( .A0(n324), .A1(y[2]), .A2(n92), .B0(n93), .B1(n58), .Y(n170)
         );
  NAND3BX1 U362 ( .AN(n79), .B(n90), .C(x[0]), .Y(n87) );
  OAI211X1 U363 ( .A0(n60), .A1(n96), .B0(n95), .C0(n321), .Y(n178) );
  NOR2X1 U364 ( .A(n293), .B(n39), .Y(n86) );
  OAI31XL U365 ( .A0(n324), .A1(y[1]), .A2(n60), .B0(n94), .Y(n171) );
  OAI2BB1X1 U366 ( .A0N(n95), .A1N(n96), .B0(y[1]), .Y(n94) );
  NAND3X1 U367 ( .A(x[3]), .B(n123), .C(n128), .Y(n125) );
  NOR3X1 U368 ( .A(x[0]), .B(x[2]), .C(x[1]), .Y(n128) );
  OAI22XL U369 ( .A0(n44), .A1(n90), .B0(n321), .B1(n91), .Y(n169) );
  NOR2X1 U370 ( .A(n329), .B(n44), .Y(n91) );
  OAI22XL U371 ( .A0(n89), .A1(n43), .B0(x[1]), .B1(n87), .Y(n168) );
  AOI2BB1X1 U372 ( .A0N(x[0]), .A1N(n79), .B0(n321), .Y(n89) );
  NAND2X1 U373 ( .A(inB), .B(inA), .Y(n133) );
  OAI2BB2XL U374 ( .B0(n125), .B1(n79), .A0N(n339), .A1N(n124), .Y(n157) );
  NAND2X1 U375 ( .A(n126), .B(n127), .Y(n156) );
  OAI21XL U376 ( .A0(n79), .A1(n125), .B0(n338), .Y(n127) );
  OA21XL U377 ( .A0(x[1]), .A1(n79), .B0(n89), .Y(n88) );
  NAND2X1 U378 ( .A(n122), .B(n60), .Y(n95) );
  OAI2BB1X1 U379 ( .A0N(y[3]), .A1N(n120), .B0(n121), .Y(n177) );
  NAND4X1 U380 ( .A(y[2]), .B(n122), .C(n325), .D(n57), .Y(n121) );
  OAI21XL U381 ( .A0(y[2]), .A1(n324), .B0(n93), .Y(n120) );
  OAI2BB1X1 U382 ( .A0N(x[3]), .A1N(n97), .B0(n98), .Y(n172) );
  OR4X1 U383 ( .A(x[3]), .B(n42), .C(n43), .D(n87), .Y(n98) );
  OAI21XL U384 ( .A0(x[2]), .A1(n79), .B0(n88), .Y(n97) );
  NAND2X1 U385 ( .A(y[1]), .B(y[0]), .Y(n92) );
  NAND4X1 U386 ( .A(n66), .B(n67), .C(n68), .D(n69), .Y(nxt_state[3]) );
  AOI32X1 U387 ( .A0(n267), .A1(n293), .A2(n268), .B0(n70), .B1(n40), .Y(n69)
         );
  NAND4X1 U388 ( .A(n66), .B(n67), .C(n75), .D(n76), .Y(nxt_state[1]) );
  AOI22X1 U389 ( .A0(n77), .A1(n267), .B0(n78), .B1(n293), .Y(n76) );
  NAND4X1 U390 ( .A(n68), .B(n66), .C(n71), .D(n72), .Y(nxt_state[2]) );
  AOI221XL U391 ( .A0(n70), .A1(n73), .B0(n74), .B1(n40), .C0(n332), .Y(n72)
         );
  NOR2X1 U392 ( .A(n276), .B(n273), .Y(\mult_124/n10 ) );
  NOR2X1 U393 ( .A(n275), .B(n273), .Y(\mult_124/n12 ) );
  NOR2X1 U394 ( .A(n274), .B(n273), .Y(\mult_124/n13 ) );
  NOR2X1 U395 ( .A(n276), .B(n274), .Y(\mult_124/n9 ) );
  XOR2X1 U396 ( .A(n272), .B(n271), .Y(product[6]) );
  NOR2X1 U397 ( .A(cur_state[2]), .B(n267), .Y(n277) );
  XNOR2X1 U398 ( .A(n268), .B(cur_state[2]), .Y(n279) );
  OAI32X1 U399 ( .A0(n293), .A1(n224), .A2(n294), .B0(n279), .B1(n40), .Y(n287) );
  AOI33X1 U400 ( .A0(n277), .A1(n224), .A2(cur_state[3]), .B0(n279), .B1(n39), 
        .B2(n267), .Y(n278) );
  NOR3X1 U401 ( .A(n267), .B(n268), .C(n39), .Y(n290) );
  NOR2X1 U402 ( .A(n294), .B(cur_state[3]), .Y(n289) );
  AND3X1 U403 ( .A(n279), .B(cur_state[2]), .C(n267), .Y(n288) );
  AOI222XL U404 ( .A0(radius[4]), .A1(n290), .B0(radius[8]), .B1(n289), .C0(
        radius[0]), .C1(n288), .Y(n280) );
  NAND2X1 U405 ( .A(n281), .B(n280), .Y(N318) );
  AOI222XL U406 ( .A0(radius[5]), .A1(n290), .B0(radius[9]), .B1(n289), .C0(
        radius[1]), .C1(n288), .Y(n282) );
  NAND2X1 U407 ( .A(n283), .B(n282), .Y(N319) );
  AOI222XL U408 ( .A0(radius[6]), .A1(n290), .B0(radius[10]), .B1(n289), .C0(
        radius[2]), .C1(n288), .Y(n284) );
  NAND2X1 U409 ( .A(n285), .B(n284), .Y(N320) );
  AOI222XL U410 ( .A0(radius[7]), .A1(n290), .B0(radius[11]), .B1(n289), .C0(
        radius[3]), .C1(n288), .Y(n291) );
  NAND2X1 U411 ( .A(n292), .B(n291), .Y(N321) );
  AO22X1 U412 ( .A0(n308), .A1(N178), .B0(n309), .B1(N179), .Y(n298) );
  OAI21XL U413 ( .A0(N179), .A1(n309), .B0(n298), .Y(n305) );
  NOR2X1 U414 ( .A(n312), .B(product_A[2]), .Y(n299) );
  OAI22XL U415 ( .A0(n299), .A1(n310), .B0(N181), .B1(n299), .Y(n304) );
  NAND2X1 U416 ( .A(product_A[2]), .B(n312), .Y(n300) );
  OAI222XL U417 ( .A0(N181), .A1(n310), .B0(N181), .B1(n300), .C0(n300), .C1(
        n310), .Y(n303) );
  AOI2BB2X1 U418 ( .B0(n313), .B1(product_A[4]), .A0N(N183), .A1N(n311), .Y(
        n301) );
  AOI211X1 U419 ( .A0(n305), .A1(n304), .B0(n303), .C0(n302), .Y(n306) );
  AOI211X1 U420 ( .A0(N184), .A1(n229), .B0(n307), .C0(n306), .Y(N186) );
endmodule

