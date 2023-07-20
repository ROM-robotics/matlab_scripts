%%%% CAM DETECT %%%%
clear; clc;
%% Take a shot
net = googlenet;
cam = webcam;
preview(cam);
img=snapshot(cam);
inputSize = net.Layers(1).InputSize(1:2);

% while true
while true
    pic = cam.snapshot;
    pic = imresize(pic, [227,227]);
    label = classify(nnet, pic);

    image(pic);
    title(char(label));
    drawnow;
end

%%%% ------------------------------------------------------------------------%%%%