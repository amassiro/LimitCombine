Example
====

Prepare and run:

    cp LimitCombine/HiggsWidth/python/HiggsWidth.py   HiggsAnalysis/CombinedLimit/python/
    
                                                                <-  module           -> <- .py  -> <- class inside ->
    text2workspace.py -m 125.6 LimitCombine/Test/test_dc.txt -P LimitCombine.HiggsWidth.HiggsWidth:higgsWidth         --PO=muFloating -o floatMu_inter.root -v 7
    combine -M MultiDimFit floatMu_inter.root --algo=grid --points 100 -m 125.6 -n 1D_exp_inter_8TeV -t -1 --expectSignal=1 --saveToys -v 3

    
    
    text2workspace.py -m 125.6 LimitCombine/Test/test_dc_2.txt -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth         --PO=is2l2nu     -o floatMu_inter.root
    combine -M MultiDimFit floatMu_inter.root --algo=grid --points 100 -V -t -1 --expectSignal=1 --saveToys 

    
    
    cp LimitCombine/HiggsWidth/python/HiggsWidthStandalone.py   HiggsAnalysis/CombinedLimit/python/
    text2workspace.py -m 125.6 LimitCombine/Test/test_dc_2.txt -P HiggsAnalysis.CombinedLimit.HiggsWidthStandalone:higgswidth         --PO=is2l2nu     -o floatMu_inter.root
    combine -M MultiDimFit floatMu_inter.root --algo=grid --points 100 -V -t -1 --expectSignal=1 --saveToys 
