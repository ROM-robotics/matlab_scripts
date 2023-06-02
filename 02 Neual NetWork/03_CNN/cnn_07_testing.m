%%%% TESTING %%%%
clear;clc;
load pathToImages
load trainedFlowerNetwork
flwrds = imageDatastore(pathToImages,"IncludeSubfolders",true,"LabelSource","foldernames");
[trainImgs,testImgs] = splitEachLabel(flwrds,0.99);
resizeTestImgs = augmentedImageDatastore([224 224],testImgs);
flwrPreds = classify(flowernet,resizeTestImgs);

flwrActual = testImgs.Labels
numCorrect = nnz(flwrPreds == flwrActual)

test_images_count = size(flwrActual)
test_images_count = test_images_count(1:1)
fracCorrect = numCorrect/test_images_count;

confusionchart(flwrActual,flwrPreds);
%%%% ------------------------------------------------------------------------%%%%
