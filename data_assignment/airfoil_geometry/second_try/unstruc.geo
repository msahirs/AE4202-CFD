// SetFactory("OpenCASCADE");
Include "../input_geometry/wing.geo";
Include "../input_geometry/flap.geo";

// N. B // Wing Points Definition Point([2... 426])
// N. B // Flap Points Definition Point([427... 643])

//  ## Enclosure variables ## //

// Consts
x_trail = 0.9436;

//inlet displacement from tip without flap
x_inlet = -1;

//outlet displacement from trail edge of wing
x_outlet = 14;

// wall distance from centerline of global coordinates
y_symm = 5;

//top left
Point(645) = {x_inlet, y_symm, 0, 1.0};

//bottom left
Point(646) = {x_inlet, -y_symm, 0, 1.0};

//bottom right
Point(647) = {x_outlet, -y_symm, 0, 1.0};

//top right
Point(648) = {x_outlet, y_symm, 0, 1.0};

//  ## Cushion variables ## //
cushion_width = 0.4;
cushion_LE_len = 0.1; //must be greater than 0!
cushion_TE_len = 1.5; // from 0,0
centre_lead_edge = 229; //id of of point closest to centre of LE


//+ Add Inlet Arc
Circle(3) = {645, centre_lead_edge, 646};

//+ Define cushion points near leading edge
Point(649) = {-cushion_LE_len, cushion_width, 0, 1.0};
//+
Point(650) = {-cushion_LE_len, -cushion_width, 0, 1.0};

//+ Connect lines between leading cushion and inlet
Line(4) = {649, 280};
//+
Line(5) = {645, 649};
//+
Line(6) = {646, 650};
//+
Line(7) = {650, 184};

//+ Add LE cushion Arc
Circle(8) = {649, centre_lead_edge, 650};

//+
Point(651) = {0.25, cushion_width, 0, 1.0};
//+
Point(652) = {0.69, cushion_width * 0.9, 0, 1.0};
//+
Line(9) = {651, 316};
//+
Line(10) = {652, 356};
//+
//+
Line(13) = {649, 651};
//+
Line(14) = {651, 652};
//+//+
Point(653) = {1.1, -0.0175, 0, 1.0};
//+
Point(654) = {1.1, -0.03, 0, 1.0};
//+
Line(15) = {425, 653};

//+
Point(655) = {0.81, 0.14, 0, 1.0};
//+
Point(656) = {0.91, cushion_width * 0.8, 0, 1.0};
//+
Point(657) = {1, 0.12, 0, 1.0};
//+
Point(658) = {1.1, cushion_width * 0.7, 0, 1.0};
//+
Line(17) = {652, 656};
//+
Line(18) = {379, 655};
//+
Line(19) = {655, 656};
//+
Line(20) = {655, 657};
//+
Line(21) = {657, 425};
//+
Line(22) = {657, 658};
//+
Line(23) = {656, 658};
//+
Point(659) = {1.16, 0.1, 0, 1.0};
//+
Line(24) = {657, 659};
//+
Line(25) = {653, 659};
//+
Point(660) = {cushion_TE_len, cushion_width * 0.5, 0, 1.0};
//+
Line(26) = {658, 660};
//+
Line(27) = {659, 660};
//+
Line(28) = {653, 654};
//+
Point(661) = {cushion_TE_len, -0.02, 0, 1.0};
//+
Line(29) = {660, 661};
//+
Line(30) = {653, 661};
//+
Point(662) = {cushion_TE_len, -0.04, 0, 1.0};
//+
Line(33) = {662, 661};
//+
Point(665) = {0.94, 0, 0, 1.0};
//+
Line(35) = {426, 665};
//+
Line(36) = {665, 554};
//+
//+
Point(666) = {0.99, 0, 0, 1.0};
//+
Line(37) = {426, 666};
//+
Line(38) = {666, 654};

