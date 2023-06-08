%%%% SIN() %%%%
clear;clc;
X = -1:0.05:1;
Y = sin(2*pi*X);
% plot(x,y);

net = feedforwardnet([9 6]);
[trained_net, tr] = train(net, X, Y);

y_hat = sim(trained_net, X);

figure(1);plot(X, Y,"-",X,y_hat,'-');
legend('actual','predict');
grid on;
%%%% ------------------------------------------------------------------------%%%%