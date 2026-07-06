SetFactory("OpenCASCADE");
Merge "Pipe.stp";
//+
Dilate {{0, 0, 0}, {0.001, 0.001, 0.001}} {
  Surface{3}; Surface{5}; Surface{4}; Surface{2}; Surface{1}; 
}

//+
Translate {0, 0, 0.104*5.5} {
  Surface{5}; Surface{4}; Surface{2}; Surface{1}; Surface{3}; 
}
//+
Transfinite Curve {28, 36, 33, 35, 29, 26, 31, 30} = 66 Using Progression 1;
//+
Transfinite Curve {27, 25, 32, 34} = 33 Using Progression 1;
//+
Transfinite Surface {5};
//+
Transfinite Surface {4};
//+
Transfinite Surface {2};
//+
Transfinite Surface {1};
//+
Transfinite Surface {3};
//+
Extrude {{-1, 0, 0}, {0, 0.208, 0.104*5.5}, Pi/2} {
  Surface{1}; Surface{2}; Surface{3}; Surface{4}; Surface{5}; Layers{270}; Recombine;
}
//+
Extrude {0, 0, -0.052} {
  Surface{3}; Surface{4}; Surface{5}; Surface{1}; Surface{2}; Layers {43}; Recombine;
}
//+
Extrude {0, 0.312,0} {
  Surface{10}; Surface{20}; Surface{22}; Surface{14}; Surface{18}; Layers {258}; Recombine;
}

//+
Physical Surface("inlet", 97) = {39, 31, 27, 34, 37};
//+
Physical Surface("outlet", 98) = {48, 44, 54, 56, 51};
//+
Physical Surface("wall", 99) = {50, 21, 33, 16, 25, 55, 52, 12, 38, 42, 8, 35};
//+
Physical Volume("fluid", 100) = {11, 13, 12, 15, 14, 1, 5, 4, 2, 3, 6, 7, 8, 9, 10};
