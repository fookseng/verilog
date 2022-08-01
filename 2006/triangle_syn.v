/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Mon Aug  1 16:32:45 2022
/////////////////////////////////////////////////////////////


module triangle_DW_mult_uns_0 ( a, b, product );
  input [5:0] a;
  input [5:0] b;
  output [11:0] product;
  wire   n2, n3, n4, n5, n7, n8, n10, n11, n12, n14, n16, n18, n19, n22, n23,
         n25, n26, n27, n28, n29, n30, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80;

  NOR2X1 U39 ( .A(n69), .B(n72), .Y(n29) );
  ADDFX2 U40 ( .A(n57), .B(n18), .CI(n10), .CO(n7), .S(n8) );
  ADDFXL U41 ( .A(n19), .B(n28), .CI(n58), .CO(n11), .S(n12) );
  ADDFX2 U42 ( .A(n5), .B(n23), .CI(n16), .CO(n4), .S(product[2]) );
  CLKINVX1 U43 ( .A(b[0]), .Y(n67) );
  AND2X2 U44 ( .A(n22), .B(n25), .Y(n57) );
  AND2X2 U45 ( .A(n26), .B(n29), .Y(n58) );
  CLKINVX1 U46 ( .A(b[2]), .Y(n69) );
  CLKINVX1 U47 ( .A(a[1]), .Y(n71) );
  NOR2X1 U48 ( .A(n67), .B(n71), .Y(n27) );
  ADDFHX2 U49 ( .A(n11), .B(n8), .CI(n3), .CO(n2), .S(product[4]) );
  NAND2X1 U50 ( .A(b[2]), .B(a[2]), .Y(n80) );
  NAND2BXL U51 ( .AN(n79), .B(n80), .Y(n77) );
  NOR2X1 U52 ( .A(n69), .B(n71), .Y(n25) );
  XOR2XL U53 ( .A(n26), .B(n29), .Y(n16) );
  NAND3X1 U54 ( .A(n64), .B(n65), .C(n66), .Y(n3) );
  NOR2XL U55 ( .A(n71), .B(n70), .Y(n26) );
  NAND2X1 U56 ( .A(n14), .B(n4), .Y(n65) );
  INVX1 U57 ( .A(b[1]), .Y(n70) );
  NOR2X1 U58 ( .A(n68), .B(n70), .Y(n22) );
  XOR2XL U59 ( .A(n22), .B(n25), .Y(n14) );
  NOR2X1 U60 ( .A(n68), .B(n67), .Y(n23) );
  INVX1 U61 ( .A(a[0]), .Y(n72) );
  XOR2XL U62 ( .A(n14), .B(n12), .Y(n63) );
  XOR2XL U63 ( .A(n63), .B(n4), .Y(product[3]) );
  CLKINVX1 U64 ( .A(n2), .Y(n60) );
  NAND2X1 U65 ( .A(n7), .B(n60), .Y(n61) );
  NAND2XL U66 ( .A(n59), .B(n2), .Y(n62) );
  NAND2X1 U67 ( .A(n61), .B(n62), .Y(n78) );
  INVXL U68 ( .A(n7), .Y(n59) );
  NOR2XL U69 ( .A(n72), .B(n70), .Y(n30) );
  NAND2XL U70 ( .A(b[3]), .B(a[1]), .Y(n79) );
  NAND2XL U71 ( .A(n12), .B(n4), .Y(n64) );
  NAND2XL U72 ( .A(n14), .B(n12), .Y(n66) );
  XOR2X1 U73 ( .A(n73), .B(n74), .Y(product[5]) );
  XOR2X1 U74 ( .A(n77), .B(n78), .Y(n73) );
  NAND2X1 U75 ( .A(a[0]), .B(b[3]), .Y(n28) );
  CLKINVX1 U76 ( .A(a[2]), .Y(n68) );
  ADDHXL U77 ( .A(n27), .B(n30), .CO(n5), .S(product[1]) );
  NOR2XL U78 ( .A(n72), .B(n67), .Y(product[0]) );
  XOR2X1 U79 ( .A(n80), .B(n79), .Y(n10) );
  NAND2XL U80 ( .A(b[3]), .B(a[2]), .Y(n75) );
  XOR2X1 U81 ( .A(n75), .B(n76), .Y(n74) );
  NAND2X1 U82 ( .A(a[3]), .B(b[2]), .Y(n76) );
  NAND2X1 U83 ( .A(b[0]), .B(a[3]), .Y(n19) );
  NAND2X1 U84 ( .A(b[1]), .B(a[3]), .Y(n18) );