//+
Line(39) = {575, 666};
//+
Line(40) = {609, 654};
//+
Point(667) = {1.2, -0.08, 0, 1.0};
//+
Line(41) = {654, 667};
//+
Point(668) = {1.21, -0.115, 0, 1.0};
//+
Point(669) = {1.21, -0.11, 0, 1.0};
//+
Line(42) = {643, 669};
//+
Line(43) = {427, 668};
//+
Line(44) = {669, 668};
//+
Point(670) = {cushion_TE_len, -0.08, 0, 1.0};
//+
Point(671) = {cushion_TE_len, -0.1, 0, 1.0};
//+
Point(672) = {cushion_TE_len, -0.12, 0, 1.0};
//+
Line(46) = {654, 662};

//+
Line(48) = {662, 670};
//+
Line(49) = {667, 643};
//+
Line(50) = {669, 671};
//+
Point(673) = {1.22, -0.08, 0, 1.0};
//+
Line(51) = {667, 673};
//+
Line(52) = {673, 669};
//+
Line(53) = {668, 672};
//+
Line(54) = {673, 670};
//+
Line(55) = {670, 671};
//+
Line(56) = {672, 671};

//+
Point(675) = {0.91, -0, 0, 1.0};
//+
Line(58) = {21, 675};
//+
Line(59) = {533, 675};
//+
Line(60) = {665, 675};
//+
Point(676) = {0.88, -0.01, 0, 1.0};
//+
Point(677) = {0.88, -0.05, 0, 1.0};
//+
Line(61) = {675, 676};
//+
Point(678) = {0.875, -0.03, 0, 1.0};
//+
Line(62) = {508, 678};
//+
Line(63) = {513, 676};
//+
Line(64) = {504, 677};
//+
Line(65) = {676, 38};
//+
Line(66) = {676, 678};
//+
Line(67) = {678, 677};
//+
Point(679) = {0.25, -cushion_width, 0, 1.0};
//+
Line(68) = {149, 679};
//+
Line(69) = {650, 679};
//+
Point(680) = {0.69, -cushion_width*0.9, 0, 1.0};
//+
Line(70) = {102, 680};
//+
Line(71) = {679, 680};
//
//+
Point(681) = {0.76, -0.05, 0, 1.0};
//+
Line(72) = {676, 681};
//+
Line(73) = {72, 681};
//+
Point(682) = {0.77, -0.075, 0, 1.0};
//+
Line(74) = {677, 682};
//+
Line(75) = {681, 682};
//+
Point(683) = {0.91, -cushion_width * 0.8, 0, 1.0};
//+
Line(76) = {682, 683};
//+
Line(77) = {680, 683};
//+
Point(684) = {0.93, -0.06, 0, 1.0};
//+
Point(685) = {1.03, -0.08, 0, 1.0};
//+
Point(686) = {1.14, -0.11, 0, 1.0};

//+
Line(82) = {685, 469};
//+
Line(83) = {447, 686};
//+
Point(687) = {1.2, -0.13, 0, 1.0};
//+
Line(84) = {427, 687};
//+
Point(688) = {1.22, -0.14, 0, 1.0};
//+
Line(85) = {668, 688};
//+
Line(86) = {687, 688};
//+
Line(87) = {686, 687};
//+
Point(689) = {1.2, -cushion_width * 0.6, 0, 1.0};
//+
Point(690) = {1.25, -cushion_width * 0.6, 0, 1.0};
//+
Line(88) = {683, 689};
//+
Line(89) = {687, 689};
//+
Line(90) = {688, 690};
//+
Line(91) = {689, 690};
//+
Point(691) = {cushion_TE_len, -0.15, 0, 1.0};
//+
Line(92) = {688, 691};
//+
Line(93) = {672, 691};
//+
Point(692) = {cushion_TE_len, -0.7*cushion_width, 0, 1.0};
//+
Line(94) = {690, 692};
//+
Line(95) = {691, 692};

