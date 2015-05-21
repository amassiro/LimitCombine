

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

