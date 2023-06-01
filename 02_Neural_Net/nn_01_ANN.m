%%%% ANN ( default hardlimit activiation function )
clear all;clc;
%{ 
%% 1 Creating a new perceptron with newp()
net = newp([0 1;-2 2],1);
%%view(net);
% default input weight = 0
net.IW(1,1);
% default Layer weight
net.LW;
% default bias
net.biases;
% Training
[net, tr] = train(net, P, T, Pi, Ai)
% Simulation
sim(net,X,Xi,Ai,T)
%}


%{ 
%% 2 AND gate perceptron
P = [0 0 1 1;
     0 1 0 1];
y = [0 0 0 1];

net = newp([0 1;0 1],1);
net = train(net, P,y);

%% After training , feed input data and simulate
y_hat = sim(net, P);
%}


%{ 
%% 3 Feedforward
% defalut 1 hidden with 10 neurons, 1 output
net = feedforwardnet();
net = feedforwardnet(8);
% 2 Hidden layers with 8 nodes and 3 nodes
net = feedforwardnet([8 3]);
view(net);
%}

%{ 
%% 4 Function with one variable
x = 0:0.05:2;
y = 1./((x-0.3).^2 + 0.1)  + 1./((x-0.9).^2+0.04) - 6;
%plot(x,y);
net = feedforwardnet([5 10]);
net.trainParam.goal = 0.001;
net1 = train(net,x,y);
A = sim(net1,x)
plot(x,y,x,A);
%}

%{  
%% 5 Function with two variable
x = -2:0.25:2;
y = -2:0.25:2;
[x1,y1] = meshgrid(x,y);
z = sin(x1).*cos(y1);
mesh(x,y,z);
P = [x;y];
T = z;
net = feedforwardnet([20 15]);
net.trainParam.goal = 0.0001;
net1 = train(net,P,T);
A = sim(net1,P);
%}

%{  %% 6 Function with multi variable
a = rand(1,100); b = rand(1,100); c = rand(1,100); d = rand(1,100);
y = 3.*a + 4.*a.*b + 2.*c + d;
P = [a;b;c;d]
T = y;
net = feedforwardnet([6 2]);
net.trainParam.goal = 0.0001;
net1 = train(net,P,T);
A = sim(net1,P);
%}
