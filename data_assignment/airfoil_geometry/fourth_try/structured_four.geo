

Include "wing.geo";
Include "flap.geo";

// N. B // Wing Points Definition Point([2... 426])
// N. B // Flap Points Definition Point([427... 643])

//  ## Enclosure variables ## //

// Consts
x_trail = 0.9436;

//inlet displacement from tip without flap
x_inlet = -0.5;

//outlet displacement from trail edge of wing
x_outlet = 6;

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
cushion_LE_len = 0.01; //must be greater than 0!
cushion_TE_len = 1.5; // from 0,0
centre_lead_edge = 229; //id of of point closest to centre of LE

//+ Add Inlet Arc
Circle(3) = {645, centre_lead_edge, 646};

//+ Define cushion points near leading edge
Point(649) = {-cushion_LE_len, cushion_width*0.8, 0, 1.0};
//+
Point(650) = {-cushion_LE_len, -cushion_width*0.8, 0, 1.0};

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
Point(668) = {1.26, -0.11-0.0020, 0, 1.0};
//+
Line(43) = {427, 668};
//+
Point(683) = {0.822, -cushion_width * 0.75, 0, 1.0};
//+
Point(689) = {1.2, -0.3, 0, 1.0};
//+
Point(690) = {1.26, -0.3, 0, 1.0};
//+
Line(91) = {689, 690};

Point(697) = {0.9436, y_symm, 0, 1.0};
//+
Point(698) = {2, y_symm, 0, 1.0};
//+
Line(100) = {658, 697};
//+
Point(701) = {0.822, -y_symm, 0, 1.0};
//+
Point(702) = {1.26, -y_symm, 0, 1.0};

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
Split Curve {1} Point {280, 184, 426,47};
//+
Split Curve {2} Point {557, 427,506};
//+
Line(152) = {557, 426};


//+
Line(164) = {668, 690};
//+
Line(165) = {427, 689};

//+
Point(709) = {1.3, 0.4 * cushion_width, 0, 1.0};

//+
Point(711) = {1.94, y_symm, 0, 1.0};
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
Point(727) = {1.26, -0.0768, 0, 1.0};

//+
Point(729) = {1.36, 0.4*cushion_width, 0, 1.0};
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
//+
Point(730) = {x_outlet, 0.4 * cushion_width, 0, 1.0};
//+
Point(732) = {x_outlet, -0.0768, 0, 1.0};
//+
Point(734) = {x_outlet, -0.112, 0, 1.0};
//+
Point(735) = {x_outlet, -0.3, 0, 1.0};
//+
Line(247) = {690, 735};
//+
Line(248) = {729, 730};
//+
Line(250) = {668, 734};
//+
Line(252) = {727, 732};
//+
Line(253) = {648, 730};
//+
Line(258) = {734, 735};
//+
Line(259) = {735, 647};


//+
Translate {0, 0.0265175 * 0.605, 0} {
  Duplicata { Point{558:642:2, 427}; }
}
Line(260) = {426,736:779};

//+
Line(262) = {658, 426};
//+
Line(263) = {779, 727};
//+
Line(264) = {779, 427};
//+
Line(265) = {779, 709};
//+
Line(266) = {727, 729};
//+
Line(267) = {668, 727};
//+
Line(268) = {730, 732};
//+
Line(269) = {732, 734};

