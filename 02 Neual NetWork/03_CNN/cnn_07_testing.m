%%%% TESTING %%%%
clear;clc;
load pathToImages
load trainedFlowerNetwork
flwrds = imageDatastore("C:\Users\romrobotics\Desktop\GitRepo\DB_for_matlab\flower_photos", "IncludeSubfolders", true,"LabelSource", "foldernames");
[trainImgs,testImgs] = splitEachLabel(flwrds,0.99);
resizeTestImgs = augmentedImageDatastore([224 224],testImgs);
flwrPreds = classify(flowernet,resizeTestImgs);

flwrActual = testImgs.Labels

% Use the nnz function and the equality operator (==) to count how many of 
% the predicted classifications (flwrPreds) match the correct classification (flwrActual). 
% Store the result in a variable called numCorrect.
numCorrect = nnz(flwrPreds == flwrActual)

test_images_count = size(flwrActual)
test_images_count = test_images_count(1:1)
fracCorrect = numCorrect/test_images_count;

confusionchart(flwrActual,flwrPreds);
%%%% ------------------------------------------------------------------------%%%%
