%%%% TRANSFER LERANING %%%
clear;clc;
%% transfer learning ( In matlab use --> Layers, data, options )
load pathToImages
flwrds = imageDatastore(pathToImages,"IncludeSubfolders",true);
flowernames = flwrds.Labels %% empty list

flwrds = imageDatastore(pathToImages,"IncludeSubfolders",true,"LabelSource","foldernames");
flowernames = flwrds.Labels;

%% Train, Test split
[flwrTrain,flwrTest] = splitEachLabel(flwrds,0.6);
[flwrTrain,flwrTest] = splitEachLabel(flwrds,0.8,"randomized");

%% take 500 sample in each category
[flwrTrain,flwrTest] = splitEachLabel(flwrds,500);

%% get google net and replace loss-3 layer ->   loss-3 [output 5 labels (flowers types) ], output layer --> classification layer

%% learning algo
opts = trainingOptions("sgdm");
opts = trainingOptions("sgdm","InitialLearnRate",0.001);

%% Transfer learning Check List
%% 1 Network Layers
%% 2 Training Data
%% 3 Algo options
%%%% ------------------------------------------------------------------------%%%%


