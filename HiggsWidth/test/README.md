Example
====

Prepare and run:

    cp LimitCombine/HiggsWidth/python/HiggsWidth.py   HiggsAnalysis/CombinedLimit/python/
    
                                                                <-  module           -> <- .py  -> <- class inside ->
    text2workspace.py -m 125.6 LimitCombine/Test/test_dc.txt -P LimitCombine.HiggsWidth.HiggsWidth:higgsWidth         --PO=muFloating -o floatMu_inter.root -v 7
    combine -M MultiDimFit floatMu_inter.root --algo=grid --points 100 -m 125.6 -n 1D_exp_inter_8TeV -t -1 --expectSignal=1 --saveToys -v 3

    
    
    text2workspace.py -m 125.6 LimitCombine/Test/test_dc_2.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth         --PO=is2l2nu     -o floatMu_inter.root
    combine -M MultiDimFit floatMu_inter.root --algo=grid --points 100 -V -t -1 --expectSignal=1 --saveToys 

    scp amassiro@cmsneu.cern.ch:/home/amassiro/Latinos/Shape/playground/Hwidth/0jetDF8TeV.tgz ./
    tar -xf 0jetDF8TeV.tgz
    text2workspace.py -m 125.6 datacards/hww-19.47fb.mH125.of_0j_shape.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth     --PO=is2l2nu     -o      model_hwwlvlv.root
    combine -M MultiDimFit model_hwwlvlv.root --algo=grid --points 200  -m 125.6                          --saveToys  -n Obs_nLL_scan --setPhysicsModelParameterRanges CMS_ww2l2v_GGsm=0.000001,100
    combine -M MultiDimFit model_hwwlvlv.root --algo=grid --points 200  -m 125.6   -t -1 --expectSignal=1 --saveToys                  --setPhysicsModelParameterRanges CMS_ww2l2v_GGsm=0.000001,100
 

    
    cp LimitCombine/HiggsWidth/python/HiggsWidthStandalone.py   HiggsAnalysis/CombinedLimit/python/
    text2workspace.py -m 125.6 LimitCombine/Test/test_dc_2.txt -P HiggsAnalysis.CombinedLimit.HiggsWidthStandalone:higgswidth         --PO=is2l2nu     -o floatMu_inter.root
    combine -M MultiDimFit floatMu_inter.root --algo=grid --points 100 -V -t -1 --expectSignal=1 --saveToys 

    
    
Plot
====

    r99t higgsCombineTest.MultiDimFit.mH120.123456.root  LimitCombine/HiggsWidth/test/draw.cxx
    
    r99t higgsCombineTest.MultiDimFit.mH125.6.123456.root  LimitCombine/HiggsWidth/test/draw.cxx
    

