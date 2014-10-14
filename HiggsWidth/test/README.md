Example
====

where:

    cd /afs/cern.ch/user/a/amassiro/work/Latinos/Limit/CMSSW_6_1_1/src/LimitCombine/


Prepare and run:

    cp LimitCombine/HiggsWidth/python/HiggsWidth.py   HiggsAnalysis/CombinedLimit/python/
    
                                                                <-  module           -> <- .py  -> <- class inside ->
    text2workspace.py -m 125.6 LimitCombine/Test/test_dc.txt -P LimitCombine.HiggsWidth.HiggsWidth:higgsWidth         --PO=muFloating -o floatMu_inter.root -v 7
    combine -M MultiDimFit floatMu_inter.root --algo=grid --points 100 -m 125.6 -n 1D_exp_inter_8TeV -t -1 --expectSignal=1 --saveToys -v 3

    
    
    text2workspace.py -m 125.6 LimitCombine/Test/test_dc_2.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth         --PO=is2l2nu     -o floatMu_inter.root
    combine -M MultiDimFit floatMu_inter.root --algo=grid --points 100 -V -t -1 --expectSignal=1 --saveToys 

    scp amassiro@cmsneu.cern.ch:/home/amassiro/Latinos/Shape/playground/Hwidth/0jetDF8TeV.tgz ./
    tar -xf 0jetDF8TeV.tgz
    text2workspace.py -m 125.6 datacards/hww-19.36fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu           -o      model_hwwlvlv.root
    text2workspace.py -m 125.6 datacards/hww-19.36fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRVRFfixed  -o      model_hwwlvlv.root

    combine -M MultiDimFit model_hwwlvlv.root --algo=grid --points 200  -m 125.6                          --saveToys  -n Obs_nLL_scan --setPhysicsModelParameterRanges CMS_ww2l2v_GGsm=0.000001,100
    combine -M MultiDimFit model_hwwlvlv.root --algo=grid --points 200  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_ww2l2v_GGsm=0.000001,100
 
    combine -M MultiDimFit model_hwwlvlv.root --algo=grid --points 200  -m 125.6                                      -n Obs_nLL_scan --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,50
    combine -M MultiDimFit model_hwwlvlv.root --algo=grid --points 200  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,50
 
 

    
    cp LimitCombine/HiggsWidth/python/HiggsWidthStandalone.py   HiggsAnalysis/CombinedLimit/python/
    text2workspace.py -m 125.6 LimitCombine/Test/test_dc_2.txt -P HiggsAnalysis.CombinedLimit.HiggsWidthStandalone:higgswidth         --PO=is2l2nu     -o floatMu_inter.root
    combine -M MultiDimFit floatMu_inter.root --algo=grid --points 100 -V -t -1 --expectSignal=1 --saveToys 

    
Results
====
    
    scp amassiro@cmsneu.cern.ch:/home/amassiro/Latinos/Shape/playground/Hwidth/?jetDF8TeV.tgz ./
    tar -xf 0jetDF8TeV.tgz
    rm -r datacards-0j/; mv datacards/ datacards-0j/
    tar -xf 1jetDF8TeV.tgz
    rm -r datacards-1j/; mv datacards/ datacards-1j/
    tar -xf 2jetDF8TeV.tgz
    rm -r datacards-2j/; mv datacards/ datacards-2j/
    
    combineCards.py   of0j=datacards-0j/hww-19.36fb.mH125.of_0j_shape.txt \
                      of1j=datacards-1j/hww-19.36fb.mH125.of_1j_shape.txt \
                      of2j=datacards-2j/hww-19.36fb.mH125.of_2j_shape.txt \
                      >   hwidth_012jet.txt
    
    
