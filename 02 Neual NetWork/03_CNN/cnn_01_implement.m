%%%% CNN %%%%
clear; clc;
%% (convolution layer, pulling layer, c, p, ..) --> feature extractor 
%% (fully connected layer,..)                   --> classification
%% You need to know this functions              --> imageDatastore, layers, trainingOptions, trainNetwork

%% Layers
% image input layer         -> imageInputLayer(inputSize)
% convolutional layer       -> convolution2dLayer(filterSize, numFilters)
% ReLu Layer                -> reluLayer('Name',Name)
% Max Pooling Layer         -> maxPooling2dLayer(poolSize)
% Avg Pooling Layer         -> averagePooling2dLayer(poolSize)
% Batch Normalization Layer -> batchNormalizationLayer
% Fully Connected Layer     -> fullyConnectedLayer(outputSize)
% Softmax Layer             -> softmaxLayer('Name',Name)
% Classification Layer      -> clasificationLayer('Name',Name)
% Regression Layer          -> regressionLayer('Name',Name) 

%% CNN model for classification of flowers( daisy, dandelion, roses, sunflowers, tulips )

imds = imageDatastore('C:\Users\romrobotics\Desktop\GitRepo\DB_for_matlab','IncludeSubfolders',true,'LabelSource','foldernames');

[imdsTrain, imdsValidation] = splitEachLabel(imds,225,'randomized');

layers = [
    imageInputLayer([28 28 3])
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,32,"Padding","same")
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(5)
    softmaxLayer
    classificationLayer
];

options = trainingOptions('sgdm','ValidationData',imdsValidation,'Plots','training-progress');

net = trainNetwork(imdsTrain,layers,options);

% please classify

%%%% ------------------------------------------------------------------------%%%%