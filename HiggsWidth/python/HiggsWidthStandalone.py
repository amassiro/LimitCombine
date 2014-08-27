from HiggsAnalysis.CombinedLimit.PhysicsModel import *
 
### This is the base python class to study the Higgs width
 
class Higgswidth(PhysicsModel):
    def __init__(self):
        self.mHRange = []
        self.GGsmfixed = False
        self.is2l2nu = False
        self.poiMap = []
        self.pois = {}
        self.verbose = False
    def setModelBuilder(self, modelBuilder):
        PhysicsModel.setModelBuilder(self,modelBuilder)
        self.modelBuilder.doModelBOnly = False
 
    def getYieldScale(self,bin,process):
        if process == "ggH_s": return "ggH_s_func"
        elif process == "ggH_b": return "ggH_b_func"
        elif process == "ggH_sbi": return "ggH_sbi_func"
        if process == "qqH_s": return "qqH_s_func"
        elif process == "qqH_b": return "qqH_b_func"
        elif process == "qqH_sbi": return "qqH_sbi_func"
        elif process in ["ggH","qqH","ttH","WH","ZH","VH"]: return "CMS_wwlvlv_mu"
        else:
            return 1
           
    def setPhysicsOptions(self,physOptions):
        for po in physOptions:
            if po == "GGsmfixed":
                print "Will fix CMS_wwlvlv_GGsm to 1 and float mu"
                self.GGsmfixed = True
            if po == "is2l2nu":
                print "Will consider cards in 2l2nu style (separated S, B, S+B+I)"
                self.is2l2nu = True
           
    def doParametersOfInterest(self):
        """Create POI and other parameters, and define the POI set."""
        if self.is2l2nu:
            self.modelBuilder.doVar("CMS_wwlvlv_GGsm[1.,0.,50.]")
            self.modelBuilder.doVar("CMS_wwlvlv_mu[1.,0.,4]")
            self.modelBuilder.doVar("CMS_widthH_kbkg[1.,0.,2.]")
       
        if self.GGsmfixed:
            self.modelBuilder.out.var("CMS_wwlvlv_GGsm")
            self.modelBuilder.out.var("CMS_wwlvlv_GGsm").setVal(1)
            self.modelBuilder.out.var("CMS_wwlvlv_GGsm").setConstant(True)
            self.modelBuilder.out.var("CMS_wwlvlv_mu")
            print "Fixing CMS_wwlvlv_GGsm"
            poi = "CMS_wwlvlv_mu"
        else:
            self.modelBuilder.out.var("CMS_wwlvlv_GGsm")
            self.modelBuilder.out.var("CMS_wwlvlv_GGsm").setVal(1)
            self.modelBuilder.out.var("CMS_wwlvlv_mu")
            self.modelBuilder.out.var("CMS_wwlvlv_mu").setVal(1)
            poi = "CMS_wwlvlv_GGsm"
 
        self.modelBuilder.factory_("expr::ggH_s_func(\"@0*@1-sqrt(@0*@1*@2)\",CMS_wwlvlv_mu,CMS_wwlvlv_GGsm,CMS_widthH_kbkg)")
        self.modelBuilder.factory_("expr::ggH_b_func(\"@2-sqrt(@0*@1*@2)\",CMS_wwlvlv_mu,CMS_wwlvlv_GGsm,CMS_widthH_kbkg)")
        self.modelBuilder.factory_("expr::ggH_sbi_func(\"sqrt(@0*@1*@2)\",CMS_wwlvlv_mu,CMS_wwlvlv_GGsm,CMS_widthH_kbkg)")
 
        self.modelBuilder.factory_("expr::qqH_s_func(\"@0*@1-sqrt(@0*@1)\",CMS_wwlvlv_mu,CMS_wwlvlv_GGsm)")
        self.modelBuilder.factory_("expr::qqH_b_func(\"1-sqrt(@0*@1)\",CMS_wwlvlv_mu,CMS_wwlvlv_GGsm)")
        self.modelBuilder.factory_("expr::qqH_sbi_func(\"sqrt(@0*@1)\",CMS_wwlvlv_mu,CMS_wwlvlv_GGsm)")
       
       
        self.modelBuilder.doSet("POI",poi)
       
higgswidth = Higgswidth()