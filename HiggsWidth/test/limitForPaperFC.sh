

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

python makeGridMultidimFitUsingCrab.py   model_hwwlvlv_012j-7TeV-8TeV.root  -o  gridScan1     --lsf   -j  10    -q  8nh
crab -create -cfg gridScan1.cfg
crab -submit -c crab_0_150602_174359
crab -status -c crab_0_150602_174359
bjobs

source /afs/cern.ch/cms/LCG/LCG-2/UI/cms_ui_env.sh
eval `scramv1 runtime -sh`
source /afs/cern.ch/cms/ccs/wm/scripts/Crab/crab.sh