//+
Point(674) = {x_outlet, -0.2, 0, 1.0};
//+
Point(663) = {x_outlet, -0.05, 0, 1.0};
//+
Point(664) = {x_outlet, cushion_width * 0.5, 0, 1.0};
//+
Point(693) = {x_outlet, -0.7*cushion_width, 0, 1.0};

//+
Line(32) = {660, 664};
//+
Line(34) = {662, 663};
//+
Line(57) = {672, 674};
//+
Line(96) = {692, 693};

//+
Point(694) = {0.25, y_symm, 0, 1.0};
//+
Point(695) = {0.69, y_symm, 0, 1.0};
//+
Point(696) = {0.91, y_symm, 0, 1.0};
//+
Point(697) = {2.2, y_symm, 0, 1.0};
//+
Point(698) = {2.5, y_symm, 0, 1.0};
//+
Line(97) = {651, 694};
//+
Line(98) = {652, 695};
//+
Line(99) = {656, 696};
//+
Line(100) = {658, 697};
//+
Line(101) = {660, 698};
//+
Line(102) = {645, 694};
//+
Line(103) = {694, 695};
//+
Line(104) = {695, 696};
//+
//+
Line(106) = {696, 697};
//+
Line(107) = {697, 698};
//+
Line(108) = {698, 648};
//+
Line(109) = {648, 664};
//+
Line(110) = {664, 663};
//+
Line(111) = {663, 674};
//+
Line(112) = {674, 693};
//+
Line(113) = {693, 647};
//+
Point(699) = {0.25, -y_symm, 0, 1.0};
//+
Point(700) = {0.69, -y_symm, 0, 1.0};
//+
Point(701) = {0.91, -y_symm, 0, 1.0};
//+
Point(702) = {1.5, -y_symm, 0, 1.0};
//+
Point(703) = {2.5, -y_symm, 0, 1.0};
//+
Point(704) = {1.27, -y_symm, -0.03, 1.0};
//+
Line(114) = {679, 699};
//+
Line(115) = {680, 700};
//+
Line(116) = {683, 701};
//+
Line(117) = {689, 704};
//+
Line(118) = {690, 702};
//+
Line(119) = {692, 703};
//+
Line(120) = {646, 699};
//+
Line(121) = {699, 700};
//+
Line(122) = {700, 701};
//+
Line(123) = {701, 704};
//+
Line(124) = {704, 702};
//+
Line(125) = {702, 703};
//+
Line(126) = {703, 647};
//+
//+
Split Curve {1} Point {280, 184, 316, 149, 356, 102, 379, 72, 38, 426, 425};
//+
Split Curve {137} Point {21};
//+
Split Curve {2} Point {533, 554, 513, 508, 504, 487, 575, 469, 609, 447, 643, 427};
//+
Curve Loop(1) = {5, 8, -6, -3};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {102, -97, -13, -5};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {98, -103, -97, 14};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {104, -99, -17, 98};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {106, -100, -23, 99};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {101, -107, -100, 26};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {108, 109, -32, 101};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {4, -131, -7, -8};
//+
Plane Surface(8) = {8};
//+
Curve Loop(9) = {9, -132, -4, 13};
//+
Plane Surface(9) = {9};
//+
Curve Loop(10) = {14, 10, -133, -9};
//+
Plane Surface(10) = {10};
//+
Curve Loop(11) = {23, -22, -20, 19};
//+
Plane Surface(11) = {11};
//+
Curve Loop(12) = {26, -27, -24, 22};
//+
Plane Surface(12) = {12};
//+
Curve Loop(13) = {20, 21, -135, 18};
//+
Plane Surface(13) = {13};
//+
Curve Loop(14) = {24, -25, -15, -21};
//+
Plane Surface(14) = {14};
//+
Curve Loop(15) = {30, -33, -46, -28};
//+
Plane Surface(15) = {15};
//+
Curve Loop(16) = {35, 60, -58, -138};
//+
Plane Surface(16) = {16};
//+
Curve Loop(17) = {36, -146, 59, -60};
//+
Plane Surface(17) = {17};
//+
Curve Loop(18) = {139, -65, -61, -58};
//+
Plane Surface(18) = {18};
//+
Curve Loop(19) = {127, 73, -72, 65};
//+
Plane Surface(19) = {19};
//+
Curve Loop(20) = {63, -61, -59, -145};
//+
Plane Surface(20) = {20};
//+
Curve Loop(21) = {25, 27, 29, -30};
//+
Plane Surface(21) = {21};
//+
Curve Loop(22) = {130, -7, 69, -68};
//+
Plane Surface(22) = {22};
//+
Curve Loop(23) = {129, 68, 71, -70};
//+
Plane Surface(23) = {23};
//+
Curve Loop(24) = {63, 66, -62, 144};
//+
Plane Surface(24) = {24};
//+
Curve Loop(25) = {62, 67, -64, 143};
//+
Plane Surface(25) = {25};
//+


