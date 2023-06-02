clear; clc; close all;

% Setup matlab's random number generator to act determistically
rng('default');

% Define Our uniform Distribution
a = 2;
b = 5;
mu = (a+b) /2;
sigma = sqrt( 1/12 * (a-b)^2 );  % find std of uniform distribution

% Define number of observations per sample
N = 400; % N = 4; 
% Define number of sample
M = 3000; % M = 3;

for m=1:M
    % Sample N times from Uniform Distribution
    % random will generated from a to b with N number of quantity. This is custom function wrote by Christopher Lum.
    X = rand2(a,b,N);
    
    if(m==1)
        figure
        hist(X)
    end
    % Compute Sample mean
    Sn = mean(X);
    
    % Save the Sample mean
    SN_data(m) = Sn;
end

figure
hist(SN_data);

figure
bins = 20;
hist(SN_data, bins);

% Compute actual data of SN_data
actual_mu = mean(SN_data);
actual_sigma = sqrt(var(SN_data));

% Sigma expected theoretically 
expected_sigma = sigma / sqrt(N);



