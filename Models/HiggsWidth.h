

/*****************************************************************************
 * Project: RooFit                                                           *
 *                                                                           *
 * This code was autogenerated by RooClassFactory                            *
 *****************************************************************************/

#ifndef HWW2L2V_ROOHIGGSWIDTHPDF
#define HWW2L2V_ROOHIGGSWIDTHPDF

#include "RooAbsPdf.h"
#include "RooRealProxy.h"
#include "RooRealVar.h"
#include "RooCategoryProxy.h"
#include "RooAbsReal.h"
#include "RooAbsCategory.h"
#include "TH3F.h"
#include "TH1.h"
#include "RooDataHist.h"
#include "RooHistFunc.h"
using namespace RooFit;

class HWW2L2V_RooHiggsWidthPdf : public RooAbsPdf {
protected:
 
 RooRealProxy kd ;
 //  RooRealProxy kdint ;
 //  RooRealProxy ksmd ;
 RooRealProxy fai ;
 RooListProxy _coefList ;  //  List of funcficients
 TIterator* _coefIter ;    //! Iterator over funcficient lis
 Double_t evaluate() const ;
public:
 HWW2L2V_RooHiggsWidthPdf() {} ;
 HWW2L2V_RooHiggsWidthPdf(const char *name, const char *title,
                      RooAbsReal& _kd,
                      //                     RooAbsReal& _kdint,
                      //                                       RooAbsReal& _ksmd,
                      RooAbsReal& _fai,
                      const RooArgList& inCoefList);
 
 HWW2L2V_RooHiggsWidthPdf(const HWW2L2V_RooHiggsWidthPdf& other, const char* name=0) ;
 virtual TObject* clone(const char* newname) const { return new HWW2L2V_RooHiggsWidthPdf(*this,newname); }
 inline virtual ~HWW2L2V_RooHiggsWidthPdf() {}
 
 Int_t getAnalyticalIntegral(RooArgSet& allVars, RooArgSet& analVars, const char* rangeName=0) const ;
 Double_t analyticalIntegral(Int_t code, const char* rangeName=0) const ;
 const RooArgList& coefList() const { return _coefList ; }
 
private:
 
 ClassDef(HWW2L2V_RooHiggsWidthPdf,1) // Your description goes here...
};

#endif
    
    