RVRFfixed

    text2workspace.py -m 125.6 datacards-0j/hww-19.36fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_0j_cv_cf_1.root    
    text2workspace.py -m 125.6 datacards-1j/hww-19.36fb.mH125.of_1j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_1j_cv_cf_1.root    
    text2workspace.py -m 125.6 datacards-2j/hww-19.36fb.mH125.of_2j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_2j_cv_cf_1.root    
    text2workspace.py -m 125.6 hwidth_012jet.txt                              -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_012j_cv_cf_1.root  

    
    combine -M MultiDimFit model_hwwlvlv_0j_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.0j.fixmu.root
    
    combine -M MultiDimFit model_hwwlvlv_1j_cv_cf_1.root  --algo=grid --points 10  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.1j.fixmu.root

    combine -M MultiDimFit model_hwwlvlv_2j_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.2j.fixmu.root

    combine -M MultiDimFit model_hwwlvlv_012j_cv_cf_1.root --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60    --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.012j.fixmu.root


    
all floating
    

    text2workspace.py -m 125.6 datacards-0j/hww-19.36fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_0j.root
    text2workspace.py -m 125.6 datacards-1j/hww-19.36fb.mH125.of_1j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_1j.root
    text2workspace.py -m 125.6 datacards-2j/hww-19.36fb.mH125.of_2j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_2j.root
    text2workspace.py -m 125.6 hwidth_012jet.txt                              -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_012.root

    combine -M MultiDimFit model_hwwlvlv_0j.root  --algo=grid --points 200  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,50     
    mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.0j.root
    
    combine -M MultiDimFit model_hwwlvlv_1j.root  --algo=grid --points 200  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,50
    mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.1j.root

    combine -M MultiDimFit model_hwwlvlv_2j.root  --algo=grid --points 200  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,50
    mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.2j.root

    combine -M MultiDimFit model_hwwlvlv_012.root --algo=grid --points 200  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,50
    mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.012j.root
    
    
    

    '--algo=grid -v 7 -S 1 --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1 --freezeNuisances RV,RF
    --redefineSignalPOI CMS_zz4l_GGsm --floatOtherPOI=1 --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60  -t -1 --expectSignal=1


    
    
Plot
====

    r99t higgsCombineTest.MultiDimFit.mH120.123456.root  LimitCombine/HiggsWidth/test/draw.cxx
    
    r99t higgsCombineTest.MultiDimFit.mH125.6.123456.root  LimitCombine/HiggsWidth/test/draw.cxx
    
    r99t higgsCombineTest.MultiDimFit.mH125.6.123456.root  LimitCombine/HiggsWidth/test/draw2D.cxx
    
    r99t higgsCombineTest.MultiDimFit.0j.root  HiggsWidth/test/draw.cxx
    r99t higgsCombineTest.MultiDimFit.1j.root  HiggsWidth/test/draw.cxx
    r99t higgsCombineTest.MultiDimFit.2j.root  HiggsWidth/test/draw.cxx
    
    r99t higgsCombineTest.MultiDimFit.0j.fixmu.root  HiggsWidth/test/draw.cxx
    r99t higgsCombineTest.MultiDimFit.1j.fixmu.root  HiggsWidth/test/draw.cxx
    r99t higgsCombineTest.MultiDimFit.2j.fixmu.root  HiggsWidth/test/draw.cxx
    
    
    

Comparison and combination:

    r99t higgsCombineTest.MultiDimFit.2j.root  LimitCombine/HiggsWidth/test/draw.cxx

    r99t   higgsCombineTest.MultiDimFit.0j.root \
           higgsCombineTest.MultiDimFit.1j.root \
           higgsCombineTest.MultiDimFit.2j.root \
           higgsCombineTest.MultiDimFit.012j.root \
           LimitCombine/HiggsWidth/test/drawCombined.cxx
    
    
    
    r99t   higgsCombineTest.MultiDimFit.0j.fixmu.root \
           higgsCombineTest.MultiDimFit.1j.fixmu.root \
           higgsCombineTest.MultiDimFit.2j.fixmu.root \
           higgsCombineTest.MultiDimFit.012j.fixmu.root \
           LimitCombine/HiggsWidth/test/drawCombined.cxx
    
    r99t   higgsCombineTest.MultiDimFit.0j.fixmu.root \
           higgsCombineTest.MultiDimFit.1j.fixmu.root \
           higgsCombineTest.MultiDimFit.2j.fixmu.root \
           higgsCombineTest.MultiDimFit.012j.fixmu.root \
           HiggsWidth/test/drawCombined.cxx
    
    
    