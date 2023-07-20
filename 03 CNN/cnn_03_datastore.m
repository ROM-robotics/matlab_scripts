%%%% DATASTORE %%%%
clear ; clc;
ls *.jpg

net = googlenet;
imds = imageDatastore("00*.jpg");
% Use the Files property of the datastore imds to extract the file names of the images. Store the result in a variable called fname.
fname = imds.Files;

% Use the readimage function to import the image in 002.jpg (the 2nd file in the datastore). Store the imported image in a variable called img.
img = readimage(imds,2);

imshow(img)
