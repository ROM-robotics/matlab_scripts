%%%% ODE  %%%%
clear; clc;
a = sim('nn_02_simulink.slx',20);


a.plot;

%{
P = t';
T = t.tout;
T = T';
net = feedforwardnet([7 4]);
trained_net = train(net, P, T);

A = sim(trained_net, P);
gensim(trained_net, 0.01);
%}
%%%% ------------------------------------------------------------------------%%%%
