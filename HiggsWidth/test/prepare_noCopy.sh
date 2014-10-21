 


    combineCards.py   of0j=datacards-0j-Simple/hww-19.36fb.mH125.of_0j_shape.txt \
                      of1j=datacards-1j-Simple/hww-19.36fb.mH125.of_1j_shape.txt \
                      of2j=datacards-2j/hww-19.36fb.mH125.of_2j_shape.txt \
                      >   hwidth_012jet_simple.txt

    combineCards.py   of0j=datacards-0j-Simple/hww-19.36fb.mH125.of_0j_shape.txt \
                      of1j=datacards-1j-Simple/hww-19.36fb.mH125.of_1j_shape.txt \
                      >   hwidth_01jet_simple.txt





    combineCards.py   of0j=datacards-0j/hww-19.36fb.mH125.of_0j_shape.txt \
                      of1j=datacards-1j/hww-19.36fb.mH125.of_1j_shape.txt \
                      of2j=datacards-2j/hww-19.36fb.mH125.of_2j_shape.txt \
                      >   hwidth_012jet.txt

    combineCards.py   of0j=datacards-0j/hww-19.36fb.mH125.of_0j_shape.txt \
                      of1j=datacards-1j/hww-19.36fb.mH125.of_1j_shape.txt \
                      >   hwidth_01jet.txt

echo ">>>> RVRFfixed "

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

    
echo ">>>> all floating"
    

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
    
    
    
    
    
    
    
    
    
    
    
    
    
echo " --- "
echo ">>>>  simple mth:mll "
echo " --- "

echo ">>>> RVRFfixed"


   text2workspace.py -m 125.6 datacards-0j-Simple/hww-19.36fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_0j_cv_cf_1_simple.root    
    text2workspace.py -m 125.6 datacards-1j-Simple/hww-19.36fb.mH125.of_1j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_1j_cv_cf_1_simple.root    
    text2workspace.py -m 125.6 hwidth_012jet_simple.txt                              -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_012j_cv_cf_1_simple.root  
    text2workspace.py -m 125.6 hwidth_01jet_simple.txt                               -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_01j_cv_cf_1_simple.root  

    
    combine -M MultiDimFit model_hwwlvlv_0j_cv_cf_1_simple.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.0j.fixmu.simple.root
    
    combine -M MultiDimFit model_hwwlvlv_1j_cv_cf_1_simple.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.1j.fixmu.simple.root

    combine -M MultiDimFit model_hwwlvlv_012j_cv_cf_1_simple.root --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60    --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.012j.fixmu.simple.root

    combine -M MultiDimFit model_hwwlvlv_01j_cv_cf_1_simple.root --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60    --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.01j.fixmu.simple.root

    
echo ">>>> all floating"
    

    text2workspace.py -m 125.6 datacards-0j-Simple/hww-19.36fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_0j_simple.root
    text2workspace.py -m 125.6 datacards-1j-Simple/hww-19.36fb.mH125.of_1j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_1j_simple.root
    text2workspace.py -m 125.6 hwidth_012jet_simple.txt                              -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_012_simple.root
    text2workspace.py -m 125.6 hwidth_01jet_simple.txt                               -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_01_simple.root

    combine -M MultiDimFit model_hwwlvlv_0j_simple.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60          --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.0j.simple.root
    
    combine -M MultiDimFit model_hwwlvlv_1j_simple.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.1j.simple.root

    combine -M MultiDimFit model_hwwlvlv_012_simple.root --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.012j.simple.root
    
    combine -M MultiDimFit model_hwwlvlv_01_simple.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --verbose -1
    mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.01j.simple.root
    
    
    
    
    
    
    
    
