    
echo ">>>> all floating"
       

combine  -M MultiDimFit model_hwwlvlv_01j_together.root  --algo=grid --points 240  -m 125.6       --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.01j.together.root

# combine   -M MultiDimFit model_hwwlvlv_0j.root  --algo=grid --points 240  -m 125.6                        --verbose -1
# mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.0j.root

combine   -M MultiDimFit model_hwwlvlv_0j.root  --algo=grid --points 2400  -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.0j.root

combine   -M MultiDimFit model_hwwlvlv_1j.root  --algo=grid --points 2400  -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.1j.root

combine   -M MultiDimFit model_hwwlvlv_2j.root  --algo=grid --points 2400  -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.2j.root

combine   -M MultiDimFit model_hwwlvlv_012.root --algo=grid --points 240  -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.012j.root

combine   -M MultiDimFit model_hwwlvlv_01.root  --algo=grid --points 240  -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.01j.root
 


    
echo ">>>> and now combine with 7 TeV"

    
combine -M MultiDimFit model_hwwlvlv_0j_7TeV.root  --algo=grid --points 240  -m 125.6                               --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.0j.7TeV.root

combine -M MultiDimFit model_hwwlvlv_1j_7TeV.root  --algo=grid --points 240  -m 125.6                               --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.1j.7TeV.root

combine -M MultiDimFit model_hwwlvlv_2j_7TeV.root  --algo=grid --points 240  -m 125.6                               --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.2j.7TeV.root

combine -M MultiDimFit model_hwwlvlv_012j_7TeV.root  --algo=grid --points 240  -m 125.6                               --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.012j.7TeV.root

combine -M MultiDimFit model_hwwlvlv_012j_7TeV_8TeV.root  --algo=grid --points 240  -m 125.6                               --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.012j.7TeV.8TeV.root




    
    
    
    