endmodule


module triangle ( clk, reset, nt, xi, yi, busy, po, xo, yo );
  input [2:0] xi;
  input [2:0] yi;
  output [2:0] xo;
  output [2:0] yo;
  input clk, reset, nt;
  output busy, po;
  wire   n367, n368, n369, n370, n371, n372, \nxt_state[0] , \counter[0] ,
         \Ycoor[0][2] , \Ycoor[0][1] , \Ycoor[0][0] , \Ycoor[1][2] ,
         \Ycoor[1][1] , \Ycoor[1][0] , \Ycoor[2][2] , \Ycoor[2][1] ,
         \Ycoor[2][0] , \Xcoor[0][1] , \Xcoor[0][0] , \Xcoor[1][2] , n52, n53,
         n57, n58, n59, n60, n62, n63, n64, n65, n66, n67, n69, n70, n71, n74,
         n84, n89, n119, n137, n141, n142, n143, n144, n145, n146, n147, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, N53, N52, N51, N50, N49, N48, N47, N46, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n183, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n366;
  wire   [5:0] temp;
  wire   [5:0] flag;
  wire   [2:0] x;
  wire   [2:0] x1;
  wire   [2:0] y2;
  wire   [2:0] y1;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5;

  DFFHQX8 \xo_reg[2]  ( .D(n166), .CK(clk), .Q(n367) );
  triangle_DW_mult_uns_0 mult_106 ( .a({N49, N49, N49, N48, N47, N46}), .b({
        N53, N53, N53, N52, N51, N50}), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, flag}) );
  EDFFXL \Ycoor_reg[0][2]  ( .D(yi[2]), .E(n218), .CK(clk), .Q(\Ycoor[0][2] ), 
        .QN(n65) );
  EDFFXL \Ycoor_reg[0][1]  ( .D(yi[1]), .E(n218), .CK(clk), .Q(\Ycoor[0][1] ), 
        .QN(n66) );
  EDFFXL \Ycoor_reg[0][0]  ( .D(yi[0]), .E(n218), .CK(clk), .Q(\Ycoor[0][0] ), 
        .QN(n67) );
  EDFFXL \Ycoor_reg[1][2]  ( .D(yi[2]), .E(n173), .CK(clk), .Q(\Ycoor[1][2] ), 
        .QN(n69) );
  EDFFXL \Ycoor_reg[1][1]  ( .D(yi[1]), .E(n173), .CK(clk), .Q(\Ycoor[1][1] ), 
        .QN(n70) );
  EDFFXL \Ycoor_reg[2][2]  ( .D(yi[2]), .E(n217), .CK(clk), .Q(\Ycoor[2][2] )
         );
  EDFFXL \Ycoor_reg[2][1]  ( .D(yi[1]), .E(n217), .CK(clk), .Q(\Ycoor[2][1] )
         );
  EDFFXL \Ycoor_reg[2][0]  ( .D(yi[0]), .E(n217), .CK(clk), .Q(\Ycoor[2][0] ), 
        .QN(n74) );
  EDFFXL \Xcoor_reg[2][1]  ( .D(xi[1]), .E(n217), .CK(clk), .QN(n63) );
  EDFFXL \Xcoor_reg[2][0]  ( .D(xi[0]), .E(n217), .CK(clk), .QN(n64) );
  EDFFXL \Xcoor_reg[2][2]  ( .D(xi[2]), .E(n217), .CK(clk), .QN(n62) );
  EDFFXL \Ycoor_reg[1][0]  ( .D(yi[0]), .E(n173), .CK(clk), .Q(\Ycoor[1][0] ), 
        .QN(n71) );
  DFFRX1 \counter_reg[0]  ( .D(n163), .CK(clk), .RN(n206), .Q(\counter[0] ), 
        .QN(n250) );
  EDFFXL \Xcoor_reg[1][0]  ( .D(xi[0]), .E(n173), .CK(clk), .QN(n60) );
  DFFRXL \cur_state_reg[1]  ( .D(n249), .CK(clk), .RN(n206), .Q(n248), .QN(n52) );
  DFFRXL \cur_state_reg[0]  ( .D(\nxt_state[0] ), .CK(clk), .RN(n206), .Q(n249), .QN(n53) );
  EDFFXL \Xcoor_reg[0][0]  ( .D(xi[0]), .E(n218), .CK(clk), .Q(\Xcoor[0][0] ), 
        .QN(n172) );
  EDFFXL \Xcoor_reg[0][1]  ( .D(xi[1]), .E(n218), .CK(clk), .Q(\Xcoor[0][1] ), 
        .QN(n169) );
  EDFFXL \temp_reg[0]  ( .D(flag[0]), .E(n179), .CK(clk), .QN(n345) );
  EDFFXL \Xcoor_reg[0][2]  ( .D(xi[2]), .E(n218), .CK(clk), .Q(n170), .QN(n57)
         );
  EDFFXL \Xcoor_reg[1][2]  ( .D(xi[2]), .E(n173), .CK(clk), .Q(\Xcoor[1][2] ), 
        .QN(n58) );
  EDFFXL \Xcoor_reg[1][1]  ( .D(xi[1]), .E(n173), .CK(clk), .Q(n171), .QN(n59)
         );
  EDFFXL \temp_reg[2]  ( .D(flag[2]), .E(n179), .CK(clk), .Q(temp[2]) );
  EDFFXL \temp_reg[3]  ( .D(flag[3]), .E(n179), .CK(clk), .QN(n220) );
  EDFFXL \temp_reg[1]  ( .D(flag[1]), .E(n179), .CK(clk), .Q(temp[1]), .QN(
        n225) );
  EDFFXL \temp_reg[4]  ( .D(flag[4]), .E(n179), .CK(clk), .Q(temp[4]), .QN(
        n227) );
  DFFHQX4 \x_reg[2]  ( .D(n157), .CK(clk), .Q(x[2]) );
  DFFRX1 \counter_reg[1]  ( .D(n167), .CK(clk), .RN(n206), .QN(n254) );
  DFFRHQX2 \y2_reg[2]  ( .D(n158), .CK(clk), .RN(1'b1), .Q(y2[2]) );
  DFFHQX4 \y2_reg[0]  ( .D(n160), .CK(clk), .Q(y2[0]) );
  DFFRHQX8 \y2_reg[1]  ( .D(n159), .CK(clk), .RN(1'b1), .Q(y2[1]) );
  EDFFXL \temp_reg[5]  ( .D(flag[5]), .E(n179), .CK(clk), .Q(temp[5]), .QN(
        n242) );
  DFFXL \xo_reg[0]  ( .D(n165), .CK(clk), .Q(n369), .QN(n335) );
  DFFXL \yo_reg[0]  ( .D(n168), .CK(clk), .Q(n372), .QN(n314) );
  DFFRHQX2 \y1_reg[1]  ( .D(n363), .CK(clk), .RN(1'b1), .Q(y1[1]) );
  DFFRHQX2 \x_reg[1]  ( .D(n156), .CK(clk), .RN(1'b1), .Q(x[1]) );
  DFFHQX4 \xo_reg[1]  ( .D(n164), .CK(clk), .Q(n368) );
  DFFRHQX2 \x_reg[0]  ( .D(n155), .CK(clk), .RN(1'b1), .Q(x[0]) );
  DFFRX2 \y1_reg[0]  ( .D(n362), .CK(clk), .RN(1'b1), .Q(n191), .QN(n192) );
  DFFQX1 \x1_reg[2]  ( .D(n361), .CK(clk), .Q(x1[2]) );
  DFFQX1 \x1_reg[1]  ( .D(n360), .CK(clk), .Q(x1[1]) );
  DFFRHQX2 \y1_reg[2]  ( .D(n364), .CK(clk), .RN(1'b1), .Q(y1[2]) );
  DFFQXL \yo_reg[1]  ( .D(n162), .CK(clk), .Q(n371) );
  DFFQX2 \x1_reg[0]  ( .D(n359), .CK(clk), .Q(x1[0]) );
  DFFHQX2 \yo_reg[2]  ( .D(n161), .CK(clk), .Q(n370) );
  NAND2X2 U119 ( .A(n295), .B(n324), .Y(n321) );
  OAI2BB1X1 U120 ( .A0N(n338), .A1N(n357), .B0(n358), .Y(n284) );
  CLKINVX6 U121 ( .A(reset), .Y(n358) );
  INVXL U122 ( .A(n333), .Y(n340) );
  AO21XL U123 ( .A0(n137), .A1(n271), .B0(n333), .Y(n278) );
  OR2XL U124 ( .A(n334), .B(n333), .Y(n341) );
  CLKINVX12 U125 ( .A(n240), .Y(po) );
  OR2XL U126 ( .A(x[1]), .B(n199), .Y(n190) );
  CLKBUFX3 U127 ( .A(n370), .Y(n183) );
  OR2X4 U128 ( .A(n310), .B(n311), .Y(n319) );
  INVX12 U129 ( .A(n317), .Y(yo[1]) );
  OAI21XL U130 ( .A0(n67), .A1(n290), .B0(n282), .Y(n168) );
  INVX3 U131 ( .A(n319), .Y(n193) );
  CLKINVX1 U132 ( .A(x1[1]), .Y(n199) );
  CLKINVX1 U133 ( .A(x1[2]), .Y(n304) );
  INVX12 U134 ( .A(n302), .Y(xo[2]) );
  OAI21XL U135 ( .A0(n65), .A1(n290), .B0(n289), .Y(n161) );
  MXI2X1 U136 ( .A(n288), .B(n119), .S0(n183), .Y(n289) );
  AND2X2 U137 ( .A(n287), .B(yo[1]), .Y(n288) );
  OAI221X1 U138 ( .A0(n314), .A1(n322), .B0(n71), .B1(n321), .C0(n313), .Y(
        n160) );
  OAI21XL U139 ( .A0(n66), .A1(n290), .B0(n285), .Y(n162) );
  OR2X4 U140 ( .A(n189), .B(n203), .Y(n157) );
  NOR2X1 U141 ( .A(n301), .B(n308), .Y(n203) );
  OR2X2 U142 ( .A(n299), .B(n303), .Y(n210) );
  OR3X2 U143 ( .A(n284), .B(n314), .C(n84), .Y(n286) );
  OA21X4 U144 ( .A0(n241), .A1(n84), .B0(n357), .Y(n240) );
  CLKINVX1 U145 ( .A(n175), .Y(n179) );
  CLKBUFX3 U146 ( .A(n219), .Y(n173) );
  CLKINVX2 U147 ( .A(n309), .Y(n324) );
  NAND2X2 U148 ( .A(n358), .B(n200), .Y(n294) );
  INVXL U149 ( .A(n239), .Y(n174) );
  INVX2 U150 ( .A(n238), .Y(n239) );
  NAND2BXL U151 ( .AN(reset), .B(n200), .Y(n175) );
  XOR3X1 U152 ( .A(y2[1]), .B(n328), .C(n331), .Y(N51) );
  NOR2XL U153 ( .A(n309), .B(n178), .Y(n176) );
  NOR2X1 U154 ( .A(n176), .B(n177), .Y(n198) );
  AND2X2 U155 ( .A(n200), .B(n195), .Y(n177) );
  OR2X1 U156 ( .A(n60), .B(n308), .Y(n178) );
  NAND3X2 U157 ( .A(n209), .B(n210), .C(n211), .Y(n156) );
  AOI2BB2X1 U158 ( .B0(\Ycoor[2][2] ), .B1(n193), .A0N(n329), .A1N(n239), .Y(
        n320) );
  OR2X2 U159 ( .A(n326), .B(n311), .Y(n303) );
  OR2X1 U160 ( .A(n194), .B(x[0]), .Y(n307) );
  INVX3 U161 ( .A(n318), .Y(n326) );
  AOI2BB2X1 U162 ( .B0(\Ycoor[2][1] ), .B1(n193), .A0N(n315), .A1N(n318), .Y(
        n316) );
  INVX1 U163 ( .A(y2[1]), .Y(n315) );
  NOR2X1 U164 ( .A(n303), .B(n302), .Y(n202) );
  OA22X4 U165 ( .A0(n74), .A1(n319), .B0(n312), .B1(n239), .Y(n313) );
  OAI221X1 U166 ( .A0(n317), .A1(n322), .B0(n70), .B1(n321), .C0(n316), .Y(
        n159) );
  OR2X4 U167 ( .A(n298), .B(n308), .Y(n211) );
  NOR3BX2 U168 ( .AN(n206), .B(busy), .C(n255), .Y(n218) );
  NOR3BX2 U169 ( .AN(n206), .B(n254), .C(n255), .Y(n217) );
  INVX12 U170 ( .A(n314), .Y(yo[0]) );
  AO22XL U171 ( .A0(xo[2]), .A1(n278), .B0(n340), .B1(n277), .Y(n166) );
  INVX12 U172 ( .A(n335), .Y(xo[0]) );
  BUFX12 U173 ( .A(n370), .Y(yo[2]) );
  INVX12 U174 ( .A(n299), .Y(xo[1]) );
  AO22XL U175 ( .A0(xo[1]), .A1(n341), .B0(n340), .B1(n339), .Y(n164) );
  MX2XL U176 ( .A(n286), .B(n216), .S0(yo[1]), .Y(n285) );
  INVX12 U177 ( .A(n254), .Y(busy) );
  XOR2X1 U178 ( .A(n307), .B(n199), .Y(n187) );
  XOR2X1 U179 ( .A(n187), .B(x[1]), .Y(N47) );
  NOR2X1 U180 ( .A(n58), .B(n309), .Y(n204) );
  OR2X8 U181 ( .A(n326), .B(n296), .Y(n309) );
  NAND2BX1 U182 ( .AN(y2[1]), .B(y1[1]), .Y(n327) );
  XOR2XL U183 ( .A(y2[2]), .B(y1[2]), .Y(n188) );
  XOR2X1 U184 ( .A(n188), .B(n244), .Y(N52) );
  AOI2BB2X1 U185 ( .B0(n327), .B1(n331), .A0N(n315), .A1N(y1[1]), .Y(n244) );
  NAND2X2 U186 ( .A(n296), .B(n318), .Y(n310) );
  INVX1 U187 ( .A(y1[1]), .Y(n328) );
  OR2X4 U188 ( .A(n201), .B(n202), .Y(n189) );
  AO22X2 U189 ( .A0(n212), .A1(n213), .B0(x1[2]), .B1(n306), .Y(N49) );
  AO22XL U190 ( .A0(n244), .A1(n330), .B0(y1[2]), .B1(n329), .Y(N53) );
  NOR2X1 U191 ( .A(n204), .B(n205), .Y(n301) );
  INVXL U192 ( .A(x1[0]), .Y(n194) );
  AOI2BB2X1 U193 ( .B0(n190), .B1(n307), .A0N(n300), .A1N(x1[1]), .Y(n245) );
  OR2X4 U194 ( .A(n192), .B(y2[0]), .Y(n331) );
  NOR2XL U195 ( .A(n64), .B(n310), .Y(n195) );
  NAND3X1 U196 ( .A(n196), .B(n197), .C(n198), .Y(n155) );
  OR2XL U197 ( .A(n239), .B(n297), .Y(n196) );
  OR2XL U198 ( .A(n335), .B(n303), .Y(n197) );
  INVXL U199 ( .A(x[0]), .Y(n297) );
  OAI221X1 U200 ( .A0(n323), .A1(n322), .B0(n69), .B1(n321), .C0(n320), .Y(
        n158) );
  CLKINVX1 U201 ( .A(n308), .Y(n200) );
  NAND2BX1 U202 ( .AN(n263), .B(n242), .Y(n342) );
  OAI2BB1X1 U203 ( .A0N(n342), .A1N(n264), .B0(n352), .Y(n272) );
  NOR2XL U204 ( .A(n63), .B(n310), .Y(n208) );
  NOR2X1 U205 ( .A(n194), .B(x[0]), .Y(n243) );
  INVXL U206 ( .A(y2[0]), .Y(n312) );
  INVX1 U207 ( .A(x[2]), .Y(n306) );
  NOR2XL U208 ( .A(n239), .B(n306), .Y(n201) );
  NOR2XL U209 ( .A(n62), .B(n310), .Y(n205) );
  CLKBUFX2 U210 ( .A(n358), .Y(n206) );
  NAND2BX1 U211 ( .AN(flag[5]), .B(temp[5]), .Y(n352) );
  CLKINVX1 U212 ( .A(flag[5]), .Y(n263) );
  XNOR2XL U213 ( .A(n170), .B(n367), .Y(n228) );
  XNOR2XL U214 ( .A(n369), .B(\Xcoor[0][0] ), .Y(n229) );
  XNOR2XL U215 ( .A(n368), .B(\Xcoor[0][1] ), .Y(n230) );
  XNOR3X1 U216 ( .A(n304), .B(x[2]), .C(n245), .Y(N48) );
  OR2XL U217 ( .A(x1[2]), .B(n306), .Y(n213) );
  AOI22XL U218 ( .A0(x[1]), .A1(n199), .B0(n305), .B1(n307), .Y(n212) );
  NOR2X1 U219 ( .A(n59), .B(n309), .Y(n207) );
  NOR2X1 U220 ( .A(n207), .B(n208), .Y(n298) );
  OR2XL U221 ( .A(n239), .B(n300), .Y(n209) );
  INVXL U222 ( .A(n336), .Y(n271) );
  OR2XL U223 ( .A(n259), .B(n226), .Y(n349) );
  INVXL U224 ( .A(n260), .Y(n259) );
  INVXL U225 ( .A(n332), .Y(n334) );
  INVXL U226 ( .A(n343), .Y(n261) );
  OR2XL U227 ( .A(x[1]), .B(n199), .Y(n305) );
  OR2XL U228 ( .A(y1[2]), .B(n329), .Y(n330) );
  AOI22XL U229 ( .A0(\Ycoor[1][0] ), .A1(n325), .B0(\Ycoor[0][0] ), .B1(n324), 
        .Y(n221) );
  MX2XL U230 ( .A(xo[0]), .B(n279), .S0(n340), .Y(n165) );
  INVX1 U231 ( .A(y2[2]), .Y(n329) );
  NOR2X1 U232 ( .A(flag[3]), .B(n220), .Y(n214) );
  OR2XL U233 ( .A(yo[1]), .B(n84), .Y(n215) );
  NAND2XL U234 ( .A(n215), .B(n216), .Y(n119) );
  CLKINVX1 U235 ( .A(flag[2]), .Y(n344) );
  CLKINVX1 U236 ( .A(n286), .Y(n287) );
  CLKINVX1 U237 ( .A(n266), .Y(n265) );
  CLKINVX1 U238 ( .A(n275), .Y(n269) );
  MXI2X1 U239 ( .A(n356), .B(n355), .S0(n354), .Y(n241) );
  OAI31XL U240 ( .A0(n246), .A1(n226), .A2(n353), .B0(n352), .Y(n356) );
  OR2XL U241 ( .A(n284), .B(n280), .Y(n290) );
  CLKINVX1 U242 ( .A(n274), .Y(n338) );
  OAI2BB1X1 U243 ( .A0N(y2[0]), .A1N(n192), .B0(n331), .Y(N50) );
  CLKINVX1 U244 ( .A(n251), .Y(n253) );
  OAI211X1 U245 ( .A0(n89), .A1(n84), .B0(n252), .C0(n257), .Y(n251) );
  OAI222XL U246 ( .A0(n310), .A1(n60), .B0(n309), .B1(n172), .C0(n239), .C1(
        n194), .Y(n359) );
  OAI2BB1X1 U247 ( .A0N(n253), .A1N(\counter[0] ), .B0(n252), .Y(n163) );
  NOR2BXL U248 ( .AN(n283), .B(n284), .Y(n216) );
  OR2X1 U249 ( .A(n58), .B(n170), .Y(n266) );
  CLKINVX1 U250 ( .A(n273), .Y(n354) );
  OR2X1 U251 ( .A(n249), .B(n248), .Y(n280) );
  OR2X1 U252 ( .A(n247), .B(n295), .Y(\nxt_state[0] ) );
  OAI32X1 U253 ( .A0(\counter[0] ), .A1(n248), .A2(n254), .B0(n366), .B1(n84), 
        .Y(n247) );
  CLKINVX1 U254 ( .A(n89), .Y(n366) );
  CLKINVX1 U255 ( .A(n311), .Y(n295) );
  INVXL U256 ( .A(n368), .Y(n299) );
  INVXL U257 ( .A(n367), .Y(n302) );
  OAI211X1 U258 ( .A0(n224), .A1(n348), .B0(n347), .C0(n346), .Y(n350) );
  OA21XL U259 ( .A0(temp[2]), .A1(n344), .B0(n343), .Y(n351) );
  AND2X2 U260 ( .A(flag[0]), .B(n345), .Y(n348) );
  INVXL U261 ( .A(yo[2]), .Y(n323) );
  INVXL U262 ( .A(n371), .Y(n317) );
  OR2XL U263 ( .A(xo[0]), .B(n336), .Y(n332) );
  NOR2XL U264 ( .A(reset), .B(n257), .Y(n219) );
  CLKMX2X2 U265 ( .A(n314), .B(n283), .S0(n281), .Y(n282) );
  NAND2X1 U266 ( .A(n220), .B(flag[3]), .Y(n343) );
  OR2X1 U267 ( .A(n365), .B(n280), .Y(n252) );
  CLKINVX1 U268 ( .A(nt), .Y(n365) );
  NAND2BX1 U269 ( .AN(flag[4]), .B(temp[4]), .Y(n260) );
  OAI222XL U270 ( .A0(n338), .A1(n169), .B0(xo[1]), .B1(n337), .C0(n357), .C1(
        n59), .Y(n339) );
  OR2X1 U271 ( .A(n336), .B(n335), .Y(n337) );
  OAI222XL U272 ( .A0(n338), .A1(n57), .B0(n137), .B1(n276), .C0(n58), .C1(
        n357), .Y(n277) );
  NAND2XL U273 ( .A(n368), .B(n369), .Y(n137) );
  OAI221XL U274 ( .A0(n338), .A1(n172), .B0(n357), .B1(n60), .C0(n332), .Y(
        n279) );
  OR2XL U275 ( .A(n367), .B(n336), .Y(n276) );
  NAND2BX1 U276 ( .AN(flag[1]), .B(temp[1]), .Y(n347) );
  OAI2BB1XL U277 ( .A0N(n174), .A1N(n191), .B0(n221), .Y(n362) );
  OAI2BB1XL U278 ( .A0N(n174), .A1N(y1[1]), .B0(n222), .Y(n363) );
  AOI22XL U279 ( .A0(\Ycoor[1][1] ), .A1(n325), .B0(\Ycoor[0][1] ), .B1(n324), 
        .Y(n222) );
  OAI2BB1XL U280 ( .A0N(n174), .A1N(y1[2]), .B0(n223), .Y(n364) );
  AOI22XL U281 ( .A0(\Ycoor[1][2] ), .A1(n325), .B0(\Ycoor[0][2] ), .B1(n324), 
        .Y(n223) );
  XOR2X1 U282 ( .A(n344), .B(temp[2]), .Y(n346) );
  OAI2BB2XL U283 ( .B0(n257), .B1(nt), .A0N(n253), .A1N(busy), .Y(n167) );
  AOI221XL U284 ( .A0(temp[2]), .A1(n344), .B0(n346), .B1(n258), .C0(n214), 
        .Y(n262) );
  OAI31XL U285 ( .A0(flag[0]), .A1(n224), .A2(n345), .B0(n347), .Y(n258) );
  AND2X2 U286 ( .A(n225), .B(flag[1]), .Y(n224) );
  AND2X2 U287 ( .A(n227), .B(flag[4]), .Y(n226) );
  NAND3X1 U288 ( .A(n228), .B(n229), .C(n230), .Y(n275) );
  OAI211X1 U289 ( .A0(n57), .A1(\Xcoor[1][2] ), .B0(n268), .C0(n267), .Y(n273)
         );
  OR3X2 U290 ( .A(n171), .B(n169), .C(n265), .Y(n268) );
  OAI221XL U291 ( .A0(n60), .A1(\Xcoor[0][0] ), .B0(\Xcoor[0][1] ), .B1(n59), 
        .C0(n266), .Y(n267) );
  NOR3X1 U292 ( .A(n145), .B(n146), .C(n147), .Y(n144) );
  XOR2XL U293 ( .A(n183), .B(\Ycoor[2][2] ), .Y(n145) );
  XOR2XL U294 ( .A(n372), .B(\Ycoor[2][0] ), .Y(n146) );
  XOR2XL U295 ( .A(n371), .B(\Ycoor[2][1] ), .Y(n147) );
  NAND4X1 U296 ( .A(n141), .B(n142), .C(n143), .D(n144), .Y(n89) );
  XOR2XL U297 ( .A(n63), .B(n368), .Y(n141) );
  XOR2XL U298 ( .A(n62), .B(n367), .Y(n143) );
  XOR2XL U299 ( .A(n64), .B(n369), .Y(n142) );
  OR2XL U300 ( .A(n372), .B(n84), .Y(n283) );
  AO22XL U301 ( .A0(n183), .A1(n69), .B0(n293), .B1(n292), .Y(n296) );
  OR2XL U302 ( .A(n69), .B(n370), .Y(n292) );
  AO22XL U303 ( .A0(n371), .A1(n70), .B0(n291), .B1(n71), .Y(n293) );
  OA21XL U304 ( .A0(n70), .A1(n371), .B0(n372), .Y(n291) );
  NAND2BX1 U305 ( .AN(n248), .B(n249), .Y(n311) );
  OR3X2 U306 ( .A(busy), .B(n250), .C(n280), .Y(n257) );
  OR2X1 U307 ( .A(n53), .B(n52), .Y(n308) );
  OR2X1 U308 ( .A(\counter[0] ), .B(n280), .Y(n255) );
  OR2XL U316 ( .A(n326), .B(n308), .Y(n322) );
  INVXL U317 ( .A(n284), .Y(n281) );
  AO21XL U318 ( .A0(n280), .A1(n84), .B0(reset), .Y(n333) );
  INVXL U319 ( .A(n310), .Y(n325) );
  OAI222XL U320 ( .A0(n59), .A1(n310), .B0(n169), .B1(n309), .C0(n239), .C1(
        n199), .Y(n360) );
  OAI222XL U321 ( .A0(n58), .A1(n310), .B0(n309), .B1(n57), .C0(n239), .C1(
        n304), .Y(n361) );
  INVXL U322 ( .A(n318), .Y(n238) );
  OAI2BB1X4 U323 ( .A0N(n295), .A1N(n358), .B0(n294), .Y(n318) );
  NAND2BX1 U324 ( .AN(n249), .B(n248), .Y(n84) );
  OR3X2 U325 ( .A(n84), .B(n275), .C(n354), .Y(n357) );
  INVXL U326 ( .A(n272), .Y(n355) );
  OAI31XL U327 ( .A0(n355), .A1(n84), .A2(n273), .B0(n280), .Y(n274) );
  OR2X1 U328 ( .A(n84), .B(n270), .Y(n336) );
  AOI211XL U329 ( .A0(n351), .A1(n350), .B0(n214), .C0(n349), .Y(n353) );
  AO21XL U330 ( .A0(x[0]), .A1(n194), .B0(n243), .Y(N46) );
  INVXL U331 ( .A(x[1]), .Y(n300) );
  OAI31XL U332 ( .A0(n262), .A1(n261), .A2(n349), .B0(n260), .Y(n264) );
  NOR2XL U333 ( .A(n263), .B(temp[5]), .Y(n246) );
  MX2XL U334 ( .A(n269), .B(n272), .S0(n354), .Y(n270) );
endmodule

