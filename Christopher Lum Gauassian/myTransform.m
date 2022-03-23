clear;close all;clc
%Draw 500 samples from a N(0,1) via randn
R = randn(1,500)

%Tranform this to arbitray gussian distribution
m = 0;
sigma = 1;

%Choose desire std and mean
mStr = -15.5;
sigmaStr = 3.5;

%Calculate a1 and a2
a1 = (-(sigmaStr/sigma)*m)+mStr;
a2 = sigmaStr/sigma;

%Perform transformation
RStr = a1 + a2*R

figure
subplot(2,1,1)
hist(R)
subplot(2,1,2)
hist(RStr)

%Compute actual mean and std
act_m = mean(RStr);
act_std = sqrt(var(RStr));
