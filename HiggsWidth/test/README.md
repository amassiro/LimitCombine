Example
====

where:

    cd /afs/cern.ch/user/a/amassiro/work/Latinos/Limit/CMSSW_6_1_1/src/LimitCombine/



Everything in 2 scripts:

    create workspace and run likelihood scan:
    sh HiggsWidth/test/limitAndPlotForPaper.sh
    
    draw plot and get numbers:
    sh HiggsWidth/test/PlotForPaper.sh
    
    
OLD
====
    
    
Preparation:

    Higgs combine installation from
    https://twiki.cern.ch/twiki/bin/view/CMS/SWGuideHiggsAnalysisCombinedLimit#GIT_recipe_the_only_supported_re

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

    combineCards.py   of0j=datacards-0j/hww-19.36fb.mH125.of_0j_shape.txt \
                      of1j=datacards-1j/hww-19.36fb.mH125.of_1j_shape.txt \
                      >   hwidth_01jet.txt


    scp amassiro@cmsneu.cern.ch:/home/amassiro/Latinos/Shape/playground/Hwidth/?jetDF8TeVSimple.tgz ./
    tar -xf 0jetDF8TeVSimple.tgz
    rm -r datacards-0j-Simple/; mv datacards/ datacards-0j-Simple/
    tar -xf 1jetDF8TeVSimple.tgz
    rm -r datacards-1j-Simple/; mv datacards/ datacards-1j-Simple/

    combineCards.py   of0j=datacards-0j-Simple/hww-19.36fb.mH125.of_0j_shape.txt \
                      of1j=datacards-1j-Simple/hww-19.36fb.mH125.of_1j_shape.txt \
                      of2j=datacards-2j-Simple/hww-19.36fb.mH125.of_2j_shape.txt \
                      >   hwidth_012jet_simple.txt

    combineCards.py   of0j=datacards-0j-Simple/hww-19.36fb.mH125.of_0j_shape.txt \
                      of1j=datacards-1j-Simple/hww-19.36fb.mH125.of_1j_shape.txt \
                      >   hwidth_01jet_simple.txt





RVRFfixed

    text2workspace.py -m 125.6 datacards-0j/hww-19.36fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_0j_cv_cf_1.root    
    text2workspace.py -m 125.6 datacards-1j/hww-19.36fb.mH125.of_1j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_1j_cv_cf_1.root    
    text2workspace.py -m 125.6 datacards-2j/hww-19.36fb.mH125.of_2j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_2j_cv_cf_1.root    
    text2workspace.py -m 125.6 hwidth_012jet.txt                              -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_012j_cv_cf_1.root  
    text2workspace.py -m 125.6 hwidth_01jet.txt                               -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_01j_cv_cf_1.root  


    combine -M MultiDimFit model_hwwlvlv_0j_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.0j.fixmu.root

    combine -M MultiDimFit model_hwwlvlv_1j_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.1j.fixmu.root

    combine -M MultiDimFit model_hwwlvlv_2j_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.2j.fixmu.root

    combine -M MultiDimFit model_hwwlvlv_012j_cv_cf_1.root --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60    --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.012j.fixmu.root

    combine -M MultiDimFit model_hwwlvlv_01j_cv_cf_1.root --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60    --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.01j.fixmu.root


