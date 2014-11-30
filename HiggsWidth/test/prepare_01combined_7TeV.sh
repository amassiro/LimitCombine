

scp amassiro@cmsneu.cern.ch:/home/amassiro/Latinos/Shape/playground/Hwidth/01jetDF7TeVSimple.tgz ./
tar -xf 01jetDF7TeVSimple.tgz
rm -r datacards-01j-7TeV/; mv datacards/ datacards-01j-7TeV/




echo ">>>> RVRFfixed "

text2workspace.py -m 125.6 datacards-01j-7TeV/hww-4.94fb.mH125.of_01j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_01j_7TeV_together_cv_cf_1.root    


combine -M MultiDimFit model_hwwlvlv_01j_7TeV_together_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,120     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.01j.7TeV.together.fixmu.root

echo ">>>> all floating"

text2workspace.py -m 125.6 datacards-01j-7TeV/hww-4.94fb.mH125.of_01j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_01j_7TeV_together.root

combine -M MultiDimFit model_hwwlvlv_01j_7TeV_together.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,120          --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.01j.7TeV.together.root

