%%%% DATASTORE %%%%
clear ; clc;
ls *.jpg

net = googlenet;

image_datastore = imageDatastore("file*.jpg");
fname = image_datastore.Files;

img = readimage(imds,7);

preds = classify(net,imds);

%% most of net use 220x220 pixels but i need various size images and gray scale images
%% so grayscale to color step, preprocesing steps require
%% so next lesson you will learn how to preprocess
%%%% ------------------------------------------------------------------------%%%%