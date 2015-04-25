from HiggsAnalysis.CombinedLimit.PhysicsModel import *

### This is the base python class to study the Higgs width

class Higgswidth(PhysicsModel):
    def __init__(self):
        self.mHRange = []
        self.GGsmfixed = False
        self.is2l2nu = False
        self.RVRFfixed = False
        self.RandRVRFfixed = False
        self.poiMap = []
        self.pois = {}
        self.verbose = False
    def setModelBuilder(self, modelBuilder):
        PhysicsModel.setModelBuilder(self,modelBuilder)
        self.modelBuilder.doModelBOnly = False

    def getYieldScale(self,bin,process):
        #if process == "WW": return "WW_func"
       #RF         = 0.0001       +/-  0.00475541        (limited)
       #RV        = 8    +/-  4.19474   (limited)

        if process == "ggH_s": return "ggH_s_func"
        elif process == "ggH_b": return "ggH_b_func"
        elif process == "ggH_sbi": return "ggH_sbi_func"
        if process == "qqH_s": return "qqH_s_func"
        elif process == "qqH_b": return "qqH_b_func"
        elif process == "qqH_sbi": return "qqH_sbi_func"
        elif process in ["ggH","ttH"]:
            if self.RVRFfixed:
                return "R"
            else:
                return "RF"
        elif process in ["qqH","WH","ZH","VH"]:
            if self.RVRFfixed:
                return "R"
            else:
                return "RV"
        elif process in ["qqH2j"]:
            #return "RV"
            return "RV2"
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
            if po == "is2l2nuRandRVRFfixed":
                print "Will make 2l2nu style cards and fix muV and muF and mu, but float GGsm"
                self.is2l2nu = True
                self.RandRVRFfixed = True
                
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
            
    def doParametersOfInterest(self):
        """Create POI and other parameters, and define the POI set."""
        self.modelBuilder.doVar("RWW[1.,0.,8.]")
        self.modelBuilder.out.var("RWW").setRange(0.0001,8.0)
        self.modelBuilder.out.var("RWW").setVal(1)
        #self.modelBuilder.out.var("RWW").setConstant(True)
             
        self.modelBuilder.doVar("dummy[1.,0.,8.]")
        self.modelBuilder.out.var("dummy").setRange(0.0001,8.0)
        self.modelBuilder.out.var("dummy").setVal(0)
        self.modelBuilder.out.var("dummy").setConstant(True)
           
        self.modelBuilder.doVar("RV2[1.,0.,8.]")
        if self.is2l2nu:
            #self.modelBuilder.doVar("CMS_zz4l_GGsm[1.,0.,30.]")
            self.modelBuilder.doVar("CMS_zz4l_GGsm[1.,-30.,30.]")
            self.modelBuilder.doVar("CMS_widthH_kbkg[1.,0.,2.]")
            self.modelBuilder.doVar("R[1.,0.,4.]")
            self.modelBuilder.doVar("RF[1.,0.,4.]")
            self.modelBuilder.doVar("RV[1.,0.,8.]")

            self.modelBuilder.out.var("CMS_widthH_kbkg") # AM # my constraint
            self.modelBuilder.out.var("CMS_widthH_kbkg").setVal(1) # AM # my constraint
            self.modelBuilder.out.var("CMS_widthH_kbkg").setConstant(True) # AM # my constraint
        
        if self.GGsmfixed:
            self.modelBuilder.out.var("CMS_zz4l_GGsm")
            self.modelBuilder.out.var("CMS_zz4l_GGsm").setVal(1)
            self.modelBuilder.out.var("CMS_zz4l_GGsm").setConstant(True)
            print "Fixing CMS_zz4l_GGsm"
            if self.RVRFfixed:
                self.modelBuilder.out.var("RV").setVal(1)
                self.modelBuilder.out.var("RV").setConstant(True)
                self.modelBuilder.out.var("RF").setVal(1)
                self.modelBuilder.out.var("RF").setConstant(True)
                poi = "R"
            else:
                self.modelBuilder.out.var("R").setVal(1)
                self.modelBuilder.out.var("R").setConstant(True)
                poi = "RV,RF"
        else:
            self.modelBuilder.out.var("CMS_zz4l_GGsm").setVal(1)
            self.modelBuilder.out.var("CMS_zz4l_GGsm").setRange(0.0001,30.0001)
            #self.modelBuilder.out.var("CMS_zz4l_GGsm").setRange(-30.0001,30.0001)
            self.modelBuilder.out.var("RF").setVal(1)
            self.modelBuilder.out.var("RV").setVal(1)
            self.modelBuilder.out.var("R").setVal(1)
            #self.RVRFfixed = True
            if self.RVRFfixed:
                self.modelBuilder.out.var("R").setRange(0.0001,4.0)
                self.modelBuilder.out.var("RV").setConstant(True)
                self.modelBuilder.out.var("RF").setConstant(True)
            else:
                #self.modelBuilder.out.var("RV").setRange(0.5,2.0)
                #self.modelBuilder.out.var("RF").setRange(0.5,2.0)
                self.modelBuilder.out.var("RV").setRange(0.0001,8.0)
                self.modelBuilder.out.var("RF").setRange(0.0001,4.0)
                self.modelBuilder.out.var("R").setConstant(True)
                #self.modelBuilder.out.var("RV").setConstant(True)
                #self.modelBuilder.out.var("RF").setConstant(True)
            if self.RandRVRFfixed:
                self.modelBuilder.out.var("R").setConstant(True)
                self.modelBuilder.out.var("RV").setConstant(True)
                self.modelBuilder.out.var("RF").setConstant(True)
                
            #poi = "CMS_zz4l_GGsm,R"
            #poi = "CMS_zz4l_GGsm,RV,RF"
            poi = "CMS_zz4l_GGsm"
            #poi = "CMS_zz4l_GGsm,RF"
            #poi = "CMS_zz4l_GGsm,RV"
            #poi = "RV"
            
        #self.modelBuilder.factory_("expr::ggH_s_func(\"@0\",dummy)")
        #self.modelBuilder.factory_("expr::ggH_b_func(\"@0\",dummy)")
        #self.modelBuilder.factory_("expr::ggH_sbi_func(\"@0\",CMS_zz4l_GGsm)")

        #self.modelBuilder.factory_("expr::qqH_s_func(\"@0\",dummy)")
        #self.modelBuilder.factory_("expr::qqH_b_func(\"@0\",dummy)")
        #self.modelBuilder.factory_("expr::qqH_sbi_func(\"@0\",CMS_zz4l_GGsm)")

        self.modelBuilder.factory_("expr::ggH_s_func(\"@0*@3*@1-sqrt(@0*@3*@1*@2)\",R,CMS_zz4l_GGsm,CMS_widthH_kbkg,RF)")
        self.modelBuilder.factory_("expr::ggH_b_func(\"@2-sqrt(@0*@3*@1*@2)\",R,CMS_zz4l_GGsm,CMS_widthH_kbkg,RF)")
        self.modelBuilder.factory_("expr::ggH_sbi_func(\"sqrt(@0*@3*@1*@2)\",R,CMS_zz4l_GGsm,CMS_widthH_kbkg,RF)")

        self.modelBuilder.factory_("expr::qqH_s_func(\"@0*@2*@1-sqrt(@0*@2*@1)\",R,CMS_zz4l_GGsm,RV)")
        self.modelBuilder.factory_("expr::qqH_b_func(\"1-sqrt(@0*@2*@1)\",R,CMS_zz4l_GGsm,RV)")
        self.modelBuilder.factory_("expr::qqH_sbi_func(\"sqrt(@0*@2*@1)\",R,CMS_zz4l_GGsm,RV)")

        #self.modelBuilder.factory_("expr::WW_func(\"@0\",RWW)")

        #self.modelBuilder.factory_("expr::ggH_s_func(\"@0*@3*sqrt(@1*@1)-sqrt(@0*@3*sqrt(@1*@1)*@2)\",R,CMS_zz4l_GGsm,CMS_widthH_kbkg,RF)")
        #self.modelBuilder.factory_("expr::ggH_b_func(\"@2-sqrt(@0*@3*sqrt(@1*@1)*@2)\",R,CMS_zz4l_GGsm,CMS_widthH_kbkg,RF)")
        #self.modelBuilder.factory_("expr::ggH_sbi_func(\"sqrt(@0*@3*sqrt(@1*@1)*@2)\",R,CMS_zz4l_GGsm,CMS_widthH_kbkg,RF)")

        #self.modelBuilder.factory_("expr::qqH_s_func(\"@0*@2*sqrt(@1*@1)-sqrt(@0*@2*sqrt(@1*@1))\",R,CMS_zz4l_GGsm,RV)")
        #self.modelBuilder.factory_("expr::qqH_b_func(\"1-sqrt(@0*@2*sqrt(@1*@1))\",R,CMS_zz4l_GGsm,RV)")
        #self.modelBuilder.factory_("expr::qqH_sbi_func(\"sqrt(@0*@2*sqrt(@1*@1))\",R,CMS_zz4l_GGsm,RV)")
        
        
        self.modelBuilder.doSet("POI",poi)
        
higgswidth = Higgswidth()


