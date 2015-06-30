
#include "tools.h"
#include <iostream>
#include <fstream>
#include <algorithm>

//---- alsoSevenTeV
//---- 1 = 7+8 TeV
//---- 2 = 8   TeV
//---- 3 = 7   TeV

void drawExpObs(int alsoSevenTeV = 1, std::string category = "0j", float maxX = 15.0) {
 
 TCanvas *cc = new TCanvas("cc","",180,52,550,550);
 
 TTree* limit_0   = (TTree*) _file0->Get("limit");
 TTree* limit_1   = (TTree*) _file1->Get("limit");
 
 int n = 0;
 
 n = limit_0->Draw("2*deltaNLL:CMS_zz4l_GGsm","deltaNLL<100","goff");
 TGraph *graphScan_0 = new TGraph(n,limit_0->GetV2(),limit_0->GetV1());
 graphScan_0->RemovePoint(0);
 moveTGraph(graphScan_0); 
 graphScan_0->SetTitle("");
 graphScan_0->SetMarkerStyle(21);
 graphScan_0->SetLineStyle(2);
 graphScan_0->SetLineWidth(2);
 graphScan_0->SetMarkerColor(kBlue);
 graphScan_0->SetLineColor(kBlue);
 std::cout << " n = " << n << std::endl;
 
 
 n = limit_1->Draw("2*deltaNLL:CMS_zz4l_GGsm","deltaNLL<100","goff");
 TGraph *graphScan_1 = new TGraph(n,limit_1->GetV2(),limit_1->GetV1());
 graphScan_1->RemovePoint(0);
 moveTGraph(graphScan_1);
 graphScan_1->SetTitle("");
 graphScan_1->SetMarkerStyle(21);
 graphScan_1->SetLineWidth(2);
 graphScan_1->SetMarkerColor(kBlack);
 graphScan_1->SetLineColor(kBlack);
 std::cout << " n = " << n << std::endl;
 
 
 
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

 TLatex * tex;
 if      (alsoSevenTeV==1) tex = new TLatex(0.94,0.92,"7+8 TeV");
 else if (alsoSevenTeV==2) tex = new TLatex(0.94,0.92,"8 TeV");
 else if (alsoSevenTeV==3) tex = new TLatex(0.94,0.92,"7 TeV"); 
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
 
 TLatex * tex3;
 if      (alsoSevenTeV==1) tex3 = new TLatex(0.236,0.92,"L = 4.9 + 19.4 fb^{-1}  Preliminary");
 else if (alsoSevenTeV==2) tex3 = new TLatex(0.236,0.92,"L = 19.4 fb^{-1}  Preliminary");
 else if (alsoSevenTeV==3) tex3 = new TLatex(0.236,0.92,"L = 4.9 fb^{-1}  Preliminary");
 tex3->SetNDC();
 tex3->SetTextFont(52);
 tex3->SetTextSize(0.035);
 tex3->SetLineWidth(2);
 
 
 
 
 graphScan_0->Draw("al");
 graphScan_0->GetXaxis()->SetTitle("r = #Gamma/#Gamma_{SM}");
 graphScan_0->GetYaxis()->SetTitle("- 2#Delta logL");
 //  graphScan_0->GetYaxis()->SetRangeUser(0,10);
 //  graphScan_0->GetXaxis()->SetRangeUser(0,(limit_012->GetV2())[n-1]);
 //  graphScan_0->GetXaxis()->SetRangeUser(0,15);
 //  graphScan_0->GetXaxis()->SetRangeUser(0,45);
 
 graphScan_0->GetXaxis()->SetRangeUser(0,maxX);
 graphScan_0->GetYaxis()->SetRangeUser(0,12);
 
 graphScan_1  ->Draw("l");
 
 tex->Draw("same");
 tex2->Draw("same");
 tex3->Draw("same");
 
 //---- legend
 
 leg = new TLegend(0.1,0.7,0.48,0.9);
 leg->AddEntry(graphScan_0,"Expected","l");
 leg->AddEntry(graphScan_1,"Observed","l");
 leg->SetFillColor(0);
 leg->Draw();
 
 
 //  2deltaLogL = 1.00
 //  2deltaLogL = 3.84
 
 double value_x_1sigma = findCrossingOfScan1D(*graphScan_0, 1.00);
 std::cout << " value_x_1sigma = " << value_x_1sigma << std::endl;
 double value_x_2sigma = findCrossingOfScan1D(*graphScan_0, 3.84);
 std::cout << " value_x_2sigma = " << value_x_2sigma << std::endl;
 
 
 TLine *line1 = new TLine(0.0,1.0,std::min(1.*value_x_1sigma, 1.*maxX),1.0);
//  TLine *line1 = new TLine(0.0,1.0,maxX,1.0);
 line1->SetLineWidth(1);
 line1->SetLineStyle(2);
 line1->SetLineColor(kBlue);
 if (value_x_1sigma > 0) line1->Draw(); 
 
 TLine *line2 = new TLine(0.0,3.84,std::min(1.*value_x_2sigma, 1.*maxX),3.84);
//  TLine *line2 = new TLine(0.0,3.84,maxX,3.84);
 line2->SetLineWidth(1);
 line2->SetLineStyle(2);
 line2->SetLineColor(kBlue);
 if (value_x_2sigma > 0) line2->Draw();
 
  
 TLine *vline1 = new TLine(value_x_1sigma,0.0,value_x_1sigma,1.0);
 vline1->SetLineWidth(1);
 vline1->SetLineStyle(2);
 vline1->SetLineColor(kBlue);
 if (value_x_1sigma > 0 && value_x_1sigma < maxX) vline1->Draw(); 
 
 TLine *vline2 = new TLine(value_x_2sigma,0.0,value_x_2sigma,3.84);
 vline2->SetLineWidth(1);
 vline2->SetLineStyle(2);
 vline2->SetLineColor(kBlue);
 if (value_x_2sigma > 0 && value_x_2sigma < maxX) vline2->Draw();
 
 
 
 
 
 
 
 double value_x_1sigma_obs = findCrossingOfScan1D(*graphScan_1, 1.00);
 std::cout << " value_x_1sigma_obs = " << value_x_1sigma_obs << std::endl;
 double value_x_2sigma_obs = findCrossingOfScan1D(*graphScan_1, 3.84);
 std::cout << " value_x_2sigma_obs = " << value_x_2sigma_obs << std::endl;
 
 
 TLine *line1_obs = new TLine(0.0,1.0,std::min(1.*value_x_1sigma_obs, 1.*maxX),1.0);
 //  TLine *line1_obs = new TLine(0.0,1.0,maxX,1.0);
 line1_obs->SetLineWidth(1);
 line1_obs->SetLineStyle(1);
 line1_obs->SetLineColor(kBlack);
 if (value_x_1sigma_obs > 0) line1_obs->Draw(); 
 
 TLine *line2_obs = new TLine(0.0,3.84,std::min(1.*value_x_2sigma_obs, 1.*maxX),3.84);
 //  TLine *line2_obs = new TLine(0.0,3.84,maxX,3.84);
 line2_obs->SetLineWidth(1);
 line2_obs->SetLineStyle(1);
 line2_obs->SetLineColor(kBlack);
 if (value_x_2sigma_obs > 0) line2_obs->Draw();
 
 
 TLine *vline1_obs = new TLine(value_x_1sigma_obs,0.0,value_x_1sigma_obs,1.0);
 vline1_obs->SetLineWidth(1);
 vline1_obs->SetLineStyle(1);
 vline1_obs->SetLineColor(kBlack);
 if (value_x_1sigma_obs > 0 && value_x_1sigma_obs < maxX) vline1_obs->Draw(); 
 
 TLine *vline2_obs = new TLine(value_x_2sigma_obs,0.0,value_x_2sigma_obs,3.84);
 vline2_obs->SetLineWidth(1);
 vline2_obs->SetLineStyle(1);
 vline2_obs->SetLineColor(kBlack);
 if (value_x_2sigma_obs > 0 && value_x_2sigma_obs < maxX) vline2_obs->Draw();
 
 gPad->SetGrid();
 
 cc->SaveAs("cc.png");
 
 
 
 std::ofstream myfile;
 myfile.open ("results.txt",std::ofstream::out | std::ofstream::app);
 myfile << category;
 if      (alsoSevenTeV==1) myfile << " 7+8TeV ";
 else if (alsoSevenTeV==2) myfile << " 8TeV   ";
 else if (alsoSevenTeV==3) myfile << " 7TeV   ";
 myfile << " " << value_x_2sigma << "    "  << value_x_2sigma_obs << std::endl;
 myfile.close(); 
 
 
 
}


