
double findCrossingOfScan1D(TGraph& graph, double value) {
 double* x = graph.GetX();
 double* y = graph.GetY();
 int imin = 0;
 int n = graph.GetN();
 for (int i=0; i<n; i++) {
  if (y[i] > value) {
   return x[i];
  }
 }
 return -999.;
}