for spin analysis 

    text2workspace.py -m 125.6 datacards-spin-0j/hww-19.47fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_0j_spin.root
    text2workspace.py -m 125.6 datacards-spin-0j/hww-19.47fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuGGsmRVRFfixed  -o      model_hwwlvlv_0j_spin.root

    combine model_hwwlvlv_0j_spin.root -M GenerateOnly -t 1 --saveToys -s -1  --expectSignal 1   --setPhysicsModelParameters CMS_zz4l_GGsm=50  

    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s -1  --expectSignal 1   --setPhysicsModelParameters CMS_zz4l_GGsm=50  
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s 12345  --setPhysicsModelParameters CMS_zz4l_GGsm=50  
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s 12345  --algo=grid --points 240      --setPhysicsModelParameters CMS_zz4l_GGsm=50    --verbose -1
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s 12345  --algo=grid --points 240      --setPhysicsModelParameters CMS_zz4l_GGsm=50    --verbose 300 &> tmp.txt
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s 12345   --toysFrequentist     --setPhysicsModelParameters CMS_zz4l_GGsm=1    --verbose 300 &> tmp.1.txt
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s 12345   --toysFrequentist     --setPhysicsModelParameters CMS_zz4l_GGsm=5    --verbose 300 &> tmp.5.txt
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s 12345   --toysFrequentist     --setPhysicsModelParameters CMS_zz4l_GGsm=10   --verbose 300 &> tmp.10.txt
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s 12345   --toysFrequentist     --setPhysicsModelParameters CMS_zz4l_GGsm=50   --verbose 300 &> tmp.50.txt
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s 12345   --toysFrequentist     --setPhysicsModelParameters CMS_zz4l_GGsm=100  --verbose 300 &> tmp.100.txt

    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s 12345   --toysFrequentist     --setPhysicsModelParameters CMS_zz4l_GGsm=1    --verbose 300 &> tmp.A.txt
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s 12345   --toysFrequentist     --setPhysicsModelParameters CMS_zz4l_GGsm=5    --verbose 300 &> tmp.B.txt
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s 12345   --toysFrequentist     --setPhysicsModelParameters CMS_zz4l_GGsm=10   --verbose 300 &> tmp.C.txt
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s 12345   --toysFrequentist     --setPhysicsModelParameters CMS_zz4l_GGsm=50   --verbose 300 &> tmp.D.txt
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s 12345   --toysFrequentist     --setPhysicsModelParameters CMS_zz4l_GGsm=100  --verbose 300 &> tmp.E.txt

    
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit   --setPhysicsModelParameters CMS_zz4l_GGsm=1  --toysFile higgsCombineTest.GenerateOnly.mH120.199111213.root
        
        
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s -1 --toysNoSystematics   --setPhysicsModelParameters CMS_zz4l_GGsm=1    --verbose 300 &> tmp.A.txt
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s -1 --toysNoSystematics   --setPhysicsModelParameters CMS_zz4l_GGsm=5    --verbose 300 &> tmp.B.txt
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s -1 --toysNoSystematics   --setPhysicsModelParameters CMS_zz4l_GGsm=10   --verbose 300 &> tmp.C.txt
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s -1 --toysNoSystematics   --setPhysicsModelParameters CMS_zz4l_GGsm=50   --verbose 300 &> tmp.D.txt
    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s -1 --toysNoSystematics   --setPhysicsModelParameters CMS_zz4l_GGsm=100  --verbose 300 &> tmp.E.txt

    combine model_hwwlvlv_0j_spin.root -M MultiDimFit -t 1 --saveToys -s -1 --toysNoSystematics   --setPhysicsModelParameters CMS_norm_0j_WW=2  --verbose 300 &> tmp.E.txt

    
    cat tmp.*.txt | grep "CMS_norm_0j_WW" | grep "+/-" | grep -v RooRealVar
    cat tmp.*.txt | grep "R" | grep "+/-" | grep -v RooRealVar | grep limited


    
    
all floating


    text2workspace.py -m 125.6 datacards-0j/hww-19.36fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_0j.root
    text2workspace.py -m 125.6 datacards-1j/hww-19.36fb.mH125.of_1j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_1j.root
    text2workspace.py -m 125.6 datacards-2j/hww-19.36fb.mH125.of_2j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_2j.root
    text2workspace.py -m 125.6 hwidth_012jet.txt                              -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_012.root
    text2workspace.py -m 125.6 hwidth_01jet.txt                               -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_01.root

    combine -M MultiDimFit model_hwwlvlv_0j.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60          --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.0j.root

    combine -M MultiDimFit model_hwwlvlv_1j.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.1j.root

    combine -M MultiDimFit model_hwwlvlv_2j.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.2j.root

    combine -M MultiDimFit model_hwwlvlv_012.root --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.012j.root

    combine -M MultiDimFit model_hwwlvlv_01.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.01j.root



    '--algo=grid -v 7 -S 1 --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1 --freezeNuisances RV,RF
    --redefineSignalPOI CMS_zz4l_GGsm --floatOtherPOI=1 --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60  -t -1 --expectSignal=1




Automatic prepare
====

    cd /afs/cern.ch/user/a/amassiro/work/Latinos/Limit/CMSSW_6_1_1/src/LimitCombine/

    cmsenv 
    
    sh HiggsWidth/test/prepare.sh

    sh HiggsWidth/test/prepare_7TeV.sh

    sh HiggsWidth/test/prepareWWandZZ.sh

    sh HiggsWidth/test/prepare_all_WW_unblind.sh

    sh HiggsWidth/test/prepare_all_WW_ZZ_unblind.sh

    sh HiggsWidth/test/limitForPaper.sh

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


    r99t higgsCombineTest.MultiDimFit.01j.7TeV.together.root           HiggsWidth/test/draw.cxx
    r99t higgsCombineTest.MultiDimFit.01j.7TeV.together.fixmu.root     HiggsWidth/test/draw.cxx


