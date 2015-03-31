
{

 #include "tools.h"
 
 
 TCanvas *cc = new TCanvas("cc","",180,52,550,550);

 limit_0   = (TTree*) _file0->Get("limit");
 limit_1   = (TTree*) _file1->Get("limit");
 limit_012 = (TTree*) _file2->Get("limit");

 unblind_limit_0   = (TTree*) _file3->Get("limit");
 unblind_limit_1   = (TTree*) _file4->Get("limit");
 unblind_limit_012 = (TTree*) _file5->Get("limit");
 
 int n;
 
 n =  limit_0->Draw("2*deltaNLL:CMS_zz4l_GGsm","","goff");
 TGraph *graphScan_0 = new TGraph(n,limit_0->GetV2(),limit_0->GetV1());
 graphScan_0->SetTitle("");
 graphScan_0->SetMarkerStyle(21);
 graphScan_0->SetLineWidth(2);
 graphScan_0->SetLineStyle(2);
 graphScan_0->SetMarkerColor(kBlue);
 graphScan_0->SetLineColor(kBlue);
 
 
 n =  limit_1->Draw("2*deltaNLL:CMS_zz4l_GGsm","","goff");
 TGraph *graphScan_1 = new TGraph(n,limit_1->GetV2(),limit_1->GetV1());
 graphScan_1->SetTitle("");
 graphScan_1->SetMarkerStyle(21);
 graphScan_1->SetLineWidth(2);
 graphScan_1->SetLineStyle(2);
 graphScan_1->SetMarkerColor(kBlack);
 graphScan_1->SetLineColor(kBlack);
 
 
 n =  limit_012->Draw("2*deltaNLL:CMS_zz4l_GGsm","","goff");
 TGraph *graphScan_012 = new TGraph(n,limit_012->GetV2(),limit_012->GetV1());
 graphScan_012->SetTitle("");
 graphScan_012->SetMarkerStyle(21);
 graphScan_012->SetLineWidth(2);
 graphScan_012->SetLineStyle(2);
 graphScan_012->SetMarkerColor(kRed);
 graphScan_012->SetLineColor(kRed); 
 
 
 
 
 
 
 
 n =  unblind_limit_0->Draw("2*deltaNLL:CMS_zz4l_GGsm","","goff");
 TGraph *unblind_graphScan_0 = new TGraph(n,unblind_limit_0->GetV2(),unblind_limit_0->GetV1());
 unblind_graphScan_0->SetTitle("");
 unblind_graphScan_0->SetMarkerStyle(21);
 unblind_graphScan_0->SetLineWidth(2);
 unblind_graphScan_0->SetMarkerColor(kBlue);
 unblind_graphScan_0->SetLineColor(kBlue);
 
 
 n =  unblind_limit_1->Draw("2*deltaNLL:CMS_zz4l_GGsm","","goff");
 TGraph *unblind_graphScan_1 = new TGraph(n,unblind_limit_1->GetV2(),unblind_limit_1->GetV1());
 unblind_graphScan_1->SetTitle("");
 unblind_graphScan_1->SetMarkerStyle(21);
 unblind_graphScan_1->SetLineWidth(2);
 unblind_graphScan_1->SetMarkerColor(kBlack);
 unblind_graphScan_1->SetLineColor(kBlack);
 
 
 n =  unblind_limit_012->Draw("2*deltaNLL:CMS_zz4l_GGsm","","goff");
 TGraph *unblind_graphScan_012 = new TGraph(n,unblind_limit_012->GetV2(),unblind_limit_012->GetV1());
 unblind_graphScan_012->SetTitle("");
 unblind_graphScan_012->SetMarkerStyle(21);
 unblind_graphScan_012->SetLineWidth(2);
 unblind_graphScan_012->SetMarkerColor(kRed);
 unblind_graphScan_012->SetLineColor(kRed); 
 
 
 
 
 //----  draw
 cc->SetTicks();
 cc->SetFillColor(0);
 cc->SetBorderMode(0);
 cc->SetBorderSize(2);
 cc->SetTickx(1);
 cc->SetTicky(1);
 cc->SetRightMargin(0.05);
 cc->SetBottomMargin(0.12);
 cc->SetFrameBorderMode(0);
 TLatex * tex = new TLatex(0.94,0.92,"7+8 TeV");
 tex->SetNDC();
 tex->SetTextAlign(31);
 tex->SetTextFont(42);
 tex->SetTextSize(0.04);
 tex->SetLineWidth(2);
 TLatex * tex2 = new TLatex(0.14,0.92,"CMS");
 tex2->SetNDC();
 tex2->SetTextFont(61);
 tex2->SetTextSize(0.04);
 tex2->SetLineWidth(2);
 TLatex * tex3 = new TLatex(0.236,0.92,"L = 4.9 + 19.4 fb^{-1}  Preliminary");
 tex3->SetNDC();
 tex3->SetTextFont(52);
 tex3->SetTextSize(0.035);
 tex3->SetLineWidth(2);

 
 
 
 graphScan_0->Draw("al");
 graphScan_0->GetXaxis()->SetTitle("r = #Gamma/#Gamma_{SM}");
 graphScan_0->GetYaxis()->SetTitle("- 2#Delta logL");
 graphScan_0->GetYaxis()->SetRangeUser(0,10);
 graphScan_0->GetXaxis()->SetRangeUser(0,40);
//  graphScan_0->GetXaxis()->SetRangeUser(0,45);
 //  graphScan_0->GetXaxis()->SetRangeUser(0,(limit_012->GetV2())[n-1]);
 
 graphScan_1  ->Draw("l");
 graphScan_012->Draw("l");
 
 //---- unblind results
 unblind_graphScan_0  ->Draw("l");
 unblind_graphScan_1  ->Draw("l");
 unblind_graphScan_012->Draw("l");
 
 
 tex->Draw("same");
 tex2->Draw("same");
 tex3->Draw("same");

 //---- legend
 
//  leg = new TLegend(0.50,0.60,0.90,0.80);
 leg = new TLegend(0.10,0.70,0.50,0.90);
 leg->AddEntry(graphScan_0,"7 TeV (exp)","l");
 leg->AddEntry(graphScan_1,"8 TeV (exp)","l");
 leg->AddEntry(graphScan_012,"7 + 8 (exp)","l");
 leg->AddEntry(unblind_graphScan_0,"7 TeV (obs)","l");
 leg->AddEntry(unblind_graphScan_1,"8 TeV (obs)","l");
 leg->AddEntry(unblind_graphScan_012,"7 + 8 (obs)","l");
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
 
 
 
 double value_x_1sigma = findCrossingOfScan1D(*graphScan_012, 1.00);
 std::cout << " value_x_1sigma = " << value_x_1sigma << std::endl;
 double value_x_2sigma = findCrossingOfScan1D(*graphScan_012, 3.84);
 std::cout << " value_x_2sigma = " << value_x_2sigma << std::endl;
 
 TLine *vline1 = new TLine(value_x_1sigma,0.0,value_x_1sigma,1.0);
 vline1->SetLineWidth(2);
 vline1->SetLineStyle(2);
 vline1->Draw(); 
 
 TLine *vline2 = new TLine(value_x_2sigma,0.0,value_x_2sigma,3.84);
 vline2->SetLineWidth(2);
 vline2->SetLineStyle(2);
 vline2->Draw();












 TLine *unblind_line1 = new TLine(0.0,1.0,(limit_012->GetV2())[n-1],1.0);
 unblind_line1->SetLineWidth(2);
 unblind_line1->SetLineStyle(2);
 unblind_line1->Draw(); 
 
 TLine *unblind_line2 = new TLine(0.0,3.84,(limit_012->GetV2())[n-1],3.84);
 unblind_line2->SetLineWidth(2);
 unblind_line2->SetLineStyle(2);
 unblind_line2->Draw();
 
 
 
 double unblind_value_x_1sigma = findCrossingOfScan1D(*unblind_graphScan_012, 1.00);
 std::cout << " unblind_value_x_1sigma = " << unblind_value_x_1sigma << std::endl;
 double unblind_value_x_2sigma = findCrossingOfScan1D(*unblind_graphScan_012, 3.84);
 std::cout << " unblind_value_x_2sigma = " << unblind_value_x_2sigma << std::endl;
 
 TLine *unblind_vline1 = new TLine(unblind_value_x_1sigma,0.0,unblind_value_x_1sigma,1.0);
 unblind_vline1->SetLineWidth(2);
 unblind_vline1->SetLineStyle(1);
 unblind_vline1->Draw(); 
 
 TLine *unblind_vline2 = new TLine(unblind_value_x_2sigma,0.0,unblind_value_x_2sigma,3.84);
 unblind_vline2->SetLineWidth(2);
 unblind_vline2->SetLineStyle(1);
 unblind_vline2->Draw();
 
 gPad->SetGrid();
 
 cc->SaveAs("cc7and8TeV.unblind.png");
 
}


