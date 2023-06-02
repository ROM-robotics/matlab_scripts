%%%% RBF for function approximation  %%%%
clear; clc;

X = -1:0.1:10;
Y = sin(X);
%plot(X,Y,'*r','MarkerSize',5,'LineWidth',2);

%% 1 rbf with 0 error
net = newrbe(X,Y);
% number of neurons
net.Layers(1).size
pred_1 = sim(net,X);
% rbf with custom error

%% 2 rbf with none-zero error
goal = 0.01; spread = 1;
net_ = newrb(X,Y,goal,spread);
% number of neurons
net_.Layers(1).size
pred_2 = sim(net_,X);
% rbf with custom error

plot(X,Y,"-",X,pred_1,'-',X,pred_2,"-");
legend('actual','predict_newrbe','predict_newrb');
grid on;
%%%% ------------------------------------------------------------------------%%%%