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

y_disc = 100;

y_wing = y_disc * 0.5;
y_space = y_disc * 2;
y_small = y_disc * 0.5;

Transfinite Curve {42, 86, 28, 95, 93, 29, 98, 97, 96, 35, 26, 27, 22, 88, 90,65, 66} = y_space Using Progression 1;
Transfinite Curve {89} = y_disc Using Bump 1;
Transfinite Curve {29,30,65,66,103} = y_disc;
Transfinite Curve {45,43,94,104} = y_small;
Transfinite Curve {91,87,40,59} = y_disc Using Progression 1;
Transfinite Curve {20,19,83,21,24} = y_space Using Progression 0.9;
Transfinite Curve {22,27,26,35,31,78,84} = y_space Using Progression 1.1;
Transfinite Curve {61,72} = y_space Using Progression 1.1;
Transfinite Curve {81,102} = y_disc;
Transfinite Curve {101,82} = y_disc;
Transfinite Curve {59,96} = y_disc Using Progression 0.85;
Transfinite Curve {57,87} = y_small;
Transfinite Curve {92,41} = y_small;
Transfinite Curve {28,58} = y_disc Using Bump 4;
Transfinite Curve {65,66} = y_disc Using Bump 2;
Transfinite Curve {100,46} = y_space Using Bump 4;
Transfinite Curve {39} = y_space Using Progression 0.93;
Transfinite Curve {50} = y_space Using Progression 1.07;
Transfinite Curve {45,104} = y_small Using Progression 1.1;
Transfinite Curve {85, 71} = y_space Using Progression 1.1;
Transfinite Curve {72} = y_space Using Progression 1.11;
//+
Transfinite Curve {36} = y_disc Using Bump 1;
Transfinite Surface {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18};
Recombine Surface {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18};
//+
//+
Extrude {0, 0, 1} {
  Surface{1}; Surface{2}; Surface{3}; Surface{4}; Surface{5}; Surface{6}; Surface{7}; Surface{8}; Surface{9}; Surface{10}; Surface{11}; Surface{12}; Surface{13}; Surface{14}; Surface{15}; Surface{16}; Surface{17}; Surface{18}; Layers {1}; Recombine;
}
//+
Physical Volume("fluid",501) = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18};
//+
Physical Surface("Inlet", 502) = {125};
//+
Physical Surface("Outlet", 503) = {227, 249, 275, 293};
//+ 
Physical Surface("Wall", 504) = {434,412,478,205, 191, 169, 135, 319, 337, 363, 381, 455, 421, 407, 8, 7, 9, 6, 236, 258, 280, 302, 390, 1, 126, 2, 148, 3, 170, 4, 192, 5, 214, 456, 16, 15, 13, 14, 12, 11, 346, 324, 10, 368,500,17,18};
//+
Physical Surface("Wing_flap", 505) = {143,117,447,161,183,213,235,499,477,429, 469, 491,267,301,311,345,355,389};