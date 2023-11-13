
Mesh.ToleranceReferenceElement = 1e-8;
Mesh.AngleToleranceFacetOverlap = 0.001;
Geometry.Tolerance = 1e-8;
Geometry.MatchMeshTolerance = 1e-8;
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
x_outlet = 9;

// wall distance from centerline of global coordinates
y_symm = 3;

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
Point(658) = {0.9436, cushion_width * 0.7, 0, 1.0};
//+
Point(668) = {1.23, -0.12, 0, 1.0};
//+
Point(669) = {1.23, -0.11, 0, 1.0};
//+
Line(42) = {643, 669};
//+
Line(43) = {427, 668};
//+
Line(44) = {669, 668};
//+
Point(683) = {0.822, -cushion_width * 0.75, 0, 1.0};
//+
Point(689) = {1.2, -cushion_width * 0.6, 0, 1.0};
//+
Point(690) = {1.23, -cushion_width * 0.6, 0, 1.0};
//+
Line(91) = {689, 690};

Point(697) = {0.9436, y_symm, 0, 1.0};
//+
Point(698) = {1.39, y_symm, 0, 1.0};
//+
Line(100) = {658, 697};
//+
Point(701) = {0.822, -y_symm, 0, 1.0};
//+
Point(702) = {1.23, -y_symm, 0, 1.0};

Point(704) = {1.20, -y_symm, 0, 1.0};
//+
Line(116) = {683, 701};
//+
Line(117) = {689, 704};
//+
Line(118) = {690, 702};
//+
Line(124) = {704, 702};
//+
//+
Split Curve {1} Point {280, 184, 426, 425,47};
//+
Split Curve {2} Point {557, 643, 427,506};
//+

// /* Test transfite with complex lines and plane surface connects */
// // Test unstructured Mesh definition (just for errors in plane surface definition)
// // MeshSize {:} = 0.02;

// // Transfinite Curve {48, 55, 56,34,57} = 10 Using Progression 1;
// // Transfinite Curve {156,111} = 30 Using Progression 1;
// // Transfinite Plane Surface{47};

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
// //Create mapped plane surface for front outer and cushion arcs
//+
Line(152) = {557, 426};

//+
Line(157) = {658, 425};

//+
Line(164) = {668, 690};
//+
Line(165) = {427, 689};
//+
Point(707) = {1.2, -0.05, 0, 1.0};


//+
Point(708) = {1.2, 0, 0, 1.0};
//+
Point(709) = {1.3, 0.5 * cushion_width, 0, 1.0};

//+
Line(174) = {707, 708};
//+
Line(175) = {708, 709};

//+
Point(711) = {1.35, y_symm, 0, 1.0};
//+
Line(178) = {711, 709};
Line(217) = {506, 47};
//+
Line(218) = {47, 683};
//+
Point(725) = {0.89, -0.3, 0, 1.0};
//+
Line(219) = {506, 725};
//+
Point(726) = {0.89, -y_symm, 0, 1.0};
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
Line(226) = {643, 707};
//+
Point(727) = {1.23, -0.05, 0, 1.0};
//+
Point(728) = {1.23, 0, 0, 1.0};
//+
Line(227) = {727, 669};
//+
Line(228) = {728, 727};
//+
Line(229) = {708, 728};
//+
Line(230) = {707, 727};
//+
Point(729) = {1.36, 0.5*cushion_width, 0, 1.0};
//+
Line(233) = {728, 729};
//+
Line(234) = {709, 729};
//+
Line(235) = {649, 658};
//+
Line(236) = {650, 683};
//+
Line(237) = {729, 698};
//+
Line(238) = {658, 709};
//+
Line(239) = {426, 707};
//+
Line(240) = {425, 708};
//+
Line(241) = {645, 697};
//+
Line(242) = {697, 711};
//+
Line(243) = {711, 698};
//+
Line(244) = {698, 648};
//+
Line(245) = {646, 701};
//+
Line(246) = {702, 647};




// // Cushion
// Transfinite Curve{:} = 20;
// // External
// Transfinite Curve{5,97,98,99,100,196,176,178,101,109,6,114,115,206,116,220,117,118,119,113} = 100;
// // Frontal Arc
// Transfinite Curve{132,8,3} = 50;

// // Wake x
// Transfinite Curve{108,32,186,34,184,185,57,96,126} = 400;

// Transfinite Surface{:};
// Recombine Surface{:};



