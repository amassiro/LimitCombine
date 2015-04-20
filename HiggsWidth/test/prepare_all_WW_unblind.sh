    
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
 
 
 
text2workspace.py -m 125.6 datacards-0j/hww-19.36fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRVRFfixed  -o      model_hwwlvlv_0j.root
text2workspace.py -m 125.6 datacards-1j/hww-19.36fb.mH125.of_1j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRVRFfixed  -o      model_hwwlvlv_1j.root
text2workspace.py -m 125.6 datacards-2j/hww-19.36fb.mH125.of_2j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nuRVRFfixed  -o      model_hwwlvlv_2j.root
        
combine   -M MultiDimFit model_hwwlvlv_0j.root  --algo=grid --points 2400  -t -1 -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Asimov.higgsCombineTest.MultiDimFit.0j.RandG.root

combine   -M MultiDimFit model_hwwlvlv_1j.root  --algo=grid --points 2400  -t -1 -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Asimov.higgsCombineTest.MultiDimFit.1j.RandG.root

combine   -M MultiDimFit model_hwwlvlv_2j.root  --algo=grid --points 2400  -t -1 -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Asimov.higgsCombineTest.MultiDimFit.2j.RandG.root

combine   -M MultiDimFit model_hwwlvlv_0j.root  --algo=grid --points 2400  -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.0j.RandG.root

combine   -M MultiDimFit model_hwwlvlv_1j.root  --algo=grid --points 2400  -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.1j.RandG.root

combine   -M MultiDimFit model_hwwlvlv_2j.root  --algo=grid --points 2400  -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.2j.RandG.root





combineCards.py   of0j=datacards-0j/hww-19.36fb.mH125.of_0j_shape.txt \
                  of1j=datacards-1j/hww-19.36fb.mH125.of_1j_shape.txt \
                  of2j=datacards-2j/hww-19.36fb.mH125.of_2j_shape.txt \
                  >   hwidth_012jet.txt
 
text2workspace.py -m 125.6 datacards-0j/hww-19.36fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_0j.root
text2workspace.py -m 125.6 datacards-1j/hww-19.36fb.mH125.of_1j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_1j.root
text2workspace.py -m 125.6 datacards-2j/hww-19.36fb.mH125.of_2j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_2j.root
text2workspace.py -m 125.6 hwidth_012jet.txt                              -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o      model_hwwlvlv_012.root
  
combine   -M MultiDimFit model_hwwlvlv_0j.root  --algo=grid --points 240  -t -1 -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Asimov.higgsCombineTest.MultiDimFit.0j.Gonly.root

combine   -M MultiDimFit model_hwwlvlv_1j.root  --algo=grid --points 240  -t -1 -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Asimov.higgsCombineTest.MultiDimFit.1j.Gonly.root

combine   -M MultiDimFit model_hwwlvlv_2j.root  --algo=grid --points 240  -t -1 -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Asimov.higgsCombineTest.MultiDimFit.2j.Gonly.root

combine   -M MultiDimFit model_hwwlvlv_012.root --algo=grid --points 240  -t -1 -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Asimov.higgsCombineTest.MultiDimFit.012j.Gonly.root



combine   -M MultiDimFit model_hwwlvlv_0j.root  --algo=grid --points 240  -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.0j.Gonly.root

combine   -M MultiDimFit model_hwwlvlv_1j.root  --algo=grid --points 240  -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.1j.Gonly.root

combine   -M MultiDimFit model_hwwlvlv_2j.root  --algo=grid --points 240  -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.2j.Gonly.root

combine   -M MultiDimFit model_hwwlvlv_012.root --algo=grid --points 240  -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Observed.higgsCombineTest.MultiDimFit.012j.Gonly.root






 
 


 
 
combine   -M MultiDimFit model_hwwlvlv_0j.root  --algo=grid --points 2400  -t -1 -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Asimov.higgsCombineTest.MultiDimFit.0j.root

combine   -M MultiDimFit model_hwwlvlv_1j.root  --algo=grid --points 2400  -t -1 -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Asimov.higgsCombineTest.MultiDimFit.1j.root

combine   -M MultiDimFit model_hwwlvlv_2j.root  --algo=grid --points 2400  -t -1 -m 125.6                        --verbose -1
mv higgsCombineTest.MultiDimFit.mH125.6.root      Asimov.higgsCombineTest.MultiDimFit.2j.root




    
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




    
    
    
    
