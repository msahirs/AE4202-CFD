// SetFactory("OpenCASCADE");
Include "wing.geo";
Include "flap.geo";

// N. B // Wing Points Definition Point([1... 426])
// N. B // Flap Points Definition Point([427... 644])//+


Recursive Delete {
    Point{426}; Point{644}; 
  }

//Domain params, in terms of global coordinates
y_domain = 5;
x_in = -3;
x_out = 12;

//+ Split airfoil up
//+
Point(645) = {x_in, y_domain, 0, 1.0};
//+
Point(646) = {x_in, -y_domain, 0, 1.0};
//+
Point(647) = {x_out, y_domain, 0, 1.0};
//+
Point(648) = {x_out, -y_domain, 0, 1.0};
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
Line(50) = {650, 646};
//+
Line(57) = {650, 652};
//+
Line(58) = {652, 654};
//+
Line(59) = {654, 902};
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
Line(78) = {425, 647};
//+
Point(904) = {2.21, -y_domain, 0, 1.0};
//+
Line(81) = {902, 904};
//+
Line(82) = {904, 656};
//+
Line(83) = {904, 427};
//+
Line(84) = {426, 900};
//+
Line(85) = {557, 903};
//+
Split Curve {1} Point {390, 358, 289, 176, 96, 42, 26, 408, 425, 426};
//+
Split Curve {2} Point {557, 534, 626, 643, 427, 463, 507};
//+
Curve Loop(1) = {19, -89, -20, -36};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {39, 21, -90, -19};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {21, 91, -24, -40};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {24, 92, 31, -41};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {31, 42, -78, -93};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {78, 43, -84, -94};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {84, 65, -85, -30};
//+
Plane Surface(7) = {7};
//+
Split Curve {99} Point {590};
//+
Curve Loop(8) = {103, 71, -66, -85};
//+
Plane Surface(8) = {8};
//+
Curve Loop(9) = {71, 45, -72, -104};
//+
Plane Surface(9) = {9};
//+
Curve Loop(10) = {100, 61, -46, -72};
//+
Plane Surface(10) = {10};
//+
Curve Loop(11) = {61, -82, 83, -101};
//+
Plane Surface(11) = {11};
//+
Curve Loop(12) = {102, 35, 81, 83};
//+
Plane Surface(12) = {12};
//+
Curve Loop(13) = {35, -59, -26, -96};
//+
Plane Surface(13) = {13};
//+
Curve Loop(14) = {28, 26, -58, -27};
//+
Plane Surface(14) = {14};
//+
Curve Loop(15) = {57, -27, 87, 22};
//+
Plane Surface(15) = {15};
//+
Curve Loop(16) = {20, -88, 22, 50};
//+
Plane Surface(16) = {16};
//+
Curve Loop(17) = {28, 97, -29, 86};
//+
Plane Surface(17) = {17};
//+
Curve Loop(18) = {30, -98, -29, -95};
//+
Plane Surface(18) = {18};
//+

y_disc = 21;

y_wing = y_disc * 0.25;
y_space = y_disc * 2;


Transfinite Curve {39, 21, 24, 41, 31, 42, 78, 43, 84, 85, 71, 92, 86, 28, 95, 93, 29, 98, 97, 96, 72, 61, 83, 35, 35, 26, 27, 22, 88, 90, 50, 46, 45, 65, 66, 100} = y_space Using Progression 1;
Transfinite Curve {19,20} = y_space Using Progression 1;
Transfinite Curve {89} = y_disc;
Transfinite Curve {58, 28,29,30,65,66,103} = y_disc;
Transfinite Curve {45,43} = y_disc;
Transfinite Curve {91,87,40,59} = y_disc;
Transfinite Curve {81,102} = y_disc;
Transfinite Curve {94} = y_disc;
Transfinite Curve {104} = y_disc;
Transfinite Curve {101,82} = y_disc;
Transfinite Curve {59,96} = y_disc;
Transfinite Curve {57,87} = y_disc;
//+
Transfinite Curve {36} = y_disc Using Progression 1;
Transfinite Surface {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18};
Recombine Surface {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18};
//+
