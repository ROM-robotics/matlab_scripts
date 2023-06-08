%%%% ODE  %%%%
clear; clc;
a = sim('nn_03_ode.slx',20);
b = a.logsout;
c = a.tout;
d = b{2}.Values.Data;

X = c';
Y = d';
% plot(X,Y);

net = feedforwardnet([7 4]);
trained_net = train(net, X, Y);
predict_y = sim(trained_net, X);

gensim(trained_net, 0.01);  % generate model


%%%% ------------------------------------------------------------------------%%%%
