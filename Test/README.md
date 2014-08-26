Test instructions
============

Main instructions:

    https://twiki.cern.ch/twiki/bin/view/CMS/SWGuideHiggsAnalysisCombinedLimit#How_to_prepare_the_datacard
    
Install:

    git clone https://github.com/cms-analysis/HiggsAnalysis-CombinedLimit.git HiggsAnalysis/CombinedLimit
    scramv1 b -j 8
    export SCRAM_ARCH=slc5_amd64_gcc472 
    
prepare:

    rm HiggsAnalysis/CombinedLimit/interface/HiggsWidth.h
    rm HiggsAnalysis/CombinedLimit/src/HiggsWidth.cc
    
    cp LimitCombine/Models/HiggsWidth.py HiggsAnalysis/CombinedLimit/python/
    cp LimitCombine/Models/HiggsWidth.cc HiggsAnalysis/CombinedLimit/src/
    cp LimitCombine/Models/HiggsWidth.h  HiggsAnalysis/CombinedLimit/interface/

run:

    text2workspace.py -m 125.6 LimitCombine/Test/test_dc.txt -P HiggsAnalysis.CombinedLimit.HiggsWidth:HiggsWidth     --PO=muFloating -o floatMu_inter.root -v 7

    combine -M MultiDimFit floatMu_inter.root --algo=grid --points 100 -m 125.6 -n 1D_exp_inter_8TeV -t -1 --expectSignal=1 --saveToys -v 3

    
    
    cp LimitCombine/HiggsWidth/python/HiggsWidth.py   HiggsAnalysis/CombinedLimit/python/
    
                                                                <-  module           -> <- .py  -> <- class inside ->
    text2workspace.py -m 125.6 LimitCombine/Test/test_dc.txt -P LimitCombine.HiggsWidth.HiggsWidth:higgsWidth         --PO=muFloating -o floatMu_inter.root -v 7
    combine -M MultiDimFit floatMu_inter.root --algo=grid --points 100 -m 125.6 -n 1D_exp_inter_8TeV -t -1 --expectSignal=1 --saveToys -v 3
    
backup
====

where: 

    /afs/cern.ch/user/a/amassiro/work/Latinos/Limit/CMSSW_6_1_1/src
    
    
    
