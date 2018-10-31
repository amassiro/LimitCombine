

combine model_hwwlvlv_01j.root -M HybridNew --freq --testStat=PL --rule=CLsplusb

--singlePoint




combine model_hwwlvlv_01j.root -M HybridNew --freq --testStat=PL --rule=CLsplusb --singlePoint
mv higgsCombineTest.HybridNew.mH120.root   higgsCombineTest.HybridNew.01j_8TeV.FC.root




combine model_hwwlvlv_01j.root -M HybridNew --freq --testStat=PL --rule=CLsplusb 
mv higgsCombineTest.HybridNew.mH120.root   higgsCombineTest.HybridNew.01j_8TeV.FC.root





combine model_hwwlvlv_012j-7TeV-8TeV.root -M HybridNew --freq --testStat=PL --rule=CLsplusb 
mv higgsCombineTest.HybridNew.mH120.root   higgsCombineTest.HybridNew.012j_7TeV-8TeV.FC.root

combine model_hwwlvlv_012j.root -M HybridNew --freq --testStat=PL --rule=CLsplusb 
mv higgsCombineTest.HybridNew.mH120.root   higgsCombineTest.HybridNew.012j_8TeV.FC.root





combine model_hwwlvlv_012j-7TeV-8TeV.root -M FeldmanCousins
mv higgsCombineTest.HybridNew.mH120.root   higgsCombineTest.HybridNew.012j_7TeV-8TeV.FC.root



makeGridUsingCrab.py card.txt minimum maximum -n points [other options] -o name


python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     0     60     -n  100    -o test      --glidein

python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     0     60     -n  100    -o test      --lsf


python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     0     1     -n  2    -o testA      --lsf   -j 10   -q 1nd
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     1     2     -n  2    -o testB      --lsf   -j 10   -q 1nd
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     2     3     -n  2    -o testC      --lsf   -j 10   -q 1nd
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     3     4     -n  2    -o testD      --lsf   -j 10   -q 1nd
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     4     5     -n  2    -o testE      --lsf   -j 10   -q 1nd
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     5     6     -n  2    -o testF      --lsf   -j 10   -q 1nd
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     6     7     -n  2    -o testG      --lsf   -j 10   -q 1nd
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     7     8     -n  2    -o testH      --lsf   -j 10   -q 1nd
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     8     9     -n  2    -o testI      --lsf   -j 10   -q 1nd
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     9    10     -n  2    -o testL      --lsf   -j 10   -q 1nd


crab -create -cfg testA.cfg
crab -submit -c crab_0_150521_111627
crab -status -c crab_0_150521_111627

python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     0     1     -n  2    -o testA2nd      --lsf   -j 10   -q 2nd
crab -create -cfg testA2nd.cfg
crab -submit -c crab_0_150521_152106
crab -status -c crab_0_150521_152106
rm testA2nd_*.root
ls crab_0_150521_152106/res/out_files_*.tgz
ls crab_0_150521_152106/res/out_files_*.tgz | awk '{print "tar -xf "$1}'
-
hadd grid_7TeV-8TeV.root testA2nd_*.root

combine model_hwwlvlv_012j-7TeV-8TeV.root -M HybridNew --grid=grid_7TeV-8TeV.root --testStat=PL --rule=CLsplusb


python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     0     40     -n  40    -o testA2nd01jet7and8TeV      --lsf   -j 10   -q 2nd  -O "--testStat=PL --rule=CLsplusb"
crab -create -cfg testA2nd01jet7and8TeV.cfg
crab -submit -c crab_0_150525_103414
crab -status -c crab_0_150525_103414
rm testA2nd_*.root
ls crab_0_150525_103414/res/out_files_*.tgz
ls crab_0_150525_103414/res/out_files_*.tgz | awk '{print "tar -xf "$1}'

