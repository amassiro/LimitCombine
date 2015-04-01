 

echo ">>>> RVRFfixed "

    
combine -M MultiDimFit model_hwwlvlv_01j_together_cv_cf_1.root  --algo=grid --points 120  -m 125.6    --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.01j.together.fixmu.root


combine -M MultiDimFit model_hwwlvlv_0j_cv_cf_1.root  --algo=grid --points 120  -m 125.6      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.0j.fixmu.root

combine -M MultiDimFit model_hwwlvlv_1j_cv_cf_1.root  --algo=grid --points 120  -m 125.6      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.1j.fixmu.root

combine -M MultiDimFit model_hwwlvlv_2j_cv_cf_1.root  --algo=grid --points 120  -m 125.6      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.2j.fixmu.root

combine -M MultiDimFit model_hwwlvlv_012j_cv_cf_1.root --algo=grid --points 120  -m 125.6      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40    --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.012j.fixmu.root

combine -M MultiDimFit model_hwwlvlv_01j_cv_cf_1.root --algo=grid --points 120  -m 125.6      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40    --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.01j.fixmu.root

    
echo ">>>> all floating"
    

# combine -M MultiDimFit model_hwwlvlv_0j.root  --algo=grid --points 120  -m 125.6        --expectSignal=1              --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40          --verbose -1

combine -M MultiDimFit model_hwwlvlv_01j_together.root  --algo=grid --points 120  -m 125.6                      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40          --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.01j.together.root

combine -M MultiDimFit model_hwwlvlv_0j.root  --algo=grid --points 120  -m 125.6                      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40          --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.0j.root

combine -M MultiDimFit model_hwwlvlv_1j.root  --algo=grid --points 120  -m 125.6                      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.1j.root

combine -M MultiDimFit model_hwwlvlv_2j.root  --algo=grid --points 120  -m 125.6                      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.2j.root

combine -M MultiDimFit model_hwwlvlv_012.root --algo=grid --points 120  -m 125.6                      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.012j.root

combine -M MultiDimFit model_hwwlvlv_01.root  --algo=grid --points 120  -m 125.6                      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.01j.root


    
    
    
    
    
    
    
    
echo " --- "
echo ">>>>  simple mth:mll "
echo " --- "

echo ">>>> RVRFfixed"


    
combine -M MultiDimFit model_hwwlvlv_0j_cv_cf_1_simple.root  --algo=grid --points 120  -m 125.6      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.0j.fixmu.simple.root

combine -M MultiDimFit model_hwwlvlv_1j_cv_cf_1_simple.root  --algo=grid --points 120  -m 125.6      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40     --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.1j.fixmu.simple.root

combine -M MultiDimFit model_hwwlvlv_012j_cv_cf_1_simple.root --algo=grid --points 120  -m 125.6      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40    --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.012j.fixmu.simple.root

combine -M MultiDimFit model_hwwlvlv_01j_cv_cf_1_simple.root --algo=grid --points 120  -m 125.6      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40    --setPhysicsModelParameters RV=1,RF=1,CMS_widthH_kbkg=1   --freezeNuisances RV,RF     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.01j.fixmu.simple.root

    
echo ">>>> all floating"
    

    
combine -M MultiDimFit model_hwwlvlv_0j_simple.root  --algo=grid --points 120  -m 125.6                      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40          --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.0j.simple.root

combine -M MultiDimFit model_hwwlvlv_1j_simple.root  --algo=grid --points 120  -m 125.6                      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.1j.simple.root

combine -M MultiDimFit model_hwwlvlv_012_simple.root --algo=grid --points 120  -m 125.6                      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.012j.simple.root

combine -M MultiDimFit model_hwwlvlv_01_simple.root  --algo=grid --points 120  -m 125.6                      --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40     --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.01j.simple.root
    
    
    
echo ">>>> and now combine with 7 TeV"

    
combine -M MultiDimFit model_hwwlvlv_0j_7TeV.root  --algo=grid --points 240  -m 125.6                     --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40          --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.0j.7TeV.root

combine -M MultiDimFit model_hwwlvlv_1j_7TeV.root  --algo=grid --points 240  -m 125.6                     --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40          --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.1j.7TeV.root

combine -M MultiDimFit model_hwwlvlv_2j_7TeV.root  --algo=grid --points 240  -m 125.6                     --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40          --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.2j.7TeV.root

combine -M MultiDimFit model_hwwlvlv_012j_7TeV.root  --algo=grid --points 240  -m 125.6                     --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40          --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.012j.7TeV.root

combine -M MultiDimFit model_hwwlvlv_012j_7TeV_8TeV.root  --algo=grid --points 240  -m 125.6                     --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,40          --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.012j.7TeV.8TeV.root




    
    
    
    
