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
Point(656) = {0.91, cushion_width * 0.8, 0, 1.0};
//+
Point(658) = {1.1, cushion_width * 0.7, 0, 1.0};
//+
Line(17) = {652, 656};
//+
//+
//+
Line(23) = {656, 658};
//+
Point(660) = {cushion_TE_len, cushion_width * 0.5, 0, 1.0};
//+
Line(28) = {653, 654};
//+
Point(661) = {cushion_TE_len, -0.02, 0, 1.0};
//+
Line(29) = {660, 661};
//+
Point(662) = {cushion_TE_len, -0.04, 0, 1.0};
//+
Line(33) = {662, 661};

//+
//+
Point(666) = {0.99, 0.002, 0, 1.0};
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
Point(668) = {1.23, -0.115, 0, 1.0};
//+
Point(669) = {1.23, -0.11, 0, 1.0};
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



Point(679) = {0.25, -cushion_width, 0, 1.0};
//+
Line(68) = {149, 679};
//+
Line(69) = {650, 679};
//+
Point(680) = {0.69, -cushion_width*0.8, 0, 1.0};
//+
Line(70) = {102, 680};
//+
Line(71) = {679, 680};
//+
Point(683) = {0.91, -cushion_width * 0.8, 0, 1.0};
//+

Point(689) = {1.2, -cushion_width * 0.6, 0, 1.0};
//+
Point(690) = {1.25, -cushion_width * 0.6, 0, 1.0};
//+
Line(91) = {689, 690};
Point(692) = {cushion_TE_len, -0.7*cushion_width, 0, 1.0};
//+
Line(94) = {690, 692};

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
Line(108) = {698, 648};
//+
Line(109) = {648, 664};

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
Line(124) = {704, 702};
//+
Line(125) = {702, 703};
//+
Line(126) = {703, 647};
//+
//+
Split Curve {1} Point {21,280, 184, 316, 149, 356, 379, 426, 425,72,102,47};
//+
Split Curve {2} Point {533, 554, 575, 609, 643, 427,506};
//+

// /* Test transfite with complex lines and surface connects */
// // Test unstructured Mesh definition (just for errors in surface definition)
// // MeshSize {:} = 0.02;

// // Transfinite Curve {48, 55, 56,34,57} = 10 Using Progression 1;
// // Transfinite Curve {156,111} = 30 Using Progression 1;
// // Transfinite Surface{47};

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
// Transfinite Curve {4,7} = cushion_y_disc Using   ion 1;
// //Create mapped surface for front outer and cushion arcs
//+
Line(152) = {554, 426};
//+
Line(153) = {21, 533};
//+
Line(156) = {656, 379};
//+
Line(157) = {658, 425};
//+
Point(705) = {0.81, -0.3, -0.02, 1.0};

