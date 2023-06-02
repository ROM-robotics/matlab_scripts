clc; clear; close all;

N = 1e6;
x = -5:0.01:5;

%% %% main
f = @(x) (1/sqrt(2*pi)) * exp(-x.^2/2);
F = @(x) 1 - qfunc(x);

X = randn(1,N);

%% PDF
figure(1); subplot(1,2,1);

%% histogram of generated random numbers ( 200 represent number )
histogram( X, 200, 'Normalization', 'pdf');
hold on;

%% plot of theoretical PDF
plot(x, f(x), 'r-', 'Linewidth', 3);

%%legend('Simulated', 'Theoretical', 'Fontsize', FONTSIZE_LEGEND, 'Location', 'northeast');
legend('Simulated','Theoretical','Location', 'northwest');
title('PDF of standard Gauassian random variables');

%% CDF
figure(1); subplot(1,2,2);

%% histogram of generated random numbers ( 200 )
histogram( X, 200, 'Normalization', 'cdf');
hold on;

%% plot of theoretical CDF
plot(x, F(x), 'r-', 'Linewidth', 3);

legend('Simulated','Theoretical','Location', 'northeast');
title('CDF of standard Gauassian random variable');
