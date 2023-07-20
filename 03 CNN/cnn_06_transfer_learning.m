%%%% TRANSFER LERANING %%%
clc;
%% transfer learning ( In matlab use --> Layers, data, options )


ds = imageDatastore("C:\Users\romrobotics\Desktop\GitRepo\DB_for_matlab\flower_photos", "IncludeSubfolders", true,"LabelSource", "foldernames");
flowernames = ds.Labels;

%% Train, Test split
%[flwrTrain,flwrTest] = splitEachLabel(ds,0.6);                     % by order
%[flwrTrain,flwrTest] = splitEachLabel(ds,0.8,"randomized");        % 80% from each label for training, random
[trainImgs,testImgs] = splitEachLabel(ds,500,"randomized");         % ( Due to Unbalance data ) take 500 photos from each label for Training, random

%% resize
resizeTrainImgs = augmentedImageDatastore([224 224],trainImgs);
resizeTestImgs = augmentedImageDatastore([224 224],testImgs);
numClasses = numel(categories(ds.Labels));

%% get google net and replace loss-3 layer ->   loss-3 [output 5 labels (flowers types) ], output layer --> classification layer
%deepNetworkDesigner

%% learning algo
%opts = trainingOptions("sgdm");
%opts = trainingOptions("sgdm","InitialLearnRate",0.001);
opts = trainingOptions("sgdm","InitialLearnRate",0.001,"MaxEpochs",1,"VerboseFrequency",2);

%% Train Network
[flowernet,info] = trainNetwork(resizeTrainImgs,lgraph_1,opts);

plot(info.TrainingLoss);

%% Test Network
[flower_predict, scores] = classify(flowernet,resizeTestImgs);
flower_Actual = testImgs.Labels

numCorrect = nnz(flower_predict == flower_Actual)

test_images_count = size(flower_Actual)
test_images_count = test_images_count(1:1)
fracCorrect = numCorrect/test_images_count;

confusionchart(flower_Actual,flower_predict);
exportNetworkToTensorFlow(flowernet,modelPackage)











