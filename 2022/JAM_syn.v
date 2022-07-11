/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Sat Jul  2 18:18:42 2022
/////////////////////////////////////////////////////////////


module JAM_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [9:1] carry;

  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  AND2X2 U2 ( .A(A[8]), .B(n3), .Y(n2) );
  XOR2X1 U3 ( .A(A[8]), .B(n3), .Y(SUM[8]) );
  XOR2X1 U4 ( .A(A[9]), .B(n2), .Y(SUM[9]) );
  AND2X2 U5 ( .A(A[7]), .B(carry[7]), .Y(n3) );
  XOR2X1 U6 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
  XOR2X1 U7 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   N305, N306, N307, n1041, n1042, n1043, n1044, n1045, n1046, n1047,
         n1048, n1049, n1050, n1051, nxt_state, N315, N316, N317, N318,
         \array[0][2] , \array[0][1] , \array[0][0] , \array[1][2] ,
         \array[1][1] , \array[1][0] , \array[2][2] , \array[2][1] ,
         \array[2][0] , \array[3][2] , \array[3][0] , \array[4][0] ,
         \array[5][2] , \array[5][1] , \array[7][0] , N319, N320, N321, N322,
         N323, N324, N325, N326, N327, N328, \array_tmp[0][2] ,
         \array_tmp[0][1] , \array_tmp[0][0] , \array_tmp[1][2] ,
         \array_tmp[1][1] , \array_tmp[1][0] , \array_tmp[2][2] ,
         \array_tmp[2][1] , \array_tmp[2][0] , \array_tmp[3][2] ,
         \array_tmp[3][1] , \array_tmp[3][0] , \array_tmp[4][2] ,
         \array_tmp[4][1] , \array_tmp[4][0] , \array_tmp[5][2] ,
         \array_tmp[5][1] , \array_tmp[5][0] , \array_tmp[6][2] ,
         \array_tmp[6][1] , \array_tmp[6][0] , \array_tmp[7][2] ,
         \array_tmp[7][1] , \array_tmp[7][0] , N330, N331, N346, N347, N348,
         N349, N350, N351, N352, N353, N354, N355, N363, N364, N365, N434,
         N440, N441, N442, N443, N444, N445, N454, N455, N456, N457, N458,
         N459, N460, N461, N462, N463, N464, N465, N466, N467, N468, N469,
         N470, N471, N472, N473, N474, N475, N476, N477, N478, N479, N480,
         N481, N482, N483, N484, N485, N592, N593, N594, N630, N631, N632,
         N664, N665, N666, N761, N762, N763, N800, N801, N802, n71, n72, n73,
         n74, n75, n76, n77, n79, n80, n84, n85, n86, n87, n88, n89, n90, n92,
         n94, n99, n100, n102, n103, n104, n106, n107, n109, n111, n115, n116,
         n117, n119, n122, n123, n124, n125, n127, n130, n131, n132, n133,
         n135, n138, n139, n141, n143, n144, n145, n146, n147, n149, n151,
         n153, n155, n157, n158, n160, n161, n162, n163, n164, n166, n167,
         n169, n170, n171, n172, n173, n174, n175, n176, n178, n179, n181,
         n183, n184, n185, n187, n188, n190, n191, n193, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n206, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n228, n231, n232, n233, n234, n236, n237, n239, n242, n243, n244,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n260, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n272, n273, n274, n278, n280, n281, n283, n286, n288, n289,
         n292, n293, n294, n295, n296, n298, n299, n300, n301, n302, n304,
         n305, n306, n309, n311, n312, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n355, n356, n357, n358, n359,
         n360, n361, n365, n366, n367, n368, n369, n370, n371, n373, n374,
         n375, n376, n377, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n709, n710, n711, n712, n713, n714, n715, n716, n717,
         n718, n719, n720, n728, n744, n745, n746, n747, n748, n749, n750,
         n751, n752, n753, n754, n755, n756, n757, n758, n759, n760, n761,
         n762, n763, n764, n765, n766, n767, n768, n769, n770, n771, n772,
         n773, n774, n775, n776, n777, n778, n779, n780, n781, n782, n783,
         n784, n785, n786, n787, n788, n789, n790, n791, n792, n793, n794,
         n795, n796, n797, n798, n799, n800, n801, n802, n803, n804, n805,
         n806, n807, n808, n809, n810, n811, n812, n813, n814, n815, n816,
         n817, n818, n819, n820, n821, n822, n823, n824, n825, n826, n827,
         n828, n829, n830, n831, n832, n833, n834, n835, n836, n837, n838,
         n839, n840, n841, n842, n843, n844, n845, n846, n847, n848, n849,
         n850, n851, n852, n853, n854, n855, n856, n857, n858, n859, n860,
         n861, n862, n863, n864, n865, n866, n867, n868, n869, n870, n871,
         n872, n873, n874, n875, n876, n877, n878, n879, n880, n881, n882,
         n883, n884, n885, n886, n887, n888, n889, n890, n891, n892, n893,
         n894, n895, n896, n897, n898, n899, n900, n901, n902, n903, n904,
         n905, n906, n907, n908, n909, n910, n911, n912, n913, n914, n915,
         n916, n917, n918, n919, n920, n921, n922, n923, n924, n925, n926,
         n927, n928, n929, n930, n931, n932, n933, n934, n935, n936, n937,
         n938, n939, n940, n941, n942, n943, n944, n945, n946, n947, n948,
         n949, n950, n951, n952, n953, n954, n955, n956, n957, n958, n959,
         n960, n961, n962, n963, n964, n965, n966, n967, n968, n969, n970,
         n971, n972, n973, n974, n975, n976, n977, n978, n979, n980, n981,
         n982, n983, n984, n985, n986, n987, n988, n989, n990, n991, n992,
         n993, n994, n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003,
         n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013,
         n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023,
         n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033,
         n1034, n1035, n1036, n1037, n1038, n1039, n1040;
  wire   [9:0] total_cost;
  wire   [2:0] pivot;
  wire   [2:0] swap_pos;

  OAI211X2 U11 ( .A0(n1022), .A1(n1038), .B0(n84), .C0(n85), .Y(n74) );
  OAI211X2 U17 ( .A0(n1022), .A1(\array[5][2] ), .B0(n73), .C0(n92), .Y(n75)
         );
  OAI21X4 U236 ( .A0(n376), .A1(\array[5][2] ), .B0(n253), .Y(n246) );
  OAI21X4 U242 ( .A0(n373), .A1(n1033), .B0(n255), .Y(n243) );
  OAI22X4 U243 ( .A0(n256), .A1(n257), .B0(n371), .B1(\array[5][2] ), .Y(n255)
         );
  AOI2BB1X4 U250 ( .A0N(\array[3][2] ), .A1N(n371), .B0(n260), .Y(n248) );
  OAI33X2 U251 ( .A0(n1039), .A1(n765), .A2(n746), .B0(n262), .B1(n295), .B2(
        n746), .Y(n260) );
  NAND4X4 U258 ( .A(n367), .B(n264), .C(n263), .D(\array[3][0] ), .Y(n250) );
  OA21X4 U271 ( .A0(n377), .A1(n1037), .B0(n268), .Y(n244) );
  JAM_DW01_add_0 add_107 ( .A(total_cost), .B({1'b0, 1'b0, 1'b0, Cost}), .CI(
        1'b0), .SUM({N328, N327, N326, N325, N324, N323, N322, N321, N320, 
        N319}) );
  DFFRX1 cur_state_reg ( .D(nxt_state), .CK(CLK), .RN(n1003), .Q(n712), .QN(
        n322) );
  DFFRX4 \array_reg[5][1]  ( .D(n337), .CK(CLK), .RN(n932), .Q(\array[5][1] ), 
        .QN(n374) );
  DFFRX4 \array_reg[1][1]  ( .D(n340), .CK(CLK), .RN(n932), .Q(\array[1][1] ), 
        .QN(n305) );
  DFFSX4 \array_reg[2][1]  ( .D(n338), .CK(CLK), .SN(n933), .Q(\array[2][1] ), 
        .QN(n366) );
  DFFNSRX1 \W_reg[1]  ( .D(N306), .CKN(CLK), .SN(1'b1), .RN(1'b1), .QN(n719)
         );
  DFFNSRX1 \J_reg[0]  ( .D(N802), .CKN(CLK), .SN(1'b1), .RN(1'b1), .QN(n715)
         );
  DFFNSRX1 \J_reg[1]  ( .D(N801), .CKN(CLK), .SN(1'b1), .RN(1'b1), .QN(n716)
         );
  DFFNSRX1 \J_reg[2]  ( .D(N800), .CKN(CLK), .SN(1'b1), .RN(1'b1), .QN(n717)
         );
  DFFRX4 \array_reg[4][1]  ( .D(n331), .CK(CLK), .RN(n1003), .Q(n764), .QN(
        n765) );
  DFFRX1 \index_reg[3]  ( .D(N318), .CK(CLK), .RN(n1003), .Q(n1016), .QN(n361)
         );
  DFFX1 \MatchCount_reg[0]  ( .D(n407), .CK(CLK), .Q(n1044), .QN(n1018) );
  DFFX1 \MatchCount_reg[1]  ( .D(n406), .CK(CLK), .Q(n1043), .QN(n1019) );
  DFFX1 \MatchCount_reg[2]  ( .D(n405), .CK(CLK), .Q(n1042), .QN(n1020) );
  DFFX1 \MatchCount_reg[3]  ( .D(n404), .CK(CLK), .Q(n1041) );
  DFFSX1 \MinCost_reg[9]  ( .D(n408), .CK(CLK), .SN(n1003), .QN(n995) );
  DFFSX1 \MinCost_reg[8]  ( .D(n409), .CK(CLK), .SN(n1003), .Q(n1045), .QN(
        n289) );
  DFFSX1 \MinCost_reg[7]  ( .D(n410), .CK(CLK), .SN(n1003), .QN(n994) );
  DFFSX1 \MinCost_reg[6]  ( .D(n411), .CK(CLK), .SN(n1003), .QN(n993) );
  DFFSX1 \MinCost_reg[5]  ( .D(n412), .CK(CLK), .SN(n1003), .Q(n1046), .QN(
        n283) );
  DFFSX1 \MinCost_reg[4]  ( .D(n413), .CK(CLK), .SN(n1003), .Q(n1047), .QN(
        n281) );
  DFFSX1 \MinCost_reg[3]  ( .D(n414), .CK(CLK), .SN(n1003), .Q(n1048), .QN(
        n992) );
  DFFSX1 \MinCost_reg[2]  ( .D(n415), .CK(CLK), .SN(n1003), .QN(n991) );
  DFFSX1 \MinCost_reg[1]  ( .D(n416), .CK(CLK), .SN(n1003), .Q(n1049), .QN(
        n990) );
  DFFSX1 \MinCost_reg[0]  ( .D(n417), .CK(CLK), .SN(n1003), .Q(n1050), .QN(
        n273) );
  DFFSX1 \array_tmp_reg[6][1]  ( .D(n398), .CK(CLK), .SN(n1003), .Q(
        \array_tmp[6][1] ), .QN(n919) );
  DFFSX1 \array_tmp_reg[5][2]  ( .D(n396), .CK(CLK), .SN(n1003), .Q(
        \array_tmp[5][2] ), .QN(n309) );
  DFFSX1 \array_tmp_reg[5][0]  ( .D(n397), .CK(CLK), .SN(n1003), .Q(
        \array_tmp[5][0] ), .QN(n314) );
  DFFSX1 \array_tmp_reg[2][1]  ( .D(n360), .CK(CLK), .SN(n1003), .Q(
        \array_tmp[2][1] ), .QN(n302) );
  DFFSX1 \array_tmp_reg[3][1]  ( .D(n389), .CK(CLK), .SN(n1003), .Q(
        \array_tmp[3][1] ), .QN(n916) );
  DFFSX1 \array_tmp_reg[3][0]  ( .D(n391), .CK(CLK), .SN(n1003), .Q(
        \array_tmp[3][0] ), .QN(n924) );
  DFFSX1 \array_tmp_reg[7][2]  ( .D(n402), .CK(CLK), .SN(n1003), .Q(
        \array_tmp[7][2] ), .QN(n918) );
  DFFSX1 \array_tmp_reg[7][1]  ( .D(n401), .CK(CLK), .SN(n1003), .Q(
        \array_tmp[7][1] ), .QN(n920) );
  DFFSX1 \array_tmp_reg[7][0]  ( .D(n403), .CK(CLK), .SN(n1003), .Q(
        \array_tmp[7][0] ), .QN(n928) );
  DFFSX1 \array_tmp_reg[6][2]  ( .D(n399), .CK(CLK), .SN(n1003), .Q(
        \array_tmp[6][2] ), .QN(n917) );
  DFFSX1 \array_tmp_reg[1][0]  ( .D(n356), .CK(CLK), .SN(n1003), .Q(
        \array_tmp[1][0] ), .QN(n311) );
  DFFRX1 \array_reg[0][2]  ( .D(n353), .CK(CLK), .RN(n1003), .Q(\array[0][2] ), 
        .QN(n321) );
  DFFRX1 \array_reg[0][1]  ( .D(n352), .CK(CLK), .RN(n1003), .Q(\array[0][1] ), 
        .QN(n319) );
  DFFRX1 \array_reg[0][0]  ( .D(n351), .CK(CLK), .RN(n1003), .Q(\array[0][0] ), 
        .QN(n317) );
  DFFRX1 Valid_reg ( .D(n329), .CK(CLK), .RN(n1003), .Q(n1051), .QN(n293) );
  DFFRX1 \index_reg[1]  ( .D(N316), .CK(CLK), .RN(n1003), .Q(N306), .QN(n965)
         );
  DFFRX1 \total_cost_reg[0]  ( .D(N346), .CK(CLK), .RN(n1003), .Q(
        total_cost[0]), .QN(n274) );
  DFFRX1 \total_cost_reg[1]  ( .D(N347), .CK(CLK), .RN(n1003), .Q(
        total_cost[1]), .QN(n1001) );
  DFFRX1 \total_cost_reg[2]  ( .D(N348), .CK(CLK), .RN(n1003), .Q(
        total_cost[2]), .QN(n278) );
  DFFRX1 \total_cost_reg[3]  ( .D(N349), .CK(CLK), .RN(n1003), .Q(
        total_cost[3]), .QN(n280) );
  DFFRX1 \total_cost_reg[4]  ( .D(N350), .CK(CLK), .RN(n1003), .Q(
        total_cost[4]), .QN(n1000) );
  DFFRX1 \total_cost_reg[5]  ( .D(N351), .CK(CLK), .RN(n1003), .Q(
        total_cost[5]), .QN(n999) );
  DFFRX1 \total_cost_reg[6]  ( .D(N352), .CK(CLK), .RN(n1003), .Q(
        total_cost[6]), .QN(n286) );
  DFFRX1 \total_cost_reg[7]  ( .D(N353), .CK(CLK), .RN(n1003), .Q(
        total_cost[7]), .QN(n288) );
  DFFRX1 \total_cost_reg[8]  ( .D(N354), .CK(CLK), .RN(n1003), .Q(
        total_cost[8]), .QN(n997) );
  DFFRX1 \array_tmp_reg[0][2]  ( .D(n387), .CK(CLK), .RN(n1003), .Q(
        \array_tmp[0][2] ), .QN(n320) );
  DFFRX1 \array_tmp_reg[0][1]  ( .D(n386), .CK(CLK), .RN(n1003), .Q(
        \array_tmp[0][1] ), .QN(n318) );
  DFFRX1 \array_tmp_reg[0][0]  ( .D(n388), .CK(CLK), .RN(n1003), .Q(
        \array_tmp[0][0] ), .QN(n316) );
  DFFRX1 \array_tmp_reg[5][1]  ( .D(n395), .CK(CLK), .RN(n1003), .Q(
        \array_tmp[5][1] ), .QN(n301) );
  DFFRX1 \array_tmp_reg[2][0]  ( .D(n358), .CK(CLK), .RN(n1003), .Q(
        \array_tmp[2][0] ), .QN(n306) );
  DFFRX1 \array_tmp_reg[6][0]  ( .D(n400), .CK(CLK), .RN(n1003), .Q(
        \array_tmp[6][0] ), .QN(n921) );
  DFFRX1 \array_tmp_reg[1][1]  ( .D(n357), .CK(CLK), .RN(n1003), .Q(
        \array_tmp[1][1] ), .QN(n304) );
  DFFRX1 \array_tmp_reg[1][2]  ( .D(n355), .CK(CLK), .RN(n1003), .Q(
        \array_tmp[1][2] ), .QN(n298) );
  DFFRX1 \array_tmp_reg[3][2]  ( .D(n390), .CK(CLK), .RN(n1003), .Q(
        \array_tmp[3][2] ), .QN(n923) );
  DFFRX1 \total_cost_reg[9]  ( .D(N355), .CK(CLK), .RN(n1003), .Q(
        total_cost[9]), .QN(n292) );
  DFFRX1 \array_tmp_reg[2][2]  ( .D(n359), .CK(CLK), .RN(n1003), .Q(
        \array_tmp[2][2] ), .QN(n299) );
  DFFNSRXL \W_reg[0]  ( .D(N305), .CKN(CLK), .SN(1'b1), .RN(1'b1), .QN(n718)
         );
  DFFNSRXL \W_reg[2]  ( .D(N307), .CKN(CLK), .SN(1'b1), .RN(1'b1), .QN(n720)
         );
  DFFRX2 \index_reg[0]  ( .D(N315), .CK(CLK), .RN(n1003), .Q(N305), .QN(n967)
         );
  DFFRX2 \index_reg[2]  ( .D(N317), .CK(CLK), .RN(n1003), .Q(N307), .QN(n966)
         );
  DFFSX2 \array_reg[1][0]  ( .D(n347), .CK(CLK), .SN(n934), .Q(\array[1][0] ), 
        .QN(n312) );
  DFFRX1 \array_tmp_reg[4][1]  ( .D(n392), .CK(CLK), .RN(n932), .Q(
        \array_tmp[4][1] ), .QN(n296) );
  DFFRX1 \array_tmp_reg[4][0]  ( .D(n394), .CK(CLK), .RN(n933), .Q(
        \array_tmp[4][0] ), .QN(n294) );
  DFFRX2 \array_reg[2][0]  ( .D(n342), .CK(CLK), .RN(n932), .Q(\array[2][0] ), 
        .QN(n367) );
  DFFSX1 \array_reg[5][2]  ( .D(n345), .CK(CLK), .SN(n934), .Q(\array[5][2] ), 
        .QN(n373) );
  DFFRX2 \array_reg[3][2]  ( .D(n346), .CK(CLK), .RN(n1003), .Q(\array[3][2] ), 
        .QN(n368) );
  DFFRX2 \array_reg[2][2]  ( .D(n334), .CK(CLK), .RN(n932), .Q(\array[2][2] ), 
        .QN(n300) );
  DFFSX2 \array_reg[4][2]  ( .D(n344), .CK(CLK), .SN(n934), .Q(n1033), .QN(
        n371) );
  DFFSX2 \array_reg[3][1]  ( .D(n332), .CK(CLK), .SN(n933), .Q(n1039), .QN(
        n369) );
  DFFSX1 \array_reg[7][0]  ( .D(n350), .CK(CLK), .SN(n934), .Q(\array[7][0] ), 
        .QN(n315) );
  DFFSX1 \array_reg[5][0]  ( .D(n349), .CK(CLK), .SN(n934), .Q(n1031), .QN(
        n375) );
  DFFRX1 \array_reg[1][2]  ( .D(n333), .CK(CLK), .RN(n932), .Q(\array[1][2] ), 
        .QN(n365) );
  DFFSX1 \array_reg[7][2]  ( .D(n336), .CK(CLK), .SN(n933), .Q(n1036), .QN(
        n377) );
  DFFSX2 \array_reg[6][2]  ( .D(n335), .CK(CLK), .SN(n933), .Q(n1037), .QN(
        n376) );
  DFFSHQX2 \array_reg[6][1]  ( .D(n339), .CK(CLK), .SN(n933), .Q(n767) );
  DFFRHQX2 \array_reg[6][0]  ( .D(n343), .CK(CLK), .RN(n932), .Q(n760) );
  DFFRX1 \array_reg[4][0]  ( .D(n330), .CK(CLK), .RN(n933), .Q(\array[4][0] ), 
        .QN(n295) );
  DFFSX1 \array_reg[3][0]  ( .D(n348), .CK(CLK), .SN(n934), .Q(\array[3][0] ), 
        .QN(n370) );
  DFFSX1 \array_tmp_reg[4][2]  ( .D(n393), .CK(CLK), .SN(n934), .Q(
        \array_tmp[4][2] ), .QN(n922) );
  DFFSRX2 \array_reg[7][1]  ( .D(n341), .CK(CLK), .SN(n1003), .RN(1'b1), .Q(
        n758), .QN(n759) );
  INVX8 U600 ( .A(pivot[2]), .Y(n1029) );
  OA21X1 U601 ( .A0(n840), .A1(n887), .B0(n876), .Y(n855) );
  OAI22X1 U602 ( .A0(n315), .A1(N763), .B0(n759), .B1(N762), .Y(n104) );
  INVX6 U603 ( .A(n773), .Y(N762) );
  NAND2X1 U604 ( .A(n820), .B(n819), .Y(N482) );
  OA21X1 U605 ( .A0(n847), .A1(n887), .B0(n880), .Y(n857) );
  INVX3 U606 ( .A(n206), .Y(n1007) );
  BUFX4 U607 ( .A(n837), .Y(n709) );
  NOR2X1 U608 ( .A(n885), .B(n889), .Y(n837) );
  BUFX8 U609 ( .A(n808), .Y(n710) );
  NOR2BX4 U610 ( .AN(n853), .B(n748), .Y(n864) );
  NOR2X4 U611 ( .A(n895), .B(swap_pos[1]), .Y(n853) );
  AOI221X1 U612 ( .A0(n1028), .A1(n153), .B0(N466), .B1(n1006), .C0(n175), .Y(
        n174) );
  AOI221X2 U613 ( .A0(n1028), .A1(n157), .B0(N468), .B1(n1006), .C0(n173), .Y(
        n172) );
  NAND2X4 U614 ( .A(n814), .B(n813), .Y(N480) );
  AOI222X4 U615 ( .A0(N444), .A1(n867), .B0(n812), .B1(n885), .C0(N444), .C1(
        n838), .Y(n813) );
  OR2X2 U616 ( .A(n885), .B(n889), .Y(n774) );
  INVX8 U617 ( .A(n825), .Y(n889) );
  NOR2X8 U618 ( .A(n887), .B(n892), .Y(n838) );
  NOR2X8 U619 ( .A(n887), .B(n748), .Y(n867) );
  OAI211X4 U620 ( .A0(\array_tmp[5][0] ), .A1(n848), .B0(n885), .C0(n832), .Y(
        n876) );
  OA22XL U621 ( .A0(n895), .A1(\array_tmp[4][0] ), .B0(n889), .B1(
        \array_tmp[1][0] ), .Y(n832) );
  OAI211X4 U622 ( .A0(\array_tmp[5][2] ), .A1(n848), .B0(n885), .C0(n834), .Y(
        n880) );
  OA22XL U623 ( .A0(n895), .A1(\array_tmp[4][2] ), .B0(n889), .B1(
        \array_tmp[1][2] ), .Y(n834) );
  NOR2X8 U624 ( .A(n144), .B(n1010), .Y(n139) );
  INVX8 U625 ( .A(n135), .Y(n1010) );
  BUFX3 U626 ( .A(n251), .Y(n711) );
  AOI221X4 U627 ( .A0(n1033), .A1(n806), .B0(n1037), .B1(n807), .C0(n786), .Y(
        n787) );
  AOI221X1 U628 ( .A0(n1031), .A1(n806), .B0(\array[7][0] ), .B1(n807), .C0(
        n777), .Y(n780) );
  AO22XL U629 ( .A0(\array[3][0] ), .A1(n713), .B0(\array[1][0] ), .B1(n766), 
        .Y(n777) );
  BUFX12 U630 ( .A(n800), .Y(n807) );
  OAI22X1 U631 ( .A0(N763), .A1(n761), .B0(N762), .B1(n768), .Y(n109) );
  AOI221XL U632 ( .A0(n1024), .A1(\array[4][0] ), .B0(n1023), .B1(n764), .C0(
        n111), .Y(n89) );
  CLKINVX6 U633 ( .A(swap_pos[2]), .Y(n1021) );
  NOR2X4 U634 ( .A(n888), .B(n894), .Y(n825) );
  INVX12 U635 ( .A(n895), .Y(n888) );
  AOI221X1 U636 ( .A0(\array[5][1] ), .A1(n806), .B0(n758), .B1(n807), .C0(
        n781), .Y(n784) );
  INVX3 U637 ( .A(n896), .Y(n747) );
  BUFX12 U638 ( .A(swap_pos[0]), .Y(n895) );
  OAI211X1 U639 ( .A0(\array[2][1] ), .A1(n305), .B0(n312), .C0(\array[2][0] ), 
        .Y(n756) );
  CLKAND2X8 U640 ( .A(n100), .B(n76), .Y(n73) );
  OR2X2 U641 ( .A(n366), .B(n1039), .Y(n264) );
  CLKINVX1 U642 ( .A(n749), .Y(n263) );
  OAI21X2 U643 ( .A0(n369), .A1(n764), .B0(n370), .Y(n262) );
  AOI2BB2XL U644 ( .B0(n888), .B1(n843), .A0N(n889), .A1N(\array_tmp[3][1] ), 
        .Y(n844) );
  AOI2BB2XL U645 ( .B0(n888), .B1(n840), .A0N(n889), .A1N(\array_tmp[3][0] ), 
        .Y(n841) );
  INVX1 U646 ( .A(n295), .Y(n1040) );
  AOI221XL U647 ( .A0(n1024), .A1(n1031), .B0(n1023), .B1(n1035), .C0(n99), 
        .Y(n94) );
  INVX3 U648 ( .A(n762), .Y(n99) );
  AO21X1 U649 ( .A0(n1023), .A1(n116), .B0(n1034), .Y(n117) );
  NOR2BX2 U650 ( .AN(n72), .B(swap_pos[2]), .Y(n85) );
  NAND3X1 U651 ( .A(n77), .B(n1021), .C(n79), .Y(n71) );
  CLKINVX1 U652 ( .A(n756), .Y(n266) );
  INVX3 U653 ( .A(pivot[0]), .Y(n804) );
  BUFX4 U654 ( .A(n798), .Y(n766) );
  BUFX4 U655 ( .A(n801), .Y(n806) );
  AND3X2 U656 ( .A(n248), .B(n249), .C(n250), .Y(n247) );
  AOI221XL U657 ( .A0(N445), .A1(n888), .B0(N445), .B1(swap_pos[1]), .C0(n757), 
        .Y(n809) );
  NAND2X1 U658 ( .A(total_cost[2]), .B(n991), .Y(n984) );
  OAI222XL U659 ( .A0(n980), .A1(n979), .B0(total_cost[6]), .B1(n993), .C0(
        total_cost[7]), .C1(n994), .Y(n981) );
  AO22X1 U660 ( .A0(N443), .A1(n885), .B0(N443), .B1(n888), .Y(n815) );
  INVX1 U661 ( .A(n365), .Y(n1038) );
  NOR2X4 U662 ( .A(n1033), .B(n368), .Y(n746) );
  AO22X1 U663 ( .A0(N484), .A1(n145), .B0(n146), .B1(N440), .Y(n135) );
  AOI32X1 U664 ( .A0(swap_pos[1]), .A1(n748), .A2(N441), .B0(N441), .B1(n846), 
        .Y(n822) );
  CLKINVX1 U665 ( .A(n147), .Y(n1009) );
  OAI21X2 U666 ( .A0(n771), .A1(n772), .B0(n163), .Y(n196) );
  AO21X1 U667 ( .A0(N480), .A1(n1006), .B0(n931), .Y(n771) );
  CLKBUFX3 U668 ( .A(n239), .Y(n930) );
  AOI2BB1X1 U669 ( .A0N(n237), .A1N(n1017), .B0(RST), .Y(n234) );
  CLKINVX1 U670 ( .A(n760), .Y(n761) );
  NAND2X1 U671 ( .A(n752), .B(n753), .Y(n394) );
  NAND2X1 U672 ( .A(n750), .B(n751), .Y(n392) );
  AOI221XL U673 ( .A0(n931), .A1(\array_tmp[5][1] ), .B0(N464), .B1(n1006), 
        .C0(n183), .Y(n181) );
  OAI21XL U674 ( .A0(n918), .A1(n215), .B0(n219), .Y(n402) );
  OAI22XL U675 ( .A0(n924), .A1(n1004), .B0(n174), .B1(n167), .Y(n391) );
  OAI22XL U676 ( .A0(n916), .A1(n1004), .B0(n166), .B1(n167), .Y(n389) );
  AOI221XL U677 ( .A0(n1028), .A1(n160), .B0(N467), .B1(n1006), .C0(n169), .Y(
        n166) );
  NAND2X1 U678 ( .A(n744), .B(n745), .Y(n393) );
  OAI22X4 U679 ( .A0(n804), .A1(n728), .B0(pivot[0]), .B1(n779), .Y(N763) );
  NAND2X4 U680 ( .A(n894), .B(n895), .Y(n848) );
  AOI2BB2X1 U681 ( .B0(n709), .B1(\array_tmp[3][2] ), .A0N(N478), .A1N(n918), 
        .Y(n870) );
  NOR2X4 U682 ( .A(n1027), .B(pivot[2]), .Y(n713) );
  INVX3 U683 ( .A(n747), .Y(n748) );
  CLKINVX1 U684 ( .A(n896), .Y(n894) );
  AND2X2 U685 ( .A(n73), .B(n71), .Y(n714) );
  AOI221XL U686 ( .A0(n931), .A1(\array_tmp[5][0] ), .B0(N463), .B1(n1006), 
        .C0(n190), .Y(n188) );
  AOI221XL U687 ( .A0(n931), .A1(\array_tmp[5][2] ), .B0(N465), .B1(n1006), 
        .C0(n187), .Y(n185) );
  NOR2X2 U688 ( .A(n965), .B(N305), .Y(n962) );
  AOI32XL U689 ( .A0(N305), .A1(N306), .A2(n966), .B0(n965), .B1(N307), .Y(
        n272) );
  INVX12 U690 ( .A(n717), .Y(J[2]) );
  INVX12 U691 ( .A(n716), .Y(J[1]) );
  INVX12 U692 ( .A(n715), .Y(J[0]) );
  INVX12 U693 ( .A(n720), .Y(W[2]) );
  INVX12 U694 ( .A(n719), .Y(W[1]) );
  INVX12 U695 ( .A(n718), .Y(W[0]) );
  INVX12 U696 ( .A(RST), .Y(n1003) );
  CLKBUFX3 U698 ( .A(n780), .Y(n728) );
  OA22X2 U699 ( .A0(n804), .A1(n784), .B0(pivot[0]), .B1(n783), .Y(n773) );
  AOI221X1 U700 ( .A0(n764), .A1(n806), .B0(n767), .B1(n807), .C0(n782), .Y(
        n783) );
  AO22XL U701 ( .A0(n1039), .A1(n713), .B0(\array[1][1] ), .B1(n766), .Y(n781)
         );
  AOI221X1 U702 ( .A0(\array[4][0] ), .A1(n806), .B0(n760), .B1(n807), .C0(
        n778), .Y(n779) );
  AO22XL U703 ( .A0(\array[2][0] ), .A1(n713), .B0(\array[0][0] ), .B1(n766), 
        .Y(n778) );
  NAND2X4 U704 ( .A(n244), .B(n711), .Y(n242) );
  AOI2BB2X1 U705 ( .B0(n709), .B1(\array_tmp[3][1] ), .A0N(N478), .A1N(n920), 
        .Y(n863) );
  BUFX8 U706 ( .A(n886), .Y(N478) );
  OAI21X1 U707 ( .A0(n928), .A1(n215), .B0(n220), .Y(n403) );
  OAI21X1 U708 ( .A0(n920), .A1(n215), .B0(n216), .Y(n401) );
  OAI2BB1X2 U709 ( .A0N(n1002), .A1N(n145), .B0(n221), .Y(n215) );
  AOI32XL U710 ( .A0(n895), .A1(n885), .A2(N434), .B0(N434), .B1(n838), .Y(
        n826) );
  AOI221X4 U711 ( .A0(N444), .A1(n709), .B0(N444), .B1(n710), .C0(n897), .Y(
        n814) );
  AOI2BB2X1 U712 ( .B0(n709), .B1(\array_tmp[3][0] ), .A0N(N478), .A1N(n928), 
        .Y(n860) );
  INVX12 U713 ( .A(n757), .Y(n887) );
  OAI22X1 U714 ( .A0(total_cost[9]), .A1(n995), .B0(n996), .B1(n983), .Y(N330)
         );
  BUFX16 U715 ( .A(n1041), .Y(MatchCount[3]) );
  AO21XL U716 ( .A0(n775), .A1(MatchCount[3]), .B0(n776), .Y(n404) );
  BUFX12 U717 ( .A(n1046), .Y(MinCost[5]) );
  BUFX12 U718 ( .A(n1051), .Y(Valid) );
  CLKINVX1 U719 ( .A(N364), .Y(n883) );
  OAI22X1 U720 ( .A0(n804), .A1(n796), .B0(pivot[0]), .B1(n795), .Y(N364) );
  INVX12 U721 ( .A(n995), .Y(MinCost[9]) );
  INVX12 U722 ( .A(n991), .Y(MinCost[2]) );
  INVX12 U723 ( .A(n994), .Y(MinCost[7]) );
  INVX12 U724 ( .A(n993), .Y(MinCost[6]) );
  BUFX12 U725 ( .A(n1050), .Y(MinCost[0]) );
  NOR2BXL U726 ( .AN(n1050), .B(total_cost[0]), .Y(n973) );
  INVX12 U727 ( .A(n990), .Y(MinCost[1]) );
  AO21XL U728 ( .A0(n1001), .A1(n973), .B0(n1049), .Y(n972) );
  INVX12 U729 ( .A(n1018), .Y(MatchCount[0]) );
  INVX12 U730 ( .A(n1019), .Y(MatchCount[1]) );
  INVX12 U731 ( .A(n992), .Y(MinCost[3]) );
  NOR2BXL U732 ( .AN(total_cost[3]), .B(n1048), .Y(n987) );
  INVX12 U733 ( .A(n1020), .Y(MatchCount[2]) );
  BUFX12 U734 ( .A(n1045), .Y(MinCost[8]) );
  AOI32XL U735 ( .A0(n982), .A1(n998), .A2(n981), .B0(n1045), .B1(n997), .Y(
        n983) );
  BUFX12 U736 ( .A(n1047), .Y(MinCost[4]) );
  NOR2XL U737 ( .A(n1000), .B(n1047), .Y(n986) );
  OR2XL U738 ( .A(n922), .B(n179), .Y(n744) );
  OR2XL U739 ( .A(n1008), .B(n185), .Y(n745) );
  NOR3X1 U740 ( .A(n754), .B(n755), .C(n709), .Y(n820) );
  CLKBUFX2 U741 ( .A(n1021), .Y(n896) );
  NOR2BX4 U742 ( .AN(n368), .B(n300), .Y(n749) );
  NOR2X1 U743 ( .A(n885), .B(n895), .Y(n821) );
  OR2XL U744 ( .A(n296), .B(n179), .Y(n750) );
  OR2XL U745 ( .A(n1008), .B(n181), .Y(n751) );
  OAI21X2 U746 ( .A0(n1023), .A1(n767), .B0(n109), .Y(n107) );
  CLKINVX2 U747 ( .A(N762), .Y(n1023) );
  OR2XL U748 ( .A(n294), .B(n179), .Y(n752) );
  OR2XL U749 ( .A(n1008), .B(n188), .Y(n753) );
  INVX4 U750 ( .A(n179), .Y(n1008) );
  AND2XL U751 ( .A(N442), .B(n897), .Y(n754) );
  AND2XL U752 ( .A(N442), .B(n825), .Y(n755) );
  BUFX12 U753 ( .A(n865), .Y(n897) );
  INVX4 U754 ( .A(n305), .Y(n1034) );
  NAND2X8 U755 ( .A(n714), .B(n72), .Y(swap_pos[1]) );
  NAND3X4 U756 ( .A(n86), .B(n1021), .C(n87), .Y(n72) );
  NOR2X6 U757 ( .A(n889), .B(swap_pos[1]), .Y(n846) );
  OAI211X2 U758 ( .A0(\array_tmp[7][0] ), .A1(n848), .B0(swap_pos[1]), .C0(
        n841), .Y(n875) );
  OAI211X4 U759 ( .A0(n895), .A1(n884), .B0(swap_pos[1]), .C0(n849), .Y(n879)
         );
  NOR2X1 U760 ( .A(n848), .B(swap_pos[1]), .Y(n865) );
  OAI211X2 U761 ( .A0(\array_tmp[7][1] ), .A1(n848), .B0(swap_pos[1]), .C0(
        n844), .Y(n877) );
  INVX20 U762 ( .A(swap_pos[1]), .Y(n885) );
  BUFX6 U763 ( .A(n821), .Y(n757) );
  OA21X1 U764 ( .A0(n843), .A1(n887), .B0(n878), .Y(n856) );
  OAI211X4 U765 ( .A0(\array_tmp[5][1] ), .A1(n848), .B0(n885), .C0(n833), .Y(
        n878) );
  NAND2XL U766 ( .A(n888), .B(n748), .Y(n866) );
  AOI22X1 U767 ( .A0(N434), .A1(n867), .B0(N434), .B1(n864), .Y(n827) );
  AO22X1 U768 ( .A0(\array[2][2] ), .A1(n713), .B0(\array[0][2] ), .B1(n766), 
        .Y(n786) );
  INVX4 U769 ( .A(n763), .Y(n249) );
  OR2X4 U770 ( .A(n373), .B(N761), .Y(n762) );
  OAI32X4 U771 ( .A0(\array[2][1] ), .A1(n369), .A2(n749), .B0(n368), .B1(
        \array[2][2] ), .Y(n763) );
  AOI31X1 U772 ( .A0(N762), .A1(n762), .A2(n374), .B0(n94), .Y(n92) );
  NOR2X2 U773 ( .A(n767), .B(n374), .Y(n125) );
  INVX1 U774 ( .A(n767), .Y(n768) );
  NOR2BX1 U775 ( .AN(n1027), .B(pivot[2]), .Y(n798) );
  CLKINVX2 U776 ( .A(n246), .Y(n1030) );
  OAI22X4 U777 ( .A0(n804), .A1(n788), .B0(pivot[0]), .B1(n787), .Y(N761) );
  INVXL U778 ( .A(n1027), .Y(n805) );
  AND2XL U779 ( .A(\array[5][2] ), .B(n806), .Y(n769) );
  AND2XL U780 ( .A(n1036), .B(n807), .Y(n770) );
  NOR3X1 U781 ( .A(n769), .B(n770), .C(n785), .Y(n788) );
  AO22X1 U782 ( .A0(\array[3][2] ), .A1(n713), .B0(\array[1][2] ), .B1(n766), 
        .Y(n785) );
  AOI22XL U783 ( .A0(N593), .A1(n217), .B0(N455), .B1(n218), .Y(n216) );
  INVX16 U784 ( .A(n242), .Y(pivot[0]) );
  CLKINVX2 U785 ( .A(N761), .Y(n1022) );
  INVXL U786 ( .A(n248), .Y(n1032) );
  CLKINVX1 U787 ( .A(N363), .Y(n890) );
  CLKINVX1 U788 ( .A(N365), .Y(n882) );
  OAI21X4 U789 ( .A0(n373), .A1(n1037), .B0(n254), .Y(n253) );
  OAI32X4 U790 ( .A0(n1031), .A1(n761), .A2(n125), .B0(n768), .B1(n1035), .Y(
        n254) );
  AOI31XL U791 ( .A0(n258), .A1(n250), .A2(n249), .B0(n1032), .Y(n252) );
  AOI22XL U792 ( .A0(N594), .A1(n217), .B0(N456), .B1(n218), .Y(n219) );
  AOI22XL U793 ( .A0(N592), .A1(n217), .B0(N454), .B1(n218), .Y(n220) );
  NOR2XL U794 ( .A(n366), .B(n1034), .Y(n267) );
  NOR2X1 U795 ( .A(n987), .B(n986), .Y(n976) );
  NAND2BX1 U796 ( .AN(n978), .B(n977), .Y(n979) );
  NAND2X1 U797 ( .A(total_cost[6]), .B(n993), .Y(n977) );
  NOR2XL U798 ( .A(n997), .B(n1045), .Y(n971) );
  NOR2XL U799 ( .A(n999), .B(n1046), .Y(n978) );
  AO22X1 U800 ( .A0(\array_tmp[3][0] ), .A1(n713), .B0(\array_tmp[1][0] ), 
        .B1(n766), .Y(n789) );
  AO22X1 U801 ( .A0(\array_tmp[3][2] ), .A1(n713), .B0(\array_tmp[1][2] ), 
        .B1(n766), .Y(n797) );
  NAND3BX4 U802 ( .AN(n243), .B(n244), .C(n1030), .Y(pivot[2]) );
  INVX16 U803 ( .A(pivot[1]), .Y(n1027) );
  NAND2BX4 U804 ( .AN(n176), .B(n163), .Y(n167) );
  OA21XL U805 ( .A0(N443), .A1(N442), .B0(n1012), .Y(n772) );
  CLKINVX4 U806 ( .A(N478), .Y(n1002) );
  INVXL U807 ( .A(n1027), .Y(n929) );
  NAND2BXL U808 ( .AN(n1027), .B(pivot[2]), .Y(n912) );
  NAND3BXL U809 ( .AN(N330), .B(n985), .C(n984), .Y(n988) );
  NOR2BX1 U810 ( .AN(n163), .B(n144), .Y(n145) );
  NOR2BX1 U811 ( .AN(n163), .B(n161), .Y(n146) );
  INVXL U812 ( .A(n374), .Y(n1035) );
  OAI22X1 U813 ( .A0(n923), .A1(n1004), .B0(n172), .B1(n167), .Y(n390) );
  NAND2XL U814 ( .A(N472), .B(n139), .Y(n141) );
  NAND2XL U815 ( .A(\array_tmp[1][1] ), .B(n846), .Y(n861) );
  NAND2XL U816 ( .A(\array_tmp[1][2] ), .B(n846), .Y(n868) );
  NAND2XL U817 ( .A(\array_tmp[1][0] ), .B(n846), .Y(n858) );
  AOI211X2 U818 ( .A0(n374), .A1(n764), .B0(n1040), .C0(n375), .Y(n256) );
  AOI211XL U819 ( .A0(n759), .A1(n767), .B0(n760), .C0(n315), .Y(n269) );
  NOR2XL U820 ( .A(n759), .B(n767), .Y(n270) );
  INVX1 U821 ( .A(n847), .Y(n884) );
  OA22XL U822 ( .A0(n889), .A1(\array_tmp[3][2] ), .B0(\array_tmp[7][2] ), 
        .B1(n848), .Y(n849) );
  AOI22XL U823 ( .A0(n897), .A1(\array_tmp[5][0] ), .B0(n864), .B1(
        \array_tmp[4][0] ), .Y(n871) );
  NOR4XL U824 ( .A(n228), .B(n1020), .C(n1019), .D(MatchCount[3]), .Y(n776) );
  NOR2BXL U825 ( .AN(total_cost[0]), .B(n1050), .Y(n968) );
  NAND2X1 U826 ( .A(n965), .B(N305), .Y(n144) );
  NOR2X1 U827 ( .A(n161), .B(n920), .Y(n160) );
  NOR2X1 U828 ( .A(n161), .B(n928), .Y(n153) );
  NOR2X1 U829 ( .A(n161), .B(n918), .Y(n157) );
  NAND4BXL U830 ( .AN(n367), .B(n1038), .C(n131), .D(n132), .Y(n122) );
  NAND4XL U831 ( .A(n369), .B(n366), .C(n130), .D(n373), .Y(n123) );
  NAND3XL U832 ( .A(n125), .B(n746), .C(n127), .Y(n124) );
  NOR4XL U833 ( .A(n133), .B(n305), .C(n295), .D(n300), .Y(n132) );
  OR2XL U834 ( .A(n317), .B(n761), .Y(n133) );
  NOR2XL U835 ( .A(n765), .B(n1037), .Y(n130) );
  OAI22X1 U836 ( .A0(n804), .A1(n792), .B0(pivot[0]), .B1(n791), .Y(N365) );
  OAI22X1 U837 ( .A0(n803), .A1(n804), .B0(pivot[0]), .B1(n802), .Y(N363) );
  CLKINVX1 U838 ( .A(n903), .Y(n925) );
  CLKINVX1 U839 ( .A(n748), .Y(n892) );
  CLKINVX1 U840 ( .A(n167), .Y(n1004) );
  CLKINVX1 U841 ( .A(n196), .Y(n1005) );
  CLKINVX1 U842 ( .A(n710), .Y(n886) );
  NOR2X1 U843 ( .A(n1029), .B(n805), .Y(n801) );
  NOR2X1 U844 ( .A(n1029), .B(n1027), .Y(n800) );
  NAND2BX1 U845 ( .AN(n1027), .B(n1029), .Y(n911) );
  NAND2X1 U846 ( .A(n1027), .B(n1029), .Y(n212) );
  NOR2X2 U847 ( .A(n1029), .B(n1027), .Y(N445) );
  INVX3 U848 ( .A(n222), .Y(n1028) );
  CLKINVX1 U849 ( .A(n904), .Y(n926) );
  CLKINVX1 U850 ( .A(N440), .Y(n1025) );
  NAND2X1 U851 ( .A(n212), .B(n222), .Y(n214) );
  INVX3 U852 ( .A(n939), .Y(n936) );
  INVX3 U853 ( .A(n938), .Y(n937) );
  CLKINVX1 U854 ( .A(n748), .Y(n891) );
  AO22X1 U855 ( .A0(N483), .A1(n145), .B0(n931), .B1(n163), .Y(n147) );
  NAND4BX1 U856 ( .AN(n838), .B(n824), .C(n823), .D(n822), .Y(N483) );
  AOI211X1 U857 ( .A0(N482), .A1(n1006), .B0(n931), .C0(n1011), .Y(n176) );
  CLKINVX1 U858 ( .A(n178), .Y(n1011) );
  OAI2BB1X1 U859 ( .A0N(N481), .A1N(n145), .B0(n193), .Y(n179) );
  OAI21XL U860 ( .A0(n1028), .A1(N434), .B0(n146), .Y(n193) );
  OAI2BB1X1 U861 ( .A0N(N479), .A1N(n145), .B0(n213), .Y(n206) );
  OAI21XL U862 ( .A0(N444), .A1(n214), .B0(n146), .Y(n213) );
  CLKINVX1 U863 ( .A(N445), .Y(n881) );
  AND2X2 U864 ( .A(N485), .B(n145), .Y(n164) );
  INVX3 U865 ( .A(n930), .Y(n1017) );
  OAI21XL U866 ( .A0(n197), .A1(n214), .B0(n146), .Y(n221) );
  NOR2BX2 U867 ( .AN(n197), .B(n1026), .Y(N443) );
  NOR2X2 U868 ( .A(n1029), .B(pivot[1]), .Y(n197) );
  NOR2X2 U869 ( .A(n212), .B(n1026), .Y(N440) );
  NAND2BX1 U870 ( .AN(n191), .B(n1012), .Y(n178) );
  NAND2X1 U871 ( .A(pivot[1]), .B(n1029), .Y(n222) );
  CLKINVX1 U872 ( .A(n191), .Y(N441) );
  NAND2X1 U873 ( .A(n1028), .B(n1012), .Y(n199) );
  NAND2X1 U874 ( .A(n1026), .B(n931), .Y(n170) );
  NAND2X1 U875 ( .A(n1028), .B(n191), .Y(n184) );
  NAND2X1 U876 ( .A(n931), .B(N440), .Y(n171) );
  CLKINVX1 U877 ( .A(pivot[0]), .Y(n927) );
  NAND2BX1 U878 ( .AN(n931), .B(n199), .Y(n209) );
  CLKBUFX3 U879 ( .A(n948), .Y(n939) );
  CLKBUFX3 U880 ( .A(n947), .Y(n940) );
  CLKBUFX3 U881 ( .A(n946), .Y(n945) );
  CLKBUFX3 U882 ( .A(n948), .Y(n938) );
  CLKBUFX3 U883 ( .A(n947), .Y(n941) );
  CLKBUFX3 U884 ( .A(n947), .Y(n942) );
  CLKBUFX3 U885 ( .A(n946), .Y(n944) );
  CLKBUFX3 U886 ( .A(n946), .Y(n943) );
  CLKBUFX3 U887 ( .A(n1003), .Y(n934) );
  CLKBUFX3 U888 ( .A(n1003), .Y(n933) );
  CLKBUFX3 U889 ( .A(n1003), .Y(n932) );
  CLKINVX1 U890 ( .A(n748), .Y(n893) );
  NAND2BX1 U891 ( .AN(N330), .B(N331), .Y(n231) );
  CLKINVX1 U892 ( .A(N763), .Y(n1024) );
  NAND2XL U893 ( .A(N330), .B(n945), .Y(n239) );
  NOR2BX1 U894 ( .AN(n215), .B(n161), .Y(n217) );
  NOR2BX1 U895 ( .AN(n215), .B(n144), .Y(n218) );
  AND2X2 U896 ( .A(N325), .B(n937), .Y(N352) );
  AND2X2 U897 ( .A(N324), .B(n937), .Y(N351) );
  AND2X2 U898 ( .A(N323), .B(n937), .Y(N350) );
  AND2X2 U899 ( .A(N322), .B(n937), .Y(N349) );
  AND2X2 U900 ( .A(N321), .B(n937), .Y(N348) );
  AND2X2 U901 ( .A(N320), .B(n937), .Y(N347) );
  NOR2BX2 U902 ( .AN(n197), .B(n242), .Y(N444) );
  NOR2X2 U903 ( .A(n242), .B(n212), .Y(N434) );
  NOR2X2 U904 ( .A(n242), .B(n222), .Y(N442) );
  NAND2X1 U905 ( .A(n1028), .B(n242), .Y(n191) );
  CLKINVX1 U906 ( .A(n242), .Y(n1026) );
  NOR2X1 U907 ( .A(n1025), .B(n161), .Y(n151) );
  CLKBUFX3 U908 ( .A(n162), .Y(n931) );
  NOR2X1 U909 ( .A(n212), .B(n161), .Y(n162) );
  NOR3X2 U910 ( .A(n940), .B(N307), .C(n1016), .Y(n163) );
  CLKINVX1 U911 ( .A(n161), .Y(n1012) );
  INVX3 U912 ( .A(n144), .Y(n1006) );
  CLKINVX1 U913 ( .A(n160), .Y(n1015) );
  CLKINVX1 U914 ( .A(n153), .Y(n1013) );
  CLKINVX1 U915 ( .A(n157), .Y(n1014) );
  CLKINVX1 U916 ( .A(n935), .Y(n948) );
  CLKINVX1 U917 ( .A(n935), .Y(n946) );
  CLKINVX1 U918 ( .A(n935), .Y(n947) );
  NOR3X1 U919 ( .A(\array[1][0] ), .B(n1031), .C(\array[3][0] ), .Y(n127) );
  NOR2X1 U920 ( .A(n1016), .B(N305), .Y(N315) );
  AOI2BB1X1 U921 ( .A0N(n1006), .A1N(n1012), .B0(n1016), .Y(N316) );
  CLKINVX1 U922 ( .A(n985), .Y(n996) );
  CLKINVX1 U923 ( .A(n971), .Y(n998) );
  OAI22XL U924 ( .A0(n919), .A1(n170), .B0(n301), .B1(n171), .Y(n169) );
  OAI22XL U925 ( .A0(n921), .A1(n170), .B0(n314), .B1(n171), .Y(n175) );
  OAI21XL U926 ( .A0(n252), .A1(n243), .B0(n1030), .Y(n251) );
  OAI21XL U927 ( .A0(n300), .A1(n1038), .B0(n265), .Y(n258) );
  NOR2X1 U928 ( .A(n936), .B(n231), .Y(n237) );
  OAI22X1 U929 ( .A0(n269), .A1(n270), .B0(n376), .B1(n1036), .Y(n268) );
  OAI22XL U930 ( .A0(n365), .A1(\array[2][2] ), .B0(n266), .B1(n267), .Y(n265)
         );
  NOR2X1 U931 ( .A(n374), .B(n764), .Y(n257) );
  OAI221XL U932 ( .A0(n369), .A1(N762), .B0(n370), .B1(N763), .C0(n80), .Y(n77) );
  OAI221XL U933 ( .A0(n366), .A1(N762), .B0(n367), .B1(N763), .C0(n88), .Y(n86) );
  OAI21X2 U934 ( .A0(n1022), .A1(n1036), .B0(n102), .Y(n76) );
  OAI21X2 U935 ( .A0(N761), .A1(n377), .B0(n103), .Y(n102) );
  OAI2BB1X1 U936 ( .A0N(N762), .A1N(n759), .B0(n104), .Y(n103) );
  OAI22XL U937 ( .A0(n917), .A1(n206), .B0(n1007), .B1(n210), .Y(n399) );
  AOI222XL U938 ( .A0(N459), .A1(n1006), .B0(n197), .B1(n157), .C0(N632), .C1(
        n209), .Y(n210) );
  OAI22XL U939 ( .A0(n919), .A1(n206), .B0(n1007), .B1(n208), .Y(n398) );
  AOI222XL U940 ( .A0(N458), .A1(n1006), .B0(n197), .B1(n160), .C0(N631), .C1(
        n209), .Y(n208) );
  NOR2X1 U941 ( .A(n371), .B(N761), .Y(n111) );
  OAI22XL U942 ( .A0(n309), .A1(n1005), .B0(n200), .B1(n196), .Y(n396) );
  AOI221XL U943 ( .A0(n197), .A1(n157), .B0(N462), .B1(n1006), .C0(n201), .Y(
        n200) );
  OAI2BB2XL U944 ( .B0(n917), .B1(n199), .A0N(N666), .A1N(n931), .Y(n201) );
  OAI22XL U945 ( .A0(n314), .A1(n1005), .B0(n202), .B1(n196), .Y(n397) );
  AOI221XL U946 ( .A0(n197), .A1(n153), .B0(N460), .B1(n1006), .C0(n203), .Y(
        n202) );
  OAI2BB2XL U947 ( .B0(n921), .B1(n199), .A0N(N664), .A1N(n931), .Y(n203) );
  OAI22XL U948 ( .A0(n302), .A1(n147), .B0(n1009), .B1(n158), .Y(n360) );
  AOI222XL U949 ( .A0(N470), .A1(n1006), .B0(n151), .B1(\array_tmp[6][1] ), 
        .C0(n160), .C1(n1025), .Y(n158) );
  OAI22XL U950 ( .A0(n301), .A1(n1005), .B0(n195), .B1(n196), .Y(n395) );
  AOI221XL U951 ( .A0(n197), .A1(n160), .B0(N461), .B1(n1006), .C0(n198), .Y(
        n195) );
  OAI2BB2XL U952 ( .B0(n919), .B1(n199), .A0N(N665), .A1N(n931), .Y(n198) );
  OAI22XL U953 ( .A0(n299), .A1(n147), .B0(n1009), .B1(n155), .Y(n359) );
  AOI222XL U954 ( .A0(N471), .A1(n1006), .B0(n151), .B1(\array_tmp[6][2] ), 
        .C0(n157), .C1(n1025), .Y(n155) );
  OAI22XL U955 ( .A0(n306), .A1(n147), .B0(n1009), .B1(n149), .Y(n358) );
  AOI222XL U956 ( .A0(N469), .A1(n1006), .B0(n151), .B1(\array_tmp[6][0] ), 
        .C0(n153), .C1(n1025), .Y(n149) );
  OAI22XL U957 ( .A0(n917), .A1(n178), .B0(n1014), .B1(n184), .Y(n187) );
  OAI22XL U958 ( .A0(n917), .A1(n170), .B0(n309), .B1(n171), .Y(n173) );
  OAI22XL U959 ( .A0(n921), .A1(n178), .B0(n1013), .B1(n184), .Y(n190) );
  OAI22XL U960 ( .A0(n919), .A1(n178), .B0(n1015), .B1(n184), .Y(n183) );
  OAI22XL U961 ( .A0(n921), .A1(n206), .B0(n1007), .B1(n211), .Y(n400) );
  AOI222XL U962 ( .A0(N457), .A1(n1006), .B0(n197), .B1(n153), .C0(N630), .C1(
        n209), .Y(n211) );
  OA21XL U963 ( .A0(n1044), .A1(n231), .B0(n234), .Y(n233) );
  OA21XL U964 ( .A0(n1043), .A1(n231), .B0(n233), .Y(n232) );
  OAI21XL U965 ( .A0(n116), .A1(n1023), .B0(n117), .Y(n115) );
  OAI21XL U966 ( .A0(n1042), .A1(n231), .B0(n232), .Y(n775) );
  OAI221XL U967 ( .A0(n298), .A1(n135), .B0(n1010), .B1(n1014), .C0(n138), .Y(
        n355) );
  NAND2X1 U968 ( .A(N474), .B(n139), .Y(n138) );
  OAI221XL U969 ( .A0(n304), .A1(n135), .B0(n1010), .B1(n1015), .C0(n143), .Y(
        n357) );
  NAND2X1 U970 ( .A(N473), .B(n139), .Y(n143) );
  OAI221XL U971 ( .A0(n311), .A1(n135), .B0(n1010), .B1(n1013), .C0(n141), .Y(
        n356) );
  OAI2BB2XL U972 ( .B0(n316), .B1(n164), .A0N(N475), .A1N(n164), .Y(n388) );
  OAI2BB2XL U973 ( .B0(n318), .B1(n164), .A0N(N476), .A1N(n164), .Y(n386) );
  OAI2BB2XL U974 ( .B0(n320), .B1(n164), .A0N(N477), .A1N(n164), .Y(n387) );
  OAI2BB2XL U975 ( .B0(\array_tmp[6][2] ), .B1(n748), .A0N(n299), .A1N(n748), 
        .Y(n847) );
  OAI2BB2XL U976 ( .B0(\array_tmp[6][1] ), .B1(n748), .A0N(n302), .A1N(n748), 
        .Y(n843) );
  OAI2BB2XL U977 ( .B0(\array_tmp[6][0] ), .B1(n748), .A0N(n306), .A1N(n748), 
        .Y(n840) );
  NAND3BXL U978 ( .AN(n231), .B(n234), .C(n1044), .Y(n228) );
  OAI32XL U979 ( .A0(n1019), .A1(n1042), .A2(n228), .B0(n232), .B1(n1020), .Y(
        n405) );
  OAI22XL U980 ( .A0(n233), .A1(n1019), .B0(n1043), .B1(n228), .Y(n406) );
  OAI21XL U981 ( .A0(n234), .A1(n1018), .B0(n236), .Y(n407) );
  OAI21XL U982 ( .A0(N330), .A1(n1018), .B0(n234), .Y(n236) );
  AND2X2 U983 ( .A(N327), .B(n937), .Y(N354) );
  AND2X2 U984 ( .A(N328), .B(n937), .Y(N355) );
  OAI22XL U985 ( .A0(n990), .A1(n1017), .B0(n930), .B1(n1001), .Y(n416) );
  OAI22XL U986 ( .A0(n991), .A1(n1017), .B0(n930), .B1(n278), .Y(n415) );
  OAI22XL U987 ( .A0(n992), .A1(n1017), .B0(n930), .B1(n280), .Y(n414) );
  OAI22XL U988 ( .A0(n281), .A1(n1017), .B0(n930), .B1(n1000), .Y(n413) );
  OAI22XL U989 ( .A0(n283), .A1(n1017), .B0(n930), .B1(n999), .Y(n412) );
  OAI22XL U990 ( .A0(n993), .A1(n1017), .B0(n930), .B1(n286), .Y(n411) );
  OAI22XL U991 ( .A0(n994), .A1(n1017), .B0(n930), .B1(n288), .Y(n410) );
  OAI22XL U992 ( .A0(n289), .A1(n1017), .B0(n930), .B1(n997), .Y(n409) );
  OAI22XL U993 ( .A0(n995), .A1(n1017), .B0(n930), .B1(n292), .Y(n408) );
  OAI22XL U994 ( .A0(n273), .A1(n1017), .B0(n930), .B1(n274), .Y(n417) );
  AND2X2 U995 ( .A(N326), .B(n937), .Y(N353) );
  AND2X2 U996 ( .A(N319), .B(n937), .Y(N346) );
  NAND2X2 U997 ( .A(n967), .B(N306), .Y(n161) );
  CLKBUFX3 U998 ( .A(n322), .Y(n935) );
  OAI22XL U999 ( .A0(n302), .A1(n936), .B0(n366), .B1(n944), .Y(n338) );
  OAI22XL U1000 ( .A0(n309), .A1(n936), .B0(n373), .B1(n943), .Y(n345) );
  OAI22XL U1001 ( .A0(n376), .A1(n940), .B0(n937), .B1(n917), .Y(n335) );
  OAI22XL U1002 ( .A0(n768), .A1(n941), .B0(n937), .B1(n919), .Y(n339) );
  OAI22XL U1003 ( .A0(n916), .A1(n936), .B0(n369), .B1(n945), .Y(n332) );
  OAI22XL U1004 ( .A0(n301), .A1(n936), .B0(n374), .B1(n944), .Y(n337) );
  OAI22XL U1005 ( .A0(n761), .A1(n942), .B0(n936), .B1(n921), .Y(n343) );
  OAI22XL U1006 ( .A0(n922), .A1(n936), .B0(n371), .B1(n944), .Y(n344) );
  OAI22XL U1007 ( .A0(n377), .A1(n940), .B0(n936), .B1(n918), .Y(n336) );
  OAI22XL U1008 ( .A0(n759), .A1(n941), .B0(n937), .B1(n920), .Y(n341) );
  OAI22XL U1009 ( .A0(n315), .A1(n942), .B0(n936), .B1(n928), .Y(n350) );
  OAI22XL U1010 ( .A0(n923), .A1(n936), .B0(n368), .B1(n943), .Y(n346) );
  OAI22XL U1011 ( .A0(n924), .A1(n936), .B0(n370), .B1(n943), .Y(n348) );
  OAI22XL U1012 ( .A0(n312), .A1(n942), .B0(n311), .B1(n937), .Y(n347) );
  OAI22XL U1013 ( .A0(n314), .A1(n936), .B0(n375), .B1(n943), .Y(n349) );
  OAI22XL U1014 ( .A0(n306), .A1(n936), .B0(n367), .B1(n944), .Y(n342) );
  OAI22XL U1015 ( .A0(n296), .A1(n936), .B0(n765), .B1(n942), .Y(n331) );
  OAI22XL U1016 ( .A0(n298), .A1(n936), .B0(n365), .B1(n945), .Y(n333) );
  OAI22XL U1017 ( .A0(n295), .A1(n712), .B0(n294), .B1(n937), .Y(n330) );
  OAI22XL U1018 ( .A0(n300), .A1(n939), .B0(n299), .B1(n937), .Y(n334) );
  OAI22XL U1019 ( .A0(n305), .A1(n941), .B0(n304), .B1(n937), .Y(n340) );
  OAI22XL U1020 ( .A0(n317), .A1(n941), .B0(n316), .B1(n937), .Y(n351) );
  OAI22XL U1021 ( .A0(n319), .A1(n940), .B0(n318), .B1(n937), .Y(n352) );
  OAI22XL U1022 ( .A0(n321), .A1(n938), .B0(n320), .B1(n937), .Y(n353) );
  NOR4X1 U1023 ( .A(n966), .B(n965), .C(n967), .D(n1016), .Y(N318) );
  NOR4X1 U1024 ( .A(n119), .B(N306), .C(n361), .D(N305), .Y(nxt_state) );
  NAND2X1 U1025 ( .A(n937), .B(n966), .Y(n119) );
  NOR3X1 U1026 ( .A(n936), .B(n319), .C(n321), .Y(n131) );
  OAI2BB2XL U1027 ( .B0(n272), .B1(n1016), .A0N(N307), .A1N(N315), .Y(N317) );
  OAI31XL U1028 ( .A0(n122), .A1(n123), .A2(n124), .B0(n293), .Y(n329) );
  AO22X1 U1029 ( .A0(\array[2][1] ), .A1(n713), .B0(\array[0][1] ), .B1(n766), 
        .Y(n782) );
  AOI221XL U1030 ( .A0(\array_tmp[5][0] ), .A1(n806), .B0(\array_tmp[7][0] ), 
        .B1(n807), .C0(n789), .Y(n792) );
  AO22X1 U1031 ( .A0(\array_tmp[2][0] ), .A1(n713), .B0(\array_tmp[0][0] ), 
        .B1(n766), .Y(n790) );
  AOI221XL U1032 ( .A0(\array_tmp[4][0] ), .A1(n806), .B0(\array_tmp[6][0] ), 
        .B1(n807), .C0(n790), .Y(n791) );
  AO22X1 U1033 ( .A0(\array_tmp[3][1] ), .A1(n713), .B0(\array_tmp[1][1] ), 
        .B1(n766), .Y(n793) );
  AOI221XL U1034 ( .A0(\array_tmp[5][1] ), .A1(n806), .B0(\array_tmp[7][1] ), 
        .B1(n807), .C0(n793), .Y(n796) );
  AO22X1 U1035 ( .A0(\array_tmp[2][1] ), .A1(n713), .B0(\array_tmp[0][1] ), 
        .B1(n766), .Y(n794) );
  AOI221XL U1036 ( .A0(\array_tmp[4][1] ), .A1(n806), .B0(\array_tmp[6][1] ), 
        .B1(n807), .C0(n794), .Y(n795) );
  AOI221XL U1037 ( .A0(\array_tmp[5][2] ), .A1(n806), .B0(\array_tmp[7][2] ), 
        .B1(n807), .C0(n797), .Y(n803) );
  AO22X1 U1038 ( .A0(\array_tmp[2][2] ), .A1(n713), .B0(\array_tmp[0][2] ), 
        .B1(n766), .Y(n799) );
  AOI221XL U1039 ( .A0(\array_tmp[4][2] ), .A1(n806), .B0(\array_tmp[6][2] ), 
        .B1(n807), .C0(n799), .Y(n802) );
  OAI211X1 U1040 ( .A0(n774), .A1(n881), .B0(n811), .C0(n810), .Y(N479) );
  AO22X1 U1041 ( .A0(N444), .A1(n893), .B0(N444), .B1(n895), .Y(n812) );
  AOI221XL U1042 ( .A0(N443), .A1(n709), .B0(N443), .B1(n710), .C0(n864), .Y(
        n817) );
  AOI222XL U1043 ( .A0(N443), .A1(n846), .B0(n815), .B1(n891), .C0(N443), .C1(
        n838), .Y(n816) );
  NAND2X1 U1044 ( .A(n817), .B(n816), .Y(N481) );
  AO22X1 U1045 ( .A0(N442), .A1(n748), .B0(N442), .B1(n895), .Y(n818) );
  AOI222XL U1046 ( .A0(N442), .A1(n864), .B0(n818), .B1(swap_pos[1]), .C0(N442), .C1(n867), .Y(n819) );
  AOI22X1 U1047 ( .A0(N441), .A1(n897), .B0(N441), .B1(n710), .Y(n824) );
  AOI222XL U1048 ( .A0(N440), .A1(n710), .B0(N440), .B1(n864), .C0(N440), .C1(
        n897), .Y(n829) );
  NAND3X1 U1049 ( .A(n831), .B(n830), .C(n829), .Y(N485) );
  OAI221XL U1050 ( .A0(n774), .A1(n924), .B0(n882), .B1(N478), .C0(n855), .Y(
        N454) );
  OA22X1 U1051 ( .A0(n895), .A1(\array_tmp[4][1] ), .B0(n889), .B1(
        \array_tmp[1][1] ), .Y(n833) );
  OAI221XL U1052 ( .A0(n774), .A1(n916), .B0(n883), .B1(N478), .C0(n856), .Y(
        N455) );
  OAI221XL U1053 ( .A0(n774), .A1(n923), .B0(n890), .B1(N478), .C0(n857), .Y(
        N456) );
  NAND3X1 U1054 ( .A(n863), .B(n878), .C(n836), .Y(N458) );
  NAND3X1 U1055 ( .A(n870), .B(n880), .C(n839), .Y(N459) );
  NAND3X1 U1056 ( .A(n858), .B(n875), .C(n842), .Y(N460) );
  NAND3X1 U1057 ( .A(n861), .B(n877), .C(n845), .Y(N461) );
  NAND3X1 U1058 ( .A(n868), .B(n879), .C(n850), .Y(N462) );
  NAND3X1 U1059 ( .A(n858), .B(n875), .C(n851), .Y(N463) );
  NAND3X1 U1060 ( .A(n861), .B(n877), .C(n852), .Y(N464) );
  NAND3X1 U1061 ( .A(n868), .B(n879), .C(n854), .Y(N465) );
  OAI221XL U1062 ( .A0(n882), .A1(n774), .B0(N478), .B1(n928), .C0(n855), .Y(
        N466) );
  OAI221XL U1063 ( .A0(n883), .A1(n774), .B0(N478), .B1(n920), .C0(n856), .Y(
        N467) );
  OAI221XL U1064 ( .A0(n890), .A1(n774), .B0(N478), .B1(n918), .C0(n857), .Y(
        N468) );
  AOI2BB2X1 U1065 ( .B0(\array_tmp[6][0] ), .B1(n867), .A0N(n882), .A1N(n866), 
        .Y(n859) );
  NAND4X1 U1066 ( .A(n860), .B(n871), .C(n859), .D(n858), .Y(N469) );
  AOI2BB2X1 U1067 ( .B0(\array_tmp[6][1] ), .B1(n867), .A0N(n883), .A1N(n866), 
        .Y(n862) );
  NAND4X1 U1068 ( .A(n863), .B(n872), .C(n862), .D(n861), .Y(N470) );
  AOI2BB2X1 U1069 ( .B0(\array_tmp[6][2] ), .B1(n867), .A0N(n890), .A1N(n866), 
        .Y(n869) );
  NAND4X1 U1070 ( .A(n870), .B(n873), .C(n869), .D(n868), .Y(N471) );
  NAND2X1 U1071 ( .A(n748), .B(n885), .Y(n874) );
  OAI211X1 U1072 ( .A0(n874), .A1(n882), .B0(n871), .C0(n875), .Y(N472) );
  OAI211X1 U1073 ( .A0(n874), .A1(n883), .B0(n872), .C0(n877), .Y(N473) );
  OAI211X1 U1074 ( .A0(n874), .A1(n890), .B0(n873), .C0(n879), .Y(N474) );
  NAND2X1 U1075 ( .A(n876), .B(n875), .Y(N475) );
  NAND2X1 U1076 ( .A(n878), .B(n877), .Y(N476) );
  NAND2X1 U1077 ( .A(n880), .B(n879), .Y(N477) );
  AOI22XL U1078 ( .A0(n897), .A1(\array_tmp[5][2] ), .B0(n864), .B1(
        \array_tmp[4][2] ), .Y(n873) );
  AOI22XL U1079 ( .A0(N441), .A1(n864), .B0(N441), .B1(n757), .Y(n823) );
  AOI22XL U1080 ( .A0(n897), .A1(\array_tmp[5][1] ), .B0(n864), .B1(
        \array_tmp[4][1] ), .Y(n872) );
  AOI22XL U1081 ( .A0(N364), .A1(n897), .B0(n853), .B1(\array_tmp[4][1] ), .Y(
        n845) );
  AOI22XL U1082 ( .A0(\array_tmp[5][0] ), .A1(n897), .B0(n853), .B1(N365), .Y(
        n851) );
  AOI22XL U1083 ( .A0(\array_tmp[5][1] ), .A1(n897), .B0(n853), .B1(N364), .Y(
        n852) );
  AOI22XL U1084 ( .A0(N365), .A1(n897), .B0(n853), .B1(\array_tmp[4][0] ), .Y(
        n842) );
  AOI22XL U1085 ( .A0(N363), .A1(n897), .B0(n853), .B1(\array_tmp[4][2] ), .Y(
        n850) );
  AOI22XL U1086 ( .A0(\array_tmp[5][2] ), .A1(n897), .B0(n853), .B1(N363), .Y(
        n854) );
  AOI22XL U1087 ( .A0(N440), .A1(n846), .B0(N440), .B1(n709), .Y(n831) );
  AOI22XL U1088 ( .A0(N434), .A1(n825), .B0(N434), .B1(n710), .Y(n828) );
  NAND3XL U1089 ( .A(n860), .B(n876), .C(n835), .Y(N457) );
  AOI22XL U1090 ( .A0(\array_tmp[2][0] ), .A1(n838), .B0(n867), .B1(N365), .Y(
        n835) );
  AOI22XL U1091 ( .A0(N445), .A1(n757), .B0(N445), .B1(n897), .Y(n810) );
  AOI22XL U1092 ( .A0(N440), .A1(n838), .B0(N440), .B1(n867), .Y(n830) );
  AOI22XL U1093 ( .A0(\array_tmp[2][1] ), .A1(n838), .B0(n867), .B1(N364), .Y(
        n836) );
  AOI22XL U1094 ( .A0(\array_tmp[2][2] ), .A1(n838), .B0(n867), .B1(N363), .Y(
        n839) );
  AOI2BB2XL U1095 ( .B0(N445), .B1(n846), .A0N(n748), .A1N(n809), .Y(n811) );
  NAND4BXL U1096 ( .AN(n846), .B(n828), .C(n827), .D(n826), .Y(N484) );
  NOR2X2 U1097 ( .A(n885), .B(n848), .Y(n808) );
  NAND2X1 U1098 ( .A(pivot[0]), .B(n929), .Y(n899) );
  NAND2X1 U1099 ( .A(pivot[0]), .B(n1027), .Y(n898) );
  NAND2X1 U1100 ( .A(pivot[2]), .B(n1027), .Y(n904) );
  NAND2X1 U1101 ( .A(n1029), .B(n1027), .Y(n903) );
  OAI222XL U1102 ( .A0(\array_tmp[7][0] ), .A1(n904), .B0(\array_tmp[3][0] ), 
        .B1(n903), .C0(\array_tmp[5][0] ), .C1(n1027), .Y(n900) );
  OAI222XL U1103 ( .A0(n899), .A1(n921), .B0(n898), .B1(n294), .C0(pivot[0]), 
        .C1(n900), .Y(N664) );
  OAI222XL U1104 ( .A0(\array_tmp[7][1] ), .A1(n904), .B0(\array_tmp[3][1] ), 
        .B1(n903), .C0(\array_tmp[5][1] ), .C1(n1027), .Y(n901) );
  OAI222XL U1105 ( .A0(n899), .A1(n919), .B0(n898), .B1(n296), .C0(pivot[0]), 
        .C1(n901), .Y(N665) );
  OAI222XL U1106 ( .A0(\array_tmp[7][2] ), .A1(n904), .B0(\array_tmp[3][2] ), 
        .B1(n903), .C0(\array_tmp[5][2] ), .C1(n1027), .Y(n902) );
  OAI222XL U1107 ( .A0(n899), .A1(n917), .B0(n898), .B1(n922), .C0(pivot[0]), 
        .C1(n902), .Y(N666) );
  OAI222XL U1108 ( .A0(\array_tmp[6][0] ), .A1(n904), .B0(\array_tmp[2][0] ), 
        .B1(n903), .C0(\array_tmp[4][0] ), .C1(n1027), .Y(n907) );
  OAI22XL U1109 ( .A0(n900), .A1(n927), .B0(pivot[0]), .B1(n907), .Y(N630) );
  OAI222XL U1110 ( .A0(\array_tmp[6][1] ), .A1(n904), .B0(\array_tmp[2][1] ), 
        .B1(n903), .C0(\array_tmp[4][1] ), .C1(n1027), .Y(n910) );
  OAI22XL U1111 ( .A0(n901), .A1(n927), .B0(pivot[0]), .B1(n910), .Y(N631) );
  OAI222XL U1112 ( .A0(\array_tmp[6][2] ), .A1(n904), .B0(\array_tmp[2][2] ), 
        .B1(n903), .C0(\array_tmp[4][2] ), .C1(n1027), .Y(n915) );
  OAI22XL U1113 ( .A0(n902), .A1(n927), .B0(pivot[0]), .B1(n915), .Y(N632) );
  OAI22XL U1114 ( .A0(n912), .A1(n928), .B0(n911), .B1(n924), .Y(n905) );
  AOI221XL U1115 ( .A0(\array_tmp[1][0] ), .A1(n925), .B0(\array_tmp[5][0] ), 
        .B1(n926), .C0(n905), .Y(n906) );
  OAI22XL U1116 ( .A0(n907), .A1(n927), .B0(pivot[0]), .B1(n906), .Y(N592) );
  OAI22XL U1117 ( .A0(n912), .A1(n920), .B0(n911), .B1(n916), .Y(n908) );
  AOI221XL U1118 ( .A0(\array_tmp[1][1] ), .A1(n925), .B0(\array_tmp[5][1] ), 
        .B1(n926), .C0(n908), .Y(n909) );
  OAI22XL U1119 ( .A0(n910), .A1(n927), .B0(pivot[0]), .B1(n909), .Y(N593) );
  OAI22XL U1120 ( .A0(n912), .A1(n918), .B0(n911), .B1(n923), .Y(n913) );
  AOI221XL U1121 ( .A0(\array_tmp[1][2] ), .A1(n925), .B0(\array_tmp[5][2] ), 
        .B1(n926), .C0(n913), .Y(n914) );
  OAI22XL U1122 ( .A0(n915), .A1(n927), .B0(pivot[0]), .B1(n914), .Y(N594) );
  NOR2X1 U1123 ( .A(n312), .B(N763), .Y(n116) );
  NAND4X2 U1124 ( .A(n74), .B(n71), .C(n75), .D(n76), .Y(swap_pos[0]) );
  OAI31X4 U1125 ( .A0(n246), .A1(n247), .A2(n243), .B0(n244), .Y(pivot[1]) );
  OAI211X4 U1126 ( .A0(n89), .A1(n90), .B0(n75), .C0(n73), .Y(swap_pos[2]) );
  NAND2X1 U1127 ( .A(\array[3][2] ), .B(n1022), .Y(n80) );
  NAND2X1 U1128 ( .A(\array[2][2] ), .B(n1022), .Y(n88) );
  OAI21XL U1129 ( .A0(n365), .A1(N761), .B0(n115), .Y(n84) );
  AOI32XL U1130 ( .A0(N762), .A1(n80), .A2(n369), .B0(n368), .B1(N761), .Y(n79) );
  AOI32XL U1131 ( .A0(N762), .A1(n88), .A2(n366), .B0(n300), .B1(N761), .Y(n87) );
  OAI32XL U1132 ( .A0(n764), .A1(n111), .A2(n1023), .B0(n1022), .B1(n1033), 
        .Y(n90) );
  OAI21X2 U1133 ( .A0(n1022), .A1(n1037), .B0(n106), .Y(n100) );
  OAI21XL U1134 ( .A0(n376), .A1(N761), .B0(n107), .Y(n106) );
  NOR2X1 U1135 ( .A(n965), .B(n967), .Y(n961) );
  NOR2X1 U1136 ( .A(n967), .B(N306), .Y(n959) );
  NOR2X1 U1137 ( .A(N305), .B(N306), .Y(n958) );
  AO22X1 U1138 ( .A0(n1031), .A1(n959), .B0(\array[4][0] ), .B1(n958), .Y(n949) );
  AOI221XL U1139 ( .A0(n760), .A1(n962), .B0(\array[7][0] ), .B1(n961), .C0(
        n949), .Y(n952) );
  AO22X1 U1140 ( .A0(\array[1][0] ), .A1(n959), .B0(\array[0][0] ), .B1(n958), 
        .Y(n950) );
  AOI221XL U1141 ( .A0(\array[2][0] ), .A1(n962), .B0(\array[3][0] ), .B1(n961), .C0(n950), .Y(n951) );
  OAI22XL U1142 ( .A0(n966), .A1(n952), .B0(N307), .B1(n951), .Y(N802) );
  AO22X1 U1143 ( .A0(\array[5][1] ), .A1(n959), .B0(n764), .B1(n958), .Y(n953)
         );
  AOI221XL U1144 ( .A0(n767), .A1(n962), .B0(n758), .B1(n961), .C0(n953), .Y(
        n956) );
  AO22X1 U1145 ( .A0(\array[1][1] ), .A1(n959), .B0(\array[0][1] ), .B1(n958), 
        .Y(n954) );
  AOI221XL U1146 ( .A0(\array[2][1] ), .A1(n962), .B0(n1039), .B1(n961), .C0(
        n954), .Y(n955) );
  OAI22XL U1147 ( .A0(n966), .A1(n956), .B0(N307), .B1(n955), .Y(N801) );
  AO22X1 U1148 ( .A0(\array[5][2] ), .A1(n959), .B0(n1033), .B1(n958), .Y(n957) );
  AOI221XL U1149 ( .A0(n1037), .A1(n962), .B0(n1036), .B1(n961), .C0(n957), 
        .Y(n964) );
  AO22X1 U1150 ( .A0(\array[1][2] ), .A1(n959), .B0(\array[0][2] ), .B1(n958), 
        .Y(n960) );
  AOI221XL U1151 ( .A0(\array[2][2] ), .A1(n962), .B0(\array[3][2] ), .B1(n961), .C0(n960), .Y(n963) );
  OAI22XL U1152 ( .A0(n964), .A1(n966), .B0(N307), .B1(n963), .Y(N800) );
  OAI22XL U1153 ( .A0(total_cost[1]), .A1(n968), .B0(n968), .B1(n990), .Y(n970) );
  NAND2X1 U1154 ( .A(total_cost[7]), .B(n994), .Y(n982) );
  NOR3BXL U1155 ( .AN(n977), .B(n971), .C(n978), .Y(n969) );
  NAND3X1 U1156 ( .A(n970), .B(n982), .C(n969), .Y(n989) );
  NAND2X1 U1157 ( .A(total_cost[9]), .B(n995), .Y(n985) );
  OAI211X1 U1158 ( .A0(n973), .A1(n1001), .B0(n972), .C0(n984), .Y(n974) );
  OAI221XL U1159 ( .A0(total_cost[2]), .A1(n991), .B0(total_cost[3]), .B1(n992), .C0(n974), .Y(n975) );
  AOI222XL U1160 ( .A0(n1046), .A1(n999), .B0(n1047), .B1(n1000), .C0(n976), 
        .C1(n975), .Y(n980) );
  NOR4X1 U1161 ( .A(n989), .B(n988), .C(n987), .D(n986), .Y(N331) );
endmodule

