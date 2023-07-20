clear;clc;
net = googlenet;
ds = imageDatastore("C:\Users\romrobotics\Desktop\GitRepo\DB_for_matlab\flower_photos", "IncludeSubfolders", true)
ds = imageDatastore("C:\Users\romrobotics\Desktop\GitRepo\DB_for_matlab\flower_photos", "IncludeSubfolders", true,"LabelSource", "foldernames");
%flowernames = ds.Labels

resizeds = augmentedImageDatastore([224 224], ds)

preds = classify(net, resizeds)