//+
Curve Loop(1) = {5, 8, -6, -3};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {241, -100, -235, -5};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {242, 178, -238, 100};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {178, 234, 237, -243};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {244, 253, -248, 237};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {248, 268, -252, 266};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {252, 269, -250, 267};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {266, -234, -265, 263};
//+
Plane Surface(8) = {8};
//+
Curve Loop(9) = {238, -265, -260, -262};
//+
Plane Surface(9) = {9};
//+
Curve Loop(10) = {267, -263, 264, 43};
//+
Plane Surface(10) = {10};
//+
Curve Loop(11) = {164, -91, -165, 43};
//+
Plane Surface(11) = {11};
//+
Curve Loop(12) = {250, 258, -247, -164};
//+
Plane Surface(12) = {12};
//+
Curve Loop(13) = {259, -246, -118, 247};
//+
Plane Surface(13) = {13};
//+
Curve Loop(14) = {165, -222, -219, -131};
//+
Plane Surface(14) = {14};
//+
Curve Loop(15) = {222, 117, -224, 220};
//+
Plane Surface(15) = {15};
//+
Curve Loop(16) = {91, 118, -124, -117};
//+
Plane Surface(16) = {16};
//+
Curve Loop(17) = {223, 220, -221, 116};
//+
Plane Surface(17) = {17};
//+
Curve Loop(18) = {219, -221, -218, -217};
//+
Plane Surface(18) = {18};
//+
Curve Loop(19) = {130, -264, -260, -152};
//+
Plane Surface(19) = {19};
//+
Curve Loop(20) = {129, 152, 128, -217};
//+
Plane Surface(20) = {20};
//+
Curve Loop(21) = {125, -7, 236, -218};
//+
Plane Surface(21) = {21};
//+
Curve Loop(22) = {4, 127, -262, -235};
//+
Plane Surface(22) = {22};
//+
Curve Loop(23) = {8, 7, 126, -4};
//+
Plane Surface(23) = {23};
//+
Curve Loop(24) = {236, 116, -245, 6};
//+
Plane Surface(24) = {24};

Geometry.ScalingFactor = 0.605;
// Set default discretisation value

default = 35;
Transfinite Curve{:} = default;

cushion_points = 25;

//Frontal arc
Transfinite Curve{3} = 50 Using Bump 1;
Transfinite Curve{8,126} = 50 Using Bump 2;

//Set cushion thickness and progression
Transfinite Curve{-4,-7,217,218,219,164} = cushion_points Using Progression 1.15;
Transfinite Curve{265,266,-268,258,-262} = cushion_points Using Progression 1.2;
Transfinite Curve{165,164} = cushion_points Using Progression 1.1;
Transfinite Curve{131} = 30 Using Bump 1/5;
Transfinite Curve{222} = 30 Using Bump 1/5;
Transfinite Curve{224} = 30 Using Bump 1;
Transfinite Curve{217,152} = 20 Using Bump 1/4;
Transfinite Curve{264,267,269} = 20 Using Bump 1;
Transfinite Curve{221,223} = 20 Using Bump 4;
Transfinite Curve{129,-128} = 50 Using Progression 1.01;
Transfinite Curve{-127} = 35 Using Progression 1.02;
Transfinite Curve{-235} = 35 Using Progression 1.05;
Transfinite Curve{-241} = 35 Using Progression 1.1;
Transfinite Curve{130,260} = 30 Using Bump 1/1.5;
Transfinite Curve{238} = 30 Using Bump 1;
Transfinite Curve{-242} = 30 Using Progression 1;

Transfinite Curve{124,43,91} = 7 Using Progression 1.3;
Transfinite Curve{234,263} = 7 Using Progression 1.15;
Transfinite Curve{243} = 7 Using Bump 4;

Transfinite Curve{125,-236} = 40 Using Progression 1.05;
Transfinite Curve{-245} = 40 Using Progression 1.07;

Transfinite Curve{244,248,252,250,247,246} = 40 Using Progression 1.075;


// ///// TRANSFINITE AND RECOMBINE. END OF PARAMETRISATION
Transfinite Surface{:};
Recombine Surface{:};



//+
Extrude {0, 0, 1} {
  Surface{:}; Layers {1}; Recombine;
}

Coherence;
Physical Volume("Fluid", 2000) = {1:24};

Physical Surface("Inlet", 2001) = {366,356,322,300,290,792,630,594,616,546};
// +
Physical Surface("Outlet", 2002) = {370,392,414,524,542};
//+ 
Physical Surface("Side", 2003) = {291,1,2,313,3,335,357,4,5,379,6,401,7,423,12,533,13,555,8,445,10,489,11,511,14,577,16,621,15,599,18,665,20,709,19,687,9,467,21,731,23,775,22,753,17,643,24,797};
//+
Physical Surface("Airfoil", 2004) = {770,744,704,718};
Physical Surface("Flap", 2005) = {674,576,696};