python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     0     40     -n  40    -o testA1nw01jet7and8TeV      --lsf   -j 10   -q 1nw  -O "--testStat=PL --rule=CLsplusb"
crab -create -cfg testA1nw01jet7and8TeV.cfg
crab -submit -c crab_0_150527_110856
crab -status -c crab_0_150527_110856
rm testA2nd_*.root
ls crab_0_150527_110856/res/out_files_*.tgz
ls crab_0_150527_110856/res/out_files_*.tgz | awk '{print "tar -xf "$1}'



python makeGridUsingCrab.py   model_hwwlvlv_01j.root     0     40     -n  40    -o testA2nd01jet8TeV      --lsf   -j 10   -q 2nd
crab -create -cfg testA2nd01jet8TeV.cfg
crab -submit -c crab_0_150521_152506
crab -status -c crab_0_150521_152506
ls crab_0_150521_152506/res/


python makeGridUsingCrab.py   model_hwwlvlv_01j.root     0     40     -n  40    -o testA2nd01jet8TeV      --lsf   -j 10   -q 2nd  -O "--testStat=PL --rule=CLsplusb"
crab -create -cfg testA2nd01jet8TeV.cfg
crab -submit -c crab_0_150522_094840
crab -status -c crab_0_150522_094840

crab_0_150522_094840/res/

--> 2nd ok timing!


combine model_hwwlvlv_012j-7TeV-8TeV.root -M HybridNew --grid=testA2nd_4_1_2Ir.root


python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     0     1     -n  2    -o test0      --lsf   -j 10
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     1     2     -n  2    -o test1      --lsf   -j 10
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     2     3     -n  2    -o test2      --lsf   -j 10
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     3     4     -n  2    -o test3      --lsf   -j 10
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     4     5     -n  2    -o test4      --lsf   -j 10
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     5     6     -n  2    -o test5      --lsf   -j 10
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     6     7     -n  2    -o test6      --lsf   -j 10
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     7     8     -n  2    -o test7      --lsf   -j 10
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     8     9     -n  2    -o test8      --lsf   -j 10
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root     9    10     -n  2    -o test9      --lsf   -j 10
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root    10    11     -n  2    -o test10     --lsf   -j 10
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root    11    12     -n  2    -o test11     --lsf   -j 10
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root    12    13     -n  2    -o test12     --lsf   -j 10
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root    13    14     -n  2    -o test13     --lsf   -j 10
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root    14    15     -n  2    -o test14     --lsf   -j 10
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root    15    16     -n  2    -o test15     --lsf   -j 10
python makeGridUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root    16    17     -n  2    -o test16     --lsf   -j 10

crab -create -cfg test0.cfg
crab -create -cfg test1.cfg
crab -create -cfg test2.cfg
crab -create -cfg test3.cfg
crab -create -cfg test4.cfg
crab -create -cfg test5.cfg
crab -create -cfg test6.cfg
crab -create -cfg test7.cfg
crab -create -cfg test8.cfg
crab -create -cfg test9.cfg
crab -create -cfg test10.cfg
crab -create -cfg test11.cfg
crab -create -cfg test12.cfg
crab -create -cfg test13.cfg
crab -create -cfg test14.cfg
crab -create -cfg test15.cfg
crab -create -cfg test16.cfg

ls -d crab_0_150521_*/ | awk '{print "crab -submit -c "$1}'
ls -d crab_0_150521_*/ | awk '{print "crab -status -c "$1}'




### toys as HWW tensor structure studies ###

cd /afs/cern.ch/user/a/amassiro/work/Latinos/Limit/CMSSW_6_1_1/src/LimitCombine/

