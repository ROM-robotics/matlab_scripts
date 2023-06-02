clear; clc; close all;

% Setup matlab's random number generator to act determistically
rng('default');

% Define Our Triangle Distribution
a = 0; % lower limit
b = 1; % peak value
c = 10;% upper limit

mu = (a+b+c) /2;
sigma = sqrt( (a^2+b^2+c^2-a*b-a*c-b*c)/18 );  % find std of triangle distribution

% Define number of observations per sample
N = 400; % N = 4; 
% Define number of sample
M = 3000; % M = 3;

for m=1:M
    % Sample N times from Triangle Distribution
    pd = makedist('Triangular','a', a, 'b', b, 'c',c);
    X = random(pd, 1, N);
    
    if(m==1)
        figure
        hist(X,20)
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



