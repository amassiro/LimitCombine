#include "Riostream.h"
#include "../interface/HiggsWidth.h"
#include "RooAbsReal.h"
#include "RooAbsCategory.h"
#include <math.h>
#include "TMath.h"
#include "TH3F.h"
#include "TAxis.h"
#include "RooDataHist.h"
 
using namespace TMath;


ClassImp(HiggsWidth)
 
HiggsWidth::HiggsWidth(const char *name, const char *title,
                                             RooAbsReal& GoverGSM,
                                             const RooArgList& inCoefList):
   RooAbsPdf(name,title),
   _GoverGSM("GoverGSM","GoverGSM",this,GoverGSM),
  _coefList("coefList","List of coefficients",this)
 
{
 TIterator* coefIter = inCoefList.createIterator() ;
 RooAbsArg* func;
 while((func = (RooAbsArg*)coefIter->Next())) {
  if (!dynamic_cast<RooAbsReal*>(func)) {
   coutE(InputArguments) << "ERROR: :HiggsWidth(" << GetName() << ") coefficients " << func->GetName() << " is not of type RooAbsReal" << endl;
   assert(0);
  }
  _coefList.add(*func) ;
 }
 delete coefIter;
 
 _coefIter = _coefList.createIterator() ;
}

 
HiggsWidth::HiggsWidth(const HiggsWidth& other, const char* name) :  
 RooAbsPdf(other,name),
 _GoverGSM("_GoverGSM",this,other._GoverGSM),
 _coefList("coefList",this,other._coefList)
 
{
  _coefIter = _coefList.createIterator() ;
}
 
 
Double_t HiggsWidth::evaluate() const
{
   double value = 0.;
       
//               0.125 -0.250  0.125
//    A-1 =     -1.000  1.500 -0.500
//               1.875 -1.250  0.375
   
   
   
   
   Double_t P1  = dynamic_cast<const RooHistFunc*>(_coefList.at(0))->getVal();
   Double_t P9  = dynamic_cast<const RooHistFunc*>(_coefList.at(1))->getVal();
   Double_t P25 = dynamic_cast<const RooHistFunc*>(_coefList.at(2))->getVal();

//    value = (1.-fabs(GoverGSM)) * T1 + fabs(GoverGSM) * T2 + mysgn*sqrt((1.-fabs(GoverGSM))*fabs(GoverGSM)) * T4;

   Double_t S =  0.125 * P1 -0.250 *P9 + 0.125 * P25;
   Double_t B = -1.000 * P1 +1.500 *P9 - 0.500 * P25;
   Double_t I =  1.875 * P1 -1.250 *P9 + 0.375 * P25;
   
   value = _GoverGSM * S + sqrt(fabs(_GoverGSM)) * I +  B;
   
   if ( value <= 0.) return 1.0e-200;
   
   return value ;
   
}
 
Int_t HiggsWidth::getAnalyticalIntegral(RooArgSet& allVars, RooArgSet& analVars, const char* /*rangeName*/) const
{
 
//   if (matchArgs(allVars,analVars,kd)) return 4 ;
 
  return 0 ;
 
}
 
Double_t HiggsWidth::analyticalIntegral(Int_t code, const char* rangeName) const
{
  double Int_P1  = dynamic_cast<const RooHistFunc*>(_coefList.at(0))-> analyticalIntegral(1000);
  double Int_P9  = dynamic_cast<const RooHistFunc*>(_coefList.at(1))-> analyticalIntegral(1000);
  double Int_P25 = dynamic_cast<const RooHistFunc*>(_coefList.at(2))-> analyticalIntegral(1000);
   
  Double_t Int_S =  0.125 * Int_P1 -0.250 *Int_P9 + 0.125 * Int_P25;
  Double_t Int_B = -1.000 * Int_P1 +1.500 *Int_P9 - 0.500 * Int_P25;
  Double_t Int_I =  1.875 * Int_P1 -1.250 *Int_P9 + 0.375 * Int_P25;
  
  double integral = _GoverGSM * Int_S + sqrt(fabs(_GoverGSM)) * Int_I +  Int_B;
  
  return integral;
  
  assert(0) ;
  return 0 ;
}