Curve Loop(30) = {52, -42, -49, 51};
//+
Plane Surface(30) = {30};
//+
Curve Loop(31) = {150, 43, -44, -42};
//+
Plane Surface(31) = {31};
//+
Curve Loop(32) = {38, -40, -148, 39};
//+
Plane Surface(32) = {32};
//+
Curve Loop(33) = {49, -149, 40, 41};
//+
Plane Surface(33) = {33};
//+
Curve Loop(34) = {91, -90, -86, 89};
//+
Plane Surface(34) = {34};
//+
Curve Loop(35) = {52, 50, -55, -54};
//+
Plane Surface(35) = {35};
//+
Curve Loop(36) = {44, 53, 56, -50};
//+
Plane Surface(36) = {36};
//+
Curve Loop(37) = {43, 85, -86, -84};
//+
Plane Surface(37) = {37};
//+
Curve Loop(38) = {53, 93, -92, -85};
//+
Plane Surface(38) = {38};
//+
Curve Loop(39) = {69, 114, -120, 6};
//+
Plane Surface(39) = {39};
//+
Curve Loop(40) = {121, -115, -71, 114};
//+
Plane Surface(40) = {40};
//+
Curve Loop(41) = {77, 116, -122, -115};
//+
Plane Surface(41) = {41};
//+
Curve Loop(42) = {88, 117, -123, -116};
//+
Plane Surface(42) = {42};
//+
Curve Loop(43) = {91, 118, -124, -117};
//+
Plane Surface(43) = {43};
//+
Curve Loop(44) = {94, 119, -125, -118};
//+
Plane Surface(44) = {44};
//+
Curve Loop(45) = {96, 113, -126, -119};
//+
Plane Surface(45) = {45};
//+
Curve Loop(49) = {92, 95, -94, -90};
//+
Plane Surface(49) = {49};

// # Start definition of complex surfaces and lines # //

// Curve 29 + 33
Line(155) = {660,661,662};
Curve Loop(46) = {32, 110, -34, -155};
//+
Plane Surface(46) = {46};

//Curve 48 + 55 + 56
Line(156) = {662,670,671,672};
Curve Loop(47) = {34, 111, -57, -156};
//+
Plane Surface(47) = {47};

//Curve 93 + 95
Line(157) = {672,691,692};
Curve Loop(48) = {57, 112, -96, -157};
//+
Plane Surface(48) = {48};

// Curve 18 + 19
Line(158) = {656,655,379};
Curve Loop(50) = {17, 158, -134, -10};
//+
Plane Surface(50) = {50};

// Curve 37 + 38
Line(159) = {426,666,654};
Curve Loop(51) = {15, 28, -159, -136};
//+
Plane Surface(51) = {51};

// Curve 35 + 36
Line(160) = {426,665,554};
Curve Loop(52) = {160, 147, 39, -37};
//+
Plane Surface(52) = {52};

// Curve 73 + 75 + 76
Line(161) = {72,681,682,683};
Curve Loop(53) = {161, -77, -70, -128};
//+
Plane Surface(53) = {53};

