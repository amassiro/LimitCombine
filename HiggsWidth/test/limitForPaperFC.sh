

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


