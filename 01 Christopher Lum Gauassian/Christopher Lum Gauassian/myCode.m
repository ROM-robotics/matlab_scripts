clear; clc; close all;
load('HeadingData');

% Plot the data
figure
plot(t, psi, 'LineWidth', 2);
xlabel('time (sec)');
ylabel('\psi (radians)');
grid on

% Compute the mean and variance of the sigal
m = mean(psi);
sigma = sqrt(var(psi));

% Does a guassian distribution describe this signal accurate
x = linspace(min(psi), max(psi),100);
fx = ( 1/(sigma * sqrt(2*pi)) ) * exp(-0.5 * ( (x-m)/sigma ).^2);

% Plot the gaussian
figure
plot(x, fx, 'LineWidth', 2);
title('Gauassian calculated from the distribution of \psi');
xlabel('\psi (radians)');
ylabel('f(x)');
grid on;

% Verify that the integral of the Gauassian is 1
% Integrate fx by x
% trapz is integrate function
area = trapz(x, fx);

% Plot a histogram of ps
bins = linspace(min(psi), max(psi), 20);
figure
hist(psi, bins);
grid on

% Calculate a scaling factor alpha, to allow the gauassian to be overlaid
% with the histogram
[N,X] = hist(psi, bins);

alpha = max(N) / max(fx);

% Plot the gauassian and histogram
figure
hist(psi, bins);
hold on;
plot(x, alpha*fx, 'r--', 'LineWidth', 2);













