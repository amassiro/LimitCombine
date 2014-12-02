

scp amassiro@cmsneu.cern.ch:/home/amassiro/Latinos/Shape/playground/Hwidth/?jetDF7TeVSimple.tgz ./
tar -xf 0jetDF7TeVSimple.tgz
rm -r datacards-0j-7TeV/; mv datacards/ datacards-0j-7TeV/
tar -xf 1jetDF7TeVSimple.tgz
rm -r datacards-1j-7TeV/; mv datacards/ datacards-1j-7TeV/
tar -xf 2jetDF7TeVSimple.tgz
rm -r datacards-2j-7TeV/; mv datacards/ datacards-2j-7TeV/


combineCards.py   of0j=datacards-0j-7TeV/hww-4.94fb.mH125.of_0j_shape.txt \
                  of1j=datacards-1j-7TeV/hww-4.94fb.mH125.of_1j_shape.txt \
                  of2j=datacards-2j-7TeV/hww-4.94fb.mH125.of_2j_shape.txt \
                  >   hwidth_012jet_7TeV.txt


combineCards.py   of0j7TeV=datacards-0j-7TeV/hww-4.94fb.mH125.of_0j_shape.txt \
                  of1j7TeV=datacards-1j-7TeV/hww-4.94fb.mH125.of_1j_shape.txt \
                  of2j7TeV=datacards-2j-7TeV/hww-4.94fb.mH125.of_2j_shape.txt \
                  of0j=datacards-0j/hww-19.36fb.mH125.of_0j_shape.txt \
                  of1j=datacards-1j/hww-19.36fb.mH125.of_1j_shape.txt \
                  of2j=datacards-2j/hww-19.36fb.mH125.of_2j_shape.txt \
                  >   hwidth_012jet_7TeV_8TeV.txt



echo ">>>> RVRFfixed "

text2workspace.py -m 125.6 datacards-0j-7TeV/hww-4.94fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_0j_7TeV_cv_cf_1.root
text2workspace.py -m 125.6 datacards-1j-7TeV/hww-4.94fb.mH125.of_1j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_1j_7TeV_cv_cf_1.root
text2workspace.py -m 125.6 datacards-2j-7TeV/hww-4.94fb.mH125.of_2j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_2j_7TeV_cv_cf_1.root
text2workspace.py -m 125.6 hwidth_012jet_7TeV.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_012j_7TeV_cv_cf_1.root
text2workspace.py -m 125.6 hwidth_012jet_7TeV_8TeV.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRandRVRFfixed  -o      model_hwwlvlv_012j_7TeV_8TeV_cv_cf_1.root


combine -M MultiDimFit model_hwwlvlv_0j_7TeV_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,120     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.0j.7TeV.fixmu.root

combine -M MultiDimFit model_hwwlvlv_1j_7TeV_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,120     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.1j.7TeV.fixmu.root

combine -M MultiDimFit model_hwwlvlv_2j_7TeV_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,120     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.2j.7TeV.fixmu.root

combine -M MultiDimFit model_hwwlvlv_012j_7TeV_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,120     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.012j.7TeV.fixmu.root

combine -M MultiDimFit model_hwwlvlv_012j_7TeV_8TeV_cv_cf_1.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1   --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,120     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      higgsCombineTest.MultiDimFit.012j.7TeV.8TeV.fixmu.root





echo ">>>> all floating"

text2workspace.py -m 125.6 datacards-0j-7TeV/hww-4.94fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_0j_7TeV.root
text2workspace.py -m 125.6 datacards-1j-7TeV/hww-4.94fb.mH125.of_1j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_1j_7TeV.root
text2workspace.py -m 125.6 datacards-2j-7TeV/hww-4.94fb.mH125.of_2j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_2j_7TeV.root
text2workspace.py -m 125.6 hwidth_012jet_7TeV.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_012j_7TeV.root
text2workspace.py -m 125.6 hwidth_012jet_7TeV_8TeV.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_012j_7TeV_8TeV.root

combine -M MultiDimFit model_hwwlvlv_0j_7TeV.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,120          --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.0j.7TeV.root

combine -M MultiDimFit model_hwwlvlv_1j_7TeV.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,120          --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.1j.7TeV.root

combine -M MultiDimFit model_hwwlvlv_2j_7TeV.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,120          --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.2j.7TeV.root

combine -M MultiDimFit model_hwwlvlv_012j_7TeV_8TeV.root  --algo=grid --points 120  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,120          --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.123456.root      higgsCombineTest.MultiDimFit.012j.7TeV.8TeV.root







