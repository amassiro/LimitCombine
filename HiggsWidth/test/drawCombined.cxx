
{
 
 limit_0   = (TTree*) _file0->Get("limit");
 limit_1   = (TTree*) _file1->Get("limit");
 limit_2   = (TTree*) _file2->Get("limit");
 limit_012 = (TTree*) _file3->Get("limit");
 
 int n;

 n =  limit_0->Draw("2*deltaNLL:CMS_zz4l_GGsm","","goff");
 TGraph *graphScan_0 = new TGraph(n,limit_0->GetV2(),limit_0->GetV1());
 graphScan_0->SetTitle("");
 graphScan_0->SetMarkerStyle(21);
 graphScan_0->SetLineWidth(2);
 graphScan_0->SetMarkerColor(kBlue);
 graphScan_0->SetLineColor(kBlue);


 n =  limit_1->Draw("2*deltaNLL:CMS_zz4l_GGsm","","goff");
 TGraph *graphScan_1 = new TGraph(n,limit_1->GetV2(),limit_1->GetV1());
 graphScan_1->SetTitle("");
 graphScan_1->SetMarkerStyle(21);
 graphScan_1->SetLineWidth(2);
 graphScan_1->SetMarkerColor(kBlack);
 graphScan_1->SetLineColor(kBlack);


 n =  limit_2->Draw("2*deltaNLL:CMS_zz4l_GGsm","","goff");
 TGraph *graphScan_2 = new TGraph(n,limit_2->GetV2(),limit_2->GetV1());
 graphScan_2->SetTitle("");
 graphScan_2->SetMarkerStyle(21);
 graphScan_2->SetLineWidth(2);
 graphScan_2->SetMarkerColor(kGreen);
 graphScan_2->SetLineColor(kGreen);


 n =  limit_012->Draw("2*deltaNLL:CMS_zz4l_GGsm","","goff");
 TGraph *graphScan_012 = new TGraph(n,limit_012->GetV2(),limit_012->GetV1());
 graphScan_012->SetTitle("");
 graphScan_012->SetMarkerStyle(21);
 graphScan_012->SetLineWidth(2);
 graphScan_012->SetMarkerColor(kRed);
 graphScan_012->SetLineColor(kRed); 
 
 
 //----  draw
 
 graphScan_0->Draw("al");
 graphScan_0->GetXaxis()->SetTitle("r = #Gamma/#Gamma_{SM}");
 graphScan_0->GetYaxis()->SetTitle("- 2#Delta logL");
 graphScan_0->GetYaxis()->SetRangeUser(0,8);
 
 graphScan_1  ->Draw("l");
 graphScan_2  ->Draw("l");
 graphScan_012->Draw("l");

 //---- legend
 
 leg = new TLegend(0.1,0.7,0.48,0.9);
 leg->AddEntry(graphScan_0,"0 jet","l");
 leg->AddEntry(graphScan_1,"1 jet","l");
 leg->AddEntry(graphScan_2,"2 jet","l");
 leg->AddEntry(graphScan_012,"0 jet + 1 jet + 2 jet","l");
 leg->SetFillColor(0);
 leg->Draw();

 
//  2deltaLogL = 1.00
//  2deltaLogL = 3.84
 
//  std::cout << " max X = " << (limit_012->GetV2())[n-1] << std::endl;
 
 TLine *line1 = new TLine(0.0,1.0,(limit_012->GetV2())[n-1],1.0);
 line1->SetLineWidth(2);
 line1->SetLineStyle(2);
 line1->Draw(); 

 TLine *line2 = new TLine(0.0,3.84,(limit_012->GetV2())[n-1],3.84);
 line2->SetLineWidth(2);
 line2->SetLineStyle(2);
 line2->Draw();
 
 gPad->SetGrid();

 
}


