from HiggsAnalysis.CombinedLimit.PhysicsModel import *
from HiggsAnalysis.CombinedLimit.SMHiggsBuilder import SMHiggsBuilder
import ROOT, os

### This is the base python class to study the Higgs width
class Higgswidth(PhysicsModel):
    def __init__(self):
        self.mHRange = []
        self.GGsmfixed = False
        self.is2l2nu = False
        self.RVRFfixed = False
        self.useKframework = False
        self.notCustodial = False
        self.poiMap = []
        self.pois = {}
        self.verbose = False
    def setModelBuilder(self, modelBuilder):
        PhysicsModel.setModelBuilder(self,modelBuilder)
        self.modelBuilder.doModelBOnly = False

    def getYieldScale(self,bin,process):
        if "hww" in bin: 
          if process == "ggH_s": return "ggH_s_funcWW"
          elif process == "ggH_b": return "ggH_b_funcWW"
          elif process == "ggH_sbi": return "ggH_sbi_funcWW"
          elif process == "qqH_s": return "qqH_s_funcWW"
          elif process == "qqH_b": return "qqH_b_funcWW"
          elif process == "qqH_sbi": return "qqH_sbi_funcWW"
        else:
          if process == "ggH_s": return "ggH_s_func"
          elif process == "ggH_b": return "ggH_b_func"
          elif process == "ggH_sbi": return "ggH_sbi_func"
          elif process == "qqH_s": return "qqH_s_func"
          elif process == "qqH_b": return "qqH_b_func"
          elif process == "qqH_sbi": return "qqH_sbi_func"

        if process in ["ggH","ttH"]:
           if "hww" in bin:
              if self.RVRFfixed:
                return "R"
              else:
                return "kgluon"
           else:
              if self.RVRFfixed:
                return "R_ZZ"
              else:
                return "kgluon_ZZ"
        elif process in ["qqH","WH","ZH","VH"]:
          if "hww" in bin:
            if self.RVRFfixed:
                return "R"
            else:
                return "kV"
          else:
            if self.RVRFfixed:
                return "R_ZZ"
            else:
                return "kV_ZZ"
        else:
            return 1
            
    def setPhysicsOptions(self,physOptions):
        for po in physOptions:
            if po == "GGsmfixed":
                print "Will fix CMS_zz4l_GGsm to 1 and float muV and muF"
                self.GGsmfixed = True
            if po == "RVRFfixed":
                print "Will fix muV and muF to 1 and float mu"
                self.RVRFfixed = True
            if po == "is2l2nu":
                print "Will make 2l2nu style cards and float muV and muF"
                self.is2l2nu = True
                
            if po == "GGsmRVRFfixed":
                print "Will fix CMS_zz4l_GGsm to 1 and float mu"
                self.GGsmfixed = True
                self.RVRFfixed = True
            if po == "is2l2nuRVRFfixed":
                print "Will make 2l2nu style cards and float mu"
                self.is2l2nu = True
                self.RVRFfixed = True
            if po == "is2l2nuGGsmfixed":
                print "Will make 2l2nu style cards, fix GGsm to 1 and float muV and muF"
                self.is2l2nu = True
                self.GGsmfixed = True
            if po == "is2l2nuGGsmRVRFfixed":
                print "Will make 2l2nu style cards, fix GGsm to 1 and float mu"
                self.is2l2nu = True
                self.RVRFfixed = True
                self.GGsmfixed = True
            if po == "useKframework":
                self.useKframework=True
                self.GGsmfixed=True
            if po == "notCustodial":
                self.notCustodial = True 

    def doParametersOfInterest(self):
        """Create POI and other parameters, and define the POI set."""

        self.modelBuilder.doVar("lambdaWZ[1.,0.,2.]")
        if self.notCustodial :
          print "Removing Custodial symmetry"
        else:
          self.modelBuilder.out.var("lambdaWZ").setVal(1.0)
          self.modelBuilder.out.var("lambdaWZ").setConstant(True)

        if self.is2l2nu:
            #self.modelBuilder.factory_('sum::c7_Gscal_tot(c7_Gscal_Vectors, c7_Gscal_tau, c7_Gscal_top, c7_Gscal_bottom, c7_Gscal_gluon, c7_Gscal_gamma)')
            self.modelBuilder.doVar("CMS_widthH_kbkg[1.,0.,2.]")
            self.modelBuilder.doVar("R[1.,0.,4.]")
            self.modelBuilder.doVar("kgluon[1.,0.,4.]")
            self.modelBuilder.doVar("kV[1.,0.,8.]")
            self.modelBuilder.doVar("CMS_zz4l_GGsm[1.,0.,30.]")
            #self.modelBuilder.doVar("kV[0.0,0.0,1.0]") 
            self.modelBuilder.doVar("ktau[0.0,0.0,2.0]")
            self.modelBuilder.doVar("ktop[0.0,0.0,4.0]")
            self.modelBuilder.doVar("kbottom[0.0,0.0,3.0]")
            #self.modelBuilder.doVar("kgluon[0.0,0.0,2.0]")
            self.modelBuilder.doVar("kgamma[0.0,0.0,2.5]")
            #self.modelBuilder.doVar("BRInvUndet[0,0,1]")
            self.modelBuilder.doVar("CMS_zz4l_scalerK[1.0,0.0,1.0]")

        if self.useKframework:
            self.modelBuilder.out.var("CMS_zz4l_scalerK").setVal(0.0)
        else:
            self.modelBuilder.out.var("CMS_zz4l_scalerK").setVal(1.0)
            if not self.is2l2nu:
                self.modelBuilder.out.var("SM_BR_hww").setVal(0.0)
                self.modelBuilder.out.var("SM_BR_hww").setConstant(True)
                self.modelBuilder.out.var("SM_BR_hzz").setVal(0.0)
                self.modelBuilder.out.var("SM_BR_hzz").setConstant(True)
                self.modelBuilder.out.var("SM_BR_htt").setVal(0.0)
                self.modelBuilder.out.var("SM_BR_hmm").setVal(0.0)
                self.modelBuilder.out.var("SM_BR_htt").setConstant(True)
                self.modelBuilder.out.var("SM_BR_hmm").setConstant(True)
                self.modelBuilder.out.var("SM_BR_htoptop").setVal(0.0)
                self.modelBuilder.out.var("SM_BR_hcc").setVal(0.0)
                self.modelBuilder.out.var("SM_BR_htoptop").setConstant(True)
                self.modelBuilder.out.var("SM_BR_hcc").setConstant(True)
                self.modelBuilder.out.var("SM_BR_hbb").setVal(0.0)
                self.modelBuilder.out.var("SM_BR_hss").setVal(0.0)
                self.modelBuilder.out.var("SM_BR_hbb").setConstant(True)
                self.modelBuilder.out.var("SM_BR_hss").setConstant(True)
                self.modelBuilder.out.var("SM_BR_hgluglu").setVal(0.0)
                self.modelBuilder.out.var("SM_BR_hgg").setVal(0.0)
                self.modelBuilder.out.var("SM_BR_hgluglu").setConstant(True)
                self.modelBuilder.out.var("SM_BR_hgg").setConstant(True)
                self.modelBuilder.out.var("SM_BR_hzg").setVal(0.0)
                self.modelBuilder.out.var("SM_BR_hzg").setConstant(True)

        self.modelBuilder.out.var("CMS_zz4l_scalerK").setConstant(True)

	if self.GGsmfixed:
            self.modelBuilder.out.var("CMS_zz4l_GGsm")
	    self.modelBuilder.out.var("CMS_zz4l_GGsm").setVal(1)
	    self.modelBuilder.out.var("CMS_zz4l_GGsm").setConstant(True)
            print "Fixing CMS_zz4l_GGsm"
            if self.RVRFfixed:
                self.modelBuilder.out.var("kV").setVal(1)
                self.modelBuilder.out.var("kV").setConstant(True)
                self.modelBuilder.out.var("kgluon").setVal(1)
                self.modelBuilder.out.var("kgluon").setConstant(True)
                poi = "R"
            else:
                self.modelBuilder.out.var("R").setVal(1)
                self.modelBuilder.out.var("R").setConstant(True)
                poi = "kV,kgluon"
        else:
	    #self.modelBuilder.out.var("CMS_zz4l_GGsm").setVal(1)
            #self.modelBuilder.out.var("CMS_zz4l_GGsm").setRange(0.0001,30.0001)
            self.modelBuilder.out.var("kgluon").setVal(1)
	    self.modelBuilder.out.var("kV").setVal(1)
	    self.modelBuilder.out.var("R").setVal(1)
            self.modelBuilder.out.var("CMS_widthH_kbkg")
	    self.modelBuilder.out.var("CMS_widthH_kbkg").setVal(1)
            if self.RVRFfixed:
                self.modelBuilder.out.var("R").setRange(0.0,4.0)
                self.modelBuilder.out.var("kV").setConstant(True)
                self.modelBuilder.out.var("kgluon").setConstant(True)
            else:
                self.modelBuilder.out.var("kV").setRange(0.0,8.0)
                self.modelBuilder.out.var("kgluon").setRange(0.0,4.0)
                self.modelBuilder.out.var("R").setConstant(True)
            poi = "CMS_zz4l_GGsm"

        self.modelBuilder.doSet("POI",poi)

        self.modelBuilder.doVar("MH[%g]" % self.options.mass) 
        self.SMH = SMHiggsBuilder(self.modelBuilder)
        for d in [ "htt", "hbb", "hcc", "hww", "hzz", "hgluglu", "htoptop", "hgg", "hzg", "hmm", "hss" ]: self.SMH.makeBR(d)

        if self.is2l2nu:
                
            self.modelBuilder.factory_('expr::CMS_zz4l_Gscal_Vectors("@0*@0 * (@1+@2)*abs(1-@3)", kV, SM_BR_hzz, SM_BR_hww, CMS_zz4l_scalerK)')
            self.modelBuilder.factory_('expr::CMS_zz4l_Gscal_tau("@0*@0 * (@1+@2)*abs(1-@3)", ktau, SM_BR_htt, SM_BR_hmm, CMS_zz4l_scalerK)')
            self.modelBuilder.factory_('expr::CMS_zz4l_Gscal_top("@0*@0 * (@1+@2)*abs(1-@3)", ktop, SM_BR_htoptop, SM_BR_hcc, CMS_zz4l_scalerK)')
            self.modelBuilder.factory_('expr::CMS_zz4l_Gscal_bottom("@0*@0 * (@1+@2)*abs(1-@3)", kbottom, SM_BR_hbb, SM_BR_hss, CMS_zz4l_scalerK)')
            self.modelBuilder.factory_('expr::CMS_zz4l_Gscal_gluon("@0*@0 * @1*abs(1-@2)", kgluon, SM_BR_hgluglu, CMS_zz4l_scalerK)')
            self.modelBuilder.factory_('expr::CMS_zz4l_Gscal_gamma("@0*@0 * (@1+@2)*abs(1-@3)", kgamma, SM_BR_hgg, SM_BR_hzg, CMS_zz4l_scalerK)')           
            self.modelBuilder.factory_('sum::gammaK(CMS_zz4l_Gscal_Vectors, CMS_zz4l_Gscal_tau, CMS_zz4l_Gscal_top, CMS_zz4l_Gscal_bottom, CMS_zz4l_Gscal_gluon, CMS_zz4l_Gscal_gamma, CMS_zz4l_scalerK)')

        self.modelBuilder.factory_("expr::kgluon_ZZ(\"@0*@1\",kgluon,lambdaWZ)")
        self.modelBuilder.factory_("expr::kV_ZZ(\"@0*@1\",kV,lambdaWZ)")  
        self.modelBuilder.factory_("expr::R_ZZ(\"@0*@1\",R,lambdaWZ)")

        self.modelBuilder.factory_("expr::ggH_s_func(\"@0*@3*@1*@4-sqrt(@0*@3*@1*@4*@2)\",R,CMS_zz4l_GGsm,CMS_widthH_kbkg,kgluon_ZZ,gammaK)")
        self.modelBuilder.factory_("expr::ggH_b_func(\"@2-sqrt(@0*@3*@1*@4*@2)\",R,CMS_zz4l_GGsm,CMS_widthH_kbkg,kgluon_ZZ,gammaK)")
        self.modelBuilder.factory_("expr::ggH_sbi_func(\"sqrt(@0*@3*@1*@4*@2)\",R,CMS_zz4l_GGsm,CMS_widthH_kbkg,kgluon_ZZ,gammaK)")

        self.modelBuilder.factory_("expr::qqH_s_func(\"@0*@2*@1*@3-sqrt(@0*@2*@1*@3)\",R,CMS_zz4l_GGsm,kV_ZZ,gammaK)")
        self.modelBuilder.factory_("expr::qqH_b_func(\"1-sqrt(@0*@2*@1*@3)\",R,CMS_zz4l_GGsm,kV_ZZ,gammaK)")
        self.modelBuilder.factory_("expr::qqH_sbi_func(\"sqrt(@0*@2*@1*@3)\",R,CMS_zz4l_GGsm,kV_ZZ,gammaK)")

        # No CMS_widthH_kbkg uncertainty for WW
        self.modelBuilder.factory_("expr::ggH_s_funcWW(\"1./1.035*@0*@2*@1*@3-sqrt(1./1.035*@0*@2*@1*@3)\",R,CMS_zz4l_GGsm,kgluon,gammaK)")
        self.modelBuilder.factory_("expr::ggH_b_funcWW(\"1-sqrt(1./1.035*@0*@2*@1*@3)\",R,CMS_zz4l_GGsm,kgluon,gammaK)")
        self.modelBuilder.factory_("expr::ggH_sbi_funcWW(\"sqrt(1./1.035*@0*@2*@1*@3)\",R,CMS_zz4l_GGsm,kgluon,gammaK)")

        self.modelBuilder.factory_("expr::qqH_s_funcWW(\"1./1.041*@0*@2*@1*@3-sqrt(1./1.041*@0*@2*@1*@3)\",R,CMS_zz4l_GGsm,kV,gammaK)")
        self.modelBuilder.factory_("expr::qqH_b_funcWW(\"1-sqrt(1./1.041*@0*@2*@1*@3)\",R,CMS_zz4l_GGsm,kV,gammaK)")
        self.modelBuilder.factory_("expr::qqH_sbi_funcWW(\"sqrt(1./1.041*@0*@2*@1*@3)\",R,CMS_zz4l_GGsm,kV,gammaK)")

        #self.modelBuilder.factory_("expr::ggH_b_funcWW(\"1-sqrt(@0*@2*@1*@3)\",R,CMS_zz4l_GGsm,kgluon,gammaK)")
        #self.modelBuilder.factory_("expr::ggH_s_funcWW(\"@0*@2*@1*@3-sqrt(@0*@2*@1*@3)\",R,CMS_zz4l_GGsm,kgluon,gammaK)")
        #self.modelBuilder.factory_("expr::ggH_sbi_funcWW(\"sqrt(@0*@2*@1*@3)\",R,CMS_zz4l_GGsm,kgluon,gammaK)")

        #self.modelBuilder.factory_("expr::qqH_s_funcWW(\"@0*@2*@1*@3-sqrt(@0*@2*@1*@3)\",R,CMS_zz4l_GGsm,kV,gammaK)")
        #self.modelBuilder.factory_("expr::qqH_b_funcWW(\"1-sqrt(@0*@2*@1*@3)\",R,CMS_zz4l_GGsm,kV,gammaK)")
        #self.modelBuilder.factory_("expr::qqH_sbi_funcWW(\"sqrt(@0*@2*@1*@3)\",R,CMS_zz4l_GGsm,kV,gammaK)")

        
higgswidth = Higgswidth()
