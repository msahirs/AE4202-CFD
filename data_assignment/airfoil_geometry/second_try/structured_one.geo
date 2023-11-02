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
cushion_width = 0.5;
cushion_f_len = 0.1; //must be greater than 0!
centre_lead_edge = 229; //id of of point closest to centre of LE

//+ Add Inlet Arc
Circle(3) = {645, centre_lead_edge, 646};

//+ Define cushion points near leading edge
Point(649) = {-cushion_f_len, cushion_width, 0, 1.0};
//+
Point(650) = {-cushion_f_len, -cushion_width, 0, 1.0};

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
Point(651) = {0.25, 0.5, 0, 1.0};
//+
Point(652) = {0.69, 0.44, 0, 1.0};
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
Point(653) = {1.1, -0.01, 0, 1.0};
//+
Point(654) = {1.1, -0.03, 0, 1.0};
//+
Line(15) = {425, 653};

//+
Point(655) = {0.81, 0.14, 0, 1.0};
//+
Point(656) = {0.91, 0.39, 0, 1.0};
//+
Point(657) = {1, 0.1, 0, 1.0};
//+
Point(658) = {1.27, 0.29, 0, 1.0};
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
Point(659) = {1.13, 0.06, 0, 1.0};
//+
Line(24) = {657, 659};
//+
Line(25) = {653, 659};
//+
Point(660) = {1.4, 0.26, 0, 1.0};
//+
Line(26) = {658, 660};
//+
Line(27) = {659, 660};
//+
Line(28) = {653, 654};
//+
Point(661) = {1.4, -0.02, 0, 1.0};
//+
Line(29) = {660, 661};
//+
Line(30) = {653, 661};
//+
Point(662) = {1.4, -0.04, 0, 1.0};
//+
Point(663) = {2.72, -0.05, 0, 1.0};
//+
Point(664) = {2.72, 0.27, 0, 1.0};
//+
Line(32) = {660, 664};
//+
Line(33) = {662, 661};
//+
Line(34) = {662, 663};
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
Point(670) = {1.4, -0.08, 0, 1.0};
//+
Point(671) = {1.4, -0.1, 0, 1.0};
//+
Point(672) = {1.4, -0.12, 0, 1.0};
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
Point(674) = {2.71, -0.2, 0, 1.0};
//+
Line(57) = {672, 674};
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
Point(679) = {0.21, -0.52, 0, 1.0};
//+
Line(68) = {149, 679};
//+
Line(69) = {650, 679};
//+
Point(680) = {0.69, -0.52, 0, 1.0};
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
Point(682) = {0.77, -0.1, 0, 1.0};
//+
Line(74) = {677, 682};
//+
Line(75) = {681, 682};
//+
Point(683) = {0.85, -0.52, 0, 1.0};
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
Line(78) = {677, 684};
//+
Line(79) = {684, 685};
//+
Line(80) = {685, 686};
//+
Line(81) = {684, 487};
//+
Line(82) = {685, 469};
//+
Line(83) = {447, 686};
//+
Point(687) = {1.2, -0.13, 0, 1.0};
//+
Line(84) = {427, 687};
//+
Point(688) = {1.21, -0.13, 0, 1.0};
//+
Line(85) = {668, 688};
//+
Line(86) = {687, 688};
//+
Line(87) = {686, 687};
//+
Point(689) = {1.13, -0.54, 0, 1.0};
//+
Point(690) = {1.18, -0.54, 0, 1.0};
//+
Line(88) = {683, 689};
//+
Line(89) = {687, 689};
//+
Line(90) = {688, 690};
//+
Line(91) = {689, 690};
//+
Point(691) = {1.4, -0.15, 0, 1.0};
//+
Line(92) = {688, 691};
//+
Line(93) = {672, 691};
//+
Point(692) = {1.4, -0.55, 0, 1.0};
//+
Line(94) = {690, 692};
//+
Line(95) = {691, 692};
//+
Point(693) = {2.68, -0.61, 0, 1.0};
//+
Line(96) = {692, 693};
