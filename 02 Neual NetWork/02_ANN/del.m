%%%% ANN ( default hardlimit activiation function ) %%%%
clear;clc;
%{ %% 1 Creating a new perceptron with newp()
net = newp([0 1;-2 2],1);
%%view(net);
% default input weight = 0
net.IW(1,1);
% default Layer weight
net.LW;
% default bias
net.biases;
% Training
[net, tr] = train(net, P, T, Pi, Ai)
% Simulation
sim(net,X,Xi,Ai,T)
%}


%{ %% 2 AND gate perceptron
P = [0 0 1 1;
     0 1 0 1];
y = [0 0 0 1];

net = newp([0 1;0 1],1);
net = train(net, P,y);

%% After training , feed input data and simulate
y_hat = sim(net, P);
%}


%{ %% 3 Feedforward
% defalut 1 hidden with 10 neurons, 1 output
net = feedforwardnet();
net = feedforwardnet(8);
% 2 Hidden layers with 8 nodes and 3 nodes
net = feedforwardnet([8 3]);
view(net);
%}

%{ %% 4 Function with one variable
x = 0:0.05:2;
y = 1./((x-0.3).^2 + 0.1)  + 1./((x-0.9).^2+0.04) - 6;
%plot(x,y);
net = feedforwardnet([5 10]);
net.trainParam.goal = 0.001;
net1 = train(net,x,y);
A = sim(net1,x)
plot(x,y,x,A);
%}

%{  %% 5 Function with two variable
x = -2:0.25:2;
y = -2:0.25:2;
[x1,y1] = meshgrid(x,y);
z = sin(x1).*cos(y1);
mesh(x,y,z);
P = [x;y];
T = z;
net = feedforwardnet([20 15]);
net.trainParam.goal = 0.0001;
net1 = train(net,P,T);
A = sim(net1,P);
%}

%{  %% 6 Function with multi variable
a = rand(1,100); b = rand(1,100); c = rand(1,100); d = rand(1,100);
y = 3.*a + 4.*a.*b + 2.*c + d;
P = [a;b;c;d]
T = y;
net = feedforwardnet([6 2]);
net.trainParam.goal = 0.0001;
net1 = train(net,P,T);
A = sim(net1,P);
%}
%%%% ------------------------------------------------------------------------%%%%
%%%% ODE  %%%%
clear; clc;
t,y = sim("nn_02_simulink.slx");

P = t';
T = t.tout;
T = T';
%{
net = feedforwardnet([7 4]);
trained_net = train(net, P, T);

A = sim(trained_net, P);
gensim(trained_net, 0.01);
%}
%%%% ------------------------------------------------------------------------%%%%
%%%% SIN() %%%%
clear;clc;
x = -1:0.05:1;
y = sin(2*pi*x);
% plot(x,y);

net = feedforwardnet([8 5]);
[trained_net, tr] = train(net,x,y);
y_hat = sim(trained_net, x);
figure(1);plot(x,y,"-",x,y_hat,'-');
legend('actual','predict');
grid on;
%%%% ------------------------------------------------------------------------%%%%
%%%% RBF for function approximation  %%%%
clear; clc;

X = -1:0.1:10;
Y = sin(X);
%plot(X,Y,'*r','MarkerSize',5,'LineWidth',2);

%% 1 rbf with 0 error
net = newrbe(X,Y);
% number of neurons
net.Layers(1).size
pred_1 = sim(net,X);
% rbf with custom error

%% 2 rbf with none-zero error
goal = 0.01; spread = 1;
net_ = newrb(X,Y,goal,spread);
% number of neurons
net_.Layers(1).size
pred_2 = sim(net_,X);
% rbf with custom error

plot(X,Y,"-",X,pred_1,'-',X,pred_2,"-");
legend('actual','predict_newrbe','predict_newrb');
grid on;
%%%% ------------------------------------------------------------------------%%%%
%%%% PID %%%%
clear; clc;
num = [1];
denominator_ = [1 3 1];

% create transfer function
Gp = tf(num, denominator_);
H = [1];

M = feedback(Gp,H);
step(M);

%%
Kp = 32
Ki = 15
Kd = 11

Gc = pid(Kp,Ki,Kd);

Mc = feedback(Gc*Gp,H);
step(Mc);
%%%% ------------------------------------------------------------------------%%%%
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
%%%% PREPROCESS %%%%
clear; clc;
%% resize individual image
sz = size(img);

net = googlenet;
ly = net.Layers;
input_layer = ly(1);
insz = input_layer.InputSize;
resize_img = resize(img,[224 224]);
imshow(resize_img);

%% resize image in datastore
net = googlenet;
imds = imageDatastore("*.jpg");
%% resize
auds = augmentedImageDatastore([224 224], imds);
preds = classify(net,auds);

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
%%%% TRANSFER LEANING SCRIPT %%%%
clear; clc;
load pathToImages
flower_ds = imageDatastore(pathToImages,"IncludeSubfolders",true,"LabelSource","foldernames");
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
%%%% TESTING %%%%
clear;clc;
load pathToImages
load trainedFlowerNetwork
flwrds = imageDatastore(pathToImages,"IncludeSubfolders",true,"LabelSource","foldernames");
[trainImgs,testImgs] = splitEachLabel(flwrds,0.99);
resizeTestImgs = augmentedImageDatastore([224 224],testImgs);
flwrPreds = classify(flowernet,resizeTestImgs);

flwrActual = testImgs.Labels
numCorrect = nnz(flwrPreds == flwrActual)

test_images_count = size(flwrActual)
test_images_count = test_images_count(1:1)
fracCorrect = numCorrect/test_images_count;

confusionchart(flwrActual,flwrPreds);
%%%% ------------------------------------------------------------------------%%%%