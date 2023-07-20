%%%% googlenet %%%%
clear;clc;
deepnet = googlenet;
img1 = imread("001.jpg")

ly = deepnet.Layers;

input_layer = ly(1);

input_size = input_layer.InputSize;

output_layer = ly(144)

category_names = output_layer.Classes;

size(img1)
img = imresize(img1,input_size(1:2));

%% You have loaded the pretrained GoogLeNet network into MATLAB and examined its structure. 
%% It can predict the content of a 224-by-224 color image from 1000 possible categories.

[pred,scores] = classify(deepnet, img)

%% barchart
%bar(scores)

highscores = scores > 0.01;

bar(scores(highscores));

xticklabels(category_names(highscores));
%%%% ------------------------------------------------------------------------%%%%