Comparison and combination:

    r99t higgsCombineTest.MultiDimFit.2j.root  LimitCombine/HiggsWidth/test/draw.cxx

    r99t   higgsCombineTest.MultiDimFit.0j.root \
           higgsCombineTest.MultiDimFit.1j.root \
           higgsCombineTest.MultiDimFit.2j.root \
           higgsCombineTest.MultiDimFit.012j.root \
           LimitCombine/HiggsWidth/test/drawCombined.cxx


compare combined (0+1)j and 0j + 1j

    r99t   higgsCombineTest.MultiDimFit.0j.root \
           higgsCombineTest.MultiDimFit.1j.root \
           higgsCombineTest.MultiDimFit.01j.root \
           higgsCombineTest.MultiDimFit.01j.together.root \
           HiggsWidth/test/drawCombined_combinationComparison.cxx






    r99t   higgsCombineTest.MultiDimFit.0j.fixmu.root \
           higgsCombineTest.MultiDimFit.1j.fixmu.root \
           higgsCombineTest.MultiDimFit.2j.fixmu.root \
           higgsCombineTest.MultiDimFit.012j.fixmu.root \
           LimitCombine/HiggsWidth/test/drawCombined.cxx


    cd /afs/cern.ch/user/a/amassiro/work/Latinos/Limit/CMSSW_6_1_1/src/LimitCombine/
    r99t   higgsCombineTest.MultiDimFit.0j.fixmu.root \
           higgsCombineTest.MultiDimFit.1j.fixmu.root \
           higgsCombineTest.MultiDimFit.2j.fixmu.root \
           higgsCombineTest.MultiDimFit.012j.fixmu.root \
           HiggsWidth/test/drawCombined.cxx

    mv cc.png Limit_muFix1_012jet.png

    
    r99t   Asimov.higgsCombineTest.MultiDimFit.0j.StandardModel.root \
           Asimov.higgsCombineTest.MultiDimFit.1j.StandardModel.root \
           Asimov.higgsCombineTest.MultiDimFit.2j.StandardModel.root \
           Asimov.higgsCombineTest.MultiDimFit.012j.StandardModel.root \
           HiggsWidth/test/drawCombined.cxx

    r99t   Observed.higgsCombineTest.MultiDimFit.0j.StandardModel.root \
           Observed.higgsCombineTest.MultiDimFit.1j.StandardModel.root \
           Observed.higgsCombineTest.MultiDimFit.2j.StandardModel.root \
           Observed.higgsCombineTest.MultiDimFit.012j.StandardModel.root \
           HiggsWidth/test/drawCombined.cxx
    
    r99t   Asimov.higgsCombineTest.MultiDimFit.0j.StandardModel.root \
           Observed.higgsCombineTest.MultiDimFit.0j.StandardModel.root \
           HiggsWidth/test/drawExpObs.cxx

    r99t   Asimov.higgsCombineTest.MultiDimFit.1j.StandardModel.root \
           Observed.higgsCombineTest.MultiDimFit.1j.StandardModel.root \
           HiggsWidth/test/drawExpObs.cxx
           
    r99t   Asimov.higgsCombineTest.MultiDimFit.2j.StandardModel.root \
           Observed.higgsCombineTest.MultiDimFit.2j.StandardModel.root \
           HiggsWidth/test/drawExpObs.cxx
           
           
                 
    - 7 and 8 TeV -
    
    r99t   Asimov.higgsCombineTest.MultiDimFit.012j.StandardModel-7TeV.root \
           Asimov.higgsCombineTest.MultiDimFit.012j.StandardModel.root \
           Asimov.higgsCombineTest.MultiDimFit.012j.StandardModel-7TeV-8TeV.root \
           HiggsWidth/test/drawCombined7and8TeV.cxx

    r99t   Observed.higgsCombineTest.MultiDimFit.012j.StandardModel-7TeV.root \
           Observed.higgsCombineTest.MultiDimFit.012j.StandardModel.root \
           Observed.higgsCombineTest.MultiDimFit.012j.StandardModel-7TeV-8TeV.root \
           HiggsWidth/test/drawCombined7and8TeV.cxx
           
    r99t   Asimov.higgsCombineTest.MultiDimFit.012j.StandardModel-7TeV.root \
           Asimov.higgsCombineTest.MultiDimFit.012j.StandardModel.root \
           Asimov.higgsCombineTest.MultiDimFit.012j.StandardModel-7TeV-8TeV.root \
           Observed.higgsCombineTest.MultiDimFit.012j.StandardModel-7TeV.root \
           Observed.higgsCombineTest.MultiDimFit.012j.StandardModel.root \
           Observed.higgsCombineTest.MultiDimFit.012j.StandardModel-7TeV-8TeV.root \
           HiggsWidth/test/drawCombined7and8TeV_unblind.cxx
           
           
           
    r99t   higgsCombineTest.MultiDimFit.0j.root \
           higgsCombineTest.MultiDimFit.1j.root \
           higgsCombineTest.MultiDimFit.2j.root \
           higgsCombineTest.MultiDimFit.012j.root \
           HiggsWidth/test/drawCombined.cxx

    r99t   Asimov.higgsCombineTest.MultiDimFit.0j.Gonly.root \
           Asimov.higgsCombineTest.MultiDimFit.1j.Gonly.root \
           Asimov.higgsCombineTest.MultiDimFit.2j.Gonly.root \
           Asimov.higgsCombineTest.MultiDimFit.012j.Gonly.root \
           HiggsWidth/test/drawCombined.cxx
           
    r99t   Observed.higgsCombineTest.MultiDimFit.0j.Gonly.root \
           Observed.higgsCombineTest.MultiDimFit.1j.Gonly.root \
           Observed.higgsCombineTest.MultiDimFit.2j.Gonly.root \
           Observed.higgsCombineTest.MultiDimFit.012j.Gonly.root \
           HiggsWidth/test/drawCombined.cxx
               
           
    mv cc.png Limit_muFloat_012jet.png

    r99t   Observed.higgsCombineTest.MultiDimFit.0j.root \
           Observed.higgsCombineTest.MultiDimFit.1j.root \
           Observed.higgsCombineTest.MultiDimFit.2j.root \
           Observed.higgsCombineTest.MultiDimFit.012j.root \
           HiggsWidth/test/drawCombined.cxx

    r99t   Observed.higgsCombineTest.MultiDimFit.0j.root \
           Observed.higgsCombineTest.MultiDimFit.1j.root \
           Observed.higgsCombineTest.MultiDimFit.012j.root \
           Observed.higgsCombineTest.MultiDimFit.01j.root \
           HiggsWidth/test/drawCombined.cxx
           
    r99t   beforePhantomWeight/higgsCombineTest.MultiDimFit.0j.root \
           beforePhantomWeight/higgsCombineTest.MultiDimFit.1j.root \
           beforePhantomWeight/higgsCombineTest.MultiDimFit.2j.root \
           beforePhantomWeight/higgsCombineTest.MultiDimFit.012j.root \
           HiggsWidth/test/drawCombined.cxx



    r99t   higgsCombineTest.MultiDimFit.0j.fixmu.root \
           higgsCombineTest.MultiDimFit.1j.fixmu.root \
           higgsCombineTest.MultiDimFit.01j.fixmu.root \
           HiggsWidth/test/drawCombined01.cxx

    mv cc01.png Limit_muFix1_01jet.png


    r99t   higgsCombineTest.MultiDimFit.0j.root \
           higgsCombineTest.MultiDimFit.1j.root \
           higgsCombineTest.MultiDimFit.01j.root \
           HiggsWidth/test/drawCombined01.cxx
           
    mv cc01.png Limit_muFloat_01jet.png

    r99t   Observed.higgsCombineTest.MultiDimFit.0j.root \
           Observed.higgsCombineTest.MultiDimFit.1j.root \
           Observed.higgsCombineTest.MultiDimFit.01j.root \
           HiggsWidth/test/drawCombined01.cxx

    r99t   higgsCombineTest.MultiDimFit.0j.fixmu.simple.root \
           higgsCombineTest.MultiDimFit.1j.fixmu.simple.root \
           higgsCombineTest.MultiDimFit.2j.fixmu.root \
           higgsCombineTest.MultiDimFit.012j.fixmu.simple.root \
           HiggsWidth/test/drawCombined.cxx

    r99t   higgsCombineTest.MultiDimFit.0j.simple.root \
           higgsCombineTest.MultiDimFit.1j.simple.root \
           higgsCombineTest.MultiDimFit.2j.root \
           higgsCombineTest.MultiDimFit.012j.simple.root \
           HiggsWidth/test/drawCombined.cxx

    mv cc.png Limit_Alternative_muFloat_012jet.png


    r99t   higgsCombineTest.MultiDimFit.0j.fixmu.simple.root \
           higgsCombineTest.MultiDimFit.1j.fixmu.simple.root \
           higgsCombineTest.MultiDimFit.01j.fixmu.simple.root \
           HiggsWidth/test/drawCombined01.cxx

    r99t   higgsCombineTest.MultiDimFit.0j.simple.root \
           higgsCombineTest.MultiDimFit.1j.simple.root \
           higgsCombineTest.MultiDimFit.01j.simple.root \
           HiggsWidth/test/drawCombined01.cxx

    mv cc01.png Limit_Alternative_muFloat_01jet.png


