
{
 
//   int n =  limit->Draw("2*deltaNLL:CMS_ww2l2v_GGsm","","goff");
  int n =  limit->Draw("2*deltaNLL:CMS_zz4l_GGsm","","goff");
  
//  int n =  limit->Draw("2*deltaNLL:R","","goff");
 TGraph *graphScan = new TGraph(n,limit->GetV2(),limit->GetV1());
 graphScan->SetTitle("");
 graphScan->SetMarkerStyle(21);
 graphScan->SetMarkerColor(kRed);
 graphScan->SetLineColor(kRed);
 graphScan->Draw("apl");
 graphScan->GetXaxis()->SetTitle("r = #Gamma/#Gamma_{SM}");
 graphScan->GetYaxis()->SetTitle("- 2#Delta logL");
 graphScan->GetYaxis()->SetRangeUser(0,10);
 gPad->SetGrid();
}