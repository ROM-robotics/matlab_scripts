%%%% TRANSFER LEANING SCRIPT %%%%
clear; clc;
load pathToImages
flower_ds = imageDatastore("C:\Users\romrobotics\Desktop\GitRepo\DB_for_matlab\flower_photos", "IncludeSubfolders", true,"LabelSource", "foldernames");
[trainImgs,testImgs] = splitEachLabel(flower_ds,0.6);
resizeTrainImgs = augmentedImageDatastore([224 224],trainImgs);
resizeTestImgs = augmentedImageDatastore([224 224],testImgs);
numClasses = numel(categories(flower_ds.Labels));

load untrainedNetwork

opts = trainingOptions("sgdm","InitialLearnRate",0.001,"MaxEpochs",1,"VerboseFrequency",2);

[flowernet,info] = trainNetwork(resizeTrainImgs,lgraph,opts);

load pathToImages
load trainedFlowerNetwork flowernet info
plot(info.TrainingLoss);

dsflowers = imageDatastore(pathToImages,"IncludeSubfolders",true,"LabelSource","foldernames");
[trainImgs,testImgs] = splitEachLabel(dsflowers,0.99);
resizeTestImgs = augmentedImageDatastore([224 224],testImgs);

flwrPreds = classify(flowernet,resizeTestImgs);
%%%% ------------------------------------------------------------------------%%%%
