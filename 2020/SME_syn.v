/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Wed Sep 21 22:19:07 2022
/////////////////////////////////////////////////////////////


module SME ( clk, reset, chardata, isstring, ispattern, valid, match, 
        match_index );
  input [7:0] chardata;
  output [4:0] match_index;
  input clk, reset, isstring, ispattern;
  output valid, match;
  wire   N37, N38, N39, N40, N41, N42, N43, N44, n1032, n1033, n1034, n1035,
         n1036, n1037, n1038, \cur_str[5] , N55, N56, N57, N58, N59, N60, N61,
         \cur_pat[3] , N63, N64, N65, N66, N67, asterisk_sym, \pattern[0][7] ,
         \pattern[0][6] , \pattern[0][5] , \pattern[0][4] , \pattern[0][3] ,
         \pattern[0][2] , \pattern[0][1] , \pattern[0][0] , \pattern[1][7] ,
         \pattern[1][6] , \pattern[1][5] , \pattern[1][4] , \pattern[1][3] ,
         \pattern[1][2] , \pattern[1][1] , \pattern[1][0] , \pattern[2][7] ,
         \pattern[2][6] , \pattern[2][5] , \pattern[2][4] , \pattern[2][3] ,
         \pattern[2][2] , \pattern[2][1] , \pattern[2][0] , \pattern[3][7] ,
         \pattern[3][6] , \pattern[3][5] , \pattern[3][4] , \pattern[3][3] ,
         \pattern[3][2] , \pattern[3][1] , \pattern[3][0] , \pattern[4][7] ,
         \pattern[4][6] , \pattern[4][5] , \pattern[4][4] , \pattern[4][3] ,
         \pattern[4][2] , \pattern[4][1] , \pattern[4][0] , \pattern[5][7] ,
         \pattern[5][6] , \pattern[5][5] , \pattern[5][4] , \pattern[5][3] ,
         \pattern[5][2] , \pattern[5][1] , \pattern[5][0] , \pattern[6][7] ,
         \pattern[6][6] , \pattern[6][5] , \pattern[6][4] , \pattern[6][3] ,
         \pattern[6][2] , \pattern[6][1] , \pattern[6][0] , \pattern[7][7] ,
         \pattern[7][6] , \pattern[7][5] , \pattern[7][4] , \pattern[7][3] ,
         \pattern[7][2] , \pattern[7][1] , \pattern[7][0] , \string[0][7] ,
         \string[0][6] , \string[0][5] , \string[0][4] , \string[0][3] ,
         \string[0][2] , \string[0][1] , \string[0][0] , \string[1][7] ,
         \string[1][6] , \string[1][5] , \string[1][4] , \string[1][3] ,
         \string[1][2] , \string[1][1] , \string[1][0] , \string[2][7] ,
         \string[2][6] , \string[2][5] , \string[2][4] , \string[2][3] ,
         \string[2][2] , \string[2][1] , \string[2][0] , \string[3][7] ,
         \string[3][6] , \string[3][5] , \string[3][4] , \string[3][3] ,
         \string[3][2] , \string[3][1] , \string[3][0] , \string[4][7] ,
         \string[4][6] , \string[4][5] , \string[4][4] , \string[4][3] ,
         \string[4][2] , \string[4][1] , \string[4][0] , \string[5][7] ,
         \string[5][6] , \string[5][5] , \string[5][4] , \string[5][3] ,
         \string[5][2] , \string[5][1] , \string[5][0] , \string[6][7] ,
         \string[6][6] , \string[6][5] , \string[6][4] , \string[6][3] ,
         \string[6][2] , \string[6][1] , \string[6][0] , \string[7][7] ,
         \string[7][6] , \string[7][5] , \string[7][4] , \string[7][3] ,
         \string[7][2] , \string[7][1] , \string[7][0] , \string[8][7] ,
         \string[8][6] , \string[8][5] , \string[8][4] , \string[8][3] ,
         \string[8][2] , \string[8][1] , \string[8][0] , \string[9][7] ,
         \string[9][6] , \string[9][5] , \string[9][4] , \string[9][3] ,
         \string[9][2] , \string[9][1] , \string[9][0] , \string[10][7] ,
         \string[10][6] , \string[10][5] , \string[10][4] , \string[10][3] ,
         \string[10][2] , \string[10][1] , \string[10][0] , \string[11][7] ,
         \string[11][6] , \string[11][5] , \string[11][4] , \string[11][3] ,
         \string[11][2] , \string[11][1] , \string[11][0] , \string[12][7] ,
         \string[12][6] , \string[12][5] , \string[12][4] , \string[12][3] ,
         \string[12][2] , \string[12][1] , \string[12][0] , \string[13][7] ,
         \string[13][6] , \string[13][5] , \string[13][4] , \string[13][3] ,
         \string[13][2] , \string[13][1] , \string[13][0] , \string[14][7] ,
         \string[14][6] , \string[14][5] , \string[14][4] , \string[14][3] ,
         \string[14][2] , \string[14][1] , \string[14][0] , \string[15][7] ,
         \string[15][6] , \string[15][5] , \string[15][4] , \string[15][3] ,
         \string[15][2] , \string[15][1] , \string[15][0] , \string[16][7] ,
         \string[16][6] , \string[16][5] , \string[16][4] , \string[16][3] ,
         \string[16][2] , \string[16][1] , \string[16][0] , \string[17][7] ,
         \string[17][6] , \string[17][5] , \string[17][4] , \string[17][3] ,
         \string[17][2] , \string[17][1] , \string[17][0] , \string[18][7] ,
         \string[18][6] , \string[18][5] , \string[18][4] , \string[18][3] ,
         \string[18][2] , \string[18][1] , \string[18][0] , \string[19][7] ,
         \string[19][6] , \string[19][5] , \string[19][4] , \string[19][3] ,
         \string[19][2] , \string[19][1] , \string[19][0] , \string[20][7] ,
         \string[20][6] , \string[20][5] , \string[20][4] , \string[20][3] ,
         \string[20][2] , \string[20][1] , \string[20][0] , \string[21][7] ,
         \string[21][6] , \string[21][5] , \string[21][4] , \string[21][3] ,
         \string[21][2] , \string[21][1] , \string[21][0] , \string[22][7] ,
         \string[22][6] , \string[22][5] , \string[22][4] , \string[22][3] ,
         \string[22][2] , \string[22][1] , \string[22][0] , \string[23][7] ,
         \string[23][6] , \string[23][5] , \string[23][4] , \string[23][3] ,
         \string[23][2] , \string[23][1] , \string[23][0] , \string[24][7] ,
         \string[24][6] , \string[24][5] , \string[24][4] , \string[24][3] ,
         \string[24][2] , \string[24][1] , \string[24][0] , \string[25][7] ,
         \string[25][6] , \string[25][5] , \string[25][4] , \string[25][3] ,
         \string[25][2] , \string[25][1] , \string[25][0] , \string[26][7] ,
         \string[26][6] , \string[26][5] , \string[26][4] , \string[26][3] ,
         \string[26][2] , \string[26][1] , \string[26][0] , \string[27][7] ,
         \string[27][6] , \string[27][5] , \string[27][4] , \string[27][3] ,
         \string[27][2] , \string[27][1] , \string[27][0] , \string[28][7] ,
         \string[28][6] , \string[28][5] , \string[28][4] , \string[28][3] ,
         \string[28][2] , \string[28][1] , \string[28][0] , \string[29][7] ,
         \string[29][6] , \string[29][5] , \string[29][4] , \string[29][3] ,
         \string[29][2] , \string[29][1] , \string[29][0] , \string[30][7] ,
         \string[30][6] , \string[30][5] , \string[30][4] , \string[30][3] ,
         \string[30][2] , \string[30][1] , \string[30][0] , \string[31][7] ,
         \string[31][6] , \string[31][5] , \string[31][4] , \string[31][3] ,
         \string[31][2] , \string[31][1] , \string[31][0] , N116, N117, N118,
         N119, N208, N211, N212, N213, N214, N215, N216, N323, N325, N327,
         N328, N329, N330, N331, N332, N333, N334, N335, N336, N337, N338, n51,
         n59, n60, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n87, n88,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n104, n105,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n632, n634, n636, n637, n638, n639,
         n640, n641, n642, n643, n644, n645, n646, n647, n648, n649, n650,
         n651, n652, n653, n654, n655, n656, n657, n658, n659, n660, n661,
         n662, n663, n664, n665, n666, n667, n668, n669, n670, n671, n672,
         n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, n683,
         n684, n685, n686, n687, n688, n689, n690, n691, n692, n693, n694,
         n695, n696, n697, n698, n699, n700, n701, n702, n703, n704, n705,
         n706, n707, n708, n709, n710, n711, n712, n713, n714, n715, n716,
         n717, n718, n719, n720, n721, n722, n723, n724, n725, n726, n727,
         n728, n729, n730, n731, n732, n733, n734, n735, n736, n737, n738,
         n739, n740, n741, n742, n743, n744, n745, n746, n747, n748, n749,
         n750, n751, n752, n753, n754, n755, n756, n757, n758, n759, n760,
         n761, n762, n763, n764, n765, n766, n767, n768, n769, n770, n771,
         n772, n773, n774, n775, n776, n777, n778, n779, n780, n781, n782,
         n783, n784, n785, n786, n787, n788, n789, n790, n791, n792, n793,
         n794, n795, n796, n797, n798, n799, n800, n801, n802, n803, n804,
         n805, n806, n807, n808, n809, n810, n811, n812, n813, n814, n815,
         n816, n817, n818, n819, n820, n821, n822, n823, n824, n825, n826,
         n827, n828, n829, n830, n831, n832, n833, n834, n835, n836, n837,
         n838, n839, n840, n841, n842, n843, n844, n845, n846, n847, n848,
         n849, n850, n851, n852, n853, n854, n855, n856, n857, n858, n859,
         n860, n861, n862, n863, n864, n865, n866, n867, n868, n869, n870,
         n871, n872, n873, n874, n875, n876, n877, n878, n879, n880, n881,
         n882, n883, n884, n885, n886, n887, n888, n889, n890, n891, n892,
         n893, n894, n895, n896, n897, n898, n899, n900, n901, n902, n903,
         n904, n905, n906, n907, n908, n909, n910, n911, n912, n913, n914,
         n915, n916, n917, n918, n919, n920, n921, n922, n923, n924, n925,
         n926, n927, n928, n929, n930, n931, n932, n933, n934, n935, n936,
         n937, n938, n939, n940, n941, n942, n943, n944, n945, n946, n947,
         n948, n949, n950, n951, n952, n953, n954, n955, n956, n957, n958,
         n959, n960, n961, n962, n963, n964, n965, n966, n967, n968, n969,
         n970, n971, n972, n973, n974, n975, n976, n977, n978, n979, n980,
         n981, n982, n983, n984, n985, n986, n987, n988, n989, n990, n991,
         n992, n993, n994, n995, n996, n997, n998, n999, n1000, n1001, n1002,
         n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012,
         n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022,
         n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031;
  wire   [1:0] cur_state;
  wire   [1:0] nxt_state;
  wire   [5:0] str_len;
  wire   [3:0] pat_len;
  wire   [5:2] \add_155/carry ;
  wire   [5:2] \add_113/carry ;

  OAI211X2 U415 ( .A0(n885), .A1(n1009), .B0(n198), .C0(n199), .Y(n196) );
  DFFRX1 \temp_pat_reg[0]  ( .D(n605), .CK(clk), .RN(n947), .QN(n93) );
  DFFRX1 \temp_pat_reg[1]  ( .D(n604), .CK(clk), .RN(n947), .QN(n92) );
  DFFRX1 \temp_pat_reg[2]  ( .D(n603), .CK(clk), .RN(n947), .QN(n91) );
  DFFRX1 \temp_pat_reg[3]  ( .D(n602), .CK(clk), .RN(n948), .QN(n90) );
  DFFRX1 asterisk_sym_reg ( .D(n601), .CK(clk), .RN(n948), .Q(asterisk_sym), 
        .QN(n94) );
  DFFRX1 \cur_state_reg[1]  ( .D(nxt_state[1]), .CK(clk), .RN(n948), .Q(
        cur_state[1]), .QN(n51) );
  DFFRX1 \cur_pat_reg[3]  ( .D(n623), .CK(clk), .RN(n948), .Q(\cur_pat[3] ), 
        .QN(n78) );
  DFFRX1 \cur_state_reg[0]  ( .D(nxt_state[0]), .CK(clk), .RN(n948), .Q(
        cur_state[0]), .QN(n59) );
  DFFRX1 \pat_len_reg[3]  ( .D(n621), .CK(clk), .RN(n947), .Q(pat_len[3]), 
        .QN(n74) );
  DFFRX1 \cur_str_reg[5]  ( .D(n624), .CK(clk), .RN(n947), .Q(\cur_str[5] ), 
        .QN(n100) );
  DFFRX1 \pattern_reg[0][7]  ( .D(n338), .CK(clk), .RN(n953), .Q(
        \pattern[0][7] ) );
  DFFRX1 \pattern_reg[0][6]  ( .D(n337), .CK(clk), .RN(n953), .Q(
        \pattern[0][6] ) );
  DFFRX1 \pattern_reg[0][4]  ( .D(n335), .CK(clk), .RN(n953), .Q(
        \pattern[0][4] ) );
  DFFRX1 \pattern_reg[0][0]  ( .D(n331), .CK(clk), .RN(n953), .Q(
        \pattern[0][0] ) );
  DFFRX1 \pattern_reg[1][7]  ( .D(n330), .CK(clk), .RN(n953), .Q(
        \pattern[1][7] ) );
  DFFRX1 \pattern_reg[1][6]  ( .D(n329), .CK(clk), .RN(n952), .Q(
        \pattern[1][6] ) );
  DFFRX1 \pattern_reg[1][4]  ( .D(n327), .CK(clk), .RN(n952), .Q(
        \pattern[1][4] ) );
  DFFRX1 \pattern_reg[1][0]  ( .D(n323), .CK(clk), .RN(n952), .Q(
        \pattern[1][0] ) );
  DFFRX1 \pattern_reg[2][7]  ( .D(n322), .CK(clk), .RN(n952), .Q(
        \pattern[2][7] ) );
  DFFRX1 \pattern_reg[2][6]  ( .D(n321), .CK(clk), .RN(n952), .Q(
        \pattern[2][6] ) );
  DFFRX1 \pattern_reg[2][4]  ( .D(n319), .CK(clk), .RN(n952), .Q(
        \pattern[2][4] ) );
  DFFRX1 \pattern_reg[2][0]  ( .D(n315), .CK(clk), .RN(n951), .Q(
        \pattern[2][0] ) );
  DFFRX1 \pattern_reg[3][7]  ( .D(n314), .CK(clk), .RN(n951), .Q(
        \pattern[3][7] ) );
  DFFRX1 \pattern_reg[3][6]  ( .D(n313), .CK(clk), .RN(n951), .Q(
        \pattern[3][6] ) );
  DFFRX1 \pattern_reg[3][4]  ( .D(n311), .CK(clk), .RN(n951), .Q(
        \pattern[3][4] ) );
  DFFRX1 \pattern_reg[3][3]  ( .D(n310), .CK(clk), .RN(n951), .Q(
        \pattern[3][3] ) );
  DFFRX1 \pattern_reg[3][0]  ( .D(n307), .CK(clk), .RN(n951), .Q(
        \pattern[3][0] ) );
  DFFRX1 \string_reg[31][7]  ( .D(n347), .CK(clk), .RN(n954), .Q(
        \string[31][7] ) );
  DFFRX1 \string_reg[3][7]  ( .D(n571), .CK(clk), .RN(n944), .Q(\string[3][7] ) );
  DFFRX1 \string_reg[3][6]  ( .D(n570), .CK(clk), .RN(n944), .Q(\string[3][6] ) );
  DFFRX1 \string_reg[3][5]  ( .D(n569), .CK(clk), .RN(n944), .Q(\string[3][5] ) );
  DFFRX1 \string_reg[3][4]  ( .D(n568), .CK(clk), .RN(n943), .Q(\string[3][4] ) );
  DFFRX1 \string_reg[3][3]  ( .D(n567), .CK(clk), .RN(n943), .Q(\string[3][3] ) );
  DFFRX1 \string_reg[3][2]  ( .D(n566), .CK(clk), .RN(n943), .Q(\string[3][2] ) );
  DFFRX1 \string_reg[3][1]  ( .D(n565), .CK(clk), .RN(n943), .Q(\string[3][1] ) );
  DFFRX1 \string_reg[3][0]  ( .D(n564), .CK(clk), .RN(n943), .Q(\string[3][0] ) );
  DFFRX1 \string_reg[5][7]  ( .D(n555), .CK(clk), .RN(n942), .Q(\string[5][7] ) );
  DFFRX1 \string_reg[5][6]  ( .D(n554), .CK(clk), .RN(n942), .Q(\string[5][6] ) );
  DFFRX1 \string_reg[5][5]  ( .D(n553), .CK(clk), .RN(n942), .Q(\string[5][5] ) );
  DFFRX1 \string_reg[5][4]  ( .D(n552), .CK(clk), .RN(n942), .Q(\string[5][4] ) );
  DFFRX1 \string_reg[5][3]  ( .D(n551), .CK(clk), .RN(n942), .Q(\string[5][3] ) );
  DFFRX1 \string_reg[5][2]  ( .D(n550), .CK(clk), .RN(n942), .Q(\string[5][2] ) );
  DFFRX1 \string_reg[5][1]  ( .D(n549), .CK(clk), .RN(n942), .Q(\string[5][1] ) );
  DFFRX1 \string_reg[5][0]  ( .D(n548), .CK(clk), .RN(n942), .Q(\string[5][0] ) );
  DFFRX1 \string_reg[7][7]  ( .D(n539), .CK(clk), .RN(n941), .Q(\string[7][7] ) );
  DFFRX1 \string_reg[7][6]  ( .D(n538), .CK(clk), .RN(n941), .Q(\string[7][6] ) );
  DFFRX1 \string_reg[7][5]  ( .D(n537), .CK(clk), .RN(n941), .Q(\string[7][5] ) );
  DFFRX1 \string_reg[7][4]  ( .D(n536), .CK(clk), .RN(n941), .Q(\string[7][4] ) );
  DFFRX1 \string_reg[7][3]  ( .D(n535), .CK(clk), .RN(n941), .Q(\string[7][3] ) );
  DFFRX1 \string_reg[7][2]  ( .D(n534), .CK(clk), .RN(n941), .Q(\string[7][2] ) );
  DFFRX1 \string_reg[7][1]  ( .D(n533), .CK(clk), .RN(n940), .Q(\string[7][1] ) );
  DFFRX1 \string_reg[7][0]  ( .D(n532), .CK(clk), .RN(n940), .Q(\string[7][0] ) );
  DFFRX1 \string_reg[9][7]  ( .D(n523), .CK(clk), .RN(n940), .Q(\string[9][7] ) );
  DFFRX1 \string_reg[9][6]  ( .D(n522), .CK(clk), .RN(n940), .Q(\string[9][6] ) );
  DFFRX1 \string_reg[9][5]  ( .D(n521), .CK(clk), .RN(n939), .Q(\string[9][5] ) );
  DFFRX1 \string_reg[9][4]  ( .D(n520), .CK(clk), .RN(n939), .Q(\string[9][4] ) );
  DFFRX1 \string_reg[9][3]  ( .D(n519), .CK(clk), .RN(n939), .Q(\string[9][3] ) );
  DFFRX1 \string_reg[9][2]  ( .D(n518), .CK(clk), .RN(n939), .Q(\string[9][2] ) );
  DFFRX1 \string_reg[9][1]  ( .D(n517), .CK(clk), .RN(n939), .Q(\string[9][1] ) );
  DFFRX1 \string_reg[9][0]  ( .D(n516), .CK(clk), .RN(n939), .Q(\string[9][0] ) );
  DFFRX1 \string_reg[11][7]  ( .D(n507), .CK(clk), .RN(n938), .Q(
        \string[11][7] ) );
  DFFRX1 \string_reg[11][6]  ( .D(n506), .CK(clk), .RN(n938), .Q(
        \string[11][6] ) );
  DFFRX1 \string_reg[11][5]  ( .D(n505), .CK(clk), .RN(n938), .Q(
        \string[11][5] ) );
  DFFRX1 \string_reg[11][4]  ( .D(n504), .CK(clk), .RN(n938), .Q(
        \string[11][4] ) );
  DFFRX1 \string_reg[11][3]  ( .D(n503), .CK(clk), .RN(n938), .Q(
        \string[11][3] ) );
  DFFRX1 \string_reg[11][2]  ( .D(n502), .CK(clk), .RN(n938), .Q(
        \string[11][2] ) );
  DFFRX1 \string_reg[11][1]  ( .D(n501), .CK(clk), .RN(n938), .Q(
        \string[11][1] ) );
  DFFRX1 \string_reg[11][0]  ( .D(n500), .CK(clk), .RN(n938), .Q(
        \string[11][0] ) );
  DFFRX1 \string_reg[13][7]  ( .D(n491), .CK(clk), .RN(n937), .Q(
        \string[13][7] ) );
  DFFRX1 \string_reg[13][6]  ( .D(n490), .CK(clk), .RN(n937), .Q(
        \string[13][6] ) );
  DFFRX1 \string_reg[13][5]  ( .D(n489), .CK(clk), .RN(n937), .Q(
        \string[13][5] ) );
  DFFRX1 \string_reg[13][4]  ( .D(n488), .CK(clk), .RN(n937), .Q(
        \string[13][4] ) );
  DFFRX1 \string_reg[13][3]  ( .D(n487), .CK(clk), .RN(n937), .Q(
        \string[13][3] ) );
  DFFRX1 \string_reg[13][2]  ( .D(n486), .CK(clk), .RN(n937), .Q(
        \string[13][2] ) );
  DFFRX1 \string_reg[13][1]  ( .D(n485), .CK(clk), .RN(n936), .Q(
        \string[13][1] ) );
  DFFRX1 \string_reg[13][0]  ( .D(n484), .CK(clk), .RN(n936), .Q(
        \string[13][0] ) );
  DFFRX1 \string_reg[15][7]  ( .D(n475), .CK(clk), .RN(n936), .Q(
        \string[15][7] ) );
  DFFRX1 \string_reg[15][6]  ( .D(n474), .CK(clk), .RN(n936), .Q(
        \string[15][6] ) );
  DFFRX1 \string_reg[15][5]  ( .D(n473), .CK(clk), .RN(n935), .Q(
        \string[15][5] ) );
  DFFRX1 \string_reg[15][4]  ( .D(n472), .CK(clk), .RN(n935), .Q(
        \string[15][4] ) );
  DFFRX1 \string_reg[15][3]  ( .D(n471), .CK(clk), .RN(n935), .Q(
        \string[15][3] ) );
  DFFRX1 \string_reg[15][2]  ( .D(n470), .CK(clk), .RN(n935), .Q(
        \string[15][2] ) );
  DFFRX1 \string_reg[15][1]  ( .D(n469), .CK(clk), .RN(n935), .Q(
        \string[15][1] ) );
  DFFRX1 \string_reg[15][0]  ( .D(n468), .CK(clk), .RN(n935), .Q(
        \string[15][0] ) );
  DFFRX1 \string_reg[19][6]  ( .D(n442), .CK(clk), .RN(n962), .Q(
        \string[19][6] ) );
  DFFRX1 \string_reg[19][5]  ( .D(n441), .CK(clk), .RN(n961), .Q(
        \string[19][5] ) );
  DFFRX1 \string_reg[19][4]  ( .D(n440), .CK(clk), .RN(n962), .Q(
        \string[19][4] ) );
  DFFRX1 \string_reg[19][3]  ( .D(n439), .CK(clk), .RN(n962), .Q(
        \string[19][3] ) );
  DFFRX1 \string_reg[19][2]  ( .D(n438), .CK(clk), .RN(n962), .Q(
        \string[19][2] ) );
  DFFRX1 \string_reg[19][1]  ( .D(n437), .CK(clk), .RN(n961), .Q(
        \string[19][1] ) );
  DFFRX1 \string_reg[19][0]  ( .D(n436), .CK(clk), .RN(n962), .Q(
        \string[19][0] ) );
  DFFRX1 \string_reg[20][7]  ( .D(n435), .CK(clk), .RN(n962), .Q(
        \string[20][7] ) );
  DFFRX1 \string_reg[21][6]  ( .D(n426), .CK(clk), .RN(n961), .Q(
        \string[21][6] ) );
  DFFRX1 \string_reg[21][5]  ( .D(n425), .CK(clk), .RN(n960), .Q(
        \string[21][5] ) );
  DFFRX1 \string_reg[21][4]  ( .D(n424), .CK(clk), .RN(n961), .Q(
        \string[21][4] ) );
  DFFRX1 \string_reg[21][3]  ( .D(n423), .CK(clk), .RN(n961), .Q(
        \string[21][3] ) );
  DFFRX1 \string_reg[21][2]  ( .D(n422), .CK(clk), .RN(n960), .Q(
        \string[21][2] ) );
  DFFRX1 \string_reg[21][1]  ( .D(n421), .CK(clk), .RN(n960), .Q(
        \string[21][1] ) );
  DFFRX1 \string_reg[21][0]  ( .D(n420), .CK(clk), .RN(n960), .Q(
        \string[21][0] ) );
  DFFRX1 \string_reg[22][7]  ( .D(n419), .CK(clk), .RN(n960), .Q(
        \string[22][7] ) );
  DFFRX1 \string_reg[23][6]  ( .D(n410), .CK(clk), .RN(n959), .Q(
        \string[23][6] ) );
  DFFRX1 \string_reg[23][5]  ( .D(n409), .CK(clk), .RN(n959), .Q(
        \string[23][5] ) );
  DFFRX1 \string_reg[23][4]  ( .D(n408), .CK(clk), .RN(n959), .Q(
        \string[23][4] ) );
  DFFRX1 \string_reg[23][3]  ( .D(n407), .CK(clk), .RN(n959), .Q(
        \string[23][3] ) );
  DFFRX1 \string_reg[23][2]  ( .D(n406), .CK(clk), .RN(n959), .Q(
        \string[23][2] ) );
  DFFRX1 \string_reg[23][1]  ( .D(n405), .CK(clk), .RN(n959), .Q(
        \string[23][1] ) );
  DFFRX1 \string_reg[23][0]  ( .D(n404), .CK(clk), .RN(n959), .Q(
        \string[23][0] ) );
  DFFRX1 \string_reg[24][7]  ( .D(n403), .CK(clk), .RN(n959), .Q(
        \string[24][7] ) );
  DFFRX1 \string_reg[25][6]  ( .D(n394), .CK(clk), .RN(n958), .Q(
        \string[25][6] ) );
  DFFRX1 \string_reg[25][5]  ( .D(n393), .CK(clk), .RN(n958), .Q(
        \string[25][5] ) );
  DFFRX1 \string_reg[25][4]  ( .D(n392), .CK(clk), .RN(n958), .Q(
        \string[25][4] ) );
  DFFRX1 \string_reg[25][3]  ( .D(n391), .CK(clk), .RN(n958), .Q(
        \string[25][3] ) );
  DFFRX1 \string_reg[25][2]  ( .D(n390), .CK(clk), .RN(n958), .Q(
        \string[25][2] ) );
  DFFRX1 \string_reg[25][1]  ( .D(n389), .CK(clk), .RN(n958), .Q(
        \string[25][1] ) );
  DFFRX1 \string_reg[25][0]  ( .D(n388), .CK(clk), .RN(n957), .Q(
        \string[25][0] ) );
  DFFRX1 \string_reg[26][7]  ( .D(n387), .CK(clk), .RN(n957), .Q(
        \string[26][7] ) );
  DFFRX1 \string_reg[27][6]  ( .D(n378), .CK(clk), .RN(n957), .Q(
        \string[27][6] ) );
  DFFRX1 \string_reg[27][5]  ( .D(n377), .CK(clk), .RN(n957), .Q(
        \string[27][5] ) );
  DFFRX1 \string_reg[27][4]  ( .D(n376), .CK(clk), .RN(n956), .Q(
        \string[27][4] ) );
  DFFRX1 \string_reg[27][3]  ( .D(n375), .CK(clk), .RN(n956), .Q(
        \string[27][3] ) );
  DFFRX1 \string_reg[27][2]  ( .D(n374), .CK(clk), .RN(n956), .Q(
        \string[27][2] ) );
  DFFRX1 \string_reg[27][1]  ( .D(n373), .CK(clk), .RN(n956), .Q(
        \string[27][1] ) );
  DFFRX1 \string_reg[27][0]  ( .D(n372), .CK(clk), .RN(n956), .Q(
        \string[27][0] ) );
  DFFRX1 \string_reg[28][7]  ( .D(n371), .CK(clk), .RN(n956), .Q(
        \string[28][7] ) );
  DFFRX1 \string_reg[29][6]  ( .D(n362), .CK(clk), .RN(n955), .Q(
        \string[29][6] ) );
  DFFRX1 \string_reg[29][5]  ( .D(n361), .CK(clk), .RN(n955), .Q(
        \string[29][5] ) );
  DFFRX1 \string_reg[29][4]  ( .D(n360), .CK(clk), .RN(n955), .Q(
        \string[29][4] ) );
  DFFRX1 \string_reg[29][3]  ( .D(n359), .CK(clk), .RN(n955), .Q(
        \string[29][3] ) );
  DFFRX1 \string_reg[29][2]  ( .D(n358), .CK(clk), .RN(n955), .Q(
        \string[29][2] ) );
  DFFRX1 \string_reg[29][1]  ( .D(n357), .CK(clk), .RN(n955), .Q(
        \string[29][1] ) );
  DFFRX1 \string_reg[29][0]  ( .D(n356), .CK(clk), .RN(n955), .Q(
        \string[29][0] ) );
  DFFRX1 \string_reg[30][7]  ( .D(n355), .CK(clk), .RN(n955), .Q(
        \string[30][7] ) );
  DFFRX1 \string_reg[31][6]  ( .D(n346), .CK(clk), .RN(n954), .Q(
        \string[31][6] ) );
  DFFRX1 \string_reg[31][5]  ( .D(n345), .CK(clk), .RN(n954), .Q(
        \string[31][5] ) );
  DFFRX1 \string_reg[31][4]  ( .D(n344), .CK(clk), .RN(n954), .Q(
        \string[31][4] ) );
  DFFRX1 \string_reg[31][3]  ( .D(n343), .CK(clk), .RN(n954), .Q(
        \string[31][3] ) );
  DFFRX1 \string_reg[31][2]  ( .D(n342), .CK(clk), .RN(n954), .Q(
        \string[31][2] ) );
  DFFRX1 \string_reg[31][1]  ( .D(n341), .CK(clk), .RN(n953), .Q(
        \string[31][1] ) );
  DFFRX1 \string_reg[31][0]  ( .D(n340), .CK(clk), .RN(n953), .Q(
        \string[31][0] ) );
  DFFRX1 \string_reg[2][7]  ( .D(n579), .CK(clk), .RN(n944), .Q(\string[2][7] ) );
  DFFRX1 \string_reg[2][6]  ( .D(n578), .CK(clk), .RN(n944), .Q(\string[2][6] ) );
  DFFRX1 \string_reg[2][5]  ( .D(n577), .CK(clk), .RN(n944), .Q(\string[2][5] ) );
  DFFRX1 \string_reg[2][4]  ( .D(n576), .CK(clk), .RN(n944), .Q(\string[2][4] ) );
  DFFRX1 \string_reg[2][3]  ( .D(n575), .CK(clk), .RN(n944), .Q(\string[2][3] ) );
  DFFRX1 \string_reg[2][2]  ( .D(n574), .CK(clk), .RN(n944), .Q(\string[2][2] ) );
  DFFRX1 \string_reg[2][1]  ( .D(n573), .CK(clk), .RN(n944), .Q(\string[2][1] ) );
  DFFRX1 \string_reg[2][0]  ( .D(n572), .CK(clk), .RN(n944), .Q(\string[2][0] ) );
  DFFRX1 \string_reg[4][7]  ( .D(n563), .CK(clk), .RN(n943), .Q(\string[4][7] ) );
  DFFRX1 \string_reg[4][6]  ( .D(n562), .CK(clk), .RN(n943), .Q(\string[4][6] ) );
  DFFRX1 \string_reg[4][5]  ( .D(n561), .CK(clk), .RN(n943), .Q(\string[4][5] ) );
  DFFRX1 \string_reg[4][4]  ( .D(n560), .CK(clk), .RN(n943), .Q(\string[4][4] ) );
  DFFRX1 \string_reg[4][3]  ( .D(n559), .CK(clk), .RN(n943), .Q(\string[4][3] ) );
  DFFRX1 \string_reg[4][2]  ( .D(n558), .CK(clk), .RN(n943), .Q(\string[4][2] ) );
  DFFRX1 \string_reg[4][1]  ( .D(n557), .CK(clk), .RN(n943), .Q(\string[4][1] ) );
  DFFRX1 \string_reg[4][0]  ( .D(n556), .CK(clk), .RN(n942), .Q(\string[4][0] ) );
  DFFRX1 \string_reg[6][7]  ( .D(n547), .CK(clk), .RN(n942), .Q(\string[6][7] ) );
  DFFRX1 \string_reg[6][6]  ( .D(n546), .CK(clk), .RN(n942), .Q(\string[6][6] ) );
  DFFRX1 \string_reg[6][5]  ( .D(n545), .CK(clk), .RN(n942), .Q(\string[6][5] ) );
  DFFRX1 \string_reg[6][4]  ( .D(n544), .CK(clk), .RN(n941), .Q(\string[6][4] ) );
  DFFRX1 \string_reg[6][3]  ( .D(n543), .CK(clk), .RN(n941), .Q(\string[6][3] ) );
  DFFRX1 \string_reg[6][2]  ( .D(n542), .CK(clk), .RN(n941), .Q(\string[6][2] ) );
  DFFRX1 \string_reg[6][1]  ( .D(n541), .CK(clk), .RN(n941), .Q(\string[6][1] ) );
  DFFRX1 \string_reg[6][0]  ( .D(n540), .CK(clk), .RN(n941), .Q(\string[6][0] ) );
  DFFRX1 \string_reg[8][7]  ( .D(n531), .CK(clk), .RN(n940), .Q(\string[8][7] ) );
  DFFRX1 \string_reg[8][6]  ( .D(n530), .CK(clk), .RN(n940), .Q(\string[8][6] ) );
  DFFRX1 \string_reg[8][5]  ( .D(n529), .CK(clk), .RN(n940), .Q(\string[8][5] ) );
  DFFRX1 \string_reg[8][4]  ( .D(n528), .CK(clk), .RN(n940), .Q(\string[8][4] ) );
  DFFRX1 \string_reg[8][3]  ( .D(n527), .CK(clk), .RN(n940), .Q(\string[8][3] ) );
  DFFRX1 \string_reg[8][2]  ( .D(n526), .CK(clk), .RN(n940), .Q(\string[8][2] ) );
  DFFRX1 \string_reg[8][1]  ( .D(n525), .CK(clk), .RN(n940), .Q(\string[8][1] ) );
  DFFRX1 \string_reg[8][0]  ( .D(n524), .CK(clk), .RN(n940), .Q(\string[8][0] ) );
  DFFRX1 \string_reg[10][7]  ( .D(n515), .CK(clk), .RN(n939), .Q(
        \string[10][7] ) );
  DFFRX1 \string_reg[10][6]  ( .D(n514), .CK(clk), .RN(n939), .Q(
        \string[10][6] ) );
  DFFRX1 \string_reg[10][5]  ( .D(n513), .CK(clk), .RN(n939), .Q(
        \string[10][5] ) );
  DFFRX1 \string_reg[10][4]  ( .D(n512), .CK(clk), .RN(n939), .Q(
        \string[10][4] ) );
  DFFRX1 \string_reg[10][3]  ( .D(n511), .CK(clk), .RN(n939), .Q(
        \string[10][3] ) );
  DFFRX1 \string_reg[10][2]  ( .D(n510), .CK(clk), .RN(n939), .Q(
        \string[10][2] ) );
  DFFRX1 \string_reg[10][1]  ( .D(n509), .CK(clk), .RN(n938), .Q(
        \string[10][1] ) );
  DFFRX1 \string_reg[10][0]  ( .D(n508), .CK(clk), .RN(n938), .Q(
        \string[10][0] ) );
  DFFRX1 \string_reg[12][7]  ( .D(n499), .CK(clk), .RN(n938), .Q(
        \string[12][7] ) );
  DFFRX1 \string_reg[12][6]  ( .D(n498), .CK(clk), .RN(n938), .Q(
        \string[12][6] ) );
  DFFRX1 \string_reg[12][5]  ( .D(n497), .CK(clk), .RN(n937), .Q(
        \string[12][5] ) );
  DFFRX1 \string_reg[12][4]  ( .D(n496), .CK(clk), .RN(n937), .Q(
        \string[12][4] ) );
  DFFRX1 \string_reg[12][3]  ( .D(n495), .CK(clk), .RN(n937), .Q(
        \string[12][3] ) );
  DFFRX1 \string_reg[12][2]  ( .D(n494), .CK(clk), .RN(n937), .Q(
        \string[12][2] ) );
  DFFRX1 \string_reg[12][1]  ( .D(n493), .CK(clk), .RN(n937), .Q(
        \string[12][1] ) );
  DFFRX1 \string_reg[12][0]  ( .D(n492), .CK(clk), .RN(n937), .Q(
        \string[12][0] ) );
  DFFRX1 \string_reg[14][7]  ( .D(n483), .CK(clk), .RN(n936), .Q(
        \string[14][7] ) );
  DFFRX1 \string_reg[14][6]  ( .D(n482), .CK(clk), .RN(n936), .Q(
        \string[14][6] ) );
  DFFRX1 \string_reg[14][5]  ( .D(n481), .CK(clk), .RN(n936), .Q(
        \string[14][5] ) );
  DFFRX1 \string_reg[14][4]  ( .D(n480), .CK(clk), .RN(n936), .Q(
        \string[14][4] ) );
  DFFRX1 \string_reg[14][3]  ( .D(n479), .CK(clk), .RN(n936), .Q(
        \string[14][3] ) );
  DFFRX1 \string_reg[14][2]  ( .D(n478), .CK(clk), .RN(n936), .Q(
        \string[14][2] ) );
  DFFRX1 \string_reg[14][1]  ( .D(n477), .CK(clk), .RN(n936), .Q(
        \string[14][1] ) );
  DFFRX1 \string_reg[14][0]  ( .D(n476), .CK(clk), .RN(n936), .Q(
        \string[14][0] ) );
  DFFRX1 \string_reg[18][6]  ( .D(n450), .CK(clk), .RN(n941), .Q(
        \string[18][6] ) );
  DFFRX1 \string_reg[18][5]  ( .D(n449), .CK(clk), .RN(n962), .Q(
        \string[18][5] ) );
  DFFRX1 \string_reg[18][4]  ( .D(n448), .CK(clk), .RN(n963), .Q(
        \string[18][4] ) );
  DFFRX1 \string_reg[18][3]  ( .D(n447), .CK(clk), .RN(n962), .Q(
        \string[18][3] ) );
  DFFRX1 \string_reg[18][2]  ( .D(n446), .CK(clk), .RN(n962), .Q(
        \string[18][2] ) );
  DFFRX1 \string_reg[18][1]  ( .D(n445), .CK(clk), .RN(n962), .Q(
        \string[18][1] ) );
  DFFRX1 \string_reg[18][0]  ( .D(n444), .CK(clk), .RN(n962), .Q(
        \string[18][0] ) );
  DFFRX1 \string_reg[19][7]  ( .D(n443), .CK(clk), .RN(n962), .Q(
        \string[19][7] ) );
  DFFRX1 \string_reg[20][6]  ( .D(n434), .CK(clk), .RN(n961), .Q(
        \string[20][6] ) );
  DFFRX1 \string_reg[20][5]  ( .D(n433), .CK(clk), .RN(n960), .Q(
        \string[20][5] ) );
  DFFRX1 \string_reg[20][4]  ( .D(n432), .CK(clk), .RN(n961), .Q(
        \string[20][4] ) );
  DFFRX1 \string_reg[20][3]  ( .D(n431), .CK(clk), .RN(n961), .Q(
        \string[20][3] ) );
  DFFRX1 \string_reg[20][2]  ( .D(n430), .CK(clk), .RN(n961), .Q(
        \string[20][2] ) );
  DFFRX1 \string_reg[20][1]  ( .D(n429), .CK(clk), .RN(n961), .Q(
        \string[20][1] ) );
  DFFRX1 \string_reg[20][0]  ( .D(n428), .CK(clk), .RN(n961), .Q(
        \string[20][0] ) );
  DFFRX1 \string_reg[21][7]  ( .D(n427), .CK(clk), .RN(n961), .Q(
        \string[21][7] ) );
  DFFRX1 \string_reg[22][6]  ( .D(n418), .CK(clk), .RN(n960), .Q(
        \string[22][6] ) );
  DFFRX1 \string_reg[22][5]  ( .D(n417), .CK(clk), .RN(n960), .Q(
        \string[22][5] ) );
  DFFRX1 \string_reg[22][4]  ( .D(n416), .CK(clk), .RN(n960), .Q(
        \string[22][4] ) );
  DFFRX1 \string_reg[22][3]  ( .D(n415), .CK(clk), .RN(n960), .Q(
        \string[22][3] ) );
  DFFRX1 \string_reg[22][2]  ( .D(n414), .CK(clk), .RN(n960), .Q(
        \string[22][2] ) );
  DFFRX1 \string_reg[22][1]  ( .D(n413), .CK(clk), .RN(n960), .Q(
        \string[22][1] ) );
  DFFRX1 \string_reg[22][0]  ( .D(n412), .CK(clk), .RN(n959), .Q(
        \string[22][0] ) );
  DFFRX1 \string_reg[23][7]  ( .D(n411), .CK(clk), .RN(n959), .Q(
        \string[23][7] ) );
  DFFRX1 \string_reg[24][6]  ( .D(n402), .CK(clk), .RN(n959), .Q(
        \string[24][6] ) );
  DFFRX1 \string_reg[24][5]  ( .D(n401), .CK(clk), .RN(n959), .Q(
        \string[24][5] ) );
  DFFRX1 \string_reg[24][4]  ( .D(n400), .CK(clk), .RN(n958), .Q(
        \string[24][4] ) );
  DFFRX1 \string_reg[24][3]  ( .D(n399), .CK(clk), .RN(n958), .Q(
        \string[24][3] ) );
  DFFRX1 \string_reg[24][2]  ( .D(n398), .CK(clk), .RN(n958), .Q(
        \string[24][2] ) );
  DFFRX1 \string_reg[24][1]  ( .D(n397), .CK(clk), .RN(n958), .Q(
        \string[24][1] ) );
  DFFRX1 \string_reg[24][0]  ( .D(n396), .CK(clk), .RN(n958), .Q(
        \string[24][0] ) );
  DFFRX1 \string_reg[25][7]  ( .D(n395), .CK(clk), .RN(n958), .Q(
        \string[25][7] ) );
  DFFRX1 \string_reg[26][6]  ( .D(n386), .CK(clk), .RN(n957), .Q(
        \string[26][6] ) );
  DFFRX1 \string_reg[26][5]  ( .D(n385), .CK(clk), .RN(n957), .Q(
        \string[26][5] ) );
  DFFRX1 \string_reg[26][4]  ( .D(n384), .CK(clk), .RN(n957), .Q(
        \string[26][4] ) );
  DFFRX1 \string_reg[26][3]  ( .D(n383), .CK(clk), .RN(n957), .Q(
        \string[26][3] ) );
  DFFRX1 \string_reg[26][2]  ( .D(n382), .CK(clk), .RN(n957), .Q(
        \string[26][2] ) );
  DFFRX1 \string_reg[26][1]  ( .D(n381), .CK(clk), .RN(n957), .Q(
        \string[26][1] ) );
  DFFRX1 \string_reg[26][0]  ( .D(n380), .CK(clk), .RN(n957), .Q(
        \string[26][0] ) );
  DFFRX1 \string_reg[27][7]  ( .D(n379), .CK(clk), .RN(n957), .Q(
        \string[27][7] ) );
  DFFRX1 \string_reg[28][6]  ( .D(n370), .CK(clk), .RN(n956), .Q(
        \string[28][6] ) );
  DFFRX1 \string_reg[28][5]  ( .D(n369), .CK(clk), .RN(n956), .Q(
        \string[28][5] ) );
  DFFRX1 \string_reg[28][4]  ( .D(n368), .CK(clk), .RN(n956), .Q(
        \string[28][4] ) );
  DFFRX1 \string_reg[28][3]  ( .D(n367), .CK(clk), .RN(n956), .Q(
        \string[28][3] ) );
  DFFRX1 \string_reg[28][2]  ( .D(n366), .CK(clk), .RN(n956), .Q(
        \string[28][2] ) );
  DFFRX1 \string_reg[28][1]  ( .D(n365), .CK(clk), .RN(n956), .Q(
        \string[28][1] ) );
  DFFRX1 \string_reg[28][0]  ( .D(n364), .CK(clk), .RN(n955), .Q(
        \string[28][0] ) );
  DFFRX1 \string_reg[29][7]  ( .D(n363), .CK(clk), .RN(n955), .Q(
        \string[29][7] ) );
  DFFRX1 \string_reg[30][6]  ( .D(n354), .CK(clk), .RN(n955), .Q(
        \string[30][6] ) );
  DFFRX1 \string_reg[30][5]  ( .D(n353), .CK(clk), .RN(n954), .Q(
        \string[30][5] ) );
  DFFRX1 \string_reg[30][4]  ( .D(n352), .CK(clk), .RN(n954), .Q(
        \string[30][4] ) );
  DFFRX1 \string_reg[30][3]  ( .D(n351), .CK(clk), .RN(n954), .Q(
        \string[30][3] ) );
  DFFRX1 \string_reg[30][2]  ( .D(n350), .CK(clk), .RN(n954), .Q(
        \string[30][2] ) );
  DFFRX1 \string_reg[30][1]  ( .D(n349), .CK(clk), .RN(n954), .Q(
        \string[30][1] ) );
  DFFRX1 \string_reg[30][0]  ( .D(n348), .CK(clk), .RN(n954), .Q(
        \string[30][0] ) );
  DFFRX1 \string_reg[0][7]  ( .D(n595), .CK(clk), .RN(n946), .Q(\string[0][7] ) );
  DFFRX1 \string_reg[0][6]  ( .D(n594), .CK(clk), .RN(n946), .Q(\string[0][6] ) );
  DFFRX1 \string_reg[0][5]  ( .D(n593), .CK(clk), .RN(n946), .Q(\string[0][5] ) );
  DFFRX1 \string_reg[0][4]  ( .D(n592), .CK(clk), .RN(n945), .Q(\string[0][4] ) );
  DFFRX1 \string_reg[0][3]  ( .D(n591), .CK(clk), .RN(n945), .Q(\string[0][3] ) );
  DFFRX1 \string_reg[0][2]  ( .D(n590), .CK(clk), .RN(n945), .Q(\string[0][2] ) );
  DFFRX1 \string_reg[0][1]  ( .D(n589), .CK(clk), .RN(n945), .Q(\string[0][1] ) );
  DFFRX1 \string_reg[0][0]  ( .D(n588), .CK(clk), .RN(n945), .Q(\string[0][0] ) );
  DFFRX1 \string_reg[16][6]  ( .D(n466), .CK(clk), .RN(n935), .Q(
        \string[16][6] ) );
  DFFRX1 \string_reg[16][5]  ( .D(n465), .CK(clk), .RN(n935), .Q(
        \string[16][5] ) );
  DFFRX1 \string_reg[16][4]  ( .D(n464), .CK(clk), .RN(n935), .Q(
        \string[16][4] ) );
  DFFRX1 \string_reg[16][3]  ( .D(n463), .CK(clk), .RN(n935), .Q(
        \string[16][3] ) );
  DFFRX1 \string_reg[16][2]  ( .D(n462), .CK(clk), .RN(n935), .Q(
        \string[16][2] ) );
  DFFRX1 \string_reg[16][1]  ( .D(n461), .CK(clk), .RN(n934), .Q(
        \string[16][1] ) );
  DFFRX1 \string_reg[16][0]  ( .D(n460), .CK(clk), .RN(n934), .Q(
        \string[16][0] ) );
  DFFRX1 \string_reg[1][7]  ( .D(n587), .CK(clk), .RN(n945), .Q(\string[1][7] ) );
  DFFRX1 \string_reg[1][6]  ( .D(n586), .CK(clk), .RN(n945), .Q(\string[1][6] ) );
  DFFRX1 \string_reg[1][5]  ( .D(n585), .CK(clk), .RN(n945), .Q(\string[1][5] ) );
  DFFRX1 \string_reg[1][4]  ( .D(n584), .CK(clk), .RN(n945), .Q(\string[1][4] ) );
  DFFRX1 \string_reg[1][3]  ( .D(n583), .CK(clk), .RN(n945), .Q(\string[1][3] ) );
  DFFRX1 \string_reg[1][2]  ( .D(n582), .CK(clk), .RN(n945), .Q(\string[1][2] ) );
  DFFRX1 \string_reg[1][1]  ( .D(n581), .CK(clk), .RN(n945), .Q(\string[1][1] ) );
  DFFRX1 \string_reg[1][0]  ( .D(n580), .CK(clk), .RN(n944), .Q(\string[1][0] ) );
  DFFRX1 \string_reg[17][6]  ( .D(n458), .CK(clk), .RN(n934), .Q(
        \string[17][6] ) );
  DFFRX1 \string_reg[17][5]  ( .D(n457), .CK(clk), .RN(n934), .Q(
        \string[17][5] ) );
  DFFRX1 \string_reg[17][4]  ( .D(n456), .CK(clk), .RN(n934), .Q(
        \string[17][4] ) );
  DFFRX1 \string_reg[17][3]  ( .D(n455), .CK(clk), .RN(n934), .Q(
        \string[17][3] ) );
  DFFRX1 \string_reg[17][2]  ( .D(n454), .CK(clk), .RN(n934), .Q(
        \string[17][2] ) );
  DFFRX1 \string_reg[17][1]  ( .D(n453), .CK(clk), .RN(n934), .Q(
        \string[17][1] ) );
  DFFRX1 \string_reg[17][0]  ( .D(n452), .CK(clk), .RN(n934), .Q(
        \string[17][0] ) );
  DFFRX1 \pattern_reg[4][7]  ( .D(n306), .CK(clk), .RN(n951), .Q(
        \pattern[4][7] ) );
  DFFRX1 \pattern_reg[4][6]  ( .D(n305), .CK(clk), .RN(n950), .Q(
        \pattern[4][6] ) );
  DFFRX1 \pattern_reg[4][4]  ( .D(n303), .CK(clk), .RN(n950), .Q(
        \pattern[4][4] ) );
  DFFRX1 \pattern_reg[4][3]  ( .D(n302), .CK(clk), .RN(n950), .Q(
        \pattern[4][3] ) );
  DFFRX1 \pattern_reg[4][1]  ( .D(n300), .CK(clk), .RN(n950), .Q(
        \pattern[4][1] ) );
  DFFRX1 \pattern_reg[4][0]  ( .D(n299), .CK(clk), .RN(n950), .Q(
        \pattern[4][0] ) );
  DFFRX1 \pattern_reg[5][7]  ( .D(n298), .CK(clk), .RN(n950), .Q(
        \pattern[5][7] ) );
  DFFRX1 \pattern_reg[5][6]  ( .D(n297), .CK(clk), .RN(n950), .Q(
        \pattern[5][6] ) );
  DFFRX1 \pattern_reg[5][4]  ( .D(n295), .CK(clk), .RN(n950), .Q(
        \pattern[5][4] ) );
  DFFRX1 \pattern_reg[5][3]  ( .D(n294), .CK(clk), .RN(n950), .Q(
        \pattern[5][3] ) );
  DFFRX1 \pattern_reg[5][1]  ( .D(n292), .CK(clk), .RN(n949), .Q(
        \pattern[5][1] ) );
  DFFRX1 \pattern_reg[5][0]  ( .D(n291), .CK(clk), .RN(n949), .Q(
        \pattern[5][0] ) );
  DFFRX1 \string_reg[17][7]  ( .D(n459), .CK(clk), .RN(n934), .Q(
        \string[17][7] ) );
  DFFRX1 \pattern_reg[6][7]  ( .D(n290), .CK(clk), .RN(n949), .Q(
        \pattern[6][7] ) );
  DFFRX1 \pattern_reg[6][6]  ( .D(n289), .CK(clk), .RN(n949), .Q(
        \pattern[6][6] ) );
  DFFRX1 \pattern_reg[6][4]  ( .D(n287), .CK(clk), .RN(n949), .Q(
        \pattern[6][4] ) );
  DFFRX1 \pattern_reg[6][3]  ( .D(n286), .CK(clk), .RN(n949), .Q(
        \pattern[6][3] ) );
  DFFRX1 \pattern_reg[6][1]  ( .D(n284), .CK(clk), .RN(n949), .Q(
        \pattern[6][1] ) );
  DFFRX1 \pattern_reg[6][0]  ( .D(n283), .CK(clk), .RN(n949), .Q(
        \pattern[6][0] ) );
  DFFRX1 \pattern_reg[7][7]  ( .D(n282), .CK(clk), .RN(n949), .Q(
        \pattern[7][7] ) );
  DFFRX1 \pattern_reg[7][6]  ( .D(n281), .CK(clk), .RN(n948), .Q(
        \pattern[7][6] ) );
  DFFRX1 \pattern_reg[7][4]  ( .D(n279), .CK(clk), .RN(n948), .Q(
        \pattern[7][4] ) );
  DFFRX1 \pattern_reg[7][3]  ( .D(n278), .CK(clk), .RN(n948), .Q(
        \pattern[7][3] ) );
  DFFRX1 \pattern_reg[7][1]  ( .D(n276), .CK(clk), .RN(n955), .Q(
        \pattern[7][1] ) );
  DFFRX1 \pattern_reg[7][0]  ( .D(n275), .CK(clk), .RN(n934), .Q(
        \pattern[7][0] ) );
  DFFRX1 \string_reg[16][7]  ( .D(n467), .CK(clk), .RN(n935), .Q(
        \string[16][7] ) );
  DFFRX1 \string_reg[18][7]  ( .D(n451), .CK(clk), .RN(n934), .Q(
        \string[18][7] ) );
  DFFRX1 \pattern_reg[0][5]  ( .D(n336), .CK(clk), .RN(n953), .Q(
        \pattern[0][5] ) );
  DFFRX1 \pattern_reg[0][3]  ( .D(n334), .CK(clk), .RN(n953), .Q(
        \pattern[0][3] ) );
  DFFRX1 \pattern_reg[0][1]  ( .D(n332), .CK(clk), .RN(n953), .Q(
        \pattern[0][1] ) );
  DFFRX1 \pattern_reg[1][5]  ( .D(n328), .CK(clk), .RN(n952), .Q(
        \pattern[1][5] ) );
  DFFRX1 \pattern_reg[1][3]  ( .D(n326), .CK(clk), .RN(n952), .Q(
        \pattern[1][3] ) );
  DFFRX1 \pattern_reg[1][1]  ( .D(n324), .CK(clk), .RN(n952), .Q(
        \pattern[1][1] ) );
  DFFRX1 \pattern_reg[2][5]  ( .D(n320), .CK(clk), .RN(n952), .Q(
        \pattern[2][5] ) );
  DFFRX1 \pattern_reg[2][3]  ( .D(n318), .CK(clk), .RN(n952), .Q(
        \pattern[2][3] ) );
  DFFRX1 \pattern_reg[2][1]  ( .D(n316), .CK(clk), .RN(n951), .Q(
        \pattern[2][1] ) );
  DFFRX1 \pattern_reg[3][5]  ( .D(n312), .CK(clk), .RN(n951), .Q(
        \pattern[3][5] ) );
  DFFRX1 \pattern_reg[3][1]  ( .D(n308), .CK(clk), .RN(n951), .Q(
        \pattern[3][1] ) );
  DFFRX1 \pattern_reg[4][5]  ( .D(n304), .CK(clk), .RN(n950), .Q(
        \pattern[4][5] ) );
  DFFRX1 \pattern_reg[5][5]  ( .D(n296), .CK(clk), .RN(n950), .Q(
        \pattern[5][5] ) );
  DFFRX1 \pattern_reg[6][5]  ( .D(n288), .CK(clk), .RN(n949), .Q(
        \pattern[6][5] ) );
  DFFRX1 \pattern_reg[7][5]  ( .D(n280), .CK(clk), .RN(n948), .Q(
        \pattern[7][5] ) );
  DFFRX1 \pattern_reg[0][2]  ( .D(n333), .CK(clk), .RN(n953), .Q(
        \pattern[0][2] ) );
  DFFRX1 \pattern_reg[1][2]  ( .D(n325), .CK(clk), .RN(n952), .Q(
        \pattern[1][2] ) );
  DFFRX1 \pattern_reg[2][2]  ( .D(n317), .CK(clk), .RN(n951), .Q(
        \pattern[2][2] ) );
  DFFRX1 \pattern_reg[3][2]  ( .D(n309), .CK(clk), .RN(n951), .Q(
        \pattern[3][2] ) );
  DFFRX1 \pattern_reg[4][2]  ( .D(n301), .CK(clk), .RN(n950), .Q(
        \pattern[4][2] ) );
  DFFRX1 \pattern_reg[5][2]  ( .D(n293), .CK(clk), .RN(n949), .Q(
        \pattern[5][2] ) );
  DFFRX1 \pattern_reg[6][2]  ( .D(n285), .CK(clk), .RN(n949), .Q(
        \pattern[6][2] ) );
  DFFRX1 \pattern_reg[7][2]  ( .D(n277), .CK(clk), .RN(n948), .Q(
        \pattern[7][2] ) );
  DFFRX1 \str_len_reg[5]  ( .D(n611), .CK(clk), .RN(n946), .Q(str_len[5]), 
        .QN(n60) );
  DFFRX1 \str_len_reg[4]  ( .D(n606), .CK(clk), .RN(n946), .Q(str_len[4]), 
        .QN(n69) );
  DFFRX1 \pat_len_reg[1]  ( .D(n619), .CK(clk), .RN(n947), .Q(pat_len[1]), 
        .QN(n76) );
  DFFRX1 \str_len_reg[3]  ( .D(n607), .CK(clk), .RN(n946), .Q(str_len[3]), 
        .QN(n70) );
  DFFRX1 \cur_pat_reg[2]  ( .D(n618), .CK(clk), .RN(n947), .Q(N39), .QN(n87)
         );
  DFFRX1 \cur_str_reg[2]  ( .D(n613), .CK(clk), .RN(n946), .Q(N42), .QN(n104)
         );
  DFFRX1 \cur_pat_reg[1]  ( .D(n617), .CK(clk), .RN(n947), .Q(N38), .QN(n88)
         );
  DFFRX1 match_reg ( .D(n339), .CK(clk), .RN(n953), .Q(n1033), .QN(n634) );
  DFFRX1 valid_reg ( .D(n622), .CK(clk), .RN(n947), .Q(n1032), .QN(n632) );
  DFFSX1 \match_index_reg[4]  ( .D(n600), .CK(clk), .SN(n963), .Q(n1034), .QN(
        n95) );
  DFFSX1 \match_index_reg[0]  ( .D(n599), .CK(clk), .SN(n963), .Q(n1038), .QN(
        n99) );
  DFFSX1 \match_index_reg[1]  ( .D(n598), .CK(clk), .SN(n963), .Q(n1037), .QN(
        n98) );
  DFFSX1 \match_index_reg[2]  ( .D(n597), .CK(clk), .SN(n963), .Q(n1036), .QN(
        n97) );
  DFFSX1 \match_index_reg[3]  ( .D(n596), .CK(clk), .SN(n963), .Q(n1035), .QN(
        n96) );
  DFFRX1 \cur_str_reg[0]  ( .D(n625), .CK(clk), .RN(n998), .Q(N40), .QN(N211)
         );
  DFFRX1 \cur_str_reg[1]  ( .D(n612), .CK(clk), .RN(n998), .Q(N41), .QN(n105)
         );
  DFFRX1 \cur_str_reg[3]  ( .D(n614), .CK(clk), .RN(n998), .Q(N43), .QN(n866)
         );
  DFFRX1 \pat_len_reg[0]  ( .D(n620), .CK(clk), .RN(n998), .Q(pat_len[0]), 
        .QN(n77) );
  DFFRX1 \str_len_reg[0]  ( .D(n610), .CK(clk), .RN(n998), .Q(str_len[0]), 
        .QN(n73) );
  DFFRX2 \cur_str_reg[4]  ( .D(n615), .CK(clk), .RN(n998), .Q(N44), .QN(n867)
         );
  DFFRX2 \str_len_reg[2]  ( .D(n608), .CK(clk), .RN(n998), .Q(str_len[2]), 
        .QN(n71) );
  DFFRX2 \str_len_reg[1]  ( .D(n609), .CK(clk), .RN(n998), .Q(str_len[1]), 
        .QN(n72) );
  DFFRX2 \pat_len_reg[2]  ( .D(n1007), .CK(clk), .RN(n998), .Q(pat_len[2]), 
        .QN(n75) );
  DFFRX2 \cur_pat_reg[0]  ( .D(n616), .CK(clk), .RN(n998), .Q(N37), .QN(n676)
         );
  NOR3X1 U557 ( .A(n885), .B(str_len[5]), .C(n1009), .Y(n159) );
  NOR3BX2 U558 ( .AN(n159), .B(n69), .C(str_len[3]), .Y(n161) );
  NOR3BX2 U559 ( .AN(n159), .B(n70), .C(str_len[4]), .Y(n170) );
  NOR3BX2 U560 ( .AN(n159), .B(n70), .C(n69), .Y(n144) );
  XNOR2X1 U561 ( .A(\add_113/carry [5]), .B(str_len[5]), .Y(n626) );
  NOR3XL U562 ( .A(N40), .B(N42), .C(N41), .Y(n997) );
  INVX3 U563 ( .A(reset), .Y(n998) );
  OAI22X1 U564 ( .A0(n676), .A1(n661), .B0(N37), .B1(n660), .Y(N325) );
  BUFX12 U565 ( .A(n1035), .Y(match_index[3]) );
  BUFX12 U566 ( .A(n1036), .Y(match_index[2]) );
  BUFX12 U567 ( .A(n1037), .Y(match_index[1]) );
  BUFX12 U568 ( .A(n1038), .Y(match_index[0]) );
  BUFX12 U569 ( .A(n1034), .Y(match_index[4]) );
  OAI22X1 U570 ( .A0(n676), .A1(n649), .B0(N37), .B1(n648), .Y(N328) );
  INVX12 U571 ( .A(n632), .Y(valid) );
  INVX12 U572 ( .A(n634), .Y(match) );
  XNOR2XL U573 ( .A(N325), .B(N333), .Y(n255) );
  OAI22XL U574 ( .A0(n248), .A1(n1022), .B0(n249), .B1(n250), .Y(n224) );
  OAI21XL U575 ( .A0(n885), .A1(n130), .B0(n199), .Y(n217) );
  CLKINVX1 U576 ( .A(N327), .Y(n1026) );
  CLKINVX1 U577 ( .A(N329), .Y(n1024) );
  NOR2BX1 U578 ( .AN(n124), .B(n75), .Y(n120) );
  NOR2BX1 U579 ( .AN(n124), .B(pat_len[2]), .Y(n126) );
  CLKBUFX3 U580 ( .A(n121), .Y(n924) );
  CLKBUFX3 U581 ( .A(n122), .Y(n923) );
  CLKBUFX3 U582 ( .A(n123), .Y(n922) );
  CLKBUFX3 U583 ( .A(n129), .Y(n918) );
  CLKBUFX3 U584 ( .A(n127), .Y(n920) );
  CLKINVX1 U585 ( .A(chardata[0]), .Y(n1006) );
  CLKINVX1 U586 ( .A(chardata[1]), .Y(n1005) );
  CLKINVX1 U587 ( .A(chardata[2]), .Y(n1004) );
  CLKINVX1 U588 ( .A(chardata[3]), .Y(n1003) );
  CLKINVX1 U589 ( .A(chardata[4]), .Y(n1002) );
  CLKINVX1 U590 ( .A(chardata[5]), .Y(n1001) );
  CLKINVX1 U591 ( .A(chardata[6]), .Y(n1000) );
  CLKINVX1 U592 ( .A(chardata[7]), .Y(n999) );
  OAI21X1 U593 ( .A0(n1013), .A1(n141), .B0(n235), .Y(n118) );
  NOR3X1 U594 ( .A(n88), .B(n87), .C(n676), .Y(n221) );
  NAND2X2 U595 ( .A(cur_state[1]), .B(n59), .Y(n117) );
  NOR3X2 U596 ( .A(str_len[1]), .B(str_len[2]), .C(n926), .Y(n158) );
  NOR3X1 U597 ( .A(n926), .B(str_len[1]), .C(n71), .Y(n150) );
  NOR3X1 U598 ( .A(n926), .B(str_len[2]), .C(n72), .Y(n154) );
  NOR3X1 U599 ( .A(n72), .B(n926), .C(n71), .Y(n146) );
  NOR3X1 U600 ( .A(n73), .B(n72), .C(n71), .Y(n143) );
  NOR3X1 U601 ( .A(n73), .B(str_len[1]), .C(n71), .Y(n148) );
  NOR3X1 U602 ( .A(n72), .B(str_len[2]), .C(n73), .Y(n152) );
  NOR3X1 U603 ( .A(str_len[1]), .B(str_len[2]), .C(n73), .Y(n156) );
  CLKINVX1 U604 ( .A(n224), .Y(n1013) );
  CLKBUFX3 U605 ( .A(n931), .Y(n949) );
  CLKBUFX3 U606 ( .A(n931), .Y(n950) );
  CLKBUFX3 U607 ( .A(n967), .Y(n951) );
  CLKBUFX3 U608 ( .A(n969), .Y(n952) );
  CLKBUFX3 U609 ( .A(n969), .Y(n953) );
  CLKBUFX3 U610 ( .A(n968), .Y(n954) );
  CLKBUFX3 U611 ( .A(n968), .Y(n955) );
  CLKBUFX3 U612 ( .A(n967), .Y(n956) );
  CLKBUFX3 U613 ( .A(n967), .Y(n957) );
  CLKBUFX3 U614 ( .A(n966), .Y(n958) );
  CLKBUFX3 U615 ( .A(n966), .Y(n959) );
  CLKBUFX3 U616 ( .A(n965), .Y(n960) );
  CLKBUFX3 U617 ( .A(n965), .Y(n961) );
  CLKBUFX3 U618 ( .A(n964), .Y(n962) );
  CLKBUFX3 U619 ( .A(n973), .Y(n934) );
  CLKBUFX3 U620 ( .A(n973), .Y(n935) );
  CLKBUFX3 U621 ( .A(n972), .Y(n936) );
  CLKBUFX3 U622 ( .A(n972), .Y(n937) );
  CLKBUFX3 U623 ( .A(n971), .Y(n938) );
  CLKBUFX3 U624 ( .A(n971), .Y(n939) );
  CLKBUFX3 U625 ( .A(n970), .Y(n940) );
  CLKBUFX3 U626 ( .A(n970), .Y(n941) );
  CLKBUFX3 U627 ( .A(n932), .Y(n942) );
  CLKBUFX3 U628 ( .A(n972), .Y(n943) );
  CLKBUFX3 U629 ( .A(n932), .Y(n944) );
  CLKBUFX3 U630 ( .A(n973), .Y(n945) );
  CLKBUFX3 U631 ( .A(n931), .Y(n946) );
  CLKBUFX3 U632 ( .A(n969), .Y(n947) );
  CLKBUFX3 U633 ( .A(n968), .Y(n948) );
  CLKBUFX3 U634 ( .A(n964), .Y(n963) );
  CLKINVX1 U635 ( .A(n217), .Y(n1008) );
  NAND4X1 U636 ( .A(n255), .B(n256), .C(n257), .D(n258), .Y(n249) );
  AOI2BB2X1 U637 ( .B0(n1027), .B1(n259), .A0N(n260), .A1N(n233), .Y(n248) );
  NAND4X1 U638 ( .A(n251), .B(n252), .C(n253), .D(n254), .Y(n250) );
  CLKINVX1 U639 ( .A(n140), .Y(n1027) );
  CLKINVX1 U640 ( .A(n265), .Y(n1017) );
  NAND4BX1 U641 ( .AN(N331), .B(N333), .C(n266), .D(n267), .Y(n265) );
  NOR2X1 U642 ( .A(N334), .B(N332), .Y(n266) );
  NOR4X1 U643 ( .A(N338), .B(N337), .C(N336), .D(N335), .Y(n267) );
  CLKINVX1 U644 ( .A(n209), .Y(n1014) );
  XOR2X1 U645 ( .A(N335), .B(n1026), .Y(n253) );
  XOR2X1 U646 ( .A(N337), .B(n1024), .Y(n251) );
  CLKINVX1 U647 ( .A(n192), .Y(n1019) );
  CLKINVX1 U648 ( .A(n230), .Y(n1022) );
  CLKINVX1 U649 ( .A(n233), .Y(n1025) );
  NOR2X1 U650 ( .A(n1020), .B(n1021), .Y(n131) );
  CLKBUFX3 U651 ( .A(n930), .Y(n969) );
  CLKBUFX3 U652 ( .A(n930), .Y(n968) );
  CLKBUFX3 U653 ( .A(n930), .Y(n967) );
  CLKBUFX3 U654 ( .A(n929), .Y(n966) );
  CLKBUFX3 U655 ( .A(n929), .Y(n965) );
  CLKBUFX3 U656 ( .A(n933), .Y(n973) );
  CLKBUFX3 U657 ( .A(n933), .Y(n972) );
  CLKBUFX3 U658 ( .A(n933), .Y(n971) );
  CLKBUFX3 U659 ( .A(n932), .Y(n970) );
  CLKBUFX3 U660 ( .A(n929), .Y(n964) );
  NAND2X1 U661 ( .A(n197), .B(n196), .Y(n194) );
  NAND2X1 U662 ( .A(n1020), .B(n196), .Y(n195) );
  CLKBUFX3 U663 ( .A(n160), .Y(n909) );
  NAND2X1 U664 ( .A(n161), .B(n143), .Y(n160) );
  CLKBUFX3 U665 ( .A(n162), .Y(n908) );
  NAND2X1 U666 ( .A(n161), .B(n146), .Y(n162) );
  CLKBUFX3 U667 ( .A(n163), .Y(n907) );
  NAND2X1 U668 ( .A(n161), .B(n148), .Y(n163) );
  CLKBUFX3 U669 ( .A(n164), .Y(n906) );
  NAND2X1 U670 ( .A(n161), .B(n150), .Y(n164) );
  CLKBUFX3 U671 ( .A(n165), .Y(n905) );
  NAND2X1 U672 ( .A(n161), .B(n152), .Y(n165) );
  CLKBUFX3 U673 ( .A(n166), .Y(n904) );
  NAND2X1 U674 ( .A(n161), .B(n154), .Y(n166) );
  CLKBUFX3 U675 ( .A(n167), .Y(n903) );
  NAND2X1 U676 ( .A(n161), .B(n156), .Y(n167) );
  CLKBUFX3 U677 ( .A(n168), .Y(n902) );
  NAND2X1 U678 ( .A(n161), .B(n158), .Y(n168) );
  CLKBUFX3 U679 ( .A(n169), .Y(n901) );
  NAND2X1 U680 ( .A(n170), .B(n143), .Y(n169) );
  CLKBUFX3 U681 ( .A(n171), .Y(n900) );
  NAND2X1 U682 ( .A(n170), .B(n146), .Y(n171) );
  CLKBUFX3 U683 ( .A(n172), .Y(n899) );
  NAND2X1 U684 ( .A(n170), .B(n148), .Y(n172) );
  CLKBUFX3 U685 ( .A(n173), .Y(n898) );
  NAND2X1 U686 ( .A(n170), .B(n150), .Y(n173) );
  CLKBUFX3 U687 ( .A(n174), .Y(n897) );
  NAND2X1 U688 ( .A(n170), .B(n152), .Y(n174) );
  CLKBUFX3 U689 ( .A(n175), .Y(n896) );
  NAND2X1 U690 ( .A(n170), .B(n154), .Y(n175) );
  CLKBUFX3 U691 ( .A(n176), .Y(n895) );
  NAND2X1 U692 ( .A(n170), .B(n156), .Y(n176) );
  CLKBUFX3 U693 ( .A(n177), .Y(n894) );
  NAND2X1 U694 ( .A(n170), .B(n158), .Y(n177) );
  AND2X2 U695 ( .A(n187), .B(n159), .Y(n179) );
  OAI21XL U696 ( .A0(n927), .A1(n885), .B0(n216), .Y(n215) );
  AOI2BB1X1 U697 ( .A0N(n928), .A1N(n885), .B0(n1008), .Y(n216) );
  CLKBUFX3 U698 ( .A(n125), .Y(n921) );
  NAND3X1 U699 ( .A(n927), .B(n928), .C(n126), .Y(n125) );
  CLKBUFX3 U700 ( .A(n119), .Y(n925) );
  NAND3X1 U701 ( .A(n928), .B(n120), .C(n927), .Y(n119) );
  CLKBUFX3 U702 ( .A(n142), .Y(n917) );
  NAND2X1 U703 ( .A(n143), .B(n144), .Y(n142) );
  CLKBUFX3 U704 ( .A(n145), .Y(n916) );
  NAND2X1 U705 ( .A(n146), .B(n144), .Y(n145) );
  CLKBUFX3 U706 ( .A(n147), .Y(n915) );
  NAND2X1 U707 ( .A(n148), .B(n144), .Y(n147) );
  CLKBUFX3 U708 ( .A(n149), .Y(n914) );
  NAND2X1 U709 ( .A(n150), .B(n144), .Y(n149) );
  CLKBUFX3 U710 ( .A(n151), .Y(n913) );
  NAND2X1 U711 ( .A(n152), .B(n144), .Y(n151) );
  CLKBUFX3 U712 ( .A(n153), .Y(n912) );
  NAND2X1 U713 ( .A(n154), .B(n144), .Y(n153) );
  CLKBUFX3 U714 ( .A(n155), .Y(n911) );
  NAND2X1 U715 ( .A(n156), .B(n144), .Y(n155) );
  CLKBUFX3 U716 ( .A(n157), .Y(n910) );
  NAND2X1 U717 ( .A(n158), .B(n144), .Y(n157) );
  CLKBUFX3 U718 ( .A(n178), .Y(n893) );
  NAND2X1 U719 ( .A(n179), .B(n143), .Y(n178) );
  CLKBUFX3 U720 ( .A(n183), .Y(n889) );
  NAND2X1 U721 ( .A(n179), .B(n152), .Y(n183) );
  CLKBUFX3 U722 ( .A(n184), .Y(n888) );
  NAND2X1 U723 ( .A(n179), .B(n154), .Y(n184) );
  CLKBUFX3 U724 ( .A(n185), .Y(n887) );
  NAND2X1 U725 ( .A(n179), .B(n156), .Y(n185) );
  CLKBUFX3 U726 ( .A(n186), .Y(n886) );
  NAND2X1 U727 ( .A(n179), .B(n158), .Y(n186) );
  CLKBUFX3 U728 ( .A(n181), .Y(n891) );
  NAND2X1 U729 ( .A(n179), .B(n148), .Y(n181) );
  CLKBUFX3 U730 ( .A(n182), .Y(n890) );
  NAND2X1 U731 ( .A(n179), .B(n150), .Y(n182) );
  CLKBUFX3 U732 ( .A(n180), .Y(n892) );
  NAND2X1 U733 ( .A(n179), .B(n146), .Y(n180) );
  CLKBUFX3 U734 ( .A(n1006), .Y(n989) );
  CLKBUFX3 U735 ( .A(n1005), .Y(n987) );
  CLKBUFX3 U736 ( .A(n1004), .Y(n985) );
  CLKBUFX3 U737 ( .A(n1003), .Y(n983) );
  CLKBUFX3 U738 ( .A(n1002), .Y(n981) );
  CLKBUFX3 U739 ( .A(n1001), .Y(n979) );
  CLKBUFX3 U740 ( .A(n1000), .Y(n977) );
  CLKBUFX3 U741 ( .A(n999), .Y(n975) );
  CLKBUFX3 U742 ( .A(n1006), .Y(n988) );
  CLKBUFX3 U743 ( .A(n1005), .Y(n986) );
  CLKBUFX3 U744 ( .A(n1004), .Y(n984) );
  CLKBUFX3 U745 ( .A(n1003), .Y(n982) );
  CLKBUFX3 U746 ( .A(n1002), .Y(n980) );
  CLKBUFX3 U747 ( .A(n1001), .Y(n978) );
  CLKBUFX3 U748 ( .A(n1000), .Y(n976) );
  CLKBUFX3 U749 ( .A(n999), .Y(n974) );
  XNOR2XL U750 ( .A(N336), .B(N328), .Y(n254) );
  NOR3BX2 U751 ( .AN(n227), .B(n117), .C(n118), .Y(n202) );
  NAND4XL U752 ( .A(N327), .B(N328), .C(N329), .D(n261), .Y(n233) );
  NOR3XL U753 ( .A(n636), .B(N325), .C(n637), .Y(n261) );
  NAND3XL U754 ( .A(n1026), .B(n1024), .C(N328), .Y(n139) );
  NAND3XL U755 ( .A(n637), .B(n636), .C(N325), .Y(n140) );
  XNOR2X1 U756 ( .A(N330), .B(N338), .Y(n252) );
  NAND2X1 U757 ( .A(n1018), .B(n118), .Y(n200) );
  NOR2X1 U758 ( .A(n211), .B(n117), .Y(n209) );
  CLKINVX1 U759 ( .A(n228), .Y(n1011) );
  OAI31XL U760 ( .A0(n118), .A1(n227), .A2(n117), .B0(nxt_state[1]), .Y(n228)
         );
  OAI21XL U761 ( .A0(n1026), .A1(n1024), .B0(n263), .Y(n259) );
  OAI21XL U762 ( .A0(n264), .A1(n1017), .B0(n1023), .Y(n263) );
  NOR4X1 U763 ( .A(n268), .B(n269), .C(n270), .D(n271), .Y(n264) );
  CLKINVX1 U764 ( .A(n139), .Y(n1023) );
  CLKINVX1 U765 ( .A(n188), .Y(n1010) );
  NOR2X1 U766 ( .A(n231), .B(n1017), .Y(n260) );
  CLKBUFX3 U767 ( .A(n850), .Y(n878) );
  NAND2X1 U768 ( .A(n687), .B(n688), .Y(n850) );
  CLKBUFX3 U769 ( .A(n855), .Y(n883) );
  NAND2X1 U770 ( .A(n692), .B(n690), .Y(n855) );
  CLKBUFX3 U771 ( .A(n853), .Y(n881) );
  NAND2X1 U772 ( .A(n692), .B(n688), .Y(n853) );
  CLKBUFX3 U773 ( .A(n851), .Y(n879) );
  NAND2X1 U774 ( .A(n687), .B(n690), .Y(n851) );
  CLKBUFX3 U775 ( .A(n839), .Y(n871) );
  NAND2X1 U776 ( .A(n681), .B(n690), .Y(n839) );
  CLKBUFX3 U777 ( .A(n837), .Y(n869) );
  NAND2X1 U778 ( .A(n681), .B(n688), .Y(n837) );
  CLKBUFX3 U779 ( .A(n841), .Y(n873) );
  NAND2XL U780 ( .A(n688), .B(n682), .Y(n841) );
  CLKBUFX3 U781 ( .A(n849), .Y(n877) );
  NAND2X1 U782 ( .A(n687), .B(n689), .Y(n849) );
  CLKBUFX3 U783 ( .A(n843), .Y(n875) );
  NAND2X1 U784 ( .A(n682), .B(n690), .Y(n843) );
  CLKBUFX3 U785 ( .A(n854), .Y(n884) );
  NAND2X1 U786 ( .A(n692), .B(n691), .Y(n854) );
  CLKBUFX3 U787 ( .A(n852), .Y(n882) );
  NAND2XL U788 ( .A(n692), .B(n689), .Y(n852) );
  CLKBUFX3 U789 ( .A(n838), .Y(n872) );
  NAND2X1 U790 ( .A(n681), .B(n691), .Y(n838) );
  CLKBUFX3 U791 ( .A(n856), .Y(n870) );
  NAND2XL U792 ( .A(n681), .B(n689), .Y(n856) );
  CLKBUFX3 U793 ( .A(n848), .Y(n880) );
  NAND2XL U794 ( .A(n687), .B(n691), .Y(n848) );
  CLKBUFX3 U795 ( .A(n840), .Y(n874) );
  NAND2XL U796 ( .A(n689), .B(n682), .Y(n840) );
  CLKBUFX3 U797 ( .A(n842), .Y(n876) );
  NAND2XL U798 ( .A(n691), .B(n682), .Y(n842) );
  CLKBUFX3 U799 ( .A(n670), .Y(n678) );
  NOR2X1 U800 ( .A(n674), .B(n675), .Y(n670) );
  NAND3X1 U801 ( .A(n230), .B(n1027), .C(n234), .Y(n193) );
  NOR3XL U802 ( .A(n1024), .B(N328), .C(n1026), .Y(n234) );
  XNOR2X1 U803 ( .A(N323), .B(N331), .Y(n257) );
  NOR2X1 U804 ( .A(N323), .B(N330), .Y(n230) );
  NOR2X1 U805 ( .A(n193), .B(n117), .Y(n192) );
  XOR2X1 U806 ( .A(n637), .B(N332), .Y(n258) );
  XOR2X1 U807 ( .A(n636), .B(N334), .Y(n256) );
  CLKINVX1 U808 ( .A(n926), .Y(N55) );
  CLKINVX1 U809 ( .A(n928), .Y(N63) );
  CLKINVX1 U810 ( .A(n117), .Y(n1018) );
  OR2X1 U811 ( .A(n197), .B(n1018), .Y(nxt_state[1]) );
  CLKINVX1 U812 ( .A(n199), .Y(n1021) );
  CLKINVX1 U813 ( .A(n885), .Y(n1020) );
  CLKBUFX3 U814 ( .A(n998), .Y(n930) );
  CLKBUFX3 U815 ( .A(n998), .Y(n933) );
  CLKBUFX3 U816 ( .A(n998), .Y(n932) );
  CLKBUFX3 U817 ( .A(n998), .Y(n929) );
  CLKBUFX3 U818 ( .A(n998), .Y(n931) );
  NAND4X1 U819 ( .A(n197), .B(n187), .C(n158), .D(n60), .Y(n198) );
  OAI222XL U820 ( .A0(n104), .A1(n194), .B0(n195), .B1(n1030), .C0(n71), .C1(
        n196), .Y(n608) );
  CLKINVX1 U821 ( .A(N117), .Y(n1030) );
  OAI222XL U822 ( .A0(n105), .A1(n194), .B0(n195), .B1(n1031), .C0(n72), .C1(
        n196), .Y(n609) );
  CLKINVX1 U823 ( .A(N116), .Y(n1031) );
  OAI222XL U824 ( .A0(n866), .A1(n194), .B0(n195), .B1(n1029), .C0(n70), .C1(
        n196), .Y(n607) );
  CLKINVX1 U825 ( .A(N118), .Y(n1029) );
  OAI222XL U826 ( .A0(N211), .A1(n194), .B0(n195), .B1(n926), .C0(n73), .C1(
        n196), .Y(n610) );
  OAI222XL U827 ( .A0(n100), .A1(n194), .B0(n195), .B1(n626), .C0(n60), .C1(
        n196), .Y(n611) );
  OAI222XL U828 ( .A0(n867), .A1(n194), .B0(n195), .B1(n1028), .C0(n69), .C1(
        n196), .Y(n606) );
  CLKINVX1 U829 ( .A(N119), .Y(n1028) );
  CLKINVX1 U830 ( .A(isstring), .Y(n1009) );
  OAI2BB2XL U831 ( .B0(n988), .B1(n909), .A0N(\string[23][0] ), .A1N(n909), 
        .Y(n404) );
  OAI2BB2XL U832 ( .B0(n986), .B1(n909), .A0N(\string[23][1] ), .A1N(n909), 
        .Y(n405) );
  OAI2BB2XL U833 ( .B0(n984), .B1(n909), .A0N(\string[23][2] ), .A1N(n909), 
        .Y(n406) );
  OAI2BB2XL U834 ( .B0(n982), .B1(n909), .A0N(\string[23][3] ), .A1N(n909), 
        .Y(n407) );
  OAI2BB2XL U835 ( .B0(n980), .B1(n909), .A0N(\string[23][4] ), .A1N(n909), 
        .Y(n408) );
  OAI2BB2XL U836 ( .B0(n978), .B1(n909), .A0N(\string[23][5] ), .A1N(n909), 
        .Y(n409) );
  OAI2BB2XL U837 ( .B0(n976), .B1(n909), .A0N(\string[23][6] ), .A1N(n909), 
        .Y(n410) );
  OAI2BB2XL U838 ( .B0(n974), .B1(n909), .A0N(\string[23][7] ), .A1N(n909), 
        .Y(n411) );
  OAI2BB2XL U839 ( .B0(n988), .B1(n908), .A0N(\string[22][0] ), .A1N(n908), 
        .Y(n412) );
  OAI2BB2XL U840 ( .B0(n986), .B1(n908), .A0N(\string[22][1] ), .A1N(n908), 
        .Y(n413) );
  OAI2BB2XL U841 ( .B0(n984), .B1(n908), .A0N(\string[22][2] ), .A1N(n908), 
        .Y(n414) );
  OAI2BB2XL U842 ( .B0(n982), .B1(n908), .A0N(\string[22][3] ), .A1N(n908), 
        .Y(n415) );
  OAI2BB2XL U843 ( .B0(n980), .B1(n908), .A0N(\string[22][4] ), .A1N(n908), 
        .Y(n416) );
  OAI2BB2XL U844 ( .B0(n978), .B1(n908), .A0N(\string[22][5] ), .A1N(n908), 
        .Y(n417) );
  OAI2BB2XL U845 ( .B0(n976), .B1(n908), .A0N(\string[22][6] ), .A1N(n908), 
        .Y(n418) );
  OAI2BB2XL U846 ( .B0(n974), .B1(n908), .A0N(\string[22][7] ), .A1N(n908), 
        .Y(n419) );
  OAI2BB2XL U847 ( .B0(n988), .B1(n907), .A0N(\string[21][0] ), .A1N(n907), 
        .Y(n420) );
  OAI2BB2XL U848 ( .B0(n986), .B1(n907), .A0N(\string[21][1] ), .A1N(n907), 
        .Y(n421) );
  OAI2BB2XL U849 ( .B0(n984), .B1(n907), .A0N(\string[21][2] ), .A1N(n907), 
        .Y(n422) );
  OAI2BB2XL U850 ( .B0(n982), .B1(n907), .A0N(\string[21][3] ), .A1N(n907), 
        .Y(n423) );
  OAI2BB2XL U851 ( .B0(n980), .B1(n907), .A0N(\string[21][4] ), .A1N(n907), 
        .Y(n424) );
  OAI2BB2XL U852 ( .B0(n978), .B1(n907), .A0N(\string[21][5] ), .A1N(n907), 
        .Y(n425) );
  OAI2BB2XL U853 ( .B0(n976), .B1(n907), .A0N(\string[21][6] ), .A1N(n907), 
        .Y(n426) );
  OAI2BB2XL U854 ( .B0(n974), .B1(n907), .A0N(\string[21][7] ), .A1N(n907), 
        .Y(n427) );
  OAI2BB2XL U855 ( .B0(n988), .B1(n906), .A0N(\string[20][0] ), .A1N(n906), 
        .Y(n428) );
  OAI2BB2XL U856 ( .B0(n986), .B1(n906), .A0N(\string[20][1] ), .A1N(n906), 
        .Y(n429) );
  OAI2BB2XL U857 ( .B0(n984), .B1(n906), .A0N(\string[20][2] ), .A1N(n906), 
        .Y(n430) );
  OAI2BB2XL U858 ( .B0(n982), .B1(n906), .A0N(\string[20][3] ), .A1N(n906), 
        .Y(n431) );
  OAI2BB2XL U859 ( .B0(n980), .B1(n906), .A0N(\string[20][4] ), .A1N(n906), 
        .Y(n432) );
  OAI2BB2XL U860 ( .B0(n978), .B1(n906), .A0N(\string[20][5] ), .A1N(n906), 
        .Y(n433) );
  OAI2BB2XL U861 ( .B0(n976), .B1(n906), .A0N(\string[20][6] ), .A1N(n906), 
        .Y(n434) );
  OAI2BB2XL U862 ( .B0(n974), .B1(n906), .A0N(\string[20][7] ), .A1N(n906), 
        .Y(n435) );
  OAI2BB2XL U863 ( .B0(n988), .B1(n905), .A0N(\string[19][0] ), .A1N(n905), 
        .Y(n436) );
  OAI2BB2XL U864 ( .B0(n986), .B1(n905), .A0N(\string[19][1] ), .A1N(n905), 
        .Y(n437) );
  OAI2BB2XL U865 ( .B0(n984), .B1(n905), .A0N(\string[19][2] ), .A1N(n905), 
        .Y(n438) );
  OAI2BB2XL U866 ( .B0(n982), .B1(n905), .A0N(\string[19][3] ), .A1N(n905), 
        .Y(n439) );
  OAI2BB2XL U867 ( .B0(n980), .B1(n905), .A0N(\string[19][4] ), .A1N(n905), 
        .Y(n440) );
  OAI2BB2XL U868 ( .B0(n978), .B1(n905), .A0N(\string[19][5] ), .A1N(n905), 
        .Y(n441) );
  OAI2BB2XL U869 ( .B0(n976), .B1(n905), .A0N(\string[19][6] ), .A1N(n905), 
        .Y(n442) );
  OAI2BB2XL U870 ( .B0(n974), .B1(n905), .A0N(\string[19][7] ), .A1N(n905), 
        .Y(n443) );
  OAI2BB2XL U871 ( .B0(n988), .B1(n904), .A0N(\string[18][0] ), .A1N(n904), 
        .Y(n444) );
  OAI2BB2XL U872 ( .B0(n986), .B1(n904), .A0N(\string[18][1] ), .A1N(n904), 
        .Y(n445) );
  OAI2BB2XL U873 ( .B0(n984), .B1(n904), .A0N(\string[18][2] ), .A1N(n904), 
        .Y(n446) );
  OAI2BB2XL U874 ( .B0(n982), .B1(n904), .A0N(\string[18][3] ), .A1N(n904), 
        .Y(n447) );
  OAI2BB2XL U875 ( .B0(n980), .B1(n904), .A0N(\string[18][4] ), .A1N(n904), 
        .Y(n448) );
  OAI2BB2XL U876 ( .B0(n978), .B1(n904), .A0N(\string[18][5] ), .A1N(n904), 
        .Y(n449) );
  OAI2BB2XL U877 ( .B0(n976), .B1(n904), .A0N(\string[18][6] ), .A1N(n904), 
        .Y(n450) );
  OAI2BB2XL U878 ( .B0(n974), .B1(n904), .A0N(\string[18][7] ), .A1N(n904), 
        .Y(n451) );
  OAI2BB2XL U879 ( .B0(n988), .B1(n903), .A0N(\string[17][0] ), .A1N(n903), 
        .Y(n452) );
  OAI2BB2XL U880 ( .B0(n986), .B1(n903), .A0N(\string[17][1] ), .A1N(n903), 
        .Y(n453) );
  OAI2BB2XL U881 ( .B0(n984), .B1(n903), .A0N(\string[17][2] ), .A1N(n903), 
        .Y(n454) );
  OAI2BB2XL U882 ( .B0(n982), .B1(n903), .A0N(\string[17][3] ), .A1N(n903), 
        .Y(n455) );
  OAI2BB2XL U883 ( .B0(n980), .B1(n903), .A0N(\string[17][4] ), .A1N(n903), 
        .Y(n456) );
  OAI2BB2XL U884 ( .B0(n978), .B1(n903), .A0N(\string[17][5] ), .A1N(n903), 
        .Y(n457) );
  OAI2BB2XL U885 ( .B0(n976), .B1(n903), .A0N(\string[17][6] ), .A1N(n903), 
        .Y(n458) );
  OAI2BB2XL U886 ( .B0(n974), .B1(n903), .A0N(\string[17][7] ), .A1N(n903), 
        .Y(n459) );
  OAI2BB2XL U887 ( .B0(n988), .B1(n902), .A0N(\string[16][0] ), .A1N(n902), 
        .Y(n460) );
  OAI2BB2XL U888 ( .B0(n986), .B1(n902), .A0N(\string[16][1] ), .A1N(n902), 
        .Y(n461) );
  OAI2BB2XL U889 ( .B0(n984), .B1(n902), .A0N(\string[16][2] ), .A1N(n902), 
        .Y(n462) );
  OAI2BB2XL U890 ( .B0(n982), .B1(n902), .A0N(\string[16][3] ), .A1N(n902), 
        .Y(n463) );
  OAI2BB2XL U891 ( .B0(n980), .B1(n902), .A0N(\string[16][4] ), .A1N(n902), 
        .Y(n464) );
  OAI2BB2XL U892 ( .B0(n978), .B1(n902), .A0N(\string[16][5] ), .A1N(n902), 
        .Y(n465) );
  OAI2BB2XL U893 ( .B0(n976), .B1(n902), .A0N(\string[16][6] ), .A1N(n902), 
        .Y(n466) );
  OAI2BB2XL U894 ( .B0(n974), .B1(n902), .A0N(\string[16][7] ), .A1N(n902), 
        .Y(n467) );
  OAI2BB2XL U895 ( .B0(n988), .B1(n901), .A0N(\string[15][0] ), .A1N(n901), 
        .Y(n468) );
  OAI2BB2XL U896 ( .B0(n986), .B1(n901), .A0N(\string[15][1] ), .A1N(n901), 
        .Y(n469) );
  OAI2BB2XL U897 ( .B0(n984), .B1(n901), .A0N(\string[15][2] ), .A1N(n901), 
        .Y(n470) );
  OAI2BB2XL U898 ( .B0(n982), .B1(n901), .A0N(\string[15][3] ), .A1N(n901), 
        .Y(n471) );
  OAI2BB2XL U899 ( .B0(n980), .B1(n901), .A0N(\string[15][4] ), .A1N(n901), 
        .Y(n472) );
  OAI2BB2XL U900 ( .B0(n978), .B1(n901), .A0N(\string[15][5] ), .A1N(n901), 
        .Y(n473) );
  OAI2BB2XL U901 ( .B0(n976), .B1(n901), .A0N(\string[15][6] ), .A1N(n901), 
        .Y(n474) );
  OAI2BB2XL U902 ( .B0(n974), .B1(n901), .A0N(\string[15][7] ), .A1N(n901), 
        .Y(n475) );
  OAI2BB2XL U903 ( .B0(n988), .B1(n900), .A0N(\string[14][0] ), .A1N(n900), 
        .Y(n476) );
  OAI2BB2XL U904 ( .B0(n986), .B1(n900), .A0N(\string[14][1] ), .A1N(n900), 
        .Y(n477) );
  OAI2BB2XL U905 ( .B0(n984), .B1(n900), .A0N(\string[14][2] ), .A1N(n900), 
        .Y(n478) );
  OAI2BB2XL U906 ( .B0(n982), .B1(n900), .A0N(\string[14][3] ), .A1N(n900), 
        .Y(n479) );
  OAI2BB2XL U907 ( .B0(n980), .B1(n900), .A0N(\string[14][4] ), .A1N(n900), 
        .Y(n480) );
  OAI2BB2XL U908 ( .B0(n978), .B1(n900), .A0N(\string[14][5] ), .A1N(n900), 
        .Y(n481) );
  OAI2BB2XL U909 ( .B0(n976), .B1(n900), .A0N(\string[14][6] ), .A1N(n900), 
        .Y(n482) );
  OAI2BB2XL U910 ( .B0(n974), .B1(n900), .A0N(\string[14][7] ), .A1N(n900), 
        .Y(n483) );
  OAI2BB2XL U911 ( .B0(n988), .B1(n899), .A0N(\string[13][0] ), .A1N(n899), 
        .Y(n484) );
  OAI2BB2XL U912 ( .B0(n986), .B1(n899), .A0N(\string[13][1] ), .A1N(n899), 
        .Y(n485) );
  OAI2BB2XL U913 ( .B0(n984), .B1(n899), .A0N(\string[13][2] ), .A1N(n899), 
        .Y(n486) );
  OAI2BB2XL U914 ( .B0(n982), .B1(n899), .A0N(\string[13][3] ), .A1N(n899), 
        .Y(n487) );
  OAI2BB2XL U915 ( .B0(n980), .B1(n899), .A0N(\string[13][4] ), .A1N(n899), 
        .Y(n488) );
  OAI2BB2XL U916 ( .B0(n978), .B1(n899), .A0N(\string[13][5] ), .A1N(n899), 
        .Y(n489) );
  OAI2BB2XL U917 ( .B0(n976), .B1(n899), .A0N(\string[13][6] ), .A1N(n899), 
        .Y(n490) );
  OAI2BB2XL U918 ( .B0(n974), .B1(n899), .A0N(\string[13][7] ), .A1N(n899), 
        .Y(n491) );
  OAI2BB2XL U919 ( .B0(n988), .B1(n898), .A0N(\string[12][0] ), .A1N(n898), 
        .Y(n492) );
  OAI2BB2XL U920 ( .B0(n986), .B1(n898), .A0N(\string[12][1] ), .A1N(n898), 
        .Y(n493) );
  OAI2BB2XL U921 ( .B0(n984), .B1(n898), .A0N(\string[12][2] ), .A1N(n898), 
        .Y(n494) );
  OAI2BB2XL U922 ( .B0(n982), .B1(n898), .A0N(\string[12][3] ), .A1N(n898), 
        .Y(n495) );
  OAI2BB2XL U923 ( .B0(n980), .B1(n898), .A0N(\string[12][4] ), .A1N(n898), 
        .Y(n496) );
  OAI2BB2XL U924 ( .B0(n978), .B1(n898), .A0N(\string[12][5] ), .A1N(n898), 
        .Y(n497) );
  OAI2BB2XL U925 ( .B0(n976), .B1(n898), .A0N(\string[12][6] ), .A1N(n898), 
        .Y(n498) );
  OAI2BB2XL U926 ( .B0(n974), .B1(n898), .A0N(\string[12][7] ), .A1N(n898), 
        .Y(n499) );
  OAI2BB2XL U927 ( .B0(n988), .B1(n897), .A0N(\string[11][0] ), .A1N(n897), 
        .Y(n500) );
  OAI2BB2XL U928 ( .B0(n986), .B1(n897), .A0N(\string[11][1] ), .A1N(n897), 
        .Y(n501) );
  OAI2BB2XL U929 ( .B0(n984), .B1(n897), .A0N(\string[11][2] ), .A1N(n897), 
        .Y(n502) );
  OAI2BB2XL U930 ( .B0(n982), .B1(n897), .A0N(\string[11][3] ), .A1N(n897), 
        .Y(n503) );
  OAI2BB2XL U931 ( .B0(n980), .B1(n897), .A0N(\string[11][4] ), .A1N(n897), 
        .Y(n504) );
  OAI2BB2XL U932 ( .B0(n978), .B1(n897), .A0N(\string[11][5] ), .A1N(n897), 
        .Y(n505) );
  OAI2BB2XL U933 ( .B0(n976), .B1(n897), .A0N(\string[11][6] ), .A1N(n897), 
        .Y(n506) );
  OAI2BB2XL U934 ( .B0(n974), .B1(n897), .A0N(\string[11][7] ), .A1N(n897), 
        .Y(n507) );
  OAI2BB2XL U935 ( .B0(n989), .B1(n896), .A0N(\string[10][0] ), .A1N(n896), 
        .Y(n508) );
  OAI2BB2XL U936 ( .B0(n987), .B1(n896), .A0N(\string[10][1] ), .A1N(n896), 
        .Y(n509) );
  OAI2BB2XL U937 ( .B0(n985), .B1(n896), .A0N(\string[10][2] ), .A1N(n896), 
        .Y(n510) );
  OAI2BB2XL U938 ( .B0(n983), .B1(n896), .A0N(\string[10][3] ), .A1N(n896), 
        .Y(n511) );
  OAI2BB2XL U939 ( .B0(n981), .B1(n896), .A0N(\string[10][4] ), .A1N(n896), 
        .Y(n512) );
  OAI2BB2XL U940 ( .B0(n979), .B1(n896), .A0N(\string[10][5] ), .A1N(n896), 
        .Y(n513) );
  OAI2BB2XL U941 ( .B0(n977), .B1(n896), .A0N(\string[10][6] ), .A1N(n896), 
        .Y(n514) );
  OAI2BB2XL U942 ( .B0(n975), .B1(n896), .A0N(\string[10][7] ), .A1N(n896), 
        .Y(n515) );
  OAI2BB2XL U943 ( .B0(n988), .B1(n895), .A0N(\string[9][0] ), .A1N(n895), .Y(
        n516) );
  OAI2BB2XL U944 ( .B0(n986), .B1(n895), .A0N(\string[9][1] ), .A1N(n895), .Y(
        n517) );
  OAI2BB2XL U945 ( .B0(n984), .B1(n895), .A0N(\string[9][2] ), .A1N(n895), .Y(
        n518) );
  OAI2BB2XL U946 ( .B0(n982), .B1(n895), .A0N(\string[9][3] ), .A1N(n895), .Y(
        n519) );
  OAI2BB2XL U947 ( .B0(n980), .B1(n895), .A0N(\string[9][4] ), .A1N(n895), .Y(
        n520) );
  OAI2BB2XL U948 ( .B0(n978), .B1(n895), .A0N(\string[9][5] ), .A1N(n895), .Y(
        n521) );
  OAI2BB2XL U949 ( .B0(n976), .B1(n895), .A0N(\string[9][6] ), .A1N(n895), .Y(
        n522) );
  OAI2BB2XL U950 ( .B0(n974), .B1(n895), .A0N(\string[9][7] ), .A1N(n895), .Y(
        n523) );
  OAI2BB2XL U951 ( .B0(n989), .B1(n894), .A0N(\string[8][0] ), .A1N(n894), .Y(
        n524) );
  OAI2BB2XL U952 ( .B0(n987), .B1(n894), .A0N(\string[8][1] ), .A1N(n894), .Y(
        n525) );
  OAI2BB2XL U953 ( .B0(n985), .B1(n894), .A0N(\string[8][2] ), .A1N(n894), .Y(
        n526) );
  OAI2BB2XL U954 ( .B0(n983), .B1(n894), .A0N(\string[8][3] ), .A1N(n894), .Y(
        n527) );
  OAI2BB2XL U955 ( .B0(n981), .B1(n894), .A0N(\string[8][4] ), .A1N(n894), .Y(
        n528) );
  OAI2BB2XL U956 ( .B0(n979), .B1(n894), .A0N(\string[8][5] ), .A1N(n894), .Y(
        n529) );
  OAI2BB2XL U957 ( .B0(n977), .B1(n894), .A0N(\string[8][6] ), .A1N(n894), .Y(
        n530) );
  OAI2BB2XL U958 ( .B0(n975), .B1(n894), .A0N(\string[8][7] ), .A1N(n894), .Y(
        n531) );
  OAI32X1 U959 ( .A0(n885), .A1(n928), .A2(n1008), .B0(n77), .B1(n217), .Y(
        n620) );
  NOR3X1 U960 ( .A(n885), .B(n1008), .C(n77), .Y(n214) );
  NAND2X1 U961 ( .A(ispattern), .B(n1009), .Y(n130) );
  NOR3X1 U962 ( .A(n885), .B(pat_len[3]), .C(n130), .Y(n124) );
  OAI2BB2XL U963 ( .B0(n216), .B1(n76), .A0N(n76), .A1N(n214), .Y(n619) );
  CLKBUFX3 U964 ( .A(n128), .Y(n919) );
  NAND3X1 U965 ( .A(n928), .B(n76), .C(n126), .Y(n128) );
  OAI2BB2XL U966 ( .B0(n925), .B1(n989), .A0N(\pattern[7][0] ), .A1N(n925), 
        .Y(n275) );
  OAI2BB2XL U967 ( .B0(n925), .B1(n987), .A0N(\pattern[7][1] ), .A1N(n925), 
        .Y(n276) );
  OAI2BB2XL U968 ( .B0(n925), .B1(n985), .A0N(\pattern[7][2] ), .A1N(n925), 
        .Y(n277) );
  OAI2BB2XL U969 ( .B0(n925), .B1(n983), .A0N(\pattern[7][3] ), .A1N(n925), 
        .Y(n278) );
  OAI2BB2XL U970 ( .B0(n925), .B1(n981), .A0N(\pattern[7][4] ), .A1N(n925), 
        .Y(n279) );
  OAI2BB2XL U971 ( .B0(n925), .B1(n979), .A0N(\pattern[7][5] ), .A1N(n925), 
        .Y(n280) );
  OAI2BB2XL U972 ( .B0(n925), .B1(n977), .A0N(\pattern[7][6] ), .A1N(n925), 
        .Y(n281) );
  OAI2BB2XL U973 ( .B0(n925), .B1(n975), .A0N(\pattern[7][7] ), .A1N(n925), 
        .Y(n282) );
  OAI2BB2XL U974 ( .B0(n989), .B1(n917), .A0N(\string[31][0] ), .A1N(n917), 
        .Y(n340) );
  OAI2BB2XL U975 ( .B0(n987), .B1(n917), .A0N(\string[31][1] ), .A1N(n917), 
        .Y(n341) );
  OAI2BB2XL U976 ( .B0(n985), .B1(n917), .A0N(\string[31][2] ), .A1N(n917), 
        .Y(n342) );
  OAI2BB2XL U977 ( .B0(n983), .B1(n917), .A0N(\string[31][3] ), .A1N(n917), 
        .Y(n343) );
  OAI2BB2XL U978 ( .B0(n981), .B1(n917), .A0N(\string[31][4] ), .A1N(n917), 
        .Y(n344) );
  OAI2BB2XL U979 ( .B0(n979), .B1(n917), .A0N(\string[31][5] ), .A1N(n917), 
        .Y(n345) );
  OAI2BB2XL U980 ( .B0(n977), .B1(n917), .A0N(\string[31][6] ), .A1N(n917), 
        .Y(n346) );
  OAI2BB2XL U981 ( .B0(n975), .B1(n917), .A0N(\string[31][7] ), .A1N(n917), 
        .Y(n347) );
  OAI2BB2XL U982 ( .B0(n989), .B1(n916), .A0N(\string[30][0] ), .A1N(n916), 
        .Y(n348) );
  OAI2BB2XL U983 ( .B0(n987), .B1(n916), .A0N(\string[30][1] ), .A1N(n916), 
        .Y(n349) );
  OAI2BB2XL U984 ( .B0(n985), .B1(n916), .A0N(\string[30][2] ), .A1N(n916), 
        .Y(n350) );
  OAI2BB2XL U985 ( .B0(n983), .B1(n916), .A0N(\string[30][3] ), .A1N(n916), 
        .Y(n351) );
  OAI2BB2XL U986 ( .B0(n981), .B1(n916), .A0N(\string[30][4] ), .A1N(n916), 
        .Y(n352) );
  OAI2BB2XL U987 ( .B0(n979), .B1(n916), .A0N(\string[30][5] ), .A1N(n916), 
        .Y(n353) );
  OAI2BB2XL U988 ( .B0(n977), .B1(n916), .A0N(\string[30][6] ), .A1N(n916), 
        .Y(n354) );
  OAI2BB2XL U989 ( .B0(n975), .B1(n916), .A0N(\string[30][7] ), .A1N(n916), 
        .Y(n355) );
  OAI2BB2XL U990 ( .B0(n989), .B1(n915), .A0N(\string[29][0] ), .A1N(n915), 
        .Y(n356) );
  OAI2BB2XL U991 ( .B0(n987), .B1(n915), .A0N(\string[29][1] ), .A1N(n915), 
        .Y(n357) );
  OAI2BB2XL U992 ( .B0(n985), .B1(n915), .A0N(\string[29][2] ), .A1N(n915), 
        .Y(n358) );
  OAI2BB2XL U993 ( .B0(n983), .B1(n915), .A0N(\string[29][3] ), .A1N(n915), 
        .Y(n359) );
  OAI2BB2XL U994 ( .B0(n981), .B1(n915), .A0N(\string[29][4] ), .A1N(n915), 
        .Y(n360) );
  OAI2BB2XL U995 ( .B0(n979), .B1(n915), .A0N(\string[29][5] ), .A1N(n915), 
        .Y(n361) );
  OAI2BB2XL U996 ( .B0(n977), .B1(n915), .A0N(\string[29][6] ), .A1N(n915), 
        .Y(n362) );
  OAI2BB2XL U997 ( .B0(n975), .B1(n915), .A0N(\string[29][7] ), .A1N(n915), 
        .Y(n363) );
  OAI2BB2XL U998 ( .B0(n989), .B1(n914), .A0N(\string[28][0] ), .A1N(n914), 
        .Y(n364) );
  OAI2BB2XL U999 ( .B0(n987), .B1(n914), .A0N(\string[28][1] ), .A1N(n914), 
        .Y(n365) );
  OAI2BB2XL U1000 ( .B0(n985), .B1(n914), .A0N(\string[28][2] ), .A1N(n914), 
        .Y(n366) );
  OAI2BB2XL U1001 ( .B0(n983), .B1(n914), .A0N(\string[28][3] ), .A1N(n914), 
        .Y(n367) );
  OAI2BB2XL U1002 ( .B0(n981), .B1(n914), .A0N(\string[28][4] ), .A1N(n914), 
        .Y(n368) );
  OAI2BB2XL U1003 ( .B0(n979), .B1(n914), .A0N(\string[28][5] ), .A1N(n914), 
        .Y(n369) );
  OAI2BB2XL U1004 ( .B0(n977), .B1(n914), .A0N(\string[28][6] ), .A1N(n914), 
        .Y(n370) );
  OAI2BB2XL U1005 ( .B0(n975), .B1(n914), .A0N(\string[28][7] ), .A1N(n914), 
        .Y(n371) );
  OAI2BB2XL U1006 ( .B0(n989), .B1(n913), .A0N(\string[27][0] ), .A1N(n913), 
        .Y(n372) );
  OAI2BB2XL U1007 ( .B0(n987), .B1(n913), .A0N(\string[27][1] ), .A1N(n913), 
        .Y(n373) );
  OAI2BB2XL U1008 ( .B0(n985), .B1(n913), .A0N(\string[27][2] ), .A1N(n913), 
        .Y(n374) );
  OAI2BB2XL U1009 ( .B0(n983), .B1(n913), .A0N(\string[27][3] ), .A1N(n913), 
        .Y(n375) );
  OAI2BB2XL U1010 ( .B0(n981), .B1(n913), .A0N(\string[27][4] ), .A1N(n913), 
        .Y(n376) );
  OAI2BB2XL U1011 ( .B0(n979), .B1(n913), .A0N(\string[27][5] ), .A1N(n913), 
        .Y(n377) );
  OAI2BB2XL U1012 ( .B0(n977), .B1(n913), .A0N(\string[27][6] ), .A1N(n913), 
        .Y(n378) );
  OAI2BB2XL U1013 ( .B0(n975), .B1(n913), .A0N(\string[27][7] ), .A1N(n913), 
        .Y(n379) );
  OAI2BB2XL U1014 ( .B0(n989), .B1(n912), .A0N(\string[26][0] ), .A1N(n912), 
        .Y(n380) );
  OAI2BB2XL U1015 ( .B0(n987), .B1(n912), .A0N(\string[26][1] ), .A1N(n912), 
        .Y(n381) );
  OAI2BB2XL U1016 ( .B0(n985), .B1(n912), .A0N(\string[26][2] ), .A1N(n912), 
        .Y(n382) );
  OAI2BB2XL U1017 ( .B0(n983), .B1(n912), .A0N(\string[26][3] ), .A1N(n912), 
        .Y(n383) );
  OAI2BB2XL U1018 ( .B0(n981), .B1(n912), .A0N(\string[26][4] ), .A1N(n912), 
        .Y(n384) );
  OAI2BB2XL U1019 ( .B0(n979), .B1(n912), .A0N(\string[26][5] ), .A1N(n912), 
        .Y(n385) );
  OAI2BB2XL U1020 ( .B0(n977), .B1(n912), .A0N(\string[26][6] ), .A1N(n912), 
        .Y(n386) );
  OAI2BB2XL U1021 ( .B0(n975), .B1(n912), .A0N(\string[26][7] ), .A1N(n912), 
        .Y(n387) );
  OAI2BB2XL U1022 ( .B0(n989), .B1(n911), .A0N(\string[25][0] ), .A1N(n911), 
        .Y(n388) );
  OAI2BB2XL U1023 ( .B0(n987), .B1(n911), .A0N(\string[25][1] ), .A1N(n911), 
        .Y(n389) );
  OAI2BB2XL U1024 ( .B0(n985), .B1(n911), .A0N(\string[25][2] ), .A1N(n911), 
        .Y(n390) );
  OAI2BB2XL U1025 ( .B0(n983), .B1(n911), .A0N(\string[25][3] ), .A1N(n911), 
        .Y(n391) );
  OAI2BB2XL U1026 ( .B0(n981), .B1(n911), .A0N(\string[25][4] ), .A1N(n911), 
        .Y(n392) );
  OAI2BB2XL U1027 ( .B0(n979), .B1(n911), .A0N(\string[25][5] ), .A1N(n911), 
        .Y(n393) );
  OAI2BB2XL U1028 ( .B0(n977), .B1(n911), .A0N(\string[25][6] ), .A1N(n911), 
        .Y(n394) );
  OAI2BB2XL U1029 ( .B0(n975), .B1(n911), .A0N(\string[25][7] ), .A1N(n911), 
        .Y(n395) );
  OAI2BB2XL U1030 ( .B0(n989), .B1(n910), .A0N(\string[24][0] ), .A1N(n910), 
        .Y(n396) );
  OAI2BB2XL U1031 ( .B0(n987), .B1(n910), .A0N(\string[24][1] ), .A1N(n910), 
        .Y(n397) );
  OAI2BB2XL U1032 ( .B0(n985), .B1(n910), .A0N(\string[24][2] ), .A1N(n910), 
        .Y(n398) );
  OAI2BB2XL U1033 ( .B0(n983), .B1(n910), .A0N(\string[24][3] ), .A1N(n910), 
        .Y(n399) );
  OAI2BB2XL U1034 ( .B0(n981), .B1(n910), .A0N(\string[24][4] ), .A1N(n910), 
        .Y(n400) );
  OAI2BB2XL U1035 ( .B0(n979), .B1(n910), .A0N(\string[24][5] ), .A1N(n910), 
        .Y(n401) );
  OAI2BB2XL U1036 ( .B0(n977), .B1(n910), .A0N(\string[24][6] ), .A1N(n910), 
        .Y(n402) );
  OAI2BB2XL U1037 ( .B0(n975), .B1(n910), .A0N(\string[24][7] ), .A1N(n910), 
        .Y(n403) );
  OAI2BB2XL U1038 ( .B0(n988), .B1(n924), .A0N(\pattern[6][0] ), .A1N(n924), 
        .Y(n283) );
  OAI2BB2XL U1039 ( .B0(n986), .B1(n924), .A0N(\pattern[6][1] ), .A1N(n924), 
        .Y(n284) );
  OAI2BB2XL U1040 ( .B0(n984), .B1(n924), .A0N(\pattern[6][2] ), .A1N(n924), 
        .Y(n285) );
  OAI2BB2XL U1041 ( .B0(n982), .B1(n924), .A0N(\pattern[6][3] ), .A1N(n924), 
        .Y(n286) );
  OAI2BB2XL U1042 ( .B0(n980), .B1(n924), .A0N(\pattern[6][4] ), .A1N(n924), 
        .Y(n287) );
  OAI2BB2XL U1043 ( .B0(n978), .B1(n924), .A0N(\pattern[6][5] ), .A1N(n924), 
        .Y(n288) );
  OAI2BB2XL U1044 ( .B0(n976), .B1(n924), .A0N(\pattern[6][6] ), .A1N(n924), 
        .Y(n289) );
  OAI2BB2XL U1045 ( .B0(n974), .B1(n924), .A0N(\pattern[6][7] ), .A1N(n924), 
        .Y(n290) );
  OAI2BB2XL U1046 ( .B0(n988), .B1(n923), .A0N(\pattern[5][0] ), .A1N(n923), 
        .Y(n291) );
  OAI2BB2XL U1047 ( .B0(n986), .B1(n923), .A0N(\pattern[5][1] ), .A1N(n923), 
        .Y(n292) );
  OAI2BB2XL U1048 ( .B0(n984), .B1(n923), .A0N(\pattern[5][2] ), .A1N(n923), 
        .Y(n293) );
  OAI2BB2XL U1049 ( .B0(n982), .B1(n923), .A0N(\pattern[5][3] ), .A1N(n923), 
        .Y(n294) );
  OAI2BB2XL U1050 ( .B0(n980), .B1(n923), .A0N(\pattern[5][4] ), .A1N(n923), 
        .Y(n295) );
  OAI2BB2XL U1051 ( .B0(n978), .B1(n923), .A0N(\pattern[5][5] ), .A1N(n923), 
        .Y(n296) );
  OAI2BB2XL U1052 ( .B0(n976), .B1(n923), .A0N(\pattern[5][6] ), .A1N(n923), 
        .Y(n297) );
  OAI2BB2XL U1053 ( .B0(n974), .B1(n923), .A0N(\pattern[5][7] ), .A1N(n923), 
        .Y(n298) );
  OAI2BB2XL U1054 ( .B0(n989), .B1(n922), .A0N(\pattern[4][0] ), .A1N(n922), 
        .Y(n299) );
  OAI2BB2XL U1055 ( .B0(n987), .B1(n922), .A0N(\pattern[4][1] ), .A1N(n922), 
        .Y(n300) );
  OAI2BB2XL U1056 ( .B0(n985), .B1(n922), .A0N(\pattern[4][2] ), .A1N(n922), 
        .Y(n301) );
  OAI2BB2XL U1057 ( .B0(n983), .B1(n922), .A0N(\pattern[4][3] ), .A1N(n922), 
        .Y(n302) );
  OAI2BB2XL U1058 ( .B0(n981), .B1(n922), .A0N(\pattern[4][4] ), .A1N(n922), 
        .Y(n303) );
  OAI2BB2XL U1059 ( .B0(n979), .B1(n922), .A0N(\pattern[4][5] ), .A1N(n922), 
        .Y(n304) );
  OAI2BB2XL U1060 ( .B0(n977), .B1(n922), .A0N(\pattern[4][6] ), .A1N(n922), 
        .Y(n305) );
  OAI2BB2XL U1061 ( .B0(n975), .B1(n922), .A0N(\pattern[4][7] ), .A1N(n922), 
        .Y(n306) );
  OAI2BB2XL U1062 ( .B0(n989), .B1(n921), .A0N(\pattern[3][0] ), .A1N(n921), 
        .Y(n307) );
  OAI2BB2XL U1063 ( .B0(n987), .B1(n921), .A0N(\pattern[3][1] ), .A1N(n921), 
        .Y(n308) );
  OAI2BB2XL U1064 ( .B0(n985), .B1(n921), .A0N(\pattern[3][2] ), .A1N(n921), 
        .Y(n309) );
  OAI2BB2XL U1065 ( .B0(n983), .B1(n921), .A0N(\pattern[3][3] ), .A1N(n921), 
        .Y(n310) );
  OAI2BB2XL U1066 ( .B0(n981), .B1(n921), .A0N(\pattern[3][4] ), .A1N(n921), 
        .Y(n311) );
  OAI2BB2XL U1067 ( .B0(n979), .B1(n921), .A0N(\pattern[3][5] ), .A1N(n921), 
        .Y(n312) );
  OAI2BB2XL U1068 ( .B0(n977), .B1(n921), .A0N(\pattern[3][6] ), .A1N(n921), 
        .Y(n313) );
  OAI2BB2XL U1069 ( .B0(n975), .B1(n921), .A0N(\pattern[3][7] ), .A1N(n921), 
        .Y(n314) );
  OAI2BB2XL U1070 ( .B0(n989), .B1(n920), .A0N(\pattern[2][0] ), .A1N(n920), 
        .Y(n315) );
  OAI2BB2XL U1071 ( .B0(n987), .B1(n920), .A0N(\pattern[2][1] ), .A1N(n920), 
        .Y(n316) );
  OAI2BB2XL U1072 ( .B0(n985), .B1(n920), .A0N(\pattern[2][2] ), .A1N(n920), 
        .Y(n317) );
  OAI2BB2XL U1073 ( .B0(n983), .B1(n920), .A0N(\pattern[2][3] ), .A1N(n920), 
        .Y(n318) );
  OAI2BB2XL U1074 ( .B0(n981), .B1(n920), .A0N(\pattern[2][4] ), .A1N(n920), 
        .Y(n319) );
  OAI2BB2XL U1075 ( .B0(n979), .B1(n920), .A0N(\pattern[2][5] ), .A1N(n920), 
        .Y(n320) );
  OAI2BB2XL U1076 ( .B0(n977), .B1(n920), .A0N(\pattern[2][6] ), .A1N(n920), 
        .Y(n321) );
  OAI2BB2XL U1077 ( .B0(n975), .B1(n920), .A0N(\pattern[2][7] ), .A1N(n920), 
        .Y(n322) );
  OAI2BB2XL U1078 ( .B0(n989), .B1(n919), .A0N(\pattern[1][0] ), .A1N(n919), 
        .Y(n323) );
  OAI2BB2XL U1079 ( .B0(n987), .B1(n919), .A0N(\pattern[1][1] ), .A1N(n919), 
        .Y(n324) );
  OAI2BB2XL U1080 ( .B0(n985), .B1(n919), .A0N(\pattern[1][2] ), .A1N(n919), 
        .Y(n325) );
  OAI2BB2XL U1081 ( .B0(n983), .B1(n919), .A0N(\pattern[1][3] ), .A1N(n919), 
        .Y(n326) );
  OAI2BB2XL U1082 ( .B0(n981), .B1(n919), .A0N(\pattern[1][4] ), .A1N(n919), 
        .Y(n327) );
  OAI2BB2XL U1083 ( .B0(n979), .B1(n919), .A0N(\pattern[1][5] ), .A1N(n919), 
        .Y(n328) );
  OAI2BB2XL U1084 ( .B0(n977), .B1(n919), .A0N(\pattern[1][6] ), .A1N(n919), 
        .Y(n329) );
  OAI2BB2XL U1085 ( .B0(n975), .B1(n919), .A0N(\pattern[1][7] ), .A1N(n919), 
        .Y(n330) );
  OAI2BB2XL U1086 ( .B0(n989), .B1(n918), .A0N(\pattern[0][0] ), .A1N(n918), 
        .Y(n331) );
  OAI2BB2XL U1087 ( .B0(n987), .B1(n918), .A0N(\pattern[0][1] ), .A1N(n918), 
        .Y(n332) );
  OAI2BB2XL U1088 ( .B0(n985), .B1(n918), .A0N(\pattern[0][2] ), .A1N(n918), 
        .Y(n333) );
  OAI2BB2XL U1089 ( .B0(n983), .B1(n918), .A0N(\pattern[0][3] ), .A1N(n918), 
        .Y(n334) );
  OAI2BB2XL U1090 ( .B0(n981), .B1(n918), .A0N(\pattern[0][4] ), .A1N(n918), 
        .Y(n335) );
  OAI2BB2XL U1091 ( .B0(n979), .B1(n918), .A0N(\pattern[0][5] ), .A1N(n918), 
        .Y(n336) );
  OAI2BB2XL U1092 ( .B0(n977), .B1(n918), .A0N(\pattern[0][6] ), .A1N(n918), 
        .Y(n337) );
  OAI2BB2XL U1093 ( .B0(n975), .B1(n918), .A0N(\pattern[0][7] ), .A1N(n918), 
        .Y(n338) );
  OAI2BB2XL U1094 ( .B0(n1006), .B1(n893), .A0N(\string[7][0] ), .A1N(n893), 
        .Y(n532) );
  OAI2BB2XL U1095 ( .B0(n1005), .B1(n893), .A0N(\string[7][1] ), .A1N(n893), 
        .Y(n533) );
  OAI2BB2XL U1096 ( .B0(n1004), .B1(n893), .A0N(\string[7][2] ), .A1N(n893), 
        .Y(n534) );
  OAI2BB2XL U1097 ( .B0(n1003), .B1(n893), .A0N(\string[7][3] ), .A1N(n893), 
        .Y(n535) );
  OAI2BB2XL U1098 ( .B0(n1002), .B1(n893), .A0N(\string[7][4] ), .A1N(n893), 
        .Y(n536) );
  OAI2BB2XL U1099 ( .B0(n1001), .B1(n893), .A0N(\string[7][5] ), .A1N(n893), 
        .Y(n537) );
  OAI2BB2XL U1100 ( .B0(n1000), .B1(n893), .A0N(\string[7][6] ), .A1N(n893), 
        .Y(n538) );
  OAI2BB2XL U1101 ( .B0(n999), .B1(n893), .A0N(\string[7][7] ), .A1N(n893), 
        .Y(n539) );
  OAI2BB2XL U1102 ( .B0(n1006), .B1(n892), .A0N(\string[6][0] ), .A1N(n892), 
        .Y(n540) );
  OAI2BB2XL U1103 ( .B0(n1005), .B1(n892), .A0N(\string[6][1] ), .A1N(n892), 
        .Y(n541) );
  OAI2BB2XL U1104 ( .B0(n1004), .B1(n892), .A0N(\string[6][2] ), .A1N(n892), 
        .Y(n542) );
  OAI2BB2XL U1105 ( .B0(n1003), .B1(n892), .A0N(\string[6][3] ), .A1N(n892), 
        .Y(n543) );
  OAI2BB2XL U1106 ( .B0(n1002), .B1(n892), .A0N(\string[6][4] ), .A1N(n892), 
        .Y(n544) );
  OAI2BB2XL U1107 ( .B0(n1001), .B1(n892), .A0N(\string[6][5] ), .A1N(n892), 
        .Y(n545) );
  OAI2BB2XL U1108 ( .B0(n1000), .B1(n892), .A0N(\string[6][6] ), .A1N(n892), 
        .Y(n546) );
  OAI2BB2XL U1109 ( .B0(n999), .B1(n892), .A0N(\string[6][7] ), .A1N(n892), 
        .Y(n547) );
  OAI2BB2XL U1110 ( .B0(n1006), .B1(n891), .A0N(\string[5][0] ), .A1N(n891), 
        .Y(n548) );
  OAI2BB2XL U1111 ( .B0(n1005), .B1(n891), .A0N(\string[5][1] ), .A1N(n891), 
        .Y(n549) );
  OAI2BB2XL U1112 ( .B0(n1004), .B1(n891), .A0N(\string[5][2] ), .A1N(n891), 
        .Y(n550) );
  OAI2BB2XL U1113 ( .B0(n1003), .B1(n891), .A0N(\string[5][3] ), .A1N(n891), 
        .Y(n551) );
  OAI2BB2XL U1114 ( .B0(n1002), .B1(n891), .A0N(\string[5][4] ), .A1N(n891), 
        .Y(n552) );
  OAI2BB2XL U1115 ( .B0(n1001), .B1(n891), .A0N(\string[5][5] ), .A1N(n891), 
        .Y(n553) );
  OAI2BB2XL U1116 ( .B0(n1000), .B1(n891), .A0N(\string[5][6] ), .A1N(n891), 
        .Y(n554) );
  OAI2BB2XL U1117 ( .B0(n999), .B1(n891), .A0N(\string[5][7] ), .A1N(n891), 
        .Y(n555) );
  OAI2BB2XL U1118 ( .B0(n1006), .B1(n890), .A0N(\string[4][0] ), .A1N(n890), 
        .Y(n556) );
  OAI2BB2XL U1119 ( .B0(n1005), .B1(n890), .A0N(\string[4][1] ), .A1N(n890), 
        .Y(n557) );
  OAI2BB2XL U1120 ( .B0(n1004), .B1(n890), .A0N(\string[4][2] ), .A1N(n890), 
        .Y(n558) );
  OAI2BB2XL U1121 ( .B0(n1003), .B1(n890), .A0N(\string[4][3] ), .A1N(n890), 
        .Y(n559) );
  OAI2BB2XL U1122 ( .B0(n1002), .B1(n890), .A0N(\string[4][4] ), .A1N(n890), 
        .Y(n560) );
  OAI2BB2XL U1123 ( .B0(n1001), .B1(n890), .A0N(\string[4][5] ), .A1N(n890), 
        .Y(n561) );
  OAI2BB2XL U1124 ( .B0(n1000), .B1(n890), .A0N(\string[4][6] ), .A1N(n890), 
        .Y(n562) );
  OAI2BB2XL U1125 ( .B0(n999), .B1(n890), .A0N(\string[4][7] ), .A1N(n890), 
        .Y(n563) );
  OAI2BB2XL U1126 ( .B0(n1006), .B1(n889), .A0N(\string[3][0] ), .A1N(n889), 
        .Y(n564) );
  OAI2BB2XL U1127 ( .B0(n1005), .B1(n889), .A0N(\string[3][1] ), .A1N(n889), 
        .Y(n565) );
  OAI2BB2XL U1128 ( .B0(n1004), .B1(n889), .A0N(\string[3][2] ), .A1N(n889), 
        .Y(n566) );
  OAI2BB2XL U1129 ( .B0(n1003), .B1(n889), .A0N(\string[3][3] ), .A1N(n889), 
        .Y(n567) );
  OAI2BB2XL U1130 ( .B0(n1002), .B1(n889), .A0N(\string[3][4] ), .A1N(n889), 
        .Y(n568) );
  OAI2BB2XL U1131 ( .B0(n1001), .B1(n889), .A0N(\string[3][5] ), .A1N(n889), 
        .Y(n569) );
  OAI2BB2XL U1132 ( .B0(n1000), .B1(n889), .A0N(\string[3][6] ), .A1N(n889), 
        .Y(n570) );
  OAI2BB2XL U1133 ( .B0(n999), .B1(n889), .A0N(\string[3][7] ), .A1N(n889), 
        .Y(n571) );
  OAI2BB2XL U1134 ( .B0(n988), .B1(n888), .A0N(\string[2][0] ), .A1N(n888), 
        .Y(n572) );
  OAI2BB2XL U1135 ( .B0(n986), .B1(n888), .A0N(\string[2][1] ), .A1N(n888), 
        .Y(n573) );
  OAI2BB2XL U1136 ( .B0(n984), .B1(n888), .A0N(\string[2][2] ), .A1N(n888), 
        .Y(n574) );
  OAI2BB2XL U1137 ( .B0(n982), .B1(n888), .A0N(\string[2][3] ), .A1N(n888), 
        .Y(n575) );
  OAI2BB2XL U1138 ( .B0(n980), .B1(n888), .A0N(\string[2][4] ), .A1N(n888), 
        .Y(n576) );
  OAI2BB2XL U1139 ( .B0(n978), .B1(n888), .A0N(\string[2][5] ), .A1N(n888), 
        .Y(n577) );
  OAI2BB2XL U1140 ( .B0(n976), .B1(n888), .A0N(\string[2][6] ), .A1N(n888), 
        .Y(n578) );
  OAI2BB2XL U1141 ( .B0(n974), .B1(n888), .A0N(\string[2][7] ), .A1N(n888), 
        .Y(n579) );
  OAI2BB2XL U1142 ( .B0(n989), .B1(n887), .A0N(\string[1][0] ), .A1N(n887), 
        .Y(n580) );
  OAI2BB2XL U1143 ( .B0(n987), .B1(n887), .A0N(\string[1][1] ), .A1N(n887), 
        .Y(n581) );
  OAI2BB2XL U1144 ( .B0(n985), .B1(n887), .A0N(\string[1][2] ), .A1N(n887), 
        .Y(n582) );
  OAI2BB2XL U1145 ( .B0(n983), .B1(n887), .A0N(\string[1][3] ), .A1N(n887), 
        .Y(n583) );
  OAI2BB2XL U1146 ( .B0(n981), .B1(n887), .A0N(\string[1][4] ), .A1N(n887), 
        .Y(n584) );
  OAI2BB2XL U1147 ( .B0(n979), .B1(n887), .A0N(\string[1][5] ), .A1N(n887), 
        .Y(n585) );
  OAI2BB2XL U1148 ( .B0(n977), .B1(n887), .A0N(\string[1][6] ), .A1N(n887), 
        .Y(n586) );
  OAI2BB2XL U1149 ( .B0(n975), .B1(n887), .A0N(\string[1][7] ), .A1N(n887), 
        .Y(n587) );
  OAI2BB2XL U1150 ( .B0(n988), .B1(n886), .A0N(\string[0][0] ), .A1N(n886), 
        .Y(n588) );
  OAI2BB2XL U1151 ( .B0(n986), .B1(n886), .A0N(\string[0][1] ), .A1N(n886), 
        .Y(n589) );
  OAI2BB2XL U1152 ( .B0(n984), .B1(n886), .A0N(\string[0][2] ), .A1N(n886), 
        .Y(n590) );
  OAI2BB2XL U1153 ( .B0(n982), .B1(n886), .A0N(\string[0][3] ), .A1N(n886), 
        .Y(n591) );
  OAI2BB2XL U1154 ( .B0(n980), .B1(n886), .A0N(\string[0][4] ), .A1N(n886), 
        .Y(n592) );
  OAI2BB2XL U1155 ( .B0(n978), .B1(n886), .A0N(\string[0][5] ), .A1N(n886), 
        .Y(n593) );
  OAI2BB2XL U1156 ( .B0(n976), .B1(n886), .A0N(\string[0][6] ), .A1N(n886), 
        .Y(n594) );
  OAI2BB2XL U1157 ( .B0(n974), .B1(n886), .A0N(\string[0][7] ), .A1N(n886), 
        .Y(n595) );
  OAI21XL U1158 ( .A0(n218), .A1(n74), .B0(n219), .Y(n621) );
  AOI2BB1X1 U1159 ( .A0N(pat_len[2]), .A1N(n885), .B0(n215), .Y(n218) );
  NAND4X1 U1160 ( .A(n214), .B(n927), .C(pat_len[2]), .D(n74), .Y(n219) );
  NAND3X1 U1161 ( .A(n120), .B(n77), .C(n927), .Y(n121) );
  NAND3X1 U1162 ( .A(n120), .B(n76), .C(n928), .Y(n122) );
  NAND3X1 U1163 ( .A(n77), .B(n76), .C(n120), .Y(n123) );
  NAND3X1 U1164 ( .A(n77), .B(n76), .C(n126), .Y(n129) );
  NAND3X1 U1165 ( .A(n927), .B(n77), .C(n126), .Y(n127) );
  CLKINVX1 U1166 ( .A(n213), .Y(n1007) );
  AOI32X1 U1167 ( .A0(n214), .A1(n75), .A2(n927), .B0(n215), .B1(pat_len[2]), 
        .Y(n213) );
  OAI32X1 U1168 ( .A0(n885), .A1(isstring), .A2(ispattern), .B0(n1012), .B1(
        n117), .Y(nxt_state[0]) );
  CLKINVX1 U1169 ( .A(n118), .Y(n1012) );
  OA21XL U1170 ( .A0(asterisk_sym), .A1(n193), .B0(n229), .Y(n227) );
  AOI33X1 U1171 ( .A0(n230), .A1(n1025), .A2(n231), .B0(n1013), .B1(n232), 
        .B2(N208), .Y(n229) );
  NAND4X1 U1172 ( .A(n676), .B(n88), .C(n87), .D(n78), .Y(n232) );
  OAI221XL U1173 ( .A0(n71), .A1(n200), .B0(n1011), .B1(n104), .C0(n203), .Y(
        n613) );
  NAND2X1 U1174 ( .A(N213), .B(n202), .Y(n203) );
  OAI221XL U1175 ( .A0(n72), .A1(n200), .B0(n1011), .B1(n105), .C0(n201), .Y(
        n612) );
  NAND2X1 U1176 ( .A(N212), .B(n202), .Y(n201) );
  OAI221XL U1177 ( .A0(n70), .A1(n200), .B0(n1011), .B1(n866), .C0(n204), .Y(
        n614) );
  NAND2X1 U1178 ( .A(N214), .B(n202), .Y(n204) );
  OAI221XL U1179 ( .A0(n69), .A1(n200), .B0(n1011), .B1(n867), .C0(n205), .Y(
        n615) );
  NAND2X1 U1180 ( .A(N215), .B(n202), .Y(n205) );
  OAI221XL U1181 ( .A0(n60), .A1(n200), .B0(n1011), .B1(n100), .C0(n225), .Y(
        n624) );
  NAND2X1 U1182 ( .A(N216), .B(n202), .Y(n225) );
  OAI221XL U1183 ( .A0(n73), .A1(n200), .B0(n1011), .B1(N211), .C0(n226), .Y(
        n625) );
  NAND2X1 U1184 ( .A(N211), .B(n202), .Y(n226) );
  CLKINVX1 U1185 ( .A(N38), .Y(n675) );
  CLKBUFX3 U1186 ( .A(n668), .Y(n679) );
  NOR2X1 U1187 ( .A(n675), .B(N39), .Y(n668) );
  AOI31X1 U1188 ( .A0(n1013), .A1(n94), .A2(n1018), .B0(n1020), .Y(n189) );
  NAND4X1 U1189 ( .A(n236), .B(n237), .C(n238), .D(n239), .Y(n235) );
  XOR2X1 U1190 ( .A(N211), .B(N55), .Y(n237) );
  XOR2X1 U1191 ( .A(n104), .B(N57), .Y(n238) );
  OAI222XL U1192 ( .A0(n93), .A1(n206), .B0(N37), .B1(n1014), .C0(nxt_state[1]), .C1(n676), .Y(n616) );
  OAI222XL U1193 ( .A0(n92), .A1(n206), .B0(n1014), .B1(n207), .C0(n1016), 
        .C1(n88), .Y(n617) );
  NAND2X1 U1194 ( .A(N37), .B(n88), .Y(n207) );
  NAND2X1 U1195 ( .A(n190), .B(n191), .Y(n188) );
  NOR4X1 U1196 ( .A(n98), .B(n97), .C(n96), .D(n95), .Y(n190) );
  NOR4X1 U1197 ( .A(n1017), .B(n1013), .C(n117), .D(n99), .Y(n191) );
  OAI221XL U1198 ( .A0(n867), .A1(n188), .B0(n1010), .B1(n95), .C0(n189), .Y(
        n600) );
  OAI221XL U1199 ( .A0(N211), .A1(n188), .B0(n1010), .B1(n99), .C0(n189), .Y(
        n599) );
  OAI221XL U1200 ( .A0(n105), .A1(n188), .B0(n1010), .B1(n98), .C0(n189), .Y(
        n598) );
  OAI221XL U1201 ( .A0(n104), .A1(n188), .B0(n1010), .B1(n97), .C0(n189), .Y(
        n597) );
  OAI221XL U1202 ( .A0(n866), .A1(n188), .B0(n1010), .B1(n96), .C0(n189), .Y(
        n596) );
  OAI221XL U1203 ( .A0(n1015), .A1(n87), .B0(n91), .B1(n206), .C0(n208), .Y(
        n618) );
  NAND4X1 U1204 ( .A(n209), .B(N37), .C(N38), .D(n87), .Y(n208) );
  CLKINVX1 U1205 ( .A(n210), .Y(n1015) );
  OAI31XL U1206 ( .A0(n117), .A1(N38), .A2(n211), .B0(n1016), .Y(n210) );
  NAND2X1 U1207 ( .A(n223), .B(n224), .Y(n211) );
  OAI21XL U1208 ( .A0(\cur_pat[3] ), .A1(n221), .B0(n94), .Y(n223) );
  NAND3X1 U1209 ( .A(n1013), .B(n1018), .C(asterisk_sym), .Y(n206) );
  CLKINVX1 U1210 ( .A(N39), .Y(n674) );
  OAI21XL U1211 ( .A0(n90), .A1(n206), .B0(n220), .Y(n623) );
  AOI32X1 U1212 ( .A0(n209), .A1(n78), .A2(n221), .B0(\cur_pat[3] ), .B1(n222), 
        .Y(n220) );
  OAI21XL U1213 ( .A0(n221), .A1(n1014), .B0(nxt_state[1]), .Y(n222) );
  CLKINVX1 U1214 ( .A(n212), .Y(n1016) );
  OAI31XL U1215 ( .A0(n211), .A1(N37), .A2(n117), .B0(nxt_state[1]), .Y(n212)
         );
  CLKINVX1 U1216 ( .A(N40), .Y(n868) );
  CLKINVX1 U1217 ( .A(N42), .Y(n865) );
  CLKBUFX3 U1218 ( .A(n671), .Y(n677) );
  NOR2X1 U1219 ( .A(n674), .B(N38), .Y(n671) );
  CLKBUFX3 U1220 ( .A(n667), .Y(n680) );
  NOR2X1 U1221 ( .A(N38), .B(N39), .Y(n667) );
  OA22X1 U1222 ( .A0(n676), .A1(n657), .B0(N37), .B1(n656), .Y(n636) );
  OA22X1 U1223 ( .A0(n676), .A1(n665), .B0(N37), .B1(n664), .Y(n637) );
  NOR4X1 U1224 ( .A(N61), .B(n240), .C(n241), .D(n242), .Y(n239) );
  XOR2X1 U1225 ( .A(N41), .B(N56), .Y(n241) );
  XOR2X1 U1226 ( .A(N44), .B(N59), .Y(n242) );
  XOR2X1 U1227 ( .A(\cur_str[5] ), .B(N60), .Y(n240) );
  OAI22XL U1228 ( .A0(n87), .A1(n1019), .B0(n192), .B1(n91), .Y(n603) );
  OAI22XL U1229 ( .A0(n88), .A1(n1019), .B0(n192), .B1(n92), .Y(n604) );
  OAI22XL U1230 ( .A0(n676), .A1(n1019), .B0(n192), .B1(n93), .Y(n605) );
  OAI22XL U1231 ( .A0(n78), .A1(n1019), .B0(n192), .B1(n90), .Y(n602) );
  OAI2BB1XL U1232 ( .A0N(n1033), .A1N(n131), .B0(n132), .Y(n339) );
  OAI21XL U1233 ( .A0(n133), .A1(n134), .B0(n1021), .Y(n132) );
  NOR4X1 U1234 ( .A(n135), .B(n136), .C(n137), .D(n138), .Y(n134) );
  NOR4X1 U1235 ( .A(n139), .B(n140), .C(n1022), .D(n141), .Y(n133) );
  OAI21XL U1236 ( .A0(n1021), .A1(n94), .B0(n1019), .Y(n601) );
  CLKBUFX3 U1237 ( .A(str_len[0]), .Y(n926) );
  NOR2X1 U1238 ( .A(N67), .B(n247), .Y(n245) );
  XOR2X1 U1239 ( .A(\cur_pat[3] ), .B(N66), .Y(n247) );
  NAND4X1 U1240 ( .A(n243), .B(n244), .C(n245), .D(n246), .Y(n141) );
  XOR2X1 U1241 ( .A(n676), .B(N63), .Y(n243) );
  XOR2X1 U1242 ( .A(n88), .B(N64), .Y(n244) );
  XOR2X1 U1243 ( .A(n87), .B(N65), .Y(n246) );
  CLKBUFX3 U1244 ( .A(pat_len[1]), .Y(n927) );
  CLKBUFX3 U1245 ( .A(pat_len[0]), .Y(n928) );
  XOR2X1 U1246 ( .A(str_len[3]), .B(N43), .Y(n271) );
  XOR2X1 U1247 ( .A(n926), .B(N40), .Y(n270) );
  XOR2X1 U1248 ( .A(str_len[2]), .B(N42), .Y(n269) );
  XOR2X1 U1249 ( .A(n866), .B(N58), .Y(n236) );
  AND4X1 U1250 ( .A(n105), .B(n104), .C(N211), .D(n262), .Y(n231) );
  NOR3X1 U1251 ( .A(N43), .B(\cur_str[5] ), .C(N44), .Y(n262) );
  NAND3X1 U1252 ( .A(n272), .B(n273), .C(n274), .Y(n268) );
  XOR2X1 U1253 ( .A(n100), .B(str_len[5]), .Y(n273) );
  XOR2X1 U1254 ( .A(n867), .B(str_len[4]), .Y(n272) );
  XOR2X1 U1255 ( .A(n105), .B(str_len[1]), .Y(n274) );
  NAND2X1 U1256 ( .A(cur_state[0]), .B(cur_state[1]), .Y(n199) );
  NOR2X1 U1257 ( .A(n59), .B(cur_state[1]), .Y(n197) );
  NOR2X1 U1258 ( .A(str_len[3]), .B(str_len[4]), .Y(n187) );
  OAI2BB1XL U1259 ( .A0N(n1032), .A1N(n131), .B0(n199), .Y(n622) );
  CLKBUFX3 U1260 ( .A(n116), .Y(n885) );
  NAND2X1 U1261 ( .A(n59), .B(n51), .Y(n116) );
  ADDHXL U1262 ( .A(str_len[1]), .B(n926), .CO(\add_113/carry [2]), .S(N116)
         );
  ADDHXL U1263 ( .A(str_len[2]), .B(\add_113/carry [2]), .CO(
        \add_113/carry [3]), .S(N117) );
  ADDHXL U1264 ( .A(N43), .B(\add_155/carry [3]), .CO(\add_155/carry [4]), .S(
        N214) );
  ADDHXL U1265 ( .A(N41), .B(N40), .CO(\add_155/carry [2]), .S(N212) );
  ADDHXL U1266 ( .A(str_len[3]), .B(\add_113/carry [3]), .CO(
        \add_113/carry [4]), .S(N118) );
  ADDHXL U1267 ( .A(N42), .B(\add_155/carry [2]), .CO(\add_155/carry [3]), .S(
        N213) );
  ADDHXL U1268 ( .A(N44), .B(\add_155/carry [4]), .CO(\add_155/carry [5]), .S(
        N215) );
  ADDHXL U1269 ( .A(str_len[4]), .B(\add_113/carry [4]), .CO(
        \add_113/carry [5]), .S(N119) );
  XOR2X1 U1270 ( .A(n928), .B(N37), .Y(n138) );
  XOR2X1 U1271 ( .A(n927), .B(N38), .Y(n137) );
  XOR2X1 U1272 ( .A(pat_len[2]), .B(N39), .Y(n136) );
  XOR2X1 U1273 ( .A(pat_len[3]), .B(\cur_pat[3] ), .Y(n135) );
  AO22X1 U1274 ( .A0(\pattern[3][0] ), .A1(n679), .B0(\pattern[1][0] ), .B1(
        n680), .Y(n638) );
  AOI221XL U1275 ( .A0(\pattern[5][0] ), .A1(n677), .B0(\pattern[7][0] ), .B1(
        n678), .C0(n638), .Y(n641) );
  AO22X1 U1276 ( .A0(\pattern[2][0] ), .A1(n679), .B0(\pattern[0][0] ), .B1(
        n680), .Y(n639) );
  AOI221XL U1277 ( .A0(\pattern[4][0] ), .A1(n677), .B0(\pattern[6][0] ), .B1(
        n678), .C0(n639), .Y(n640) );
  OAI22XL U1278 ( .A0(n676), .A1(n641), .B0(N37), .B1(n640), .Y(N330) );
  AO22X1 U1279 ( .A0(\pattern[3][1] ), .A1(n679), .B0(\pattern[1][1] ), .B1(
        n680), .Y(n642) );
  AOI221XL U1280 ( .A0(\pattern[5][1] ), .A1(n677), .B0(\pattern[7][1] ), .B1(
        n678), .C0(n642), .Y(n645) );
  AO22X1 U1281 ( .A0(\pattern[2][1] ), .A1(n679), .B0(\pattern[0][1] ), .B1(
        n680), .Y(n643) );
  AOI221XL U1282 ( .A0(\pattern[4][1] ), .A1(n677), .B0(\pattern[6][1] ), .B1(
        n678), .C0(n643), .Y(n644) );
  OAI22XL U1283 ( .A0(n676), .A1(n645), .B0(N37), .B1(n644), .Y(N329) );
  AO22X1 U1284 ( .A0(\pattern[3][2] ), .A1(n679), .B0(\pattern[1][2] ), .B1(
        n680), .Y(n646) );
  AOI221XL U1285 ( .A0(\pattern[5][2] ), .A1(n677), .B0(\pattern[7][2] ), .B1(
        n678), .C0(n646), .Y(n649) );
  AO22X1 U1286 ( .A0(\pattern[2][2] ), .A1(n679), .B0(\pattern[0][2] ), .B1(
        n680), .Y(n647) );
  AOI221XL U1287 ( .A0(\pattern[4][2] ), .A1(n677), .B0(\pattern[6][2] ), .B1(
        n678), .C0(n647), .Y(n648) );
  AO22X1 U1288 ( .A0(\pattern[3][3] ), .A1(n679), .B0(\pattern[1][3] ), .B1(
        n680), .Y(n650) );
  AOI221XL U1289 ( .A0(\pattern[5][3] ), .A1(n677), .B0(\pattern[7][3] ), .B1(
        n678), .C0(n650), .Y(n653) );
  AO22X1 U1290 ( .A0(\pattern[2][3] ), .A1(n679), .B0(\pattern[0][3] ), .B1(
        n680), .Y(n651) );
  AOI221XL U1291 ( .A0(\pattern[4][3] ), .A1(n677), .B0(\pattern[6][3] ), .B1(
        n678), .C0(n651), .Y(n652) );
  OAI22XL U1292 ( .A0(n676), .A1(n653), .B0(N37), .B1(n652), .Y(N327) );
  AO22X1 U1293 ( .A0(\pattern[3][4] ), .A1(n679), .B0(\pattern[1][4] ), .B1(
        n680), .Y(n654) );
  AOI221XL U1294 ( .A0(\pattern[5][4] ), .A1(n677), .B0(\pattern[7][4] ), .B1(
        n678), .C0(n654), .Y(n657) );
  AO22X1 U1295 ( .A0(\pattern[2][4] ), .A1(n679), .B0(\pattern[0][4] ), .B1(
        n680), .Y(n655) );
  AOI221XL U1296 ( .A0(\pattern[4][4] ), .A1(n677), .B0(\pattern[6][4] ), .B1(
        n678), .C0(n655), .Y(n656) );
  AO22X1 U1297 ( .A0(\pattern[3][5] ), .A1(n679), .B0(\pattern[1][5] ), .B1(
        n680), .Y(n658) );
  AOI221XL U1298 ( .A0(\pattern[5][5] ), .A1(n677), .B0(\pattern[7][5] ), .B1(
        n678), .C0(n658), .Y(n661) );
  AO22X1 U1299 ( .A0(\pattern[2][5] ), .A1(n679), .B0(\pattern[0][5] ), .B1(
        n680), .Y(n659) );
  AOI221XL U1300 ( .A0(\pattern[4][5] ), .A1(n677), .B0(\pattern[6][5] ), .B1(
        n678), .C0(n659), .Y(n660) );
  AO22X1 U1301 ( .A0(\pattern[3][6] ), .A1(n679), .B0(\pattern[1][6] ), .B1(
        n680), .Y(n662) );
  AOI221XL U1302 ( .A0(\pattern[5][6] ), .A1(n677), .B0(\pattern[7][6] ), .B1(
        n678), .C0(n662), .Y(n665) );
  AO22X1 U1303 ( .A0(\pattern[2][6] ), .A1(n679), .B0(\pattern[0][6] ), .B1(
        n680), .Y(n663) );
  AOI221XL U1304 ( .A0(\pattern[4][6] ), .A1(n677), .B0(\pattern[6][6] ), .B1(
        n678), .C0(n663), .Y(n664) );
  AO22X1 U1305 ( .A0(\pattern[3][7] ), .A1(n679), .B0(\pattern[1][7] ), .B1(
        n680), .Y(n666) );
  AOI221XL U1306 ( .A0(\pattern[5][7] ), .A1(n677), .B0(\pattern[7][7] ), .B1(
        n678), .C0(n666), .Y(n673) );
  AO22X1 U1307 ( .A0(\pattern[2][7] ), .A1(n679), .B0(\pattern[0][7] ), .B1(
        n680), .Y(n669) );
  AOI221XL U1308 ( .A0(\pattern[4][7] ), .A1(n677), .B0(\pattern[6][7] ), .B1(
        n678), .C0(n669), .Y(n672) );
  OAI22XL U1309 ( .A0(n673), .A1(n676), .B0(N37), .B1(n672), .Y(N323) );
  NOR2X1 U1310 ( .A(n866), .B(N42), .Y(n681) );
  NOR2X1 U1311 ( .A(n868), .B(N41), .Y(n688) );
  NOR2X1 U1312 ( .A(N40), .B(N41), .Y(n689) );
  OAI22XL U1313 ( .A0(\string[9][0] ), .A1(n869), .B0(\string[8][0] ), .B1(
        n870), .Y(n686) );
  AND2X1 U1314 ( .A(N41), .B(N40), .Y(n690) );
  AND2X1 U1315 ( .A(N41), .B(n868), .Y(n691) );
  OAI22XL U1316 ( .A0(\string[11][0] ), .A1(n871), .B0(\string[10][0] ), .B1(
        n872), .Y(n685) );
  NOR2X1 U1317 ( .A(n866), .B(n865), .Y(n682) );
  OAI22XL U1318 ( .A0(\string[13][0] ), .A1(n873), .B0(\string[12][0] ), .B1(
        n874), .Y(n684) );
  OAI22XL U1319 ( .A0(\string[15][0] ), .A1(n875), .B0(\string[14][0] ), .B1(
        n876), .Y(n683) );
  NOR4X1 U1320 ( .A(n686), .B(n685), .C(n684), .D(n683), .Y(n708) );
  NOR2X1 U1321 ( .A(N42), .B(N43), .Y(n687) );
  OAI221XL U1322 ( .A0(\string[0][0] ), .A1(n877), .B0(\string[1][0] ), .B1(
        n878), .C0(n867), .Y(n696) );
  OAI22XL U1323 ( .A0(\string[3][0] ), .A1(n879), .B0(\string[2][0] ), .B1(
        n880), .Y(n695) );
  NOR2X1 U1324 ( .A(n865), .B(N43), .Y(n692) );
  OAI22XL U1325 ( .A0(\string[5][0] ), .A1(n881), .B0(\string[4][0] ), .B1(
        n882), .Y(n694) );
  OAI22XL U1326 ( .A0(\string[7][0] ), .A1(n883), .B0(\string[6][0] ), .B1(
        n884), .Y(n693) );
  NOR4X1 U1327 ( .A(n696), .B(n695), .C(n694), .D(n693), .Y(n707) );
  OAI22XL U1328 ( .A0(\string[25][0] ), .A1(n869), .B0(\string[24][0] ), .B1(
        n870), .Y(n700) );
  OAI22XL U1329 ( .A0(\string[27][0] ), .A1(n871), .B0(\string[26][0] ), .B1(
        n872), .Y(n699) );
  OAI22XL U1330 ( .A0(\string[29][0] ), .A1(n873), .B0(\string[28][0] ), .B1(
        n874), .Y(n698) );
  OAI22XL U1331 ( .A0(\string[31][0] ), .A1(n875), .B0(\string[30][0] ), .B1(
        n876), .Y(n697) );
  NOR4X1 U1332 ( .A(n700), .B(n699), .C(n698), .D(n697), .Y(n706) );
  OAI221XL U1333 ( .A0(\string[16][0] ), .A1(n877), .B0(\string[17][0] ), .B1(
        n878), .C0(N44), .Y(n704) );
  OAI22XL U1334 ( .A0(\string[19][0] ), .A1(n879), .B0(\string[18][0] ), .B1(
        n880), .Y(n703) );
  OAI22XL U1335 ( .A0(\string[21][0] ), .A1(n881), .B0(\string[20][0] ), .B1(
        n882), .Y(n702) );
  OAI22XL U1336 ( .A0(\string[23][0] ), .A1(n883), .B0(\string[22][0] ), .B1(
        n884), .Y(n701) );
  NOR4X1 U1337 ( .A(n704), .B(n703), .C(n702), .D(n701), .Y(n705) );
  AO22X1 U1338 ( .A0(n708), .A1(n707), .B0(n706), .B1(n705), .Y(N338) );
  OAI22XL U1339 ( .A0(\string[9][1] ), .A1(n869), .B0(\string[8][1] ), .B1(
        n870), .Y(n712) );
  OAI22XL U1340 ( .A0(\string[11][1] ), .A1(n871), .B0(\string[10][1] ), .B1(
        n872), .Y(n711) );
  OAI22XL U1341 ( .A0(\string[13][1] ), .A1(n873), .B0(\string[12][1] ), .B1(
        n874), .Y(n710) );
  OAI22XL U1342 ( .A0(\string[15][1] ), .A1(n875), .B0(\string[14][1] ), .B1(
        n876), .Y(n709) );
  NOR4X1 U1343 ( .A(n712), .B(n711), .C(n710), .D(n709), .Y(n728) );
  OAI221XL U1344 ( .A0(\string[0][1] ), .A1(n877), .B0(\string[1][1] ), .B1(
        n878), .C0(n867), .Y(n716) );
  OAI22XL U1345 ( .A0(\string[3][1] ), .A1(n879), .B0(\string[2][1] ), .B1(
        n880), .Y(n715) );
  OAI22XL U1346 ( .A0(\string[5][1] ), .A1(n881), .B0(\string[4][1] ), .B1(
        n882), .Y(n714) );
  OAI22XL U1347 ( .A0(\string[7][1] ), .A1(n883), .B0(\string[6][1] ), .B1(
        n884), .Y(n713) );
  NOR4X1 U1348 ( .A(n716), .B(n715), .C(n714), .D(n713), .Y(n727) );
  OAI22XL U1349 ( .A0(\string[25][1] ), .A1(n869), .B0(\string[24][1] ), .B1(
        n870), .Y(n720) );
  OAI22XL U1350 ( .A0(\string[27][1] ), .A1(n871), .B0(\string[26][1] ), .B1(
        n872), .Y(n719) );
  OAI22XL U1351 ( .A0(\string[29][1] ), .A1(n873), .B0(\string[28][1] ), .B1(
        n874), .Y(n718) );
  OAI22XL U1352 ( .A0(\string[31][1] ), .A1(n875), .B0(\string[30][1] ), .B1(
        n876), .Y(n717) );
  NOR4X1 U1353 ( .A(n720), .B(n719), .C(n718), .D(n717), .Y(n726) );
  OAI221XL U1354 ( .A0(\string[16][1] ), .A1(n877), .B0(\string[17][1] ), .B1(
        n878), .C0(N44), .Y(n724) );
  OAI22XL U1355 ( .A0(\string[19][1] ), .A1(n879), .B0(\string[18][1] ), .B1(
        n880), .Y(n723) );
  OAI22XL U1356 ( .A0(\string[21][1] ), .A1(n881), .B0(\string[20][1] ), .B1(
        n882), .Y(n722) );
  OAI22XL U1357 ( .A0(\string[23][1] ), .A1(n883), .B0(\string[22][1] ), .B1(
        n884), .Y(n721) );
  NOR4X1 U1358 ( .A(n724), .B(n723), .C(n722), .D(n721), .Y(n725) );
  AO22X1 U1359 ( .A0(n728), .A1(n727), .B0(n726), .B1(n725), .Y(N337) );
  OAI22XL U1360 ( .A0(\string[9][2] ), .A1(n869), .B0(\string[8][2] ), .B1(
        n870), .Y(n732) );
  OAI22XL U1361 ( .A0(\string[11][2] ), .A1(n871), .B0(\string[10][2] ), .B1(
        n872), .Y(n731) );
  OAI22XL U1362 ( .A0(\string[13][2] ), .A1(n873), .B0(\string[12][2] ), .B1(
        n874), .Y(n730) );
  OAI22XL U1363 ( .A0(\string[15][2] ), .A1(n875), .B0(\string[14][2] ), .B1(
        n876), .Y(n729) );
  NOR4X1 U1364 ( .A(n732), .B(n731), .C(n730), .D(n729), .Y(n748) );
  OAI221XL U1365 ( .A0(\string[0][2] ), .A1(n877), .B0(\string[1][2] ), .B1(
        n878), .C0(n867), .Y(n736) );
  OAI22XL U1366 ( .A0(\string[3][2] ), .A1(n879), .B0(\string[2][2] ), .B1(
        n880), .Y(n735) );
  OAI22XL U1367 ( .A0(\string[5][2] ), .A1(n881), .B0(\string[4][2] ), .B1(
        n882), .Y(n734) );
  OAI22XL U1368 ( .A0(\string[7][2] ), .A1(n883), .B0(\string[6][2] ), .B1(
        n884), .Y(n733) );
  NOR4X1 U1369 ( .A(n736), .B(n735), .C(n734), .D(n733), .Y(n747) );
  OAI22XL U1370 ( .A0(\string[25][2] ), .A1(n869), .B0(\string[24][2] ), .B1(
        n870), .Y(n740) );
  OAI22XL U1371 ( .A0(\string[27][2] ), .A1(n871), .B0(\string[26][2] ), .B1(
        n872), .Y(n739) );
  OAI22XL U1372 ( .A0(\string[29][2] ), .A1(n873), .B0(\string[28][2] ), .B1(
        n874), .Y(n738) );
  OAI22XL U1373 ( .A0(\string[31][2] ), .A1(n875), .B0(\string[30][2] ), .B1(
        n876), .Y(n737) );
  NOR4X1 U1374 ( .A(n740), .B(n739), .C(n738), .D(n737), .Y(n746) );
  OAI221XL U1375 ( .A0(\string[16][2] ), .A1(n877), .B0(\string[17][2] ), .B1(
        n878), .C0(N44), .Y(n744) );
  OAI22XL U1376 ( .A0(\string[19][2] ), .A1(n879), .B0(\string[18][2] ), .B1(
        n880), .Y(n743) );
  OAI22XL U1377 ( .A0(\string[21][2] ), .A1(n881), .B0(\string[20][2] ), .B1(
        n882), .Y(n742) );
  OAI22XL U1378 ( .A0(\string[23][2] ), .A1(n883), .B0(\string[22][2] ), .B1(
        n884), .Y(n741) );
  NOR4X1 U1379 ( .A(n744), .B(n743), .C(n742), .D(n741), .Y(n745) );
  AO22X1 U1380 ( .A0(n748), .A1(n747), .B0(n746), .B1(n745), .Y(N336) );
  OAI22XL U1381 ( .A0(\string[9][3] ), .A1(n869), .B0(\string[8][3] ), .B1(
        n870), .Y(n752) );
  OAI22XL U1382 ( .A0(\string[11][3] ), .A1(n871), .B0(\string[10][3] ), .B1(
        n872), .Y(n751) );
  OAI22XL U1383 ( .A0(\string[13][3] ), .A1(n873), .B0(\string[12][3] ), .B1(
        n874), .Y(n750) );
  OAI22XL U1384 ( .A0(\string[15][3] ), .A1(n875), .B0(\string[14][3] ), .B1(
        n876), .Y(n749) );
  NOR4X1 U1385 ( .A(n752), .B(n751), .C(n750), .D(n749), .Y(n768) );
  OAI221XL U1386 ( .A0(\string[0][3] ), .A1(n877), .B0(\string[1][3] ), .B1(
        n878), .C0(n867), .Y(n756) );
  OAI22XL U1387 ( .A0(\string[3][3] ), .A1(n879), .B0(\string[2][3] ), .B1(
        n880), .Y(n755) );
  OAI22XL U1388 ( .A0(\string[5][3] ), .A1(n881), .B0(\string[4][3] ), .B1(
        n882), .Y(n754) );
  OAI22XL U1389 ( .A0(\string[7][3] ), .A1(n883), .B0(\string[6][3] ), .B1(
        n884), .Y(n753) );
  NOR4X1 U1390 ( .A(n756), .B(n755), .C(n754), .D(n753), .Y(n767) );
  OAI22XL U1391 ( .A0(\string[25][3] ), .A1(n869), .B0(\string[24][3] ), .B1(
        n870), .Y(n760) );
  OAI22XL U1392 ( .A0(\string[27][3] ), .A1(n871), .B0(\string[26][3] ), .B1(
        n872), .Y(n759) );
  OAI22XL U1393 ( .A0(\string[29][3] ), .A1(n873), .B0(\string[28][3] ), .B1(
        n874), .Y(n758) );
  OAI22XL U1394 ( .A0(\string[31][3] ), .A1(n875), .B0(\string[30][3] ), .B1(
        n876), .Y(n757) );
  NOR4X1 U1395 ( .A(n760), .B(n759), .C(n758), .D(n757), .Y(n766) );
  OAI221XL U1396 ( .A0(\string[16][3] ), .A1(n877), .B0(\string[17][3] ), .B1(
        n878), .C0(N44), .Y(n764) );
  OAI22XL U1397 ( .A0(\string[19][3] ), .A1(n879), .B0(\string[18][3] ), .B1(
        n880), .Y(n763) );
  OAI22XL U1398 ( .A0(\string[21][3] ), .A1(n881), .B0(\string[20][3] ), .B1(
        n882), .Y(n762) );
  OAI22XL U1399 ( .A0(\string[23][3] ), .A1(n883), .B0(\string[22][3] ), .B1(
        n884), .Y(n761) );
  NOR4X1 U1400 ( .A(n764), .B(n763), .C(n762), .D(n761), .Y(n765) );
  AO22X1 U1401 ( .A0(n768), .A1(n767), .B0(n766), .B1(n765), .Y(N335) );
  OAI22XL U1402 ( .A0(\string[9][4] ), .A1(n869), .B0(\string[8][4] ), .B1(
        n870), .Y(n772) );
  OAI22XL U1403 ( .A0(\string[11][4] ), .A1(n871), .B0(\string[10][4] ), .B1(
        n872), .Y(n771) );
  OAI22XL U1404 ( .A0(\string[13][4] ), .A1(n873), .B0(\string[12][4] ), .B1(
        n874), .Y(n770) );
  OAI22XL U1405 ( .A0(\string[15][4] ), .A1(n875), .B0(\string[14][4] ), .B1(
        n876), .Y(n769) );
  NOR4X1 U1406 ( .A(n772), .B(n771), .C(n770), .D(n769), .Y(n788) );
  OAI221XL U1407 ( .A0(\string[0][4] ), .A1(n877), .B0(\string[1][4] ), .B1(
        n878), .C0(n867), .Y(n776) );
  OAI22XL U1408 ( .A0(\string[3][4] ), .A1(n879), .B0(\string[2][4] ), .B1(
        n880), .Y(n775) );
  OAI22XL U1409 ( .A0(\string[5][4] ), .A1(n881), .B0(\string[4][4] ), .B1(
        n882), .Y(n774) );
  OAI22XL U1410 ( .A0(\string[7][4] ), .A1(n883), .B0(\string[6][4] ), .B1(
        n884), .Y(n773) );
  NOR4X1 U1411 ( .A(n776), .B(n775), .C(n774), .D(n773), .Y(n787) );
  OAI22XL U1412 ( .A0(\string[25][4] ), .A1(n869), .B0(\string[24][4] ), .B1(
        n870), .Y(n780) );
  OAI22XL U1413 ( .A0(\string[27][4] ), .A1(n871), .B0(\string[26][4] ), .B1(
        n872), .Y(n779) );
  OAI22XL U1414 ( .A0(\string[29][4] ), .A1(n873), .B0(\string[28][4] ), .B1(
        n874), .Y(n778) );
  OAI22XL U1415 ( .A0(\string[31][4] ), .A1(n875), .B0(\string[30][4] ), .B1(
        n876), .Y(n777) );
  NOR4X1 U1416 ( .A(n780), .B(n779), .C(n778), .D(n777), .Y(n786) );
  OAI221XL U1417 ( .A0(\string[16][4] ), .A1(n877), .B0(\string[17][4] ), .B1(
        n878), .C0(N44), .Y(n784) );
  OAI22XL U1418 ( .A0(\string[19][4] ), .A1(n879), .B0(\string[18][4] ), .B1(
        n880), .Y(n783) );
  OAI22XL U1419 ( .A0(\string[21][4] ), .A1(n881), .B0(\string[20][4] ), .B1(
        n882), .Y(n782) );
  OAI22XL U1420 ( .A0(\string[23][4] ), .A1(n883), .B0(\string[22][4] ), .B1(
        n884), .Y(n781) );
  NOR4X1 U1421 ( .A(n784), .B(n783), .C(n782), .D(n781), .Y(n785) );
  AO22X1 U1422 ( .A0(n788), .A1(n787), .B0(n786), .B1(n785), .Y(N334) );
  OAI22XL U1423 ( .A0(\string[9][5] ), .A1(n869), .B0(\string[8][5] ), .B1(
        n870), .Y(n792) );
  OAI22XL U1424 ( .A0(\string[11][5] ), .A1(n871), .B0(\string[10][5] ), .B1(
        n872), .Y(n791) );
  OAI22XL U1425 ( .A0(\string[13][5] ), .A1(n873), .B0(\string[12][5] ), .B1(
        n874), .Y(n790) );
  OAI22XL U1426 ( .A0(\string[15][5] ), .A1(n875), .B0(\string[14][5] ), .B1(
        n876), .Y(n789) );
  NOR4X1 U1427 ( .A(n792), .B(n791), .C(n790), .D(n789), .Y(n808) );
  OAI221XL U1428 ( .A0(\string[0][5] ), .A1(n877), .B0(\string[1][5] ), .B1(
        n878), .C0(n867), .Y(n796) );
  OAI22XL U1429 ( .A0(\string[3][5] ), .A1(n879), .B0(\string[2][5] ), .B1(
        n880), .Y(n795) );
  OAI22XL U1430 ( .A0(\string[5][5] ), .A1(n881), .B0(\string[4][5] ), .B1(
        n882), .Y(n794) );
  OAI22XL U1431 ( .A0(\string[7][5] ), .A1(n883), .B0(\string[6][5] ), .B1(
        n884), .Y(n793) );
  NOR4X1 U1432 ( .A(n796), .B(n795), .C(n794), .D(n793), .Y(n807) );
  OAI22XL U1433 ( .A0(\string[25][5] ), .A1(n869), .B0(\string[24][5] ), .B1(
        n870), .Y(n800) );
  OAI22XL U1434 ( .A0(\string[27][5] ), .A1(n871), .B0(\string[26][5] ), .B1(
        n872), .Y(n799) );
  OAI22XL U1435 ( .A0(\string[29][5] ), .A1(n873), .B0(\string[28][5] ), .B1(
        n874), .Y(n798) );
  OAI22XL U1436 ( .A0(\string[31][5] ), .A1(n875), .B0(\string[30][5] ), .B1(
        n876), .Y(n797) );
  NOR4X1 U1437 ( .A(n800), .B(n799), .C(n798), .D(n797), .Y(n806) );
  OAI221XL U1438 ( .A0(\string[16][5] ), .A1(n877), .B0(\string[17][5] ), .B1(
        n878), .C0(N44), .Y(n804) );
  OAI22XL U1439 ( .A0(\string[19][5] ), .A1(n879), .B0(\string[18][5] ), .B1(
        n880), .Y(n803) );
  OAI22XL U1440 ( .A0(\string[21][5] ), .A1(n881), .B0(\string[20][5] ), .B1(
        n882), .Y(n802) );
  OAI22XL U1441 ( .A0(\string[23][5] ), .A1(n883), .B0(\string[22][5] ), .B1(
        n884), .Y(n801) );
  NOR4X1 U1442 ( .A(n804), .B(n803), .C(n802), .D(n801), .Y(n805) );
  AO22X1 U1443 ( .A0(n808), .A1(n807), .B0(n806), .B1(n805), .Y(N333) );
  OAI22XL U1444 ( .A0(\string[9][6] ), .A1(n869), .B0(\string[8][6] ), .B1(
        n870), .Y(n812) );
  OAI22XL U1445 ( .A0(\string[11][6] ), .A1(n871), .B0(\string[10][6] ), .B1(
        n872), .Y(n811) );
  OAI22XL U1446 ( .A0(\string[13][6] ), .A1(n873), .B0(\string[12][6] ), .B1(
        n874), .Y(n810) );
  OAI22XL U1447 ( .A0(\string[15][6] ), .A1(n875), .B0(\string[14][6] ), .B1(
        n876), .Y(n809) );
  NOR4X1 U1448 ( .A(n812), .B(n811), .C(n810), .D(n809), .Y(n828) );
  OAI221XL U1449 ( .A0(\string[0][6] ), .A1(n877), .B0(\string[1][6] ), .B1(
        n878), .C0(n867), .Y(n816) );
  OAI22XL U1450 ( .A0(\string[3][6] ), .A1(n879), .B0(\string[2][6] ), .B1(
        n880), .Y(n815) );
  OAI22XL U1451 ( .A0(\string[5][6] ), .A1(n881), .B0(\string[4][6] ), .B1(
        n882), .Y(n814) );
  OAI22XL U1452 ( .A0(\string[7][6] ), .A1(n883), .B0(\string[6][6] ), .B1(
        n884), .Y(n813) );
  NOR4X1 U1453 ( .A(n816), .B(n815), .C(n814), .D(n813), .Y(n827) );
  OAI22XL U1454 ( .A0(\string[25][6] ), .A1(n869), .B0(\string[24][6] ), .B1(
        n870), .Y(n820) );
  OAI22XL U1455 ( .A0(\string[27][6] ), .A1(n871), .B0(\string[26][6] ), .B1(
        n872), .Y(n819) );
  OAI22XL U1456 ( .A0(\string[29][6] ), .A1(n873), .B0(\string[28][6] ), .B1(
        n874), .Y(n818) );
  OAI22XL U1457 ( .A0(\string[31][6] ), .A1(n875), .B0(\string[30][6] ), .B1(
        n876), .Y(n817) );
  NOR4X1 U1458 ( .A(n820), .B(n819), .C(n818), .D(n817), .Y(n826) );
  OAI221XL U1459 ( .A0(\string[16][6] ), .A1(n877), .B0(\string[17][6] ), .B1(
        n878), .C0(N44), .Y(n824) );
  OAI22XL U1460 ( .A0(\string[19][6] ), .A1(n879), .B0(\string[18][6] ), .B1(
        n880), .Y(n823) );
  OAI22XL U1461 ( .A0(\string[21][6] ), .A1(n881), .B0(\string[20][6] ), .B1(
        n882), .Y(n822) );
  OAI22XL U1462 ( .A0(\string[23][6] ), .A1(n883), .B0(\string[22][6] ), .B1(
        n884), .Y(n821) );
  NOR4X1 U1463 ( .A(n824), .B(n823), .C(n822), .D(n821), .Y(n825) );
  AO22X1 U1464 ( .A0(n828), .A1(n827), .B0(n826), .B1(n825), .Y(N332) );
  OAI22XL U1465 ( .A0(\string[9][7] ), .A1(n869), .B0(\string[8][7] ), .B1(
        n870), .Y(n832) );
  OAI22XL U1466 ( .A0(\string[11][7] ), .A1(n871), .B0(\string[10][7] ), .B1(
        n872), .Y(n831) );
  OAI22XL U1467 ( .A0(\string[13][7] ), .A1(n873), .B0(\string[12][7] ), .B1(
        n874), .Y(n830) );
  OAI22XL U1468 ( .A0(\string[15][7] ), .A1(n875), .B0(\string[14][7] ), .B1(
        n876), .Y(n829) );
  NOR4X1 U1469 ( .A(n832), .B(n831), .C(n830), .D(n829), .Y(n864) );
  OAI221XL U1470 ( .A0(\string[0][7] ), .A1(n877), .B0(\string[1][7] ), .B1(
        n878), .C0(n867), .Y(n836) );
  OAI22XL U1471 ( .A0(\string[3][7] ), .A1(n879), .B0(\string[2][7] ), .B1(
        n880), .Y(n835) );
  OAI22XL U1472 ( .A0(\string[5][7] ), .A1(n881), .B0(\string[4][7] ), .B1(
        n882), .Y(n834) );
  OAI22XL U1473 ( .A0(\string[7][7] ), .A1(n883), .B0(\string[6][7] ), .B1(
        n884), .Y(n833) );
  NOR4X1 U1474 ( .A(n836), .B(n835), .C(n834), .D(n833), .Y(n863) );
  OAI22XL U1475 ( .A0(\string[26][7] ), .A1(n872), .B0(\string[25][7] ), .B1(
        n869), .Y(n847) );
  OAI22XL U1476 ( .A0(\string[28][7] ), .A1(n874), .B0(\string[27][7] ), .B1(
        n871), .Y(n846) );
  OAI22XL U1477 ( .A0(\string[30][7] ), .A1(n876), .B0(\string[29][7] ), .B1(
        n873), .Y(n845) );
  OAI21XL U1478 ( .A0(\string[31][7] ), .A1(n875), .B0(N44), .Y(n844) );
  NOR4X1 U1479 ( .A(n847), .B(n846), .C(n845), .D(n844), .Y(n862) );
  OAI222XL U1480 ( .A0(\string[17][7] ), .A1(n878), .B0(\string[16][7] ), .B1(
        n877), .C0(\string[18][7] ), .C1(n880), .Y(n860) );
  OAI22XL U1481 ( .A0(\string[20][7] ), .A1(n882), .B0(\string[19][7] ), .B1(
        n879), .Y(n859) );
  OAI22XL U1482 ( .A0(\string[22][7] ), .A1(n884), .B0(\string[21][7] ), .B1(
        n881), .Y(n858) );
  OAI22XL U1483 ( .A0(\string[24][7] ), .A1(n870), .B0(\string[23][7] ), .B1(
        n883), .Y(n857) );
  NOR4X1 U1484 ( .A(n860), .B(n859), .C(n858), .D(n857), .Y(n861) );
  AO22X1 U1485 ( .A0(n864), .A1(n863), .B0(n862), .B1(n861), .Y(N331) );
  NAND2BX1 U1486 ( .AN(str_len[1]), .B(N55), .Y(n990) );
  OAI2BB1X1 U1487 ( .A0N(n926), .A1N(str_len[1]), .B0(n990), .Y(N56) );
  OR2X1 U1488 ( .A(n990), .B(str_len[2]), .Y(n991) );
  OAI2BB1X1 U1489 ( .A0N(n990), .A1N(str_len[2]), .B0(n991), .Y(N57) );
  OR2X1 U1490 ( .A(n991), .B(str_len[3]), .Y(n992) );
  OAI2BB1X1 U1491 ( .A0N(n991), .A1N(str_len[3]), .B0(n992), .Y(N58) );
  OR2X1 U1492 ( .A(n992), .B(str_len[4]), .Y(n993) );
  OAI2BB1X1 U1493 ( .A0N(n992), .A1N(str_len[4]), .B0(n993), .Y(N59) );
  NOR2X1 U1494 ( .A(n993), .B(str_len[5]), .Y(N61) );
  AO21X1 U1495 ( .A0(n993), .A1(str_len[5]), .B0(N61), .Y(N60) );
  NAND2BX1 U1496 ( .AN(n927), .B(N63), .Y(n994) );
  OAI2BB1X1 U1497 ( .A0N(n928), .A1N(n927), .B0(n994), .Y(N64) );
  OR2X1 U1498 ( .A(n994), .B(pat_len[2]), .Y(n995) );
  OAI2BB1X1 U1499 ( .A0N(n994), .A1N(pat_len[2]), .B0(n995), .Y(N65) );
  NOR2X1 U1500 ( .A(n995), .B(pat_len[3]), .Y(N67) );
  AO21X1 U1501 ( .A0(n995), .A1(pat_len[3]), .B0(N67), .Y(N66) );
  XOR2X1 U1502 ( .A(\add_155/carry [5]), .B(\cur_str[5] ), .Y(N216) );
  NOR3X1 U1503 ( .A(N43), .B(\cur_str[5] ), .C(N44), .Y(n996) );
  NAND2X1 U1504 ( .A(n997), .B(n996), .Y(N208) );
endmodule

