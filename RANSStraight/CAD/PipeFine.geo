SetFactory("OpenCASCADE");
Merge "Pipe.stp";

//+
Dilate {{0, 0, 0}, {0.001, 0.001, 0.001}} {
  Surface{5}; Surface{4}; Surface{2}; Surface{1}; Surface{3}; 
}
//+
Transfinite Curve {21, 13, 20, 18, 15, 11, 16, 14} = 25 Using Progression 1;
//+
Transfinite Curve {10, 17, 19, 12} = 28 Using Progression 0.8333333;
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
Extrude {0, 0, 8.32} {
  Surface{5}; Surface{3}; Surface{2}; Surface{4}; Surface{1}; Layers {640}; Recombine;
}
//+
Physical Surface("outlet", 42) = {10, 14, 18, 20, 22};
//+
Physical Surface("wall", 43) = {17, 13, 9, 21};
//+
Physical Surface("inlet", 44) = {2, 3, 4, 5, 1};
//+
Physical Volume("fluid", 45) = {2, 4, 1, 5, 3};
