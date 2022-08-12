/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Fri Aug 12 16:01:18 2022
/////////////////////////////////////////////////////////////


module STI_DAC ( clk, reset, load, pi_msb, pi_low, pi_end, pi_data, pi_length, 
        pi_fill, so_data, so_valid, oem_finish, odd1_wr, odd2_wr, odd3_wr, 
        odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr, oem_addr, oem_dataout
 );
  input [15:0] pi_data;
  input [1:0] pi_length;
  output [4:0] oem_addr;
  output [7:0] oem_dataout;
  input clk, reset, load, pi_msb, pi_low, pi_end, pi_fill;
  output so_data, so_valid, oem_finish, odd1_wr, odd2_wr, odd3_wr, odd4_wr,
         even1_wr, even2_wr, even3_wr, even4_wr;
  wire   n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, N159, N160, N161, N162, N163, N165, N166, N167, N168, N169,
         N179, N180, N181, N182, N183, N242, N243, N244, N245, N246, N247,
         N248, N249, N292, N293, N294, N295, N323, N385, N391, N555, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n143, n144,
         n145, n146, n147, n157, n158, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, N629, N628, N627, N626, N625,
         N624, n190, n191, n192, n193, n194, n195, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411;
  wire   [2:0] nxt_state;
  wire   [5:0] counter;
  wire   [4:2] \add_446/carry ;
  wire   [5:2] \add_205/carry ;
  wire   [5:2] \add_216_aco/carry ;

  DFFNSRX1 \temp_reg[7]  ( .D(n177), .CKN(clk), .SN(1'b1), .RN(n411), .QN(n130) );
  DFFNSRX1 \temp_reg[6]  ( .D(n178), .CKN(clk), .SN(1'b1), .RN(n411), .QN(n331) );
  DFFNSRX1 \temp_reg[5]  ( .D(n179), .CKN(clk), .SN(1'b1), .RN(n411), .QN(n330) );
  DFFNSRX1 \temp_reg[4]  ( .D(n180), .CKN(clk), .SN(1'b1), .RN(n411), .QN(n329) );
  DFFNSRX1 \temp_reg[3]  ( .D(n181), .CKN(clk), .SN(1'b1), .RN(n411), .QN(n328) );
  DFFNSRX1 \temp_reg[2]  ( .D(n182), .CKN(clk), .SN(1'b1), .RN(n411), .QN(n327) );
  DFFNSRX1 \temp_reg[1]  ( .D(n183), .CKN(clk), .SN(1'b1), .RN(n411), .QN(n324) );
  DFFNSRX1 \temp_reg[0]  ( .D(n157), .CKN(clk), .SN(1'b1), .RN(n411), .QN(n326) );
  DFFRX1 m3_full_reg ( .D(n145), .CK(clk), .RN(n411), .Q(n409), .QN(n382) );
  DFFRX1 \memory_flag_reg[0]  ( .D(n174), .CK(clk), .RN(n411), .Q(n401) );
  DFFRX1 \memory_flag_reg[1]  ( .D(n173), .CK(clk), .RN(n411), .Q(n402) );
  DFFRX1 \memory_flag_reg[2]  ( .D(n172), .CK(clk), .RN(n411), .Q(n403) );
  DFFRX1 \cur_state_reg[0]  ( .D(nxt_state[0]), .CK(clk), .RN(n411), .Q(n406), 
        .QN(n291) );
  DFFRX1 \cur_state_reg[1]  ( .D(nxt_state[1]), .CK(clk), .RN(n411), .Q(n405), 
        .QN(n318) );
  DFFRX1 \cur_state_reg[2]  ( .D(nxt_state[2]), .CK(clk), .RN(n411), .Q(n410), 
        .QN(n285) );
  DFFRX1 \oem_addr_reg[2]  ( .D(n169), .CK(clk), .RN(n411), .QN(n192) );
  DFFRX1 \oem_addr_reg[1]  ( .D(n171), .CK(clk), .RN(n411), .QN(n194) );
  DFFRX1 \oem_addr_reg[0]  ( .D(n170), .CK(clk), .RN(n411), .Q(n423), .QN(n228) );
  DFFRX1 \oem_addr_reg[3]  ( .D(n168), .CK(clk), .RN(n411), .QN(n191) );
  DFFRX1 \oem_addr_reg[4]  ( .D(n167), .CK(clk), .RN(n411), .QN(n195) );
  DFFRX1 oem_finish_reg ( .D(n144), .CK(clk), .RN(n411), .Q(n414), .QN(n143)
         );
  DFFRX1 odd1_wr_reg ( .D(N243), .CK(clk), .RN(n411), .Q(n415), .QN(n136) );
  DFFRX1 odd2_wr_reg ( .D(N244), .CK(clk), .RN(n411), .Q(n416), .QN(n137) );
  DFFRX1 even1_wr_reg ( .D(N247), .CK(clk), .RN(n411), .Q(n419), .QN(n132) );
  DFFRX1 so_data_reg ( .D(n158), .CK(clk), .RN(n411), .Q(n412), .QN(n131) );
  DFFRX1 even2_wr_reg ( .D(N248), .CK(clk), .RN(n411), .Q(n420), .QN(n133) );
  DFFRX1 odd3_wr_reg ( .D(N245), .CK(clk), .RN(n411), .Q(n417), .QN(n138) );
  DFFRX1 so_valid_reg ( .D(n176), .CK(clk), .RN(n411), .Q(n413), .QN(n404) );
  DFFRX1 even3_wr_reg ( .D(N249), .CK(clk), .RN(n411), .Q(n421), .QN(n134) );
  DFFRX1 odd4_wr_reg ( .D(N246), .CK(clk), .RN(n411), .Q(n418), .QN(n139) );
  DFFRX1 even4_wr_reg ( .D(N242), .CK(clk), .RN(n411), .Q(n422), .QN(n135) );
  DFFRX1 m1_full_reg ( .D(n147), .CK(clk), .RN(n411), .Q(n400), .QN(n379) );
  DFFRX1 m2_full_reg ( .D(n146), .CK(clk), .RN(n411), .Q(n407), .QN(n381) );
  DFFRX1 Even_reg ( .D(n175), .CK(clk), .RN(n411), .Q(n408), .QN(n398) );
  DFFRX1 \counter_reg[3]  ( .D(n185), .CK(clk), .RN(n229), .Q(counter[3]), 
        .QN(n234) );
  DFFRX1 \counter_reg[5]  ( .D(n188), .CK(clk), .RN(n411), .Q(counter[5]), 
        .QN(n193) );
  DFFRX1 \counter_reg[4]  ( .D(n184), .CK(clk), .RN(n411), .Q(counter[4]), 
        .QN(n190) );
  DFFRX1 \counter_reg[2]  ( .D(n186), .CK(clk), .RN(n229), .Q(counter[2]), 
        .QN(n249) );
  DFFRX1 \counter_reg[1]  ( .D(n187), .CK(clk), .RN(n229), .Q(counter[1]), 
        .QN(n250) );
  DFFRX1 \counter_reg[0]  ( .D(n189), .CK(clk), .RN(n229), .Q(counter[0]), 
        .QN(n251) );
  INVX1 U174 ( .A(counter[0]), .Y(n266) );
  INVX1 U175 ( .A(counter[1]), .Y(n301) );
  NAND3XL U176 ( .A(n400), .B(n381), .C(n363), .Y(n391) );
  INVX12 U177 ( .A(n326), .Y(oem_dataout[0]) );
  INVX12 U178 ( .A(n324), .Y(oem_dataout[1]) );
  INVX12 U179 ( .A(n327), .Y(oem_dataout[2]) );
  INVX12 U180 ( .A(n328), .Y(oem_dataout[3]) );
  INVX12 U181 ( .A(n329), .Y(oem_dataout[4]) );
  INVX12 U182 ( .A(n330), .Y(oem_dataout[5]) );
  INVX12 U183 ( .A(n331), .Y(oem_dataout[6]) );
  INVX12 U184 ( .A(n130), .Y(oem_dataout[7]) );
  INVX16 U185 ( .A(n195), .Y(oem_addr[4]) );
  INVX16 U186 ( .A(n192), .Y(oem_addr[2]) );
  INVX16 U187 ( .A(n191), .Y(oem_addr[3]) );
  INVX16 U188 ( .A(n194), .Y(oem_addr[1]) );
  INVX6 U189 ( .A(reset), .Y(n411) );
  NOR2BX2 U198 ( .AN(n332), .B(n333), .Y(n325) );
  MX2XL U199 ( .A(oem_addr[2]), .B(N293), .S0(n367), .Y(n169) );
  BUFX12 U200 ( .A(n423), .Y(oem_addr[0]) );
  MXI2XL U201 ( .A(n228), .B(n423), .S0(n367), .Y(n170) );
  NOR2X2 U202 ( .A(n398), .B(n306), .Y(n363) );
  AOI22XL U203 ( .A0(N169), .A1(n296), .B0(N163), .B1(n295), .Y(n300) );
  BUFX12 U204 ( .A(n418), .Y(odd4_wr) );
  BUFX12 U205 ( .A(n419), .Y(even1_wr) );
  AOI2BB1XL U206 ( .A0N(n363), .A1N(n392), .B0(n400), .Y(N247) );
  BUFX12 U207 ( .A(n416), .Y(odd2_wr) );
  BUFX12 U208 ( .A(n415), .Y(odd1_wr) );
  AOI2BB1XL U209 ( .A0N(n395), .A1N(n363), .B0(n400), .Y(N243) );
  BUFX12 U210 ( .A(n420), .Y(even2_wr) );
  BUFX12 U211 ( .A(n417), .Y(odd3_wr) );
  BUFX12 U212 ( .A(n421), .Y(even3_wr) );
  BUFX12 U213 ( .A(n422), .Y(even4_wr) );
  BUFX12 U214 ( .A(n414), .Y(oem_finish) );
  BUFX12 U215 ( .A(n412), .Y(so_data) );
  BUFX12 U216 ( .A(n413), .Y(so_valid) );
  MX2XL U217 ( .A(oem_addr[3]), .B(N294), .S0(n367), .Y(n168) );
  NAND2XL U218 ( .A(oem_addr[3]), .B(oem_addr[2]), .Y(n387) );
  MX2XL U219 ( .A(oem_addr[1]), .B(N292), .S0(n367), .Y(n171) );
  NOR4BXL U220 ( .AN(oem_addr[1]), .B(n401), .C(n402), .D(n403), .Y(n384) );
  NAND3XL U221 ( .A(oem_addr[1]), .B(n298), .C(n423), .Y(n386) );
  MX2XL U222 ( .A(oem_addr[4]), .B(N295), .S0(n367), .Y(n167) );
  XOR2XL U223 ( .A(\add_446/carry [4]), .B(oem_addr[4]), .Y(N295) );
  AND4XL U224 ( .A(n423), .B(oem_addr[2]), .C(oem_addr[3]), .D(oem_addr[4]), 
        .Y(n383) );
  NAND4XL U225 ( .A(n409), .B(n407), .C(n400), .D(oem_addr[4]), .Y(n385) );
  NAND3X2 U226 ( .A(n337), .B(n306), .C(n378), .Y(n323) );
  NAND2BX1 U227 ( .AN(N624), .B(n298), .Y(n293) );
  ADDHXL U228 ( .A(N625), .B(N624), .CO(\add_216_aco/carry [2]), .S(N179) );
  ADDHXL U229 ( .A(N626), .B(\add_216_aco/carry [2]), .CO(
        \add_216_aco/carry [3]), .S(N180) );
  ADDHXL U230 ( .A(N627), .B(\add_216_aco/carry [3]), .CO(
        \add_216_aco/carry [4]), .S(N181) );
  ADDHXL U231 ( .A(N628), .B(\add_216_aco/carry [4]), .CO(
        \add_216_aco/carry [5]), .S(N182) );
  ADDHXL U232 ( .A(oem_addr[1]), .B(n423), .CO(\add_446/carry [2]), .S(N292)
         );
  ADDHXL U233 ( .A(oem_addr[2]), .B(\add_446/carry [2]), .CO(
        \add_446/carry [3]), .S(N293) );
  ADDHXL U234 ( .A(oem_addr[3]), .B(\add_446/carry [3]), .CO(
        \add_446/carry [4]), .S(N294) );
  ADDHXL U235 ( .A(counter[4]), .B(\add_205/carry [4]), .CO(\add_205/carry [5]), .S(N168) );
  ADDHXL U236 ( .A(counter[1]), .B(counter[0]), .CO(\add_205/carry [2]), .S(
        N165) );
  ADDHXL U237 ( .A(counter[2]), .B(\add_205/carry [2]), .CO(\add_205/carry [3]), .S(N166) );
  ADDHXL U238 ( .A(counter[3]), .B(\add_205/carry [3]), .CO(\add_205/carry [4]), .S(N167) );
  CLKBUFX3 U239 ( .A(n411), .Y(n229) );
  AND2X1 U240 ( .A(counter[0]), .B(N555), .Y(N624) );
  AND2X1 U241 ( .A(counter[1]), .B(N555), .Y(N625) );
  AND2X1 U242 ( .A(counter[2]), .B(N555), .Y(N626) );
  AND2X1 U243 ( .A(counter[3]), .B(N555), .Y(N627) );
  AND2X1 U244 ( .A(counter[4]), .B(N555), .Y(N628) );
  AND2X1 U245 ( .A(N555), .B(counter[5]), .Y(N629) );
  XOR2X1 U246 ( .A(\add_216_aco/carry [5]), .B(N629), .Y(N183) );
  NAND2BX1 U247 ( .AN(counter[1]), .B(n251), .Y(n230) );
  OAI2BB1X1 U248 ( .A0N(counter[0]), .A1N(counter[1]), .B0(n230), .Y(N159) );
  NOR2X1 U249 ( .A(n230), .B(counter[2]), .Y(n231) );
  AO21X1 U250 ( .A0(n230), .A1(counter[2]), .B0(n231), .Y(N160) );
  NAND2X1 U251 ( .A(n231), .B(n234), .Y(n232) );
  OAI21XL U252 ( .A0(n231), .A1(n234), .B0(n232), .Y(N161) );
  XNOR2X1 U253 ( .A(counter[4]), .B(n232), .Y(N162) );
  NOR2X1 U254 ( .A(counter[4]), .B(n232), .Y(n233) );
  XOR2X1 U255 ( .A(counter[5]), .B(n233), .Y(N163) );
  XOR2X1 U256 ( .A(\add_205/carry [5]), .B(counter[5]), .Y(N169) );
  NOR2X1 U257 ( .A(n250), .B(counter[0]), .Y(n244) );
  NOR2X1 U258 ( .A(n250), .B(n251), .Y(n243) );
  NOR2X1 U259 ( .A(n251), .B(counter[1]), .Y(n241) );
  NOR2X1 U260 ( .A(counter[0]), .B(counter[1]), .Y(n240) );
  AO22X1 U261 ( .A0(pi_data[5]), .A1(n241), .B0(pi_data[4]), .B1(n240), .Y(
        n235) );
  AOI221XL U262 ( .A0(pi_data[6]), .A1(n244), .B0(pi_data[7]), .B1(n243), .C0(
        n235), .Y(n238) );
  AO22X1 U263 ( .A0(pi_data[1]), .A1(n241), .B0(pi_data[0]), .B1(n240), .Y(
        n236) );
  AOI221XL U264 ( .A0(pi_data[2]), .A1(n244), .B0(pi_data[3]), .B1(n243), .C0(
        n236), .Y(n237) );
  OA22X1 U265 ( .A0(n249), .A1(n238), .B0(counter[2]), .B1(n237), .Y(n248) );
  AO22X1 U266 ( .A0(pi_data[13]), .A1(n241), .B0(pi_data[12]), .B1(n240), .Y(
        n239) );
  AOI221XL U267 ( .A0(pi_data[14]), .A1(n244), .B0(pi_data[15]), .B1(n243), 
        .C0(n239), .Y(n246) );
  AO22X1 U268 ( .A0(pi_data[9]), .A1(n241), .B0(pi_data[8]), .B1(n240), .Y(
        n242) );
  AOI221XL U269 ( .A0(pi_data[10]), .A1(n244), .B0(pi_data[11]), .B1(n243), 
        .C0(n242), .Y(n245) );
  OAI22XL U270 ( .A0(n246), .A1(n249), .B0(counter[2]), .B1(n245), .Y(n247) );
  OAI2BB2XL U271 ( .B0(n248), .B1(counter[3]), .A0N(counter[3]), .A1N(n247), 
        .Y(N391) );
  NOR2X1 U272 ( .A(n250), .B(counter[0]), .Y(n261) );
  NOR2X1 U273 ( .A(n250), .B(n266), .Y(n260) );
  NOR2X1 U274 ( .A(n266), .B(counter[1]), .Y(n258) );
  NOR2X1 U275 ( .A(counter[0]), .B(counter[1]), .Y(n257) );
  AO22X1 U276 ( .A0(pi_data[5]), .A1(n258), .B0(pi_data[4]), .B1(n257), .Y(
        n252) );
  AOI221XL U277 ( .A0(pi_data[6]), .A1(n261), .B0(pi_data[7]), .B1(n260), .C0(
        n252), .Y(n255) );
  AO22X1 U278 ( .A0(pi_data[1]), .A1(n258), .B0(pi_data[0]), .B1(n257), .Y(
        n253) );
  AOI221XL U279 ( .A0(pi_data[2]), .A1(n261), .B0(pi_data[3]), .B1(n260), .C0(
        n253), .Y(n254) );
  OA22X1 U280 ( .A0(n249), .A1(n255), .B0(counter[2]), .B1(n254), .Y(n265) );
  AO22X1 U281 ( .A0(pi_data[13]), .A1(n258), .B0(pi_data[12]), .B1(n257), .Y(
        n256) );
  AOI221XL U282 ( .A0(pi_data[14]), .A1(n261), .B0(pi_data[15]), .B1(n260), 
        .C0(n256), .Y(n263) );
  AO22X1 U283 ( .A0(pi_data[9]), .A1(n258), .B0(pi_data[8]), .B1(n257), .Y(
        n259) );
  AOI221XL U284 ( .A0(pi_data[10]), .A1(n261), .B0(pi_data[11]), .B1(n260), 
        .C0(n259), .Y(n262) );
  OAI22XL U285 ( .A0(n263), .A1(n249), .B0(counter[2]), .B1(n262), .Y(n264) );
  OAI2BB2XL U286 ( .B0(n265), .B1(n234), .A0N(n234), .A1N(n264), .Y(N323) );
  NOR2X1 U287 ( .A(n301), .B(counter[0]), .Y(n276) );
  NOR2X1 U288 ( .A(n301), .B(n266), .Y(n275) );
  NOR2X1 U289 ( .A(n251), .B(counter[1]), .Y(n273) );
  NOR2X1 U290 ( .A(counter[0]), .B(counter[1]), .Y(n272) );
  AO22X1 U291 ( .A0(pi_data[5]), .A1(n273), .B0(pi_data[4]), .B1(n272), .Y(
        n267) );
  AOI221XL U292 ( .A0(pi_data[6]), .A1(n276), .B0(pi_data[7]), .B1(n275), .C0(
        n267), .Y(n270) );
  AO22X1 U293 ( .A0(pi_data[1]), .A1(n273), .B0(pi_data[0]), .B1(n272), .Y(
        n268) );
  AOI221XL U294 ( .A0(pi_data[2]), .A1(n276), .B0(pi_data[3]), .B1(n275), .C0(
        n268), .Y(n269) );
  OA22X1 U295 ( .A0(n249), .A1(n270), .B0(counter[2]), .B1(n269), .Y(n280) );
  AO22X1 U296 ( .A0(pi_data[13]), .A1(n273), .B0(pi_data[12]), .B1(n272), .Y(
        n271) );
  AOI221XL U297 ( .A0(pi_data[14]), .A1(n276), .B0(pi_data[15]), .B1(n275), 
        .C0(n271), .Y(n278) );
  AO22X1 U298 ( .A0(pi_data[9]), .A1(n273), .B0(pi_data[8]), .B1(n272), .Y(
        n274) );
  AOI221XL U299 ( .A0(pi_data[10]), .A1(n276), .B0(pi_data[11]), .B1(n275), 
        .C0(n274), .Y(n277) );
  OAI22XL U300 ( .A0(n278), .A1(n249), .B0(counter[2]), .B1(n277), .Y(n279) );
  OAI2BB2XL U301 ( .B0(n280), .B1(n234), .A0N(n234), .A1N(n279), .Y(N385) );
  CLKINVX1 U302 ( .A(n281), .Y(nxt_state[2]) );
  AOI211X1 U303 ( .A0(n282), .A1(pi_length[1]), .B0(n283), .C0(n284), .Y(n281)
         );
  OAI31XL U304 ( .A0(n285), .A1(n406), .A2(n286), .B0(n287), .Y(n284) );
  NAND3X1 U305 ( .A(n288), .B(n287), .C(n289), .Y(nxt_state[0]) );
  AOI32X1 U306 ( .A0(n290), .A1(n291), .A2(load), .B0(pi_length[0]), .B1(n282), 
        .Y(n289) );
  OAI211X1 U307 ( .A0(n266), .A1(n292), .B0(n293), .C0(n294), .Y(n189) );
  AOI221XL U308 ( .A0(n251), .A1(n295), .B0(n266), .B1(n296), .C0(n297), .Y(
        n294) );
  OAI211X1 U309 ( .A0(n193), .A1(n292), .B0(n299), .C0(n300), .Y(n188) );
  NAND2X1 U310 ( .A(N183), .B(n298), .Y(n299) );
  OAI211X1 U311 ( .A0(n301), .A1(n292), .B0(n302), .C0(n303), .Y(n187) );
  AOI221XL U312 ( .A0(N159), .A1(n295), .B0(N165), .B1(n296), .C0(n297), .Y(
        n303) );
  NAND2X1 U313 ( .A(N179), .B(n298), .Y(n302) );
  OAI211X1 U314 ( .A0(n249), .A1(n292), .B0(n304), .C0(n305), .Y(n186) );
  AOI221XL U315 ( .A0(N160), .A1(n295), .B0(N166), .B1(n296), .C0(n297), .Y(
        n305) );
  NAND2X1 U316 ( .A(N180), .B(n298), .Y(n304) );
  OAI211X1 U317 ( .A0(n306), .A1(n307), .B0(n308), .C0(n309), .Y(n185) );
  AOI222XL U318 ( .A0(n310), .A1(counter[3]), .B0(N167), .B1(n296), .C0(N161), 
        .C1(n295), .Y(n309) );
  MXI2X1 U319 ( .A(n311), .B(n297), .S0(pi_length[0]), .Y(n308) );
  NOR3BXL U320 ( .AN(pi_low), .B(pi_length[1]), .C(n312), .Y(n311) );
  CLKINVX1 U321 ( .A(N181), .Y(n307) );
  OAI211X1 U322 ( .A0(n190), .A1(n292), .B0(n313), .C0(n314), .Y(n184) );
  AOI222XL U323 ( .A0(N162), .A1(n295), .B0(N168), .B1(n296), .C0(n297), .C1(
        pi_length[1]), .Y(n314) );
  NOR2X1 U324 ( .A(n312), .B(n315), .Y(n297) );
  NOR2X1 U325 ( .A(n316), .B(pi_msb), .Y(n296) );
  NOR2X1 U326 ( .A(n315), .B(n316), .Y(n295) );
  NAND2X1 U327 ( .A(N182), .B(n298), .Y(n313) );
  CLKINVX1 U328 ( .A(n310), .Y(n292) );
  NOR3X1 U329 ( .A(n282), .B(nxt_state[1]), .C(n317), .Y(n310) );
  OAI211X1 U330 ( .A0(n318), .A1(n319), .B0(n288), .C0(n320), .Y(nxt_state[1])
         );
  AOI2BB1X1 U331 ( .A0N(pi_length[1]), .A1N(n312), .B0(n283), .Y(n320) );
  NAND2X1 U332 ( .A(n306), .B(n321), .Y(n283) );
  NAND4BX1 U333 ( .AN(load), .B(pi_end), .C(n290), .D(n291), .Y(n321) );
  CLKINVX1 U334 ( .A(n312), .Y(n282) );
  NAND2X1 U335 ( .A(n290), .B(n406), .Y(n312) );
  CLKINVX1 U336 ( .A(n322), .Y(n290) );
  OAI22XL U337 ( .A0(n323), .A1(n324), .B0(n325), .B1(n326), .Y(n183) );
  OAI22XL U338 ( .A0(n323), .A1(n327), .B0(n325), .B1(n324), .Y(n182) );
  OAI22XL U339 ( .A0(n323), .A1(n328), .B0(n325), .B1(n327), .Y(n181) );
  OAI22XL U340 ( .A0(n323), .A1(n329), .B0(n325), .B1(n328), .Y(n180) );
  OAI22XL U341 ( .A0(n323), .A1(n330), .B0(n325), .B1(n329), .Y(n179) );
  OAI22XL U342 ( .A0(n323), .A1(n331), .B0(n325), .B1(n330), .Y(n178) );
  OAI22XL U343 ( .A0(n323), .A1(n130), .B0(n325), .B1(n331), .Y(n177) );
  OAI221XL U344 ( .A0(n286), .A1(n334), .B0(n317), .B1(n404), .C0(n335), .Y(
        n176) );
  CLKINVX1 U345 ( .A(n336), .Y(n335) );
  OAI211X1 U346 ( .A0(n319), .A1(n337), .B0(n287), .C0(n288), .Y(n336) );
  OAI211X1 U347 ( .A0(counter[3]), .A1(n338), .B0(n339), .C0(n340), .Y(n288)
         );
  NOR2X1 U348 ( .A(n291), .B(n337), .Y(n340) );
  OAI211X1 U349 ( .A0(n341), .A1(n342), .B0(n339), .C0(n343), .Y(n287) );
  NAND2X1 U350 ( .A(n344), .B(counter[5]), .Y(n342) );
  NAND3X1 U351 ( .A(n190), .B(n315), .C(n234), .Y(n341) );
  NAND2X1 U352 ( .A(n345), .B(n291), .Y(n319) );
  MXI2X1 U353 ( .A(n346), .B(n347), .S0(pi_low), .Y(n345) );
  NOR3X1 U354 ( .A(n348), .B(counter[5]), .C(counter[3]), .Y(n347) );
  MXI2X1 U355 ( .A(n349), .B(n350), .S0(pi_msb), .Y(n348) );
  NOR2X1 U356 ( .A(counter[4]), .B(n351), .Y(n350) );
  NOR2X1 U357 ( .A(n190), .B(n352), .Y(n349) );
  OAI21XL U358 ( .A0(pi_msb), .A1(N555), .B0(n339), .Y(n346) );
  CLKINVX1 U359 ( .A(n353), .Y(n334) );
  OAI21XL U360 ( .A0(n234), .A1(n338), .B0(n339), .Y(n286) );
  NAND4X1 U361 ( .A(n354), .B(counter[3]), .C(counter[4]), .D(n355), .Y(n339)
         );
  NOR2X1 U362 ( .A(n193), .B(n315), .Y(n355) );
  NAND4X1 U363 ( .A(n344), .B(counter[4]), .C(n193), .D(n315), .Y(n338) );
  CLKINVX1 U364 ( .A(pi_msb), .Y(n315) );
  XOR2X1 U365 ( .A(n356), .B(n408), .Y(n175) );
  OAI31XL U366 ( .A0(n357), .A1(counter[5]), .A2(n316), .B0(n306), .Y(n356) );
  CLKINVX1 U367 ( .A(n317), .Y(n316) );
  NAND2X1 U368 ( .A(n337), .B(n358), .Y(n317) );
  MXI2X1 U369 ( .A(n359), .B(n354), .S0(n360), .Y(n357) );
  NOR2X1 U370 ( .A(n361), .B(pi_msb), .Y(n360) );
  CLKINVX1 U371 ( .A(n351), .Y(n354) );
  NOR2X1 U372 ( .A(n361), .B(n352), .Y(n359) );
  AND3X1 U373 ( .A(n402), .B(n403), .C(n401), .Y(n361) );
  XNOR2X1 U374 ( .A(n401), .B(n362), .Y(n174) );
  NOR2X1 U375 ( .A(n363), .B(n364), .Y(n362) );
  XOR2X1 U376 ( .A(n402), .B(n365), .Y(n173) );
  XNOR2X1 U377 ( .A(n403), .B(n366), .Y(n172) );
  NAND2X1 U378 ( .A(n365), .B(n402), .Y(n366) );
  OA21XL U379 ( .A0(n364), .A1(n363), .B0(n401), .Y(n365) );
  AOI2BB1X1 U380 ( .A0N(n368), .A1N(n369), .B0(n401), .Y(n367) );
  NAND4X1 U381 ( .A(n135), .B(n134), .C(n133), .D(n132), .Y(n369) );
  NAND4X1 U382 ( .A(n136), .B(n137), .C(n138), .D(n139), .Y(n368) );
  OAI221XL U383 ( .A0(n323), .A1(n131), .B0(n332), .B1(n370), .C0(n371), .Y(
        n158) );
  NAND2X1 U384 ( .A(N385), .B(n333), .Y(n371) );
  OAI221XL U385 ( .A0(n326), .A1(n323), .B0(n332), .B1(n370), .C0(n372), .Y(
        n157) );
  NAND2X1 U386 ( .A(N323), .B(n333), .Y(n372) );
  CLKINVX1 U387 ( .A(n373), .Y(n333) );
  OAI211X1 U388 ( .A0(counter[3]), .A1(n374), .B0(pi_fill), .C0(n353), .Y(n373) );
  NAND2X1 U389 ( .A(n190), .B(n193), .Y(n374) );
  CLKINVX1 U390 ( .A(N391), .Y(n370) );
  AND2X1 U391 ( .A(n375), .B(n337), .Y(n332) );
  MXI2X1 U392 ( .A(n376), .B(n377), .S0(pi_fill), .Y(n375) );
  OA21XL U393 ( .A0(counter[5]), .A1(counter[4]), .B0(n343), .Y(n377) );
  NOR3X1 U394 ( .A(n378), .B(counter[5]), .C(counter[4]), .Y(n376) );
  NOR2X1 U395 ( .A(n343), .B(n353), .Y(n378) );
  NOR2X1 U396 ( .A(n358), .B(n406), .Y(n353) );
  NOR2X1 U397 ( .A(n291), .B(n358), .Y(n343) );
  NAND2X1 U398 ( .A(n410), .B(n318), .Y(n358) );
  NAND2X1 U399 ( .A(n405), .B(n285), .Y(n337) );
  NAND2X1 U400 ( .A(n379), .B(n380), .Y(n147) );
  OAI21XL U401 ( .A0(n380), .A1(n379), .B0(n381), .Y(n146) );
  OAI31XL U402 ( .A0(n381), .A1(n380), .A2(n379), .B0(n382), .Y(n145) );
  NAND2X1 U403 ( .A(n383), .B(n384), .Y(n380) );
  OAI31XL U404 ( .A0(n385), .A1(n386), .A2(n387), .B0(n143), .Y(n144) );
  CLKINVX1 U405 ( .A(n306), .Y(n298) );
  NAND4X1 U406 ( .A(n344), .B(counter[3]), .C(n190), .D(n193), .Y(N555) );
  CLKINVX1 U407 ( .A(n352), .Y(n344) );
  AOI21X1 U408 ( .A0(n388), .A1(n389), .B0(n409), .Y(N249) );
  OAI21XL U409 ( .A0(n407), .A1(n390), .B0(n391), .Y(N248) );
  OAI22XL U410 ( .A0(n408), .A1(n388), .B0(n382), .B1(n389), .Y(N246) );
  OAI22XL U411 ( .A0(n409), .A1(n389), .B0(n390), .B1(n393), .Y(N245) );
  OAI31XL U412 ( .A0(n394), .A1(n407), .A2(n408), .B0(n391), .Y(N244) );
  NOR2X1 U413 ( .A(n408), .B(n396), .Y(n395) );
  AOI21X1 U414 ( .A0(n389), .A1(n397), .B0(n382), .Y(N242) );
  OR2X1 U415 ( .A(n388), .B(n398), .Y(n397) );
  NAND3BX1 U416 ( .AN(n390), .B(n407), .C(n393), .Y(n388) );
  NAND2X1 U417 ( .A(n398), .B(n382), .Y(n393) );
  OAI211X1 U418 ( .A0(n407), .A1(n408), .B0(n400), .C0(n392), .Y(n390) );
  CLKINVX1 U419 ( .A(n394), .Y(n392) );
  OAI21XL U420 ( .A0(n400), .A1(n408), .B0(n364), .Y(n394) );
  CLKINVX1 U421 ( .A(n396), .Y(n364) );
  NAND2X1 U422 ( .A(n399), .B(n322), .Y(n396) );
  NAND2X1 U423 ( .A(n285), .B(n318), .Y(n322) );
  MXI2X1 U424 ( .A(n351), .B(n352), .S0(pi_msb), .Y(n399) );
  NAND3X1 U425 ( .A(n301), .B(n249), .C(n251), .Y(n352) );
  NAND3X1 U426 ( .A(counter[1]), .B(counter[0]), .C(counter[2]), .Y(n351) );
  NAND3X1 U427 ( .A(n407), .B(n400), .C(n363), .Y(n389) );
  NAND3X1 U428 ( .A(n410), .B(n291), .C(n405), .Y(n306) );
endmodule