// Curve 66 + 67
Line(162) = {676,678,677};
Curve Loop(54) = {162, 74, -75, -72};
//+
Plane Surface(54) = {54};


// Curve 51 + 54
Line(164) = {667,673,670};
Curve Loop(56) = {46, 48, -164, -41};
//+
Plane Surface(56) = {56};

/* Test transfite with complex lines and surface connects */
// Test unstructured Mesh definition (just for errors in surface definition)
MeshSize {:} = 0.02;

// Transfinite Curve {48, 55, 56,34,57} = 10 Using Progression 1;
// Transfinite Curve {156,111} = 30 Using Progression 1;
// Transfinite Surface{47};

// //// TRANSFINITE LINE DEFINITIONS ////

// /* Part outside the cushion is called outer btw, while inside "cushion" */

// outer_y_disc = 20;
// cushion_y_disc = 20;
// arc_disc = 30;


// //Radii of outer frontal arc
// Transfinite Curve {5, 6} = outer_y_disc Using Progression 1;
// //Frontal outer arc to cushion at LE to LE Curve
// //Bump allows for distribution of points to be closer to centre of arclength
// Transfinite Curve {8, 3, 131} = arc_disc Using Bump 1;
// //Radii of cushion frontal arc
// Transfinite Curve {4,7} = cushion_y_disc Using Progression 1;
// //Create mapped surface for front outer and cushion arcs

// // 102-13 & 120-69
// a = 10;
// Transfinite Curve {102,13,120,69} = a Using Progression 1;
// // 103-14 & 121-71
// b = 10;
// Transfinite Curve {103,14,121,71} = b Using Progression 1;
// // 104-17 & 77-122
// c = 10;
// Transfinite Curve {104,17,77,122} = c Using Progression 1;
// // 106-23 & 88-123
// d = 10;
// Transfinite Curve {106,23,88,123} = d Using Progression 1;
// // 124-91
// e = 10;
// Transfinite Curve {124,91} = e Using Progression 1;
// // 107-26 & 94-125
// f = 10;
// Transfinite Curve {107,26,94,125} = f Using Progression 1;
// // 32-108 & 96-126
// g = 10;
// Transfinite Curve {32,108,96,126} = g Using Progression 1;

// // Ensure all top outer surfaces map well to arc radii (curve 5)
// Transfinite Curve {97,98,99,100,101,109} = outer_y_disc Using Progression 1;

// // Ensure all bottom outer surfaces map well to arc radii (curve 6)
// Transfinite Curve {114,115,116,117,118,119,113} = outer_y_disc Using Progression 1;

// // Ensure all outer horizontals between cushion and outlet map well
// Transfinite Curve {32,34,57,96} = g Using Progression 1;

// // Ensure all top  cushion verticals with cushion frontal arc
// Transfinite Curve {9,10,29,158} = cushion_y_disc Using Progression 1;

// // Ensure all bottom  cushion verticals with cushion frontal arc
// Transfinite Curve {68,70,161} = cushion_y_disc Using Progression 1;

// // Ensure outer-cushions horizontal boundary map to wing and flap surfaces
// Transfinite Curve {132,130} = a Using Progression 1;
// Transfinite Curve {133,129} = b Using Progression 1;
// Transfinite Curve {134,128} = c Using Progression 1;
// Transfinite Curve {20,135,163} = d Using Progression 1;
// Transfinite Curve {86,43,42,51} = e Using Progression 1;
// Transfinite Curve {92,53,50,54} = f Using Progression 1;
// Transfinite Curve {24,15,159} = f Using Progression 1;

// // Mapping of complex surfaces
// Transfinite Curve {19,22,27,30,46,164} = 10 Using Progression 1;
// Transfinite Curve {18,21,25,29} = 10 Using Progression 1;

// //Transfinite & Recombine all defined (using `{:}`) surfaces
// Transfinite Surface {:};
// Recombine Surface {:};
