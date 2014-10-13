
{
#include "tools.h"


 TCanvas *cc = new TCanvas("cc","",180,52,550,550);

//   int n =  limit->Draw("2*deltaNLL:CMS_ww2l2v_GGsm","","goff");
  int n =  limit->Draw("2*deltaNLL:CMS_zz4l_GGsm","","goff");

  cc->SetTicks();
  cc->SetFillColor(0);
  cc->SetBorderMode(0);
  cc->SetBorderSize(2);
  cc->SetTickx(1);
  cc->SetTicky(1);
  cc->SetRightMargin(0.05);
  cc->SetBottomMargin(0.12);
  cc->SetFrameBorderMode(0);
  TLatex * tex = new TLatex(0.94,0.92,"8 TeV");
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
  TLatex * tex3 = new TLatex(0.236,0.92,"L = 19.4 fb^{-1}  Preliminary");
  tex3->SetNDC();
  tex3->SetTextFont(52);
  tex3->SetTextSize(0.035);
  tex3->SetLineWidth(2);
  
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

  tex->Draw("same");
  tex2->Draw("same");
  tex3->Draw("same");

 //---- likelihood levels 
  TLine *line1 = new TLine(0.0,1.0,(limit->GetV2())[n-1],1.0);
  line1->SetLineWidth(2);
  line1->SetLineStyle(2);
  line1->Draw(); 

  TLine *line2 = new TLine(0.0,3.84,(limit->GetV2())[n-1],3.84);
  line2->SetLineWidth(2);
  line2->SetLineStyle(2);
  line2->Draw();

  double value_x_1sigma = findCrossingOfScan1D(*graphScan, 1.00);
  std::cout << " value_x_1sigma = " << value_x_1sigma << std::endl;
  double value_x_2sigma = findCrossingOfScan1D(*graphScan, 3.84);
  std::cout << " value_x_2sigma = " << value_x_2sigma << std::endl;

  TLine *vline1 = new TLine(value_x_1sigma,0.0,value_x_1sigma,1.0);
  vline1->SetLineWidth(2);
  vline1->SetLineStyle(2);
  vline1->Draw(); 

  TLine *vline2 = new TLine(value_x_2sigma,0.0,value_x_2sigma,3.84);
  vline2->SetLineWidth(2);
  vline2->SetLineStyle(2);
  vline2->Draw();

}