combine -M MultiDimFit    model_hwwlvlv_012j-7TeV-8TeV.root  --algo=grid --points 200  -m 125.6   --toysNoSystematics    -t 100    -s 12345    -n Toys.higgsCombineTest.MultiDimFit.012j-7TeV-8TeV.seed0.root           --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,100               --verbose -1     
combine -M MultiDimFit    model_hwwlvlv_012j-7TeV-8TeV.root  --algo=grid --points 200  -m 125.6   --toysNoSystematics    -t 100    -s 12346    -n Toys.higgsCombineTest.MultiDimFit.012j-7TeV-8TeV.seed1.root           --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,100               --verbose -1     
combine -M MultiDimFit    model_hwwlvlv_012j-7TeV-8TeV.root  --algo=grid --points 200  -m 125.6   --toysNoSystematics    -t 100    -s 12347    -n Toys.higgsCombineTest.MultiDimFit.012j-7TeV-8TeV.seed2.root           --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,100               --verbose -1     
combine -M MultiDimFit    model_hwwlvlv_012j-7TeV-8TeV.root  --algo=grid --points 200  -m 125.6   --toysNoSystematics    -t 100    -s 12348    -n Toys.higgsCombineTest.MultiDimFit.012j-7TeV-8TeV.seed3.root           --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,100               --verbose -1     
combine -M MultiDimFit    model_hwwlvlv_012j-7TeV-8TeV.root  --algo=grid --points 200  -m 125.6   --toysNoSystematics    -t 100    -s 12349    -n Toys.higgsCombineTest.MultiDimFit.012j-7TeV-8TeV.seed4.root           --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,100               --verbose -1     
combine -M MultiDimFit    model_hwwlvlv_012j-7TeV-8TeV.root  --algo=grid --points 200  -m 125.6   --toysNoSystematics    -t 100    -s 12340    -n Toys.higgsCombineTest.MultiDimFit.012j-7TeV-8TeV.seed5.root           --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,100               --verbose -1     
combine -M MultiDimFit    model_hwwlvlv_012j-7TeV-8TeV.root  --algo=grid --points 200  -m 125.6   --toysNoSystematics    -t 100    -s 12341    -n Toys.higgsCombineTest.MultiDimFit.012j-7TeV-8TeV.seed6.root           --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,100               --verbose -1     
combine -M MultiDimFit    model_hwwlvlv_012j-7TeV-8TeV.root  --algo=grid --points 200  -m 125.6   --toysNoSystematics    -t 100    -s 12342    -n Toys.higgsCombineTest.MultiDimFit.012j-7TeV-8TeV.seed7.root           --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,100               --verbose -1     
combine -M MultiDimFit    model_hwwlvlv_012j-7TeV-8TeV.root  --algo=grid --points 200  -m 125.6   --toysNoSystematics    -t 100    -s 12343    -n Toys.higgsCombineTest.MultiDimFit.012j-7TeV-8TeV.seed8.root           --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,100               --verbose -1     
combine -M MultiDimFit    model_hwwlvlv_012j-7TeV-8TeV.root  --algo=grid --points 200  -m 125.6   --toysNoSystematics    -t 100    -s 12344    -n Toys.higgsCombineTest.MultiDimFit.012j-7TeV-8TeV.seed9.root           --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.000001,100               --verbose -1     








python makeGridMultidimFitUsingCrab.py   hwidth_hww_HiggsWidthLT.root          -o  hwidth_hww_HiggsWidthLT_scan          --options="--saveNLL --redefineSignalPOIs CMS_zz4l_GGsm --setPhysicsModelParameters RV=1,RF=1 --freezeNuisances CMS_zz4l_fai1,CMS_zz4l_bkgMELA           --floatOtherPOI=1  --expectSignal=1  --minimizerAlgo=Minuit --minimizerAlgoForMinos=Minuit --minimizerStrategy=1 --cminFallbackAlgo Minuit,1:0.001 --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.001,60 --points=60 --firstPoint 0 --lastPoint 60"     --lsf   -j  10    -q  2nd
python makeGridMultidimFitUsingCrab.py   hwidth_all_lt_HiggsWidthLT.root       -o  hwidth_all_lt_HiggsWidthLT_scan       --options="--saveNLL --redefineSignalPOIs CMS_zz4l_GGsm --setPhysicsModelParameters RV=1,RF=1 --freezeNuisances CMS_zz4l_fai1,CMS_zz4l_bkgMELA           --floatOtherPOI=1  --expectSignal=1  --minimizerAlgo=Minuit --minimizerAlgoForMinos=Minuit --minimizerStrategy=1 --cminFallbackAlgo Minuit,1:0.001 --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.001,60 --points=60 --firstPoint 0 --lastPoint 60"     --lsf   -j  10    -q  1nw
python makeGridMultidimFitUsingCrab.py   hwidth_hzz_lt_HiggsWidthLT.root       -o  hwidth_hzz_lt_HiggsWidthLT_scan       --options="--saveNLL --redefineSignalPOIs CMS_zz4l_GGsm --setPhysicsModelParameters RV=1,RF=1 --freezeNuisances CMS_zz4l_fai1,CMS_zz4l_bkgMELA           --floatOtherPOI=1  --expectSignal=1  --minimizerAlgo=Minuit --minimizerAlgoForMinos=Minuit --minimizerStrategy=1 --cminFallbackAlgo Minuit,1:0.001 --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.001,60 --points=60 --firstPoint 0 --lastPoint 60"     --lsf   -j  10    -q  1nw