Compare variable mu

    r99t   higgsCombineTest.MultiDimFit.0j.fixmu.root \
           higgsCombineTest.MultiDimFit.1j.fixmu.root \
           higgsCombineTest.MultiDimFit.2j.fixmu.root \
           higgsCombineTest.MultiDimFit.012j.fixmu.root \
           higgsCombineTest.MultiDimFit.0j.fixmu.cms072.root \
           higgsCombineTest.MultiDimFit.1j.fixmu.cms072.root \
           higgsCombineTest.MultiDimFit.2j.fixmu.cms072.root \
           higgsCombineTest.MultiDimFit.012j.fixmu.cms072.root \
           higgsCombineTest.MultiDimFit.0j.fixmu.cms150.root \
           higgsCombineTest.MultiDimFit.1j.fixmu.cms150.root \
           higgsCombineTest.MultiDimFit.2j.fixmu.cms150.root \
           higgsCombineTest.MultiDimFit.012j.fixmu.cms150.root \
           HiggsWidth/test/drawCombinedVariableMu.cxx

    mv cc.png Limit_muFixDifferent_012jet.png



7 TeV

    r99t   higgsCombineTest.MultiDimFit.0j.7TeV.root \
           higgsCombineTest.MultiDimFit.1j.7TeV.root \
           higgsCombineTest.MultiDimFit.2j.7TeV.root \
           higgsCombineTest.MultiDimFit.012j.7TeV.root \
           HiggsWidth/test/drawCombined.cxx

    mv cc.png Limit_muFloat_012jet_7TeV.png
           
    r99t   Observed.higgsCombineTest.MultiDimFit.0j.7TeV.root \
           Observed.higgsCombineTest.MultiDimFit.1j.7TeV.root \
           Observed.higgsCombineTest.MultiDimFit.2j.7TeV.root \
           Observed.higgsCombineTest.MultiDimFit.012j.7TeV.root \
           HiggsWidth/test/drawCombined.cxx          

    r99t   Observed.higgsCombineTest.MultiDimFit.0j.root \
           Observed.higgsCombineTest.MultiDimFit.1j.root \
           Observed.higgsCombineTest.MultiDimFit.2j.root \
           Observed.higgsCombineTest.MultiDimFit.012j.root \
           HiggsWidth/test/drawCombined.cxx    
    
    r99t   Observed.higgsCombineTest.MultiDimFit.0j.simple.root \
           Observed.higgsCombineTest.MultiDimFit.1j.simple.root \
           Observed.higgsCombineTest.MultiDimFit.2j.root \
           Observed.higgsCombineTest.MultiDimFit.012j.simple.root \
           HiggsWidth/test/drawCombined.cxx

    r99t   Observed.higgsCombineTest.MultiDimFit.0j.root \
           Observed.higgsCombineTest.MultiDimFit.1j.root \
           Observed.higgsCombineTest.MultiDimFit.2j.root \
           Observed.higgsCombineTest.MultiDimFit.012j.root \
           HiggsWidth/test/drawCombined_RVRF.cxx


    r99t   Asimov.higgsCombineTest.MultiDimFit.0j.Gonly.root \
           Observed.higgsCombineTest.MultiDimFit.0j.Gonly.root \
           HiggsWidth/test/drawExpObs.cxx

    r99t   Asimov.higgsCombineTest.MultiDimFit.1j.Gonly.root \
           Observed.higgsCombineTest.MultiDimFit.1j.Gonly.root \
           HiggsWidth/test/drawExpObs.cxx

    r99t   Asimov.higgsCombineTest.MultiDimFit.2j.Gonly.root \
           Observed.higgsCombineTest.MultiDimFit.2j.Gonly.root \
           HiggsWidth/test/drawExpObs.cxx

    r99t   Asimov.higgsCombineTest.MultiDimFit.01j.Gonly.root \
           Observed.higgsCombineTest.MultiDimFit.01j.Gonly.root \
           HiggsWidth/test/drawExpObs.cxx
           
           
     r99t  Asimov.higgsCombineTest.MultiDimFit.0j.Gonly.root \
           Asimov.higgsCombineTest.MultiDimFit.1j.Gonly.root \
           Asimov.higgsCombineTest.MultiDimFit.2j.Gonly.root \
           Asimov.higgsCombineTest.MultiDimFit.012j.Gonly.root \
           HiggsWidth/test/drawCombined.cxx

     r99t  Observed.higgsCombineTest.MultiDimFit.0j.Gonly.root \
           Observed.higgsCombineTest.MultiDimFit.1j.Gonly.root \
           Observed.higgsCombineTest.MultiDimFit.2j.Gonly.root \
           Observed.higgsCombineTest.MultiDimFit.012j.Gonly.root \
           HiggsWidth/test/drawCombined.cxx
           
     r99t  Observed.higgsCombineTest.MultiDimFit.0j.Gonly.root \
           Observed.higgsCombineTest.MultiDimFit.1j.Gonly.root \
           Observed.higgsCombineTest.MultiDimFit.2j.Gonly.root \
           Observed.higgsCombineTest.MultiDimFit.01j.Gonly.root \
           HiggsWidth/test/drawCombined.cxx
                
     r99t  Asimov.higgsCombineTest.MultiDimFit.0j.Gonly.root \
           Asimov.higgsCombineTest.MultiDimFit.1j.Gonly.root \
           Asimov.higgsCombineTest.MultiDimFit.2j.Gonly.root \
           Asimov.higgsCombineTest.MultiDimFit.01j.Gonly.root \
           HiggsWidth/test/drawCombined.cxx
                
                
    r99t   higgsCombineTest.MultiDimFit.0j.root \
           higgsCombineTest.MultiDimFit.0j.asimov.toysFreq.root \
           HiggsWidth/test/drawExpObs.cxx

    r99t   higgsCombineTest.MultiDimFit.0j.root \
           higgsCombineTest.MultiDimFit.0j.toys.toysFreq.root \
           HiggsWidth/test/drawExpObs.cxx
           
    r99t   higgsCombineTest.MultiDimFit.0j.root \
           higgsCombineTest.MultiDimFit.0j.toys.noSyst.root \
           HiggsWidth/test/drawExpObs.cxx       
           
    r99t   higgsCombineTest.MultiDimFit.0j.root \
           Observed.higgsCombineTest.MultiDimFit.0j.root \
           HiggsWidth/test/drawExpObs.cxx

    r99t   higgsCombineTest.MultiDimFit.1j.root \
           Observed.higgsCombineTest.MultiDimFit.1j.root \
           HiggsWidth/test/drawExpObs.cxx

    r99t   higgsCombineTest.MultiDimFit.2j.root \
           Observed.higgsCombineTest.MultiDimFit.2j.root \
           HiggsWidth/test/drawExpObs.cxx

    r99t   higgsCombineTest.MultiDimFit.012j.root \
           Observed.higgsCombineTest.MultiDimFit.012j.root \
           HiggsWidth/test/drawExpObs.cxx

      
    r99t Observed.higgsCombineTest.MultiDimFit.0j.root  HiggsWidth/test/draw2D.cxx
    r99t Observed.higgsCombineTest.MultiDimFit.1j.root  HiggsWidth/test/draw2D.cxx
    r99t Observed.higgsCombineTest.MultiDimFit.2j.root  HiggsWidth/test/draw2D.cxx
    
    r99t higgsCombineTest.MultiDimFit.0j.root  HiggsWidth/test/draw2D.cxx
    r99t higgsCombineTest.MultiDimFit.1j.root  HiggsWidth/test/draw2D.cxx
    r99t higgsCombineTest.MultiDimFit.2j.root  HiggsWidth/test/draw2D.cxx

    r99t Observed.higgsCombineTest.MultiDimFit.0j.rv.rf.g.root  HiggsWidth/test/draw3D.cxx
    r99t Observed.higgsCombineTest.MultiDimFit.1j.rv.rf.g.root  HiggsWidth/test/draw3D.cxx
    r99t Observed.higgsCombineTest.MultiDimFit.2j.rv.rf.g.root  HiggsWidth/test/draw3D.cxx
    
    r99t higgsCombineTest.MultiDimFit.0j.rv.rf.g.root  HiggsWidth/test/draw3D.cxx
    r99t higgsCombineTest.MultiDimFit.1j.rv.rf.g.root  HiggsWidth/test/draw3D.cxx
    r99t higgsCombineTest.MultiDimFit.2j.rv.rf.g.root  HiggsWidth/test/draw3D.cxx

      
    - 7 TeV -       
           
    r99t   higgsCombineTest.MultiDimFit.0j.7TeV.root \
           Observed.higgsCombineTest.MultiDimFit.0j.7TeV.root \
           HiggsWidth/test/drawExpObs.cxx

    r99t   higgsCombineTest.MultiDimFit.1j.7TeV.root \
           Observed.higgsCombineTest.MultiDimFit.1j.7TeV.root \
           HiggsWidth/test/drawExpObs.cxx

    r99t   higgsCombineTest.MultiDimFit.2j.7TeV.root \
           Observed.higgsCombineTest.MultiDimFit.2j.7TeV.root \
           HiggsWidth/test/drawExpObs.cxx

    r99t   higgsCombineTest.MultiDimFit.012j.7TeV.root \
           Observed.higgsCombineTest.MultiDimFit.012j.7TeV.root \
           HiggsWidth/test/drawExpObs.cxx
           
    - 7 and 8 TeV -
    
    r99t   Observed.higgsCombineTest.MultiDimFit.012j.7TeV.root \
           Observed.higgsCombineTest.MultiDimFit.012j.root \
           Observed.higgsCombineTest.MultiDimFit.012j.7TeV.8TeV.root \
           HiggsWidth/test/drawCombined7and8TeV.cxx
       
        
    r99t   higgsCombineTest.MultiDimFit.0j.root \
           Observed.higgsCombineTest.MultiDimFit.0j.newnuisance.root \
           HiggsWidth/test/drawExpObs.cxx           

    r99t   higgsCombineTest.MultiDimFit.0j.root \
           Observed.higgsCombineTest.MultiDimFit.0j.root \
           HiggsWidth/test/drawExpObs.cxx

          
          
    combine -M MaxLikelihoodFit model_hwwlvlv_0j.root
    combine -M MaxLikelihoodFit model_hwwlvlv_1j.root
    combine -M MaxLikelihoodFit model_hwwlvlv_2j.root
    python diffNuisances.py -a  mlfit.root -g plots.root   -p CMS_zz4l_GGsm

    limit->Draw("2*deltaNLL:CMS_zz4l_GGsm:RF","deltaNLL<10");

