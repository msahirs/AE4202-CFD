// SetFactory("OpenCASCADE");
Include "wing.geo";
Include "flap.geo";

// N. B // Wing Points Definition Point([1... 426])
// N. B // Flap Points Definition Point([427... 644])//+


Recursive Delete {
    Point{426}; Point{644}; 
  }

//Domain params, in terms of global coordinates
y_domain = 4;
x_in = -3;
x_out = 12;

//+ Split airfoil up
Split Curve {1} Point {390, 42, 358, 96, 289, 176};
//+
Point(645) = {x_in, y_domain, 0, 1.0};
//+
Point(646) = {x_in, -y_domain, 0, 1.0};
//+
Point(647) = {x_out, y_domain, 0, 1.0};
//+
Point(648) = {x_out, -y_domain, 0, 1.0};
//+
Split Curve {2} Point {557, 534};
//+
Split Curve {10} Point {463};
//+
Split Curve {14} Point {507};
//+
Split Curve {12} Point {590};
//+
Line(19) = {645, 289};
//+
Line(20) = {646, 176};
//+
Point(649) = {0.635, y_domain, 0, 1.0};
//+
Point(650) = {0.635, -y_domain, 0, 1.0};
//+
Line(21) = {649, 358};
//+
Line(22) = {96, 650};

//+
Point(651) = {0.902, y_domain, 0, 1.0};
//+
Point(652) = {0.84, -y_domain, 0, 1.0};
//+
Point(654) = {0.8906, -y_domain, 0, 1.0};
//+
Line(24) = {651, 390};
//+
Line(26) = {507, 654};
//+
Line(27) = {42, 652};
//+
Line(28) = {42, 507};
//+
Line(29) = {26, 534};
//+
Line(30) = {426, 557};
//+
Point(655) = {4.2, y_domain, 0, 1.0};
//+
Point(656) = {7.5, -y_domain, 0, 1.0};
//+
Line(31) = {408, 655};

//+
Point(900) = {x_out, 0.15*y_domain, 0, 1.0};
//+
Point(901) = {x_out, 0.15*-y_domain, 0, 1.0};
//+
Point(902) = {1.2, -y_domain, 0, 1.0};
//+
Line(35) = {463, 902};
//+
Circle(36) = {645, 229, 646};
//+
Split Curve {3} Point {26};
//+
Line(39) = {645, 649};
//+
Line(40) = {649, 651};
//+
Line(41) = {651, 655};
//+
Line(42) = {655, 647};
//+
Line(43) = {647, 900};
//+
Line(45) = {901, 648};
//+
Line(46) = {648, 656};

//+

//+
Line(50) = {650, 646};
//+
//+
//+
Curve Loop(1) = {36, 20, 6, -19};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {19, 7, -21, -39};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {21, 8, -24, -40};
//+
Plane Surface(3) = {3};
//+
Split Curve {9} Point {425};
//+
Split Curve {18} Point {643};
//+

//+
Recursive Delete {
  Curve{54}; 
}
//+
Split Curve {37} Point {2};
//+
Recursive Delete {
  Curve{54}; 
}
//+
Line(56) = {2, 426};
//+
//+
Curve Loop(7) = {28, 16, -29, 38};
//+
Plane Surface(7) = {7};
//+
Line(57) = {650, 652};
//+
Line(58) = {652, 654};
//+
Line(59) = {654, 902};
//+
Curve Loop(8) = {22, 57, -27, 4};
//+
Plane Surface(8) = {8};
//+
Curve Loop(9) = {50, 20, -5, 22};
//+
Plane Surface(9) = {9};
//+
Curve Loop(10) = {26, -58, -27, 28};
//+
Plane Surface(10) = {10};
//+
Curve Loop(11) = {15, 26, 59, -35};
//+
Plane Surface(11) = {11};
//+
Line(60) = {427, 643};
//+
Line(61) = {643, 656};
//+
Point(903) = {x_out, 0, 0, 1.0};
//+
Line(65) = {900, 903};
//+
Line(66) = {903, 901};
//+
Line(71) = {590, 901};
//+
Line(72) = {626, 648};
//+
Split Curve {53} Point {626};
//+
//+
Curve Loop(14) = {73, 72, -45, -71};
//+
Plane Surface(14) = {14};
//+
//+
//+
Split Curve {55} Point {3};
//+
Compound Curve {56, 76};


//+
Line(78) = {425, 647};
//+
Split Curve {51} Point {408};
//+q
Curve Loop(18) = {31, 42, -78, -80};
//+
Plane Surface(18) = {18};
//+
Curve Loop(4) = {78, -42, -31, 80};
//+
Plane Surface(4) = {4};

//+
Point(904) = {2.21, -y_domain, 0, 1.0};
//+
Line(81) = {902, 904};
//+
Line(82) = {904, 656};
//+
Line(83) = {904, 427};
//+
Curve Loop(19) = {61, -82, 83, 60};
//+
Plane Surface(19) = {19};
//+
Curve Loop(20) = {13, 35, 81, 83};
//+
Plane Surface(20) = {20};
//+
Line(84) = {426, 900};
//+
Curve Loop(21) = {78, 43, -84, -52};
//+
Plane Surface(21) = {21};
//+
Line(85) = {557, 903};
//+
Curve Loop(22) = {30, -11, -29, -76, -75, 56};
//+
Plane Surface(22) = {22};
//+
Curve Loop(23) = {84, 65, -85, -30};
//+
Plane Surface(23) = {23};
//+
Curve Loop(24) = {85, 66, -71, -17};
//+
Plane Surface(24) = {24};
//+
Curve Loop(25) = {61, -46, -72, 74};
//+
Plane Surface(25) = {25};

//+
Curve Loop(26) = {24, 79, 31, -41};
//+
Plane Surface(26) = {26};


//+
Transfinite Curve {83,82,6,19, 20, 39, 40, 21, 24, 41, 31, 7, 8, 79, 80, 78, 42, 43, 71, 65, 66, 75, 52, 76, 56, 77, 30, 29, 4, 38, 28, 16, 11, 17, 15, 73, 13, 35, 26, 72, 61, 74, 45, 46, 47, 59, 27, 58, 57, 22, 5, 50} = 40 Using Progression 1;
//+
Transfinite Curve {36} = 120 Using Progression 1;

Transfinite Surface {2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26};
Transfinite Surface {1};
//+

//+
Recombine Surface {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26};