source /afs/cern.ch/cms/ccs/wm/scripts/Crab/crab.sh

crab -create -cfg  hwidth_hww_HiggsWidthLT_scan.cfg
crab -create -cfg  hwidth_all_lt_HiggsWidthLT_scan.cfg
crab -create -cfg  hwidth_hzz_lt_HiggsWidthLT_scan.cfg

crab -submit -c crab_0_150727_110220
crab -submit -c crab_0_150727_110230
crab -submit -c crab_0_150727_110239


ls crab_0_150727_110220/res/out_files_*.tgz | awk '{print "tar -xf "$1}'
hadd hwidth_hww_HiggsWidthLT.scan.root hwidth_hww_HiggsWidthLT_scan_*.root

ls crab_0_150727_110230/res/out_files_*.tgz | awk '{print "tar -xf "$1}'
hadd hwidth_all_lt_HiggsWidthLT.scan.root hwidth_all_lt_HiggsWidthLT_scan_*.root

ls crab_0_150727_110239/res/out_files_*.tgz | awk '{print "tar -xf "$1}'
hadd hwidth_hzz_lt_HiggsWidthLT.scan.root hwidth_hzz_lt_HiggsWidthLT_scan_*.root




python makeGridMultidimFitUsingCrab.py   hwidth_hww_MuOffShellLT.root          -o  hwidth_hww_MuOffShellLT_scan          --options="--saveNLL --redefineSignalPOIs CMS_zz4l_GGsm --setPhysicsModelParameters RV=1,RF=1 --freezeNuisances CMS_zz4l_fai1,CMS_zz4l_bkgMELA           --floatOtherPOI=1  --expectSignal=1  --minimizerAlgo=Minuit --minimizerAlgoForMinos=Minuit --minimizerStrategy=1 --cminFallbackAlgo Minuit,1:0.001 --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.001,60 --points=60 --firstPoint 0 --lastPoint 5"     --lsf   -j  10    -q  2nd
python makeGridMultidimFitUsingCrab.py   hwidth_hww_HiggsWidthLT.root          -o  hwidth_hww_HiggsWidthLT_scan          --options="--saveNLL --redefineSignalPOIs CMS_zz4l_GGsm --setPhysicsModelParameters RV=1,RF=1 --freezeNuisances CMS_zz4l_fai1,CMS_zz4l_bkgMELA           --floatOtherPOI=1  --expectSignal=1  --minimizerAlgo=Minuit --minimizerAlgoForMinos=Minuit --minimizerStrategy=1 --cminFallbackAlgo Minuit,1:0.001 --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.001,60 --points=60 --firstPoint 0 --lastPoint 5"     --lsf   -j  10    -q  2nd
python makeGridMultidimFitUsingCrab.py   hwidth_hzz4l_lt_HiggsWidthLT.root     -o  hwidth_hzz4l_lt_HiggsWidthLT_scan     --options="--saveNLL --redefineSignalPOIs CMS_zz4l_GGsm --setPhysicsModelParameters RV=1,RF=1 --freezeNuisances CMS_zz4l_fai1,CMS_zz4l_bkgMELA,pdf_qqbar --floatOtherPOI=1  --expectSignal=1  --minimizerAlgo=Minuit --minimizerAlgoForMinos=Minuit --minimizerStrategy=1 --cminFallbackAlgo Minuit,1:0.001 --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.001,60 --points=60 --firstPoint 0 --lastPoint 5"     --lsf   -j  10    -q  2nd
python makeGridMultidimFitUsingCrab.py   hwidth_hzz2l2nu_lt_HiggsWidthLT.root  -o  hwidth_hzz2l2nu_lt_HiggsWidthLT_scan  --options="--saveNLL --redefineSignalPOIs CMS_zz4l_GGsm --setPhysicsModelParameters RV=1,RF=1 --freezeNuisances CMS_zz4l_fai1,CMS_zz4l_bkgMELA           --floatOtherPOI=1  --expectSignal=1  --minimizerAlgo=Minuit --minimizerAlgoForMinos=Minuit --minimizerStrategy=1 --cminFallbackAlgo Minuit,1:0.001 --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.001,60 --points=60 --firstPoint 0 --lastPoint 5"     --lsf   -j  10    -q  2nd
python makeGridMultidimFitUsingCrab.py   hwidth_hzz_lt_HiggsWidthLT.root       -o  hwidth_hzz_lt_HiggsWidthLT_scan       --options="--saveNLL --redefineSignalPOIs CMS_zz4l_GGsm --setPhysicsModelParameters RV=1,RF=1 --freezeNuisances CMS_zz4l_fai1,CMS_zz4l_bkgMELA           --floatOtherPOI=1  --expectSignal=1  --minimizerAlgo=Minuit --minimizerAlgoForMinos=Minuit --minimizerStrategy=1 --cminFallbackAlgo Minuit,1:0.001 --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.001,60 --points=60 --firstPoint 0 --lastPoint 5"     --lsf   -j  10    -q  2nd
python makeGridMultidimFitUsingCrab.py   hwidth_hzz_lt_MuOffShellLT.root       -o  hwidth_hzz_lt_MuOffShellLT_scan       --options="--saveNLL --redefineSignalPOIs CMS_zz4l_GGsm --setPhysicsModelParameters RV=1,RF=1 --freezeNuisances CMS_zz4l_fai1,CMS_zz4l_bkgMELA           --floatOtherPOI=1  --expectSignal=1  --minimizerAlgo=Minuit --minimizerAlgoForMinos=Minuit --minimizerStrategy=1 --cminFallbackAlgo Minuit,1:0.001 --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.001,60 --points=60 --firstPoint 0 --lastPoint 5"     --lsf   -j  10    -q  2nd
python makeGridMultidimFitUsingCrab.py   hwidth_hzz4l_lt_MuOffShellLT.root     -o  hwidth_hzz4l_lt_MuOffShellLT_scan     --options="--saveNLL --redefineSignalPOIs CMS_zz4l_GGsm --setPhysicsModelParameters RV=1,RF=1 --freezeNuisances CMS_zz4l_fai1,CMS_zz4l_bkgMELA,pdf_qqbar --floatOtherPOI=1  --expectSignal=1  --minimizerAlgo=Minuit --minimizerAlgoForMinos=Minuit --minimizerStrategy=1 --cminFallbackAlgo Minuit,1:0.001 --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.001,60 --points=60 --firstPoint 0 --lastPoint 5"     --lsf   -j  10    -q  2nd
python makeGridMultidimFitUsingCrab.py   hwidth_hzz2l2nu_lt_MuOffShellLT.root  -o  hwidth_hzz2l2nu_lt_MuOffShellLT_scan  --options="--saveNLL --redefineSignalPOIs CMS_zz4l_GGsm --setPhysicsModelParameters RV=1,RF=1 --freezeNuisances CMS_zz4l_fai1,CMS_zz4l_bkgMELA           --floatOtherPOI=1  --expectSignal=1  --minimizerAlgo=Minuit --minimizerAlgoForMinos=Minuit --minimizerStrategy=1 --cminFallbackAlgo Minuit,1:0.001 --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.001,60 --points=60 --firstPoint 0 --lastPoint 5"     --lsf   -j  10    -q  2nd
python makeGridMultidimFitUsingCrab.py   hwidth_all_lt_MuOffShellLT.root       -o  hwidth_all_lt_MuOffShellLT_scan       --options="--saveNLL --redefineSignalPOIs CMS_zz4l_GGsm --setPhysicsModelParameters RV=1,RF=1 --freezeNuisances CMS_zz4l_fai1,CMS_zz4l_bkgMELA           --floatOtherPOI=1  --expectSignal=1  --minimizerAlgo=Minuit --minimizerAlgoForMinos=Minuit --minimizerStrategy=1 --cminFallbackAlgo Minuit,1:0.001 --setPhysicsModelParameterRanges CMS_zz4l_GGsm=0.001,60 --points=60 --firstPoint 0 --lastPoint 5"     --lsf   -j  10    -q  2nd
 





