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