WW fix
 
    cd /afs/cern.ch/user/a/amassiro/work/Latinos/Limit/CMSSW_6_1_1/src/LimitCombine/
    cmsenv
    
    scp amassiro@cmsneu.cern.ch:/home/amassiro/Latinos/Shape/playground/Hwidth/0jetDF8TeVWWfixed.tgz ./
    tar -xf 0jetDF8TeVWWfixed.tgz
    mv datacards/ datacards-0j-wwfix

    text2workspace.py -m 125.6 datacards-0j-wwfix/hww-19.36fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_0j_wwfix.root

    combine   -M MultiDimFit model_hwwlvlv_0j_wwfix.root  --algo=grid --points 2400  -m 125.6                        --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.0j.wwfix.root

    combine -M MultiDimFit model_hwwlvlv_0j_wwfix.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1 --saveToys                     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.0j.wwfix.root

    r99t   higgsCombineTest.MultiDimFit.0j.wwfix.root \
           Observed.higgsCombineTest.MultiDimFit.0j.wwfix.root \
           HiggsWidth/test/drawExpObs.cxx
     
    
7 + 8 TeV

    r99t   higgsCombineTest.MultiDimFit.012j.7TeV.root \
           higgsCombineTest.MultiDimFit.012j.root \
           higgsCombineTest.MultiDimFit.012j.7TeV.8TeV.root \
           HiggsWidth/test/drawCombined7and8TeV.cxx

    mv cc7and8TeV.png Limit_muFloat_012jet_7TeV_8TeV.png

    r99t   higgsCombineTest.MultiDimFit.012j.7TeV.root \
           higgsCombineTest.MultiDimFit.012j.root \
           higgsCombineTest.MultiDimFit.012j.7TeV.8TeV.root \
           Observed.higgsCombineTest.MultiDimFit.012j.7TeV.root \
           Observed.higgsCombineTest.MultiDimFit.012j.root \
           Observed.higgsCombineTest.MultiDimFit.012j.7TeV.8TeV.root \
           HiggsWidth/test/drawCombined7and8TeV_unblind.cxx

    mv cc7and8TeV.unblind.png Limit_muFloat_012jet_7TeV_8TeV_Observed.png
       
           
    r99t   Standard/higgsCombineTest.MultiDimFit.012j.7TeV.root \
           Standard/higgsCombineTest.MultiDimFit.012j.root \
           Standard/higgsCombineTest.MultiDimFit.012j.7TeV.8TeV.root \
           HiggsWidth/test/drawCombined7and8TeV.cxx
          

    r99t   sqrt/higgsCombineTest.MultiDimFit.012j.7TeV.root \
           sqrt/higgsCombineTest.MultiDimFit.012j.root \
           sqrt/higgsCombineTest.MultiDimFit.012j.7TeV.8TeV.root \
           HiggsWidth/test/drawCombined7and8TeV.cxx

    r99t   oneoverx/higgsCombineTest.MultiDimFit.012j.7TeV.root \
           oneoverx/higgsCombineTest.MultiDimFit.012j.root \
           oneoverx/higgsCombineTest.MultiDimFit.012j.7TeV.8TeV.root \
           HiggsWidth/test/drawCombined7and8TeV.cxx

