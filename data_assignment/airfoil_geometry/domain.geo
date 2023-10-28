// SetFactory("OpenCASCADE");
Include "wing.geo";
Include "flap.geo";

// N. B // Wing Points Definition Point([1... 426])
// N. B // Flap Points Definition Point([427... 644])//+
//+
//+

//+
Point(645) = {-2, 3, 0, 1.0};
//+
Point(646) = {-2, -3, 0, 1.0};
//+
Point(647) = {10, 3, 0, 1.0};
//+
Point(648) = {10, -3, 0, 1.0};
//+
Circle(3) = {645, 229, 646};
//+
Line(4) = {645, 647};
//+
Line(5) = {647, 648};
//+
Line(6) = {648, 646};
