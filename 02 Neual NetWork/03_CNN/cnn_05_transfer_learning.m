%%%% TRANSFER LERANING %%%
clear;clc;
%% transfer learning ( In matlab use --> Layers, data, options )
load pathToImages
ds = imageDatastore("C:\Users\romrobotics\Desktop\GitRepo\DB_for_matlab\flower_photos", "IncludeSubfolders", true,"LabelSource", "foldernames");
flowernames = ds.Labels;

%% Train, Test split
%[flwrTrain,flwrTest] = splitEachLabel(ds,0.6);  % by order
%[flwrTrain,flwrTest] = splitEachLabel(ds,0.8,"randomized"); % 80% from each label for training, random
[flwrTrain,flwrTest] = splitEachLabel(flwrds,500,"randomized"); % ( Due to Unbalance data ) take 500 photos from each label for Training, random

%% get google net and replace loss-3 layer ->   loss-3 [output 5 labels (flowers types) ], output layer --> classification layer

%% learning algo
opts = trainingOptions("sgdm");
opts = trainingOptions("sgdm","InitialLearnRate",0.001);

%% Transfer learning Check List
%% 1 Network Layers
%% 2 Training Data
%% 3 Algo options
%%%% ------------------------------------------------------------------------%%%%