//+
Line(164) = {668, 690};
//+
Line(165) = {427, 689};
//+
Line(166) = {672, 692};
//+
Point(706) = {1.3, 0.23, -0.02, 1.0};
//+
Line(169) = {653, 706};
//+
Point(707) = {1.14, -0.03, -0.02, 1.0};
//+
Line(170) = {654, 707};
//+
Line(171) = {707, 673};
//+
Line(172) = {707, 662};
//+
Point(708) = {1.14, -0.02, -0.02, 1.0};
//+
Point(709) = {1.35, 0.22, -0.02, 1.0};
//+
Point(710) = {2.35, 4.99, -0.02, 1.0};
//+
Line(173) = {653, 708};
//+
Line(174) = {707, 708};
//+
Line(175) = {708, 709};
//+
Line(176) = {706, 710};
//+
Line(177) = {708, 661};
//+
Point(711) = {2.42, 4.99, -0.02, 1.0};
//+
Line(178) = {711, 709};
//+
Line(179) = {706, 709};
//+
Line(180) = {709, 660};
//+
Line(182) = {710, 711};
//+
Line(183) = {711, 698};
//+
Point(712) = {14, 0.05, -0.02, 1.0};
//+
Point(713) = {14, -0.12, -0.02, 1.0};
//+
Point(714) = {14, -0.16, -0.02, 1.0};
//+
Line(184) = {713, 670};
//+
Line(185) = {671, 714};
//+
Line(186) = {712, 661};
//+
Line(187) = {664, 712};
//+
Line(188) = {712, 663};
//+
Line(189) = {663, 713};
//+
Line(190) = {713, 714};
//+
Line(191) = {714, 674};
//+
Line(192) = {693, 674};
//+
Point(715) = {0.99, 0.01, -0.02, 1.0};
//+
Line(193) = {425, 715};
//+
Line(194) = {715, 666};
//+
Line(195) = {715, 653};
//+
Point(716) = {1.19, 0.25, -0.02, 1.0};
//+
Point(717) = {2.27, 5, -0.02, 1.0};
//+
Line(196) = {717, 716};
//+
Line(197) = {716, 715};
//+
Line(198) = {658, 716};
//+
Line(199) = {716, 706};
//+
Line(200) = {697, 717};
//+
Line(201) = {717, 710};
//+
//+
Curve Loop(1) = {5, 8, -6, -3};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {13, 97, -102, 5};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {103, -98, -14, 97};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {104, -99, -17, 98};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {23, 100, -106, -99};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {200, 196, -198, 100};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {199, 176, -201, 196};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {178, -179, 176, 182};
//+
Plane Surface(8) = {8};
//+
Curve Loop(9) = {180, 101, -183, 178};
//+
Plane Surface(9) = {9};
//+
Curve Loop(10) = {108, 109, -32, 101};
//+
Plane Surface(10) = {10};
//+
Curve Loop(11) = {32, 187, 186, -29};
//+
Plane Surface(11) = {11};
//+
Curve Loop(12) = {188, -34, 33, -186};
//+
Plane Surface(12) = {12};
//+
Curve Loop(13) = {34, 189, 184, -48};
//+
Plane Surface(13) = {13};
//+
Curve Loop(14) = {190, -185, -55, -184};
//+
Plane Surface(14) = {14};
//+
Curve Loop(15) = {185, 191, -57, 56};
//+
Plane Surface(15) = {15};
//+
Curve Loop(16) = {57, -192, -96, -166};
//+
Plane Surface(16) = {16};
//+
Curve Loop(17) = {96, 113, -126, -119};
//+
Plane Surface(17) = {17};
//+
Curve Loop(18) = {94, 119, -125, -118};
//+
Plane Surface(18) = {18};
//+
Curve Loop(19) = {124, -118, -91, 117};
//+
Plane Surface(19) = {19};

//+
Line(202) = {680, 705};
//+
Line(203) = {705, 683};
//+
Point(718) = {0.81, -5, -0.02, 1.0};
//+
Line(204) = {700, 718};
//+
Line(205) = {718, 701};
//+
Line(206) = {718, 705};
//+
Curve Loop(21) = {116, -205, 206, 203};
//+
Plane Surface(21) = {21};
//+
Curve Loop(22) = {202, -206, -204, -115};
//+
Plane Surface(22) = {22};
//+
Curve Loop(23) = {121, -115, -71, 114};
//+
Plane Surface(23) = {23};
//+
Curve Loop(24) = {69, 114, -120, 6};
//+
Plane Surface(24) = {24};
//+
Curve Loop(30) = {198, 197, -193, -157};
//+
Plane Surface(30) = {30};

