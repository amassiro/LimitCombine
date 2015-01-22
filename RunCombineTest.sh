
text2workspace.py -m 125.6 test.txt        -P LimitCombine.HiggsWidth.HiggsWidthStandalone:higgswidth  --PO=is2l2nu  -o    test.root

# text2workspace.py -m 125.6 test.txt        -o    test.root
combine -M MaxLikelihoodFit -t -1 --expectSignal 1  test.root

# python diffNuisances.py -a  mlfit.root -g plots.root   -p R
python diffNuisances.py -a  mlfit.root -g plots.root   -p CMS_zz4l_GGsm
# python diffNuisances.py -a  mlfit.root -g plots.root   -p RV