//+
Point(730) = {x_outlet, 0.5 * cushion_width, 0, 1.0};
//+
Point(731) = {x_outlet, 0, 0, 1.0};
//+
Point(732) = {x_outlet, -0.05, 0, 1.0};
//+
Point(733) = {x_outlet, -0.11, 0, 1.0};
//+
Point(734) = {x_outlet, -0.12, 0, 1.0};
//+
Point(735) = {x_outlet, -cushion_width * 0.6, 0, 1.0};
//+
Line(247) = {690, 735};
//+
Line(248) = {729, 730};
//+
Line(249) = {728, 731};
//+
Line(250) = {668, 734};
//+
Line(251) = {669, 733};
//+
Line(252) = {727, 732};
//+
Line(253) = {648, 730};
//+
Line(254) = {730, 731};
//+
Line(255) = {731, 732};
//+
Line(256) = {732, 733};
//+
Line(257) = {733, 734};
//+
Line(258) = {734, 735};
//+
Line(259) = {735, 647};
//+
Curve Loop(1) = {5, 8, -6, -3};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {5, 235, 100, -241};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {242, 178, -238, 100};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {243, -237, -234, -178};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {237, 244, 253, -248};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {248, 254, -249, 233};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {255, -252, -228, 249};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {252, 256, -251, -227};
//+
Plane Surface(8) = {8};
//+
Curve Loop(9) = {257, -250, -44, 251};
//+
Plane Surface(9) = {9};
//+
Curve Loop(10) = {250, 258, -247, -164};
//+
Plane Surface(10) = {10};
//+
Curve Loop(11) = {259, -246, -118, 247};
//+
Plane Surface(11) = {11};
//+
Curve Loop(12) = {91, 118, -124, -117};
//+
Plane Surface(12) = {12};
//+
Curve Loop(13) = {222, 117, -224, 220};
//+
Plane Surface(13) = {13};
//+
Curve Loop(14) = {223, 220, -221, 116};
//+
Plane Surface(14) = {14};
//+
Curve Loop(15) = {116, -245, 6, 236};
//+
Plane Surface(15) = {15};
//+
Curve Loop(16) = {4, -126, -7, -8};
//+
Plane Surface(16) = {16};
//+
Curve Loop(17) = {127, -157, -235, 4};
//+
Plane Surface(17) = {17};
//+
Curve Loop(18) = {125, -7, 236, -218};
//+
Plane Surface(18) = {18};
//+
Curve Loop(19) = {217, 218, 221, -219};
//+
Plane Surface(19) = {19};
//+
Curve Loop(20) = {133, 219, 222, -165};
//+
Plane Surface(20) = {20};
//+
Curve Loop(21) = {164, -91, -165, 43};
//+
Plane Surface(21) = {21};
//+
Curve Loop(22) = {44, -43, -132, 42};
//+
Plane Surface(22) = {22};
//+
Curve Loop(23) = {227, -42, 226, 230};
//+
Plane Surface(23) = {23};
//+
Curve Loop(24) = {228, -230, 174, 229};
//+
Plane Surface(24) = {24};
//+
Curve Loop(25) = {229, 233, -234, -175};
//+
Plane Surface(25) = {25};
//+
Curve Loop(26) = {175, -238, 157, 240};
//+
Plane Surface(26) = {26};
//+
Curve Loop(27) = {174, -240, 128, 239};
//+
Plane Surface(27) = {27};
//+
Curve Loop(29) = {217, -129, -152, -130};
//+
Plane Surface(29) = {29};

//+
Curve Loop(30) = {131, 226, -239, -152};
//+
Plane Surface(30) = {30};

Transfinite Line{:} = 15;

// Trailing thickness control
Transfinite Line{128,174,228,255,132,257,44} = 5;

// Trailing x control
Transfinite Line{243,234,229,230,42,43,91,124} = 5;
Transfinite Surface{:};
Recombine Surface{:};

// //+
// Extrude {0, 0, 1} {
//   Surface{:}; Layers {1}; Recombine;
// }
// //+
// Coherence;

// //+
// Physical Volume("Fluid", 2000) = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29};
// //+
// Physical Surface("Inlet", 2001) = {280,302,312,334,360,492,518,540,554,580};
// //+
// Physical Surface("Outlet", 2002) = {364,382,400,426,444,470,488};
// //+ 
// Physical Surface("Side", 2003) = {281,303,325,347,369,391,413,435,457,479,501,523,545,567,589,611,633,831,809,787,765,743,721,699,677,655,875,897,853,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30};
// //+
// Physical Surface("Airfoil", 2004) = {602,620,848,866,642};
// //+
// Physical Surface("Flap", 2005) = {874,884,738,686};
//+//+//+
Translate {-0.001, 0.0262, 0} {
  Duplicata { Curve{131}; }
}