hwidth_hww_MuOffShellLT.root
hwidth_hww_HiggsWidthLT.root
hwidth_hzz4l_lt_HiggsWidthLT.root
hwidth_hzz2l2nu_lt_HiggsWidthLT.root
hwidth_hzz_lt_HiggsWidthLT.root
hwidth_hzz_lt_MuOffShellLT.root
hwidth_hzz4l_lt_MuOffShellLT.root
hwidth_hzz2l2nu_lt_MuOffShellLT.root
hwidth_all_lt_HiggsWidthLT.root
hwidth_all_lt_MuOffShellLT.root




























python makeGridMultidimFitUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root  -o  gridScan1     --lsf   -j  10    -q  2nd
crab -create -cfg gridScan1.cfg
crab -submit -c crab_0_150602_174925  ---> 8nh, not enough
crab -status -c crab_0_150602_174925

crab -submit -c crab_0_150603_145536  ---> 2nd --> ok!
crab -status -c crab_0_150603_145536
bjobs


ls crab_0_150603_145536/res/out_files_*.tgz
ls crab_0_150603_145536/res/out_files_*.tgz | awk '{print "tar -xf "$1}'
-
hadd grid_7TeV-8TeV-toysScan.root gridScan1_*.root



python makeGridMultidimFitUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root  -o  gridScan2   --options="--setPhysicsModelParameters CMS_zz4l_GGsm=5  "  --lsf   -j  10    -q  2nd
crab -create -cfg gridScan2.cfg
crab -submit -c crab_0_150604_161832
crab -status -c crab_0_150604_161832
ls crab_0_150604_161832/res/out_files_*.tgz | awk '{print "tar -xf "$1}'




python makeGridMultidimFitUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root  -o  gridScan3   --options="--setPhysicsModelParameters CMS_zz4l_GGsm=10  "  --lsf   -j  10    -q  2nd
crab -create -cfg gridScan3.cfg
crab -submit -c crab_0_150604_162315
crab -status -c crab_0_150604_162315
ls crab_0_150604_162315/res/out_files_*.tgz | awk '{print "tar -xf "$1}'


python makeGridMultidimFitUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root  -o  gridScan4   --options="--setPhysicsModelParameters CMS_zz4l_GGsm=20  "  --lsf   -j  10    -q  2nd
crab -create -cfg gridScan4.cfg
crab -submit -c crab_0_150604_162902
crab -status -c crab_0_150604_162902
ls crab_0_150604_162902/res/out_files_*.tgz | awk '{print "tar -xf "$1}'






source /afs/cern.ch/cms/LCG/LCG-2/UI/cms_ui_env.sh
eval `scramv1 runtime -sh`
source /afs/cern.ch/cms/ccs/wm/scripts/Crab/crab.sh




