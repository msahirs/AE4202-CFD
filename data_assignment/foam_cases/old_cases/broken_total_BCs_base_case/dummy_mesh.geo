//+
SetFactory("OpenCASCADE");
Circle(1) = {0, 0.0, 0, 0.5, 0, 2*Pi};
//+
Circle(2) = {0.5, -0.6, 0, 0.2, 0, 2*Pi};
//+
Point(3) = {-5, 5, 0, 1.0};
//+
Point(4) = {-5, -5, 0, 1.0};
//+
Point(5) = {10, -5, 0, 1.0};
//+
Point(6) = {10, 5, 0, 1.0};
//+
Line(3) = {3, 4};
//+
Line(4) = {4, 5};
//+
Line(5) = {5, 6};
//+
Line(6) = {6, 3};

//circles
Transfinite Curve {1, 2} = 200 Using Progression 1;
//inlet/outlet
Transfinite Curve {3, 5} = 50 Using Progression 1;
//sides
Transfinite Curve {6, 4} = 100 Using Progression 1;
//+
Curve Loop(1) = {6, 3, 4, 5};
//+
Curve Loop(2) = {1};
//+
Curve Loop(3) = {2};
//+
Plane Surface(1) = {1, 2, 3};
//+

//+
Extrude {0, 0, 1} {
  Surface{1}; Layers{1}; Recombine;
}
//+
Physical Volume("Fluid") = {1};
//+
Physical Surface("Inlet") = {2, 3, 4};
//+
Physical Surface("Side") = {8, 1};
//+
Physical Surface("Outlet") = {5};
//+
Physical Surface("Airfoil") = {6};
//+
Physical Surface("Flap") = {7};
