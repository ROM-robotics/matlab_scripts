%%%% PREPROCESS %%%%
clear; clc;
img = imread("002.jpg");
imshow(img)

%% resize individual image
sz = size(img);

net = googlenet;
ly = net.Layers;
insz = ly(1).InputSize;

resize_img = resize(img,[224 224]);
imshow(resize_img);
%-----------------------------------------------------------------------

%% resize image in datastore
net = googlenet;
imds = imageDatastore("*.jpg");

%% resize
auds = augmentedImageDatastore([224 224], imds);
preds = classify(net,auds);

%-----------------------------------------------------------------------

%% Preprocess color usin a datastore
%% display all images
montage(amds)

%% color preprocessing
auds = augmentedImageDatastore([224 224], imds,"ColorPreprocessing", "gray2rgb")
preds = classify(net,auds)

%% read sub folders
flwrds = imageDatastore("Flowers", "IncludeSubfolders",true);
%% resize ds
resizeds = augmentedImageDatastore([224 224],flwrds);
preds = classify(net, resizeds);
%%%% ------------------------------------------------------------------------%%%%