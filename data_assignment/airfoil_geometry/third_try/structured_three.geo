
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
Point(668) = {1.26, -0.11-0.0020, 0, 1.0};
//+
Point(669) = {1.26, -0.11-0.00132, 0, 1.0};
//+
Line(42) = {643, 669};
//+
Line(43) = {427, 668};
//+
Line(44) = {669, 668};
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
Point(698) = {1.39, y_symm, 0, 1.0};
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
Split Curve {1} Point {280, 184, 426, 425,47};
//+
Split Curve {2} Point {557, 643, 427,506};
//+
Line(152) = {557, 426};

//+
Line(157) = {658, 425};

//+
Line(164) = {668, 690};
//+
Line(165) = {427, 689};

//+
Point(709) = {1.3, 0.5 * cushion_width, 0, 1.0};

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
Point(727) = {1.26, -0.0768, 0, 1.0};
//+
Line(227) = {727, 669};
//+
Point(729) = {1.36, 0.5*cushion_width, 0, 1.0};
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
Point(730) = {x_outlet, 0.5 * cushion_width, 0, 1.0};
//+
Point(731) = {x_outlet, -0.076335, 0, 1.0};
//+
Point(732) = {x_outlet, -0.0768, 0, 1.0};
//+
Point(733) = {x_outlet, -0.11132, 0, 1.0};
//+
Point(734) = {x_outlet, -0.112, 0, 1.0};
//+
Point(735) = {x_outlet, -cushion_width * 0.6, 0, 1.0};
//+
Line(247) = {690, 735};
//+
Line(248) = {729, 730};
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
//+
Curve Loop(29) = {217, -129, -152, -130};
//+
Plane Surface(29) = {29};

//+
Translate {0, 0.0262, 0} {
  Duplicata { Point{558:642:2}; }
}
Spline(260) = {426,736:778};

//+
Translate {0, 0.000465, 0} {
  Duplicata { Point{736:778}; }
}
Spline(263) = {425,779:821};

//+
Line(261) = {778, 727};
//+
Point(822) = {1.26, -0.0768+0.000465, 0, 1.0};
//+
Line(262) = {821, 822};





//+
Line(264) = {821, 778};
//+
Line(265) = {778, 643};
//+
Line(268) = {822, 727};
//+
Line(269) = {709, 821};
//+
Line(270) = {822, 729};
//+
Line(271) = {731, 822};
//+
Curve Loop(30) = {238, 269, -263, -157};
//+
Plane Surface(30) = {30};
//+
Curve Loop(31) = {234, -270, -262, -269};
//+
Plane Surface(31) = {31};
//+
Curve Loop(32) = {248, 254, 271, 270};
//+
Plane Surface(32) = {32};
//+
Curve Loop(33) = {255, -252, -268, -271};
//+
Plane Surface(33) = {33};
//+
Curve Loop(34) = {268, -261, -264, 262};
//+
Plane Surface(34) = {34};
//+
Curve Loop(35) = {261, 227, -42, -265};
//+
Plane Surface(35) = {35};
//+
Curve Loop(36) = {265, -131, 152, 260};
//+
Plane Surface(36) = {36};
//+
Curve Loop(37) = {128, 260, -264, -263};
//+
Plane Surface(37) = {37};

// Set default discretisation value
default = 25;
Transfinite Curve{:} = default;
Transfinite Curve{-5,100,-178,237,-253,-6,116,-220,117,118,259} = default Using Progression 1.1;

cushion_points = 30;

//Frontal arc
Transfinite Curve{3,8,126} = 40 Using Bump 2;

// Wing TE (ultra small surfaces), y-disc
Transfinite Curve{128,264,255,268} = 3;
// Flap TE (ultra small surfaces), y-disc
Transfinite Curve{132,44,257} = 4;

// TE (ultra small surfaces), x-disc
Transfinite Curve{262,261,42,43} = 10 Using Progression 1.2;
Transfinite Curve{243,234,91,124} = 10 Using Progression 1.2;

//Set cushion thickness and progression
Transfinite Curve{-4,-7,-157,218,165,-269,164,258,270,-254,219} = cushion_points Using Progression 1.2;
Transfinite Curve{221,223} = cushion_points Using Bump 7.5;
Transfinite Curve{152,217,265,227,256} = cushion_points Using Bump 0.2;
Transfinite Curve{133,222,224} = 30 Using Bump 0.5;

Transfinite Curve{131,260,263,238,242} = 40 Using Bump 0.25;
Transfinite Curve{-127,-235,-241} = 40 Using Progression 1.05;
Transfinite Curve{125,-236,-245} = 40 Using Progression 1.05;

Transfinite Curve{244,248,-271,252,251,250,247,246} = default+10 Using Progression 1.1;



///// TRANSFINITE AND RECOMBINE. END OF PARAMETRISATION
Transfinite Surface{:};
Recombine Surface{:};

//+
Extrude {0, 0, 1} {
  Surface{:}; Layers {1}; Recombine;
}

Coherence;
Physical Volume("Fluid", 2000) = {1:29};

Physical Surface("Inlet", 2001) = {292,314,324,346,372,460,486,508,522,548};
//+
Physical Surface("Outlet", 2002) = {376,790,808,394,412,438,456};
//+ 
Physical Surface("Side", 2003) = {1,2,3,4,5,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,29:37,293,315,337,359,381,799,821,403,425,447,442,469,491,513,535,557,579,601,755,777,865,711,667,645,623};
//+
Physical Surface("Airfoil", 2004) = {570,588,896,724,610};
//+
Physical Surface("Flap", 2005) = {654,732,878,706};