Curve Loop(38) = {152, 37, -39, -141};
//+
Plane Surface(38) = {38};
//+
Curve Loop(43) = {38, -40, -142, 39};
//+
Plane Surface(43) = {43};
//+
Curve Loop(49) = {43, 164, -91, -165};
//+
Plane Surface(49) = {49};
//+
Curve Loop(50) = {44, -43, -144, 42};
//+
Plane Surface(50) = {50};
//+
Curve Loop(52) = {28, 170, 174, -173};
//+
Plane Surface(52) = {52};
//+
Curve Loop(53) = {177, -33, -172, 174};
//+
Plane Surface(53) = {53};
//+
Curve Loop(54) = {48, -54, -171, 172};
//+
Plane Surface(54) = {54};
//+
Curve Loop(55) = {51, -171, -170, 41};
//+
Plane Surface(55) = {55};
//+
Curve Loop(56) = {51, 52, -42, -49};
//+
Plane Surface(56) = {56};
//+
Curve Loop(57) = {175, -179, -169, 173};
//+
Plane Surface(57) = {57};
//+
Curve Loop(58) = {175, 180, 29, -177};
//+
Plane Surface(58) = {58};
//+
Curve Loop(59) = {94, -166, -53, 164};
//+
Plane Surface(59) = {59};
//+
Curve Loop(60) = {50, -56, -53, -44};
//+
Plane Surface(60) = {60};
//+
Curve Loop(61) = {52, 50, -55, -54};
//+
Plane Surface(61) = {61};
//+
Line(209) = {72, 705};

//+
Line(217) = {506, 47};
//+
Line(218) = {47, 683};
//+
Point(725) = {0.96, -0.3, -0.02, 1.0};
//+
Line(219) = {506, 725};
//+
Point(726) = {1.02, -5.01, -0.02, 1.0};
//+
Line(220) = {726, 725};
//+
Line(221) = {683, 725};
//+
Line(222) = {725, 689};
//+
Line(223) = {701, 726};
//+
Line(224) = {726, 704};
//+
Curve Loop(62) = {4, -132, -7, -8};
//+
Plane Surface(62) = {62};
//+
Curve Loop(63) = {9, -133, -4, 13};
//+
Plane Surface(63) = {63};
//+
Curve Loop(64) = {131, -7, 69, -68};
//+
Plane Surface(64) = {64};
//+
Curve Loop(65) = {70, -71, -68, -130};
//+
Plane Surface(65) = {65};
//+
Curve Loop(66) = {134, -10, -14, 9};
//+
Plane Surface(66) = {66};
//+
Curve Loop(67) = {156, -135, -10, 17};
//+
Plane Surface(67) = {67};
//+
Curve Loop(68) = {23, 157, -136, -156};
//+
Plane Surface(68) = {68};
//+
Curve Loop(70) = {152, 138, 153, 140};
//+
Plane Surface(70) = {70};
//+
Curve Loop(71) = {139, -153, 127, -217};
//+
Plane Surface(71) = {71};
//+
Curve Loop(72) = {219, -221, -218, -217};
//+
Plane Surface(72) = {72};
//+
Curve Loop(73) = {145, 219, 222, -165};
//+
Plane Surface(73) = {73};
//+
Curve Loop(74) = {117, -224, 220, 222};
//+
Plane Surface(74) = {74};
//+
Curve Loop(75) = {223, 220, -221, 116};
//+
Plane Surface(75) = {75};
//+
Curve Loop(76) = {128, 209, 203, -218};
//+
Plane Surface(76) = {76};
//+
Curve Loop(77) = {202, -209, 129, 70};
//+
Plane Surface(77) = {77};
//+
Curve Loop(78) = {137, 37, -194, -193};
//+
Plane Surface(78) = {78};
//+
Curve Loop(79) = {195, 28, -38, -194};
//+
Plane Surface(79) = {79};

//+
Curve Loop(80) = {197, 195, 169, -199};
//+
Plane Surface(80) = {80};
//+

//+
Curve Loop(81) = {143, -49, -41, -40};
//+
Plane Surface(81) = {81};


//+
Transfinite Curve {:} = 30;
Transfinite Curve {137, 194, 28, 174, 33, 188} = 30;
Transfinite Surface{:};
Recombine Surface{:};
