SetFactory("OpenCASCADE");
Merge "Pipe.stp";
//+
Dilate {{0, 0, 0}, {0.001, 0.001, 0.001}} {
  Surface{3}; Surface{5}; Surface{4}; Surface{2}; Surface{1}; 
}

//+
Translate {0, 0, 0.104*80} {
  Surface{5}; Surface{4}; Surface{2}; Surface{1}; Surface{3}; 
}
//+
Transfinite Curve {28, 36, 33, 35, 29, 26, 31, 30} = 10 Using Progression 1;
//+
Transfinite Curve {27, 25, 32, 34} = 6 Using Progression 0.83333333;
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
Extrude {0, 0, 1.04} {
  Surface{5}; Surface{3}; Surface{4}; Surface{2}; Surface{1}; Layers {40}; Recombine;
}
//+
Extrude {{-1, 0, 0}, {0, 0.208, 9.36}, Pi/2} {
  Surface{17}; Surface{10}; Surface{14}; Surface{20}; Surface{22}; Layers{100}; Recombine;
}
//+
Extrude {0, 0.104*40, 0} {
  Surface{31}; Surface{27}; Surface{39}; Surface{37}; Surface{34}; Layers {250}; Recombine;
}
//+
Physical Surface("inlet", 97) = {2, 4, 3, 5, 1};
//+
Physical Surface("outlet", 98) = {54, 48, 51, 44, 56};
//+
Physical Surface("wall", 99) = {21, 38, 36, 19, 30, 9, 49, 43, 52, 33, 13, 55};
//+
Physical Volume("fluid", 100) = {15, 12, 13, 11, 14, 8, 6, 10, 7, 9, 5, 3, 2, 1, 4};
