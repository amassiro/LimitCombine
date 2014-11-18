


combineCards.py   of0j=datacards-0j/hww-19.36fb.mH125.of_0j_shape.txt \
                  of1j=datacards-1j/hww-19.36fb.mH125.of_1j_shape.txt \
                  of2j=datacards-2j/hww-19.36fb.mH125.of_2j_shape.txt \
                  >   hwidth_012jet.txt

combineCards.py   of0j=datacards-0j/hww-19.36fb.mH125.of_0j_shape.txt \
                  of1j=datacards-1j/hww-19.36fb.mH125.of_1j_shape.txt \
                  >   hwidth_01jet.txt

echo ">>>> RVRFfixed to CMS values"

text2workspace.py -m 125.6 datacards-0j/hww-19.36fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_0j_cv_cf_1.root    
text2workspace.py -m 125.6 datacards-1j/hww-19.36fb.mH125.of_1j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_1j_cv_cf_1.root    
text2workspace.py -m 125.6 datacards-2j/hww-19.36fb.mH125.of_2j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_2j_cv_cf_1.root    
text2workspace.py -m 125.6 hwidth_012jet.txt                              -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_012j_cv_cf_1.root  
text2workspace.py -m 125.6 hwidth_01jet.txt                               -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_01j_cv_cf_1.root  


combine -M MultiDimFit model_hwwlvlv_0j_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --setPhysicsModelParameters RV=0.72,RF=0.72,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.0j.fixmu.cms072.root

combine -M MultiDimFit model_hwwlvlv_1j_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --setPhysicsModelParameters RV=0.72,RF=0.72,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.1j.fixmu.cms072.root

combine -M MultiDimFit model_hwwlvlv_2j_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --setPhysicsModelParameters RV=0.72,RF=0.72,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.2j.fixmu.cms072.root

combine -M MultiDimFit model_hwwlvlv_012j_cv_cf_1.root --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60    --setPhysicsModelParameters RV=0.72,RF=0.72,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.012j.fixmu.cms072.root

combine -M MultiDimFit model_hwwlvlv_01j_cv_cf_1.root --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60    --setPhysicsModelParameters RV=0.72,RF=0.72,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.01j.fixmu.cms072.root






combine -M MultiDimFit model_hwwlvlv_0j_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --setPhysicsModelParameters RV=1.50,RF=1.50,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.0j.fixmu.cms150.root

combine -M MultiDimFit model_hwwlvlv_1j_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --setPhysicsModelParameters RV=1.50,RF=1.50,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.1j.fixmu.cms150.root

combine -M MultiDimFit model_hwwlvlv_2j_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60     --setPhysicsModelParameters RV=1.50,RF=1.50,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.2j.fixmu.cms150.root

combine -M MultiDimFit model_hwwlvlv_012j_cv_cf_1.root --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60    --setPhysicsModelParameters RV=1.50,RF=1.50,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.012j.fixmu.cms150.root

combine -M MultiDimFit model_hwwlvlv_01j_cv_cf_1.root --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,60    --setPhysicsModelParameters RV=1.50,RF=1.50,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.01j.fixmu.cms150.root




