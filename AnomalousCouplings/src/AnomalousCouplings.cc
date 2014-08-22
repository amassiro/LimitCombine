#include "Riostream.h"
#include "../interface/AnomalousCouplings.h"
#include "RooAbsReal.h"
#include "RooAbsCategory.h"
#include <math.h>
#include "TMath.h"
#include "TH3F.h"
#include "TAxis.h"
#include "RooDataHist.h"
 
using namespace TMath;


ClassImp(AnomalousCouplings)
 
AnomalousCouplings::AnomalousCouplings(const char *name, const char *title,
                                             RooAbsReal& _kd,
                                             RooAbsReal& _fai,
                                             const RooArgList& inCoefList):
   RooAbsPdf(name,title),
   kd("kd","kd",this,_kd),
   fai("fai","fai",this,_fai),
  _coefList("coefList","List of funcficients",this)
 
{
 TIterator* coefIter = inCoefList.createIterator() ;
 RooAbsArg* func;
 while((func = (RooAbsArg*)coefIter->Next())) {
  if (!dynamic_cast<RooAbsReal*>(func)) {
   coutE(InputArguments) << "ERROR: :AnomalousCouplings(" << GetName() << ") funcficient " << func->GetName() << " is not of type RooAbsReal" << endl;
   assert(0);
  }
  _coefList.add(*func) ;
 }
 delete coefIter;
 
 _coefIter = _coefList.createIterator() ;
}

 
AnomalousCouplings::AnomalousCouplings(const AnomalousCouplings& other, const char* name) :  
 RooAbsPdf(other,name),
 kd("kd",this,other.kd),
 fai("fai",this,other.fai),
 _coefList("coefList",this,other._coefList)
 
 {
  _coefIter = _coefList.createIterator() ;
 }
 
 
Double_t AnomalousCouplings::evaluate() const
{
   double value = 0.;
 
       
   Double_t T1 = dynamic_cast<const RooHistFunc*>(_coefList.at(0))->getVal();
   Double_t T2 = dynamic_cast<const RooHistFunc*>(_coefList.at(1))->getVal();
   Double_t T4 = dynamic_cast<const RooHistFunc*>(_coefList.at(2))->getVal();
   double mysgn = 1;
 
   if(fai < 0.)
     {
       mysgn = -1.;
     }
   
   value = (1.-fabs(fai)) * T1 + fabs(fai) * T2 + mysgn*sqrt((1.-fabs(fai))*fabs(fai)) * T4;
   
   if ( value <= 0.) return 1.0e-200;
   
   return value ;
   
}
 
Int_t AnomalousCouplings::getAnalyticalIntegral(RooArgSet& allVars, RooArgSet& analVars, const char* /*rangeName*/) const
{
 
  if (matchArgs(allVars,analVars,kd)) return 4 ;

  return 0 ;
 
}
 
Double_t AnomalousCouplings::analyticalIntegral(Int_t code, const char* rangeName) const
{
  double Int_T1  = dynamic_cast<const RooHistFunc*>(_coefList.at(0))-> analyticalIntegral(1000);
  double Int_T2  = dynamic_cast<const RooHistFunc*>(_coefList.at(1))-> analyticalIntegral(1000);
  double Int_T4  = dynamic_cast<const RooHistFunc*>(_coefList.at(2))-> analyticalIntegral(1000);
  
  
  double mysgn = 1.;
  if(fai < 0.)
  {
   mysgn = -1.;
  }
  
  double integral = (1.-fabs(fai)) * Int_T1 + fabs(fai) * Int_T2 + mysgn*sqrt((1.-fabs(fai))*fabs(fai)) * Int_T4; ;
  
  return integral;
  
  assert(0) ;
  return 0 ;
}










