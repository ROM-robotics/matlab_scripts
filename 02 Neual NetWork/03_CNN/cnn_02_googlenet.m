%%%% googlene %%%%
clear;clc;
deenet = googlenet;
img1 = imread("blabla.jpg")

pred = classify(deepnet, img1)

ly = deepnet.Layers;

input_layer = ly(1);

input_size = input_layer.InputSize;

output_layer = ly(144)

category_name = output_layer.Classes;

%% You have loaded the pretrained GoogLeNet network into MATLAB and examined its structure. 
%% It can predict the content of a 224-by-224 color image from 1000 possible categories.

[pred,scores] = classify(net, img)

%% barchart
bar(scores)

highscores = scores > 0.01;

bar(scores(highscores));

xticklabels(categorynames(highscores));
%%%% ------------------------------------------------------------------------%%%%