Compare with and without cross-feed

    r99t   higgsCombineTest.MultiDimFit.012j.7TeV.8TeV.standard.root \
           higgsCombineTest.MultiDimFit.012j.7TeV.8TeV.root \
           HiggsWidth/test/drawCombinedWithAndWithoutCrossFeed.cxx

    r99t   HiggsWidth/test/drawCombinedWithAndWithoutCrossFeed.cxx
           
           
           
           
           
125 GeV to 125.6 GeV scaling
    
    weights['ggH'] = weights['ggH'] + '*1.035'
    weights['qqH'] = weights['qqH'] + '*1.041'


    
WW and ZZ
=====

    r99t   higgsCombineTest.MultiDimFit.hzz4l.root \
           higgsCombineTest.MultiDimFit.hzz2l2v.root \
           higgsCombineTest.MultiDimFit.hwwlvlv.root \
           higgsCombineTest.MultiDimFit.hwwlvlv.root \
           HiggsWidth/test/drawCombinedWWZZ.cxx

    r99t   higgsCombineTest.MultiDimFit.hwwlvlv.root \
           higgsCombineTest.MultiDimFit.hwwlvlv.root \
           higgsCombineTest.MultiDimFit.hwwlvlv.root \
           higgsCombineTest.MultiDimFit.hwwlvlv.root \
           HiggsWidth/test/drawCombinedWWZZ.cxx

    r99t   higgsCombineTest.MultiDimFit.hwwlvlv.root \
           higgsCombineTest.MultiDimFit.hzz2l2v.root \
           higgsCombineTest.MultiDimFit.hwwlvlv.root \
           higgsCombineTest.MultiDimFit.hwwlvlv.root \
           HiggsWidth/test/drawCombinedWWZZ.cxx           

    r99t   higgsCombineTest.MultiDimFit.hzz2l2v.root \
           higgsCombineTest.MultiDimFit.hzz2l2v.root \
           higgsCombineTest.MultiDimFit.hzz2l2v.root \
           higgsCombineTest.MultiDimFit.hzz2l2v.root \
           HiggsWidth/test/drawCombinedWWZZ.cxx           

    r99t   higgsCombineTest.MultiDimFit.hzz4l.root \
           higgsCombineTest.MultiDimFit.hzz4l.root \
           higgsCombineTest.MultiDimFit.hzz4l.root \
           higgsCombineTest.MultiDimFit.hzz4l.root \
           HiggsWidth/test/drawCombinedWWZZ.cxx           

           
           
           
Commit datacards to repository
====

where:

    /afs/cern.ch/user/a/amassiro/work/Latinos/Limit/datacards/HIG-14-032/125
    
copy:

    cd /afs/cern.ch/user/a/amassiro/work/Latinos/Limit/datacards/HIG-14-032/125
    cp /afs/cern.ch/user/a/amassiro/work/Latinos/Limit/CMSSW_6_1_1/src/LimitCombine/datacards-?j/hww-19.36fb.mH125.of_?j_shape.txt  ./
    cp /afs/cern.ch/user/a/amassiro/work/Latinos/Limit/CMSSW_6_1_1/src/LimitCombine/datacards-?j-7TeV/hww-4.94fb.mH125.of_?j_shape.txt  ./
    cp /afs/cern.ch/user/a/amassiro/work/Latinos/Limit/CMSSW_6_1_1/src/LimitCombine/datacards-?j/shapes/hww*.root  ./shapes/
    cp /afs/cern.ch/user/a/amassiro/work/Latinos/Limit/CMSSW_6_1_1/src/LimitCombine/datacards-?j-7TeV/shapes/hww*.root  ./shapes/

    
    