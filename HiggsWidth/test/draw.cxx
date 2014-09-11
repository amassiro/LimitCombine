
{
 int n =  limit->Draw("2*deltaNLL:CMS_ww2l2v_GGsm","","goff");
 TGraph *graphScan = new TGraph(n,limit->GetV2(),limit->GetV1());
 graphScan->SetTitle("");
 graphScan->SetMarkerStyle(21);
 graphScan->SetMarkerColor(kRed);
 graphScan->SetLineColor(kRed);
 graphScan->Draw("apl");
 graphScan->GetXaxis()->SetTitle("#Gamma_{H}");
 graphScan->GetYaxis()->SetTitle("- #Delta LL");
 gPad->SetGrid();
}